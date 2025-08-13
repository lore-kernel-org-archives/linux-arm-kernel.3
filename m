Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTbVVjSoROXPn4Xu4layLkxNIqGNzrm2kx+jdejNJ9M=; b=KH/KbKrt0STDw5FkSBCwdHYlXw
	De6+B5Nz45vB2/P78ifpVHRb96qhW7vE+Y7E9zkP8R7uhHx3T1EmhaAUwplVLAjg7MEwy/FHVLyGZ
	6T/U5Q2mabYGAObCpfBRCdHENyP03PF12uf8/fr9IAngoSCJRgZHHy/1YlBr39bmaO4e5zClssNj+
	C3oSnmbWGg7e0VYhPffu4IDgcSjTSgTo521sDdegXjqHLlyAnIqmMlZBrRQzQVJk13DIwd8aJWNBb
	PwL0E6wt6vVPzXk3xozxDdnfbCLW4hYnfhE9SFxUQZLsMq360XlC3uAgGf+sVHddNUZ2d2oslTesO
	/hOsaGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJT5-0000000F5kK-3bKu;
	Wed, 13 Aug 2025 21:57:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJES-0000000F3i3-2SDI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kTbVVjSoROXPn4Xu4layLkxNIqGNzrm2kx+jdejNJ9M=; b=M6dnJNDFl4NG7xqjcB15gu5Tcu
	1KIlwYTaYZcocrIdKsINAtQNxLU27j02Va80A/PTs0kTIRxR2YH8XFjm/YD41lOxCwqYoJ5PwVnsa
	0i7iN8l/sazcSb2tNvM7GnfiqSA185wVhAly9GRDLXx5/Mz8h4Rt2iJpEh2IsRwBvltxJsmE6lyDN
	+oFPMwQVpqExyFha/rQ9hbROflzeAOWsUFCAohFGubT3/DgxkiBb4IPTj5TWsp5SBLYq+ercCDgon
	bAxs7zBzb3kYVe5+24teaMv/toHlJYFBXBEeaMVZ7gxZEmZ1QoPP7dT19NIF9WyKH6KPS/aeZSLyX
	vHqusnHg==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEJ-0000000GCxA-3KMZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:42:03 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfffA1788741;
	Wed, 13 Aug 2025 16:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=kTbVVjSoROXPn4Xu4layLkxNIqGNzrm2kx+jdejNJ9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Iiehth8m/X0TJpR/V3cdN0vn47nZSceK3Zt2k0G4Vhn197OGr7C2z/57+h70aDR3j
	 gjhm3U9XtutYStd4Bk2asboJJIrjXKB/mWQvtsmP758rpPl0O8O9GwkbIxu2pGiy6/
	 yHIOpcKyNKcyXcwP3UAMToeKET/YGjXIfh/UX/pY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLffcl1253252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:40 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNH2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/6] reset: intel: Use devm_register_restart_handler()
Date: Wed, 13 Aug 2025 16:41:34 -0500
Message-ID: <20250813214138.477659-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224157_512429_CD24CD18 
X-CRM114-Status: GOOD (  13.05  )
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
 drivers/reset/reset-intel-gw.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index a5a01388ae7fa..97671b99f565a 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -28,7 +28,6 @@ struct intel_reset_soc {
 
 struct intel_reset_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	const struct intel_reset_soc *soc_data;
 	struct regmap *regmap;
 	struct device *dev;
@@ -154,12 +153,10 @@ static int intel_reset_xlate(struct reset_controller_dev *rcdev,
 	return id;
 }
 
-static int intel_reset_restart_handler(struct notifier_block *nb,
-				       unsigned long action, void *data)
+static int intel_reset_restart_handler(struct sys_off_data *data)
 {
-	struct intel_reset_data *reset_data;
+	struct intel_reset_data *reset_data = data->cb_data;
 
-	reset_data = container_of(nb, struct intel_reset_data, restart_nb);
 	intel_assert_device(&reset_data->rcdev, reset_data->reboot_id);
 
 	return NOTIFY_DONE;
@@ -216,9 +213,7 @@ static int intel_reset_probe(struct platform_device *pdev)
 	if (data->soc_data->legacy)
 		data->reboot_id |= FIELD_PREP(STAT_BIT_OFFSET_MASK, rb_id[2]);
 
-	data->restart_nb.notifier_call =	intel_reset_restart_handler;
-	data->restart_nb.priority =		128;
-	register_restart_handler(&data->restart_nb);
+	devm_register_restart_handler(&pdev->dev, intel_reset_restart_handler, data);
 
 	return 0;
 }
-- 
2.39.2


