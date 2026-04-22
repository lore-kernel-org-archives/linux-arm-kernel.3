Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF7FA1FD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hR3HrL8NzZZguqUHZ09OOR5/4irz5VOsQ0kfqEmJnZo=; b=scDPS15CAM53wV4Nbhu8FEZqWc
	rPp6rrX3yA8RCGTa01LkboVxBBXsVNXVLIhm3EVmnydI7XbgEmaNEroJbx7pgoaZFp83+BGUDqbH4
	74ldLmKcn/enrhRBxBCtWYHJxr88d7GzQE+fnKUJUfZc3CTWq7i9hwXpaNfBXIn7gszOLBD3jRUMR
	MJGco5YHDfgpa4phLLiHMsLYXwSDq2URIC6e3dPM5pwio9jBdublN0w1iF1qiP7DGvRPtdf4tDn3d
	2H+YH11ABZtm1Se+kQMZ06A5BfNNGJceV4V8NlGyZvOVu3bxggesctFhIlgG0j3zFgT3+iX2Mjp/X
	5Hel1c+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaNr-0000000AVRz-1G5S;
	Wed, 22 Apr 2026 16:25:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaNo-0000000AVQN-0GGx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:25:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAB471F37;
	Wed, 22 Apr 2026 09:24:50 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 185453F23F;
	Wed, 22 Apr 2026 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776875096; bh=YneOUU9ZJjo8b1CP73adb7MQ16w1JI8gyH1SCX8PE4o=;
	h=From:To:Cc:Subject:Date:From;
	b=ri+Pg4M4D91Zwrp8WAgDJA+A3Jg0pjYVdEYkkDMsBjf6Pv5z40ncNrw4236rjI1xq
	 /LiLmtWgBmErBMn/Z9beVAm2Y5e7v5TNwcfpS2vDfw+s2WDYcSXoTetd3wmS+xz3a/
	 uaOUpICPZ1PbbLOISYucqQsePojADxqiVhh9U0Sk=
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
	noodles@meta.com,
	sebastianene@google.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v2 0/4] fix FF-A call failed with pKVM when ff-a driver is built-in
Date: Wed, 22 Apr 2026 17:24:45 +0100
Message-Id: <20260422162449.1814615-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092500_216478_B6F75927 
X-CRM114-Status: GOOD (  11.00  )
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
it is preferable to invoke again ima_init() at a later stage.
Deferred probing is resolved by deferred_probe_initcall(),
which runs at the late_initcall level.
Therefore, introduce an LSM initcall at late_initcall_sync and
invode ima_init() again to this level in case of TPM is probed yet
at the late_initcall stage.

With this change, revert the initcall level of ffa_init() back to
device_initcall. Additionally, to handle the case where ffa_init() runs
before kvm_init(), check whether pKVM has been initialized during ffa_init().
If not, defer initialization to prevent failures of FF-A calls
due to the inability to trap FFA_VERSION and FFA_RXTX_MAP in pKVM.

This patch is based on v7.0

Patch History
=============
from v1 to v2:
  - add notifier to make ffa-driver pkvm initialised.
  - modify to try initailisation again when IMA coudln't find proper TPM device.
  - https://lore.kernel.org/all/20260417175759.3191279-1-yeoreum.yun@arm.com/#t

Yeoreum Yun (4):
  security: ima: call ima_init() again at late_initcall_sync for defered
    TPM
  tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in
  firmware: arm_ffa: revert ffa_init() initcall level to device_initcall
  firmware: arm_ffa: check pkvm initailised when initailise ffa driver

 arch/arm64/include/asm/virt.h       | 11 +++++
 arch/arm64/kvm/arm.c                | 21 ++++++++
 arch/arm64/kvm/pkvm.c               |  2 +
 drivers/char/tpm/tpm_crb_ffa.c      | 18 ++-----
 drivers/firmware/arm_ffa/common.h   |  4 +-
 drivers/firmware/arm_ffa/driver.c   | 38 ++++++++++++++-
 drivers/firmware/arm_ffa/smccc.c    |  2 +-
 include/linux/lsm_hooks.h           |  2 +
 security/integrity/ima/ima.h        |  4 +-
 security/integrity/ima/ima_init.c   | 10 +++-
 security/integrity/ima/ima_main.c   | 76 +++++++++++++++++++++++------
 security/integrity/ima/ima_policy.c |  3 ++
 security/lsm_init.c                 | 13 ++++-
 13 files changed, 163 insertions(+), 41 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


