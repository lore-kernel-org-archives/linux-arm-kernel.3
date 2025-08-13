Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf4QMOKCM8hhstIOFq4mmBgauUmy4hPCYZMFfBI8pjY=; b=hJwKslV/aj8JGj+ZxuhVpl7U4q
	VTDSSpQsIUwU21OEnonHmfNiuIITBD8fevCC7k266knx36EQsl4KM4JQrHSg2hsqy/3Nz5AZjpTR7
	QJTEIEMmHZtDOmEATuN/1LQinJtonre5RScGBUBFwBRd9ifoyzAianXUVe5h5PSy4BoKZWfjZVcDF
	j/RiNXuPkdsCqWJohZapYGBF0oeKW+SSRelytb4NjC5Rxf7D+oWQMwgubtXJhQYWc7Dh6puo9HYBv
	QBvWHHt6ZQpMCCL04GSwSbp2ExRzZ9hTM4Bs5fBwNxVMcBc2d3K6Ndb+iRmUs/4T+6w+ksZy9kIf7
	RboMvh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPk-0000000ErCy-15jF;
	Wed, 13 Aug 2025 19:45:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFvN-0000000EgpL-3M1p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:10:11 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DIA2EK2130945;
	Wed, 13 Aug 2025 13:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755108602;
	bh=Kf4QMOKCM8hhstIOFq4mmBgauUmy4hPCYZMFfBI8pjY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=t29oYtzqBIte/vnOK3HJHayyknWOjtNHsT6a/u5o1baZnGu+Va+BjveDznPpauD6N
	 Twwf2+X6oOnB4k2sVWNjzFw8FZvG7uDCZYOmniDJU42T+McTz8BI8jcOI+FPF65cWi
	 QOIeszOOvtYm9ck1v/rnLodTACGdymkkBN8V8K9g=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DIA2kF245357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 13:10:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 13:10:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 13:10:02 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DIA2Wk2692823;
	Wed, 13 Aug 2025 13:10:02 -0500
Date: Wed, 13 Aug 2025 13:10:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>,
        Michael Walle
	<mwalle@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
Message-ID: <20250813181002.33kylnrbwzpclgvf@browsing>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-2-rs@ti.com>
 <20250813151721.nc5fr3qmro5grlda@steam>
 <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_111009_971834_65428A2D 
X-CRM114-Status: GOOD (  19.99  )
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

On 12:56-20250813, Randolph Sapp wrote:
> On Wed Aug 13, 2025 at 10:17 AM CDT, Nishanth Menon wrote:
> > On 18:25-20250808, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >> 
> >> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
> >> 
> >> These devices specifically do not set the dma-coherent bit because they
> >> do not use the same MSMC configuration as other BXS-4-64 enabled TI
> >> platforms.
> >> 
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>  .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> >> index 2e5e25a8ca86..a51db8f9dff8 100644
> >> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> >> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> >> @@ -690,6 +690,19 @@ ospi0: spi@fc40000 {
> >>  		};
> >>  	};
> >>  
> >> +	gpu: gpu@fd80000 {
> >> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> >
> > Note the discussion in https://lore.kernel.org/linux-arm-kernel/DBE4UO2RGAYX.17V1DAF8MQYJM@kernel.org/
> >
> >> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
> >> +		clocks = <&k3_clks 237 1>;
> >> +		clock-names = "core";
> >> +		assigned-clocks = <&k3_clks 237 1>;
> >> +		assigned-clock-rates = <800000000>;
> >> +		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> >> +		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
> >> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
> >> +		power-domain-names = "a", "b";
> >> +	};
> >> +
> >>  	cpsw3g: ethernet@8000000 {
> >>  		compatible = "ti,am642-cpsw-nuss";
> >>  		#address-cells = <2>;
> >> -- 
> >> 2.50.1
> >> 
> >
> > Is the issue that Michael reported
> > https://lore.kernel.org/linux-arm-kernel/20250716134717.4085567-3-mwalle@kernel.org/
> > resolved?
> 
> Define resolved. If by resolved you mean using the same hack we have had on the
> out of tree module for years, then yes it is resolved.

Please share a bootlog with gpu and linux-next kernel with just this series
applied? Please provide complete lsmod and cat /proc/interrupts for
reference.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

