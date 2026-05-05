Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D11FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPmBeuRUnjxLTbWzzJqJjIKPN3IgdEzZH3lJ0YLb1Ug=; b=VLYqHiT1q05TExQVxBMG5OPda9
	AAMNavuthDIbxeTsVNzMpMuVwUN5QmxnR/zjWA51v1CHBqCxJf+OaR/+uZDQ/iCQocyOl26gfUA4R
	Yjmd90rh69T4z4d+jQP2XcZYRvszSTfrsi1K/skmnPUpcWSRAGtQrZPhRXEHoz+dd4CNnUhWf6VX3
	aqxU2UXfkIv7LcdE+ml5kQiR6+S02kP7Cs4kIfYIXDIIQZ2nvptKw8EdXQ5MLFuysvRbrNb2hA8X5
	DyqU+8EHVgyGyUdzwEhkE/c0cKHyEspUosIsHan9XyP5ItscOqQ/p7cxLNoXIrFeDMyC9/m1xQseg
	B5jgmYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCTr-0000000Fj9I-3RD8;
	Tue, 05 May 2026 09:54:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCTp-0000000Fj7P-2kRo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:54:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84CCD2936;
	Tue,  5 May 2026 02:54:09 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8439C3F836;
	Tue,  5 May 2026 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777974854; bh=mZATz5adCxjq+rKLQMa6TL0ztfFjDih5jW0Ffnpg7tA=;
	h=From:To:Cc:Subject:Date:From;
	b=OroYeXVbEYXngvWHaW/fKZK/iVp506G7ITZsUT5skzUb/lyh16bF4bNuXqK2hsAk4
	 KHLBmCmRAo8EyvVyzaTbJ96xJ8EXSV+onS6Gun44JBV9cfTfanJdk/xIyQ/g9mRhv3
	 0U5EXk7QZoh+tZoy9yfqywFgFvYyeXEhIxggEoJ0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: jarkko@kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 0/3] initalise ff-a after finalising pKVM
Date: Tue,  5 May 2026 10:54:06 +0100
Message-Id: <20260505095409.1948371-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_025417_808346_3A6D1FF3 
X-CRM114-Status: GOOD (  15.06  )
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

This patch is split out from the patchset [0] --
fix FF-A call failure with pKVM when the FF-A driver is built-in,
specifically the IMA-related part.

When pKVM is enabled, the FF-A driver must be initialised after pKVM.
Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
buffer information, leading to failures in FF-A calls.

Currently, pKVM initialisation completes at device_initcall_sync,
while ffa_init() runs at the device_initcall level.

So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
still be trapped even before finalise_pkvm() is invoked.
As a result, this issue has not been observed.

However, relying on above stuff is fragile.
Therefore, when pKVM is enabled, the FF-A infrastructure should be
initialised only after pKVM initialisation has been fully finalised.

To achieve this, introduce an ffa_root_dev ("arm-ffa") and
a corresponding driver to defer initialisation of the FF-A infrastructure
until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
when pKVM is enabled.

This patch is based on v7.1-rc2

Question:

FF-A initialisation can occur at late_initcall. Because it may be deferred,
some FF-A requests cannot be serviced at that stage.
A typical example is the EFI runtime variable service using DIRECT_MSG_REQ.

Depending on the platform, the EFI runtime variable service runs with StandaloneMm
and uses FF-A DIRECT_REQ. However, when pKVM is enabled, FF-A initialisation
may be deferred to late_initcall. In this case, load_uefi_certs()
can fail if it is invoked before the FF-A driver is initialised
via deferred_probe_initcall().

Moving load_uefi_certs() to late_initcall_sync, as in the third patch,
seems not to have any problem since late_initcall and
late_initcall_sync are both of do_basic_setup() and it's before loading
init process. However, it is still unclear whether
it would be better to allow DIRECT_MSG_REQ in kvm_host_ffa_handler()
even before FF-A version negotiation since handler’s purpose seems to hook
certain memory operations, and DIRECT_MSG_REQ has been available
since FF-A specification v1.0.

Any feedback or alternative suggestions would be appreciated!

Link: https://lore.kernel.org/all/20260422162449.1814615-1-yeoreum.yun@arm.com/ [0]

Yeoreum Yun (3):
  arm64: KVM: defer kvm_init() to finalise_pkvm() when pKVM is enabled
  firmware: arm_ffa: initialise ff-a after finalising pKVM
    initialisation
  security: integrity: call load_uefi_certs() at late_initcall_sync

 arch/arm64/kvm/arm.c                          |   8 +-
 arch/arm64/kvm/pkvm.c                         |  15 ++-
 drivers/firmware/arm_ffa/bus.c                | 125 +++++++++++++++++-
 drivers/firmware/arm_ffa/common.h             |  13 +-
 drivers/firmware/arm_ffa/driver.c             |  21 ++-
 drivers/firmware/arm_ffa/smccc.c              |   2 +-
 security/integrity/platform_certs/load_uefi.c |   2 +-
 7 files changed, 166 insertions(+), 20 deletions(-)


base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


