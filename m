Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A374BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5iNM2oNSuXbhf+0XmfrlArQGwY2yx5spc/F/HyXY+oI=; b=k4xmCzVxVxKinXzbEGugZU7hSG
	YJFiHIL1ItskG8n3jEU4VJzzZM82iBggIYWw+E7pVo4PVp/PK6e9okLv4fAel4t/fZ0uRLTopwwdi
	nvZd/gjX3cWFdrr2QWIDE3idk6AZPdSLjQsuPmIjYXMIgARPUVK54UwvVCjodYPUtw1IgDcZ91igm
	9VByMYrgp2lp7+rZL0pWvlf4/s8DRwc5+gnw1pVw3Ta0QSLiPiKhek4ifYbeijLZ4aDMX9yDEAmbz
	JZRwQPbUqQJX6awOIkGewFjmQvrEKx//DPdRRFVb2hyJ59ElbjjSwg5W4/Uyk4crI+xZ0IwVQ+V3M
	qG47yRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhSY-00000004QYS-0qRa;
	Mon, 08 Jun 2026 21:24:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhSX-00000004QYB-0Ljd;
	Mon, 08 Jun 2026 21:24:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D34926001D;
	Mon,  8 Jun 2026 21:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FD91F00893;
	Mon,  8 Jun 2026 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780953875;
	bh=5iNM2oNSuXbhf+0XmfrlArQGwY2yx5spc/F/HyXY+oI=;
	h=From:Date:Subject:To:Cc;
	b=SDk+vO2xgUwXGGWtyiI+J91tlK6Gzzltz/c9sj+I6bv3lcZQVVVPnb3XuxDNq7Qtg
	 JYPJp3m7Wt1N9zqxLSxO5stkcQd7rk8nPM/oqfdoVwsqsxJaKeauAh1t+ScTc/kGqQ
	 YqCkokyogvSC78opG/3KD4BmEVRfrBxqS/csgipFL8XpJIALVfQFYuJZw54Vvc1lIf
	 dn4/t6YDyo1E/GnyRonoM7U3CktcpVFtS5ykf/jmfP18ZceIZFE3Z5UT4gFNCybMoJ
	 zKZNLgdpj9yK7EQd+N07Mcs8OMGOBwGeyrDeIqUjw7AQ2RFgVeWw0TYh09LwMmr/0h
	 5IJvDkncJtklA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 08 Jun 2026 23:24:15 +0200
Subject: [PATCH net-next] net: airoha: move get_sport() callback at the
 beginning of airoha_enable_gdm2_loopback()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-airoha_enable_gdm2_loopback-minor-change-v1-1-1787a0f42b31@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQqDMBAAvyJ7biAmNJR+pZSwmlWX6kY2IoL49
 4bS4xxm5oRCylTg2ZygtHPhLBXaWwP9hDKS4VQZnHXBBvswyJonjCTYzRTHtLg457x22H/MwpL
 V/L0hoUfv7y3aADW3Kg18/FYvENqM0LHB+7q+8TWxZoQAAAA=
X-Change-ID: 20260608-airoha_enable_gdm2_loopback-minor-change-fda3a3351a06
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Move the get_sport() callback invocation at the beginning of
airoha_enable_gdm2_loopback() routine in order to avoid leaving the
hardware in a partially configured state if get_sport() fails.
Previously, get_sport() was called after GDM2 forwarding, loopback,
channel, length, VIP and IFC registers had already been programmed.
A failure at that point would return an error leaving GDM2 with
loopback enabled but WAN port, PPE CPU port and flow control mappings
not configured.
Performing the get_sport() lookup before any register write guarantees
the routine either completes the full configuration sequence or exits
with no side effects on the hardware.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..cbc0f4079df0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1905,6 +1905,10 @@ static int airoha_enable_gdm2_loopback(struct airoha_gdm_dev *dev)
 	u32 val, pse_port, chan;
 	int i, src_port;
 
+	src_port = eth->soc->ops.get_sport(port, dev->nbq);
+	if (src_port < 0)
+		return src_port;
+
 	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
 				    FE_PSE_PORT_DROP);
 	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
@@ -1934,10 +1938,6 @@ static int airoha_enable_gdm2_loopback(struct airoha_gdm_dev *dev)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	src_port = eth->soc->ops.get_sport(port, dev->nbq);
-	if (src_port < 0)
-		return src_port;
-
 	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
 		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
 		      FIELD_PREP(WAN0_MASK, src_port));

---
base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
change-id: 20260608-airoha_enable_gdm2_loopback-minor-change-fda3a3351a06

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


