Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF3CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=; b=VsRBwdvJR24wscqwpJ66hctvNM
	/RG//v3WGSCpHFRayXSmou5wqCgikTY1gcyayx6DU1wbNENIE8FQJeW7x1eIpnkvj46G643Rcsl8B
	nT86CeZB/olPV+TBYKJiHvL+Ss+roNaOqZHA0LDrebataKufElTlpRW6X9F5ualxXvR6EacTQcCEI
	EvngaQ2wav6lq99BO3lw3YmQxrM+9zcCKIbo0QggGHiIaMEOhi0mfQrOl2o1stxOq4pTH6TEDAlIq
	Gq1vSnAmnRSFvIX7gxJHKrFBLydpbtCVKpUtx3Bc8R7nE4S8Jw4Dn7JmKKLylpp2EISC2ji0WplDo
	OeFc185A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi1I-000000032yU-05Ve;
	Fri, 16 Oct 2026 13:30:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi1F-000000032xw-2Qya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:30:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so55880155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157443; x=1792762243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=c92+hLagXKvTnbqWPKgmae+Tz56I1EhzI0rc7Oh4De2FShnQ2c638bsA1IfwdWYy0C
         2GBFsZnC+K+7X4EBsMyPJAVEpandce/LgVDrxS0h9+04OzolEeqTmd8U716Rh75ALN7w
         hbMRERiKzYy3ybqVQSogEeD4uLZCvG8dgZMGE79bPhXzNImgisgxXrxQBYj9O+MIOBUh
         ZPra7vAy2oJP640a40futRwtCchrEwzniWODmrYLqSi0e+Pl/3DfVVd/g2ldBPq2Qd6D
         wwh2oGGRV4El8lJW9zLdcQXX5S0Ob3/c9ddMoE3ltGFhPm+ypxr87xa5ngqEZhPyQqEM
         seIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157443; x=1792762243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=wqEdcibhIsZQLkFJeeK9Lq3TnD1weZvqFE1f9vMLz7G0ctxICUcMBSUC2nV0UlD+8Z
         4pJX0B2uQFrydBG+3BJTw64olEkxy+H2UWlYeoB9sx/7m+MIjInvoDkHmX+tqw8KHV6d
         bJruSzp94s6CkGBz11rhgzsAL8uzMPNlaSr9tnm5vyqQZOB296BF4g8jac165CwZfXX2
         A8w2eo+EFb4odydgSLg321fqQqhPMy9LPdzTv88qTp9TZVzJJF8b2zp8Dh8a0t8fscV8
         EKX9Fvw5cmQJW2WN1ID9Aja6n1QyRTFBroDxF8l75xyNMDroBaFpuSmhpZGMis2UZecf
         I8wg==
X-Forwarded-Encrypted: i=1; AKwUvBwt7W2ZCKqhjnS63ESB+w2KpELbczLIfOGPysxAifOuc+LTDEDk8XQ1ybReU7MkNpLk0S5wzIlRKSJdidS8+uDM@lists.infradead.org
X-Gm-Message-State: AFq9FYIgNrQ6YSIFC/tb9sCY4NM1Nj86WHKqNdIJH6J0I/DUywWWF1wM
	D/1L4vygEXGasg5a68LRlxwt+U0Fd81PT74SxAf3d+igmcEGgC+gOKDjWL2zYHqogKE=
X-Gm-Gg: AYBFou3qW4CF//HUhKMmschwpKJt1Bthem4n3UHtpBWvNpWoOm15/tHtYTy0mi1W7Go
	1nf/SLYqkoPF+5T923ptHKh8/0B+C1wv8qds8z59YW7sAcQCNa3OKgdYbNBZe9v1aKtj33wejQd
	zz4z+r2ayIAiIBgXq7ohEgITvLsO2iWaaxJOd6GCMzn5iXie8E8e9e2LdyekKNgKG2InH/aSjWW
	ykKTmu3Ji9qSGH2ps7SFXDGpj2BtoUaRMhvVr9ZuC6jVhMyphI0n7LWJSyuWChUDIGmI43nDEDR
	5Nlnve2+XMsnalgKU8lBErknNdY2Z3hhXlmngj/YVaOl4sinaPgvLKStjupGNLQmboBCtuQmrt+
	8NCW5FBmZ7QMTi+26qnXpG+eZ1vr68joia2novTad5kgCvxj1fJFFG1UlQi2w/WRGYkAL8h52hO
	E/zEt9ZsbzVdZfpE1lLSxOfGzj6zD+FZ6uHcoSgucCtzUNUOAUX5zLbX4ZNz/fWDGjeDfjnc0xH
	x/eusy0ZqBacmGa6Ouky1LyXcP9UR5eK3eBVmQ1QBVyNHXn/uozTjr1RWsqCoJfaEPDQs+WZBJK
	m6ceTw==
X-Received: by 2002:a05:600c:83c7:b0:4a1:d456:dda9 with SMTP id 5b1f17b1804b1-4a1d456e0a2mr15854635e9.9.1792157443112;
        Fri, 16 Oct 2026 06:30:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm60109555e9.6.2026.10.16.06.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:30:42 -0700 (PDT)
Message-ID: <ad5f5981-7133-431e-ac8d-8ac064a97f02@linaro.org>
Date: Fri, 16 Oct 2026 14:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/25] perf/core: Export output copy helpers for CoreSight
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_063045_643506_4B7FC922 
X-CRM114-Status: GOOD (  14.03  )
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



On 15/09/2026 16:48, Leo Yan wrote:
> CoreSight AUX sampling needs perf_output_copy_aux() to copy trace data
> into samples and perf_output_copy() to prepend zero bytes when the
> available trace is shorter than the requested snapshot.
> 
> Export both helpers so the CoreSight snapshot_aux() callback can use
> them when CONFIG_CORESIGHT=m.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/ring_buffer.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 1b1ffe0533e58a9d976d0eb0fc23e09d5936da2b..e69ea5b077a5e94b5b6bb1f4c6f0ca5b8a94a6cc 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -298,6 +298,7 @@ unsigned int perf_output_copy(struct perf_output_handle *handle,
>   {
>   	return __output_copy(handle, buf, len);
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy);
>   
>   unsigned int perf_output_skip(struct perf_output_handle *handle,
>   			      unsigned int len)
> @@ -617,6 +618,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
>   
>   	return len;
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy_aux);
>   
>   #define PERF_AUX_GFP	(GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY)
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>


