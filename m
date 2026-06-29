Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AA0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Oyzu9JoPE7+b6B6QyixNJEN5zTewJ+GquORGY+GUSI=; b=fARilmVw2w9v8ZSEiqWXN+NcpC
	Cu4K0Vbz8C73qj3NnUS7S2JXcL0tXmNxQ5tpioazol6pA3v/HvukDCFW+yz1Y8c68AwWdsTflyc5e
	8nvq9DYh9NFtZuef0RI+d3CU73FtqMap5AzJbXWn/57kk1JHP53vudQYDGtMj4YoVhTL9bsJORCPS
	s3yQp8+XQgNy5xGSpf/ZB0SMkPnYSTrbF5tCk/oh3RzFMoe8HSnKFyUM3MoDOOG2c4bYaUfSlBXST
	LflGB5HnDbFfua2xdB6VNflHbmhyJK+nRB5NZNjWDd7ScYfE1jUhyD0AZO8RUxPADoToox16U4GD+
	+3tUf4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1a-0000000EQEV-0Y0Q;
	Mon, 29 Jun 2026 11:19:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1S-0000000EQ7n-0osl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AAEE358F;
	Mon, 29 Jun 2026 04:19:25 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 794F73F905;
	Mon, 29 Jun 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731969; bh=Hlov7Nozzx9yYhHTSJZP/ZUhXHV/Gu1qftbUTIwp+Y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K3IxTRqgv9VLVw7RvPJif9Wmw2DyJOcXp8Kl4ZNWUO24q7dKWTIDu2TpRIU2wk/jF
	 KA1h3+9tZbvIX4wyYx7eoFYNuyVCZR/u9hQdnZnWYZXTMda5OTf3AvUFvlDbNGNumH
	 rEs41n/Z5u/+3g3QgRrWtFtt2UeNLe0c3Vbhq5JM=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 13/13] KVM: arm64: Enable KVM_HW_DIRTY_BIT
Date: Mon, 29 Jun 2026 12:18:01 +0100
Message-ID: <20260629111820.1873540-14-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=leo.bras@arm.com; h=from:subject; bh=Hlov7Nozzx9yYhHTSJZP/ZUhXHV/Gu1qftbUTIwp+Y4=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQpLub72/bYvV7vYvLekhS/edDW7POb3Sevf/BcGxm htau2K3d5SyMIhxMciKKbLIPpq/iuf7lIwjV34sgJnDygQyhIGLUwAmsqOMkWGvqUmjw/nVLEp+ p9ivLBM7L99jt0JleWi9V/KtzSV2c30Z/infz8uNsu0MErrBejx1G3fFx9QLk7UcBIpsnXzUlk5 +zg8A
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041930_321502_B50B4270 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Set the corresponding bit to enable hardware accelerated dirty-bitmap and
dirty-ring cleaning for arm64. Actually using acceleration depends on the
cpus enabling FEAT_HACDBS as well as the pre-requisite features for it,
such as FEAT_HDBSS and FEAT_HAFDBS.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..db8487bf738b 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -27,20 +27,21 @@ menuconfig KVM
 	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
 	select NEED_KVM_DIRTY_RING_WITH_BITMAP
 	select HAVE_KVM_MSI
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_READONLY_MEM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
+	select HAVE_KVM_HW_DIRTY_BIT if ACPI
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
 	help
 	  Support hosting virtualized guest machines.
 
 	  If unsure, say N.
 
 if KVM
 
-- 
2.54.0


