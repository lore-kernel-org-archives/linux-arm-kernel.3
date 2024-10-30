Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4BDD7497F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IzTjonjvv4fhPKtE1bAMZ0z1TTpZMKWkER0B3kjnaU=; b=EB/GLxGKqdDALBMcaTZgHpcJ1u
	9PJvmRnpJ6c0g/rdMaRh28rfZ0MJ7XjjgvXAJE+8WaVvNtOh9GtaEp7pQevNX6726seBDPoBhALeT
	v968j3vxZa3rV+zOrV+uAFLeCGozK+DsXaNc+lRRbfrkSp8Vx2Z/03f/BkVdxfFQmEsIm0WKHqyss
	2rFnPuT/O76PTrdEcfBWmU19vhCgSUdw/gEJ59aVn6QoDrQzi8qLYrLwcCK+0pATnS5ZO2w6PbNt3
	xj+IyfYHCFMdk9CXOHBE7wJG+XVUa8ysZYVGRTLrSKboVwbRQUy9bMTYwrKat8shJjOhYBdG0myVN
	+krwJFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6422-0000000HGuI-2zop;
	Wed, 30 Oct 2024 08:26:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63zx-0000000HGSe-1YWv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 08:24:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso876464766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730276651; x=1730881451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4IzTjonjvv4fhPKtE1bAMZ0z1TTpZMKWkER0B3kjnaU=;
        b=jburqCMsOGorku7HMTV+OzKwl0qQEQhXvT3V0+lgbxWBWkcpon7ngrR+NScGURNTAB
         i2k5j9E4mJKLI4bETNe6NPpXB56DrUL0a8ufY5lVC3RSHGiNmXPbSne6y5OrB0oxP06c
         ykNpV45fd0DmR0zO8gubZHrJvzue/7c3Hv/8MohalFR6/qhxE8Bt4zjLFVpidWbvrwJC
         CnealdM+OvlDH/Q+ax/iLWmb71w/qrGYU1JZq+xP+jOW4ZO16FguvwWAmfbC7frX313I
         SIVIZ5JssTrm5SsBXGIp/r7dH7ks+jOUqSaeqHq8Pq42u0lMJ/FMbNvxUpTC7fP8aSCR
         wMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730276651; x=1730881451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IzTjonjvv4fhPKtE1bAMZ0z1TTpZMKWkER0B3kjnaU=;
        b=KMg/eJmRziM8qGL2aezGk6yBgRQBUdQyjWvU0yBfi1/EBonYJBxWaPw54y2Pb9RquB
         WXRd3ktf5cUcAXi66I+N6SVoR7/f2jS/FmV94sjC5ZGmlq4yxqD5xgagho9Oh8XUksUE
         HiqAhLB5XyoL7oKYdPVlAtaxex9yVReEhKpSFcesi98xyN7IXaJzmP3ofPAm1ZltabU6
         dLazO4Y5H9JobibCxfJTlHndrRgDf0Ct4bXVexQ2MTj2D4Ups20lFOcSrinuaQ8pww/k
         i3VOrv4KF86if8oJsb9Q3mQ7uR/YaIb2abV8SLYUW6ptbIgFC89KP+vmwgMNfwMwYmID
         nuEA==
X-Forwarded-Encrypted: i=1; AJvYcCXn6xv30MV0aZE/8+NP0F6uamEzbDLou8GpyxmQ03D5SN6RFmMnHoAymDsnyNz2TgXLBC+UCwbu24F8lJ30ZDHw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3l+Zsc3y2Z5ldoLBsWPMdgnajuaHuVu6EXD4Aua09cBE4mpyi
	3U25KYax9cBF1E25fBDLaoVE9P8DO6B9B/JoaJMr6w1baYYMwTgTDLHa2wDtOpQ=
X-Google-Smtp-Source: AGHT+IH5x1e9E410/aCJcWrSKGwzP+rL5H/qoPDmLBUylFSzYy/PDgopa4w/bjGtxcjDtfhlYRn7IQ==
X-Received: by 2002:a17:906:794c:b0:a99:e505:2089 with SMTP id a640c23a62f3a-a9de61ce120mr1423660466b.45.1730276651447;
        Wed, 30 Oct 2024 01:24:11 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b13309sm14733219f8f.3.2024.10.30.01.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:24:11 -0700 (PDT)
Message-ID: <039d4e57-30e7-40e8-9501-cc4b18c6bb30@linaro.org>
Date: Wed, 30 Oct 2024 08:24:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] scsi: ufs: exynos: gs101: remove
 EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-4-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-4-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_012413_453518_A140E625 
X-CRM114-Status: GOOD (  14.09  )
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
> This flag is not required for gs101 SoC.
> 

nitpick, use imperative

Auto clk control works fine for gs101, remove
EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL flag.

(or something along these lines)

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/ufs/host/ufs-exynos.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 939d08bce545..d685d3e93ea1 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -2142,8 +2142,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
>  				  UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR |
>  				  UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL |
>  				  UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING,
> -	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
> -				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
> +	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
>  				  EXYNOS_UFS_OPT_UFSPR_SECURE |
>  				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
>  	.drv_init		= exynosauto_ufs_drv_init,

