Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8689CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg1aq5qDSmaUSi9KMu/jv/ZYN99u81NnP+NdqomBbrI=; b=D1aG7822jz89W0l6HaZWY0xB/6
	qyKzYg69mNLOTf9uIuoyy/r4UPLYiUIHhrFHyt2x8BIDYz82EEQcrP169gZCusyCKOPB5idbgL4pD
	8uqLM/zrZ1PjDlttRmaIHsBYwozXP53j9TJsNK2ZDgfNOQ0viGQC3EiX69UB0SUP9H2hTVB5Pkirs
	YCB4q+oGy7lD+9F3IjNdwLaSfdVnBZTjmtXXqMIFjVY7J9JJT9z87GLzK9ERhxhMEyCk+XRsKog35
	l8Sd0OHii8OCTdOv5/YFNRzQEh6zvFL2AcIf0r8TfmC/2PjESmxM22N8XiU+6tkjzxk0R+f6nB+Hx
	KbsU1/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26w-000000095l4-1nGx;
	Tue, 09 Sep 2025 17:26:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1VT-00000008dtR-2N4l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vg1aq5qDSmaUSi9KMu/jv/ZYN99u81NnP+NdqomBbrI=; b=xC1ZIBzs+a/vYd7TcC4mZXjpU/
	8BNoKrgPhfw6F0mjfGYj0BsWubtDNxnpz4rKNd9JnJKa3OHeXWuJPji9xbqMzrh/f8b8CE995zERn
	a0bIvkUCmQVxrX90C9/FjbY25ZXE5PQbfEpPI/gV1FWkfFBBtGsfDTQDvlUFfOacB9khRXs+xx7kC
	8qRiG9J8MJqEZBtcv+SdnwqUkw/tzMESxePdQv9ZPeazrz5CVDVR1MK6pmvfH6dWF8UgAPeWwT2IW
	K9gq4jXQOkIRQQUf7qRlQwLyX/JbBiUcPjg6l+66ZrCzAMBVKLfc81uGZozzqppaxw9GtM1a67qjG
	xka0YRog==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44320 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1VH-000000008VP-0MfS;
	Tue, 09 Sep 2025 17:47:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1VG-00000004MBw-09tK;
	Tue, 09 Sep 2025 17:47:34 +0100
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
Subject: [PATCH net-next 02/11] net: stmmac: disable PTP clock after
 unregistering PTP
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1VG-00000004MBw-09tK@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:47:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094747_613713_BB776A43 
X-CRM114-Status: GOOD (  10.59  )
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

Follow the principle of unpublish from userspace and then teardown
resources.

Disable the PTP clock only after unregistering with the PTP subsystem,
which ensures that we only stop the clock that ticks the timesource
after we have removed the PTP device.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 419cb49ee5a2..5d76cf7957ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -817,8 +817,8 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
-	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 	stmmac_ptp_unregister(priv);
+	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
 /**
-- 
2.47.3


