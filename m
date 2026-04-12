Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C281BE64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LqfVVStbOlT4DXnXM+T9GIVxgtIHCLqQa4S5/50wtw=; b=iq0uV1QtlPslfX/r2mqFoHjonf
	3a6CwGBRZiLVkEY81r6qsSHQxaFKVjojfy7gm3U+PDVTUsOEfELlaGhVsyBoIZycuc67DcpbNnURY
	2PKtjpTsgIhMDKaQXVIXSno79PQUBI5gk6u5ZUyAgZOmqOABgpcjetSfBBGhhVJiltcLmv9W4Xnay
	RAdcvJny1ZEGDYJKz5Z3hRFFMO5Bk1jW6ronmTBK63yluhsvsgDQrCnmPG3w/MU7UVVzzM/86NHTp
	GZENxhBFym7C68kOaiqCsybuaJ7pWP9I/ijn34Qp4Jis5O33zRTAqLveb9cKSJcQTA9ozUy2SrrX8
	mkJ7tutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqPt-0000000EADc-0tUG;
	Sun, 12 Apr 2026 08:43:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqPq-0000000EADC-22Lo;
	Sun, 12 Apr 2026 08:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5390941990;
	Sun, 12 Apr 2026 08:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9979BC19424;
	Sun, 12 Apr 2026 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775983417;
	bh=fR4xkjuGCLJHBTxO040OymgXA4yd4dowEx+1+ardsFU=;
	h=From:Date:Subject:To:Cc:From;
	b=Zah5asWQkPVZs3mMcEZP9qbES6XbPKDeeMYD2w7o10qTmltxV40RcjW1yVyoHD5YZ
	 nBrDZNGE5gic4YinYkAhidQpNPeHy7qZQ5cZpSYOh7Yn/61G273T/Sshuvkt8Yhx9i
	 XlO/mecZ9Tq0cqlu+mh1UwD+c/QuWaIpYdHrs/P2/edmSEcxAFdPp+KG9EZjeDBP+W
	 sFDWim3SgXBasfab/1Qtr3bQV6ACkYokB9JtjgI3fOpu70T2lHdi04Qu+jFwfFcLRL
	 igaIYmbbrnn3d8zrnkXop/39ZPNxknhn8JuhVDNo85pMl0qfcuXyz5K1hBvlY2sNSS
	 gI0TRPM7+8o7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 10:43:26 +0200
Subject: [PATCH net] net: airoha: Add missing PPE configurations in
 airoha_ppe_hw_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha_ppe_hw_init-missing-bits-v1-1-06ac670819e3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBG4auUWTuQRBH0KiJhbMbmX5iGTFCh9
 O4Gl9/mvY1MG9ToOm3U9A3DWgb8YaI5S1mUkYYpuHB2Jx9Y0NYssVaN+RNR0PkFM5SFH+jGx+S
 chHCRNHsaldr0ie//cKOine77/gO/4QwPdgAAAA==
X-Change-ID: 20260412-airoha_ppe_hw_init-missing-bits-3d00a229adc1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_014338_569226_12AD6C78 
X-CRM114-Status: GOOD (  10.90  )
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

Add the following PPE configuration in airoha_ppe_hw_init routine:
- 6RD hw offloading is currently not supported by Netfilter flowtable.
  Disable explicitly PPE 6RD offloading in order to prevent PPE to learn
  6RD flows and eventually interrupt the traffic.
- Add missing PPE bind rate configuration for L3 and L2 traffic.
  PPE bind rate configuration specifies the pps threshold to move a PPE
  entry state from UNBIND to BIND. Without this configuration this value
  is random.
- Set ageing thresholds to the values used in the vendor SDK in order to
  improve connection stability under load and avoid packet loss caused by
  fast aging.

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c2c32b6833df..62cfffb4f0e5 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -111,13 +111,13 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 		airoha_fe_rmw(eth, REG_PPE_BND_AGE0(i),
 			      PPE_BIND_AGE0_DELTA_NON_L4 |
 			      PPE_BIND_AGE0_DELTA_UDP,
-			      FIELD_PREP(PPE_BIND_AGE0_DELTA_NON_L4, 1) |
-			      FIELD_PREP(PPE_BIND_AGE0_DELTA_UDP, 12));
+			      FIELD_PREP(PPE_BIND_AGE0_DELTA_NON_L4, 60) |
+			      FIELD_PREP(PPE_BIND_AGE0_DELTA_UDP, 60));
 		airoha_fe_rmw(eth, REG_PPE_BND_AGE1(i),
 			      PPE_BIND_AGE1_DELTA_TCP_FIN |
 			      PPE_BIND_AGE1_DELTA_TCP,
 			      FIELD_PREP(PPE_BIND_AGE1_DELTA_TCP_FIN, 1) |
-			      FIELD_PREP(PPE_BIND_AGE1_DELTA_TCP, 7));
+			      FIELD_PREP(PPE_BIND_AGE1_DELTA_TCP, 60));
 
 		airoha_fe_rmw(eth, REG_PPE_TB_HASH_CFG(i),
 			      PPE_SRAM_TABLE_EN_MASK |
@@ -145,7 +145,15 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 			      FIELD_PREP(PPE_DRAM_TB_NUM_ENTRY_MASK,
 					 dram_num_entries));
 
+		airoha_fe_rmw(eth, REG_PPE_BIND_RATE(i),
+			      PPE_BIND_RATE_L2B_BIND_MASK |
+			      PPE_BIND_RATE_BIND_MASK,
+			      FIELD_PREP(PPE_BIND_RATE_L2B_BIND_MASK, 0x1e) |
+			      FIELD_PREP(PPE_BIND_RATE_BIND_MASK, 0x1e));
+
 		airoha_fe_wr(eth, REG_PPE_HASH_SEED(i), PPE_HASH_SEED);
+		airoha_fe_clear(eth, REG_PPE_PPE_FLOW_CFG(i),
+				PPE_FLOW_CFG_IP6_6RD_MASK);
 
 		for (p = 0; p < ARRAY_SIZE(eth->ports); p++)
 			airoha_fe_rmw(eth, REG_PPE_MTU(i, p),

---
base-commit: 02f72964395911e7a09bb2ea2fe6f79eda4ea2c2
change-id: 20260412-airoha_ppe_hw_init-missing-bits-3d00a229adc1

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


