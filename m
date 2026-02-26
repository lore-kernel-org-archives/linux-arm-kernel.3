Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC1FC5916
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXI40ev4wBykmnci4HuvnthFCypjC1zor8RV6FiMLVw=; b=AVuPs0I/R1MnMCHWwzIs8Xkbjw
	Q17TCplsGe2wnP3IcPWg5LM99E5crR+I0bbUtcuqidiONPID/qF1TZa9YaGxoayA6m/KcDpjKWKoZ
	ncMRSe34XfBC8Sn6P7Tk2gJxHtgfaEny0hYUHF2N51dm9267VtEaXM58o6b21rF+tcKYZrRvq+I7b
	igBJjg/BtpdL/FHJ0LVbbMptcW03ynkt60pBPhcqgxNH5LjNjp0xGH25jIz/hHmoK13IUTjIMVatB
	gmDOBxUAvxQHm/fVLD0boJvHiNhfe/b/bxMsSCaVHrXvslaYpMfP4xydlBipR+WZ50wVp+cQEjHhM
	ftnzcu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbd-00000005n6k-3vdE;
	Thu, 26 Feb 2026 09:24:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbW-00000005n16-218D
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NXI40ev4wBykmnci4HuvnthFCypjC1zor8RV6FiMLVw=; b=JnXXx1TV1mHcBslcSSuh9+XNYb
	cm+Tz66Js8zMU+TggL6TVYZFZ5LEh1p3KktPrz60Ma6odsVljvqgjJ1YnWEAcv6gECrAUDsFnEt08
	sKB6t8SUmZ6PUfezuGNVlCiJ7RniZhnOAO4hA5cUQ10khWOq5FRXwD4hgob1n15daAtZzjlctVKs2
	aAuLKehkR8Axtoq4e9Q7LTTeBimQCYRSD9KxT0VZ5vFec1CMq+8QM+EJwI05LUu2QzUtiLGZBVhD9
	nniJcu7iKcnwkPMBNZQLAR8Pxh65GNyZ6m96tu9GsXTCTCixVOi0oZ0vUqqiKNnKCeVQP0k+ldkwW
	EgAHsDXQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbT-0000000AbV7-1WnH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FCAC1516;
	Thu, 26 Feb 2026 01:24:08 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD7023F62B;
	Thu, 26 Feb 2026 01:24:12 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:55 +0000
Subject: [PATCH v2 7/8] coresight: cti: Remove hw_enabled flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-7-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=4151;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=g2L3i1CezfA6Jf1Jke+6/YKaXLSWcNpqDPO+Nh3fXjw=;
 b=xvlMausvbKO7aFJ/w3JHJfQomLjTikxfuO3Vyt4MebonledDtqJ7hAzsENFJ4+LJHKZ/+9nbr
 +UuSOaeDK4gDwqblAMgK9iGzswvwhDh1gNcD6Kvr3yaBgfk6ausbqsc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092415_859947_45D20037 
X-CRM114-Status: GOOD (  15.67  )
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

The enable_req_count field already tracks whether the CTI device is
enabled.  A non-zero value indicates that the device is active, the
hw_enabled flag is redundant if so.

Remove hw_enabled and update cti_is_active() to check enable_req_count.
Replace open-coded enable_req_count checks with cti_is_active().

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 ++---------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  2 +-
 drivers/hwtracing/coresight/coresight-cti.h       |  4 +---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 5ac36f0776181559a87b3ee37d6c9076882576b5..2f4c9362709a90b12a1aeb5016905b7d4474b912 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -81,7 +81,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* no need to do anything if enabled */
-	if (config->hw_enabled)
+	if (cti_is_active(config))
 		goto cti_state_unchanged;
 
 	/* claim the device */
@@ -91,8 +91,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	cti_write_all_hw_regs(drvdata);
 
-	config->hw_enabled = true;
-
 cti_state_unchanged:
 	drvdata->config.enable_req_count++;
 	return 0;
@@ -107,22 +105,17 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* don't allow negative refcounts, return an error */
-	if (!drvdata->config.enable_req_count)
+	if (!cti_is_active(config))
 		return -EINVAL;
 
 	/* check refcount - disable on 0 */
 	if (--drvdata->config.enable_req_count > 0)
 		return 0;
 
-	/* no need to do anything if disabled */
-	if (!config->hw_enabled)
-		return 0;
-
 	CS_UNLOCK(drvdata->base);
 
 	/* disable CTI */
 	writel_relaxed(0, drvdata->base + CTICONTROL);
-	config->hw_enabled = false;
 
 	coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 9ab586a5c9a4fd2a64c542aaaaa625e2299edd62..9ef44956ebdc7781717d773fa014165989df2048 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -84,7 +84,7 @@ static ssize_t enable_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		enable_req = drvdata->config.enable_req_count;
+		enable_req = cti_is_active(&drvdata->config);
 
 	return sprintf(buf, "%d\n", !!enable_req);
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 8754cb5def7918f03235343844467af8410b75a8..c5f9e79fabc608f5a95e7e4d8b0cbe1c853d584a 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -121,7 +121,6 @@ struct cti_device {
  * @nr_ctm_channels: number of available CTM channels - from ID register.
  * @asicctl_impl: true if asicctl is implemented.
  * @enable_req_count: CTI is enabled alongside >=1 associated devices.
- * @hw_enabled: true if hw is currently enabled.
  * @trig_in_use: bitfield of in triggers registered as in use.
  * @trig_out_use: bitfield of out triggers registered as in use.
  * @trig_out_filter: bitfield of out triggers that are blocked if filter
@@ -144,7 +143,6 @@ struct cti_config {
 
 	/* cti enable control */
 	int enable_req_count;
-	bool hw_enabled;
 
 	/* registered triggers and filtering */
 	u32 trig_in_use;
@@ -236,7 +234,7 @@ const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 /* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {
-	return cfg->hw_enabled;
+	return !!cfg->enable_req_count;
 }
 
 #endif  /* _CORESIGHT_CORESIGHT_CTI_H */

-- 
2.34.1


