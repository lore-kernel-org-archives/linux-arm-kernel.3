Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1491075269
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LttRbXCmlhLh8bDPwwzdWlCwXNRrjR0ED0HFaDEdhMM=; b=SS3TK+i7wuZePYK27P19lND4w3
	p+PIh55vkz+F4rQ9HQtjyeD9uZnpRcP7wGqRiUYiDb3v1VC/i3ynTyYp84uP49/EU0Zd2Tm9/941e
	UnZr4YUMWAeZzSBAmR9dQbz5kWzo7kOXQF5W+7bZQlFBNo6oHagYJ3a0pRw5uLoKPw1+Hg9Krzso/
	VTYa5dNbFWfOnAqOBPzlHKx4dDQzVkL6ZZMtl+UvmbWu3FonINxriENiNIK+lphYu4DZtOpiRccU/
	ORdr2Qo9Uvvagkta/Uzxb8Cxe1Bnfvm65gnu/OteE/cjDRQvICZPh622FaxLYSp/Kdk1J8rCOJgRR
	sxVlY0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CFf-00000002Pcq-2DcM;
	Wed, 25 Mar 2026 00:37:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CFc-00000002PcO-3aEb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:37:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F5C516F2;
	Tue, 24 Mar 2026 17:37:27 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130513FB90;
	Tue, 24 Mar 2026 17:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774399053; bh=Epyy7iecwoAn93JWXH+OSMxoxwAIEDRTjD5ZKKL3pZw=;
	h=From:To:Cc:Subject:Date:From;
	b=MnR3rorXkjxXLLNMQEvTUR+UbtwJDSGr3bzysj4xgUSLtTg7nEdk0wr7TiTqIHXe7
	 nczxlFPNVf7GrasIcAdzyGlaMf5PpGc1+5Vf0yTZe8PgA9TiJKtM83zQFnX0o0ZWgF
	 9CE6bxws/dv2PFOPeAnZzEWz6vAdHbu2gY1KFPuc=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/3] KVM: arm64: selftests: Basic nested guest support
Date: Wed, 25 Mar 2026 00:36:17 +0000
Message-ID: <20260325003620.2214766-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_173737_036972_9477D859 
X-CRM114-Status: GOOD (  12.90  )
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

Hi,

This series adds basic support for running nested guests (L2) in
kselftest. The first patch adds library functions. While designing the
APIs for userspace, I referenced Joey's approach for kvm-unit-tests [1].
In summary, four preparatory functions are provided for userspace to
set up state to run an L2 in EL1:

 - prepare_l2_stack()            <- sets up stack for L2
 - prepare_hyp_state()           <- sets up vEL2 registers
 - prepare_eret_destination()    <- userspace passes a function pointer
                                    for L2 to run
 - prepare_nested_sync_handler() <- sets up hvc handler in order to
                                    regain control after L2's hvc

After calling those functions, userspace can vcpu_run(), and when
run_l2() is called within the guest, the supplied function will be run
in L2, with the control flow managed by the library code in nested.c and
nested_asm.S. After running the L2 function, run_l2() will automatically
return. Note that the L2 function supplied by the user does not have to
call hvc.

Patch 2 demonstrates usage of the APIs introduced above, with a simple
L1 -> L2 -> L1 sequence, with an empty L2 function.

Patch 3 enhances the library functions by setting up L2 -> L1 stage-2
translation. Currently the translation is simple, with start level 0, 4
levels, 4KB granules, normal cachable, 48-bit IA, 40-bit OA.

[1]: https://lore.kernel.org/kvmarm/20260306142656.2775185-1-joey.gouly@arm.com/

Wei-Lin Chang (3):
  KVM: arm64: selftests: Add library functions for NV
  KVM: arm64: sefltests: Add basic NV selftest
  KVM: arm64: selftests: Enable stage-2 in NV preparation functions

 tools/testing/selftests/kvm/Makefile.kvm      |   3 +
 .../selftests/kvm/arm64/hello_nested.c        |  65 ++++++++
 .../selftests/kvm/include/arm64/nested.h      |  25 +++
 .../selftests/kvm/include/arm64/processor.h   |   9 +
 .../testing/selftests/kvm/lib/arm64/nested.c  | 154 ++++++++++++++++++
 .../selftests/kvm/lib/arm64/nested_asm.S      |  35 ++++
 6 files changed, 291 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/nested.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested.c
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested_asm.S

-- 
2.43.0


