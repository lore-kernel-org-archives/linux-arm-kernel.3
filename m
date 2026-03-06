Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC35F01807
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O9A2qr2mPCYu7zq8Xo/Aefj367eyhATdHpRyW+OzPD0=; b=1/ja4IiP+vdV4iQSSMZFT0FtpN
	xiaTOjR0Er8Fg1b++5lg9pvz8spQkZTP0cCfKfnGlJwQGeQpqO/uT9tyDDwne0sK7IY0LIEfPDTtj
	HBnfFkyqfAh6Hm+b1VJiwMwnSgBR9a0ZlaaqS/FWfAr/cBWRL0S8nSfmFCJ1Rbx7+Kb89wWbeZc4j
	MIbWqMdm9pY9rKom1za70Xn5dPXCv16Y/w9Si2cVrEDqcrIXSHUJPPiQjHNE9jqOkFFQE2QRaW8JI
	/zyJV/Es3RpeS5qLk3hGHegDOKcjUbw4nT41DwzI02N9AG7uQWg9KsECWLOfvtA2xKuVkKnrZF0d5
	u+dwATXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQDv-00000003Dlz-3ASI;
	Fri, 06 Mar 2026 08:07:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQDq-00000003Det-0NWE;
	Fri, 06 Mar 2026 08:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FD9460127;
	Fri,  6 Mar 2026 08:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCF8C19422;
	Fri,  6 Mar 2026 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784464;
	bh=w4YyGty+4MjVaZXa4YhrFXoqiPmZ1FzsE7rE0bfYb40=;
	h=From:Date:Subject:To:Cc:From;
	b=gC65MniC1ninb+IVM7axLnpe5Hvxmusxe9kGd3ixC/VE0V6PAST6MKogy+led8Lth
	 v128XxXNNEuaycyr5RLq5SzeJLR38Hw4HcHmgiV9VxTxcmaJM4e0gWYGxKLYWVtpdu
	 DO1HzkuDNMJD7rcKYwvcjnUH36E13EqYbfCgAKFyVucAQ9oXVesEuABd35ZnctzIOS
	 tdj7z3mAak55b6zSiI6fCy0mnpXpu2ctq6epVNAASQB3xAT1nUuUNN5kHfwgL5esWA
	 5i8fsfpjRdkSiLVN5CrNZ8R55WctRHWgRp/J+OPocC5qOLsr3vlNOoOygpjvPwXOZG
	 RGAfONVR7sIJA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 06 Mar 2026 09:07:27 +0100
Subject: [PATCH net-next v2] net: airoha: Make flow control source port
 mapping dependent on nbq parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-airoha-fix-loopback-for-usb-serdes-v2-1-319de9c96826@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNSw6DMAwFr4K8rqskony64h4VCwMGIhBGTotaI
 e7elBt0OU9PMzsEVs8B7skOypsPXpYI7pJAO9IyMPouMjjjMuNcgeRVRsLev3EWWRtqJ+xF8RU
 ajK6OA7osN2RsmtnyBlG0Ksf7GXnUkUcfnqKfs7nZ3/qXfrNokcq0YdMXZd5RNbEuPF9FB6iP4
 /gC4GyyZtUAAAA=
X-Change-ID: 20260228-airoha-fix-loopback-for-usb-serdes-2670a0146195
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
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

Flow control source port mapping for USB serdes needs to be configured
according to the GDM port nbq parameter. This is a preliminary patch
since nbq parameter is specific for the given port serdes and needs to
be read from the DTS (in the current codebase is assigned statically).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Rely __field_prep for non-constant mask
- Update commit log
- Link to v1: https://lore.kernel.org/r/20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 10 ++++++----
 drivers/net/ethernet/airoha/airoha_regs.h |  5 +----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 09acbe6695368132ddd92c3501f8711476db73f6..7b47d9e066cee75609501f87b0e97d936325517c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1729,10 +1729,12 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(val),
 		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
 
-	if (port->id != AIROHA_GDM3_IDX && airoha_is_7581(eth))
-		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
-			      FC_ID_OF_SRC_PORT24_MASK,
-			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
+	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
+		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);
+
+		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
+			      __field_prep(mask, AIROHA_GDM2_IDX));
+	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index ed4e3407f4a0e8b6a630ea1213ef155604479b66..29878b954c77c79ae45e63357840a10c23c517f2 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -376,10 +376,7 @@
 #define SP_CPORT_MASK(_n)		GENMASK(3 + ((_n) << 2), ((_n) << 2))
 
 #define REG_SRC_PORT_FC_MAP6		0x2298
-#define FC_ID_OF_SRC_PORT27_MASK	GENMASK(28, 24)
-#define FC_ID_OF_SRC_PORT26_MASK	GENMASK(20, 16)
-#define FC_ID_OF_SRC_PORT25_MASK	GENMASK(12, 8)
-#define FC_ID_OF_SRC_PORT24_MASK	GENMASK(4, 0)
+#define FC_ID_OF_SRC_PORT_MASK(_n)	GENMASK(4 + ((_n) << 3), ((_n) << 3))
 
 #define REG_CDM5_RX_OQ1_DROP_CNT	0x29d4
 

---
base-commit: e5e09233e8a9179b260460fdb28df5c24bcfbed6
change-id: 20260228-airoha-fix-loopback-for-usb-serdes-2670a0146195

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


