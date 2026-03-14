Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F410706E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EgCsQpLfP6jlSC3mUtz80d1LyhN5q7HHT6hn2BMEbcI=; b=KQYachtAdAqbyknA/fa0tDjt/0
	7E800NVJJD8hSRJHf09DyNcwpCFz1vpYrOQ0HAguwP43lGdgkJsjhA8BX20I9dwmv2VzJyzIR84uA
	XLNGvtrVBtXEYHpGYLkZrl2AFOB1Ok1M2HWDtuqBv5HPk7cRPsoTtQdB8sGaJuScnae2WL+S3qFeP
	qitz3IXvphvNvhhpmUZaen4Xb1z1qh9QeZJ9NE+6T3pXKySzL4rRYEirtbTMgC1+iYcQaPGOt0SFD
	ihqecsGZyL7Gbv5U5wN7nNcFPIMXtNeflWsooM4ijf/FbQeh8JCdDpuLDM37t66dkXzL9/Eo9NrrG
	z8w5VBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Qv1-00000001xwt-2hA2;
	Sat, 14 Mar 2026 15:28:47 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Qux-00000001xwb-3l51
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 15:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EgCsQpLfP6jlSC3mUtz80d1LyhN5q7HHT6hn2BMEbcI=; b=ZNPvi+McsNM6sE7cSCcvs2gMnt
	OsbLb7qY/gGb/PN6F/geAZ+HRQmKgclGugspuJIQa16LMG74KvYVkzb9Ikt1ykW4FsJqUoGHOYffM
	BmbysA7+7zM9YaHvTMh2B2IfOxjl2Y2oK4wF43p/3+xeChXWl2dpGzU+nZI6ckmYM8BCyTxjoM62H
	FLFPMVK4/W8RxaLgiHkLeyZ65J7KQKvnG8HEJTv1AwlH8rqqs2lvnLkVCIJnNcXFH29WgItZLjS+W
	CUP3XtsrKfKEfGPM6W07UVbcn2GwfspKJYjg7AjiRJqn/cEtfQRQhgakkzglQGa49doBw6abKTMXM
	hXYDmBfg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w1Qur-00000006o6Z-2wCk;
	Sat, 14 Mar 2026 16:28:37 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 14 Mar 2026 16:27:46 +0100
Subject: [PATCH] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAHF+tWkC/x3MTQqAIBBA4avIrBvQ/ukq0cJqrIHQGCOC8O5Jy
 2/x3guRhCnCoF4Qujly8BmmULDs1m+EvGZDqctWV6bG+7AeheIVhJBEgqDr58qapXONtpDDU8j
 x80/HKaUP7JbUyWQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773502079; l=1719;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/vy+c1nLswFOkWzuqJsjFYoXMYDn1ssIa4VCRdJjqZI=;
 b=Cu15vltkrAWQrlPZvWghHLF0X7ub3MupcOdEB2OM0WisVyNFkoVZePcUctt+43i2PwPh4l1Fk
 e83DoBoc1+pApN/haQ4gv2Vm+I4+fIuayVxZpr3tYcRVbiPRIH0qIQa
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_082844_437818_9C72A674 
X-CRM114-Status: UNSURE (   8.57  )
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

stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
-EINVAL via stmmac_do_void_callback(), resulting in a spurious
"Failed to restore VLANs" error even when no VLAN filtering is in use.

Check presence of VLAN hash ops before stmmac_vlan_update().

Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This patch fixes a noisy "Failed to restore VLANs" message on platforms
where stmmac VLAN hash ops are not implemented.
stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
VLAN hash ops presence which results in -EINVAL. 
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..bc09439ec00b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6869,6 +6869,9 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
+	if (!priv->hw->vlan || !priv->hw->vlan->update_vlan_hash)
+		return 0;
+
 	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
 	if (ret)
 		netdev_err(priv->dev, "Failed to restore VLANs\n");

---
base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
change-id: 20260314-vlan-restore-error-f8b3a1c7f50a

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


