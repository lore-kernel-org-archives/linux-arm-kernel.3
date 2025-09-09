Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F43CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6AnH3ZiNZdIwEzjDnVXXMlVVCHVQyHriF9TItbs3yY=; b=zbODDBLJzMmbtB7jmCt4EGGYLN
	nd+k0SLXPhgeOqs7n44M4ero5ohNRMbiQ9hvkZnRZ79htAoWWxea0J40HoMd2R0AH1MtnqYkQIt/H
	YS74Juxx5P71AWcM/yngpV4ddzee9nDPRTKLMDzT9zXMWlsT/q75/P1uvW+fD4hIFCxsSv4NWj+Me
	/QgD89GIkxXSxIcIXDfmSILYjN69ikzrtq4WwResIwnFJGQRU2a2lbKnhHVdsW/qbdElumrHEdoX+
	DlR+Qz2gbuf6qVOr50yO4M6haSxRiA+w2VDEZ3e1/+9KFcGyRifzBWPBkD4BUV5gWY9qZFjvxSt69
	s/0bfsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26x-000000095oS-3sF9;
	Tue, 09 Sep 2025 17:26:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Vb-00000008dvH-0zRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H6AnH3ZiNZdIwEzjDnVXXMlVVCHVQyHriF9TItbs3yY=; b=xF1FnEBv1M24a/eJX/Mdy+JQT6
	rV4Q4ZfSZwn+F7++7xxvmepM3ruF5h4k5VN1RTtjFHI5aeJQZLCQNMX5DVe0Q/AAyVU3SdXlPxsLK
	uafKG+q07+0PRLDrTAO4dx6A11Fp0G0mYwpWp7RHZQ2w6MN6laTQrD0o/cJR48GGPZSBBlRMzVeBh
	UaYSu6IsPc7bXwleHuYrf1Zgl4KabWmtuo/VGMOVrFD8XmPlFu3F3VM6gukjuQ1k3o4Sl8As35GiK
	Fe8KL/Bfr+VJIZBBkeOimv5/0YmYiJGaI/xWdjSCNmeB1GFs1gC0F04b2MpYF+zN/fcMhsj/JTaO4
	1g1d61ew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58968 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1VM-000000008Vf-2P8O;
	Tue, 09 Sep 2025 17:47:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1VL-00000004MC3-0fqq;
	Tue, 09 Sep 2025 17:47:39 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 03/11] net: stmmac: fix PTP error cleanup in
 __stmmac_open()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1VL-00000004MC3-0fqq@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:47:39 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094755_272147_3588E582 
X-CRM114-Status: GOOD (  12.79  )
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

The cleanup function for stmmac_setup_ptp() is stmmac_release_ptp()
which entirely undoes the effects of stmmac_setup_ptp() by
unregistering the PTP device and then stopping the PTP clock,
whereas stmmac_hw_teardown() will only stop the PTP clock while
leaving the PTP device registered.

This can lead to a kernel oops - if __stmmac_open() fails after
registering the PTP clock, the PTP device will remain registered,
and if the module is removed, subsequent PTP device accesses will
lead to a kernel oops.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5d76cf7957ab..167405aac5b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4032,7 +4032,7 @@ static int __stmmac_open(struct net_device *dev,
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	stmmac_hw_teardown(dev);
+	stmmac_release_ptp(priv);
 init_error:
 	phylink_disconnect_phy(priv->phylink);
 init_phy_error:
-- 
2.47.3


