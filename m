Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325ABECD6F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 00:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQ0e0Hl+hfGkqhFEDP77ZKILri8DDFwL1Z6H3AicD1s=; b=aI9veKYvD6QHrk2uV3qLoJhiNu
	zKJIoA3f+T4RqWrfTeCzWTKgBRrhj8CTwNtb7fLMGEP5fqenidQ3mHqhhPKMQ+B5Ki7AFtlvPa5ic
	BlQD5pKg2khxVvXqF4qui/HAt94a4bETMStTfwUHXL/Zua1pUcYCFJSWJzLK8vfgQ6A29iaYdSjuo
	aAn3cHOjujf4p7qQXgB5f3ONFoEe8MZf1J9G78LX7welLk+AdrcKYcYcG3FXG2F4qj0t16qXYan8M
	CSVsp/BknjHPPD7lbuOL4SjSd779AqHhoht3ar6h1Atwaw0CxToA84WWlNX+deKMzujADxq9mauWL
	S7Gclmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKGv-00000001CnF-0rOL;
	Thu, 12 Feb 2026 00:09:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKGs-00000001Cmw-0yqj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 00:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQ0e0Hl+hfGkqhFEDP77ZKILri8DDFwL1Z6H3AicD1s=; b=zepebKy64GwoNXQrxyGz2TPsZF
	3LxVrg75F4GEdZEEFM1/YnMYQGvNya//tXUH3O4SChkqLTvHEyDkFo3TF6i5aR7K4TH67h1QlwRBf
	G5nZ/nfhK8UcaR+gKAf5WJlWMXWxMXp97lwk5PwsnlCrkAooQFCYain6Yo8ny2vVfiB/iHcJ5n1am
	x6RuEW0yUcK6PsFDBL7ohioeotBbfIxMMkM2c7FP4N8SbGGJp9WlYILfoZOC0amusLgE46fmEXS/6
	c/c+/Syj45BvlndpwlUV+k9RTfYY6YGcQlg6DCFoPkx5KX+sPULFoIhqCVzWXl/QqRur3wVyUynkV
	SXmRCCJQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48532)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vqKGh-000000003na-2YvA;
	Thu, 12 Feb 2026 00:09:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vqKGc-000000004EB-1Ubm;
	Thu, 12 Feb 2026 00:09:10 +0000
Date: Thu, 12 Feb 2026 00:09:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_160926_279312_0293CE9A 
X-CRM114-Status: UNSURE (   9.02  )
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

Hi,

As the last series had issues with stability, I've changed the approach
in this series to concentrate on keeping much of the SerDes related
code within the qcom-ethqos driver rather than trying to move it out at
this stage. This means it should be possible to bisect these patches and
pinpoint exactly the code movement that causes any instability.

This series starts with various cleanups to qcom-ethqos (the first four
patches) before beginning to move code, passing phylink's phy interface
(which will change) to the fix_mac_speed() method, and then using that
to configure the serdes and inband setting before moving the SerDes
code.

Please test this patch set, and let me know whether this works, or
where it breaks.

Thanks.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 include/linux/stmmac.h                             |   3 +-
 8 files changed, 90 insertions(+), 61 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

