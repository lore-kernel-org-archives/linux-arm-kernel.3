Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE179CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=; b=ayk47xUm9XSd8XgP3ICMeNXBAp
	DSfTrewchXWFQWKebOhD+SFdM8VPHY2eIFhwpXgMy8ymT0wllce/ztMuI8kVRmI4AysI+jbizc9vf
	65eHa1PM9rpCSrgVXhIdqQ7YjMIRQnLCXLnfouGnqhKgbifi8IMfPxBalXmbKefkG6pPS+Z2UNNwE
	myRvynbealJHlcPe+1u22fMo3sx4UTQ+fUUDgr6sQ1t70fYpl3kxkdfrsOhMowVFqMXkSgXUr8fPx
	tIxcUo4TwfUB6i4lDRHCsyzjKvZtFU1rWOKK++0PISCU1Wp75L0godU5nelP6JpUVDbFm8Qqm4I6G
	GMNfpdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCRb-0000000BqCI-3k6y;
	Sat, 13 Jun 2026 00:41:51 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCRY-0000000BqAB-0vdf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:41:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf2247e38eso14291315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781311307; x=1781916107; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=;
        b=QX1vsxf9oQW6jMwca205rSjH1imJGppk0vm035QkR/YMN2OkR7Kxq8LqXQ1E2HR5iK
         CV+PiBzy1STFU/JMp2bbQCKLs+JdVuJUfwEj4vNrmj6JafK6BH2U21HHM/t5Fqai9R/2
         R+OA9LT/yN+L+GmFAXdvx9Mr+W7S4D7TNZBfLhBK6k2oGmkR0FCUcKcKA5i+GxSAWxrN
         he7vWAgA2OlsHN4v7TEm+YajD880d55gac9vd2oQ8JpyJKH9gTHg/64ZMKTUq568Y1/f
         ms0lY6Q3Qw/u0PdaRPneqA2+oj3YZDKvYPqxDXfkoQ59kPhqPD2ej6oqvChweGlBiZxC
         5hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781311307; x=1781916107;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=;
        b=BkhQ3Es8ZkBlXBIYblZ2/3OrBSjmA1l3mjSwOHkWHq3qOBly2Uy1FZA78U8zO4im/2
         PbYerzgTK5wOd5sNqvem/61eQe8H9DUPR1yPebktVY0Mx1ua40fc31CQTgVF0cF47OuC
         kBAssc/GHtlkDA51W/SbACmDPbYcs/Pk/+cPN4OCM4lMnX8Hhf6KnS4OD+C5FkV/Op4Q
         YB1PG7nI2ufLCY3KX7BQPtmnIMd/jDRjf+3OkVYGjANs+qGws7KsM6l3u7Tuo3/cDcF8
         XPp0f6z9t52Y6bixdrW0qlu6L9bzNAu/rw1b6xWHDLTR1V+NN3sMTcdfIAs/ZZq5hK1x
         ZnFg==
X-Forwarded-Encrypted: i=1; AFNElJ8vk77up2zTsQmmj1iL+PALf2tkxK3DUn789t5+lrU3NMSFCj10hxSCnzzTTkCaX4U6Jj1To4jU94+JwaiV13+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzwSZUcTVZV9V2GRaJTFH4e+NuJ4vqmNzD/v8cb3UTT4IsPNuBF
	N5qvmEZhXdc9vCOgmxZYl33ycGkk7QZmLVLREvp49M4Qwo+Rkre/OUAdAFsnqcQb2c0=
X-Gm-Gg: Acq92OESKYVCZ6vnWLP/TAXQFdgLZjyThX0BCvJysulVCaD68IW8gMj014p3yFVoKpz
	EtMb4vJUvzoH185BLLrtsj6yGlHb5mJvm6X4fNRrKTkccwimtqCn1MKog+OmddLBieIcUTP4z0F
	ah1A+uTuM1gcO2DAl7LcImV6dQg/Mwoe2i7B2va8AnJ2if9noqHYMsPBKtDR/wfxpa0QkOdnqoI
	KNz8ovWoPhgE4nSu614cNKmkwX7P2m9Zl0uAHt4rYJY9ZXAKZZiBbzaKEp2cdFJeOU6MCa6RdJe
	lfKlcDzeQcSZ5V68nNMFhyS4eCnOjE6t/CQX/0weKq2pUw0HanqA6LZfYqONR8iYBt6tMMtgRkJ
	9LMwikSqUnpMsUlCO8eUKHUXh+797LLPW2EZLsKrLWCsGB7fZLPdBZT0iuLZcBRyOjzqBXqUuJq
	m7Hv4zFXwMzyIYA3DT
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr60346495ad.5.1781311307363;
        Fri, 12 Jun 2026 17:41:47 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac72asm35515515ad.38.2026.06.12.17.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:41:46 -0700 (PDT)
Message-ID: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:41:16 +0800
Subject: [PATCH] net: airoha: Fix typos in comments and Kconfig
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_174148_265507_87E8B2B3 
X-CRM114-Status: GOOD (  10.51  )
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

Fix several typos found during code review:
- Kconfig: "Aiorha" -> "Airoha" in NET_AIROHA_FLOW_STATS help text
- Comment: "CMD1" -> "CDM1" (Central DMA, not Command)
- Comments: "GMD1/2/3/4" -> "GDM1/2/3/4" (Gigabit DMA, not GMD)

These are pure comment and documentation fixes with no functional impact.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig      |  2 +-
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce50..1f6640a 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -29,6 +29,6 @@ config NET_AIROHA_FLOW_STATS
 	bool "Airoha flow stats"
 	depends on NET_AIROHA && NET_AIROHA_NPU
 	help
-	  Enable Aiorha flowtable statistic counters.
+	  Enable Airoha flowtable statistic counters.
 
 endif #NET_VENDOR_AIROHA
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..9d9d34a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -294,18 +294,18 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 			      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
 	}
 
-	/* CMD1 */
+	/* CDM1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* GMD1 */
+	/* GDM1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* GMD2 */
+	/* GDM2 */
 	for (q = 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, q, 0);
-	/* GMD3 */
+	/* GDM3 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, q,
 					 PSE_QUEUE_RSV_PAGES);
@@ -340,7 +340,7 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 							 q, 0);
 		}
 	}
-	/* GMD4 */
+	/* GDM4 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM4, q,
 					 PSE_QUEUE_RSV_PAGES);
-- 
2.51.0



