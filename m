Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E64ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DTnMXodPV/GR5V6IjVmPWSY5iB+HRx99O2A3Q7STTU=; b=cXBHeb7SYeA5HPAPuCrSKjNUZy
	AG8vToyNRRrRrnWBfrOuVu56h5s6eAV2kwyfzP74XSF+1hk+lQE+aBgpPBlbpk9KLeU/GyeqgiURG
	5Il8gXNkPdjFck6GZtwRf5IcDkzM8aNO09dixbpINlcaJrTGr3qtUe/xZXWc/uEwpLPsxRgTrwN6i
	6eI+bhBa8ayQMtyKIpj3jovQCcQD7I7Ins0w886R1G/K3wu3dn04ogY8iZ4BnY3fe263sBKmnlXbR
	GVD40vEYZTp/UiPitTMVeHzskXe/4/9WXNNeH73v4PrzpHjiAsWHSPhU0bS0okIMaTJMbvls0oMd0
	dgtXSPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xp-00000003gXu-28R8;
	Mon, 15 Sep 2025 10:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XQ-00000003fzv-0fa2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9DTnMXodPV/GR5V6IjVmPWSY5iB+HRx99O2A3Q7STTU=; b=b5oQve0y0Nc+Fal++axIsuSC1d
	kBSHP26YosDHgJzPYXvxNp8Aw0F5UDt09oFNbBTR1Xszkdk+Ktug897W0gpkHZFkCeZC+nLsQEHXA
	pNCj3Scv9AKmrZRwsbnANR7+Z6LAPoMgghzhMpZ2x+vMufolfV0FnA+q2RNRqRG4ZLSYUng6QyFY7
	qCh75ev7VHKxWvV7KbdCytZM7QawwVhgB0cWzRiCQfW8ayRU9CptxPF+0GhED2R+3dYOj5qs2lMkf
	kJVfq+ZKJZ+69z+Jsb3HNlh9QvsbKVgGBqtKpB5qxrSwc/Wm+00gpVKRzwYBsI7KlyWHT6XtghvgI
	jNaoID9g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XM-00000006vZN-46pD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F360C1424;
	Mon, 15 Sep 2025 03:34:11 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969E63F66E;
	Mon, 15 Sep 2025 03:34:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:43 +0100
Subject: [PATCH v3 20/31] coresight: cti: Register PM notifier after data
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-20-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=2207;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QkFXhk9kfOG6P2cFxIze69nbuGdI4v0SCozmXab2kzk=;
 b=eiXKXRFnVCsS4neS9djfQJV02vW6+7jw9NivZLkRzM752wj62F/m1QBjqg3t9pgkut7PiqP6w
 Wn/INyxaGeCBFu2V4WZE03jr/6O5LeaB1bOuhM+pGh/qaQRtwMDpG/3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113421_332542_B5035BCD 
X-CRM114-Status: GOOD (  12.76  )
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

The PM notifier needs to access the driver data, so it is only safe to
register PM notifier after data initialization.

For this reason, move cti_pm_setup() to a later point, specifically
after 'drvdata->csdev' has been set up.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index ba4635dfc2e30b4e9ae4972f91bdc6647975b719..b2ddbe12be8d6140a3098797d6d1cc4393259b3a 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -926,17 +926,12 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!cti_desc.name)
 		return -ENOMEM;
 
-	/* setup CPU power management handling for CPU bound CTI devices. */
-	ret = cti_pm_setup(drvdata);
-	if (ret)
-		return ret;
-
 	/* create dynamic attributes for connections */
 	ret = cti_create_cons_sysfs(dev, drvdata);
 	if (ret) {
 		dev_err(dev, "%s: create dynamic sysfs entries failed\n",
 			cti_desc.name);
-		goto pm_release;
+		return ret;
 	}
 
 	/* set up coresight component description */
@@ -950,9 +945,14 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto pm_release;
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	/* setup CPU power management handling for CPU bound CTI devices. */
+	ret = cti_pm_setup(drvdata);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
 	}
 
 	/* add to list of CTI devices */
@@ -970,10 +970,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	pm_runtime_put(&adev->dev);
 	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
 	return 0;
-
-pm_release:
-	cti_pm_release(drvdata);
-	return ret;
 }
 
 static struct amba_cs_uci_id uci_id_cti[] = {

-- 
2.34.1


