Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD822C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6ZYAUff0SUNCS9QcJIYyrrespTQpZGBwDyvzxASjtU=; b=sGICTIkasrpF00QxQ0yPnxrh7Y
	tWJIHlHvDNRhstYPhAIz3D3K3fEUOTjQj+PjvCnx0XYi15p/sFsms00jKW7CLBOT0tGxe1HZJ+08u
	IoEHlmxcNsGujlbCIKKlIQ8e/QnWwCODfi7SzqoX/1muihwl8mCDPx17HI4bRY+gR/XBK13DxddFD
	G1yJTMfHQap3ncBILRxzCMIkOw7y/HXWWjn9Uch3DLWI9MR6qYgyWWoc0b/PznJkMAdigwXvHyTS4
	uOPSC1dROV5VVEZ7ozX53ClYRp1DJ1acS7t4JxZcPibFVDFC1tgjaYhPRbmPrOcTPWIiPbcJQE1Bv
	tckdc7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN8-0000000Bkqx-3ML0;
	Thu, 17 Sep 2026 15:50:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN2-0000000BknF-1fhl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE861596;
	Thu, 17 Sep 2026 08:49:50 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 181ED3FAF5;
	Thu, 17 Sep 2026 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660193; bh=Y+WAhNdJhbgyJ+wetEYORxE9hRaKg6woWRaKFt4pY+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z9CUTph21YGv5I1DbJ14S+bn2vY2OisXJwdCvVyFDhcPMITMEPjdn1kxCHU/iNRSR
	 wUtRhSOgzztzvSMq0oTCUBUotNOtPPSt2OSzxMQq6gU2fY2wJ1TtXzvCVG6LJn0n02
	 tdRzodyagqrnqZ6k5+Wx8o2L3XMxpOjK/aIZEU44=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool 1/7] arm64: Pass the number of elements as the first argument to calloc()
Date: Thu, 17 Sep 2026 16:49:26 +0100
Message-ID: <20260917154932.193943-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917154932.193943-1-alexandru.elisei@arm.com>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084956_473178_6F5BFE1E 
X-CRM114-Status: GOOD (  10.80  )
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

man 3 calloc is pretty clear that the first argument to calloc() is the
number of elements to be allocated, and the second argument is the size
of one element. Fix the instances where the order was inversed.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/kvm.c | 2 +-
 arm64/pmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arm64/kvm.c b/arm64/kvm.c
index 36b3284e4a92..cdd673542aea 100644
--- a/arm64/kvm.c
+++ b/arm64/kvm.c
@@ -454,7 +454,7 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 
 	kvm->cfg.arch.vcpu_affinity = cpulist;
 
-	cpumask = calloc(1, cpumask_size());
+	cpumask = calloc(cpumask_size(), 1);
 	if (!cpumask)
 		die_perror("calloc");
 
diff --git a/arm64/pmu.c b/arm64/pmu.c
index ef7faca1b71d..49d58ddd529b 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -192,7 +192,7 @@ static int find_pmu(struct kvm *kvm)
 	cpumask_t *cpumask;
 	int i, this_cpu;
 
-	cpumask = calloc(1, cpumask_size());
+	cpumask = calloc(cpumask_size(), 1);
 	if (!cpumask)
 		die_perror("calloc");
 
-- 
2.55.0


