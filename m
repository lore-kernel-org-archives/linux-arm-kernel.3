Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC6CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pv3Ys+pA4+1vCBq84R21dxT9/QJJAyatLRRpHfKse0=; b=swLSRkPVyNW9KqqA+xhDPqn2F0
	uxW5qqrIbBbF71zfokeQfBTy2QJ6P3R3XXr1GdB8vDOS7wUw0apkMalEyasq/ZcB2SaKl7oEzrnE5
	NBAmcalHx555v1YtcG8EKlJ2SG3IaufGh3BUaZtqW//V/wooTOOrjuSC7DzIwx++DC5Ln6ZE6qhHW
	GZ51TlEA+uuzXyugQ7DLak+RxKbqFj+nrELeL5vQ8bnFDWoDU6j0wrAm4NBhUR9iXKSZK9vxxhVYo
	Y5nweotR5V4tzkHkRQ4Hknqmmi7XIzkzRSJWvs5lWeMPFIwyIcFwaLdA+59RCMdY9I4ooG6CQbLWa
	a/FBag2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWZ6-0000000Ahg6-0DyR;
	Fri, 02 Oct 2026 06:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWZ3-0000000AhcA-0mAi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:16:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 791DB1476;
	Thu,  1 Oct 2026 23:16:08 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BF383F763;
	Thu,  1 Oct 2026 23:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790921771; bh=tnXpJdsvz79ly1HeWLu/5oHQruvLIlQTSjflY77QwYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=onyjg9j33dQiYYoNArDmlsdmZ/ddqvxPdRKgZLXl5KEctv8CLAWcuqP24CIq52217
	 KenHwUwgPuMjP2dC5HDNO46rNvoFgD/hP/sDAhypVj1kcWxrt2PudKtg5MdBsR0TvS
	 P1u7Lm/KFvXF2Stt2LjiNeuvLmr6FtuYIHB4e3jE=
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
Subject: [PATCH v22 10/10] firmware: arm_rmm: hotplug: Skip memory added to ZONE_MOVABLE
Date: Fri,  2 Oct 2026 07:15:06 +0100
Message-ID: <20261002061507.1600269-11-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002061507.1600269-1-suzuki.poulose@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_231613_285721_15CA6C34 
X-CRM114-Status: GOOD (  13.12  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v20:
 - Use is_zone_movable_page() and only check the start_pfn
---
 drivers/firmware/arm_rmm/rmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index c064072690d46..c3c3cf6dad59a 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -1050,6 +1050,17 @@ static int rmi_memory_notifier(struct notifier_block *nb,
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
+	if (is_zone_movable_page(pfn_to_page(arg->start_pfn)))
+		return NOTIFY_DONE;
+
 	ret = rmi_prepare_memory(start, end);
 
 	return notifier_from_errno(ret);
-- 
2.43.0


