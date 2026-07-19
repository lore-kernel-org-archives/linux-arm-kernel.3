Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42DC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XB6YcA1LMpF2Yn2bjXDh2H+HcWT4N/bplMGM1IzQCMo=; b=ZDVaEerj78erMtWuasgeo+A0sp
	MeaSbwIrg8y1cYeYgOZ5CLcKvbviam5PAOuWZUe+qMm8FhIuAMZjk05Ce4TfmUKsMcDN2lEQB4B2W
	uE3i7LUCs+9o3cVrqzFfQbNNoXCbmZXH737ec2BAlJtkT6L9QkH+ULXklc4CXBhvf5KCZ4Clg3uTn
	yxQbrxJJUKobrNfWPkO9w+uMiC7ChyGZofijdySQ9f851mF9lEpHzs18fy/PI/sOMOTkafT3FqACY
	MHwRkh+xkcVd/G/xUSOOTAxBUMrzhTtWHc4WdlK2a/UVXFRaFtllX2Am9Wzu2e22fIttBGBUWVRxN
	tePPMc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR8Q-0000000513x-3GzV;
	Sun, 19 Jul 2026 13:00:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR8P-0000000513h-0R6b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 13:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C2A601DE;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6A0C19425;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784466043;
	bh=IpCdIvtqrUwzVFJ1/y1oYQ0klko2f12CuHINIX6XHp0=;
	h=From:Date:Subject:To:Cc:From;
	b=aX4hm9Muu7/kgalY7O/TrueR7ctjDyk5xAcBofehBQP7ZEECG8mg9W/Bo+X1DWDF0
	 ydDl7AY3fHDNdRGuT9CiHdvM+tnXV/HDI/S24JQj2hpp6vWod+dnlbh2MtnUN4RaPw
	 R+ovp5pkB0AK7CqmxyyrMOWLcRn2Tt1q2Ny48hcFyslETDgvRJzf0hYNvOqtaYLGzw
	 9RcaizH2jjraBP6ma67xMNJsc3pqIoVrm7FIA2N2ixurCq029wIRwAjS1HAhCOgCmF
	 kxXLvMRoOzCSjRnZDGmro1Us581VTlUx9D4e/HIQ7yct5mSHJBzfGNbLk63K1rs1TY
	 MXGppGvr+UV1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B14C4450A;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 19 Jul 2026 15:00:32 +0200
Subject: [PATCH] mfd: macsmc: Fix key count endianness annotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wUaL2KuIik47tCNqSURHEu
 5vW5ffg/QcoR2GFR3ZA5E1UPnOCyTMIbz+/GOWZDLawrqhNi1Th5INOAYlLi4Ps6MqaGyLjWus
 hHb+R0/yPdv1tXWnksPxKcJ4XwjqYl3YAAAA=
X-Change-ID: 20260719-b4-macsmc-be32-fix-637e8bb1692a
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=IpCdIvtqrUwzVFJ1/y1oYQ0klko2f12CuHINIX6XHp0=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bMqYp2pYikT13FLYG8HiX/uY447mATeXFkerccB8NL5
 zcbVzzvKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzkZSgjw68OU/fSLdsbN6bc
 1tWeMfFvoIe3y+LLupXNc0KeBC/KPczwm11+6qTM9Zd3FcutOsh6dt9GpTnTlqpbT/p7J8vgx8z
 J4rwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

SMC firmware returns the value of the #KEY key in big-endian unlike most
other keys. Reading it through apple_smc_read_u32() into a plain u32
and then converting with be32_to_cpu() makes sparse complain:

  drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32

Read the raw value into a __be32 using apple_smc_read() instead.

Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.com/
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/mfd/macsmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 358feec2d088..514cba7dc897 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct apple_smc *smc;
-	u32 count;
+	__be32 count;
 	int ret;
 
 	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
@@ -461,8 +461,10 @@ static int apple_smc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, smc);
 	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
 
-	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
-	if (ret)
+	ret = apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
+	if (ret >= 0 && ret != sizeof(count))
+		ret = -EINVAL;
+	if (ret < 0)
 		return dev_err_probe(smc->dev, ret, "Failed to get key count");
 	smc->key_count = be32_to_cpu(count);
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260719-b4-macsmc-be32-fix-637e8bb1692a

Best regards,
--  
Sven Peter <sven@kernel.org>



