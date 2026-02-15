Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674CEE63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peOWO7x8XxQV4Leh2i0Qv0Qk6Bk/W2PHAwv2rBI0g+Q=; b=WkDykT2piWgGfpjdoOip9BsEc0
	zmvPG5POGjOlwnUIVXSTtSKhLrqXBO3FOq8+iG0CTiX3b82HhgJypNjPvHMfF/2GPD/+I3ifb44Jq
	wWlq/kYTHnTzYkVkr5N4+OkH6qkeRUsAIrw53seqcR8Ljdjd61KA39R3FdSP70+xXzWdt1cPZjXRr
	AL+0VraC0dClXG8m1hbjWhmA4OozaVYcaLuwJ37gVl9uhwNg42IH4P1yOyHgp8FCTT4f093gC3T1O
	vM9iVzAjldeYRqe6O+vDMvJst3I5Io1FLsxKU0PVSG0W3gtucQ9X1ORgk4Kug0fFo8h60Xpwn22w/
	r9pY7sVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1V-00000005jOq-3ePM;
	Sun, 15 Feb 2026 22:55:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1R-00000005jKM-09bY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=peOWO7x8XxQV4Leh2i0Qv0Qk6Bk/W2PHAwv2rBI0g+Q=; b=Z6oNoO
	nzyyeFBxwFj+eweOFydcDR5vKSFCHUOhjUWUgt12QGWokvBkBmh/7/vgOWz8gtBB
	liAhwJjk115siWH7dowrX2CTFKn4w25I0sp+2hVPAnJbjwV1w/5Ix2pmVNN+uTz6
	nLns++LShebafSyWBVSV/+guGDijF2ACZ+OwzjX5tjo6npP0Fm4apC3c97BGO6xK
	zZXAJEzyyjJNVV6TPCjv2wubcZZOy9zaaNWEt5CvRaVYlhX5Qg81WsS43fLTTV3J
	pFYUnmRga+6ZZ94HLVn8Vp73BtomH1tXbz0UAxW7nElpJBBgIWbshouZTxhYA3tc
	IsSLxZvfkFX5V2Sg==
Received: (qmail 3011428 invoked from network); 15 Feb 2026 23:55:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:10 +0100
X-UD-Smtp-Session: l3s3148p1@4ST1uuRKzsAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 05/13] hwspinlock: sprd: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:45 +0100
Message-ID: <20260215225501.6365-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_145525_496437_B9A97B43 
X-CRM114-Status: GOOD (  14.35  )
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

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0d08efbdfb07..c19b680d5fdf 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -70,10 +70,18 @@ static void sprd_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(10);
 }
 
+static void *sprd_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *base = init_data;
+
+	return base + HWSPINLOCK_TOKEN(local_id);
+}
+
 static const struct hwspinlock_ops sprd_hwspinlock_ops = {
 	.trylock = sprd_hwspinlock_trylock,
 	.unlock = sprd_hwspinlock_unlock,
 	.relax = sprd_hwspinlock_relax,
+	.init_priv = sprd_hwspinlock_init_priv,
 };
 
 static void sprd_hwspinlock_disable(void *data)
@@ -86,8 +94,7 @@ static void sprd_hwspinlock_disable(void *data)
 static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
-	struct hwspinlock *lock;
-	int i, ret;
+	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -123,16 +130,11 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
 
-	for (i = 0; i < SPRD_HWLOCKS_NUM; i++) {
-		lock = &sprd_hwlock->bank.lock[i];
-		lock->priv = sprd_hwlock->base + HWSPINLOCK_TOKEN(i);
-	}
-
 	platform_set_drvdata(pdev, sprd_hwlock);
 
 	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
 					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM);
+					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
-- 
2.51.0


