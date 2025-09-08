Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D6CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA0eYhlR2xlodyIPW1bPxXyYyCye7Q6E/s6/N3iUc0Q=; b=1+hY/NkwthzWIZ1gkDWqZ0P2CO
	vDy0gZqJNQBA2vpSY0/BE/DupuPaZYHbP+wFP+9saPrTFUGgdodAX6zr7P9c+ZGBLxD1esMPuXC2c
	JITRddlXdMNMspJHBTStBAU/IbHLc93GIEuvmiPmZMVuhK8YrUP1WeM2pcGnlA6Ej7ywPnjiKaT+s
	RMm1XwHgP3ndRoZY18SrCGEVe5K0zC7SlqFtQkAYK7NfUjePlNmEHBmxsELdcI60C6vHHmezifddD
	WyvdhGeEn3fSFcdGyRz8PYlp4IlMB3+cLCPaNowylR1YvK12AGfqsm1PMylbHIYLopGdNdL36howb
	jULDU1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtN1-00000005R4n-1fBf;
	Tue, 09 Sep 2025 08:06:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlgZ-000000035sb-1QI0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Sep 2025 23:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FA0eYhlR2xlodyIPW1bPxXyYyCye7Q6E/s6/N3iUc0Q=; b=CAlHvoq/yrzYdzK/gprHFOr/KF
	+JN18l3zQonDSUBmvk/9BdAVd41hQEC8zAml0JVOUd6wVCzXOgPiT7xFuxdDovtf3cDkPl52modpn
	MysBtcoN+oHaAoDiIlgIqatOeV8zeE174pT3I8lJqXH1nseTpiDLrz8sq0UNDKCmu9JjhznxMptMR
	MVOoeC0qc3ZGHbWHEoV/oaA4umdYXxAuLLdNYhLHrYb6G8ymIPrBe2B6hz/2nethdChhtwq6An4RJ
	ArV+fv66chsgs0UifbZLZmgO8BKc8687j6jGAfAaSYJW6QAQjoEOpgdX2IF8lZgUGBDhsVz8HOV+h
	WAa2RsZg==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlgU-00000005ARF-3cAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:54:09 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Nrwco157409;
	Mon, 8 Sep 2025 18:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757375638;
	bh=FA0eYhlR2xlodyIPW1bPxXyYyCye7Q6E/s6/N3iUc0Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vl/TitJ1udI6uYa9KYx7mu/72yKTH3zGa6OSpbIxeYyxzm3fDe/X9XwYFObpZ0J2e
	 rGVkOBs31rsCt2Kb/DugcBvGgl0VX147+MjAA/4uAKL36d3y4ENcZO2HAhVQlrgEPY
	 ZzMlltj9CtczQd0UVbz0MAiDtXvWfrvHzL8ryiDw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Nrw912743428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 18:53:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 18:53:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 18:53:57 -0500
Received: from [10.247.30.162] (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588NrvkO1382580;
	Mon, 8 Sep 2025 18:53:57 -0500
Message-ID: <ce6f03fe-8d97-4146-964f-c2ba58a350c7@ti.com>
Date: Mon, 8 Sep 2025 18:53:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400
 support from common
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250908235207.473628-1-jm@ti.com>
 <20250908235207.473628-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250908235207.473628-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_005407_499291_810FCD60 
X-CRM114-Status: GOOD (  13.66  )
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

On 9/8/25 6:52 PM, Judith Mendez wrote:
> Since eMMC HS400 has been descoped for J722s due to errata i2478 [0]
> and is supported for AM62Px device, remove eMMC HS400 support from
> common-main.dtsi and include only in am62p-main.dtsi.
> 
> [0] https://www.ti.com/lit/pdf/sprz575
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
>   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 4427b12058a6..0c05bcf1d776 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -576,15 +576,12 @@ sdhci0: mmc@fa10000 {
>   		bus-width = <8>;
>   		mmc-ddr-1_8v;
>   		mmc-hs200-1_8v;
> -		mmc-hs400-1_8v;
>   		ti,clkbuf-sel = <0x7>;
> -		ti,strobe-sel = <0x77>;
>   		ti,trm-icp = <0x8>;
>   		ti,otap-del-sel-legacy = <0x1>;
>   		ti,otap-del-sel-mmc-hs = <0x1>;
>   		ti,otap-del-sel-ddr52 = <0x6>;
>   		ti,otap-del-sel-hs200 = <0x8>;
> -		ti,otap-del-sel-hs400 = <0x5>;
>   		ti,itap-del-sel-legacy = <0x10>;
>   		ti,itap-del-sel-mmc-hs = <0xa>;
>   		ti,itap-del-sel-ddr52 = <0x3>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> index 6aea9d3f134e..020bd121a6a3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> @@ -74,3 +74,9 @@ &main_gpio1 {
>   	gpio-reserved-ranges = <32 10>;
>   	ti,ngpio = <52>;
>   };
> +
> +&sdhci0 {
> +	mmc-hs400-1_8v;
> +	ti,strobe-sel = <0x77>;
> +	ti,otap-del-sel-hs400 = <0x5>;
> +};


