Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84639F8DFFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dKdBXgrUGZ+KxSo8/NU9Tv3mDPs/XLGr/23Fxb2gTo=; b=SV37PceL+F86v+ZZPPeV5o7Q4v
	atv8JZjfViwortj17uX7LC2v04zOWtJrflrbeUXmcoAUxDplcyRDCRGw/Aop64zhUiLSKPjV/ra8/
	Yr0DDcD4kQo3nAIMYL0aoP0NXFbUbVkJvWoZCs4AFAAK40uIt3nBmQnoV6kcrIf9iQwLUIcFX5DuT
	VxhdQJWlV3DuRUhZqrovnWFrkWQbi49nBDHMUlY1WSaF1OZfNLokTzc4z9hCdi4sbnlRSMC+BmETW
	Z2PQea/RsKIrrPpVa+CRFdZ9Dk7xazmpiuN4cqNcELb6UByoIs0v3qgKwkckRC0zj+5PDhQXTxAG9
	7RzBy/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSG-00000004LNA-18Fk;
	Fri, 17 Apr 2026 17:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSD-00000004LMR-0Xx3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B381D70;
	Fri, 17 Apr 2026 10:57:59 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 673183F7D8;
	Fri, 17 Apr 2026 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776448684; bh=tsQy6qMxsa5wjMUuqspAU/D38Z+x2rhzlE1+ZI76oYs=;
	h=From:To:Cc:Subject:Date:From;
	b=sU2B9iWdqNy2qZpmdMvrPLtnrYEgCQBpmBdwpnWijSItJl8tytKgc0Jql+QiSx43R
	 zaEjGkUxmpc4kFClz0FjWLjiaBsf06MeWnkNvOGcDCypTryA+GZ5bx9w8Ys/Oexc8C
	 C3l5LnRs2B6aw1babPLRKbfONNLltApGHEBC5a5Q=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	sudeep.holla@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 0/4] fix FF-A call failed with pKVM when ff-a driver is built-in
Date: Fri, 17 Apr 2026 18:57:55 +0100
Message-Id: <20260417175759.3191279-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_105809_348351_6FE8DEEF 
X-CRM114-Status: UNSURE (   8.19  )
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

commit 0e0546eabcd6 ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall")
changed the initcall level of ffa_init() to rootfs_initcall to address
an issue where IMA could not properly recognize the TPM device
when FF-A driver is built as built-in.

However, this introduces another problem: pKVM fails to handle FF-A calls
because it cannot trap the FFA_VERSION call invoked by ffa_init().

To ensure the TPM device is recognized when present in the system,
it is preferable to invoke ima_init() at a later stage.
Deferred probing is resolved by deferred_probe_initcall(),
which runs at the late_initcall level.
Therefore, introduce an LSM initcall at late_initcall_sync and
move ima_init() to this level.

With this change, revert the initcall level of ffa_init() back to
device_initcall. Additionally, to handle the case where ffa_init() runs
before kvm_init(), check whether pKVM has been initialized during ffa_init().
If not, defer initialization to prevent failures of FF-A calls
due to the inability to trap FFA_VERSION and FFA_RXTX_MAP in pKVM.

This patch is based on v7.0

Yeoreum Yun (4):
  security: ima: move ima_init into late_initcall_sync
  tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in
  firmware: arm_ffa: revert ffa_init() initcall level to device_initcall
  firmware: arm_ffa: check pkvm initailised when initailise ffa driver

 arch/arm64/kvm/arm.c              |  1 +
 drivers/char/tpm/tpm_crb_ffa.c    | 18 +++---------------
 drivers/firmware/arm_ffa/driver.c | 14 +++++++++++++-
 include/linux/lsm_hooks.h         |  2 ++
 security/integrity/ima/ima_main.c |  2 +-
 security/lsm_init.c               | 13 +++++++++++--
 6 files changed, 31 insertions(+), 19 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


