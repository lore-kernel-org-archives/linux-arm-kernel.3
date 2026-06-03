Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2C6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=; b=vaWVsJUS6qUv84ihC2QlItzb5c
	ijS8ILpQBkYASx5L3jLP74rIeHEtEHWhh1OgB413f35We3jMSyyv+zHlR3keQfke8IUmVUj3SANvC
	dgMP7LKi76pnaexJbR809twhMbohPOGZXrYcpfdWMsu5rzpg7/EsmPauBQXgy546u2b53MGoyNXI/
	RAWzb2YOy1EAtYfGAI4TgJwo0k62s7axBHR7u8Sx4SOd3j8g7zhuDorgWZcnV8Hb6Zxwv+fDbV81+
	K+AyXSayhg8KENPHn5a9fDoGnbpt8iYkecwv+VYR0DIPfR4B1DRHtiHqSKa7fNzxQ0R85NXRssj2O
	Z8mYuONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfwx-0000000ETXV-2o8W;
	Wed, 03 Jun 2026 07:23:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfww-0000000ETWj-0Pwz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 07:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=; b=gMwDy4/qeMH9ccgSVj13s2dWer
	y8oA14PQBsE/+qhLLGpxKc10SZEgo9U0P7NbtQlywaleSXePcEZkRuYoRphSj4dDSBwuAH9snOuHV
	VVjtOEpgr6G4RwPi6N+T4du/eC51+TxRx+74Fb6Gh5nC3R4cg2EsoQxKrbJiMZcSZBOCk+q+2Ffd7
	98TImmjkZwz3Y7Rv1Q2qPvXVA3cPeun69m+xfCtq7dnyQmliQbqvedK62+6Wh4MCc8qNA4VMPBQpX
	q5DLHf4eFbAFh5cz++GK8RrZ7VRlQ6lwiY8kfjCK0wIJuuqh7RXY8lUR8TDvOp4L8XAGmTgu/Q/ya
	DdmBacsQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUfws-0000000BPg3-2iqV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:23:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso33242235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780471412; x=1781076212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=;
        b=Iibtle+r4D60KH5toLz0zkROS/6CT/2ANUR5WegoXEgyzRYq66/Rz+t15pNw/qoVb6
         +ngC8WZRnYYtqxr1ZYYfrVX1KfdT8zSut7+/ONNbq0ebAvgwhiimOw++AAOM8gOTOnI5
         BmUox1ZXMSDUhDK+TWLujNey/qguOMkC0iGx7Rfw57L9fIr9rEWIE6B0u60iAJCDJHJA
         HG+bPbkT6zTAS4XTExJhsQ/N80BVIrmRQFlng5BVJX9Ra1CSpkCI0UKMSgNx5pUaGaSl
         mRYd3/JysUsqPlc/R9XlHAFEORGp0vzQuVKmr0+cRpkbtRldaYywp5TmuXJrCJB6T4FI
         pajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471412; x=1781076212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=;
        b=Y8H+qf0IG74M/U+E2dSFdZoa9EwhU0AB7hJ868XrKbzmlJUzeJ5szphIUTY+nirk2p
         kKfybSwPChaCQpkl57VAdUjnQoQFLS8nxTiHWjcWLFK5ykph281zhnehuaWpxU0iQnVE
         IwfHJlZjadigE+6qvOVCmEq/BT9/nV2DKziWcL1fGwMunZfgIZZqBNEj1E1Qru7CtJqQ
         Xi2I3h5i3Z2reBrF7g+yLnSJ4/f0sJC0SWas977kibw4svA2QfLNPfhLcZaudqpvOYBe
         QWlI7b7+FTWAxrCD5N5/Bg2Lkzz1P61d+2xG61vhT2fWpH7rJ4cOjLc75j5Oa0l8GXKz
         2f3A==
X-Forwarded-Encrypted: i=1; AFNElJ/+0L2PF/cCZPISe29tSJYb6j9S5VoRbrLYZ6DiO8ilmBMysNzEvbPT6THSYke3a4N00ZlP1OKCe/WZhoXTjuip@lists.infradead.org
X-Gm-Message-State: AOJu0YwM2U6mjEqQDtRzzQ64TskU9lyU9dY9LzQzi6E0eZgx4UtGz+a2
	ueCHWNkH6HmuIsgN7bH4n2cc7SMUA9sK1bqmTRxipdI+nZg3i6LArcDh
X-Gm-Gg: Acq92OFkV81IkROSAd8/WM6FykFoZ/w4Y2BeiI3O3hRqlpuSFeUYXFcEFzuy3XpNu5E
	oho3SpFhPQGp0i1sMT91iF2RO152EouTqP8vPIFDgT1whm6J5EaTTAn0bhMk8rt3MvXvghUnkqH
	8+tagB0je8lkbubQE1AThtElRrifKY/Z2YeIYAdPWwOoogokWYln4U6IXevLLdlbrnnaJGBpUQk
	lkAe8Mfi2iKw+387MiTCl2nEE1xkAEzsqlI5J/V+OayAFglkF8V8o++m6eyjQP+B7fISJzKZR/y
	YrmbgYg5iEiIdMU+RGCjvN5UCMDPbteWzEax4cpOyzBssMyGrdJWFFjiplREO+W6pXspRcVN9uj
	wQoxm4400CMK5QymGSrIDpNHhizcQYrfk1ooTrT2PPwLhHF8UMoqQvjHMy5xOFvzK2t+XtwEecf
	4zkOJIl8WOet73q0AyoKb5gRbfprHdRZu89ntiwg342dpmEaU6kfDTmUyT1bDg9c0rPuWRRfdfT
	vnXwBB2abtWSulDnoDglJiCnlss5L4SsdbA6d+RYaA6u75lbA2oAMbgIWKZyBaIOXjQMhAmE7XB
	+EI=
X-Received: by 2002:a17:902:7b85:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2c1641b148dmr13579975ad.27.1780471412125;
        Wed, 03 Jun 2026 00:23:32 -0700 (PDT)
Received: from bass-virtual-machine.. ([111.202.175.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa072asm14750055ad.34.2026.06.03.00.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:23:31 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: sven@kernel.org,
	kbusch@kernel.org,
	linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] nvme-apple: Use acquire/release for queue enabled state
Date: Wed,  3 Jun 2026 15:22:05 +0800
Message-Id: <20260603072205.3291888-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_082334_771820_D5D558ED 
X-CRM114-Status: GOOD (  15.20  )
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

apple_nvme_init_queue() initializes queue state and then marks the queue
enabled. The interrupt and request paths check enabled before using that
queue state.

The existing wmb() after WRITE_ONCE(enabled, true) orders the enabled
store before later queue use, but it does not publish the earlier
initialization before enabled becomes visible.

Use a release store when enabling the queue and acquire loads when
testing it. Keep the existing wmb() in place for the
store-before-later-use ordering.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Found by auditing READ_ONCE() used for synchronization.
A similar fix can be found in 8df672bfe3ec.
---
 drivers/nvme/host/apple.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c692fc73babf..fcaf8f230b19 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -151,6 +151,18 @@ struct apple_nvme_queue {
 	bool enabled;
 };
 
+static inline bool apple_nvme_queue_enabled(struct apple_nvme_queue *q)
+{
+	/* Pair with apple_nvme_enable_queue(). */
+	return smp_load_acquire(&q->enabled);
+}
+
+static inline void apple_nvme_enable_queue(struct apple_nvme_queue *q)
+{
+	/* Publish queue initialization before setting q->enabled. */
+	smp_store_release(&q->enabled, true);
+}
+
 /*
  * The apple_nvme_iod describes the data in an I/O.
  *
@@ -677,7 +689,7 @@ static bool apple_nvme_handle_cq(struct apple_nvme_queue *q, bool force)
 	bool found;
 	DEFINE_IO_COMP_BATCH(iob);
 
-	if (!READ_ONCE(q->enabled) && !force)
+	if (!apple_nvme_queue_enabled(q) && !force)
 		return false;
 
 	found = apple_nvme_poll_cq(q, &iob);
@@ -780,7 +792,7 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	 * We should not need to do this, but we're still using this to
 	 * ensure we can drain requests on a dying queue.
 	 */
-	if (unlikely(!READ_ONCE(q->enabled)))
+	if (unlikely(!apple_nvme_queue_enabled(q)))
 		return BLK_STS_IOERR;
 
 	if (!nvme_check_ready(&anv->ctrl, req, true))
@@ -1016,7 +1028,7 @@ static void apple_nvme_init_queue(struct apple_nvme_queue *q)
 		memset(q->tcbs, 0, anv->hw->max_queue_depth
 			* sizeof(struct apple_nvmmu_tcb));
 	memset(q->cqes, 0, depth * sizeof(struct nvme_completion));
-	WRITE_ONCE(q->enabled, true);
+	apple_nvme_enable_queue(q);
 	wmb(); /* ensure the first interrupt sees the initialization */
 }
 
-- 
2.34.1


