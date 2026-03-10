Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58258FCC9DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V811ZnR3+6B2X2veFZsr6SS9lD2yc+/nKwkhuTtKc88=; b=A04LAAj7mGgD/czimwisrO3Pb7
	4AEjGVUAqoFrjIbNMWCcfGAByGO9Xbq0Rl9ftQ6U9N4ISyStVeaQqCKyarGKOs0pChnKG3c4OpTde
	sT53onNJVGOtqvLAAMmEJeoAO3RKifzYa2NfkzEa8s7S0LWbplNPE+Fw669Yj2J3APn6I6W0bZaIO
	ECBZ8HQJYVSNXCYR7lCYoARWXcGygb1znFzs0/Ibsowcj4JuTfbVhESHJLR8lb75TD7+qRe2yEyoM
	CmvYjt5EuRU2nHNOosGXOVzx1cOJWBZvmr9Epl5ADeSqKZ+HeQatsk6avLLg8dVZRKTK5CseOPj3n
	w7U6yPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrx0-00000008t0e-2JEG;
	Tue, 10 Mar 2026 07:56:22 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrww-00000008swk-348e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V811ZnR3+6B2X2veFZsr6SS9lD2yc+/nKwkhuTtKc88=; b=XA4+C4
	9xPLCLeAkef9lQ4nB92JMnoImim/26HnCm8q+lVdPdrRZDgFN00qJWJlQGZ5JYee
	4JUtrw0jBAlyvTJZOfwtPRncKcPpbHxTHYa61KfrYNVzJAt9coLRDdsvMfop4HIC
	uIMXHkIbBEdc8i0Tag25QnJvqULhZp4qupUIJ/Vso1wp/0diZ35PSnzWxc9utRs/
	gJdj8J7cQgzRN/YwcAmzxfUgOwVPgz5IcLiR9pXc2usd+ymJvFIsocI3OgCI8HvL
	NNkUveh+mAOAYqyGnqkBb3UGlbSW5QoErXXVUci4jQsAEisIPRX+S6t0gQ0ddTs/
	osHX73I95y75ecHw==
Received: (qmail 3112731 invoked from network); 10 Mar 2026 08:55:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:55 +0100
X-UD-Smtp-Session: l3s3148p1@LcRc2aZM2NIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:24 +0100
Message-ID: <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005619_050023_8CE00C91 
X-CRM114-Status: GOOD (  12.67  )
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
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index a0c76bba3f05..c3db81cb1793 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
 
+static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
 	.trylock	= sun6i_hwspinlock_trylock,
 	.unlock		= sun6i_hwspinlock_unlock,
+	.init_priv	= sun6i_hwspinlock_init_priv,
 };
 
 static void sun6i_hwspinlock_disable(void *data)
@@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
 static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sun6i_hwspinlock_data *priv;
-	struct hwspinlock *hwlock;
 	void __iomem *io_base;
 	u32 num_banks;
-	int err, i;
+	int err;
 
 	io_base = devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID);
 	if (IS_ERR(io_base))
@@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	for (i = 0; i < priv->nlocks; ++i) {
-		hwlock = &priv->bank->lock[i];
-		hwlock->priv = io_base + SPINLOCK_LOCK_REGN + sizeof(u32) * i;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	platform_set_drvdata(pdev, priv);
-
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
+					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
-- 
2.47.3


