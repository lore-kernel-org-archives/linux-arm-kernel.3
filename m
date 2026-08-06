Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC1C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XllXt40MUZTpJoHsg0rQ8AaWK9M0xp6NH1sMMydFWzY=; b=xOx+LDryM0REwpMr/LDAssoDwp
	vRAiBMskY9XZfVuVg0picsaKHl74NLcB1xbiuz/mvmuHePvnQ5+v83hMMS19j2wp8hK44mH6biVDb
	h8tdLBuRB5D22YiWWRjoKrdkCHDG8SYEBLVMRlevhTc4zENVI/HYNLNarnP1ScZvj13jAu7ZefAER
	oInuQptaPLzhce5ZkQ0NmdugWF0oFoTZ/sm7xbPIPl/rVoepIYMbLM6UNXXTo0p6duSdddULQh2gY
	kiGKlwZJjyhac+3Kvh2vRki7+rwr+NoLkuQPSrTb4bNK03c1vvKhU/J+kqhq1Yyhfi9J1lCsBzGLH
	trHga5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0va-00000006Cvi-2Dq1;
	Thu, 06 Aug 2026 16:26:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0vZ-00000006Cuf-0Fpi;
	Thu, 06 Aug 2026 16:26:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBDEE40BCD;
	Thu,  6 Aug 2026 16:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049671F00A3D;
	Thu,  6 Aug 2026 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033600;
	bh=XllXt40MUZTpJoHsg0rQ8AaWK9M0xp6NH1sMMydFWzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l3NwEX/z5skYEOOPYlbVrKK/LpoDHH26KZvyAzb+p0dwEpi2yA4MOzDaeePfICbpz
	 2o+0GqyrFuK3bGQ2xUpuhS0qbz69MNtN+ETiaumch3AEp1MCCraAVcFRIKRfr8eI05
	 1NlZxgNGX3JuOIRmRZWiP8JXT9GpXqz/y5pRNXFWYKZpD45OOWknZ/c7ominD3VDzr
	 KNrTgADqCkgRW+Z42vUNBy8ZFhar3DjydPyM/idNnkHxV/3HDAqY7b6qLsCHILywAi
	 OsIAumKY4cwrSXt1/ksHedWBwwxCJc4/i29zo78kxSukK4TeeDgfzOdoIMDPPtzruX
	 KqOWNB/67eyiw==
From: Vinod Koul <vkoul@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, haibo.chen@oss.nxp.com
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Haibo Chen <haibo.chen@nxp.com>, qijian.guo@nxp.com
In-Reply-To: <20260730-can-share-silent-v1-0-63fd603f943d@nxp.com>
References: <20260730-can-share-silent-v1-0-63fd603f943d@nxp.com>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: imx95-15x15-frdm: support CAN
 transceivers sharing a silent GPIO
Message-Id: <178603359460.674490.14449067344629912709.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:34 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 30 Jul 2026 12:33:25 +0800, haibo.chen@oss.nxp.com wrote:
> On the i.MX95 15x15 FRDM board the two CAN transceivers (attached to
> flexcan2 and flexcan5) share a single "silent" control pin, which is
> routed through the on-board PCAL6524 GPIO expander. Both transceiver PHY
> nodes therefore reference the same GPIO line for their silent-gpios
> property.
> 
> This series makes that sharing work correctly and puts the transceivers
> into the proper default state:
> 
> [...]

Applied, thanks!

[1/3] phy: phy-can-transceiver: default silent GPIO to high during probe
      commit: c3b0bb15ef001703b00d79bc4928e7421e24280d

Best regards,
-- 
~Vinod



