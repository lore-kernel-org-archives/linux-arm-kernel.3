Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12251E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUPRoVIbcI+3X8LDbhHuDIR8sT7Lq4ADiqmfiE1fZeM=; b=NCp5eKHkZy66XaLA9lmPAjhihF
	wrI9ZSFqTWBfsKqAYWkPuX8RUqmLOVgM9ZGTTTa3TWOu21tvtpbols+bmBctevx+RPKN9ugAnUXv7
	Wu+dx6YZLKdNoM3tIX2W4WL5bqgv8HLj5NQTqpxPtCIXZzIa91F+kX7o56jrmwdjOFgZtBej2FHZq
	eeOOmHTLVuE4IHrthX++fmC+Xbp7AxYnldd6+T9kMtPBfP8YmOl62MXCZaE4kP917O41juzhTKnA5
	eOYrepaZxu0RnRDHSfZX3tmGxD0IUhQs5QVVyQ8ToiZBAA1eXuzd/yIEW2HMHtOI/Mj0RR/JhXNjW
	mtBo1pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKQ-00000004iMT-3qDg;
	Mon, 02 Feb 2026 09:34:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKN-00000004iIK-1Faq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A059339;
	Mon,  2 Feb 2026 01:34:32 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B0103F740;
	Mon,  2 Feb 2026 01:34:37 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 02 Feb 2026 09:34:03 +0000
Subject: [PATCH v3 7/8] coresight: Do not mix success path with failure
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-7-03292470c48c@arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=1351;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dJI+qk+Uln3LYcRNyZrbDitW2HiXNUKEvUo4DQ3sYEc=;
 b=wLTzekxTbH4WSbwNo62TlDNpTd8BIwxN8tnb/32jt1XUcGNRgCPtssyj9oGmr90Szx3vhgf5n
 bbIXetZxt63CEXk7drYeAZUrsx2kRWNTGN2J/TrEMsCCvk/ZJRWfe1+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013439_427728_30F3F7D0 
X-CRM114-Status: GOOD (  11.06  )
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

Separate the failure handling path from the successful case.  Use the
'out_unlock' label only for failure handling.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c694b4bea3d724464e97a4932ead584d59d8a69a..955af43010446803030973c72f07315492b2fcf3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1398,17 +1398,22 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
-	if (!ret)
-		ret = coresight_fixup_orphan_conns(csdev);
+	if (ret)
+		goto out_unlock;
+
+	ret = coresight_fixup_orphan_conns(csdev);
+	if (ret)
+		goto out_unlock;
+
+	mutex_unlock(&coresight_mutex);
+
+	if (cti_assoc_ops && cti_assoc_ops->add)
+		cti_assoc_ops->add(csdev);
+
+	return csdev;
 
 out_unlock:
 	mutex_unlock(&coresight_mutex);
-	/* Success */
-	if (!ret) {
-		if (cti_assoc_ops && cti_assoc_ops->add)
-			cti_assoc_ops->add(csdev);
-		return csdev;
-	}
 
 	/* Unregister the device if needed */
 	if (registered) {

-- 
2.34.1


