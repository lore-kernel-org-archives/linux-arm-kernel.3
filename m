Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1D5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wiotd6B+1eGieDOhCpr8rqMn0/5DRvIpuhZqEoZDj8w=; b=VDRbmW9Zj0bZpVbOurOsmGOT2x
	HrOm4Ht2+ixSIe6QCrUH2kD4RTN5baBTy6gc7EhquQjFEWxzvgqdd8AmTpASk2I+mgqi4gZxAQv8h
	E1D36/H2Nf8RVZZSONrn3FWvl+Z7HWqosdqrOaFjJ9+ELHhDIJrI66ZeoYvrBSCXaDlDC7seEoego
	Ao63mYsb37wpHR0Hu/Ql314BYvTpm+v8aSU126GfyYWfCa7N8BBONQfF3DecRFvJ6l8f2cDtzZuJ7
	AfLxhbXITgZCW8vmhFJ2pgmqP8Ztd0mvdNvb5nd9xiPNxj4CGBOxLnWkV/NsPogw96y8y/ABqRLam
	5V8kc0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvFi-0000000GjUC-0XL3;
	Sat, 08 Mar 2025 14:34:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvE3-0000000GjLs-2L1u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 14:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B346FA45959;
	Sat,  8 Mar 2025 14:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6DAC4CEE0;
	Sat,  8 Mar 2025 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741444345;
	bh=vImS6KlVH00/hRc3EcVeL0uqaFnM69ue2lZAlyRA/9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IlEoUUstB2MiybBJBTKMllgwYsFDPeSHOhGG6m4hTVlLUjRpyvyixIXRG26fmN8Ra
	 aNZ/0OYxpGgXPVtzs2waux+RgLplax430MqN7G8TI67CDTjKgRhbOxxqfP8b0gMWAo
	 DkZRAblakClsZuFG1tU/Iq//gnxQZqhd0hloGDaYD03CicndtMmpfR2sIRU+2BEEl8
	 3Og3cRX9wFmCTq/7IV3SB7oM8TgrTgt4dPOzOyu7sIy+jSARIxYIr04A3EFQ8HdIhZ
	 sUkqeN6sWA1CYiDMAkqlgnuW9RNGcr1KufAzEaqnRt4MhHzuguBGBWvabgG4cxFXoR
	 BORMvUulRsjWw==
Date: Sat, 8 Mar 2025 14:32:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC
 DRIVER" <linux-iio@vger.kernel.org>, "open list:NXP i.MX 7D/6SX/6UL/93 AND
 VF610 ADC DRIVER" <imx@lists.linux.dev>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add i.MX94 and i.MX95 support
Message-ID: <20250308143214.6dcc41ac@jic23-huawei>
In-Reply-To: <20250307-county-dissuade-eed621016369@spud>
References: <20250306170825.239933-1-Frank.Li@nxp.com>
	<20250307-county-dissuade-eed621016369@spud>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_063227_672844_29D4C233 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

On Fri, 7 Mar 2025 15:58:34 +0000
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Mar 06, 2025 at 12:08:25PM -0500, Frank Li wrote:
> > Add compatible string "nxp,imx94-adc" and "nxp,imx95-adc", which is
> > backward compatible with i.MX93. Set it to fall back to "nxp,imx93-adc".
> >   
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
Applied - thanks,

