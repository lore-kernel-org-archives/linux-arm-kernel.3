Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2454ECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OBdMhJJ0Y7gIABwR1q/8w26Nesukt0v7qHvKC0K0k5c=; b=CmpSwtERNgid/pZWIEXA3h8bub
	3hWCWnttBD0aeRLajWGxLrD8FHzvKmGF75cKFxpq3eYY4nSmiG2Gpb2cPhWHxgGHVC/HAPCGFqPN8
	MKsJA99XxLGDDzJ8wTSSL55Vmre2b+vsM2ivOVz/sY+Yt8LBOtsSwto24/FO/WNN7ZE5zYqfYzS1H
	TgEbAC8/3Hd8JhfatNql7NZ5ENydQ4BlIauc4JToKnu8KvrI5t/tG/GIaon6rAFCUOaAOfv685u3e
	FPx6aAwJKNJtL8Q6HF+QUD8wU5I85MtL5H4toUSDkGN7yUJz98siTom8H5rI9PE5p5ECsGuolWwsi
	YqECizvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb3w-00000004lfP-0cYI;
	Mon, 22 Jun 2026 09:35:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb3v-00000004lf7-0FTM;
	Mon, 22 Jun 2026 09:35:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8152D60051;
	Mon, 22 Jun 2026 09:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10B31F00A3A;
	Mon, 22 Jun 2026 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120926;
	bh=OBdMhJJ0Y7gIABwR1q/8w26Nesukt0v7qHvKC0K0k5c=;
	h=From:Date:Subject:To:Cc;
	b=ESGrJIF2eQfsXySEQ1mH/Yr5U6gKvtDjbJbUD1pfHwSPS1P/07NVe66c+WqLyfvZv
	 Y11VRoAQKqjPfbCifvtqeV4qxwVWfP3iIueZciWP3CylDRwoL7Xat7B8didP6AKBUL
	 mIPk18XkrYB9YbuhblaEft+uGJTFgJ3qJ8+KZn3b5MDwoCD/bsC9NaCLBH0iYVdC3l
	 mXkY5ifmOZK6nWqlBH6t2vUJTQRSBCqFeM9GogYthIMZUDE9nkxjpbMwvvLjfZy2ET
	 ivBnwCqITnAr+sBqig407umXp/J8YsYYQRi5nLjx3hq7/WRxhpVdYDBOpvTUTe05e3
	 7tYOA4g3dNNmg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 22 Jun 2026 11:35:07 +0200
Subject: [PATCH net v2] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NWwqDMBBFtyLz3ZQY6qtf7qNIiGaioTWxkyAVc
 e8N0gX085wL9+wQkCwGuGc7EK42WO8SiEsGw6TciMzqxCC4KHnJC6Ys+UnJt56VDBhlpDjMclG
 kZkYYaWPGfphqtGiKsm96YSB9LYRJn50HOIzQJTnZED1tZ3vNz+mXqf/MrDnLmeFVxW+G63oo2
 ieSw9fV0wjdcRxfNIRUzuAAAAA=
X-Change-ID: 20260605-airoha_qdma_set_trtcm_param-retry-fix-a9d2956b9b2f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Leto Liu <leto.liu@airoha.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Brown Huang <brown.huang@airoha.com>
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

From: Brown Huang <brown.huang@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Brown Huang <brown.huang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Wait for write configuration to be completed before running
  airoha_qdma_get_trtcm_param() in airoha_qdma_set_trtcm_param().
- Link to v1: https://lore.kernel.org/r/20260608-airoha_qdma_set_trtcm_param-retry-fix-v1-1-f07704f0d8c5@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3370c3df7c10..bb5c0599a4ee 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2673,14 +2673,30 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	for (i = 0; i < 100; i++) {
+		u32 data;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		wmb();
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			return -ETIMEDOUT;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,

---
base-commit: d07d80b6a129a44538cda1549b7acf95154fb197
change-id: 20260605-airoha_qdma_set_trtcm_param-retry-fix-a9d2956b9b2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


