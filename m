Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A0103E2E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 22:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9qeBcNiCkaJGrCClysKD1REtRiZH+3ZC7cQ5ovRvnA=; b=iEO4MHuJuXnxph5y0xgizFIA9T
	r/fYHCE7yizQRaawK+8s9ca88aBNSZzoP9Q2qxYHf/EDMv2tfwtinlNSXqmpDfgEKxlj/E/9/yJgm
	vdzedJaV3iFM7W8C/MFqDag5vr5s1nkIp/MV5HoQoKhaqhbxGwXZhYb4aGTB1UTQvWjdej1igOvz7
	861oW2n7HH3yix156Ot8J1pTejES1aBWnaGFD+QJcj3XnPvGWoqjqLTL/qjuHmuiGTiVO4M18zz2P
	UNZyoUI9Y9q/fWIx4NYLrIxJiucCwCQfGu5Rdyhck+L0ONHr0GgNkzP3ksmuy41qHK36iGKBXJHSn
	FKaj0pfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rw8-0000000CevJ-04Hp;
	Wed, 11 Mar 2026 22:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rw6-0000000Ceum-1K7P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 22:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B1C436C1;
	Wed, 11 Mar 2026 22:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B426C4CEF7;
	Wed, 11 Mar 2026 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773267709;
	bh=WK3QT8rOLHjpCFW78jHwvfMiwloIaFd16wfM+ic7+OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkrD9TeAacpCbTlpV9TAeDLGkfF4fHWFTj6DRcwOFitcdOtMln7oUjJAHTm9qjYOF
	 NibmVmwv0tyKrc+UJjv5ebCCpVPdo7u5/pQ4FxH+91sJpsWvYzxgw9qHC0vMUEOZ5t
	 P9zkLDW8P0VXMwVzN1uUFnzcg58I9R0iHs7vPoMGgNyjQRfRS2M9tItEFXQjqByvtN
	 qNg3rRYp8kvXbsI9ZXcCWK9v/GiYVc4KwtDQdaogZTbZ9luZmn+H9lhwjsfASmmR+1
	 IPBYotdafQoHWzPEtjkgzQ7wdr8aXm5UXob7ENNIrQNwfgbW9i5A85yMEoIj07x4aR
	 qY65/2dBPq/5Q==
Date: Wed, 11 Mar 2026 17:21:48 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Message-ID: <20260311222148.GA875265-robh@kernel.org>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
 <87h5qmraum.ffs@tglx>
 <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_152150_374465_07829452 
X-CRM114-Status: GOOD (  17.20  )
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

On Wed, Mar 11, 2026 at 11:50:44AM -0400, Frank Li wrote:
> On Wed, Mar 11, 2026 at 10:09:37AM +0100, Thomas Gleixner wrote:
> > On Wed, Mar 11 2026 at 09:11, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > Add support for the interrupt steering controller found in NXP S32N79
> > > series automotive SoCs.
> > >
> > > The S32N79 IRQ_STEER variant differs from the i.MX version by not
> > > implementing the CHANCTRL register. To handle this hardware difference,
> > > introduce a device type data structure with quirks field. The
> > > IRQSTEER_QUIRK_NO_CHANCTRL quirk skips CHANCTRL register access for S32N79
> > > variants.
> > >
> > > The interrupt routing functionality and register layout are otherwise
> > > identical between the two variants.
> > >
> > > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > I've picked up this one. Can the ARM64 folks please pick up the DT muck
> > as that really has close to zero relevance to irqchips.
> 
> Did you pick binding one?

The replies to the thread clearly say what was applied.

> PATCH v6 1/5] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
> 
> I have not founnd at linux-next yet.

Please take the binding with the .dts file changes.

Rob

