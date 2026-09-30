Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07ADC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=; b=4e4CBKHL15uZzYVPdlqKKrlnqC
	Wpaqlp1JDEUvHFA7JxFZbYiK3x4Z6zs0ypZGhLfMakSCMp+2wmakMus3H8M0ClvTKkXZy9HTXRjq/
	7HUn3tdmyHPSgTCHfM7n6HaViED4ocfvbJX93CsaMjusZGwnvI0uyBa03f6VVYu9cY2EP5cxXvJYV
	cxsWCdWfMLagnkqMjqh7yzBczwipFZLSgNeOOEf900An+7xCPE8QD0Wv0SFuj92UBXcgMU7CTbS2P
	lvBwcojmMnEuqOkGZe7YjI21txs5ovgHQhu5KSHAHfBDz45yYIN/qJqgpjKiowarJ1+dhlraXkpRb
	LFomI1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoHa-00000005Cvo-2rzw;
	Wed, 30 Sep 2026 06:59:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoHZ-00000005CvO-0tW7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=; b=TH9ISB63pCLDQnBcU6DGlo2SXy
	vvBu06tTzhID3JTll2cnjPy8tWSLLx6dH3RbBVwjmFUmRt+QNL2HMyNLVbfz0RsJoefoUkXd6YFNd
	dBAncxvZw3FD0pgmrhWM53pu3lNA+FDiqFWKHeIej9ZE0H2bxSPXnghqScsnDwixH36qjMj7ub8cP
	RlOtyJg9oNt6ndg56NTcAFZG4M1XAKRYpF4EapwXswqYOjjb9H+gBlN0Zv4+yML5lThywymKg3UIT
	B1FeLJUdybGt5uPVnj7NDYbD+e6dSUT/socY/UOxvkY6q7DbncIUh9y+HqD8rvsQribSDwnDlbdTi
	Oys8rmEQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBoHV-00000003RJP-0FHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:59:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d8239so40309385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751547; x=1791356347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=q60OalJ0xpm6AzOZj9m+MOunIIS1lIp+6aBkMK0NLX+5Fyof5+2BcGPqkn/Bm/CxjW
         nVoOLNC2Mh2juWm8pUMKBW42Qm5FrNcES2LCu6dr25VKWTdPvN4Ozu6z3QFEWmotev0j
         ls1spL93lJMWvycUfR10+F+1AEWs1H09kfyNKG64VM/HewjNku+4YIC1124EfLpIo+V+
         BPnaNtotIrZHy91HJDOareLJHD5PmLLK0uhUACIyr194AHw0tD338LAs4uR+q01irVuB
         w1kiZaUSyoPWagPsGBLBV0ady3+uBkZgj3ivMqqC1wl2e8GlSe3qdb6LzALNgI2dgOs3
         JmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751547; x=1791356347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=qvyXDzjRZ6bZuMBjaLXD8iKM5Kqr8YLfMxI5QxZgbXBvmgfU6beHNiiwyroXUdleuM
         /DFRXFkJ32n5kfMXleGt+N1F1nmgjkBsQYY+oggIXn+oBdLq6RF23V00PPIzTzp/rRyq
         yVcdyLc2n2zdVX1tGCx9MsbSMFQZ35qcIXqL9Xr7ed0UNocGK+rMbob+QGBuX2TPIwEj
         CZ4wkwpOt0S+Kbp8OVdjVxQpricsokb4fYuyoWilqvJKyDYl13/oOaxQdhc1/KIvtVHq
         zAR/FpgLcD/NzleVtW/ORF/aGE7kwQhRPsI3p3Z58xsLxbDo2B698Okw2tCy5oGP7/J4
         GPKg==
X-Forwarded-Encrypted: i=1; AKwUvBwOflah+8DwVbTLt2ZebqiTAjUzvr760bEskseKgAQNtTs8DqQlzMNuN1/xbOiIZia0NthiYzWeFu+tgwW3ymGh@lists.infradead.org
X-Gm-Message-State: AFuF++m/8gg5qwjrqZy2apZ3ea9J6eTcGOIEIMrp55aG0gvYdxHq13Kd
	A4+tD7XEwFAD/pyOsGWSkyKmsh+uJOPYMsH9Mc3Gf7WntFF/hsVGZm3q
X-Gm-Gg: AYBFou2G5MPtKU+cQktKC+DH1fO/VQdK6cx3DwYL5FOVSq6G42NLO8pRD8WMvZhv8xJ
	UNhKqIjRLhIGBboKW5bo3FOV0GT3LZUeyaC1R6TnNzrgifJEpaBzh5XiHIdxSWvpar93y+IUHQB
	IsHT+mWOamQSK1Je1AgfEVZ6TVbkmJgfJ+QzQxyz6pu1BNLv0ZfqPouEkHefrGQMNuhCGxK7nl3
	napf92IDGbEG74/+2cZclgafhPBeCXiW6Yu3cgH1d/EQvomYDOdWO9JzSeMIGriylFFV6LeYdAB
	iNzzIoZLggQxABB3oUV5wm73eXcAPGpC8JM8YZN7WfX0Vay7BMpI0T8pIHxEp7kl924XAY0Dg6P
	F/nbe3WS/EErDSFxlvL5KcBgnxlrK6rb5ztJAvOVC56OKl4DymoocVPFvjNnKdPpOLVoy2AAmpn
	5tbjIMBO5KgJ2GEq8dJWyhXmRangXJm5/eft8PzZOwllhpXTEhvPkzl+QJOlFgfCjKILUcV3ZlC
	4KfS0e3ZXjruVhEYcciuswovcB3AjjwHZb9/kObRgVZ08jBfcNOMr84CtG5Slb7
X-Received: by 2002:a05:600c:1f8b:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a01addee56mr5091765e9.7.1790751546607;
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0174fb304sm27802115e9.11.2026.09.29.23.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Leto=20Liu=20=28=E5=88=98=E6=B6=9B=29?= <Leto.Liu@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net v6] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Wed, 30 Sep 2026 08:58:48 +0200
Message-ID: <20260930065855.46171-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_075909_452000_9260767E 
X-CRM114-Status: GOOD (  21.33  )
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

From: Leto Liu (刘涛) <Leto.Liu@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

It's enough to try a second time for the TRTCM config to be actually
applied to make sure we are not in the middle of bucket handling as it does
operate on fixed time slot internally.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Leto Liu (刘涛) <Leto.Liu@airoha.com>
[ improve commit description, drop memory block, apply better loop logic]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v6:
- Out of RFC
- Fix to correct Author (confirmed by Airoha)
Changes v5:
- Drop memory block (not needed)
- Loop only 2 times
- Improve description
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memobry block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 21ac80bdd084..b164a78ddac9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3120,14 +3120,34 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	/*
+	 * HW might be in the middle of bucket handling and might
+	 * require an additional try to actually apply the new TRTCM
+	 * config.
+	 */
+	for (i = 0; i < TRTCM_CONFIG_RETRY_MAX; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
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
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 286f73e2e1e0..d270729e22ff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -184,6 +184,8 @@ enum trtcm_param {
 #define TRTCM_TOKEN_RATE_MASK			GENMASK(23, 6)
 #define TRTCM_TOKEN_RATE_FRACTION_MASK		GENMASK(5, 0)
 
+#define TRTCM_CONFIG_RETRY_MAX			2
+
 enum airoha_dma_map_type {
 	AIROHA_DMA_UNMAPPED,
 	AIROHA_DMA_MAP_SINGLE,
-- 
2.55.0


