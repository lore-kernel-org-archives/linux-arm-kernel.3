Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA5DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGraRH9uevKqJuqG1Upk4uztJ5pT0JASF7LV6x6Vrbw=; b=Cu0onh/SfhWiDHitK2zpZEgGMB
	6EZPsfzZdT2o9uELE780YAUchf0YV8k0wM35FhZU0ajQobqlsrByUv/yOrfOJjvlbgTfEcwnDWlE0
	Tv3DlmpUiDHFjXpXOspZ8orfDBqibYWvJkqbo1HHH4itGWmMr9q3nUZnHscBfyYRDiSCKQg6m6WEV
	b5zG4kpoXIMVuOuWZGhheW9n/vH61eUbrQEqNvzC7OpKpb8M8LWxG1sQ9ZXLKrb25J/if3Liacae5
	kVb5tw0n0Ac1EJtGPPcorxRZmnJcK9fSyJX6jckEleocw+Fu+S0iD3vestm/+XSlTJPRkp+/dv73n
	P9UNnqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6nJ-00000008QZh-2FTZ;
	Wed, 12 Nov 2025 09:05:41 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6nG-00000008QZ8-3A0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:05:36 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8a479c772cfso47358885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938333; x=1763543133; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGraRH9uevKqJuqG1Upk4uztJ5pT0JASF7LV6x6Vrbw=;
        b=WxGwTUTIctch6ZufsZc8AjAZdoHoUp8d3gwr2/uygS1wEOfdjJRGVOI09LpbuW2RZm
         c/MPbPLTyoUiRbZXqPWFsnqjbBLYOZA0gYvsSDbzbXRD4KB7zHSXbPwOFpK2hjdnPodt
         DRLwE1bAvkTw+eFn+qX9gUXFV7PZFQvDRLy6zouMjuor35qU5n7gVJhhlVa5k/J85egA
         J+G+3B4Zsm96cOYCjah7hnffq+7fvtnH8MfjFMG58P+8kGjlr2tgN7QAt9VtutzUDy/x
         LUJOifOTjUVyFK4fKiz6fg3HqMWvntTbvcQmbO2p8Y5le5o/J66kXZQXZI+OusL8QwES
         yLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938333; x=1763543133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGraRH9uevKqJuqG1Upk4uztJ5pT0JASF7LV6x6Vrbw=;
        b=bKZl+nFZoOnWKOCpcK1g04faKhozwKxYq2WNjGWHsGX3TrmcUJonEtEjqgXw6f5yeN
         lCqrGj61rPdAJ05TSpYNxhufFTdaGrn7SSgtEQmwlD8wxj6fFNARSwdiRZkh/wQHesgy
         lri7UbpL9RaRBb3A26Q1WDYXmR93wsVOMyxWdBDFMSDDLBp4ctIJjkeL01iYhLkfT0A4
         c5GsCoTiFmTYDlmzM2QxWMq25VY1y6z8aImUY/a5uiyo8vpBZm7Dwf0OW5j9sK0noxIO
         xWXsQ3TkAmvUnbRMZ4Uphd8n0Y88LtlR3kBvwEALuFFUMuFpEFB99p/8xspbt+dNe8qN
         dYHA==
X-Forwarded-Encrypted: i=1; AJvYcCV9XH80SQ40HGYouAVKtHUpwJ79CePvcN5Jh/GSCLQvDcZXLCQ3UXfbPPDduAeZyY3Uw0cjV45dloo9e66P222A@lists.infradead.org
X-Gm-Message-State: AOJu0YzRdcQX8EXPHIX8fZokd2rSjphoh2wMGT6HMFp+XJ0xSH/yEyQw
	fQihLEB5trbOUyFtJ5jaY0vYjbIWgAo9aSRqHUOXACwpY8k5uqAMWXzSsvhuYO7yeJm47l5CtGd
	2HL2Pf4mZwwakypNSqjh67bkfKzViFbuo/AdH4tesjw==
X-Gm-Gg: ASbGncvO6ht3IemuMyFni3ecoN8LgXaqFINfM2JLm4VHxnmd38bwLQRFg5wL4fzrwFd
	D64SqjAeyA4iB3MSWApOPOi9g0MAxHE0RwFuNc/t1tJ7bAlu3jEBpkRhoegP5PIfU3EfkPSJjHH
	q/tvM0DQ1Wi+tjGiVo/KZbZ2co5PzidtdfPUfoH6obQ4wWlhS+Ag7uYM3TRWXIU4vaIOUeXZ9jk
	w6060xsU4h8f8zxWIX8+raRQT9gBKQio3jsT2mvoXt7JVyO1iCWTRQK7W7699Rg8h3QuGhWWpkg
	TIONuLh7eDEljPWzLQ==
X-Google-Smtp-Source: AGHT+IG3g9Ctj97I/wRZUZshjr7NcFapd6j5PezeeBYMXOdtYdfrrN0ql8kRHtp64+cKzuvlQ3x37eIL7e0FtB7qStA=
X-Received: by 2002:a05:620a:1a89:b0:8a2:ac60:dc3a with SMTP id
 af79cd13be357-8b29b8491dfmr264753485a.81.1762938333497; Wed, 12 Nov 2025
 01:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-10-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-10-f55553b6c8b3@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Nov 2025 09:05:22 +0000
X-Gm-Features: AWmQ_bmNY83cckdpv8rVDQiT9VbVxWbWEr5kZCEtMBGA789FKnD9AHfUl8GgCNo
Message-ID: <CAJ9a7VjAYPCi-s_jsa3bZ6Po6denegp_gC3NRz79w+W4Sdw4hA@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] coresight: etm4x: Retain sequencer state
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_010534_981676_BE00B743 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue, 11 Nov 2025 at 18:59, Leo Yan <leo.yan@arm.com> wrote:
>
> Retain sequencer state in the disable flow and will be restored in the
> enable flow.
>
> As a result, the flow will be reused by CPU suspend and resume in
> sequential change.
>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 8b85a73e29f407a8d5e26a25f4dceaadaeed05ed..afee54ac0aec0c0e521fa1885a95f48555a369de 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1034,6 +1034,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>                         etm4x_relaxed_read32(csa, TRCCNTVRn(i));
>         }
>
> +       /* read back the sequencer state */
> +       if (drvdata->nrseqstate)
> +               config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
> +
>         coresight_disclaim_device_unlocked(csdev);
>         etm4_cs_lock(drvdata, csa);
>
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

