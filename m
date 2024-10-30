Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A7D5CCA0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRTlMMdulNS4t7Utn/teiYYlIAHmyGJd+rw2+dNOPT8=; b=vY4PBSePbKE1hdKWzGKIutEFE8
	Sdg+CgDqElalm7B9TAgYxY5blcWvTfDmrsMygCwCmXrvt4F6HBjtc41qr46Sl/KP/H2IVfBSqyZTb
	0WRWiOKu4aQVJaUvI88YOkLNvki+t5cVN4PmMbK9X7qm4w44LC+IoviFZzfRnLQEaO3z5ZdNb/CTU
	/1S0kQ6waN0v631k3o4d29r2n9rMJnZdyRMbun8qaGXGhMquTHt+4VY8DQddFVZrFebNHeGyz7ySn
	oGUBKVmmchJp0F2+Wegt6PjD/nF2Q+/50aFnwc0aU0rSUApkXrNEGn0pwsN/mLn1CSINSJbFo1T1i
	9ctMDJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67Gk-00000000EEK-14Ir;
	Wed, 30 Oct 2024 11:53:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t678Z-00000000C9r-18Ph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:45:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so60221395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730288717; x=1730893517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRTlMMdulNS4t7Utn/teiYYlIAHmyGJd+rw2+dNOPT8=;
        b=I3DVCwUmLe0CdaqFiMyqv/zqyvE5yvMmSkDaoBd7r7mjs70E5ZjxNTC8o4AtcwVS0E
         f64tog9NUAHiNy93wcRdWs1cjoAzyjjzlV7wJdXTnValspKqIoTItOmO71Ur3hYch7rD
         p7OM1AHJRSw0U8SbnPIzb0HnJvnR7IrHki2Ci3lDnfWxfwz5bQhI3hSsTVv3dEgJNCJk
         RhlhpYVR+O5l/2FW0xPtCFbrI3LiqlOeh+S54mxI8h8CcKQwigt0C89VxtRgHuK/8E0B
         +XvtGmUTZ6n3T7foANMqAdc3RMgXpWTZgW01rllDNUG/MccoUBauWZV030lJrKx1SqKn
         ZQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730288717; x=1730893517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRTlMMdulNS4t7Utn/teiYYlIAHmyGJd+rw2+dNOPT8=;
        b=Fbk5ER2RqWUAfyTLLU7c0XF09sKx7YRB6geG/sxmE94sobPRjQee7XdFEeF31Tg2MS
         l/UFFU6Lain4m2Jq6XZWqsDXJQT6uo/rbnzIuYqqzFmSu/5klVqMb5PU71o9Tqpc8zgf
         r22uq1il0g4IYQiXLHSsGW1p0wDeoIMJ9yKM0NaHNCGihPUKEqwDKmMnOjMwSC3SWXBM
         ww5VZIjYUVlu/YbSbIM815Zn0Yfvd5+H73n2U/XotB0Cz6PjrozItFcU3dANQtvaom2R
         b1KKvwTb9kgf8YRDXgvf5+2AcLl0fGimjfZVItB3pYyOQor9ydVN00+cEB125mDoFAQO
         t9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXwo+C6KGCE4dTBk6uiMgS5NWwDY/btVwOM4KHxuG7AzNxXnRx2/i4+yRtmVNFeper9eQxifmC8Za9BA/AILePw@lists.infradead.org
X-Gm-Message-State: AOJu0YyI8AOhUFUepuQ4czX9OhRioYPkoCNL7qIkK8MIGmfA1J2EQT/7
	1/Y8YY1c5JZ1BjofZPIQKR+LWdvuG6LeilfuDQrDIFZiO7SsAt8NlCHPHMyUGfM=
X-Google-Smtp-Source: AGHT+IFhRIh+9dGeOayOm15oZMXod/rBU6ExE23pj44w94j9FntXD8S6utlDgPeArlr6epPz1dO7fQ==
X-Received: by 2002:a05:600c:35d3:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-4319ac7832dmr132578255e9.7.1730288717449;
        Wed, 30 Oct 2024 04:45:17 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d5edsm19091545e9.26.2024.10.30.04.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:45:17 -0700 (PDT)
Message-ID: <f9cb758d-28a5-44bd-9cb5-d7ac5108db1b@linaro.org>
Date: Wed, 30 Oct 2024 11:45:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] scsi: ufs: exynos: set ACG to be controlled by
 UFS_ACG_DISABLE
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-10-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-10-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_044519_356870_162AC171 
X-CRM114-Status: GOOD (  18.82  )
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
> HCI_IOP_ACG_DISABLE is an undocumented register in the TRM but the
> downstream driver sets this register so we follow suit here.
> 
> The register is already 0 presumed to be set by the bootloader as
> the comment downstream implies the reset state is 1. So whilst this
> is a nop currently, it should help with suspend/resume.

It should help in case the bootloader changes I assume. I see
gs101_ufs_drv_init() gets called only at probe time, via
ufshcd_pltfrm_init().

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/ufs/host/ufs-exynos.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index b0cbb147c7a1..fa4e61f152c4 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -76,6 +76,10 @@
>  #define CLK_CTRL_EN_MASK	(REFCLK_CTRL_EN |\
>  				 UNIPRO_PCLK_CTRL_EN |\
>  				 UNIPRO_MCLK_CTRL_EN)
> +
> +#define HCI_IOP_ACG_DISABLE	0x100
> +#define HCI_IOP_ACG_DISABLE_EN	BIT(0)
> +
>  /* Device fatal error */
>  #define DFES_ERR_EN		BIT(31)
>  #define DFES_DEF_L2_ERRS	(UIC_DATA_LINK_LAYER_ERROR_RX_BUF_OF |\
> @@ -220,10 +224,15 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
>  static int gs101_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
>  {
>  	struct ufs_hba *hba = ufs->hba;
> +	u32 reg;
>  
>  	/* Enable WriteBooster */
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  
> +	/* set ACG to be controlled by UFS_ACG_DISABLE */
> +	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
> +	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
> +
>  	return exynos_ufs_shareability(ufs);
>  }
>  

