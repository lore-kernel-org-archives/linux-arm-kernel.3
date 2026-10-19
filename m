Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2098FCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFqTDlj4awkfSbachY987XqpXNk4Iu67BWeqjiuV6NM=; b=dZT7j3gQALONrFEs+xuxwIBA2P
	IvdLK8XSsCngd87ZU6roJOGH0DTpv6Lqu0WUvVNe15b63dxB3oV1TnTLPyEoINY5A8uRK3aZARQej
	YGCUsToECitfp922VELXtykiTBrWV+hG26/HYSloaOud5FqnDy5rues7XTZvL5jS9G9IPtqqrGbRn
	IARF4X9/rIxjiEcET9SUS/wwBmUM3y7vwg9osZCt2uSw8VhG92o/izHllLAUxmkNPXUeJUT4VAiAl
	cO2kSoKSUvREFQ6ZLaruRM+Ywa0uJfSAm7FeLT7sSdPVFX8MIhb8YfxZTxPUcAG0onUiGlrwTZZqb
	7bAcfQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImjE-00000007QDc-08YF;
	Mon, 19 Oct 2026 12:44:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImjC-00000007QCw-0LGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:44:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c418e215671so251070366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792413872; x=1793018672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFqTDlj4awkfSbachY987XqpXNk4Iu67BWeqjiuV6NM=;
        b=skAejxeq5gLNm/B3k8ZHKi7EORb54Y21f+G8hWG1j6Bd1TyDIuCy11NJwdrCMxPA44
         yX8rkOUjMELoBsIsIMhWefpld8BWLdcok9MMIC7ty2HVnIH4FHqdl8hwFHwbuq7vJLXw
         tBDehfqkfD9W9ypZGmCvhleAgOkQG848FloNscNtW3rJwK3ccmWlvShKtNp2OxabuLrh
         D0hZ5FspCuZtd6qJ8UnaPtAfvPXXI0Uf+xnIg4XP5gWBa/MI1C1Y6Xenw50gpVCv7Opr
         uQsISIVlhO1RcBI8rBAXAnfRwEVfd/IBeVxKdcskh4n090MNK3jbY2jdZddnAG/aBezb
         2wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413872; x=1793018672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFqTDlj4awkfSbachY987XqpXNk4Iu67BWeqjiuV6NM=;
        b=PPDkJjbPuaI5jGXyYIsmx/IINK5Z/jtrbGhE9dOMvWSZj9CfRsfBaEQX6y7RnLbwfz
         BM87GfEVU3vXtd6iq8t0N3xfNeGN5HP+dTO9w9w1+CySK9/owfycsug7Oe6UlEXzW2rD
         raFT1oYkT/9Z1uACkm3yx93xgeYCHhV0abW8FVU8x5YmthARu66rXAmRnhZVufYhz8NT
         X4f+EmZKGnTSHEk769cm15K8wkJUVmaafIsd5pJxbirHqHwO+vJgzkvnR5nrmbs8w3cH
         jKdMAniGn+VPv5G9G1iuzNiJEhs/jJtdhWIyqnuRdukkbQoREZGpCtLGp5QFoAmWiVWB
         GjAw==
X-Forwarded-Encrypted: i=1; AKwUvBx6Kkbxu6qsubzSWZI9pgp1fvlBzbhfhxy2Jy9A96eX/9AoE5tbC0zazinoxNU65QTjOF9fg3iOzi/4zJeR9x0+@lists.infradead.org
X-Gm-Message-State: AFq9FYIi8hokszBJC9NJxggq4kAzfoCZQ1AkcpsoMjEfh9eSkYJPD+ns
	xSovIQjSVvuFu9rkU/9BWOQn8OEXc4wyGTrYkGgBZsp7Jw8eeHzWxH7wRzp2t80rdcI=
X-Gm-Gg: AYBFou0VnYgRSGvqeG5mZhF3ec56Dg8QFdlO6i8AB3g0O05M0Lwyx9wdNcgLJ5KaKEB
	7NEg/TNfXkc7N/d3/da4JmdIdHW3ctaJm4y4uQb60Y2eImQhZ712DIiWp57KbCHFjEOCqZsbzK6
	hgVWzqdvP5ttK6rIK2OPpZtEAcBzDF+Juuab2vOjsA9ME8rlLWp98AGZzw9VEEcwz7y699rRDn1
	TbYE2E0uO0BsWTt6yXI0thqNSCZG+KX/yLUOJkkg0nFBIpThu3C5dAJXZ/OqywqXQQSLdMyG6Fn
	jGhmUBw21vTB7nhz0rz4eYjSOG+rcZA6WMJpXPNnRxG1/bnRILJjKKFpixi464cDCvFEfA++Z1C
	BlUcEk5oj/oCG4sIrN13N59ai0qG8CaOX7vEUPRKndcS94P6ykf/BzwC4dWw9ug2zaMhEKP6Ax8
	0R0xHAqvyAIi0miSO72dHJcQq5y0HeK1Eo13AWCPND0fBx7it7RTja3vklSTvHns33q7iDUiWDE
	Eg=
X-Received: by 2002:a17:906:9f86:b0:c40:560a:45e with SMTP id a640c23a62f3a-c419f416b79mr534320166b.35.1792413869576;
        Mon, 19 Oct 2026 05:44:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm362496166b.47.2026.10.19.05.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:44:28 -0700 (PDT)
Message-ID: <0aadf786-8c79-46c6-b6e1-d5a6caf30771@linaro.org>
Date: Mon, 19 Oct 2026 13:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/25] coresight: trbe: Handle an already disabled sink
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
 <20260915-arm_cs_support_aux_sample-v1-13-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-13-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054434_151101_AD87ADF3 
X-CRM114-Status: GOOD (  19.60  )
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
> arm_trbe_disable() detaches the trace buffer and clears cpudata->buf. A
> subsequent disable dereferences this NULL pointer in the buffer consistency
> check before testing whether the sink is still in perf mode.
> 
> Check the mode before accessing the buffer and return success when the
> sink is already disabled. This allows deferred event cleanup to revisit a
> path that an AUX snapshot has already disabled after a failure.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8eb625d3fc99db57a18e35ef59ef814dacf20a09..6da89a890712d32e87a15f7c564ff4dc4d197bb1 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1098,11 +1098,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>   	struct trbe_buf *buf = cpudata->buf;
>   
> +	/* A failed AUX snapshot may have already disabled the sink. */
> +	if (cpudata->mode == CS_MODE_DISABLED)
> +		return 0;
> +	if (cpudata->mode != CS_MODE_PERF)
> +		return -EINVAL;
> +
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
>   	WARN_ON(cpudata->drvdata != drvdata);
> -	if (cpudata->mode != CS_MODE_PERF)
> -		return -EINVAL;
>   
>   	trbe_drain_and_disable_local(cpudata);
>   	buf->cpudata = NULL;
> 

Reviewed-by: James Clark <james.clark@linaro.org>


