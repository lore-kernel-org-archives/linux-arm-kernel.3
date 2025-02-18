Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D083DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 01:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FuF6m3leXUa/vGlA8F/tyoZFS3UM+jds6W3yZp2fFyA=; b=mEZoXa8DFPK+VgV6W8s48uIomE
	h0bg7W4C7LuHnHHfDA+Jvgc/oLO+yrxH2RNG3FjkIF5lYcgEVhbKJjoGpQ6EpzsIIaH6uaYTbyjbw
	99E3zomXnfj+czg/mZsHsE2D0SOcYC09hTypoXCHTa7Yfmyeq/EjLKrNG2FOI5mmVnxaEFFjEJV37
	sVgNrLgRuLxUGvmBSM8oz/RAz+l+Lsm/SVvIHkSM64lHgF1lhmpxbtTy33wK8fZZ2ri1oEcWPQTw+
	N3b+UM+qq4W3GBIzlWGKQKweF7HkNYP3VbV6yPwKZ5DBxb4Ni1z11MUT+8LDqhG4biAsmlgDXOtVC
	aCmIkQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkCK8-00000006QKu-3EKD;
	Tue, 18 Feb 2025 01:22:56 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkCId-00000006Q3b-2QVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 01:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739841678; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FuF6m3leXUa/vGlA8F/tyoZFS3UM+jds6W3yZp2fFyA=;
	b=ENzqlYzs4qOK3eG1uXjK/ENKnLLNP9217Ci7TCKSGAgvyibLDW74DLAZjdd+4+Nl5oDgPislKbpb+fpsv7P67rzLmjqcc2D5ki1+iLj1X7638f5ettSl+8KNMYCiV1B3XxCnXRWxvjRvOP0o1c9rAKPgiXWmwiAf7Z9d5rpdeDE=
Received: from localhost.localdomain(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPjc6Hf_1739841673 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 09:21:14 +0800
From: Yin Fengwei <fengwei_yin@linux.alibaba.com>
To: robin.murphy@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jie.li.linux@linux.alibaba.com,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>
Subject: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for CMN700 with ACPI
Date: Tue, 18 Feb 2025 09:21:11 +0800
Message-Id: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_172124_441152_1CC144FB 
X-CRM114-Status: GOOD (  10.35  )
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

Currently, arm-cmn PMU driver assumes ACPI claim resource
for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
failed because of resource claim failes when ioremap() is
called:
[   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
[   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
[   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
[   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16

Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
work in ACPI env.

Signed-off-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>
---
I am also wondering whether we could just drop the CMN600 part id
check here if ACPI companion device claimed the resource?

 drivers/perf/arm-cmn.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index ef959e66db7c..8b5322a2aa6e 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2559,7 +2559,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
 	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
 	platform_set_drvdata(pdev, cmn);
 
-	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
+	if (((cmn->part == PART_CMN600) || (cmn->part == PART_CMN700)) &&
+			has_acpi_companion(cmn->dev)) {
 		rootnode = arm_cmn600_acpi_probe(pdev, cmn);
 	} else {
 		rootnode = 0;
@@ -2649,7 +2650,7 @@ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
 static const struct acpi_device_id arm_cmn_acpi_match[] = {
 	{ "ARMHC600", PART_CMN600 },
 	{ "ARMHC650" },
-	{ "ARMHC700" },
+	{ "ARMHC700", PART_CMN700 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
-- 
2.43.5


