Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D4D13C0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAoodAXNLyLaLCzfBx+iZihFsJKkKh2AiVqBNJiK1f8=; b=XRunKQXwn4dS7jipUFAe7JJNnR
	IfQoEmnTJTh5Fvq0mh+quexmdFiqAZTcAI+9LuZalawiV6UN4KFFGXTxjuLT7eL5Li1FFQRIqC6Q4
	nDhvvxbXaaEE2y9+tJj6dVJ8a+upsJ/CcuvSwkvMWFqqXq7D+PY9+aiFhUlBSnoJeMX5CdURsX1fq
	ADK4LCieC6kfpChih6P+9aSW37VdeW38btygzmDXyStSU+ksMhX7UPg1PmPhdSUU/rTCYdL34OrVG
	vWnhSTQE+ybX/OnL7oL7A1tGev6HIxDWormerq7wGA7XRyTOl3eSS8nx4MmWissgffuRN6kVr/I+B
	9VqwYIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1p-0000000CeUt-0aXY;
	Mon, 26 Jan 2026 13:53:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1X-0000000CeIW-3DS3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:53:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C025153B;
	Mon, 26 Jan 2026 05:52:47 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9C63F632;
	Mon, 26 Jan 2026 05:52:51 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:07 +0000
Subject: [PATCH v2 7/8] coresight: Do not mix success path with failure
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-7-b5a3c0441c15@arm.com>
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
In-Reply-To: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=1351;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=880QgqoGJpM76WHGJPVeV8CTB+waFSOBrewKHx10yEo=;
 b=+F97SOQYNgFkPNvp4D35ZRyz3QF5wqUu0aiD3Fp88rR4E0hqReaOaSpE7zw9xdieG7ZE2RXuj
 YkIT7K1ZtSFAq6VkN1Z3ku4x3xfFauCvGrxetG6esUzFlQoUSdrU8Zx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055259_859748_F28E2321 
X-CRM114-Status: GOOD (  11.01  )
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
index 5c29f78de7f115d61f550dea62b6538940ec9182..c2b5a6efd1c01b0fbfbc289cf27232ccc731ba34 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1395,17 +1395,22 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


