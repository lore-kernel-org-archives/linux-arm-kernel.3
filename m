Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA1D32D9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqpSkQndjhBhUEMoFtHyO1I29YWworI5OqjxWif5CT8=; b=c5zz7g9Ng9cloIVoczZNW1nu/v
	SbZWN6G6H4zKaUThquWq48psIlY6qK6cHhvzDoo0NB3gEi9OyLkLSHzPEPbjIZJuD/TW+X+n3bfws
	tqHG65Bu1ROApTjGHdFt4XnoSXryjyb1vhyJAlVok/JEtAjcf2nButU1nxYVpxvMIefDN/2PbFXd6
	Uw5sWh/MnCoAjTK6YddOEClAqRws+Z5wbs17VSs7xdjdqDbCWl96ybCmX6/VSgo703LCRsX1nFhfX
	wuGU9CfLx73mtBbD6pRSP15KDrr2ceCPBsl7cOXQReuKmxbNM05KjfvPfsMA8IrkFW0iKbTQrbvES
	5MT5uI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqAU-00000003Pzj-2myF;
	Tue, 12 Nov 2024 12:38:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAq8h-00000003Pmz-0Dsr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 12:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AA8F5C5557;
	Tue, 12 Nov 2024 12:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF18C4CECD;
	Tue, 12 Nov 2024 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731415018;
	bh=Kjm50GlWkADfbPmKO9HpqOyEB9KY9gzdVAbYexdFo5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5qsyFywbupCvXB6XPv88BdVgDCVY8j19r2OBJNz44yyUew+kON1s8Nbj9akYVB+a
	 t479ehr4IbvuqLJqMmNw0aH1nyhaxOqpkMCOop7Ct7OvWGEKIZYJxJSc5+P1cf9++c
	 FD62zxAqP8t7wf30/UtHkgHLEQDbXTlpYlXrPn8Uc/KhWTJ4oVbgWrj8b41UCgcQIs
	 sv4E9B4Evoyjdq42l3Tk30TnzHhXZ8Ish2MogKlOp8w8BJuym0tR+l6ksNdZavsOwW
	 xE0N1+4XWPf0vr5wkzYj9veuWzOZqc58G7WGRxioBu9e4FEM7SM+MMJKf+qMxTDdXr
	 lqVmosCZUgf7A==
Date: Tue, 12 Nov 2024 13:36:51 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: frank-w@public-files.de, Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <linux@fw-web.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
Message-ID: <ZzNL4_dFxHfMmMcR@ryzen>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <e534c723-6d65-433f-8ab5-1c0d424d7367@lunn.ch>
 <9B1A5D20-3DE5-40C1-8B2D-B1C4F53FA5F4@public-files.de>
 <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_043659_154518_92D09C0F 
X-CRM114-Status: GOOD (  18.71  )
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

On Mon, Nov 11, 2024 at 10:25:12AM -0600, Rob Herring wrote:
> > >
> > >I don't know the yaml too well, but it is not obvious how adding a few
> > >status = "disabled"; status = "okay"; fixes a "'anyOf' conditional failed".
> > >
> > >Maybe you can expand the explanation a bit?
> > >
> > >       Andrew
> >
> > Hi angelo,
> >
> > I guess the dtbs_check only checks required properties from yaml if the node is enabled.
> 
> Yes, that is exactly how it works.
> 
> Rob

Hello Rob,

If we look at e.g. this binding:
Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml

We can see that it does not define iommu-map in the binding,
likewise the binding does have:
unevaluatedProperties: false


If I apply my patch that adds iommu-map for e.g. the pcie2x1l0 node:
(the patch does not add anything to the binding above):
https://lore.kernel.org/linux-rockchip/20241107123732.1160063-2-cassel@kernel.org/


If look at the pcie2x1l0 node, it is marked as status = "disabled"
in arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi

but is marked as status = "enabled"
in arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts

If I run CHECK_DTBS for this dts/dtb:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CHECK_DTBS=y rockchip/rk3588-rock-5b.dtb
  DTC [C] arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
$ 

No warnings.

What am I missing?

Considering the warning in this series where the binding also
had unevaluatedProperties: false
I would have expected the same error for the pcie2x1l0 node.

(And if I look at most PCI controler bindings, they actually do define
iommu-map, so it seems a requirement for it to be defined if used.)


Kind regards,
Niklas

