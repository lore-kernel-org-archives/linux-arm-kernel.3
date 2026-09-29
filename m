Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63115CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMYH5VMQf7QKI4VqGfRxnipM4svbdc3TNjigvAgGjDg=; b=ptVqK1u5hc5TJzHdehg9nZIflA
	tK90Ds50jaTTRZWiMd63LVsKXFfnsZFWpCGYQ+00U57id1Bz4spL6EYtfIa0pmMVyFk9F/7wOEX+f
	9CA/vQ3YlTzCaoLCF8L4wNaKwg0P9Yci+P5HwaWPwxFF/QmbzVCBLbS0VmS3DD4/YabLNs/ydyI5r
	XSBMtE29mjetRvuvLzgEtWTzXwDPHEWQV2qKnFykplP0Z2HHJkVKvT0BNsEcL9XLWkY6ebTmAFc4X
	emzR2aiJAOX47ks8Gg7U7XSZJllZg3jaqPcReV6LAGsqd07BKDN853dX8Iv1ZDw0p7pLVUOeXJnL9
	Vv5tFNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg93-00000004gb4-3LJJ;
	Tue, 29 Sep 2026 22:17:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg8b-00000004gNI-1vc7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 22:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xMYH5VMQf7QKI4VqGfRxnipM4svbdc3TNjigvAgGjDg=; b=LkUG4SbRZGSV2xy/SOHi2dAwkO
	BFiLa1tvq6RfTFj6CFYttTc5ph0P77rmd/qVCl4W6GNgxyO+lmLO8uuHmqN37ft+FRHDKPW6kLN0G
	yNZ1xtoM8x9bpVvmtaq5DAYGcwKmyjI+boOgF8yP9AMSVFvHZR6unKy91sDWqz4TGrAMw9OGysRnU
	X2FY48hmSuuoEewAHJgC5DxPyiqWFbo1+BbwEsNZzXT8uQUky3MNqhl0iDXNmcMAt1lFx/o7sYzE7
	7iD41BdA7+jINTemKoF/x3GNvG0RO8MjShT37gwGurvlGrlC2eIchnBPiQWIsz9NVibwE+5YIsV+S
	oLX9I6aw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBg8Q-000000038HN-3NpJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:17:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC3CB1682;
	Tue, 29 Sep 2026 15:17:09 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6839F3F85F;
	Tue, 29 Sep 2026 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790720233; bh=2U+cAcr8VcJVMr34PG0rQs6SPss8l1YbdTIFge5eJ3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQoSVaj/joHDiB+a+Td9/wqeuygHIGRa4x9oWLe7eEDb/5FM0lKIoXcXl92wLTSB1
	 B1gw19h9UeWXp9nJ/EEuVZHgoXwvANX1XUVZaIllSXlm0ryyN/q5u7yL9yXvwkjvvP
	 +XUVKbXkU3aJ9LfMpmsO5X3er6QaCrnS6hKe+kaE=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	David Hildenbrand <david@kernel.org>
Subject: [PATCH v20 9/9] firmware: arm_rmm: hotplug: Skip memory added to ZONE_MOVABLE
Date: Tue, 29 Sep 2026 23:16:23 +0100
Message-ID: <20260929221623.1342076-10-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929221623.1342076-1-suzuki.poulose@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_231715_505648_F1C2C27A 
X-CRM114-Status: GOOD (  15.27  )
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

If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
without the RMM having fine grained tracking, as we won't allocate pages
from there for guest-memfd or kernel allocation

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - New patch in v20, keeping this at the tail to allow for the rest of the
   series to proceed, while this patch gets discussed.
---
 drivers/firmware/arm_rmm/rmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index d4d098448e46e..ef0a171ba9677 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -1043,6 +1043,18 @@ static int rmi_memory_notifier(struct notifier_block *nb,
 	start = PFN_PHYS(arg->start_pfn);
 	end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
 
+	/*
+	 * If the hotplugged memory region is in ZONE_MOVABLE, neither the
+	 * guest-memfd nor the kernel allocations can come from there. So we are
+	 * fine to skip this.
+	 * For boot time memory, we don't allow this discount, as the
+	 * decision to move boot memory pages to ZONE_MOVABLE is purely
+	 * a kernel choice and the firmware must have decided what it covers.
+	 */
+	if (page_zonenum(pfn_to_page(arg->start_pfn)) == ZONE_MOVABLE &&
+	    page_zonenum(pfn_to_page(arg->start_pfn + arg->nr_pages - 1)) == ZONE_MOVABLE)
+		return NOTIFY_DONE;
+
 	ret = rmi_prepare_memory(start, end);
 
 	return notifier_from_errno(ret);
-- 
2.43.0


