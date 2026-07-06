Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B54C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A51OX/9my7e6tIHaoARVbxZ+6ZmCrlNFfVyyluoI3Y=; b=Yx3KUyv0A8a0Trq1oPLd4RfB+N
	9gJXvFJkCR52qYP246XweD1rLdTCBzD4h0rpKH4930FerqBXteqhjz9CSjg94RGaARt/zkLp+PBoT
	zjuBzYJZQpHz+Ta8qw1tzP0V6EGRUmUDvyGSyOnu6VgiPCmMp4kUbrn81S8j69pL6IT1tXtP5NxhG
	YVcjL5kcjXbNrPIepJ3OxhDITDOPX2dN406QsXJJOiYEDy4wD/PXA8aTFFI4zvgCrdC2q7N23Eo0F
	9qlAmOTtfX4HGVACdrrfANBwrsU8Xkq7x9YUdvBq9ckyZPjBIi1zq0he5GrBTMc9zFcBPaxKBDRA6
	LClnwmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl8c-0000000Cs6a-3hiv;
	Mon, 06 Jul 2026 15:21:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl8a-0000000Cs5T-09Zx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:21:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3548239f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783351294; x=1783956094; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8A51OX/9my7e6tIHaoARVbxZ+6ZmCrlNFfVyyluoI3Y=;
        b=MbwGqcZH0BcyVHSi5iw/Ek8XtT9S0ZC+eoCC4ri41iodbWinriB7mTsvHE8gsF4xsf
         VpgRgRv4ueL0zSa8Mb97F4dTpwGaXrcQmWw6SPoqldhVBhfJBq4EtppTMvOj+UQqXR3b
         wawCWHAmEuCPYQE4kUvfe60kLLA0PlWENYEWeh2Or2vpDl/FY+Qq8H/zDLjt170+xLqA
         8zxZaYybT3F0xssZrgXYZns8Ww+k56e6GSLDPB2c5E4VGLV4WmL+FGll95vVpOfi+CQd
         XfeO6SAZPeFw+Gx7ZtTrTYzBMU04i5RW6bngxq4jOsyk11XuOXhoRtwGZnlsFbqYA3Hn
         m+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351294; x=1783956094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A51OX/9my7e6tIHaoARVbxZ+6ZmCrlNFfVyyluoI3Y=;
        b=ZtXgZcYySaGKxrRjN0/O0bVtwa/kwJMJUTc+rrem0QYHMxCf512RGldSrEProW2RH6
         zKCvm/irvqgdIsp11/KKMo0UjvhAT3AYPlObmaVqfjpqJJYFMXVuysiUVZUS/lkzdlkF
         c4b15v9mLNsmyFVDTKlGEVtijUCxiOQLIGJGc9yeYjr41T3WgibA0M+TAu0EbvwfbRbA
         7CEI6xoR6Fu4PXGO94ptECO8zvA2UBDTJAHhs/HJIi9Np+6dYdvymMASgQYwSL1Y049h
         36DkLxOtk/qL5GieCzOwycnaAfG0jWEFIWFntczZRJ3SJ2xY2woDfmRTN4HkZy8If2o5
         TF7g==
X-Forwarded-Encrypted: i=1; AHgh+RrMtZlX7qM7tbntc7+oiNK6H5SvCXhGZsfLjL8+tVgiAjtK/23+A9rrTUjUAA3JIfvLvUTnpyMQE73dzhzFLGzp@lists.infradead.org
X-Gm-Message-State: AOJu0YycjFbeNLnvZR9xFayfgcYUfKBw78uBe93FMWJMwPt2hEGgilCH
	XxORZCWJzrwlhYJuKpz1ACX0XANyuCm4dTHTyUNcefoEinLImoECkv/WvD6FDseLwWU=
X-Gm-Gg: AfdE7cknPYTs6MPgIu8M/6kIWjlI2epiy/o17vrqIQ6ewf4dStqvm1TOyT2DmWAg2Gt
	KbrsLfdQicvwBlCpN43qzANIYXjAJSQJOpFE4XRJ8M+aQHy2Ifl/58uDaoEc3M78TT6/0F69AMP
	fxGiNxJwIXcP3JzwE873dVtEmbLA6EkTYkOke0/LFlBqIXa6WzjYOySJDJi9GMR+k+CASCz3IkL
	toURWf3Y1IGFmDFuVOHUkGEBGz+nkIj+w9+dCgJ0JY2uu00C4GptLqbXbX0AKxYW1Q9j/CalllJ
	PtkozM+IEd/w94MbP3Fagp1WuVLLdTZR6ASTdtzt8/FPt7BS5RL03ZOjtzLZ1dpkO2GEZya8iki
	McfQyD/Z6jiz1MdrbczQGSR3gBHb6f+SOb7v7fH8kcjugQRVyLVcgoImWHCsGQPq++pQHIZDd3Z
	CY3xUiplttkXJE17O+ONeszpbE8BKUdRgjf74E/pa5aFFFgcAHdJ5OEV7AuN0a
X-Received: by 2002:adf:e40e:0:b0:475:f0c2:75a6 with SMTP id ffacd0b85a97d-47de66f2e70mr580585f8f.55.1783351294208;
        Mon, 06 Jul 2026 08:21:34 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm26469667f8f.25.2026.07.06.08.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:21:33 -0700 (PDT)
Message-ID: <747bb78f-5ebf-40cf-9922-98e69920a9d8@suse.com>
Date: Mon, 6 Jul 2026 17:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-5-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_082136_120973_062E125F 
X-CRM114-Status: GOOD (  14.93  )
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



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> Add support for the power domains provided by the HFRPSYS Power
> Controller of the MT8196 SoC.
> Those control power to the eDP and DP Transmitter IPs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mt8196-pm-domains.h | 27 +++++++++++++++++++
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    |  4 +++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> index 2e4b28720659..d704c9fa9337 100644
> --- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> @@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_hwv_domain_data_mt8196[] = {
>   	},
>   };
>   
> +static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] = {
> +	[MT8196_POWER_DOMAIN_EDPTX] = {
> +		.name = "edp-tx",
> +		.sta_mask = MT8196_PWR_ACK,
> +		.sta2nd_mask = MT8196_PWR_ACK_2ND,
> +		.ctl_offs = 0x74,
> +		.pwr_sta_offs = 0x74,
> +		.pwr_sta2nd_offs = 0x74,
> +		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
> +	},
> +	[MT8196_POWER_DOMAIN_DPTX] = {
> +		.name = "dp-tx",
> +		.sta_mask = MT8196_PWR_ACK,
> +		.sta2nd_mask = MT8196_PWR_ACK_2ND,
> +		.ctl_offs = 0x78,
> +		.pwr_sta_offs = 0x78,
> +		.pwr_sta2nd_offs = 0x78,
> +		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
> +	},
> +};
> +
>   static const struct scpsys_soc_data mt8196_scpsys_data = {
>   	.domains_data = scpsys_domain_data_mt8196,
>   	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8196),
> @@ -616,6 +637,12 @@ static const struct scpsys_soc_data mt8196_scpsys_hwv_data = {
>   	.type = SCPSYS_MTCMOS_TYPE_HW_VOTER,
>   };
>   
> +static const struct scpsys_soc_data mt8196_hfrpsys_data = {
> +	.domains_data = hfrpsys_domain_data_mt8196,
> +	.num_domains = ARRAY_SIZE(hfrpsys_domain_data_mt8196),
> +	.type = SCPSYS_MTCMOS_TYPE_DIRECT_CTL,
> +};
> +
>   static const struct scpsys_soc_data mt8196_hfrpsys_hwv_data = {
>   	.hwv_domains_data = hfrpsys_hwv_domain_data_mt8196,
>   	.num_hwv_domains = ARRAY_SIZE(hfrpsys_hwv_domain_data_mt8196),
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 5276adea1d04..f69cf69ba0f6 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1252,6 +1252,10 @@ static const struct of_device_id scpsys_of_match[] = {
>   		.compatible = "mediatek,mt8196-power-controller",
>   		.data = &mt8196_scpsys_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-hfrp-power-controller",
> +		.data = &mt8196_hfrpsys_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8196-hwv-hfrp-power-controller",
>   		.data = &mt8196_hfrpsys_hwv_data,


