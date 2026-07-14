Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC58DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09TcclYmaPCDKc6+KZii+R3xNkB+ca7ftigSvlljO8Q=; b=rQQx7NucGRyTmgpr3zKCIKtzcS
	8MxDg69+wyUROm0/g0j98oxKsV5fu99ESS/tm6uywuWxWA/Rd9R5ypVHbaDebATDr32Bu3Sj7+e+z
	J7Qn1nZA4cKqvFW8NSpn6w56/JZkH2r4D2YkzxMafrJFP/qP/8FZNZkr9qQrsV36poaz/+4ROQfOu
	tROJz5oe+cUuLADK1EU2WJ+AK+FWFnH8IjdNkhfuXJzLDd8isHctJ3PpCdBynqWZA62brJrsYR62B
	RsvjWtxNTMvNUG5W6hAl1+CbrMcKHx9/Ops6tArTPE2Kj3sbj1dPVg13Yd3//BiW8fanM+U0pB+Ra
	uNKKgF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf4D-0000000CXSh-2HxC;
	Tue, 14 Jul 2026 15:29:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf48-0000000CXPy-2dvw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:29:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so18272485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784042938; x=1784647738; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09TcclYmaPCDKc6+KZii+R3xNkB+ca7ftigSvlljO8Q=;
        b=eKoveGX8ekiFlkUL2LCNbdKeRszyzbw8OzhGtprzVprrhQxcts5Z35zscb/PPWvKqo
         bxTNyPSIn4/p6JMNRKc4kgIoGOGrna+MsCubM+Enjd8wjmaK8HeOI/VO+sCUHEs6SD4Q
         h0WrqVIEegXcq7nOVyp0jmMLYu8y5X/mAPKK12DBs1rwaaMeKdKL0Dpi6EKXxH6oB954
         9sHoBPLNEG04CI35C4O5Lt+Siea4xoxgyZbJsUE0HWT9niTyj53Y/qqCXoaRfxkNHzfC
         zVRH5oJpZrdrYPY/QHmYhnVezeN6sVwiO/0K8eld74A5pABIy8Cmsx/VkM5Q6VLSQiPz
         zb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042938; x=1784647738;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09TcclYmaPCDKc6+KZii+R3xNkB+ca7ftigSvlljO8Q=;
        b=T/2M0UWZLJzCKsyp3/DfR3u2wtvAn5xhZUNs3plyW513zMNFDnfRpzQN7BWdJ/oGGZ
         CevfKwfz5EKF6buVTxch2d5Iaet0Wwo/X0PuNo+Hzt+bR2k197KSjTCCfxnvRolexQ8R
         +F+oKlTS94pfdGeW/rMLn/SoQyZT0eea5qfUuihJHi8ijI9CkTy+QGrfOstSwWtG9bqT
         lG9x8FUJzwkY+GsMxFIc1BYvYBD7XG9KFCa7zI0uswnQWE6NGGiybL4OblxeC91pZ9W5
         V/TUQtlGH5BffSVTXBxoXQEDSxhP3ZEFDPc625NAUA8qVOqpDI2HgLirxbubxmVBmHQp
         s8ug==
X-Forwarded-Encrypted: i=1; AHgh+RpxEaKjY5Lby8x2pgIThu92Eqe8sNp2crLusHXyV+U+GHwMNt4R/rAsbmxgmRC8MwH0dEVHa6CBqiyW8KLaVpMp@lists.infradead.org
X-Gm-Message-State: AOJu0YzHg9VDudRL7kAGBRtOJ88nfBFHXAaWtT3vLu+UiihsZON+DvMZ
	H3ZQbBJMumdxB9NIw9GC5F6bEfTEFWtjo7FROs3wd5obYf44EcXIPHgrWKLznr5XX4Y=
X-Gm-Gg: AfdE7ckOD8n97uy2zXa/nyTLapTqwnlXUt+guMl/ru9+PhRkIebkgFJeDKnE3/gIHOV
	2smuUdxp4ZFgT66qmSq38IHJtMNZ1wr0VkVIqFaF1DAqIjryM3rdbyicMxHLk81ox4BMseYPDoz
	KXWLp+PoShi8QE5eqDEi8dskfaFOlBGYbT6mO17A5IBNpI+cERY7zeaNzPodp3vraF8sy46+pKy
	QikV/cc3yiR5OIpf5X93tCkdkSb/gkC1Jm0n/udTV+XmgNT22i5ntpkiCihyHqao1p7duzQyf21
	YIOiQypXDmYSrY8snz4ZEL/RhBbyCvQhovTlt5HoISSpoQQYMlEqL1V8a2MkTA1lQwyEdlOb89u
	S+id7tKgfLbIMvcvXJFzAZC67JN1kl6wmrX7Kf6eyz3B15tVhwahNWd5zmXyI8XhT2CKv76F2eX
	Rv10cll7vZZ/u6luxlWPHI3spPwGD4mra9fAQq+pLtC9O8
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id 5b1f17b1804b1-4941cdd5035mr55153835e9.31.1784042937995;
        Tue, 14 Jul 2026 08:28:57 -0700 (PDT)
Received: from [192.168.0.25] (62.43.169.102.dyn.user.ono.com. [62.43.169.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm190589985e9.2.2026.07.14.08.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:28:57 -0700 (PDT)
Message-ID: <2e1731d4-71d9-4924-a728-0aa4821486cd@suse.com>
Date: Tue, 14 Jul 2026 17:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_082901_231204_F77DF3B0 
X-CRM114-Status: GOOD (  29.47  )
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



On 14/07/2026 15:43, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On recent MediaTek SoCs such as MT6858, the kernel is required to use
> a secure monitor call (SMC) to enable or disable the modem power domain.
> The power domain control register can be read, but firmware prevents it
> from being modified directly. Other parts of the power sequence, such as
> setting the ext_buck_iso register, still need to be performed on the
> kernel side.
> 
> In preparation for modem support, add a flag to enable this new power
> sequence for SoCs that need it.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 54 +++++++++++++++++++++++++++---
>   drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
>   include/linux/soc/mediatek/mtk_sip_svc.h   |  3 ++
>   3 files changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e1cfd4223473..56437b32b252 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -57,6 +57,12 @@
>   
>   #define MTK_SIP_KERNEL_HWCCF_CONTROL	MTK_SIP_SMC_CMD(0x540)
>   
> +/* Power domain commands for MTK_SIP_KERNEL_CCCI_CONTROL */
> +enum {
> +	MTK_MD_MTCMOS_ENABLE = 18,
> +	MTK_MD_MTCMOS_DISABLE = 19,
> +};
> +
>   struct scpsys_domain {
>   	struct generic_pm_domain genpd;
>   	const struct scpsys_domain_data *data;
> @@ -615,6 +621,34 @@ static void scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
>   		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   }
>   
> +static bool scpsys_modem_sec_poll(unsigned long cmd)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 1, 0, 0, 0, 0, 0, &res);
> +
> +	return res.a0 == 0;
> +}
> +
> +static int scpsys_modem_sec_power_on(bool on)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long cmd = on ? MTK_MD_MTCMOS_ENABLE : MTK_MD_MTCMOS_DISABLE;
> +	bool tmp;
> +	int ret;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 == 0)
> +		return 0;
> +
> +	ret = readx_poll_timeout(scpsys_modem_sec_poll, cmd, tmp, tmp,
> +				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int scpsys_power_on(struct generic_pm_domain *genpd)
>   {
>   	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
> @@ -633,7 +667,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
>   				  pd->data->ext_buck_iso_mask);
>   
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE))
> +		ret = scpsys_modem_sec_power_on(true);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		ret = scpsys_modem_pwrseq_on(pd);

So we can have either cap MTK_SCPD_MODEM_SECURE or MTK_SCPD_MODEM_PWRSEQ but...

[...]

> @@ -719,10 +761,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> -		scpsys_modem_pwrseq_off(pd);
> -	else
> -		scpsys_ctl_pwrseq_off(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE)) {
> +		if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))

... here it seems that a power domain could have both caps set. I suppose this 
second case does not exist, but code should treat just one of the two cases 
(mutual exclusive or not mutual exclusive).

Regards,
Matthias

