Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FD7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/mEWC41EA0vCmjlY8EkWcUAHNNZ3z1r6/icvt8x6x4=; b=FnnI8N1kedK9dH5VbRJfBaLdaZ
	sEbPOwOz2aDFACrsKU1iV71NbbIod0gxuf4LryMlB+sE+6+M8Kd/A84SHjfKev6HFiAQlwD0Vxvsr
	9fYmAIkQNFqDbHNuSMCMxPiZt75YwmHHmGTi6mIGyk1Q4VUAEKvbrTL9l+GHj7idlZT6LoD8xfnpi
	8zAUKI4++oXgtusYok6knQlHBc6xsGWpspkB+NBngdMX8kzlcdMxR1bbqFQU1gFx36FcFHVE/mtLf
	YFUcON54Jg64ydoRVN+xqVg/gNRfwvHmboRSaNslBMZgWPiBKb9kIS0CGkVX3IaYGzL7Ld7q8+3FP
	1v7Y9SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twv0F-00000004lnb-2JZC;
	Tue, 25 Mar 2025 03:30:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twuyW-00000004lff-46RK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 03:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CA84439B5;
	Tue, 25 Mar 2025 03:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E1CC4CEE8;
	Tue, 25 Mar 2025 03:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742873352;
	bh=1+F2SiWR1EFj3utMdX7kCpEiQUqyD024EDV1S/WtZ48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o30PFgTW7i5eAuQ+6N5IBX9UwsrawBUIQ+zHPhdSefE7Jrd6SwDW0E4ec3cs704/Y
	 GiKwH6aZYKkRnT+07ghLQipoWdIECvaIfySbXPwJH2LYr+eAPbv5UoHIijxkfPLQbD
	 MWFn5NzZCqFi5yScLNDrKG/R5nCwqWuj3UqmVuJPoLy0oP61cfuc3DzGRdlq0e24FU
	 uuQ+5IfEDLsSZoVcilyQzXsQuu+k49rKz0gca+fxgTmIZa7FLgUF3UTD+ze/0oxzQV
	 +iuUSxRYOk6k2y3rLaopEKC/fqT7nqSgNgUbthyqpBjUMyZ3cnbLepbf8kvM+5W4Lj
	 fiI8eMehyFtyw==
Date: Mon, 24 Mar 2025 22:29:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
Message-ID: <174287335084.1637326.11937495835125026079.robh@kernel.org>
References: <20250324234013.140440-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324234013.140440-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_202913_040120_B50645CE 
X-CRM114-Status: GOOD (  12.69  )
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


On Tue, 25 Mar 2025 00:40:01 +0100, Marek Vasut wrote:
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
> 
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
> 
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Joao Goncalves <joao.goncalves@toradex.com>
> Cc: Joao Goncalves <jpaulo.silvagoncalves@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


