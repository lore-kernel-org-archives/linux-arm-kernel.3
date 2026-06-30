Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D0CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3gDDpa2F+xxVGf0PANTbnb+AzneKEHuN6HprbF9bqI=; b=SoDtKRu/MTyS6RDrIJu+l0SQAz
	6wFu6XRLl3SNY8w3l7DBrVjALKXv53GYSA64jwfdFsRnIUD78OcSrtvX7L0QOG9sa3l5Pu1IYmFfr
	Qn6peCkctm/K49AIr2V84Sx3aHoI9YEobyh1NLgUaD4FFJJ4QwTnqlOtjPnR2/SplvPYdgNGN9uUK
	Hyu17vpDrGgijukg8/vvJFhUuDch6yZMoNMLgt5lE/TSiOcEOcvETFEi63YKeusFR/QtbHZpbJ0Hs
	EwAuWycryvlGQPg/OD05otOeRWB/GR80bxbfcYLG4qHgSE/VCIRD0HvBAstT3iJQsgwS6VUmR/AO9
	+8FwR4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaWU-0000000HNxA-1i0t;
	Tue, 30 Jun 2026 15:37:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaWS-0000000HNx1-2sCQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE9AB600BB;
	Tue, 30 Jun 2026 15:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4877E1F000E9;
	Tue, 30 Jun 2026 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782833835;
	bh=f3gDDpa2F+xxVGf0PANTbnb+AzneKEHuN6HprbF9bqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Shy5SjIkdi8a1edi8K58WDtF7KRartQjSOwBFdhTNeADxFTOegM7p8O5auSkWXL6x
	 fg+etw55D2K402q0wfLNBnR5E7TrnJaHZHpDMIEHEeaSY1KwWg8oF4ZiOyJtMQzGdk
	 gzA/FtOWre0HXtUWZvzU/Zjm9II8YbvMgwfSqym8Cv/XKgLE8JUwwoogXQMps13vsN
	 hMZhxLEMHOdWUd5A+RnVm83Rt4z75sMsncVtyi2XKshB9Lf41M3I5XZqI2+9qTm99G
	 k87Jbc7MIOTDu/aWsyO7J+HUfZsWWKzpuwv+UqPup6Pf+3O9wAYt+Ouqmp+O1BOqTV
	 SWAYCreI5+ZMA==
Date: Tue, 30 Jun 2026 10:37:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-hardening@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 05/11] pinctrl: freescale: IMXRT: Remove NOMMU platform
 support
Message-ID: <178283383072.3679006.860128200601452588.robh@kernel.org>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-5-0101795a2662@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-5-0101795a2662@nxp.com>
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


On Fri, 19 Jun 2026 11:41:02 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Commercial users and hardware vendors migrated to Zephyr or other RTOS
> solutions years ago, leaving the NOMMU platform support effectively
> unused and unmaintained.
> 
> Remove the obsolete support to reduce maintenance burden and simplify the
> i.MX platform code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |  79 -----
>  .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |  77 -----
>  drivers/pinctrl/freescale/Kconfig                  |  16 -
>  drivers/pinctrl/freescale/Makefile                 |   2 -
>  drivers/pinctrl/freescale/pinctrl-imxrt1050.c      | 309 ------------------
>  drivers/pinctrl/freescale/pinctrl-imxrt1170.c      | 349 ---------------------
>  6 files changed, 832 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


