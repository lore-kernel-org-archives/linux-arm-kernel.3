Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E5C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZMON/8JrSsYVC0INRiiKEtaC8b0ODjxhuyWjKTRvWA=; b=pdubi/VyM6aUmabUeC/w1ntur9
	Xbi+Q7zI7Y2LjYS9zfxF96zT8RfyJL3WIyE5wdVhncNIs+YAkyo8L/7/JkVzBbRkJpkXAZCphBlZr
	rhJp4Wofr6JIbDbWgDzpqTI8D7CERG1xldy01b+IxPvSVzIeY3MZydw63bAq+FZWjLTr4o62qz2jk
	k8WgwdN5W/DAnsv1abe+PI1k27P6YJmLhZYTRifn7JhmY4xQmQ2nfPI0iFNGoSgRFQoCIEoHiVuNR
	0VZMmjhnGkFcBHj7eUP0NUChek9HN5q3JTvV7krQvREYemlLeoE9hgVGzK0FyXvyPG6sl5XlTw+Ko
	0mhzw1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERZQ-00000009HQJ-200u;
	Mon, 12 May 2025 11:43:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERXM-00000009H60-0Ojo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:41:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B04B150C;
	Mon, 12 May 2025 04:41:19 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E57673F5A1;
	Mon, 12 May 2025 04:41:27 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [RFC PATCH v2 0/3] KVM: arm64: Don't claim MTE_ASYNC if not supported
Date: Mon, 12 May 2025 12:41:09 +0100
Message-ID: <20250512114112.359087-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_044136_171617_3F4B0CBF 
X-CRM114-Status: UNSURE (   8.80  )
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

The ID_AA64PFR1_EL1.MTE_frac field is currently hidden from KVM.
However, when ID_AA64PFR1_EL1.MTE==2, ID_AA64PFR1_EL1.MTE_frac==0
indicates that MTE_ASYNC is supported. On a host with
ID_AA64PFR1_EL1.MTE==2 but without MTE_ASYNC support a guest with the
MTE capability enabled will incorrectly see MTE_ASYNC advertised as
supported. This series fixes that.

This was found by inspection and the current behaviour is not known to
break anything. Linux doesn't check MTE_frac, and wrongly, assumes
MTE async faults can be generated whenever MTE is supported. This is
a separate problem and not addressed here.

I am looking for feedback on whether this change is valuable or
otherwise.

Changes since v1:
        Only pass MTE_Frac hw value to the guest when it is the exact failure case.
        Changed base commit to v6.15-rc5 but still applies on v6.16-rc2 as well.

Ben Horgan (3):
  arm64/sysreg: Expose MTE_frac so that it is visible to KVM
  KVM: arm64: Make MTE_frac masking conditional on MTE capability
  KVM: selftests: Confirm exposing MTE_frac does not break migration

 arch/arm64/kernel/cpufeature.c                |  1 +
 arch/arm64/kvm/sys_regs.c                     | 28 ++++++-
 .../testing/selftests/kvm/arm64/set_id_regs.c | 77 ++++++++++++++++++-
 3 files changed, 103 insertions(+), 3 deletions(-)


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.43.0


