Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A96C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8F0f7CXw/ay9dfzL6V3N9lUGwAZE2jAV28zerg1tc8=; b=WGdj4kAGFFJTyh9oxwN5wT6gEq
	1pD+FrpGEUHsXLE5lWCW6zlpVA5eaPr8NbV5QzuSWFBB6bnU22hiWaG3jtq97EUgcZ7/UtFZImBUC
	fDfr+NXg1Fj0LaYFJ1q/ueUa23veJqq1naJZMMmzXXXTqSM1s3aorPzprDStdaikBMQeh1+SNBdFI
	HzXnYwetmSAOOzXI1RHxYCEeEOuFi3KlTQEMrc7cD9sE+i1/sBc+Qme5D8LIKo+Wrn9Wg9/6qc9y9
	bRPlHQ03TWq3P0+VngARb8IZ2IqydbZZVoFVH/phbQlLwM+kwjp02nyHr3ZC1UuRhpcxdupD7y6bd
	Q4xEMV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVgv-00000009yTF-0jlG;
	Mon, 12 May 2025 16:07:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVHR-00000009ucM-1uRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:41:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0E4150C;
	Mon, 12 May 2025 08:41:14 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B54DD3F63F;
	Mon, 12 May 2025 08:41:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 4/5] coresight: Separate failure and success flows
Date: Mon, 12 May 2025 16:41:07 +0100
Message-Id: <20250512154108.23920-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084125_534580_966F0676 
X-CRM114-Status: GOOD (  11.63  )
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

For a success registration, it releases mutex, then binds associated CTI
device, and returns a device pointer.

As a result, it separates flows between the success case and the failure
flow, any code after the tag 'out_unlock' is only used for failure
handling.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4f51ce152ac7..4fc82206b326 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1377,17 +1377,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


