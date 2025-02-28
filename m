Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F053C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WazccXwMSXcNHgQGS2K75mUfu12ocGCld1cYtSPawdo=; b=fDtZpcKxqe6RoArolbEfRLR7v0
	eusLAHXHEEfUk1532SZ/aEKnB9bvT0MW4Pebg4lOp0NBz8kB+iln6/qWg1HANWl0CongxlpxvhdqC
	mXAZz3q8bLrS+HlHYZPveeIBv8wpcb/ut2x0/X1R+gJNYTelYK15MMuGDs3Kr05iwaw6svnJgpXyg
	vd4mutv95cN+ZbXqITrVU3PPxxQeg62z2NwXAPqCjPBIoAjqFodcWBc+xuPvI82eJhdJw4tRn3eHN
	YUtwnamEMHAjO9zyjWYa1EXT4BFMcTCRm87jpFMjo7GYqi61HWoE0mJdN/Hp6oaPV7wmyw2w1zszV
	hxmsHOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0pf-0000000B9BE-09HB;
	Fri, 28 Feb 2025 13:55:15 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0o5-0000000B8pE-0JxD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:53:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SDrPWX2066472
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 07:53:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740750805;
	bh=WazccXwMSXcNHgQGS2K75mUfu12ocGCld1cYtSPawdo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dI3nKdmtlYhflNq2aSAika4XzI51SZpqAznSBVM4M4ryK+8PrgEN8pYPoiielo0mM
	 NUFBCOGHkp/HzHO4xfDbsXBq2gS1v4A1UDfSyyyRcoyeIw9FJxxpgFdecqFr4nVMnv
	 D8jEzkjUshjgHcMxFUMb0wSVmB4fZUyddF8U01XA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51SDrPVL008551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 07:53:25 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 07:53:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 07:53:24 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SDrOXK072506;
	Fri, 28 Feb 2025 07:53:24 -0600
Date: Fri, 28 Feb 2025 07:53:24 -0600
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Jayesh Choudhary <j-choudhary@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Message-ID: <20250228135324.jy3qumbg4rg2kdih@factsheet>
References: <20250206153911.414702-1-francesco@dolcini.it>
 <20250207014239.xzm6rfnusckql2uo@litigator>
 <Z6XFPYaj069fvW1h@gaggiata.pivistrello.it>
 <20250228124347.GA20656@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250228124347.GA20656@francesco-nb>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_055337_272220_B9181F4F 
X-CRM114-Status: GOOD (  35.57  )
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

On 13:43-20250228, Francesco Dolcini wrote:
> On Fri, Feb 07, 2025 at 09:33:01AM +0100, Francesco Dolcini wrote:
> > On Thu, Feb 06, 2025 at 07:42:39PM -0600, Nishanth Menon wrote:
> > > On 16:39-20250206, Francesco Dolcini wrote:
> > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > 
> > > > On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
> > > > external peripherals when configured through CTRL_MMR, so add the
> > > > clock nodes.
> > > > 
> > > > Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > > index 420c77c8e9e5..4b47b0774330 100644
> > > > --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > > +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > > @@ -42,6 +42,26 @@ &inta_main_dmss {
> > > >  	ti,interrupt-ranges = <5 69 35>;
> > > >  };
> > > >  
> > > > +&main_conf {
> > > 
> > > 	Why not add it to main_conf section it self in the file?
> > 
> > The reason is that main_conf is defined in k3-am62p-j722s-common-main.dtsi,
> > that is shared between am62p and j722s.
> > 
> > On j722s the audio refclk is added in k3-j722s-main.dtsi the same way as I did
> > here, so I cannot move this to k3-am62p-j722s-common-main.dtsi without updating
> > also k3-j722s-main.dtsi.
> > 
> > I looked into the differences of j722s and am62p, and from my understanding,
> > from the audio refclk point of view, they are identical (same IP, same reg, same
> > clocks and same IDs), so this should naturally be moved to
> > k3-am62p-j722s-common-main.dtsi as you are suggesting.
> > 
> > ... however, for some reason I am not aware of, on k3-j722s-main.dtsi a different
> > parent clock is used, and I cannot understand the reason. The actual parent clocks
> > in this patch are just the same we already have everywhere apart on j722s. I tried
> > to look at the history of this and it seems that on the TI downstream kernel branch
> > this is defined in the board dts file (!) and this confused me even more.
> > 
> > So, not wanting to break stuff I was not able to understand I came up with this
> > proposal.
> > 
> > An alternative could be to override the "unexpected" clocks from
> > k3-j722s-main.dtsi to the board dts file, and have the "standard" clocks, as
> > proposed in this patch and already used on all the other AM62 variants, in
> > k3-am62p-j722s-common-main.dtsi.
> > 
> > +Jayesh that is the author of this specific change in k3-j722s-main.dtsi.
> 
> Jayesh, Nishanth, any comment on this?
> 
> Should I proceed with this last option ?
> 
>    An alternative could be to override the "unexpected" clocks from
>    k3-j722s-main.dtsi to the board dts file, and have the "standard" clocks, as
>    proposed in this patch and already used on all the other AM62 variants, in
>    k3-am62p-j722s-common-main.dtsi.
> 

no, with your explanation it is clear that your patch matches with the
strategy we are using currently.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

