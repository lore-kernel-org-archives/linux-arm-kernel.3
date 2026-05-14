Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B782CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93zu1OElp8UT/55SqeleP0PPzGBBS3CPX60oMHpBOEg=; b=0xWGFsHkrKtyr+EoyhHq5cyAtZ
	l5b8sGMQBxnB3sF7sfOGDIEyBFDh0Kevhm5WZP7jI5SD2S29tXh4YE9s8FeQeeqRJYmLJsYZ2m86o
	dVnh89EXcFzV4UDCLQJzsfwzQfwz6AZrXmgtcDe+6dNI9CP1TZFOp4OivRmJ57kiTetzBVrf6E4Xv
	50Goulmk6bjyLeBLk02IsfXyBzMxJ8BPcUyqJrrBXuQMdNFJaPrS4QLNU31+Blz42HJ/ZAsHwBMEc
	HLW6o8t7TlDdpd/i5ovPSe/qli6N1Ncs9lIdZ7uTCDyD5Zof6wim4MQG1j0FY+/oqFXMMDurHOqwF
	WQ8HVHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWga-00000005f8l-0H1t;
	Thu, 14 May 2026 14:05:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWgX-00000005f6m-2B9x;
	Thu, 14 May 2026 14:05:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wNWgR-0000000046C-3uKu;
	Thu, 14 May 2026 14:05:04 +0000
Date: Thu, 14 May 2026 15:05:01 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 4/5] net: dsa: mt7530: clear flood flags on bridge
 leave
Message-ID: <cc8d2f494dd202304a6f68332f3a90ea0a8a4618.1778766629.git.daniel@makrotopia.org>
References: <cover.1778766629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778766629.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_070509_558361_1ECDF9FB 
X-CRM114-Status: UNSURE (   8.71  )
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

Flood flags set by port_bridge_flags persist after a port leaves the
bridge, causing unknown unicast to be forwarded to standalone ports.

Clear UNU_FFP, UNM_FFP and BC_FFP in port_bridge_leave so that the
port returns to its initial state without flooding.

Fixes: 5a30833b9a16 ("net: dsa: mt7530: support MDB and bridge flag operations")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 drivers/net/dsa/mt7530.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 752ba92b0851..5b58e42bfda9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1767,6 +1767,11 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
 		   MT7530_PORT_MATRIX_MODE);
 
+	/* Clear flood flags so they don't persist across bridge leave */
+	mt7530_clear(priv, MT753X_MFC,
+		     UNU_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
+		     BC_FFP(BIT(port)));
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.54.0

