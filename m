Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2651CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JISdHbEjnkKmimzknIU44taV/ySZ3OF3mnen4YuO1E4=; b=sRtPndVQlfcLFDFY/JF1rL8I2y
	XMx5ai4sOZRusZ09Uksh1AopZTy1JQKWTBbtPlCoeWXx8RDsRFS8ZoeZixPTNRjs4wsW2+2nfu3JG
	2/DauaeLzwfO8MB3B3gzWQgQPLux4riGs6JabOo1eChVKZ1SxMbo/DHee7vZGu1kMx/CFMx3px1Gu
	zzMhahgf0ELVM1TPdDRUQU+NO8siME04FFo3cvgk1TnMA+ONTGhco1HmseD67tzK6hMOgJgSNQYR4
	YdS/UhEJ2W65ecgIqO3ENnV5NO1Gs3aJthBQZ/R71AdoP0Jvj9gGOai/M1Yh4WF6TSQJEJU8rivIk
	1qniV53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xv-00000003ghm-43AT;
	Mon, 15 Sep 2025 10:34:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xb-00000003gEa-1x0x
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JISdHbEjnkKmimzknIU44taV/ySZ3OF3mnen4YuO1E4=; b=VmQQMtrvYvBhuothYfPl5rM5/l
	K9Liv0xNwyxC4h9DK5PBr8DQ8KODN5eOkep1p1Tu0XIVE/rnXYkGXBDEu336tK4k8TN0JejizzoOG
	oLWF+Pt6y3R1wfhSuMLPAsZqZUlmlyOPckPea8vXj00k9/o4tIroWLjzY2zBUN482sU9+Zy2LsdSo
	Ni44aJ1Eb+46Mwz44WqVATxMV9Vy35Eh/NXCGG+vbbTLUNcGzkN+vwuB01dOCKRhy0++VQInKDay/
	JvcHW503TB6T9dJ5LKjOqsHsBx8bB3pYadXSM43vomygeisNT8EKF7RBBlDPSPbeLzsXcemSF+UtC
	xW41x6gw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XW-00000006vbq-2Gre
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D401BF7;
	Mon, 15 Sep 2025 03:34:21 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 246223F66E;
	Mon, 15 Sep 2025 03:34:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:48 +0100
Subject: [PATCH v3 25/31] coresight: Add 'in_idle' argument to path
 enable/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-25-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3705;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yt70rsLonC7nR2lKK5dnTQa/zhX2a+63RP7IivXeEXY=;
 b=a66+RIdqtGCLZyX8D6q+7mWhP8toepFfDGKaSuOxWw+K0Uf5nuxXg8EfDbSsV90RbyyATcMje
 BC4GaOvg01tCrj97teQoYXsecCSE44IjjDq5Iezm/W5vxJhv3o5WJ2r
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113431_007617_4DAF94C5 
X-CRM114-Status: GOOD (  15.02  )
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

Introduce an in_idle argument to the path enable and disable functions.
When set to true, it skips to touch the sink device. To avoid invoking
sink related helpers, the condition check is moved before the enable
helpers are called.

This is a preparation for managing the path during CPU idle.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 29 +++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 904123279ee70531787feea98e5f9fc502470f88..0e8506d5eaa01d1cc4846324a64eae5f0f442da3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -479,7 +479,8 @@ static void coresight_restore_source(struct coresight_device *csdev)
  * disabled.
  */
 static void coresight_disable_path_from(struct coresight_path *path,
-					struct coresight_node *nd)
+					struct coresight_node *nd,
+					bool in_idle)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
@@ -502,6 +503,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			coresight_disable_sink(csdev);
@@ -537,7 +542,7 @@ void coresight_disable_path(struct coresight_path *path)
 	if (coresight_is_percpu_source(source))
 		per_cpu(csdev_cpu_path, source->cpu) = NULL;
 
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from(path, NULL, false);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -561,7 +566,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 }
 
 static int _coresight_enable_path(struct coresight_path *path,
-				  enum cs_mode mode, void *sink_data)
+				  enum cs_mode mode, void *sink_data,
+				  bool in_idle)
 {
 	int ret = 0;
 	u32 type;
@@ -574,10 +580,6 @@ static int _coresight_enable_path(struct coresight_path *path,
 		csdev = nd->csdev;
 		type = csdev->type;
 
-		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
-		if (ret)
-			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -589,6 +591,15 @@ static int _coresight_enable_path(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
+		/* Enable all helpers adjacent to the path first */
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			goto err_disable_path;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, sink_data);
@@ -624,7 +635,7 @@ static int _coresight_enable_path(struct coresight_path *path,
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from(path, nd, false);
 	goto out;
 }
 
@@ -634,7 +645,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 	int ret;
 	struct coresight_device *source;
 
-	ret = _coresight_enable_path(path, mode, sink_data);
+	ret = _coresight_enable_path(path, mode, sink_data, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1


