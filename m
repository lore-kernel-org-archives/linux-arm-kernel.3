Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F01ECD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2nrJ3DhwpyybnC0/oruunGs6GCO5TNp0bTdS7MgyYA=; b=Kf+ZYSovV6UhbE/nUr/Un7JyNv
	guQnYgKELAqHMOeICiYDElYOs09M/j9Npg9dMQNpqWmKHHg0ReEAeWSR2TjI5/1szh9mXfjLMCEXv
	YIkLqBEhd9l+Ocphsdh4wIm1VPV8RrmkA4xAWDLJ7c9xA6hQ7SECI86sosBr9DGYyfK7Fj7RmCNHj
	6aVaTYdaKTdzau75/Qa7eCO6eMpmTWLb0bGRrzfkCYg4iuFBKUlsfFI6vYf5xOoP/wi4+nPZ6ssWt
	jTL14KwM9yJuiz/soupTASefcWjasLUIwIOc4DlMaR+wzolj17i/PZvuJPdd2yVRNkmhOoUwX3gr5
	xGpHf5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYO-0000000DFmx-1knb;
	Mon, 11 May 2026 11:12:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY8-0000000DFFc-1UnD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 307B51713;
	Mon, 11 May 2026 04:11:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AF543F85F;
	Mon, 11 May 2026 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497907; bh=88KqswizTL+q/RAgGPBtD6hHxY7mwsme7pLBTATEkkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=soFRNgOPNqVdkuAasPaJKTxR0ntJwbaEHQFu08lZXm+3mYllnRW4GRPqsDJvR5yOo
	 6kAk1K1J9uqtULCzQmsUEiAkSrq1WEDC4GPzajV00oNHIYEdDVohifgW0G/s9pZ77q
	 jJpj5FdrdjE4FJ11FW6bqisdxwWgvBisEv3G/r/U=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:59 +0100
Subject: [PATCH v12 15/28] coresight: Disable source helpers in
 coresight_disable_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-15-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4167;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=88KqswizTL+q/RAgGPBtD6hHxY7mwsme7pLBTATEkkQ=;
 b=zDGlyvLiFi9O76s3bXrwBYA/wnwV+ARhz+qdJXoQTgA5OL0XMHRpwm315cYpHIDR3OOo3yJmf
 oaMC7ZH0ST9BUv1Aw85cw0/B008RqkBwIYe0lVL2tHDu38DbY6PyJGR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041149_033629_7CEBF00A 
X-CRM114-Status: GOOD (  18.19  )
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

coresight_enable_path() enables helpers attached to every device in
the path, including those bound to the source. However,
coresight_disable_path() skips the source node, so source helpers had
to be disabled separately in coresight_disable_source().

Move source helper disabling into coresight_disable_path() instead.
Make coresight_disable_path_from() start from the passed node nd, so
it can also disable helpers on the source. Update the comments
accordingly.

As coresight_disable_path_from() now changes its semantics from
"start beyond nd" to "start from nd", update the failure handling in
coresight_enable_path(). If enabling a node fails, iterate to the
previous node (the last successfully enabled one) and pass it to
coresight_disable_path_from() for rollback.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c525ecaad7efc40150d2d8ef3a6decddb68aff69..856036ad838b3508bf39a2ef40e68673925bca5b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -456,19 +456,12 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
 }
 
 /*
- * Helper function to call source_ops(csdev)->disable and also disable the
- * helpers.
- *
- * There is an imbalance between coresight_enable_path() and
- * coresight_disable_path(). Enabling also enables the source's helpers as part
- * of the path, but disabling always skips the first item in the path (which is
- * the source), so sources and their helpers don't get disabled as part of that
- * function and we need the extra step here.
+ * coresight_disable_source() only disables the source, but do nothing for
+ * the associated helpers, which are controlled as part of the path.
  */
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -495,9 +488,9 @@ int coresight_resume_source(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
 /*
- * coresight_disable_path_from : Disable components in the given path beyond
- * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
- * disabled.
+ * coresight_disable_path_from : Disable components in the given path starting
+ * from @nd in the list. If @nd is NULL, all the components, except the SOURCE
+ * are disabled.
  */
 static void coresight_disable_path_from(struct coresight_path *path,
 					struct coresight_node *nd)
@@ -508,7 +501,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
 	if (!nd)
 		nd = list_first_entry(&path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, &path->path_list, link) {
+	list_for_each_entry_from(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -528,12 +521,6 @@ static void coresight_disable_path_from(struct coresight_path *path,
 			coresight_disable_sink(csdev);
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
-			/*
-			 * We skip the first node in the path assuming that it
-			 * is the source. So we don't expect a source device in
-			 * the middle of a path.
-			 */
-			WARN_ON(1);
 			break;
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
@@ -648,6 +635,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
+	/* Fetch the previous node, the last successfully enabled one */
+	nd = list_next_entry(nd, link);
 	coresight_disable_path_from(path, nd);
 	goto out;
 }

-- 
2.34.1


