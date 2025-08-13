Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N10erRoEBXTD6NQIqVCoyKFPIunTNnzn74wpSpfIUKs=; b=rsDxXGtCHGRVFiv2f2hv2GmeXO
	wNm8avHV3s2ONtkvTWN+lBVtLz20fcIiUz3TQ+KT+rT2JPbDMI3cp8T7XKjHXTsUxkwzRRWSNCHdg
	31Rz9r4RN1xuvPzfi/BsPADZlqCQOgAEkTTdnlU+7r7L9TzldHlmxd+WY9wbvFo8TuRF0xBiUAPnh
	5hwAPTnLY0bUHtJxzmBXdrPKp7EUI4VcQ6eDOirQlse+ApgPKlpoHHqmqMOVhNsXFx9PbQSon/05R
	HhWcw47gRmknZWckUErE7R+wfBG5830vAqAqndsY5d5SW4n5W/orYetjBnpaJ/oF0eKhg5bIYs+EC
	Cvy9nwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJY8-0000000F6pq-2B9C;
	Wed, 13 Aug 2025 22:02:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJET-0000000F3iF-2VRL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N10erRoEBXTD6NQIqVCoyKFPIunTNnzn74wpSpfIUKs=; b=cYEly0MyL6awdEP6qJotFh6BAb
	SlGOb3Cifnd7x871q/T129zPyee1ti6AJQ5ZHtrEasAHEiTBavaXykWy3sqj2mmM1GNXSPSGOnudk
	6KF59tPKEDhrQUrJPB56aoB/zeK8ZV08uKvPQQVZ6HrKKQ1LwvGvV6Bg4860AWwhkrrdlGqWEv0F0
	F1FbizRAnj1EUP8jF5E7RGqsowiFUgQEmnES/VDMjrSrAAboSlLySqgk2aloMogr04Us9/+BAV/Hg
	ahGU+heAshy/nqkYqBcRFmFesUsPkwwsWXhIxeydtOHBXS+ykTZ+tJr5p4F/cmy0vZG0F8bbszo++
	5D1EiMJA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEK-0000000GCxE-2Zh3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:42:04 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgrP2238055;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=N10erRoEBXTD6NQIqVCoyKFPIunTNnzn74wpSpfIUKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qQ9pX/BVJfCp4RKnoYAUwMmgmWjPB6GtCU4fqgI2IfJ5hOq0hRoklLxUPRjM8Amn7
	 d3Lok2q4SfnGwM70ycFfAmmIZn07qv7nTVyxebkEJPIa9m3wcWaEgBYhabyNUEVZWa
	 BaLYMaTvsYVtmn46fF8vG/nzKYw1COtmxmwyZd4o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgIg354028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNJ2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 4/6] reset: ma35d1: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:36 -0500
Message-ID: <20250813214138.477659-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224158_126921_E0D93703 
X-CRM114-Status: GOOD (  13.90  )
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
 drivers/reset/reset-ma35d1.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-ma35d1.c b/drivers/reset/reset-ma35d1.c
index 54e53863c98aa..4ee901f001326 100644
--- a/drivers/reset/reset-ma35d1.c
+++ b/drivers/reset/reset-ma35d1.c
@@ -19,7 +19,6 @@
 
 struct ma35d1_reset_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_handler;
 	void __iomem *base;
 	/* protect registers against concurrent read-modify-write */
 	spinlock_t lock;
@@ -125,10 +124,9 @@ static const struct {
 	[MA35D1_RESET_SSPCC] =   {0x2C, 31}
 };
 
-static int ma35d1_restart_handler(struct notifier_block *this, unsigned long mode, void *cmd)
+static int ma35d1_restart_handler(struct sys_off_data *sys_off_data)
 {
-	struct ma35d1_reset_data *data =
-				 container_of(this, struct ma35d1_reset_data, restart_handler);
+	struct ma35d1_reset_data *data = sys_off_data->cb_data;
 	u32 id = MA35D1_RESET_CHIP;
 
 	writel_relaxed(BIT(ma35d1_reset_map[id].bit),
@@ -213,11 +211,10 @@ static int ma35d1_reset_probe(struct platform_device *pdev)
 	reset_data->rcdev.nr_resets = MA35D1_RESET_COUNT;
 	reset_data->rcdev.ops = &ma35d1_reset_ops;
 	reset_data->rcdev.of_node = dev->of_node;
-	reset_data->restart_handler.notifier_call = ma35d1_restart_handler;
-	reset_data->restart_handler.priority = 192;
 	spin_lock_init(&reset_data->lock);
 
-	err = register_restart_handler(&reset_data->restart_handler);
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART, 192,
+					    ma35d1_restart_handler, reset_data);
 	if (err)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-- 
2.39.2


