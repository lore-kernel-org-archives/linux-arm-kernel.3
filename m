Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3AFCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=; b=jV61HEG67rkZiNlktLc0h1sa66
	rUfqScq00diYH3rkVYzKGpuXg7h/xjjfS/rQdw1VpetN4jQULQFGUGk0spp/QnXZv9lKS7rB1Ck79
	PgZlZG3xhT+/j1/lpIhGfsb/rHvGvXL8KA7CKa4Jogwl+td0WM2Kbmae24fLin5wkNGfjWNC4Aknb
	cWGyAgEAQWb2mFv1+z5zccpiHrLxWg2y+HoK4vCXnvwvojVdNAc4ElybuR4e/sVNyHlHshmjV2gLf
	syKT9E6rRMDVTSn/CINCeaiIeujVAhu1PO86HZQ1CJCBWegdpDXFuhfz2hLLmwywJcJdjZ55cwyPg
	lPbcqtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjf8-0000000708w-08LG;
	Mon, 19 Oct 2026 09:28:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjep-0000000704u-10sO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:27:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1483141f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402069; x=1793006869; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=wa7gG4fqr+ig3572uhPtesXdqN8s9YUTV1/JR7/wC/bz8OyMBYbYUrY/Q5sjkf0MsJ
         J5sCmquYsJ/phC9xM2snMrv3Dn9qJ5hFj1+sf9pBgFc2vxUYIA8LA2Smg1gSQsPk7SG9
         JfXVpQSeM9JbUhtKm6deMZEPlSp/rsFl8ZMTI74Q3j3llDQWK0jMOwS5vulFFKM3GAGa
         hY0eik+tuoUL9+9yzTLXIwe26IeAOWkt/4pzTwX8+hO+RCV8drd5i2VYQf7m/p92EiXm
         XLhlFCcDxbFOEgsN5refue7IHVK7NaT7+MvD8+VqUfVo+yG36pq/dkNanFgzW0wQld/Y
         QInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402069; x=1793006869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=H9RMprNbWX8Pnafbuq8Dir/jddZVTwQvJIl7ak1u//2L0BO4bep9m5bbzBGZA8KDpG
         2N/RuBnsJoiCDDIAlAxwQtcZG7Nun4jEch4Z2Oj5uPrkXR0tj0KcRjsiHRAGr6SJep5z
         4ql3Oldu5elelal2hNQchYo6bNvRO1TNYhA/xULv+DQMAOLLEF3EGzRTbPZ9ayvw4ps+
         6LuYWYYbakMU+1F8PFlMd7NroG4TVtMJIbZvj9Yvyd2f0UfOxDOmdZzqZ3F+tuJ4UfyF
         LFzbz3t2rsR9wwh7tUPbVttxwiGsjGbsUFBOL/KHgJo9XdvNjrIIPn01hTShYu9JszPN
         eL5w==
X-Forwarded-Encrypted: i=1; AKwUvBxnPuDDAXNk6lg2C7HIRwUhE0cWZ0xcjXPKYaFAcf4QUhRAGYxPuX2yvBQwE4yQwty4jNykW+6uM21Z1Fsnz4NZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJTKFf2qDVWtFbR2ZgSeywynAz6U/An0jPOKOIuE5h4zDZIuFJx
	V7Rk9kYB09xDPcm1bZeKUsjdUVq5FDzwqz3pDslka76GTNlrz099rcxi6oFFW9Fpdy8=
X-Gm-Gg: AYBFou11miSGbys+Ff1qi+bx94PfCm2QqKaNHrErbNK5Afag6xC28n6yEu/a1RKTbCn
	GeGw/bT8M6T+q5zVfG4QcsFL7hz2A8ZEyVvmDVWrjv4DfGdmDx6+ty6soe6lG3Alay/6GHBog4j
	hfy9YJfSEpjMZxq/sODiUmroTg2yKrEcWZvQpI00TOD0vgwLeUkgkizLlEoFEx5c7wKMo74Ym3I
	UpBdPifA7cfUfDHrTFUqUZ3gmP/ZDL8DELOK14QYJcWcyskfErizkA8DJ0zo+B+sxoLLO6ROhGq
	3mE9yeFm9woTEHqrikVNcFEnXkkeXfxVH/b6r+CvUbXCoqREQQLccXIr4YnoOIPfIA+wPf5+HZZ
	VfO1SYWDmtUR2sOiezKxTu947gtHyfuWvIB/nRIfnCaUd7fIcNoFMMmgPmv7akh0lXBisRE2rD9
	KeHE9Wf9MNGmahZ6d4F6M7nSfYujNwR0Fqjwr0w0xX8Y++HAXyPf8CqqcNQ2XNPtQZmMJtShHbb
	Ac=
X-Received: by 2002:a05:600c:4455:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a1e225b8d7mr85661165e9.14.1792402069375;
        Mon, 19 Oct 2026 02:27:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm188133145e9.3.2026.10.19.02.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:27:48 -0700 (PDT)
Message-ID: <5ce85fe5-f1ab-40ff-af26-7c315a0d47a3@linaro.org>
Date: Mon, 19 Oct 2026 10:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] coresight: perf: Validate context before resuming
 trace
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
 <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022751_328722_D890BC46 
X-CRM114-Status: GOOD (  20.89  )
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
> An AUX pause ends the current AUX output before trying to begin a new
> one. That new beginning can fail, leaving the CoreSight path published
> after the perf handle has become inactive. AUX resume may also overlap
> a normal stop which clears the per-CPU context.
> 
> Pass the per-CPU ETM context to etm_event_resume() and centralize both
> lifetime checks there. Use perf_get_aux() to confirm that the AUX output
> handle is active and path to confirm that the context is still live.
> Resume the source only when both checks succeed.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c7454da5c881c4a8eea5cc77902c9113c297096e..e3c9d3cf84c502f357a430bc3bfa854a776618f1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -517,11 +517,17 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	goto out;
>   }
>   
> -static int etm_event_resume(struct coresight_path *path)
> +static int etm_event_resume(struct etm_ctxt *ctxt)
>   {
> +	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source;
> +	struct coresight_path *path;
>   	int ret;
>   
> +	if (!perf_get_aux(handle))
> +		return 0;
> +
> +	path = etm_event_get_ctxt_path(ctxt);
>   	if (!path)
>   		return 0;
>   
> @@ -547,8 +553,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
> -		path = etm_event_get_ctxt_path(ctxt);
> -		if (etm_event_resume(path) < 0)
> +		if (etm_event_resume(ctxt) < 0)
>   			goto fail;
>   		return;
>   	}
> 

Reviewed-by: James Clark <james.clark@linaro.org>

