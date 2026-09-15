Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54851C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SuE1WyxOK40ZmtZptZeB4jvDAIB375JkCDhI+pPgijw=; b=Zp42/ZpJ4X9/F0ceMOwYR15/Jj
	qNE4wfp8mpfFwNST9pSfMmUSA83J0MFhAzF29JxpmuFvsMYwl4AI7k75x5CRF9iJ/F7vezDiQaE+f
	B4ugJ3Ht8hjzP39bxeU/7f4/8LWAeBfpoqVM2i7pk8qTwF5Zh6jygFdhv5yt9whcLPORNjjKHFIis
	69xnqeIdYCSfeD9VujLAuLBQ/r3FSfNuwQ1WcA8pm9upT34y+9sgGey5e5CMfxB78yN11CsoYl3E3
	LdqGTaYzUMmsaMWJ/bYc6xBMymKCaqMm9GEzmS3dQJ6JILeetjH7HJcCmcojHTiB+7aJ2GAwC2oKU
	uILNpMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OmW-00000005fvx-0Nly;
	Tue, 15 Sep 2026 08:44:48 +0000
Received: from out-59.mta0.migadu.com ([2001:41d0:1004:224b::3b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OmT-00000005fvX-0K1A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:44:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5VNjXBdl2JBF32g6/pFWNc4t2873DtQP3kDUrQxNzQc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461882; v=1; x=1790066682;
 b=diFC/f5lFbLNJYpoWifyzgIGcvjI9vZzJNepeCiqnWVLfh+Cn90Du9CxuGt+eXqsZzKfGZWa
 jypgTva2rJCEb3uFvn0yAusc/U8liDil5UwFczBDjxUKl9tMl+19rRlUs0ikchveX2g5lLcale0
 Xu8dY1wItei6OGfaHDyrwCA8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c21aa090cc761614;
	Tue, 15 Sep 2026 08:44:42 +0000
X-Mizu-Trace-ID: c21aa090cc761614
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] KVM: Replace VCPU_RUN with KVM_RUN in comments and docs
Date: Tue, 15 Sep 2026 09:44:38 +0100
Message-Id: <20260915084441.3846947-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_014445_261646_D5ED83B5 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi folks,

This one has been bugging me for a while. Five comments and doc lines
name a VCPU_RUN ioctl (KVM_VCPU_RUN in book3s_hv.c, VCPU RUN in
kvm_host.h). The ioctl that enters the guest is KVM_RUN.

The patches are independent and split by tree, one each for generic
KVM, KVM/arm64 and Book3S HV, so each can go through its own
maintainer. Nothing else in the tree refers to the ioctl by a wrong
name.

Based on Linux 7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

Fuad Tabba (3):
  KVM: Fix comments that refer to the non-existent VCPU_RUN ioctl
  KVM: arm64: Fix references to the non-existent VCPU_RUN ioctl
  KVM: PPC: Book3S HV: Fix comment naming a non-existent KVM_VCPU_RUN
    ioctl

 Documentation/virt/kvm/arm/pkvm.rst | 2 +-
 arch/arm64/kvm/arm.c                | 2 +-
 arch/powerpc/kvm/book3s_hv.c        | 2 +-
 include/linux/kvm_host.h            | 2 +-
 virt/kvm/kvm_main.c                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


