Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181CFC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OUrCzCldOGuSSzB6HzeF4lCjN38tssC9VPeOMCVpQA=; b=zNLk5MV4texpPb9XkDK92sx6hS
	FUJyhG/gPBTSqQvCNiab9IaMBG+LqMnHP7g5dZ5nZxMhb05yLSkkILOCyi8HGpJn0P9c/Hbtv8Yl+
	3oqbyfC+W3Ag32D0hA87JPdvx8orgiVJ1jVXl4jOAkYsBcvyLOtzhx/utELTxPO4UzY6L30ZCvbjf
	zZHBJFBS8VmhcnIw5sJRZgpE0ryi2jwMtKAl1znyCZfc8UYXvcpdz/7iw68MEKFaUdl/xLp7LValO
	V7xn928m5dSXkTsbHksWQNKbfXepDTP8CcztJkJIhVKMEii/aVwnxgm0R6zs9ReFu5/i24+wwiH0c
	7fRbIKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ7-000000024Vx-0hYD;
	Mon, 07 Apr 2025 21:47:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhB-00000001j6r-30EA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=6OUrCzCldOGuSSzB6HzeF4lCjN38tssC9VPeOMCVpQA=; b=UC2EQTMoZXrFJ5bIRfgRdV9MSb
	6pLPCihEwSslXGm3SgakUtEPvACRjRyRGz3WN5s9l7q7zlcAzeIcR/0GzevvYx7dzCsy/6U1eMOeC
	T7PAcLg047KPY3+kPS/lsKIP3bDhusq7jWumeHs46t493twCzYTsH0DfDrPGQC8FHY/6dq3FIjMgy
	GL6Pk8OZoCToqZ9J+c+Qg4OlXvcFTwl/xVsEeSVW+XtJVyrWkTR5Z3MNlauYbkEyK9BDNh+D69koK
	ldge2Ec1U8C0eloPI8HnWNWb2FLB4Jy/ix4sB7chImo2qH7xkM7uv4RvdZ3ie0bJ/vSE3DtyO8fSO
	QehZAXoA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rh7-000000086hm-46Ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6OUrCzCldOGuSSzB6HzeF4lCjN38tssC9VPeOMCVpQA=; b=Ox9FUI/idEBlHs9dz8SvPkf/v8
	sWb/15TPPiO7QJVwSf1HH0lBUGQqA2cgxJVXzwddGI07XLbaQiDnPMgiPliPfmIECeCZBcWPLpkPi
	7zZlLxe2l8ag6/r0K6cuU5ElLX76rWN6qmpjpovkpsSiZFJhxXzcDXWbzLn+EpJ8IlNr5aMUL+h5W
	AF6cnwBKMuXAqd1AqEw02CBU9PBopD5EYgE7biRCdjF5+xEXNgRzk/TwNyjiU3jpOiJV7cc0pk6UB
	EVCVF7NNuXKXqWMPazYQGPAXrq9+A2LMPywE0EgiG7h9qX2KrRA1bqZ/sicmQqn+pHXJwCA9aadUV
	mRmZFYhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44394 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rh4-0006AC-1K;
	Mon, 07 Apr 2025 19:59:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rgY-0013gv-CL; Mon, 07 Apr 2025 19:59:06 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 4/5] net: stmmac: remove eee_usecs_rate
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rgY-0013gv-CL@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:59:06 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195942_127736_7A1E93D2 
X-CRM114-Status: UNSURE (   9.04  )
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

plat_dat->eee_users_rate is now unused, so remove this member.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index c4ec8bb8144e..8aed09d65b4a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -276,7 +276,6 @@ struct plat_stmmacenet_data {
 	int mac_port_sel_speed;
 	int has_xgmac;
 	u8 vlan_fail_q;
-	unsigned long eee_usecs_rate;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int msi_mac_vec;
-- 
2.30.2


