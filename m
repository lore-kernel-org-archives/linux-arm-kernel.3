Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117BBCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MULAdqgWlLA8oLwvwTwt3mY6wOtGb/xUdiazYgSV87E=; b=oUICdJlCLLXDfOZBhXG3S24Eiq
	TT16pqREh2QMEyW4XeRn0ej+o0opN//np6xL4MmB/F40Xf0aHlVHDSk89JS6B7Xkbu6ePxrK17wPB
	rVs+2Zm63gDF+a0hK1bbLZPJAxY9Nbe7MhNqZnTwfFNfcc3K8RKFE/UX5pkDRMzsjmvFTY1ZbuP1s
	/ZVQRflqaA8KaakS/ghNUwHWa5+W8ZRefnR6M4hl294wt/pbYx9cdcLfqwA1lj8P3kTm1VlEc2aHE
	F9PjX14rSFPhXn0tqLM4XqaVotLIf2cjBoP2WKJSSr8lKDC9soyrrm2EIHLjmiQaRgtc90m+yItzv
	gsf70+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2r-00000007RXf-3kjr;
	Fri, 01 May 2026 16:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2q-00000007RUi-15Vf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MULAdqgWlLA8oLwvwTwt3mY6wOtGb/xUdiazYgSV87E=; b=BVAdXzSyspSfOANjBThs/zuYHm
	Bmg8ww1uTg3kCA9mcG+OyRqrdZe3UQLmJWDLKjDIoJfY7cAT8xj0jifSUQqHh/rFKxPN3of6vkvQf
	I24AqrOD582hO+8RyYWrmhNVXF29IdMevRTvchry8AWRCJdrhPLNqgPEJ8ovGY16UTI1xk9ksQqhk
	x1i0S/VjHIIl1vbZp7L1Dd32AqAzer3iMadIvb7v/PESo63lEiKYbUe1Hp0e/9vjJon+fZtlZAukZ
	ZFHuXxxDnt5RIYuaaVkTllK/NTDIpWSjppkEZVdU4aDKStH+5+UpyeVao/83cQzE9aAgot4cPo7TZ
	ZC7UFF4Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2n-00000009B2g-15FH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6EB3176A;
	Fri,  1 May 2026 09:48:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D31C53F7B4;
	Fri,  1 May 2026 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654128; bh=ZcnhXgMwQtCGhdvoN4Bk/yvcRHiDUh41XV35ayqSt8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J1QpS61GnV8R2EKXAw4GO9NRsDBlUp4+5Vpiq1fQ6+NFnL3yXUBN0prldAmGaJnWW
	 iloBsqLWh3TzBGmOq45TZ+IpTUCy6DMml2dOh9cp3B+1tEDBSlU845wxsUyPgWNNJb
	 VWSHFspvBRdV80m73zwqghtcpH3Nx6XjLMRMptj0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:55 +0100
Subject: [PATCH v11 14/27] coresight: Move source helper disabling to
 coresight_disable_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-14-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=4552;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZcnhXgMwQtCGhdvoN4Bk/yvcRHiDUh41XV35ayqSt8Q=;
 b=U5f22QGDfDxgYWOP+i5yb4/WoS6cMXnVD3Yh6zw1jMDmQTc6BmBdV8DPMomZjygrkggs8iQYS
 S7JSF2eZ/z8Cf+LL+4n694QMef4Z4XP3EzJ/JQo1dgyOIAGZ2zcSLN0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174849_640295_5CB858E0 
X-CRM114-Status: GOOD (  20.45  )
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

Move source helper disabling to coresight_disable_path() to pair it with
coresight_enable_path().

In coresight_enable_path(), if enabling a node fails, iterate to the
next node (which is the last successfully enabled node) and pass it to
coresight_disable_path() for rollback.  If the failed node is the last
node on the path, no device is actually enabled, so bail out directly.

As a result, coresight_disable_source() only controls the source,
leaving the associated helpers to be managed as part of path.  Update
the comment to reflect this change.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 38 +++++++++++++---------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0c11e7fff1bd5cf504b17241595d83a1d11bcf40..6ab80ae7c389e9031d4ab065d83bb676fd12160b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -447,19 +447,12 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
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
 
@@ -486,9 +479,9 @@ int coresight_resume_source(struct coresight_device *csdev)
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
@@ -499,7 +492,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
 	if (!nd)
 		nd = list_first_entry(&path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, &path->path_list, link) {
+	list_for_each_entry_from(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -519,12 +512,6 @@ static void coresight_disable_path_from(struct coresight_path *path,
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
@@ -580,12 +567,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 {
 	int ret = 0;
 	u32 type;
-	struct coresight_node *nd;
+	struct coresight_node *nd, *last;
 	struct coresight_device *csdev, *parent, *child;
 	struct coresight_device *source;
 
 	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, &path->path_list, link) {
+
+	last = list_last_entry(&path->path_list, struct coresight_node, link);
+
+	nd = last;
+	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -639,6 +630,11 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
+	/* No device is actually enabled */
+	if (nd == last)
+		goto out;
+
+	nd = list_next_entry(nd, link);
 	coresight_disable_path_from(path, nd);
 	goto out;
 }

-- 
2.34.1


