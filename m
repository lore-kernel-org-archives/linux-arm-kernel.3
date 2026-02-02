Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E6CE7314F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pugX5KQX9IzH0JXh2nQigB6+VzDeyuwbg/YnMPGqgOI=; b=Vx7/H+7Y7x3ueaCl+WIkjKbqlS
	85uzaYJiw9x8BJtDVPVGowG0g51zhX1rjRaJpjW07r7su4GYNA1gWdkT1tHH/yjKhgTsemeqj1dji
	eMhySa926L2dlEst/yWDccy6nhHNC9kdgwCGpVs+fsrZTgrX6pUyje/CTXoeONZchx9j/TQCj+UH6
	3IjM1Q24pVBaoApyfJlsVZKoiau28abstw+bbd0u5CX6CwcQyIC2+5wGw87RPjrYN5/2AkBlJ+zbV
	suPOX95IVT8Yf1l5m7Q8bCJwUNQih47j4hM2lsX60a8kka1TSHcif80YH1UDsl5V+dX0esYNsE4BI
	/vQKGeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKS-00000004iNn-1GnF;
	Mon, 02 Feb 2026 09:34:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKP-00000004iKk-2or7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87164339;
	Mon,  2 Feb 2026 01:34:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7673F740;
	Mon,  2 Feb 2026 01:34:39 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 02 Feb 2026 09:34:04 +0000
Subject: [PATCH v3 8/8] coresight: Unify error handling in
 coresight_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-8-03292470c48c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=2294;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=FKzkEQ0j6Pfh7Y1ApXM5Be0GTYJUKxqz4/lXxfvmDms=;
 b=8pyHcAVQuLvHeini3qOEsN8lnterXQqsp9ycDWXbCQYNHBblwuihlQl3z5PVE+oKi9tyYJ+WR
 F+v5QN/4Eg7DVH/Umlb9QRx3MiZTWW0m0TNf1K+rncQLk1NTdw7tiT0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013441_776984_DA095899 
X-CRM114-Status: GOOD (  11.89  )
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

Unify error handling during registration:

1) Failures before device registration are handled by err_out, which
   releases platform data.

2) Jump to the out_unlock label on failures after device registration
   to unwind the flow via coresight_unregister().

The "registered" variable is no longer used, remove it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 955af43010446803030973c72f07315492b2fcf3..65cf975493c86de42515845147d90497aa20c595 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1326,7 +1326,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
 	if (!csdev) {
@@ -1380,7 +1379,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		 * All resources are free'd explicitly via
 		 * coresight_device_release(), triggered from put_device().
 		 */
-		goto out_unlock;
+		mutex_unlock(&coresight_mutex);
+		goto err_out;
 	}
 
 	ret = etm_perf_add_symlink_sink(csdev);
@@ -1390,12 +1390,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	 * coresight_device_release() triggered from put_device(), which is in
 	 * turn called from function device_unregister().
 	 */
-	if (ret && ret != -EOPNOTSUPP) {
-		device_unregister(&csdev->dev);
+	if (ret && ret != -EOPNOTSUPP)
 		goto out_unlock;
-	}
-	/* Device is now registered */
-	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
 	if (ret)
@@ -1415,11 +1411,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 out_unlock:
 	mutex_unlock(&coresight_mutex);
 
-	/* Unregister the device if needed */
-	if (registered) {
-		coresight_unregister(csdev);
-		return ERR_PTR(ret);
-	}
+	coresight_unregister(csdev);
+	return ERR_PTR(ret);
 
 err_out:
 	coresight_release_platform_data(desc->dev, desc->pdata);

-- 
2.34.1


