Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C04C71149
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6Fn+kp7fvTDEcQzfPUIh29WWA7eijU70xG51Rxm75g=; b=fsMMg1urGbEwrKs8vBlUf7XDl7
	qyeYymjaV4n+6Z2ll5MBLoC8pJN+YZoIp8roU2rNROyK4JlSGaFokB0V7YEKNpJHgzQR1bP2ww7G1
	Zr80PdsRpI4Li81M5vwcbjH0plFhS0ZC/twlnaIiSod+PY831qqHEop7Z2VpxrpJU7Ka4mdTEehDK
	7s2nSOAJlQI63UMteVo9e1s9bfcJqKtSl58OZ6z4Bu0hisRfvn93MBXfJFXz1yDn9I/AYEO6D99/K
	0SrZGH7iAxQDtZ82lpXSBSoSviwMXzhwstKHTmNVkemnkzUGRLxBVGnfwK5eGjcf3SOIDGsI6z5wW
	k5IwHcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW9-0000000B0pT-2tnQ;
	Wed, 11 Jun 2025 19:53:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMgb-0000000A90H-24tb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:44:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C491688;
	Wed, 11 Jun 2025 07:43:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8F733F673;
	Wed, 11 Jun 2025 07:44:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 11 Jun 2025 15:44:01 +0100
Subject: [PATCH 1/2] coresight: stm: Remove redundant NULL checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm_cs_fix_smatch_warning_v1-v1-1-02a66c69b604@arm.com>
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
In-Reply-To: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749653052; l=2230;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OgBXyvyv43WQ4LOQXf/Pdt/q4AS4MZt4qoVjRtLaIQE=;
 b=iF7SpojHKd68nxfA1zamliN8BhxNtiVnOs8KI0vUu/ymSTlFu3Uv3otd5MDiXdRDN5DGal8zz
 TYpbzzmKCyUAaN3gRkiWdcH3+r0QUS/WceSioFB6qjuRUpBkwURNJ0K
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_074417_582920_23CB6157 
X-CRM114-Status: GOOD (  10.46  )
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

container_of() cannot return NULL, so the checks for NULL pointers are
unnecessary and can be safely removed.

As a result, this commit silences the following smatch warnings:

  coresight-stm.c:345 stm_generic_link() warn: can 'drvdata' even be NULL?
  coresight-stm.c:356 stm_generic_unlink() warn: can 'drvdata' even be NULL?
  coresight-stm.c:387 stm_generic_set_options() warn: can 'drvdata' even be NULL?
  coresight-stm.c:422 stm_generic_packet() warn: can 'drvdata' even be NULL?

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..464b0c85c3f7d3519169d62a51e9f8c6281b5358 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -342,7 +342,7 @@ static int stm_generic_link(struct stm_data *stm_data,
 {
 	struct stm_drvdata *drvdata = container_of(stm_data,
 						   struct stm_drvdata, stm);
-	if (!drvdata || !drvdata->csdev)
+	if (!drvdata->csdev)
 		return -EINVAL;
 
 	return coresight_enable_sysfs(drvdata->csdev);
@@ -353,7 +353,7 @@ static void stm_generic_unlink(struct stm_data *stm_data,
 {
 	struct stm_drvdata *drvdata = container_of(stm_data,
 						   struct stm_drvdata, stm);
-	if (!drvdata || !drvdata->csdev)
+	if (!drvdata->csdev)
 		return;
 
 	coresight_disable_sysfs(drvdata->csdev);
@@ -384,7 +384,7 @@ static long stm_generic_set_options(struct stm_data *stm_data,
 {
 	struct stm_drvdata *drvdata = container_of(stm_data,
 						   struct stm_drvdata, stm);
-	if (!(drvdata && coresight_get_mode(drvdata->csdev)))
+	if (!coresight_get_mode(drvdata->csdev))
 		return -EINVAL;
 
 	if (channel >= drvdata->numsp)
@@ -419,7 +419,7 @@ static ssize_t notrace stm_generic_packet(struct stm_data *stm_data,
 						   struct stm_drvdata, stm);
 	unsigned int stm_flags;
 
-	if (!(drvdata && coresight_get_mode(drvdata->csdev)))
+	if (!coresight_get_mode(drvdata->csdev))
 		return -EACCES;
 
 	if (channel >= drvdata->numsp)

-- 
2.34.1


