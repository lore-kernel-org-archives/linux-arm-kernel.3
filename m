Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66B7D7497F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz9wlAuOkzG9Bsbmp9By5wnGJg5X6riHYobC5TJfVgs=; b=0Tsh6eayYzqsY/+18/J9XbIwzu
	pDXRXxO4913MbL9cMoxjKM/iCHs0XQK7WVHpOwkkSH6smiXULLgTmFIRW2ZT2m2rulgfeAX5QgTdl
	qjjXcKQ6Of3juukF3UpkIz8J8H/rVxa+2bMzCSgggKVvtjVG73yK2Sfu1/dA9PKKWM3FEH77vUfkP
	L5hhnv7jhScjR4x1BoOTjedPjZHeG2P257Z/xXqPkSBKPGXBx5qkRc6tExNhVpnDmLsZXegpWiz55
	MlnmMXbyWZCOT3ffsXMscIc/tWQetQWq3cYBNJw6L98uZIGzj5RPHsBOQypQYBHLKepjeikFrUwfA
	kwy9nN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63qw-0000000HFb3-0FCO;
	Wed, 30 Oct 2024 08:14:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63oe-0000000HFJ6-2rPN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 08:12:33 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so9641384a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730275951; x=1730880751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cz9wlAuOkzG9Bsbmp9By5wnGJg5X6riHYobC5TJfVgs=;
        b=vk+OhMhlTYHf9mDqbkHBZR3R/cJ8r8GrSGtdSYMq43vSwcDpJQB3+zx9cMJPuHCRb3
         uwhQOMdk8r2ACHFzD23UoGmy18cvpyJoY6rvFI1SxYnSCz32T4TJwzw214Scu5RIoPDp
         SwyDJrHsN6W+l6wmkbUisTEr3bBBt3l0S42bjrqbKlDGLn5ACYR0PnGBpFKJF3U6IkDv
         hY/q9ek+XZ2L32Bc6irD4igWcwqC2sdhh2Ug57oG1GtPV5MVI/rqvlcMTZGrbjWKX9ee
         kx1YD2RB+aSUVIJIxzYcRv/qKn4eZQQ4+Z0mQhbSlC9yi+UxxSnvxU5NMpU6Ujm0E0z7
         NZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730275951; x=1730880751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cz9wlAuOkzG9Bsbmp9By5wnGJg5X6riHYobC5TJfVgs=;
        b=MkTEnD8pKVQamb/yZsTvuFX7Hup3S1270jtwsrHPd8OBMiG4Yawo8FDymB9lzPpoKV
         a6RjimfXSoAKz90cqQT70LMqeoXO3/QK2fJ4qfJTH29O2amuAvX46oRgv65FzbVl4HVT
         Z8I3V7UIPFVY8r2xBt/KvgIpLQC0obyYwov96AkpsU+tLfEzsHxU2gZM32nen5XDCft1
         2Jl6rf2sVwIM6iRkTb2gSSnOrS+LNu+jw9G2mHFE6ql33GekrJf85rQxl0k1wbz2uFLO
         ZJcR68RK0vQwxIyb+8+lGC6pbI2mxs/NS7hpFzGS7HRZw08oCEUL8iBMqRaHeSRh13vj
         rwWw==
X-Forwarded-Encrypted: i=1; AJvYcCVu9FlyRCvO7jHavux6BSNluJEagsuCdwHKcklR1jDATIBXlVxMOkIONuAbGbKWKtj/xiKqPTGpdzhcEL09MqPF@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ2uASAtbZlkwNBkafNodQGJvb4UxM068uD6pqUGkTGPSCqMlc
	R1VomXOse0d2b3Xjp2hkazrh0YEJDyL73drSPTV1aa4+nux6LoPenLwW2GHHuiM=
X-Google-Smtp-Source: AGHT+IEHTQ5wOu9NxUvBgVG3q+Vz5Q9uWU1Gz79aPOENRB/2Xj3YqbpYXp26n28FGcPh+P9z83I7JA==
X-Received: by 2002:a17:906:f591:b0:a9a:13dd:2734 with SMTP id a640c23a62f3a-a9de5f2641fmr1504885266b.36.1730275949334;
        Wed, 30 Oct 2024 01:12:29 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8549sm13364615e9.10.2024.10.30.01.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:12:28 -0700 (PDT)
Message-ID: <b9d7f990-112a-4cde-8f04-6f8c6cb96f9e@linaro.org>
Date: Wed, 30 Oct 2024 08:12:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] scsi: ufs: exynos: add check inside
 exynos_ufs_config_smu()
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-3-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-3-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_011232_756547_F4A17583 
X-CRM114-Status: GOOD (  18.08  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Move the EXYNOS_UFS_OPT_UFSPR_SECURE check inside exynos_ufs_config_smu().
> 
> This way all call sites will benefit from the check. This fixes a bug
> currently in the exynos_ufs_resume() path on gs101 which will cause
> a serror.

because resume() calls exynos_ufs_config_smu() and we ended up accessing
register fields that we shouldn't have.
> 
> Fixes: d11e0a318df8 ("scsi: ufs: exynos: Add support for Tensor gs101 SoC")
Cc: stable@vger.kernel.org

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/ufs/host/ufs-exynos.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index e25de4b86ac0..939d08bce545 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -724,6 +724,9 @@ static void exynos_ufs_config_smu(struct exynos_ufs *ufs)
>  {
>  	u32 reg, val;
>  
> +	if (ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE)
> +		return;
> +
>  	exynos_ufs_disable_auto_ctrl_hcc_save(ufs, &val);
>  
>  	/* make encryption disabled by default */
> @@ -1457,8 +1460,8 @@ static int exynos_ufs_init(struct ufs_hba *hba)
>  	if (ret)
>  		goto out;
>  	exynos_ufs_specify_phy_time_attr(ufs);
> -	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
> -		exynos_ufs_config_smu(ufs);
> +
> +	exynos_ufs_config_smu(ufs);
>  
>  	hba->host->dma_alignment = DATA_UNIT_SIZE - 1;
>  	return 0;

