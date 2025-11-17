Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846A0CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZRHy3svuNchmJFYToVRnx2mDpnN1m/iPQ4+pK/3fxU=; b=BsBlAFY7Ry3KYCLwhqJL6P4W2W
	Vh5zKIzvL1eTF8asT0gTpvxbZ8EwZXXrX4JHWZ5C8E9OMe0wqzyiV4Y7x5fLnevspkgIqdrTTMF5F
	3NTh6EjGZA7jTy/feAAJcC1z7Yt5mFV0UN2koBGBnpO2EV/65Z45qmZkOUBmHiuuZ4+40iHA2FlXS
	AYfsPbybgcLB8Y5FKUqp7bAbo2YEBPqdMFrKLdL783bQFXTKyulizOHMzdeMCl3S9BVOcf4Ntnjda
	DR4XbB9+KBv0X3oAgDtV03WrR0DQXbei4EpuTmsxDClxLXQOwjXpub7xgXEYousEwjrBtr4kXa5rZ
	9f+DlQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Ha-0000000Gds6-2A0v;
	Mon, 17 Nov 2025 18:48:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HP-0000000Gdc4-0GsK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HZRHy3svuNchmJFYToVRnx2mDpnN1m/iPQ4+pK/3fxU=; b=mB9cmAhuurM+LuocP8rEws7Vi2
	iaHwttTmYsYWcde75cnYI/YCBp6fi1ovNJ0NCAMNsEdNgNZ0uYYsZQL7xzeNEtcAPSOT6CLGzlzRG
	zNEZhkZx94CPS9/XtxnXGvgSdLOS7ERHzBpbmHn83GHeHzGJm0TAIKdMXcXKJSpzQYbGgHCjkVn5m
	J1TongZ3h01pNBmpqKRcIb164EDkPiAgWrfkLoH1BtGsDK4pQLEaKXeAGP0SyVgQX5Oa7HZi0jPKo
	2plHKJfTAVxSv+zBDg41bIvG+gNuOUvV/+DgBtCpLyOWP/XsLX7lwqVg7rZucHNuUowC4IRzdPrt7
	qdaC6FAg==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pi-00000007wcM-2SH0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:20 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2b642287so2698891f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405322; x=1764010122; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZRHy3svuNchmJFYToVRnx2mDpnN1m/iPQ4+pK/3fxU=;
        b=QbsQJHo+iZjpQBktqaepQstrBcDUbBaVyrq+54v7eRbIEfjgLOWbQ/aMmve/BykQWb
         izAliz2uLmXuXHXIqJKmEZXNi3B2rbG/D7nsa+06VUJXLNu9tyw95pVoBOYZYCA7TeYA
         Co2qntCLyK1HLpoIMZju8M2JX36Xu5fwXPWVTpmSPL1I0j9gjD2W0tgkXoCfnIUFOZWR
         w+C8wluPbcNZrO8G4ubJmG50sZjz2hk39m687li7Ly9hDwdo+e5vQz5Sf+O81YZwixgy
         YZPxtchp5C8GOY1m7TBQYHJFBBmZQFQWHJY4+Z/mThu2RV3ZmM4pHGSo7CSA9U18tRa/
         h/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405322; x=1764010122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZRHy3svuNchmJFYToVRnx2mDpnN1m/iPQ4+pK/3fxU=;
        b=Qf+Tga5Xcu8RsDUOXO37SGQBlw0lr+eYw4BhFF2awH4fbRG/O5bYzOEhcx8W8zihsx
         2dyjt8fMlZSvFtCW7LzIEV3wE6w9ZOMMr3PqKiMUgZ20YtVyOe7bdeIqaCYeGlIuJUX/
         e6cNSFa2YuGgIo0mWWewZAM2vtjpkXL0Nf+my1y3xb2B+8cWJxB6E7uKe61UNY3Z2+r4
         6Rz0jJW+uefwCjDM/MRJ8zuh6Re8WkTBoDyxHA7sgcbbQVDvL82v/CSOzDMYQuZUYIO5
         Z9AsCcPt3+UMLGkOkdOLOS8Lv0UoL4G7XU2Z1d0g9IduXptvhnw7MoVaK1KrFHtUklbZ
         Grzg==
X-Gm-Message-State: AOJu0YxpKXWl6R9muyhTRRzey2WBWgKmwYn+/EwTiTwKpmg0UXu3D8LB
	8Ppgo4PIxicZ8DKzTdzeREtT05gBovDtmAhN41j0SsL9ZPyuIJl+UmmyuerIlln8uPAxz8nkv0h
	BlEp7T18HnJfCdL9YLcQegOZJckwrLRhLhq0Qe9moFoAHa3e5/BUxzKxShvtJIHJ+NY1aMuG1rl
	d15hJ4a/QHWmzH6VaOymErWBJm1jPE3nkdgdWjcoiYkXSZydgM5qLIZgSESw5yM1BO6g==
X-Google-Smtp-Source: AGHT+IEzcJDMw53+AVSQNytxPGimAg5Et4Wx8256qZ8eJwNoP5G/5wvwA6REx65+VnhZk9Fj+izitvg/zOxMdw==
X-Received: from wrpz8.prod.google.com ([2002:adf:f748:0:b0:42b:32f2:9092])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2509:b0:3fb:aca3:d5d9 with SMTP id ffacd0b85a97d-42b5933916bmr12787870f8f.1.1763405321905;
 Mon, 17 Nov 2025 10:48:41 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:03 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-17-smostafa@google.com>
Subject: [PATCH v5 16/27] iommu/arm-smmu-v3-kvm: Take over SMMUs
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175318_885825_0374EC9A 
X-CRM114-Status: GOOD (  17.13  )
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

Donate the array with SMMU description to the hypervisor as it
can't be changed by the host after de-privileges.

Also, donate the SMMU resources to the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 81 ++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index fa8b71152560..b56feae81dda 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -7,15 +7,94 @@
 #include <asm/kvm_hyp.h>
 
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/* Transfer ownership of memory */
+static int smmu_take_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	return __pkvm_host_donate_hyp(phys >> PAGE_SHIFT, size >> PAGE_SHIFT);
+}
+
+static void smmu_reclaim_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
+}
+
+/* Put the device in a state that can be probed by the host driver. */
+static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		WARN_ON(__pkvm_hyp_donate_host_mmio(pfn));
+	}
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		/*
+		 * This should never happen, so it's fine to be strict to avoid
+		 * complicated error handling.
+		 */
+		WARN_ON(__pkvm_host_donate_hyp_mmio(pfn));
+	}
+	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
+
+	return 0;
+}
+
 static int smmu_init(void)
 {
-	return -ENOSYS;
+	int ret;
+	struct hyp_arm_smmu_v3_device *smmu;
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+	ret = smmu_take_pages(hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus),
+			      smmu_arr_size);
+	if (ret)
+		return ret;
+
+	for_each_smmu(smmu) {
+		ret = smmu_init_device(smmu);
+		if (ret)
+			goto out_reclaim_smmu;
+	}
+
+	return 0;
+
+out_reclaim_smmu:
+	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
+		smmu_deinit_device(--smmu);
+	smmu_reclaim_pages(hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus),
+			   smmu_arr_size);
+	return ret;
 }
 
 static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
-- 
2.52.0.rc1.455.g30608eb744-goog


