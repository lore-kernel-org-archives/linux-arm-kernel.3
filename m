Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27167606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43ZfXOQq;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xsp6i+Ui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RtuVHL9/omrRNBvcHmS0u8yV6iWbKVJcQ8hfDOCEdpQ=; b=43ZfXOQqb8tmmicjvbXN7QOf7z
	jm0G0FDrmOhhpurIbLPRuiNoJx/9dgFQ0hMyL1mPw4EXp2dBa+GEQPRHJ1QUBZFppAC5P39xS0Big
	JpX7ZOIc9yZ/T6It8PzrW6PiDCu/OdYnaY6xOlqxGV5kFZaJug85elxXIiHBLECJ02UEF/2cOQuZ9
	nOUjxt6xCJ/Bvcq0vTIPETQdAv6znk9SPmnPB6BHbsjg89g/K1EEsESwnCHp4JvrZDIX0pYzRnL/r
	Uji52Bp/q8Bv6jCzhrnDyfAMcMyjfs/DfbQ7yWp9Zzq5kfKPrF+Qt65fs+ue2uJOLOtf3IfivzkZ/
	AEZ4NcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODXi-00000002MPQ-155n;
	Tue, 03 Nov 2026 12:23:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODXe-00000002MOH-3TLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:23:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 79E3B4E413E2;
	Tue,  3 Nov 2026 12:23:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 317DB6046C;
	Tue,  3 Nov 2026 12:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D4E610328267;
	Tue,  3 Nov 2026 13:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793708576; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RtuVHL9/omrRNBvcHmS0u8yV6iWbKVJcQ8hfDOCEdpQ=;
	b=xsp6i+Uijz5hhHj3zfrjW78ybSqI/l5L3qEFLrOa4jDyHagGWK5yoBy/HME7hqKJkBAT7C
	Ix5/4mTO1xybw1/N8nWSsb+KEOLqbQpPUTH6effkk/WGhOyFJUt7IvwlKH11kuuPHabQYC
	q2kwEktXdGYcv88blWjZmXRx/jio1EPgRipFMqvkoeKSJtfZVvDuiVebnW3nsuU1MPqI3N
	KUqnIE/VdX52OHhljKg9MptV6mfNYosrVaSy/XBI+pSmAgCSzlJMxna4VwF/HCMlUHNHCY
	B70Tyand1vRZwQfM+QEeJ3RfdstG6RExHCJWAfTkn6wEFnsuV7VlqpOSwUvLZw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next] net: stmmac: selftests: Add missing endianness conversions
Date: Tue,  3 Nov 2026 13:22:48 +0100
Message-ID: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_042307_005066_B36B62CC 
X-CRM114-Status: GOOD (  12.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kbuild bot found some endianness issues in the stmmac ethtool
selftests [1] let's address these.

In practice these missing conversions didn't cause any issue, as the
masks / values on which the conversions were missing were either always
0 or ~0, so skipping the byte swaps lead to the same value being passed
anyway.

[1]: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@intel.com/

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This isn't worth sending to net, I've dropped the Fixes / Reported-by /
Closes tags, let me know if I should add'em back.

There are more of these endianness warnings in other places, but they
require a bit more attention. This'll be addressed at a later point, I
don't think we have many big-endian stmmac setups anyways.

 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 40811df8f2b7..df696e2c1528 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1216,7 +1216,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
 	sel->offshift = 0;
 	sel->keys[0].off = 6;
 	sel->keys[0].val = htonl(0xdeadbeef);
-	sel->keys[0].mask = ~0x0;
+	sel->keys[0].mask = htonl(~0x0);
 
 	ret = stmmac_tc_setup_cls_u32(priv, priv, &cls_u32);
 	if (ret)
@@ -1463,8 +1463,8 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 
 	key.src = htonl(src);
 	key.dst = htonl(dst);
-	mask.src = src_mask;
-	mask.dst = dst_mask;
+	mask.src = htonl(src_mask);
+	mask.dst = htonl(dst_mask);
 
 	cls->rule = rule;
 
@@ -1594,8 +1594,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	keys.key.dst = htons(dst);
 	/* Match the full IP proto field */
 	masks.bmask.ip_proto = 0xff;
-	masks.mask.src = src_mask;
-	masks.mask.dst = dst_mask;
+	masks.mask.src = htons(src_mask);
+	masks.mask.dst = htons(dst_mask);
 
 	cls->rule = rule;
 
-- 
2.56.0


