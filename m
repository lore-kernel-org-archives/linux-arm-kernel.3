Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DEDFCC9DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDIMIHD5xh8qvwSFq+3EkqfTJhIyn7kfCnloFC1bgFA=; b=gaeY5RuH2vV/LG41B+74jXa1Yh
	6DlFXT6lGVoDS7V8/3uCUqyQIj8EecdfoojE32SUikyHIwEuZMZQUScRtQ+K5XWsGjljn4T8MnGDA
	dPJVn/1wJS6bI6bnp0koisR5FWWdRP9XcMtr+NkhnJImDgl/WcyWmH/vQ0BHNMHMigPQAnHSTWQvi
	jQ1zVy8mXwKUmnHNpgx7/F/hWgfcRdIz3TAQoO+hmIUlKooqWECKLork2lQtH8wHbuvqWyLb5wRLg
	YeeSgazi64rKal3XpKiecv2e6vLdALnLHw4dRo2CxmYA6oWKSMltj5pWPO5VKYc7pO8ZGROb/x97H
	E+62sJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwy-00000008syh-0qfg;
	Tue, 10 Mar 2026 07:56:20 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwv-00000008svi-0ZJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LDIMIHD5xh8qvwSFq+3EkqfTJhIyn7kfCnloFC1bgFA=; b=QWR0Tb
	GPPxLY8rjfvrErDgwaDJyfSR/zyQ6OQr5MfiQGSSDrhzqw6CwcaJpHeD+etoMke4
	QJyXZdgzva9hfM75WMz6wcTswK9PttUr/aDqlc1PR4KoKbZ5/0SfkpMDbA606OFD
	Tj0EXLbBukqtyWuZffCTURrF0E8HTwFH+bEPBEAUsOsVPcSINqR6/ZD1bKAmUlbg
	eq49RS+CzOy7i4yd0qnbL/yi+SW5MH6y72eOaLc7KjOiG+8oOAB0TVhNrcqP33jj
	S1b/nOqLAytbE3QBWAOYpy8EWzFymGyPo4HMEjr7375/TvDA13p+aliIbAcUCe7x
	N3OP0TO7eW9EWL9A==
Received: (qmail 3112715 invoked from network); 10 Mar 2026 08:55:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:54 +0100
X-UD-Smtp-Session: l3s3148p1@I0tS2aZMytIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/15] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:23 +0100
Message-ID: <20260310075539.11701-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005617_452173_60823D78 
X-CRM114-Status: GOOD (  13.54  )
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
 drivers/hwspinlock/stm32_hwspinlock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 51e8e533ac31..62214f31f909 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -48,10 +48,16 @@ static void stm32_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *stm32_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + local_id * sizeof(u32);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
 	.relax		= stm32_hwspinlock_relax,
+	.init_priv	= stm32_hwspinlock_init_priv,
 };
 
 static void stm32_hwspinlock_disable_clk(void *data)
@@ -73,7 +79,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	int i, ret;
+	int ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
@@ -106,11 +112,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
-
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, NULL);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.47.3


