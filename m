Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721CEC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9x0SsBTG97m/aMrnNs3+hwttNW5WG7Q12RR+rw5dq0=; b=KZxAKsqg7mvxtSbB0zrq3PWWh3
	Jn2Vnbgd2+2IoYs9sfVhYWlumBBftlQiFiBGsU4+SqQRSPfd1VRmjsEv+m8iI5VG73Ykutrg4Gi4k
	e/gfVTkQcaNVtD9KCnXtt8gOscv0t6+DBkELTxUdtKJuZ3Ly6/dU+IymGvxion5CQmu5fuDK1Sd70
	5XLBxLmYFlPoFLSWgpLAk+juPKpm8XUhsAnFkXxxZRIqZN+EXzUaCHyuJBF2GyYUpaksKGnBoQmz4
	+D4y0dxFinlF2tx55QtusruNdDm0YKJtbYtnI/SIWQbQ4tOoLkJgWiJWI/OttiRrJCtUZ7DdBX7YX
	wc12afgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOt2-00000005SPI-2fl6;
	Wed, 26 Feb 2025 21:24:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOrT-00000005SJr-45t7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:22:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnOrD-00085X-L1; Wed, 26 Feb 2025 22:22:19 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnOrD-0030wc-0f;
	Wed, 26 Feb 2025 22:22:19 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnOrD-001fiU-0G;
	Wed, 26 Feb 2025 22:22:19 +0100
Date: Wed, 26 Feb 2025 22:22:19 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Message-ID: <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_132236_012661_04B67EE1 
X-CRM114-Status: GOOD (  26.56  )
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

Hi,

On 25-02-26, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The AIPSTZ bridge offers some security-related configurations which can
> be used to restrict master access to certain peripherals on the bridge.
> 
> Normally, this could be done from a secure environment such as ATF before
> Linux boots but the configuration of AIPSTZ5 is lost each time the power
> domain is powered off and then powered on. Because of this, it has to be
> configured each time the power domain is turned on and before any master
> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

My question still stands:

Setting these bits requires very often that the core is running at EL3
(e.g. secure-monitor) which is not the case for Linux. Can you please
provide more information how Linux can set these bits?

Regards,
  Marco

> The child-parent relationship between the bridge and its peripherals
> should guarantee that the bridge is configured before the AP attempts
> to access the IPs.
> 
> Other masters should use the 'access-controllers' property to enforce
> a dependency between their device and the bridge device (see the DSP,
> for example).
> 
> At the moment, we only want to apply a default, more relaxed
> configuration, which is why the number of access controller cells
> is 0.
> 
> The initial version of the series can be found at [1]. The new version
> should provide better management of the device dependencies.
> 
> [1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/
> 
> ---
> Changes in v2:
> * adress Frank Li's comments
> * pick up some A-b/R-b's
> * don't use "simple-bus" as the second compatible. As per Krzysztof's
> comment, AIPSTZ is not a "simple-bus".
> ---
> 
> Laurentiu Mihalcea (5):
>   dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
> 
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  3 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  9 +-
>  drivers/bus/Kconfig                           |  6 ++
>  drivers/bus/Makefile                          |  1 +
>  drivers/bus/imx-aipstz.c                      | 92 +++++++++++++++++++
>  6 files changed, 194 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>  create mode 100644 drivers/bus/imx-aipstz.c
> 
> -- 
> 2.34.1
> 
> 
> 

