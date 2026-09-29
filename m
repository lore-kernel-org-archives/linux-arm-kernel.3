Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C005CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9UFah7dL2mNY2meqJf4W09SVFZ5MUi1IU/9ko/DymA=; b=EVu0198Jkj9VWWwairav/NuHAp
	KWUmX4Iq10LgJ76lX/5m9+a1W3D4cgwDo+a2EXYXjzhM8LPSe+jFIsSFctT5Wy9t1+HEXWy7aSeMF
	g7riUmxESB/g7gRzevlXj06UyB6OIGy3RMvOcoNRK9b4779td+hZ1YNb6HC9HVsYc8iZW1qB0EkAb
	X3LK0GU4ILCxRKyr/tfHpRBcQ6lG26ParwVFn1QjryXnZyxxqlVYlwrpx+TSfRWtvEjFTa0khU/4+
	i/0Q/FdBlawyTxie7Ew5ATexpAJryRgFy3983TYccds/Ly1ACkCv7cqsAw5HNlgvnNRfLOOGcJj6D
	/JW2jMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYIx-00000003jFE-0DS5;
	Tue, 29 Sep 2026 13:55:35 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYIu-00000003jEb-1Kvp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:55:33 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso936855a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790690130; x=1791294930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9UFah7dL2mNY2meqJf4W09SVFZ5MUi1IU/9ko/DymA=;
        b=cYPzlSaz/DOuHY3VTMPzo0PKuKak9eBC3yjIsXLEg9wGWWUzd8nLVuiZ6lbxff4gn0
         TjzAraC6YZ9UGOOM4Li4/pnVj1P5zjCCsSpuospPzBHHm84v2v/p/tFRLjTSV/BhkuqU
         aSNBSaeMZcBcr7/MQ4Az6tseJw41AIghrtcj0xG+CFX1Z16nGSg1EwdJVM8oa2Bc5O+J
         IfZelE1ieOyBN/Gk4XqYtdYYMBFmqBYkXCkhlGs5LscBSer8pMtuVQG2TM8KgWcbgFoy
         r/ArW8iWyfNgzP7YTXdxLcB3bjITCLJowCrJBNPtirtD6VIiOODqEYaaVK8bf2mxlpZQ
         FiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690130; x=1791294930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9UFah7dL2mNY2meqJf4W09SVFZ5MUi1IU/9ko/DymA=;
        b=jeqEpok+z9XSsYR4hkzXKpyj44D53dVnrGaf4Tzzr01aFEEFdy3n6+7Wu6W8wwDQPh
         VBcfG14e9+fduI1rUcJO9vot7ErI3BBoSkmziDS8kxSLJf6Hpce+rMq0MvdMCmxQvkKT
         C3Ds5UqYqODTqE01vKPLiVHWtnU3LXOEFkmMwN7JCoI60eVJMM2xz3Qwv2ShdqUl/e8G
         Vha2Enr8IgpaRMWIvt6+X9IWQqjJ/5A0jlac7Ctdr29H+XxEpYvla30duSNwsjbh6zdG
         xLdXdZsRQ87TB2OwGIMxcymGjoRQOwQtbyBRLpunUMX7kbWzi9OYyX33rM8N/uXT+tiV
         SLtg==
X-Forwarded-Encrypted: i=1; AKwUvBwJpGqaLkzgcUYL/c8RLuRp/p8xiwC8aJuAQm4COUxe77oeh44PUEuBV2m6KtU9Ovx6QCV0Kf34cBgY8Eh+F0Bb@lists.infradead.org
X-Gm-Message-State: AFuF++lP6p4EQejoBq3mR6Fo/GZHU5R/jq7aU4Ekg0Fo8vqX2OPOnKCj
	TILNVNFUCfCH5jMtw947vWRZlwMelv5OeWelylgou+UXYsVTEWoPUWb91A+oym7lpRI=
X-Gm-Gg: AYBFou1H6APq9RrmSFROPqUjcbFda0MH0PtZZWui0KaLwpL9ejhSEr08eGbIQq8pRDi
	oirZo6yGktZqXe1ulQvtejYc2lXu4INg3o8nmf8288Q4otPM0fL7rtqhoaPqFnguRss+tDWnCzD
	f7WMczNHleTWV6DRbjOMm2Ovt+JqF1Y6/ONBq8d9vOEcJmUfqvW/qOUzJHND1zvp4b4+4S69Pk3
	tLUv0JXGHdLmnl2T7tcVlN0nL2TBO+VKbekKV1I8GXPOiqgMp7Xa/nEq0PN/7yhcOXoigDyVlrr
	XVO4OPJDipxhfe/aQ2phUNMf+covUokwHNFvC87j/h+tKK/WixoQ07hjwA7SZy/pJVJZstYtKsZ
	AE/xyhDB5zY/MMUR+ZsKpz5bO0CmqZnR2Ac5uPUyDVED5MfUdZ9dDrHQQTYL2sJv1KPiHNuMoQi
	jPQF/CBDUi3kJNU6ayUtdFXLLCFHW3ObkBXMTg4l6H3g9nt8iXlyI0DqFK2KwI5J7a2zoWAHmL6
	vI3HCq5JAIhaw==
X-Received: by 2002:a17:907:a28f:b0:c26:2ff1:cac2 with SMTP id a640c23a62f3a-c2ae9f31dedmr1035004766b.31.1790690130146;
        Tue, 29 Sep 2026 06:55:30 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9057b4csm872836a12.33.2026.09.29.06.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:55:29 -0700 (PDT)
Message-ID: <3852b153-9be1-4ab4-803e-cb8a6de34879@linaro.org>
Date: Tue, 29 Sep 2026 14:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] perf cs-etm: Use the recorded instruction size
 for A32 and A64
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-5-6ab8c07a5455@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-5-6ab8c07a5455@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_065532_396073_2B1CB4DC 
X-CRM114-Status: GOOD (  18.78  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 23/09/2026 16:21, Leo Yan wrote:
> Use packet->last_instr_size in cs_etm__instr_size() instead of a
> hard-coded value, allowing the decoder to supply the instruction size.
> 
> Keep per-address decoding for T32. A range can mix 16-bit and 32-bit
> instructions, so last_instr_size describes only the final instruction
> and cannot determine the size at an arbitrary address in the range.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 2d1ab34f7b6b5a6331005c16c6a418d123c815eb..0163d93ac2d537a2190536e77d24628b4d707751 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1358,8 +1358,7 @@ static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
>   	if (packet->isa == CS_ETM_ISA_T32)
>   		return cs_etm__t32_instr_size(etmq, tidq, packet, addr);
>   
> -	/* Otherwise, 4-byte instruction size for A32/A64 */
> -	return 4;
> +	return packet->last_instr_size;

Why not use last_instr_size for CS_ETM_ISA_T32 too? I'm wondering how 
and when this change actually makes a difference? last_instr_size isn't 
any better than '4' for any instruction in the range other than the last 
one, so it's not clear what the issue is.

>   }
>   
>   static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
> 


