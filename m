Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD025CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8kJvCUix0IufXX19XTzGna3ld/8JruCx9lQOIaEJa0=; b=a+6T7smmohLIeto1ITFr+y/6YR
	peuyfrN5IP02Pz5Clr4cniEwoRj77PIoUHbmiaRkCMT6N7eHJ6Jknqkf2YyStrYyKEtLYCcOY6yYh
	s6xJO8OMb/zt18g2LVII2dR6ZlR3pYpAr7txMLMoPFBAFTXDeRFmz9O1gROeceTTRZ3SWwjEp0Og1
	C99bcU0v1LAZXb30/gIjRO0dh+TxmOEhc5BJPkm30vHkrr7AvLha+vy7ILQndIyuTOgJOLKXYt/Re
	8Aiogm1f0bq2OewH/gjNCned4NKgtvuPZVPfYizwZ0nxukFDy1ZCIUzYkJXlwTpb6qm10NySdih4S
	DE0KoW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqf-00000009JNH-0JW1;
	Fri, 15 May 2026 20:09:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqV-00000009J9B-1nDr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6482938;
	Fri, 15 May 2026 13:09:13 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72F193F836;
	Fri, 15 May 2026 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875758; bh=cEs4PxprBvqDrAQtZJ8uAQGsFeo8bh6Rvl/d/DeH95M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qzvHxFM7dfynPab5/xB5INkeUj7oIfFZs0xGmIW3A6RpyXUey2SJ8CiGFNInnOZ9t
	 HUCzMXiyyJvO6t4xskqFlClTS0kjO7SHBwqt4zGbqLjcvHMQJa3aP6UUIQnynARNe+
	 yZQSRxq2YVG8OBRHxhQJpIjOlkl8DdNAG7PD7N+U=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:24 +0100
Subject: [PATCH v14 17/28] coresight: Use helpers to fetch first and last
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-17-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=1946;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cEs4PxprBvqDrAQtZJ8uAQGsFeo8bh6Rvl/d/DeH95M=;
 b=cv2Bo/f0/JAMCxH5FxqR+SbktcHoYUPbU2tSU/UdDhcVyhtHQAaSoYkZKstrExD1AD3qFSylE
 13i03O7JDlWCuJI5PeD5o8qwc2L+wgxpkPNImr/0wSrMGzM79Ef+i1E
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130920_300805_922E429C 
X-CRM114-Status: GOOD (  11.52  )
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

Replace open code with coresight_path_first_node() and
coresight_path_last_node() for fetching the nodes.

Check that the node is not NULL before accessing csdev field.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 62a12a90988949ccc8c181c8edde7939e4f986ab..61ae7b6c7a836caafaf87787af91a1f5326c16ec 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -174,11 +174,16 @@ void coresight_put_percpu_source_ref(struct coresight_device *csdev)
 struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_first_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -711,11 +716,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_last_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;

-- 
2.34.1


