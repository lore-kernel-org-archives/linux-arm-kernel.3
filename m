Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB6DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyAyBxkXaApDM4KsfpCB8GHoJifPSp90vnbMpVzBWEA=; b=lnZNq/qfV8EUV3LoHdQVk6adMN
	xk1wPGDVTir85cMj1chLuw4Y6ZJ/jfXoUUDvBf2YyeZtiFYH+09YRnKSsC+Wg/2DMyhAJTFzqubeN
	0LFcO04k7afE6RXFPxl/KaBUjJPsU+DIBmvUiSQlNMkn/45If/E6rvAQTUyaoB7SsKp65W7il7J3e
	4u9kr4n3yvCnbMAvrJTVqffdRSxReKuWcGGPIlLryoOONm1mR3Ywsv2KxpTrqLY7r3b6VUIBOqhVy
	LIS+fqihH3hV4jB/c9bKvMFNg1ielBcacdX8Q5cD/g1IdXjGCGkTqPPTLpgh4HH8rnKg9o+V060v+
	GbAPjP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97fg-00000002oVC-3qc3;
	Wed, 15 Oct 2025 20:00:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97fe-00000002oUq-2qAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UyAyBxkXaApDM4KsfpCB8GHoJifPSp90vnbMpVzBWEA=; b=C74SUiMaBsN6Ewv2nuaqrHGEsU
	c1hiR0wYJ8u5oCxQwvULH0b+wZtnM9GjcGti8ITX0XWijY0Bqbeh76Vkl8YbGLqaZRxTHx33RBuCa
	djChBbayFMyi70dLEFMeB9fqbF7zbphGAipQYyd77oIzUIp1Mwfz9xRc012+Nh7M+OK+3q/RrDYSX
	1ba5A17DFmcUFir0f+ojyJ6F0cfaFQ98EJD1Ot95cJEZuOvtr4+NZV4Q2+RPK/zNbD+bY8Un62t4v
	pJqgJMRA6Ptm/eGXQGB0W/6/y24XgaMM0PV1cnHfT/zDCyuoskFQdW2tuuGhR/7BavrLjCCsCbt2t
	yH0kUZJA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47970)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v97fV-000000005Mj-2ToV;
	Wed, 15 Oct 2025 21:00:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v97fT-000000002ZM-3Uh3;
	Wed, 15 Oct 2025 21:00:15 +0100
Date: Wed, 15 Oct 2025 21:00:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] ARM: dts: imx6: rename touch-thermal0 to
 touch-0-thermal
Message-ID: <aO_9Tw1s7VcHauNh@shell.armlinux.org.uk>
References: <20251015-imx6_dts_cleanup-v2-0-41a7281b98c6@nxp.com>
 <20251015-imx6_dts_cleanup-v2-2-41a7281b98c6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx6_dts_cleanup-v2-2-41a7281b98c6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_130026_740193_A2CCE75E 
X-CRM114-Status: UNSURE (   8.65  )
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

On Wed, Oct 15, 2025 at 12:44:27PM -0400, Frank Li wrote:
> -		touch-thermal0 {
> +		touch0-thermal {
...
> -		touch-thermal1 {
> +		touch1-thermal {
...
> -		touch-thermal0 {
> +		touch-0-thermal {
...
> -		touch-thermal1 {
> +		touch-1-thermal {
...
> -		touch-thermal0 {
> +		touch-0-thermal {
...
> -		touch-thermal1 {
> +		touch-1-thermal {

Is it touch-N-thermal or touchN-thermal?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

