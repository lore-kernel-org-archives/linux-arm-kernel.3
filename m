Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DFAC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXnPf3Sx35Y9mEEXv7hopJaADfFnbVnXgM4kK5msXjo=; b=j6eN1YgiKaKTwS4cOMzkvnw7bg
	rlWxiZDLQKqs/sx9iSLZ3I4KZp50syyKoYi18dtmS6+O7Ekjf7VOFc49Ci6Yk1tuUlvULnXe5J5C6
	fDYkp45LDY5PSeFjMBkSFuWBx4uurHUYB8jC1CMixGyPSpKofGqa1DXuRQln4p9dQsl8YgeeHElW6
	TcnFMcP6rFLlC5N+/kFRx7xGRbAWZqpH1bf7a+GjL52TO5nO47l5qSi5A/QHbZTY5JMo5HS+Q+HMW
	dPhGzXPCi2VoS6rAoXNmkY2MBE+hfBIZZTiDHoxTzydcQ37NSqw/xBxmZ3MSicVSwV0O8thxMXVRk
	O6DDp5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tij0P-0000000CzoH-2TiK;
	Thu, 13 Feb 2025 23:52:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiixQ-0000000CzI5-1bYM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF7A21AED;
	Thu, 13 Feb 2025 15:49:43 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 000C83F5A1;
	Thu, 13 Feb 2025 15:49:19 -0800 (PST)
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
Subject: [PATCH 1/2] iommu: Handle race with default domain setup
Date: Thu, 13 Feb 2025 23:48:59 +0000
Message-Id: <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1739486121.git.robin.murphy@arm.com>
References: <cover.1739486121.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_154924_555309_B217AB32 
X-CRM114-Status: GOOD (  15.12  )
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

It turns out that deferred default domain creation leaves a subtle
race window during iommu_device_register() wherein a client driver may
asynchronously probe in parallel and get as far as performing DMA API
operations with dma-direct, only to be switched to iommu-dma underfoot
once the default domain attachment finally happens, with obviously
disastrous consequences. Even the wonky of_iommu_configure() path is at
risk, since iommu_fwspec_init() will no longer defer client probe as the
instance ops are (necessarily) already registered, and the "replay"
iommu_probe_device() call can see dev->iommu_group already set and so
think there's nothing to do either.

Fortunately we already have the right tool in the right place in the
form of iommu_device_use_default_domain(), which just needs to ensure
that said default domain is actually ready to *be* used. Deferring the
client probe shouldn't have too much impact, given that this only
happens while the IOMMU driver is probing, and thus due to kick the
deferred probe list again once it finishes.

Reported-by: Charan Teja Kalla <quic_charante@quicinc.com>
Fixes: 98ac73f99bc4 ("iommu: Require a default_domain for all iommu drivers")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---

Note this fixes tag is rather nuanced - historically there was a more
general issue before deac0b3bed26 ("iommu: Split off default domain
allocation from group assignment") set the basis for the current
conditions; 1ea2a07a532b ("iommu: Add DMA ownership management
interfaces") is then the point at which it becomes logical to fix the
current race this way; however only from 98ac73f99bc4 can we rely on all
drivers supporting default domains and so avoid false negatives, thus
even though this might apply to older kernels without conflict it would
not be functionally correct. LTS-wise, prior to 6.6 and commit
f188056352bc ("iommu: Avoid locking/unlocking for iommu_probe_device()")
the impact of this race is merely the historical issue again, but since
deac0b3bed26 that would raise a visible warning if it did lead to a
default domain mismatch, which nobody has ever reported seeing. Thus we
should only need a backport for 6.6, which is probably just this with an
additional IS_ENABLED(CONFIG_IOMMU_DMA) check. Phew!
---
 drivers/iommu/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 870c3cdbd0f6..2486f6d6ef68 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3097,6 +3097,11 @@ int iommu_device_use_default_domain(struct device *dev)
 		return 0;
 
 	mutex_lock(&group->mutex);
+	/* We may race against bus_iommu_probe() finalising groups here */
+	if (!group->default_domain) {
+		ret = -EPROBE_DEFER;
+		goto unlock_out;
+	}
 	if (group->owner_cnt) {
 		if (group->domain != group->default_domain || group->owner ||
 		    !xa_empty(&group->pasid_array)) {
-- 
2.39.2.101.g768bb238c484.dirty


