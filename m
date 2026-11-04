Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BEE6083606
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wgZw/ReV;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YjKyDO0M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5mDmVcyfUCeEAX8H66OPCvcSV/Zj8eOdzhf6RFoRR/s=; b=wgZw/ReVmsg3I2
	KjIamyy35hnYHo7Y0QwLbUf7PLNZWwqGj07qmRJU/ip1tDimm88niBGKxxLDJdF1dDWsbX4AGRPT5
	vyJ+Vh7o1HUALjGnN2iqlCHxFs55VObArDcyU3yajefYKi+deOgE9pkSWAugUB2G6oSyE0gZkZQ8r
	NOcxiV34TWHA1r/GzD1Ge/Q25u5pwv8XFv/Z9ie55EpBlRLu1p83TAYyTB4Bs84VmNN/lAAnW5p85
	2dd3wZU3rJTIMLCuHN+KRybeYteHKNKs25WM4DHrvd43yZOueXJi8/4c0+pevsHuXEM84yGTvGEOj
	dY6/kWg02NZ+5/H0KNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf66-00000006GZy-0Wvm;
	Wed, 04 Nov 2026 17:48:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf62-00000006GWZ-2QzY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7D711F91;
	Wed,  4 Nov 2026 09:48:22 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D473F673;
	Wed,  4 Nov 2026 09:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814505; bh=rtHBnwtVq7g8hs8r3SVgFVZrZGzkMLR5iSHNEjAFp9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YjKyDO0M4UEGryr6fyL6FBYC6HZ6eECnV3V+dxb5ODIgwnY3mebUd21YeLEU1TtSe
	 rAVvji1D/DD+l1pUmuO2P8FVfcf1XM2G+XjZim4HHiGReUxiwdSzJesyNhlq2ApjfF
	 mRZ32i4fTeOM6h/djSfu9/l0VO/ebe7nLZn/42IE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:47:57 +0000
Subject: [PATCH v2 03/10] irqchip/gic-v5: Serialise IRS synchronisation
 requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-host_gicv5_fixes-v2-3-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094826_693840_D0C70CF9 
X-CRM114-Status: GOOD (  11.58  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
Calls to gicv5_irs_syncr() for different IRQs can overlap, allowing
the second request to be dropped. Its caller can then observe the
first request completing and assume that its own events have been
processed.

With GICv5 ITS KVM support, gicv5_irs_syncr() is also called while
restoring the host ITTE in gicv5_its_set_vcpu_affinity(). The callback
runs under the IRQ descriptor lock via irq_set_vcpu_affinity(), so it
cannot sleep.

Serialise the request and completion poll with a raw spinlock, and use
atomic polling because the synchronisation runs while holding the IRQ
descriptor lock.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Cc: stable@vger.kernel.org
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 4edf787f3f97f..ead76560ea08f 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -10,6 +10,7 @@
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -22,6 +23,8 @@
 #define LPI_ID_BITS_LINEAR		12
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
+/* Synchronization requests must not overlap in an IRS Domain. */
+static DEFINE_RAW_SPINLOCK(irs_sync_lock);
 static LIST_HEAD(irs_nodes);
 
 static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
@@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
 		return;
 
 	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
+	guard(raw_spinlock_irqsave)(&irs_sync_lock);
 	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
 
-	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
-			  GICV5_IRS_SYNC_STATUSR_IDLE);
+	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
+				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
 }
 
 int gicv5_irs_register_cpu(int cpuid)

-- 
2.34.1


