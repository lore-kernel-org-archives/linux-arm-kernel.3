Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF5AF55436
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufDQ0fUtWsvfQhbjJOQTgw5KO2seGIzv7CfmCQnwbl4=; b=ny5T18e5fLpHF8P1vW6/YHIdhQ
	ZViLF4NZ5nIzSciqdImCVKWLXFpigAmWdyrJNMXCrWbnL8R65NB96tZiAvnUawJXJy0ySSeR7j4g9
	R4UJuPDQ+4R4qj5hEu0yRmiaIUSl9ZJGRJDuUK1PKSaWfj+yMslBHPFeisxneU59hiKFG2ix3D0Ey
	Bw3Zr4K87dY3FHkg1xmG/kBzqpmoPKKcPVO8k+v1XvZbAdTqt3GVvjHVOlFeDecYJ+oraFSiSJuWd
	L0zIaTCxZEwEE2Ct9Wxsx54xoKtO1x7xVVqgEB0hYV/jBzrNLFhxyeBlF1oFVQnA4fbhKux/sJ43U
	1RSC9z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3jG-000000032R8-3Tcm;
	Wed, 25 Feb 2026 01:30:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3jE-000000032Qp-2RRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ufDQ0fUtWsvfQhbjJOQTgw5KO2seGIzv7CfmCQnwbl4=; b=bdz8JTGrtOd6HiHj9Y+MNZFHuO
	KW3GozSU8occtDOwywyv+A/zkYXKCfGSx2eDoDaTO5WLbAFrqaO5xMZaAddvGE8goqEtFQS7Tprp8
	/oLuogpyyiWApdP4Ws3RoTXPvNfLDZeAuMVrWKY0bRLbIneT1GCqnzt1JcqJ2R8930m+S7mm/EyyL
	06UrcKGkM2k56QNKbrIh+lQ+AII/rj0DGgDA/RLr/EuEWqpcyUtnDcXKPoLwkkaXxid4TgpMbCLiS
	zhCncimJpHZy8CnqEVBNrVaQnTX20Oaj3Gh3XlneACqJ+ASGNnBQ3cJe1WtHeSbRJ+o+4hyltiw1R
	oBWn4Iqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45494)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vv3j4-000000005rx-20ko;
	Wed, 25 Feb 2026 01:30:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vv3iz-000000000SO-1u9Q;
	Wed, 25 Feb 2026 01:30:01 +0000
Date: Wed, 25 Feb 2026 01:30:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
 <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
 <20260224171052.27bebff0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224171052.27bebff0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_173016_645220_16A279BC 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, Feb 24, 2026 at 05:10:52PM -0800, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 09:34:51 +0000 Russell King (Oracle) wrote:
> >  	switch (speed) {
> >  	case SPEED_2500:
> > -		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> > -			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> > -		ethqos_pcs_set_inband(priv, false);
> > -		break;
> >  	case SPEED_1000:
> >  		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >  			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		ethqos_pcs_set_inband(priv, true);
> 
> Not clear to me why rgmii_setmask() goes away in the 2.5G case?
> Just checking it's intentional..

It doesn't. The code ends up as:

	switch (speed) {
	case SPEED_2500:
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

rather than being:

	switch (speed) {
	case SPEED_2500:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

which is needless duplication.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

