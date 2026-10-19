Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D419CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=; b=PQIt/tmUPDyr/vQlLpWduvLKSO
	g4LyYtVxFsje7zokI0/DNwC+7X7RO1LiyfnWous2QPIW5dREydJbFTXuJSh+YHC4cJ3FnK1gknveq
	3/y6bStBWHppJaJ+UQCUdo286dZHkegdu/ARls7JM1GkB2CZVWUJ0HTKG9kZll9ywcIECeG5XH7hJ
	HVhG87+6C1CJf65oZ5cK5mMxxXWQ8o+eDARe7vjL4CAhdPPJvSpvzgEisnrWDYaj7Mv0qI3Uh1Wjx
	iHfgdLrfq0BoUMI0xwJtAKFQYEUH3PSmotTmqgs7P/3WzFJyYGeHlmELDD5XOhyyBtv9AOxbYwZ09
	loyA+1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjlx-000000071SG-2jt4;
	Mon, 19 Oct 2026 09:35:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjlw-000000071RS-0x5Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:35:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df54150dfso1380881f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402510; x=1793007310; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=s9UD5DEnmtNwPMy5oDNou+9uzmUAMgV9YXdmHDpn9nkdw4mRZRYAKKi3P/G1fjwRng
         DOaQhVi/aCrqVImOWuKa0twjdwzVbsbLBiw6IuPDxB9tVyGFdT3XikFr2tbloPAOGNkq
         a0rb4JTUZYsIJxDzabFkeqX/UDEiajTSxcHF3gRVqBIIQSJSOyJxZM0CP0M7V5ydP3b3
         M9zdEaK1NnjqBzjLg90+pyFUg3fS/DXbWQVNSD2lwgnOI3/vVtRNKfs6dW28lnwbF3l6
         fLO1S5a53uEBfF9rhYMuFT4GxZTzvB+ruUTZK90Sd2KH/yjcJM78ieiGo9Qf74baSufr
         5LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402510; x=1793007310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=BLPmkSBVRl8KPgfb2Og10YP3mrtAjYLwunfFUC1N2iXzCJUOJhxEWzhQaFsgSn2cNl
         WEYRzd3WnI+x0JPD0QSTXXuOZjia5/SymyYYszYLkB2LJwe3kBgECnsKfTEuns8XHwTU
         Z/Bq7bDrEVwKFDyKl9xYBQwbXIym5dEvN8o8lh8DfvLEicza/ongQbQslQdEh3c0xp4W
         3e9C+fNLU10eNSvhJB6WSyOxb9XsapEjAuS7QhAz+vlpBMgAdDktKEzgJXehlyNnXw51
         e+iJp++kV1NqdyQAEtWnRv54LX8eOk4kSynqQEJouMBWP6g2ClLiQ+0doYMvgiKiCmTY
         pEcw==
X-Forwarded-Encrypted: i=1; AKwUvBxC2P0RV8AzxZ+S5nNg87gZQwVbdw6PQ6qqJTMf1I1v5fDPOmPc+inTA81oWKRTtQoGSUBLm/esk6F0NKTLsw2e@lists.infradead.org
X-Gm-Message-State: AFq9FYJAopNqofcVvvHk+1h0ZfYFOuHMKGp+DIxI3yhpJ5STWzbGB+Hz
	aJC7wCM625Vt+yFANxeKN0nItXr6qB0a5cpHwAJduai4g7vYNxgrh/iskc4c+MBKUYg=
X-Gm-Gg: AYBFou15swQQ5QWSAZjL1fBW/RjPe2JrhBjIzK5BVfRSGGcmk4X8avuNzKJoPzN0b/X
	cBFUv06CH9eP04Nv9DPZj1b46cCOw8Rum51yx2xncfrL3JOvPZM1PEL0w2oiGUwO7jgnFdhl8XG
	fKDnTGCLTUeR0c3ewV/+eyIRnA+n7mv1due98GtxsbMe+bwSbzS9s8b/Hd3xigPqD0w8Q3wY0qg
	9D9Dl1zwIPZkdtRWxVOEdZXo5FIiLci6V+BoX8suxVKPTp3LaoalVAD4PkZc0KAXISOR2YjqzrS
	8IeS6Wr3cSh6Enn7LI5Vd7oxLkGoM0xRv1MQGOmFtyKGmMhclFLBes1BFkMvtvkGAyDH2ke3f18
	WwjIHRIA8rQspp1XTtajoSnOU/5dnou1sExYJGdWV8+nx++zVCEpNndGVxslVwaGI0bHZiq28bW
	NBmfdeQuSaq6INB4ovqu97QlRvRMmoom9B87KyI15J2HyBdYW+lSLhFXloYzAICnTpbJErNFbRI
	XsK
X-Received: by 2002:a05:6000:4b1a:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e07fa2f48mr12167246f8f.51.1792402510355;
        Mon, 19 Oct 2026 02:35:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm18752727f8f.3.2026.10.19.02.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:35:09 -0700 (PDT)
Message-ID: <296f398a-a351-4290-80e5-d18427a88dac@linaro.org>
Date: Mon, 19 Oct 2026 10:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] coresight: perf: Improve hardware state transitions
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
 <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_023512_301121_057350C4 
X-CRM114-Status: GOOD (  13.96  )
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
> Keep hw.state consistent with event activation and AUX buffer updates.
> Initialize events as stopped and up to date, clear both flags after a
> successful start, and set UPTODATE after committing an AUX buffer
> update. On resume, clear UPTODATE only on success. Preserve state on
> resume failure and ignore duplicate stops.
> 
> Add helpers for setting and clearing state bits. Use READ_ONCE() and
> WRITE_ONCE() to prevent compiler merging or refetching of state
> accesses.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   	return *etm_event_cpu_path_ptr(data, cpu);
>   }
>   
> +static inline void etm_event_set_hw_state(struct perf_event *event, int mask)

Extremely minor nit, but inline does nothing here.


