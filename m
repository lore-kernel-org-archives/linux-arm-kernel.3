Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0008EE77178
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeVYKYC++7v89xWZg/BcHEQbyOA06uBwOslFWdgxmWk=; b=GmkCLzXHj0dequ59dRyTEHALJn
	JO7bWKngHnWKy00E3sopP7grvoCACqCTAUuNrcKZMKGZTn2BcOZatDBWNsOl6eHoPAX1rgIYIg3jK
	Ru2TmSwVI95DjnbmT9KNXyH3TrI9slQKDZfQ1CkIFnEcePlZN409zWnXh8byMgf0aOigt0ru/KijW
	/HOE73zvMd+/RRRq5DcsyHpxDpMIylkpvj6E/IUbUyRk489LIAVLMGmerCPe1gkLVGzzS08MVyTgA
	da0p8DEv5q7dbmVEgRoOhge1tN48/U/CITQdlkJ8y5NPHpotoVspcwDgjRmwFeFOJFYcR3UeVv0qh
	RTvG+fQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFPk-0000000GtYF-1r5r;
	Thu, 05 Dec 2024 17:13:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFBT-0000000Gqsh-2X6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DeVYKYC++7v89xWZg/BcHEQbyOA06uBwOslFWdgxmWk=; b=OZSDhWSIwfVVoNU6oJeFFY4S3C
	Gkx3Gf35uXSOQKkOCtwwxjjqNS7bAD1esQHNqxmmrD7B25BMjjPHMjT+pLCeKKHyLTtrqxLHCjIxV
	psKOPBrUr1K5fn5rQTIu1Dho1jBsNH4Z4jifB7a4PalNMywQhJNcM9CtEijT8s9vfUGqET7fL5lI0
	IAwU4C+ikgjy0YYDAVdlvgVPqOykILXsFDUIlvlHZpbbOfmmHOD0xli3299wsOmHBFn5bltsiu6He
	WUQspi6XYQKPlIJ4hvFX1XIyo4Ldcpg0Zz3pIKclCFJtuRfjwVxSMsKzG0RQ6wRJNd4s4wbTYuh+z
	RfxnpLHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46892)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJFB1-0005Do-1t;
	Thu, 05 Dec 2024 16:58:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJFAw-0006hx-2L;
	Thu, 05 Dec 2024 16:58:02 +0000
Date: Thu, 5 Dec 2024 16:58:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH net-next v8 07/15] net: dwmac-intel-plat: Use helper
 rgmii_clock
Message-ID: <Z1Hbml22IgrTyzeN@shell.armlinux.org.uk>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-7-ec1d180df815@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-7-ec1d180df815@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_085835_642517_3C0E393F 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, 0x1207@gmail.com, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 05, 2024 at 05:43:04PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> When in, remove dead code in kmb_eth_fix_mac_speed().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

