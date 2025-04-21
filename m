Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMXw+PmwxrAjfO8VUjrovK3MKKuJexE2bKrL5R7FNS0=; b=cHe1R6RedhrGgnhRS03BYVrJor
	fO2b/NiCAW21stMXiG3DIE3BsKJeUAgF6eY6UylD2w2d9SrPd2JdeElp1LiI7mPKac15aEfysuSv5
	pOR73HhRA8JK4Bvj/H8xAZl/10iI2uJ9oSXsOPKfmsKv4woV+0ZQQITc9NkBajWm/8skiRBTAGlBk
	IL304BKPxVZf6ywSG0AYEMBHxw/kQGpNah3l8b9y+pf2ky6OJuZS/ePB3oq4mHl+DM1dyvaD7OdVf
	1i3pEXTTVeWf9vZR1yDypMS1ASe2mBy2R7b9ZRtBzu9kKRUh8HSaHg1xAtQwKZNkMm/Xxp2b0HOB2
	+R9/SiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pXw-00000004DP0-28CE;
	Mon, 21 Apr 2025 11:42:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pW5-00000004DFb-1uL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:40:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBehE7908920
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745235643;
	bh=fMXw+PmwxrAjfO8VUjrovK3MKKuJexE2bKrL5R7FNS0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mRUydRqyyHUgvdbVoUJg2XDFi0wiujx68Zz+Zf4uZtfVW8PHWHvBzhAyeE9GptwEs
	 RuhuSb8td0xm9NxguHXLUdJYfp6nQ7TZFR1Noqk2mS+Bai7iFd1zsqBibA6g8XGv17
	 eP74CrNen3NsaAvOQ9aidzkC5TeqrOtHm9GdT4YU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBehK9011764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 06:40:43 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 06:40:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 06:40:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LBegd8110641;
	Mon, 21 Apr 2025 06:40:42 -0500
Date: Mon, 21 Apr 2025 06:40:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Judith Mendez <jm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
Message-ID: <20250421114042.riw2kw472murjzcc@surfer>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_044049_584871_AB88C42C 
X-CRM114-Status: GOOD (  26.62  )
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

On 10:04-20250419, Bryan Brattlof wrote:
> On April 15, 2025 thus sayeth Judith Mendez:
> > From: Devarsh Thakkar <devarsht@ti.com>
> > 
> > For each remote proc, reserve memory for IPC and bind the mailbox
> > assignments. Two memory regions are reserved for each remote processor.
> > The first region of 1MB of memory is used for Vring shared buffers
> > and the second region is used as external memory to the remote processor
> > for the resource table and for tracebuffer allocations.
> > 
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > Signed-off-by: Judith Mendez <jm@ti.com>
> > Acked-by: Andrew Davis <afd@ti.com>
> > Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
> >  1 file changed, 90 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > index 1c9d95696c839..7d817b447c1d0 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > @@ -52,6 +52,42 @@ linux,cma {
> >  			linux,cma-default;
> >  		};
> >  
> > +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x99800000 0x00 0x100000>;
> > +			no-map;
> > +		};
> > +
> > +		c7x_0_memory_region: c7x-memory@99900000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x99900000 0x00 0xf00000>;
> > +			no-map;
> > +		};
> > +
> 
> I know this has been a push for our IPC and MCU+ teams for a couple 
> windows now, though I do want to point out that some AM62A devices 
> (AM62A12AQMSIAMBRQ1) will not even have a C7x. 
> 
> It's relatively easy to cut nodes out that describe the hardware in the 
> bootloaders, but once we start configuring them to demo something it 
> becomes impossible to unwind that during boot.
> 
> We can clam we only support the superset devices but I just wanted to 
> make this email so I could point people to it when they inevitably ask 
> why their parts do not work out of the box with Linux.
> 
> Naked-by: Bryan Brattlof <bb@ti.com>


I am confused. I do not see support for AM62A1 in upstream. We have
AM62A7-SK in upstream. I am not sure what direction you are suggesting
here.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

