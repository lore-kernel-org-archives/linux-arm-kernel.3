Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01695C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLZBnz7s8qPCu2ZXVkoDoTMlAHVCPVwymCGLB7JjfXA=; b=YLlZyeWPuxNt23wTk9eX2gHgtl
	x3EVg0jRbTSaK0kCX/CwPOcc6wR1iQAK6LTNb2FzdTz5CLZMRh3qhF/B9s2wwewdmizs/499xVkt6
	Jl13fYs1FCgy8diRDB3ojb6weQcPDA6uTA7dGSxYhTKtxstTkg+lVbO15EI3i0WYiLJy+1fz/Evor
	ixOIGCDa+utb2B8DCUivBWxvg3nWYe+VAM0mBb7RCP1d3DfS7ja2itKyKjFxNYbnZmUIaG+sJlBPq
	SXiC072vNgZMP/rxyX64bEqTq2ZV6WN69411L1+BO00iPWlw+pctTbdZtlQC+/hVDY4mpRJshLfmd
	fSBxXWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NDP-00000005Pkw-2bsk;
	Tue, 15 Sep 2026 07:04:27 +0000
Received: from out-13.mta0.migadu.com ([2001:41d0:1004:224b::d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NDM-00000005Pjh-2wRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:04:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1dBVgqiX9CYqykZIpW6hii98L+GZiNAYn8/L36aDd8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789455861; v=1; x=1790060661;
 b=lE5u71m4qBpqsm7gKiCJGpT7ewzRfTZ/ym3fsjDEM0Se3gqXjC24eAmgsbCEpYuV1sqC8/nd
 1EyTUB9Iw9jx3m82eqsv79UIwQsVYnmvOEs7Q7LjVgGPkr76fJwr1/D3PYbWHo11g6MBkCsp+N4
 LR8YlUXm4vDYr5/5lNgL1ZsM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 22be79310fb6ffaa;
	Tue, 15 Sep 2026 07:04:21 +0000
X-Mizu-Trace-ID: 22be79310fb6ffaa
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v2 0/2] KVM: arm64: Validate host pointers in __kvm_adjust_pc() under pKVM
Date: Tue, 15 Sep 2026 08:04:16 +0100
Message-Id: <20260915070418.3209779-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_000424_882576_9DEE6EC4 
X-CRM114-Status: UNSURE (   9.99  )
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

Changes since v1 [1]:
  - New patch 1: enter_exception64() reads the VM's MTE flag through a
    host-writable vcpu->kvm that nothing validates. It goes first,
    since pinning the vCPU alone leaves that read on an unmapped VM.
    (sashiko)
  - Dropped the VM pin the fix carried in v1, patch 1 validating that
    read at its site.

Two host pointers reach EL2 unvalidated on the __kvm_adjust_pc() path
under pKVM, and this series fixes both. The host vCPU isn't mapped at
EL2 until its first KVM_RUN pins it, and KVM_SET_VCPU_EVENTS with
ext_dabt_pending reaches the hypercall before that. The vcpu->kvm the
exception entry reads the MTE flag from is host-writable, and nothing
checks it. Either one panics the hypervisor, and on MTE-capable
hardware the flag read leaks one bit of hyp memory the host chose,
through PSR_TCO.

These are patches 2 and 3 of the pKVM core series [2], which carries
them so that it applies as is. They're respun here so they can be
applied on their own.

Based on v7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914065136.3418404-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
  KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM

 arch/arm64/kvm/hyp/exception.c             |  5 ++-
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 18 ++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         | 19 ++++++++++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c             | 39 ++++++++++++++++++++++
 4 files changed, 79 insertions(+), 2 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


