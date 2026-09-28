Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A9CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVt9PTQ3gJ/ArVKfT3hU8hseiFwEBqxTroAJlxW9cEQ=; b=Ci23sZRYAJs3PKquZXSo8Qjm9R
	LBFwHR69iIrxq8ClhviKAbcbX456WPpd0IiSrHkUSBfweXHSCcDssUzBFJpjEuJKGnRWFBTNk1kr/
	k0eEFe3iH3S049kL+9/JHX1/LRLpoqpVOwNWTwyBxdVPb4uyD8l4Q+nTNbr00snLDUZvB4tl96lqK
	gEfR8TXcUaJs701pIO9SHhZvZ2+p3tVeBTAwwamT/KvD2XuvcURySCp0l8n/cnTQFEjyLt9iUDR/m
	vs7GNkNx+wiJ663h/GA7iZpsUKqv9yunJfthTG4+9K04rV+OsptfemGaUEfK0bs7ys2ICYknEzWKp
	DP69cjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84j-00000000HpI-2oj0;
	Mon, 28 Sep 2026 09:55:09 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84h-00000000HoL-1NGl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:55:09 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49ffe287240so12287225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790589305; x=1791194105; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVt9PTQ3gJ/ArVKfT3hU8hseiFwEBqxTroAJlxW9cEQ=;
        b=U9J9A7Tn1qpqcp5oX73fZctC6eRleQeLFN/izT+JD3CpheSN4YekntwpOWxEcliM7V
         dr01nKR0dwwbFv8cXXMc8fl6+iUpc1v8SQ/+tYhJdpezM03KlAw9rGDi0A81rbutRmpP
         /SqC1AaTDwPLbdFB5W+mNULr2anYuLln/1h0AmkgvxFwK77BIeBD4a/RQDhdUTMUhLYB
         5eG9G6pFHREUWpUSyeX6NxPsFhh9Gpv1cz0cIUNzFudYe3ZOEY3vLb7foYH06ZAyGF/4
         JOkYjb3uYE6hay4Tof/hXPIEiLzmFD6CaIYowjWuDn1ADSLIfaw2KvtRwZWODAX+UdJ/
         2IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589305; x=1791194105;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVt9PTQ3gJ/ArVKfT3hU8hseiFwEBqxTroAJlxW9cEQ=;
        b=pQwflwLblw/eUehxKrx5O1j9echvdjq97iNScdcEWP0OjNWK0KmoDO7x0zmWzC8+1B
         3T8Dp+ZMrpD0ztZW+U4RiXC13PDrsxy3NvrlHx7a4WaBGPyyZF2D+JU0KuQoiZVkRYUU
         ygyMyFOKJcho0eEKhVnZXCIXqt459JM8HQL+6lUMzr7SpcHMDJW9IA0RUrtwnCdzg3vF
         L53X4l2+3K/SrdZVeHLJYhaNPTF1rB2bLrQWppGvKcMBMjYsHjVIDrR9IlmhlFVJEg4B
         /33ZMDEWx0YCC13FopA2vQ24hzD8PAr5/Q/r6pma1V6J6hSWgSWYuohgg8dBp8NBrzdy
         kNNw==
X-Forwarded-Encrypted: i=1; AKwUvBxpoGRTiz+ATg6K83Xdn+cvoB+iD+RMKaCCx+AKokCET5d+mJX5eyMVIrFdflfQJvDfVoEkzTapxdxd62TJM01X@lists.infradead.org
X-Gm-Message-State: AFuF++kdfiTL0jWiQO5fXTeHvUZC79gm6BfEkmpott2cO6T4a8QHPchV
	wJMs4ptGUY2visT0zCXHNnhhQpmRLSug8uxdbZzU/fNrIL4mTrh+lHMEg2ZoxftIl9fjiF9Rz6E
	PYdLqR9uUPjQYT48ke7FNBA==
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:49f:e401:6ca4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc2:b0:49e:7d69:83b7 with SMTP id 5b1f17b1804b1-49fe66d397fmr217648495e9.13.1790589304426;
 Mon, 28 Sep 2026 02:55:04 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:49 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928095454.3255918-1-vdonnefort@google.com>
Subject: [PATCH v2 0/4] Fix guest_memfd and protected VMs on systems with
 pages larger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_025507_400795_38D54D0E 
X-CRM114-Status: UNSURE (   8.34  )
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

This series allows booting protected VMs and guest_memfd-back VMs on
systems with a page size larger than 4K.

Currently, the fault handling assumes 4K alignment, as HPFAR_EL2
provides the IPA minus the bottom 12 bits regardless of the system page
size. This leads to mapping failures on 16K and 64K systems.

This series addresses the alignment mismatch by relying on struct
kvm_s2_fault_vma_info in both gmem_abort() and pkvm_mem_abort() to
retrieve correctly page-aligned addresses.

This series bundles the following previously discussed fixes:

 1. https://lore.kernel.org/all/20260915091606.2111217-1-vdonnefort@google.com
 2. https://lore.kernel.org/all/20260915084438.2076072-1-vdonnefort@google.com

v2:
  - Use forward declarations (Marc)
  - gmem_abort(): rename local gfn to canonical_gfn (Wei-Lin)
  - Pick up Reviewed-by and Tested-by tags
  - Rebase on v7.3-rc5

v1: https://lore.kernel.org/all/20260922130821.1666713-1-vdonnefort@google.com/

Fuad Tabba (1):
  KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()

Vincent Donnefort (3):
  KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
  KVM: arm64: Pass kvm_s2_fault_desc to
    fault_supports_stage2_huge_mapping()
  KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()

 arch/arm64/kvm/hyp/nvhe/sys_regs.c |   3 +
 arch/arm64/kvm/mmu.c               | 129 +++++++++++++++--------------
 arch/arm64/kvm/pkvm.c              |   3 +
 3 files changed, 75 insertions(+), 60 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


