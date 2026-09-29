Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA35CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJhHtmUvdHeMl3GtN9aiMpBsR59DKcSwYH6wVoNTX8g=; b=0tacKwiNoTGdyd3XYBCWN8DrTy
	jGLxB/IgwV/IAxL6ROMjuKS6F/NCb7K2at1oy7qaj5/r1ZVfYAIb3Yc6vga1dwMcLR/1o/zybg4L9
	+4aZ3GcGnDlELNaTPPX/2OZz8vT64PXjjeJ6CeAwHwDwrsE8UhHL6ucbi9RsAXAhkaKlwBWipUiIB
	H1YJ8IoPluUzKWK758pXhBKiX4y6ztuwQ1zTcir9cs6GO9v1k73xrTbDDcIWBHRfCTvqzJIOXemzt
	Ua/E7jIGyp/lon04LnEvnK48fupTZEzLtvfVDg7L9ClTk0CoClbF8zkqRuI0paXyQJu3HI2cn+O5F
	Eb5VTGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBThl-00000002uUH-1aOd;
	Tue, 29 Sep 2026 09:00:53 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBThi-00000002uSk-2GqE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:00:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XqxrlL1PeFm7f3HhyjzmfZu6nSsKkuNbuQg38YPJ+sg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790672448; v=1; x=1791277248;
 b=UCZ99ZRE1Dd01mQ0F15jvI/83DSZfp+Zg1ziXPxGwaCWelXbDAGgvPorfaxTUzZaY+KIkr03
 10osAHMvYbdrLqkT4YvUR88KzREIjjW7acxW/qU3psh9XMBPEu3EYoy2/2iZJdnAQVfDDZHbyzp
 LqIMjTnyO+fFpMYxx8qcdM48=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b89483134b4c43d3;
	Tue, 29 Sep 2026 09:00:36 +0000
X-Mizu-Trace-ID: b89483134b4c43d3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] KVM: arm64: Fix HCR_EL2 for non-protected VMs in pKVM
Date: Tue, 29 Sep 2026 10:00:27 +0100
Message-Id: <20260929090031.3829185-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020050_818024_C037F093 
X-CRM114-Status: GOOD (  13.51  )
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

Changes since v2 [1]:
- Patch 1: apply the FGUs on a CPU without FEAT_FGT instead of moving
  the check in handle_tlbi_el1() (Oliver [2]). Wei-Lin's Reviewed-by
  dropped with the rewrite.

In pKVM, EL2 sets a non-protected VM's HCR_EL2 in pkvm_vcpu_reset_hcr(),
which misses the RW, TID5 and TTLBOS handling of vcpu_set_hcr(), and
takes only TWI, TWE and VSE from the host. As a result, an AArch32 VM
can't run, a VM can read GMID_EL1 or execute a TLBI OS its ID registers
hide, and the host's TVM, VI and VF never reach it.

The second patch clears RW for an AArch32 vCPU. The third also takes
from the host, for a non-protected VM, the bits the host varies with the
VM's configuration or at runtime: VI, VF, TVM, TID2, TID4, TID5 and
TTLBOS. The rest stay EL2's, and a protected VM still takes only TWI,
TWE and VSE.

The third patch depends on the first: once TTLBOS reaches the VM, a
trapped TLBI OS from a non-nested guest on a CPU without FEAT_FGT hits
a WARN in handle_tlbi_el1(), as it does without pKVM. The first makes
the FGUs apply on such a CPU too, so the access is UNDEFINED before it
reaches handle_tlbi_el1().

The last patch adds a selftest that checks a feature hidden in an ID
register is UNDEFINED in the guest. Its TLBI OS case fails in pKVM
before the third patch.

VSE still comes from the host as before. Syncing it back after delivery
is a separate fix [3].

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260928064643.3265087-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/arqeRSIoEwurSrya@kernel.org/
[3] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
  KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
  KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
  KVM: arm64: selftests: Check a feature hidden in an ID register is
    UNDEF

 arch/arm64/kvm/emulate-nested.c               |   3 -
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   9 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   7 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  25 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
 6 files changed, 214 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


