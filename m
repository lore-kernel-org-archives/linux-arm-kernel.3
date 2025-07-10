Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5B9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67Mt84dlbu0xtwxBGwYkDpISqaxe7nX50EapXSTnVt0=; b=wjRS5hiqrat/D58bp6caKGEBHH
	74qEea+GxoOLtVpOkpS2tL9gV8i9raQ2RoIgCBMEPCG2vDKMMxqVCooVCfEWkw8N2oTxjhyHHNKJi
	gYsbzZqbMGzVTY9pSxu2i9HsGtt4N+Rtz78h23Goh+HHKjvr9woZgzevkuGF8xuM1Qk70MDw12xvT
	7MUEenLxp36Zz/JdQsY2u9Za5t+NwcnNdwrRgZZbCVRPUxQoU+1bw9Xie0cvL6di+Kfuky4a7FpRG
	DRZoG6gCns6vXk0Q9x287Jg5wyEiDEmA3fYY1QjfmvAf3tA+UuPGvw0vccRaezXyCmBvFqMYW73HO
	FEIPBsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs9w-0000000C65h-3qCJ;
	Thu, 10 Jul 2025 14:22:00 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqT8-0000000Bmht-0GHT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:33:43 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56ACXc0Z1504996;
	Thu, 10 Jul 2025 07:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752150818;
	bh=67Mt84dlbu0xtwxBGwYkDpISqaxe7nX50EapXSTnVt0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qxMn5dRUXXIwAR+d2S2sM+9gaO/zjfqdV7Vn7DpyBnCdyN3zehz+qpwWARPNbeqaS
	 6XyKfIhMKJLHGEJEMu/KD2iyn9Ki4bnctj8kTrdXmI+1OlMlgKUpNY1n8OREW3byB3
	 uDr/zlOGy2nk6T2OSpiAEurSEHhhPbRyXVvc+3g8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56ACXcRo3499436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 07:33:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 07:33:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 07:33:37 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56ACXbZ01342395;
	Thu, 10 Jul 2025 07:33:37 -0500
Date: Thu, 10 Jul 2025 07:33:37 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am65: add boot phase tags
Message-ID: <20250710123337.ltnfhtpxaisi2yu3@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com>
 <20250709-65-boot-phases-v1-1-e1f89d97a931@ti.com>
 <83c5d0b8-add8-4db7-bcde-5b17c796b53a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <83c5d0b8-add8-4db7-bcde-5b17c796b53a@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_053342_252934_67F4C22B 
X-CRM114-Status: GOOD (  17.57  )
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

On July 10, 2025 thus sayeth Vignesh Raghavendra:
> 
> 
> On 10/07/25 04:05, Bryan Brattlof wrote:
> 
> [...]
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> > index 7cf1f646500a16c1d1bac6dfb37fb285218063b3..5bbd817bc51464f6605c5b2dc9cb544a109a695d 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> > @@ -211,6 +211,7 @@ mcu_ringacc: ringacc@2b800000 {
> >  			ti,sci = <&dmsc>;
> >  			ti,sci-dev-id = <195>;
> >  			msi-parent = <&inta_main_udmass>;
> > +			bootph-all;
> >  		};
> >  
> >  		mcu_udmap: dma-controller@285c0000 {
> > @@ -235,6 +236,7 @@ mcu_udmap: dma-controller@285c0000 {
> >  			ti,sci-rm-range-rchan = <0xb>, /* RX_HCHAN */
> >  						<0xa>; /* RX_CHAN */
> >  			ti,sci-rm-range-rflow = <0x0>; /* GP RFLOW */
> > +			bootph-all;
> >  		};
> >  	};
> 
> Should this be board specific property? Does every user of AM65x need
> DMA at boot stage?
> 

Yeah. I'm not too sure how we want to handle this. Some boot modes will 
require DMA up and running, but if a board only uses eMMC then we won't 
need DMA during the early phases of boot.

I saw we already do this for the AM62P so I decided to keep moving in 
that direction even though it's not a perfect and it seemed like a 
better solution than dragging the DMA node up to the board level.

I'll drop it for now until I can think of a better idea.

> [...]
> 
> > @@ -107,5 +111,6 @@ wkup_vtm0: temperature-sensor@42050000 {
> >  		reg = <0x42050000 0x25c>;
> >  		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
> >  		#thermal-sensor-cells = <1>;
> > +		bootph-all;
> 
> Same here..
> 

Yeah I'm assuming this is one of those weird things being in the middle 
of the Jacinto and Sitara class causes. It's used, much like the rest of 
the Jacinto parts, by the bootloaders to get at the voltage domain info 
to configure the OPP data before the bootloader starts the A53s.

All AM65x boards will need this node to prevent an overclocking situation 
if the voltage isn't high enough.

~Bryan

