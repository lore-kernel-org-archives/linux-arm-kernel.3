Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA2AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8t1xaI1/GugJIK8OBprVbaU/A8jM/gJsPmAeiSAzxc=; b=HuzGd1TWVtMFhRYKl6pT7lx9Cz
	DFUrkWy0wsRx7OX3WY10HvAKVo5rtaVhXXcXwLjFu0Q6l3hOa+9b0aLDDfiIQfREF5tTx09wXgVnk
	3qR2qtmkcNSu+14jMHVvjq0lYnt33A1BqT2/DBMTjtJBUnaPxVLDkn86+S2nPUfooxnSHomYm3CaV
	73TTQxotvrGpMVkd8WoiamsquLT7g+0hn/rpcURjksCpSsmOH8ehrIyk5et+IOOGbej9jfnEGjtSo
	AzaCfdjJE7yGP0raxuKQPpPCWYKIGOTAhBbiZVXtLdcHhVeAgc4W+tXEexQWN0rOtTpDN+UKgUN60
	XYXmvb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlrE-000000018Ul-2s4P;
	Mon, 06 Jan 2025 12:05:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUllf-000000017ER-0LN3;
	Mon, 06 Jan 2025 11:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G8t1xaI1/GugJIK8OBprVbaU/A8jM/gJsPmAeiSAzxc=; b=zYOeLJlrCypxVI0s25kv4zllPI
	UeEo/xeRtIxj1me7kVajNX1CHd4wqQYhNS41F/ykYLWSyxQp9ltLhspZJ/GZxV1XM6Wd2IhA5JTaX
	RzmGRJ48OxrNDT8lSSoYkEfY7tMxyR9QUoSopjmhfOkYRhr4XkYeGaZl1IxDCmkvDCyQVy1RIOP7g
	w5nitlnwt6OGOhMRsxPgS4++bSCCh5k5AvPFMLWm23FYwt8jsfwMU4WqImyqL9aUxSkP8Aa/ILocH
	l7uOqAUNbXECAI0KVrj3ESjS2tc/TZjV0NaaH4v28bWPVTFuTw5CAcNlavOYIECus25A4ovrJHQZI
	bZ9U7Ysg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38348 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUllY-0005mS-0L;
	Mon, 06 Jan 2025 11:59:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUllU-007UzL-KV; Mon, 06 Jan 2025 11:59:24 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 9/9] net: dsa: remove get_mac_eee() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUllU-007UzL-KV@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:59:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035935_119307_4C87AFD5 
X-CRM114-Status: UNSURE (   8.87  )
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

The get_mac_eee() is no longer called by the core DSA code, nor are
there any implementations of this method. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/net/dsa.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 4aeedb296d67..9640d5c67f56 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -991,8 +991,6 @@ struct dsa_switch_ops {
 	bool	(*support_eee)(struct dsa_switch *ds, int port);
 	int	(*set_mac_eee)(struct dsa_switch *ds, int port,
 			       struct ethtool_keee *e);
-	int	(*get_mac_eee)(struct dsa_switch *ds, int port,
-			       struct ethtool_keee *e);
 
 	/* EEPROM access */
 	int	(*get_eeprom_len)(struct dsa_switch *ds);
-- 
2.30.2


