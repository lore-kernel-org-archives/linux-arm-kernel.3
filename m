Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1312EEFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D0UK8pO0Y/9nQsoDE0tyGVTLdOq02b88CjLRoni4BOQ=; b=tTWdqVYI/sWb/DdxHe2NUsYrEQ
	kw2qIQMsHVp8W+svkZMLY2wnvZWY45ey4L9A6DsJVtelffIkLZLkdbxoPP8T2xW0cqDrToaDPlNTX
	ZK2ou7ge5Tz0qCyCj4Ns7NR4WCEERG4Ws4i60phySqGIX//bi1Mi/wjGR2PW1o2Hv9FAhBPpk6ZgZ
	t2a16zCBuLtDrfNYfRfo/oCk/cw8/z590SGSnpItPuZJvdHfstGt74LgsKBS5mHwZpkcWbolJLzBd
	vqckJqTBC4W9eNlBj4Kb5BhkWN0vsToP4zRb8mq+JmaY+TSJPlvMzPN0Rl05CrD9mAUNsr/PxbWnB
	jIZX/juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAlM-00000003cBJ-2qn3;
	Wed, 25 Feb 2026 09:00:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAlH-00000003cA7-2YWE;
	Wed, 25 Feb 2026 09:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D0UK8pO0Y/9nQsoDE0tyGVTLdOq02b88CjLRoni4BOQ=; b=oHkXIrmol2R+cDoAmpxDlsxCRi
	MUjuKMe4YSDewKJyQoOvHco9VoP6qNvQgug/p6sqGr2rGbSWMgr6HD82nUauosdIsKWDV3yI7ivR8
	lVF86pxo2gCeAdGcS3wsUHOtFTNKn2VG+4a6F5fLkCcID5LbvBJBLMLARFrfHplUDAXhgFW6qy2EU
	2YZ627Dwj6u3jufKOBMQsMxRE3+/BS+qZBXbSBBcc3nSi67NTSQh60msWXvE0CC3PD0fZ/AjGqsP+
	gskZy25sSFMLUEqKmcAWisdzEyATyGplZtrtvvJjR97H67XBGJqw6XES7YGSTAwkohLd0xh4TXZiu
	/nAMAdKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44172)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvAlA-000000006Ey-3ETO;
	Wed, 25 Feb 2026 09:00:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvAl7-000000000o9-224v;
	Wed, 25 Feb 2026 09:00:41 +0000
Date: Wed, 25 Feb 2026 09:00:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_010053_090955_C646FDB2 
X-CRM114-Status: GOOD (  10.77  )
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

This is part 2 of the qcom-ethqos series, part 1 has now been merged.

This part of the series focuses on the generic PHY driver, but these
changes have dependencies on the ethernet driver, hence why
it will need to go via net-next. Furthermore, subsequent changes
depend on these patches.

The underlying ideas here are:

- get rid of the driver using phy_set_speed() with SPEED_1000 and
  SPEED_2500 which makes no sense for an ethernet SerDes due to the
  PCS 8B10B data encoding, which inflates the data rate at the SerDes
  compared to the MAC. This is replaced with phy_set_mode_ext().
- allow phy_power_on() / phy_set_mode*() to be called in any order.

Mohd has tested this series, but it would be great to get acks/reviews
from the generic PHY maintainers.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++--------
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
 2 files changed, 57 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

