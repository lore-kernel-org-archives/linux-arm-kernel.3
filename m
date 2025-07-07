Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo8GlPlpcPOwxthw7SGsFbB7w1B5S5gcIxQJjPbMTCY=; b=uD2scA1qF72YY0xgtl9H5MwTFq
	xkHdfutIBESw7wgFpyueISuRvSe34omp/juaEyzkjnjLB9rVO9lLuM44A0N5ObApWBfY5YrqN/Gqc
	Vvf1vgc+9GvDDIbdNDFmVDoxWQRj/PyvFBRJbCwuMrUUOuUeP4qUIb0QM6OOcmq79o3XL55u0h1Xy
	EsrlwXcUnwmHJjrbLd6mJn0073H7x9mfHPyN868010Dm1sazpbXogvkwznCDbzve6POc/peFD4Inn
	eU4oVC9TKKixi0uXii+gyttYAb6jxoiefHNBQDCZkeOMbcyXwyD1ky6qJ+kAyq7hEBDb1TcRTbZu6
	TwWLcU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpTu-000000039EC-2BXo;
	Mon, 07 Jul 2025 17:18:18 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoqw-000000032Q7-1fvC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:38:03 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567GbqF1926314;
	Mon, 7 Jul 2025 11:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751906272;
	bh=Yo8GlPlpcPOwxthw7SGsFbB7w1B5S5gcIxQJjPbMTCY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E35Ov+YVY96K9q1OgYyC5puitBIa20zxW6pNatRkP71q82KD26a3/rQLdmVHnPP9R
	 EFAe4r3VkujWq3FmdCWpJOGxvlpVK8qPzkmfkIYREG0NoHv4+tohADiOIBtHxvvVXc
	 ElspPq7yY03g2TNGPEfNrMww5ug42ofCRg9xF4rM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567Gbq3U603028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 11:37:52 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 11:37:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 11:37:51 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567GbpWb522914;
	Mon, 7 Jul 2025 11:37:51 -0500
Date: Mon, 7 Jul 2025 11:37:51 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/4] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250707163751.5tr4shordeqwwnqd@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250704100954.2231853-1-p-bhagat@ti.com>
 <20250704100954.2231853-5-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250704100954.2231853-5-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_093802_522361_D9B78817 
X-CRM114-Status: GOOD (  14.29  )
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

On July  4, 2025 thus sayeth Paresh Bhagat:
> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> designed for AM62D2 SoC from TI. It supports the following interfaces:
> 
> * 4 GB LPDDR4 RAM
> * x2 Gigabit Ethernet expansion connectors
> * x4 3.5mm TRS Audio Jack Line In
> * x4 3.5mm TRS Audio Jack Line Out
> * x2 Audio expansion connectors
> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> * x1 UHS-1 capable micro SD card slot
> * 32 GB eMMC Flash
> * 512 Mb OSPI NOR flash
> * x4 UARTs via USB 2.0-B
> * XDS110 for onboard JTAG debug using USB
> * Temperature sensors, user push buttons and LEDs
> 
> Although AM62D2 and AM62A7 differ in peripheral capabilities example
> multimedia, VPAC, and display subsystems, the core architecture remains
> same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
> necessary overrides will be handled in SOC specific dtsi file and a
> board specific dts.
> 
> Add basic support for AM62D2-EVM.
> 
> Schematics Link - https://www.ti.com/lit/zip/sprcal5
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile          |   3 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 617 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  20 +
>  3 files changed, 640 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

