Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0511710F9972
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HmRWz/u6ADn48S6TayljG46hjii4LlrDfP5vjmIk5Cw=; b=TcxK7GTRb0JDJ8zC2Y8mFlxELg
	6wuw27Vsv6LHXtFbGR2laXofELsho/P2haWmWOTXQ20d0ZY5z/+mKHK6TFYYTOtLPKNf10LHTdzzD
	OidO4ODqw4uMqRPXZx5YHuy4C83KsNoOHE5+3d826oqXD3P1Ca6cMbvk8GbsI/7FkXvKG+sKBwEeo
	7pmpWNMQfPrX37LVT5lEElKtIfMpXd99zwTdG3jL0lPD6HkEoN65ZeWBki+7jbUK+9rrT/x8MB4z4
	duNfAe7YgXHEXno/0DpQ5SBAgDHIkEKxMe21AVuTtP4r1oWpeELEsnZm0XLRDG5N0WqNzbU3AoZDC
	d3xwLnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTQ-00000009Nss-10IM;
	Wed, 08 Apr 2026 20:26:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTO-00000009Nsg-3tR5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 20:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HmRWz/u6ADn48S6TayljG46hjii4LlrDfP5vjmIk5Cw=; b=Ttbw98F6v5eNunyR1xVasbT+Ad
	oyc1rBu3pzITbsyIbw937eUZBu6tMsZBUq+3rYCRRvvJtxJp1RvXrfqmVOorhHG+3DS4oIMflsTBn
	E8HaKNlWddK4iG8gX878bgjW8YimRXq4TBkV6EHDiyCW1L+7XygrMEb/muRLoTClNEraKy2GBytn0
	uf2128XnwIqNLTCiyhOG//wfRhlw+zwcHXGHXZuNpbrl/9kU7UwLGRQywzaLPlkB58AngMm7mQlrG
	mYRntpgkvvRfUyGNOv0f6oo2S4tbiNDGZ+w9U5TqRNz1eL7NHHeNAMt0URfVxFIrbSq/MrdTdsOTe
	ZMyzImzw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000005uIP-1PsD;
	Wed, 08 Apr 2026 20:25:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000008oxL-0MDJ;
	Wed, 08 Apr 2026 21:25:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 0/2] KVM: arm64: KVM: arm64: Add per-VM WFI/WFE exit disable capability
Date: Wed,  8 Apr 2026 21:23:46 +0100
Message-ID: <20260408202557.2102476-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

Add KVM_CAP_ARM_DISABLE_EXITS, modelled after the existing x86
KVM_CAP_X86_DISABLE_EXITS, to allow userspace to disable WFI and/or
WFE trapping on a per-VM basis.

KVM already has system-wide kernel command line parameters
(kvm-arm.wfi_trap_policy and kvm-arm.wfe_trap_policy, added in
0b5afe05377d) to control WFx trapping. However, these are global and
set at boot time. A per-VM capability allows the VMM to make the
decision per guest — for example, disabling WFI trapping for
latency-sensitive VMs with pinned vCPUs while keeping it enabled for
overcommitted guests on the same host.

When a flag is set via KVM_ENABLE_CAP, the corresponding trap is
unconditionally cleared, overriding the system-wide policy. When the
flag is not set, the system policy (including the default
single-task heuristic) applies as before.

As with the x86 equivalent, disabling exits is a one-way operation
per VM.

Tested on Graviton 3 (Neoverse-V1) metal.

David Woodhouse (2):
  KVM: arm64: Add KVM_CAP_ARM_DISABLE_EXITS for WFI/WFE passthrough
  KVM: arm64: selftests: Add KVM_CAP_ARM_DISABLE_EXITS UAPI test

 Documentation/virt/kvm/api.rst                    | 28 +++++++++++++
 arch/arm64/include/asm/kvm_host.h                 |  4 ++
 arch/arm64/kvm/arm.c                              | 20 ++++++++++
 include/uapi/linux/kvm.h                          |  6 +++
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/arm64/disable_exits.c | 48 +++++++++++++++++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/disable_exits.c


