Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DDAC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEENey2w1cevs1tsnGhBook0OChKHoGcDIcOjH49bFg=; b=06lHwp9rBsOOnOHgZejEWjKUW/
	4OtAFCi6xQq5ykr57sfeoEw54GjOLr62nM6nxVY3KQor6e/gz9/GMJzw1xKTgGApli2+sHYRH/FFO
	AfR8UCJ3OuT1pRszR+c/VchaCVgY3sW+z1l4sm3fW9Id8InvqYcJFv1uLxkR4Z3EP1renqGtqlDPF
	sh5R8zt8uu3YTbUOteBXHwplljfYu1nOflSmtJIWnjaczpGf3iXl91Ou+G0s5V7Js8aGISHWFroPB
	imJc1ECM3beZeKAb8Yo3L4RUdhfZfJpGDloP1bevCjENTXPM2v+4JOFGeHOimEaFYodafEI+TbASK
	2wTTWcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0oB-00000008Duz-0vET;
	Thu, 24 Jul 2025 18:36:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0V7-00000008Bxp-0FBh;
	Thu, 24 Jul 2025 18:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pEENey2w1cevs1tsnGhBook0OChKHoGcDIcOjH49bFg=; b=avBZvZL1MdJUmnRVPUQVLk5c1y
	WnCZeQ5XDg46LFMptIFRUSvqaHiOB7dg+AaSfB13F6iJUMFVLVFcsRvTnpXOk9+dOXeAMvMURNeKW
	rN0QXkDD7Smay2gdCecIvRSTA4a2fW+VCRcXjXZKF+fO4LA3Mc5BuQYDhfUesfazbL4FyD1feGoaZ
	GNUzgGtt6aa4+byLy9PEhgHifFi8lgmNg+OMyhzzSpzl8SAQcc4JI3YC8GPD+S3az5BWMAL/s9HIc
	C3wGAeGY80Aia4gni0S4mmJlxczAQHR3J+7V7jdCO0ZYYRJ3QTp+dGcQ7xor+o2vyuGeY54I6Y1lr
	p3k5STpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59298)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uf0Uy-0003f4-0Q;
	Thu, 24 Jul 2025 19:16:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uf0Uv-0000ww-2a;
	Thu, 24 Jul 2025 19:16:53 +0100
Date: Thu, 24 Jul 2025 19:16:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: use MAC TX delay for ROCK 4D
Message-ID: <aIJ4lZgfTiNmHaXF@shell.armlinux.org.uk>
References: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_111705_097876_31268076 
X-CRM114-Status: GOOD (  14.65  )
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

On Thu, Jul 24, 2025 at 04:31:25PM +0200, Sebastian Reichel wrote:
> According to the Ethernet controller device tree binding "rgmii-id"
> means, that the PCB does not have extra long lines to add the required
> delays. This is indeed the case for the ROCK 4D.
> 
> The problem is, that the Rockchip MAC Linux driver interprets the
> interface type differently and abuses the information to configure
> RX and TX delays in the MAC using (vendor) properties 'rx_delay' and
> 'tx_delay'.
> 
> When Detlev Casanova upstreamed the ROCK 4D device tree, he used the
> correct description for the board ("rgmii-id"). This results in no delays
> being configured in the MAC. At the same time the PHY will provide
> some delays.

So why can't the MAC be fixed to conform to the requirements that are
well documented for RGMII?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

