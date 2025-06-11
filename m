Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4502AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+Ei0nVTdPkuikDxd53VFZwYxoc432vn+t6Xh2VDjE0=; b=0zf9zoBE8OMuVbFbDVrgrJhCcG
	lgZ+eQricXcxHzZrXUth71MG0fcuRUp7f/9NetEhfldRh+KJLkE+uAYfsLtmQq5fig9zz0A/DNzQ5
	wfOqkMNc0LesDt5X+WFiaIaLKWt3fViDmD9ePo5Oswn9Ulq8UMt+b5Vc+5UGgaZ/I/C33RPWgKjLN
	apt99mPhOjDM36iIthp3MGYkhV5DLmKYevhbZhbmmmDLJHwCNv7oJgn0esuFrR0ISJOzEoZwbl2Jt
	ObD9P2FZ9q7kaNlnrkY8mbGWAphDFozlb+9agwkZaAm9QO3ffInt2lot96xJiGV9YModgOPPG+ODH
	XRPCN2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU1K-0000000BUK3-3BEl;
	Wed, 11 Jun 2025 22:34:10 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSlZ-0000000BG4B-2mEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 21:13:51 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BLD7hs1489819;
	Wed, 11 Jun 2025 16:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749676387;
	bh=P+Ei0nVTdPkuikDxd53VFZwYxoc432vn+t6Xh2VDjE0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dE0mmlgJbKsvhfBls2pR1EbemC7uEJZuES1EahQoc8L6WSOnP8d1R9evWoC6GzdP3
	 oeZpSbqnZmO5dq24iQEK0m9FEziQiySjMvgU0x0naAIIDm3umuYzmD6IUgybyolKJc
	 hG6C/5SmGkOAHrNVcr2M3+Jm9jQXsDOCg+Hx05JM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BLD7Iq1414936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 16:13:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 16:13:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 16:13:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BLD55v923069;
	Wed, 11 Jun 2025 16:13:06 -0500
Message-ID: <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
Date: Wed, 11 Jun 2025 16:13:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>
CC: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250609-bbg-v2-5-5278026b7498@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_141349_865049_51E05C45 
X-CRM114-Status: GOOD (  13.78  )
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

On 6/9/25 10:43 AM, Kory Maincent wrote:
> Enable the TPS65219 regulator in the defconfig, as the TPS65214
> variant is used by the newly introduced BeagleBoard Green Eco board.
> 
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   arch/arm/configs/omap2plus_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 9f9780c8e62a..2ad669f7b202 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig

Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
boards with those can/should use multi_v7_defconfig.

OMAP1 and OMAP2 are the only devices that cannot use multi_v7_defconfig
as they are not ARMv7. So I'd almost recommend we rename
omap2plus_defconfig to just omap2_defconfig to avoid more confusion.
Then we would have:

OMAP1:  ARMv4/5: omap1_defconfig
OMAP2:  ARMv6:   omap2_defconfig
OMAP3+: ARMv7:   multi_v7_defconfig

Any issue with that I'm missing?

Andrew

> @@ -385,6 +385,7 @@ CONFIG_TOUCHSCREEN_TSC2007=m
>   CONFIG_INPUT_MISC=y
>   CONFIG_INPUT_CPCAP_PWRBUTTON=m
>   CONFIG_INPUT_TPS65218_PWRBUTTON=m
> +CONFIG_INPUT_TPS65219_PWRBUTTON=m
>   CONFIG_INPUT_TWL4030_PWRBUTTON=m
>   CONFIG_INPUT_UINPUT=m
>   CONFIG_INPUT_PALMAS_PWRBUTTON=m
> @@ -454,6 +455,7 @@ CONFIG_MFD_TPS65217=y
>   CONFIG_MFD_TI_LP873X=y
>   CONFIG_MFD_TI_LP87565=y
>   CONFIG_MFD_TPS65218=y
> +CONFIG_MFD_TPS65219=y
>   CONFIG_MFD_TPS65910=y
>   CONFIG_TWL6040_CORE=y
>   CONFIG_REGULATOR_CPCAP=y
> @@ -470,6 +472,7 @@ CONFIG_REGULATOR_TPS65023=y
>   CONFIG_REGULATOR_TPS6507X=y
>   CONFIG_REGULATOR_TPS65217=y
>   CONFIG_REGULATOR_TPS65218=y
> +CONFIG_REGULATOR_TPS65219=y
>   CONFIG_REGULATOR_TPS65910=y
>   CONFIG_REGULATOR_TWL4030=y
>   CONFIG_RC_CORE=m
> 

