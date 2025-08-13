Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C206C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWksHDBmgI3dIadKYWOJxAKOIZlW7syLhIJmTFxpaxA=; b=15lUWcNNf6Z5nUer/plwyuy785
	xDQTfeYgI8RDMi54hmRvoyGRsBz7wLxGu0pWJxluoPLsi/GEaUQ5YCJKVik14GWKEdH0GsKuZet+M
	v16SMnS+ccVxqIkldQJlEfEPpZ+Jwcyv7AvHmTicuVXeNwQtspJNv+pdYGx4qdRyJ1OXRX0iYPinQ
	+Gct8A1KGKxkm8npVMnxZQTXxf3cr7xLifBAi18qMx2QivQMafIlffjx0cMLMpcEu66ak4TfJI+Xz
	rIi+60y2vzLgptEWCMmwXfqZ7HSLndQmCkMnvDtgYJQFew9vL9v4wfvUUWit26A5AH9HvWrld+crt
	ZOHsnsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJVb-0000000F65s-3697;
	Wed, 13 Aug 2025 21:59:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJET-0000000F3iE-2A3o
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wWksHDBmgI3dIadKYWOJxAKOIZlW7syLhIJmTFxpaxA=; b=SyPU68tOYLhgeANTsiLA+2xhpq
	STcZ8KtYxxM8aHUrqV6ONVc+2fYRJcDB+6KRi3Y4siDcHJl4nXXpuNDL7TScg0aeCMMD65JId0f+w
	RJQij3I5SN2wmc+BvJkfmGIknc9lNad4MNzXN4XItevuU8dWwlHbLPwk0i3h+mP6z/ks2OyuK2HVo
	MY3VE2Ha/oCgI6abZSAB7GRxZN9Rij6PPJ9GPgQ34ERGLuIuIlIcKkQTmOsU+Jjq0lEi4wWgBMBhx
	RF2opDXlNhiFkOlrLJt8vM6vIyW9nkLhljcDPLsFsq/reToqJsExJKZDnDtH/FIDUWk4LmRhCAA22
	dAWk9YEA==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEK-0000000GCxB-3Cv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:42:03 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfeK01788737;
	Wed, 13 Aug 2025 16:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=wWksHDBmgI3dIadKYWOJxAKOIZlW7syLhIJmTFxpaxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hwprcvhEofD7vETt+EIe1r/OT111emuuxsiAP1mZzCEyDtFBHXdfEa8rVgei90vYb
	 E3ZMoDDXI+YxhUJm9Zlh4m848bhKcfFM0svNuie7XtNwopBm8LpT2HBhqlcCT8TKCl
	 fMFRLZqkmMx+0yUXmcI3ZYpkjtYHUdgqVNB/yknY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfeTR678594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:40 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNG2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/6] reset: ath79: Use devm_register_restart_handler()
Date: Wed, 13 Aug 2025 16:41:33 -0500
Message-ID: <20250813214138.477659-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224158_916847_19EC813B 
X-CRM114-Status: GOOD (  14.63  )
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

Function register_restart_handler() is deprecated. Using this new API
removes our need to keep and manage a struct notifier_block and to
later unregister the handler.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/reset/reset-ath79.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/reset-ath79.c b/drivers/reset/reset-ath79.c
index b5d620132052d..4c4e69eb32bbc 100644
--- a/drivers/reset/reset-ath79.c
+++ b/drivers/reset/reset-ath79.c
@@ -15,7 +15,6 @@
 
 struct ath79_reset {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	void __iomem *base;
 	spinlock_t lock;
 };
@@ -72,11 +71,9 @@ static const struct reset_control_ops ath79_reset_ops = {
 	.status = ath79_reset_status,
 };
 
-static int ath79_reset_restart_handler(struct notifier_block *nb,
-				unsigned long action, void *data)
+static int ath79_reset_restart_handler(struct sys_off_data *data)
 {
-	struct ath79_reset *ath79_reset =
-		container_of(nb, struct ath79_reset, restart_nb);
+	struct ath79_reset *ath79_reset = data->cb_data;
 
 	ath79_reset_assert(&ath79_reset->rcdev, FULL_CHIP_RESET);
 
@@ -108,10 +105,7 @@ static int ath79_reset_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	ath79_reset->restart_nb.notifier_call = ath79_reset_restart_handler;
-	ath79_reset->restart_nb.priority = 128;
-
-	err = register_restart_handler(&ath79_reset->restart_nb);
+	err = devm_register_restart_handler(&pdev->dev, ath79_reset_restart_handler, ath79_reset);
 	if (err)
 		dev_warn(&pdev->dev, "Failed to register restart handler\n");
 
-- 
2.39.2


