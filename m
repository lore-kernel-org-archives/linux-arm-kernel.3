Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A410510BA421
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33beEexrj6nrjPAElnU2NH3C09uDlu/LLqgPwc1DkZc=; b=AhISGzih1hX2kVZqzUaQXp+Cqi
	KiSdccfsOiTWXibr1tot5A2COyNvRF3WXKt/bLsHEJJsyC7PlL3D9Y8OT5dno9xQnu6wgRJPoUlV5
	x0lZMSuSX6I//BpE18eWlYOPx7Nn9hqEKPwXhtHi9Cfgzb7jFuKd7evfCxhPkSmPS/cfpRT3XZ5Tc
	TLQ4oW57/kGXz+xxRQyxOZM4urwXowpxNEpC2RpZp1bNDgcPg+uehlVZEI42Bjxzx0cWL2MXVjR/M
	K9+q1CUv7jn32QGjGFLuBV90bINPMMtEqWYrdSFWz0IX65V8QY15DZgCA+JrMC5nsRyiKR6+/C+/E
	6k5Ty8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6NXS-00000008eSq-2hUh;
	Sat, 28 Mar 2026 06:52:54 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6NXP-00000008eSR-0pi9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 06:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=33beEexrj6nrjPAElnU2NH3C09uDlu/LLqgPwc1DkZc=; b=fn0P4P3q3y766rzs6OUkHnvBSr
	EU0FMNq1Hc0y8XuDa+OZDTPP1PDhrgJnVcReSDzfHvoEFJhzVLg3W2tOVJCrVjL3P1L3MV9LARA6w
	lEN9/MEvKE+Eq7RLckUyNZuHabj4sb0l8bzFa44kx0ofReyBMYLPUF1OQy90bBSP+QZGAd26SlOQr
	TwpQ8yAZDem+nthy0zqWuED0SYHmVxULNQmxjCeFiYnIWA+UNvvd5SZ7S9hdVBrG1HEfPEJNltIHJ
	dOERBF3gpzMVZLDPa1CzH3ipf1tWPIoN0sBqw1KetEkwYH6pE4wAEhYwBJ6ODzCapRUWFevUApG6B
	IyxxVJYQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6NXJ-0000000GRKm-3nmA;
	Sat, 28 Mar 2026 07:52:45 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 28 Mar 2026 07:51:53 +0100
Subject: [PATCH v3] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-vlan-restore-error-v3-1-df47a039c6f6@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAIh6x2kC/33NzQrCMAzA8VcZPVtZ0nWKJ99DPNQudYV9kY7iG
 Ht3251ExOM/JL+sIhB7CuJSrIIp+uDHIYU6FMK2ZniS9E1qgSXWpYJKxs4MkinMI5Mk5pGlOz+
 UAXtyujQiHU5Mzr929HZP3fq8vew/IuTpXy6CBFk5W1tFCKDdte+nsISZ+nCcOpHJiB8Mwk8GM
 6Ot07XRiKr5ZrZtewP0F1uX/wAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774680722; l=2386;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=p7HWapl7YDtqLLcGPURCO7USFyDAuJbgzh2DkTOEIFU=;
 b=+/zqCdmGkoLcGWNGbkEZ6y6HXFyeDcB/WjhfUzcpEMmGpBQR3U81IFkgBgdu8d+7Ct+CDu2qs
 WpAYOYuSKH7AUHphn77gdurd6xKhgeH+Zbgv+Ei8K3MS/MQ4QDnc1wb
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_235251_715245_BC5F656B 
X-CRM114-Status: GOOD (  10.71  )
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

stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
-EINVAL via stmmac_do_void_callback(), resulting in a spurious
"Failed to restore VLANs" error even when no VLAN filtering is in use.

Remove the unneeded comment.

Tested on Orange Pi Zero 3.

Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This patch fixes a noisy "Failed to restore VLANs" message on platforms
where stmmac VLAN hash ops are not implemented.
stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
VLAN hash ops presence which results in -EINVAL. 
---
Changes in v3:
- Remove the offending comment
- Restore the original check for NETIF_F_VLAN_FEATURES
- Link to v2: https://lore.kernel.org/r/20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl

Changes in v2:
- Replace check for hash ops with check for HW FILTER flags
- Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..0f3e5ac05faa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6861,19 +6861,13 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
 static int stmmac_vlan_restore(struct stmmac_priv *priv)
 {
-	int ret;
-
 	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
 		return 0;
 
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
-	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
-	if (ret)
-		netdev_err(priv->dev, "Failed to restore VLANs\n");
-
-	return ret;
+	return stmmac_vlan_update(priv, priv->num_double_vlans);
 }
 
 static int stmmac_bpf(struct net_device *dev, struct netdev_bpf *bpf)

---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260314-vlan-restore-error-f8b3a1c7f50a

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


