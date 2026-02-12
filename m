Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D74EB48EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3lZ/FXSzIrKV2ZCN0nh7sjPuVDRySXe1YLtlGIVn0Sc=; b=P2gYmeGfA9tA0g7BM6TZhOiScS
	WL0N7MYtcq1Bzm6gJO7oXbybKPJ/cocy+ncfHucV+8vBlpzmM7OwsHSZUk0rn4RI9RbzpBTMcLQ+J
	9JwNICUhEaBbtN97IJhhnn75uN80BJdvY2FGtwMMgKZPKRrgl5/Cm33CYQoDw/TFAIVE4yQHde6Ma
	DYDx1Sb5jWZguYcS4Q7BYDB8QdX1oiHRsMp8Lcd2StpwOd1mg3eLz+zcHKqibC4zl09YPfOuVbo0N
	7nk6jqeS34mAaKHd0HCeVUGHxVq/UIE3E/M3AARjrBA0+UQdkknmw9GIKZlQjUOLX5XzS9CdVEgAj
	yIU3UpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbC-00000001nf8-2BY1;
	Thu, 12 Feb 2026 09:02:58 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbA-00000001ne3-1iYS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:02:57 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b873b0bfe9dso299872366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886973; x=1771491773; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lZ/FXSzIrKV2ZCN0nh7sjPuVDRySXe1YLtlGIVn0Sc=;
        b=pCioiuCj3E7s8n9KwYBEJgXxYF3pbY5o8hffcUVtzYV9Sah+RfHvViw0CSPHUmDWHF
         AO1O3v0UxyJP4BV10cg0gYsFJBo1iqXXi6vYX6yz6/L/uAjatVtObE+NZ57JR6YphrZH
         ya8nz8MiFl4vVNHTcHoN82ItlmcwzKJLbayuq3AOjT68QouQPyoHsTpsQMRilNdNKR2U
         WvPQvawgax9pj4HU6puo8HDVxzkLrzJ4U2xKHNoNLhPUlcreB0j1o8QiMlngnT8F2F97
         0Q/UyumqNFvAeZCmOomo7x7Vfmh52JNo5cpFNRBmZkhIri+vo9BJMd+xred84qrqqRRQ
         J26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886973; x=1771491773;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lZ/FXSzIrKV2ZCN0nh7sjPuVDRySXe1YLtlGIVn0Sc=;
        b=lP0mwMwdeP7qQMVAE0AwpGrIerXt3699JQb0YXShn3I0dab18iMxJMC2F8DiQif3Ai
         0NoAWl327ank06auuXkeSH13TKZ78gtyLBMTsIeFl6VQZqYsLse81IQQPYpBjjoYkfeg
         Xzb64uTPqO/7iz+/0XYUl1y55xf7WGbu38ZgVc0+GI/BytSQ7tqwfShGUdxkOwP0mzJ3
         j8pbC6JZoHjY64WnmMww6OuzXwR+ELKL1EZuYEy5cJ5YlxnA2cSIP/u/TjAjMThS1lGG
         +/wFzfXeHoJFOfDviS3bewP7JRTONmSwwL+mKr5joNJL4s2EaVTynSedfws9Qujea41n
         corA==
X-Forwarded-Encrypted: i=1; AJvYcCXGs+DcDIt2N6bPsVnzG/EtSo5wmipoqSBvoClgn7H4+zY333uYjcICnm5zWnyQLENaBuYWRs8KRPKRJBDen8SY@lists.infradead.org
X-Gm-Message-State: AOJu0YxasI1e6Ghq+TO3t5U6jb8a1tlfLjWVjYT1z+XecP+xwjUSZKCL
	ByVbGX1RrTuzi2U9JqWAZUNZnyUPVDU1tJabl9mECXaDZ2/jcbmJCNGejeo/Bn+SkXztGc50zep
	MZA==
X-Received: from ejdr2.prod.google.com ([2002:a17:906:38c2:b0:b8f:9c02:805c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:fe44:b0:b87:322d:a8bc
 with SMTP id a640c23a62f3a-b8f92be341cmr98528366b.31.1770886973514; Thu, 12
 Feb 2026 01:02:53 -0800 (PST)
Date: Thu, 12 Feb 2026 09:02:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212090252.158689-1-tabba@google.com>
Subject: [PATCH v1 0/3] KVM: arm64: Fix guest feature sanitization and pKVM
 state synchronization
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010256_450157_741CF543 
X-CRM114-Status: GOOD (  10.56  )
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

This series addresses state management and feature synchronization
vulnerabilities in both standard KVM and pKVM implementations on arm64.
The primary focus is ensuring that the hypervisor correctly handles
architectural extensions during context switches to prevent state
corruption.

The series is structured as follows:

* Patch 1: Addresses an issue in KVM/arm64 in general where FEAT_S1POE
  is exposed to guests based solely on hardware capability. If the host
  kernel is built without CONFIG_ARM64_POE, it will not context-switch
  POR_EL1. Masking the S1POE bit in ID_AA64MMFR3_EL1 when
  system_supports_poe() is false prevents state corruption.

* Patch 2: Fixes a bug in pKVM non-protected guest initialization.
  Previously, pkvm_init_features_from_host() copied the initialized flag
  without copying the actual id_regs array. This caused EL2 feature
  checks (such as ctxt_has_tcrx()) to silently fail, breaking the
  save/restore logic for system registers like TCR2_EL1, PIR_EL1, and
  POR_EL1 during world switches. The fix initializes the ID registers.

* Patch 3: Removes a redundant kern_hyp_va() macro invocation in
  unpin_host_sve_state(). The sve_state pointer is already initialized
  as a hypervisor virtual address. While idempotent, the macro is
  unnecessary here.

Based on Linux 6.19.

Cheers,
/fuad

Cc: stable@vger.kernel.org

Fuad Tabba (3):
  KVM: arm64: Hide S1POE from guests when not supported by the host
  KVM: arm64: Fix ID register initialization for non-protected pKVM
    guests
  KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()

 arch/arm64/include/asm/kvm_host.h |  3 ++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 39 ++++++++++++++++++++++++++++---
 arch/arm64/kvm/sys_regs.c         |  3 +++
 3 files changed, 41 insertions(+), 4 deletions(-)


base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
-- 
2.53.0.239.g8d8fc8a987-goog


