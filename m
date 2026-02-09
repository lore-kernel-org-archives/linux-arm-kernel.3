Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556BE81BAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30m/VR2QIkF2QEyME4UfNWb8HfjGTJo13HJM3yqMP0c=; b=SypFylpDrvTfCe6s7L7WGplS/m
	7wgIUnW6iEaqB6Hk60kV4/svVL5jRpHOagEBX6dshNT0IIYDvAWC7UtSPL2hHlUqSaJ6WOQlVUFMd
	RXK3z3jUeLXyyYJ4lqh/QhQ3Rax1FW3isVdhBjqUzgoXcuNokKxAKyUTqax70MX+Q37ktjG0gd4Xg
	ysMWzJY3/ND8iQo2cmh5hW8/GAHOyEkR1iTOE9wEdlL12NOsTyy/UgfLvXZvGqlk8ZdkpWUeYYwA/
	FZtNseH/w/GbG664uzmunKvjvW7M9JQlsV4SCIHy56Or5Ua2vfu7RcE/3AByZfZcihfGrE3hyctBY
	TU/5Aj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdb-0000000FNTw-1en6;
	Mon, 09 Feb 2026 12:45:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdY-0000000FNR1-1VGb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C5AE339;
	Mon,  9 Feb 2026 04:45:00 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 105FE3F63F;
	Mon,  9 Feb 2026 04:45:04 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:39 +0000
Subject: [PATCH v4 7/8] coresight: Do not mix success path with failure
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-7-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=1402;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ySxXMDurtX6pTacsLYOzBNYEPNJzboemPr3jVVpf8qM=;
 b=aDjFFP4dsoVyeBGagPB69BmdNgG+XVGmZo40ZRKsxoO7ID2tAcnbZCO/bm+zF4V7G7pouq8Q2
 hsMwjvg4UHYD528vfQunvTvkzN+sOd+Dq+1jWU6ssUE3e5vXDeNFrRM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044508_449535_9F8729FC 
X-CRM114-Status: GOOD (  10.65  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
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


