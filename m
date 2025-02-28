Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CEC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qbnA5RtP6yarnIcqpDVg7+8heRiWDvpcH0HlU3PCMI=; b=zFDxgxSGFWWfAa8yAbIGwCvNZ6
	9U+b/Yv8VIV7hAif5XT/g+CN3UGLHDmenzaBv2WS95kaHx6lutikBWQkJNy8u/pXM831lQCWDkKCz
	210nnRd+ZZ5D0/Arb2H/yD1a4EsiInW/+4Z9HFou/0nQcW3pNqJpGcz+K6QoO6lWeswJxaYcfrWSQ
	sr7b6iKKP/OMrTAEmQiwyl2lQsQNhKg6dadAsIzkEIj44ZYEbA8HRjmieQ8S0Rwx7tOLwx0jcnK0F
	KeizWdH7XCWQVjHc18Q0EAASm5axc7GBMymtWyvlBM1RJygbjCjPFT/r4K8pYnMMMDBJnKr0hxq31
	YaBG2sEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2sz-0000000BbD6-0Tag;
	Fri, 28 Feb 2025 16:06:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Zj-0000000BWxH-2zmX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36FD1A25;
	Fri, 28 Feb 2025 07:47:09 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D14A3F5A1;
	Fri, 28 Feb 2025 07:46:51 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: [PATCH v2 2/4] iommu: Resolve ops in iommu_init_device()
Date: Fri, 28 Feb 2025 15:46:31 +0000
Message-Id: <fa4b6cfc67a352488b7f4e0b736008307ce9ac2e.1740753261.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1740753261.git.robin.murphy@arm.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_074655_879460_B5000810 
X-CRM114-Status: GOOD (  16.07  )
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

Since iommu_init_device() was factored out, it is in fact the only
consumer of the ops which __iommu_probe_device() is resolving, so let it
do that itself rather than passing them in. This also puts the ops
lookup at a more logical point relative to the rest of the flow through
__iommu_probe_device().

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: New

 drivers/iommu/iommu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 179617bb412d..37b7088e129a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -404,14 +404,28 @@ EXPORT_SYMBOL_GPL(dev_iommu_priv_set);
  * Init the dev->iommu and dev->iommu_group in the struct device and get the
  * driver probed
  */
-static int iommu_init_device(struct device *dev, const struct iommu_ops *ops)
+static int iommu_init_device(struct device *dev)
 {
+	const struct iommu_ops *ops;
 	struct iommu_device *iommu_dev;
 	struct iommu_group *group;
 	int ret;
 
 	if (!dev_iommu_get(dev))
 		return -ENOMEM;
+	/*
+	 * For FDT-based systems and ACPI IORT/VIOT, drivers register IOMMU
+	 * instances with non-NULL fwnodes, and client devices should have been
+	 * identified with a fwspec by this point. Otherwise, we can currently
+	 * assume that only one of Intel, AMD, s390, PAMU or legacy SMMUv2 can
+	 * be present, and that any of their registered instances has suitable
+	 * ops for probing, and thus cheekily co-opt the same mechanism.
+	 */
+	ops = iommu_fwspec_ops(dev->iommu->fwspec);
+	if (!ops) {
+		ret = -ENODEV;
+		goto err_free;
+	}
 
 	if (!try_module_get(ops->owner)) {
 		ret = -EINVAL;
@@ -514,22 +528,10 @@ DEFINE_MUTEX(iommu_probe_device_lock);
 
 static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
 {
-	const struct iommu_ops *ops;
 	struct iommu_group *group;
 	struct group_device *gdev;
 	int ret;
 
-	/*
-	 * For FDT-based systems and ACPI IORT/VIOT, drivers register IOMMU
-	 * instances with non-NULL fwnodes, and client devices should have been
-	 * identified with a fwspec by this point. Otherwise, we can currently
-	 * assume that only one of Intel, AMD, s390, PAMU or legacy SMMUv2 can
-	 * be present, and that any of their registered instances has suitable
-	 * ops for probing, and thus cheekily co-opt the same mechanism.
-	 */
-	ops = iommu_fwspec_ops(dev_iommu_fwspec_get(dev));
-	if (!ops)
-		return -ENODEV;
 	/*
 	 * Serialise to avoid races between IOMMU drivers registering in
 	 * parallel and/or the "replay" calls from ACPI/OF code via client
@@ -543,7 +545,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	if (dev->iommu_group)
 		return 0;
 
-	ret = iommu_init_device(dev, ops);
+	ret = iommu_init_device(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.2.101.g768bb238c484.dirty


