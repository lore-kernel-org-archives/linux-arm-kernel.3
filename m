Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF641099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKlgm+92CfUikUHQMNgfMJY6fKl/JQXx+ZDB1/jLPeY=; b=JkiI6uQmKYE3YuTE7xP/9mvzME
	lb/kF7eUXpdwgxZpFSU1F2+3MNmlDQ0j8GsdJLBqrvWqty7V5aTL0vFH/QsXMClpCTnrL037oDuzQ
	HO6wq9LSNcI/aEsS1DmEwGy/2VNCMzX+sAd5GQs2H1aNv3k7Yl0qYgmKocWD0p2oP/cs6zoCUucpz
	pmOIZowBv2IcqfOY/nn+eTu3mCYaSNTNDfi6a22e6HxEsq8/MKkominLU8W2r/wIzJpHIgsbXOG5U
	NpVWQjT4Y1tYT2zzy3D9avivuvXL+aRFcp135/TTLRaUTyYmFOdzxc3YHAyxg8GXyS3fVqvLHS/PO
	sE3+wgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dtA-0000000DISN-0oGF;
	Fri, 20 Mar 2026 17:44:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsr-0000000DIB1-0uUI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA5151682;
	Fri, 20 Mar 2026 10:43:33 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0316D3FA1F;
	Fri, 20 Mar 2026 10:43:37 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:58 +0000
Subject: [PATCH v7 16/20] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-16-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=2272;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=394hV8d45nj/KNcMMVSe5PpBIgRmcbKppF8dVm8FeEM=;
 b=jT+H9JgXLBbBAMzFI3WvAT7R+f/47WnmFBe1l8pLKiqzA4J9g2ZG3Wwf7BMmH21FZKbfZ14K0
 D1s4uVQYzLvBXEUe0I1SLrm+FtpM8VyMnDe/vbx53GwgU92aDBNlpGI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104341_417213_E2CB39DC 
X-CRM114-Status: GOOD (  10.95  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.

This commit registers save and restore callbacks for the sink via the PM
notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b888a31ca6abffe62e2264574a6d61b43184f600..e0784e8eecedae5a5121c03d6bb29f6a3ab5026f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1813,11 +1813,17 @@ static bool coresight_pm_is_needed(struct coresight_path *path)
 
 static int coresight_pm_device_save(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
+		return 0;
+
 	return coresight_ops(csdev)->pm_save_disable(csdev);
 }
 
 static void coresight_pm_device_restore(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
+		return;
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
@@ -1839,7 +1845,17 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	ret = coresight_pm_device_save(coresight_get_sink(path));
+	if (ret)
+		goto failed_out;
+
 	return 0;
+
+failed_out:
+	coresight_enable_path_from_to(path, coresight_get_mode(source),
+				      from, to);
+	coresight_pm_device_restore(source);
+	return ret;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
@@ -1847,6 +1863,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	struct coresight_device *source;
 	struct coresight_node *from, *to;
 
+	coresight_pm_device_restore(coresight_get_sink(path));
+
 	source = coresight_get_source(path);
 	from = coresight_path_first_node(path);
 	/* Up to the node before sink to avoid latency */

-- 
2.34.1


