Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A941D13C13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TewMu9nTeuacd23v8nCPGx5nl7sVXW8HgrNUZEOdY8k=; b=aOLHmG+xEXho6FvC1uaBMUq7jR
	dqFDR6iSWRmHvaYK1dObN46gjI3s2MUMnwhwGCJgM0Bpzv+YIMM+7rzmLTUwPXx2xzifeWdZHzG7v
	cndDLi/YRVHrHoxkHGpf39ZbyGHpuPVcmyKjm+M3E3xlsh7foIYAlDh0zu0Mhc6QEdUP/c6yO9IFA
	vSEsB0z4S4WggafDK15Y6uXGOrccY1iSFQ5ZuVVx3G+GZnrYYv5Z0Bk6FRE9jxpkz3iMeD+t9HLYZ
	ITUdG2hbo0EpuxjboymHIuUeF3H/5mqFFyeEBzdE1RtXZXl0fMcwQHyxfER0ZMVpIJSvp8+SiH5so
	YHEEgWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1T-0000000CeDa-0cvb;
	Mon, 26 Jan 2026 13:52:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1K-0000000Ce8q-2ZTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C39E5339;
	Mon, 26 Jan 2026 05:52:38 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EA863F632;
	Mon, 26 Jan 2026 05:52:43 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:03 +0000
Subject: [PATCH v2 3/8] coresight: Protect unregistration with mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-3-b5a3c0441c15@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=1601;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=NNtyAxNPwkV3k4xTpN3INAVKd2Yf9zKDsOUZfCQ+ZCw=;
 b=9jvQ1yfATrYjaMdrbvY+6WdiUxjP8y7iXWCIDITcXWLM3hGr4fi6D8ykgbmuHpUFiIfk+dUxX
 kdDKJ1UgN5AAWGlNNlMmSILp/T3rjJ9Ip2EZLgkkcckO6iby/BUq+tU
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055246_701962_56B401D4 
X-CRM114-Status: GOOD (  10.62  )
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

The device registration is protected by CoreSight mutex to ensure the
atomic operations when adding a device onto bus.  One the other hand,
the locking is absent when unregister a device.

Use mutex to ensure atomicity on device unregistration.  During
unregistration, unbinding the associated CTI device is not included in
the locking region, as CTI has its own locking mechanism.

Fixes: 8c1d3f79d9ca ("coresight: core: Fix coresight device probe failure issue")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6f21925a4913330a27db5d5836f34f13382339e7..b992ef5de8ddbd535e937c616bd7ab663f097f76 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1429,14 +1429,17 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
-	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)
 		cti_assoc_ops->remove(csdev);
+
+	mutex_lock(&coresight_mutex);
+	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
 	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
 	device_unregister(&csdev->dev);
+	mutex_unlock(&coresight_mutex);
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
 

-- 
2.34.1


