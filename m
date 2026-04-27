Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B8FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AB0U56Tgo2iwEPbCXl/gDu5SqRVpfmVnLPGfpHvUsdo=; b=QVhhvhRjrkOXCz4CpANVoebe3r
	TaOR2LYzp3sWKKnEdQRFoMQ1AOVk0g+NslbgpaAPdhMaB96Y+DXoHPpUkDp9P6oLLoowW9slQmDz4
	bljbm5cuyL8VNNyAwmU41imLkE8M82BBASuNYKcqs6QvdzlmwaQX4Zg+HrLy/OCXOcBi5MCSj5xLh
	Rl3SOFagkl/0WI9kKs5eFADOm8L6A/vlX3PhRLRaYFvvzsV6jxs9sOLszgShM8wNMFknobKu7LwSr
	bTY71fROuzmnDBe3iBzR3lXTT7GfxgfYICW41n06BXK+vkWjkgwZXzAEIgwlkhqXXDKfVR2nD7hLb
	782YgxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFGc-0000000GFAC-30Sw;
	Mon, 27 Apr 2026 06:16:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFGb-0000000GFA6-2Jq1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DAB360138;
	Mon, 27 Apr 2026 06:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FBFC19425;
	Mon, 27 Apr 2026 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777270584;
	bh=8/d4YZwyXUghztMqz4dteFO0f0uW2G9lGE/vlAQwVP4=;
	h=From:To:Cc:Subject:Date:From;
	b=saaAEyWz4j7pGmWLRVGc7DY7FeXvd8qSjyw53ZNil7LDw6VL9BVNA8j1fmrwsf/Vx
	 mJH0x/dm4XzKmNuFl/cDVMM6a4C/GLkPL7xHQngaZ+dQmSp0689YkoY0NBOYYwogrx
	 FUfcukDT0wo9p/p0v3dkBtTd1DEE+l+73RXQMJVQYhkRE11mUrg2F9vBP0mXdTgP4f
	 XAUHDVHfdZdNUuVUryVtxpU5rbXvdnYy1wf1SRSFnCYDi7Q297ef03kPfPVX1zZXJn
	 oNWohlSdAjL49wsQVNCZ77aRXFXPf0YZTxhUKfLnqffS6hBkPi7hEVGo6ML5Zdzww5
	 D5RtElosf8XGQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 0/2] Switch Arm CCA to use an auxiliary device instead of a platform device
Date: Mon, 27 Apr 2026 11:46:13 +0530
Message-ID: <20260427061615.905018-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As discussed here:
https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org

The general feedback was that a platform device should not be used when
there is no underlying platform resource to represent. The existing CCA
support uses a platform device solely to anchor the TSM interface in the
device hierarchy, which is not an appropriate use of a platform device.
Use an auxiliary device instead to track CCA support.

The TSM framework uses the device abstraction to provide cross-architecture
TSM and TEE I/O functionality, including enumerating available platform TEE
I/O capabilities and provisioning connections between the platform TSM and
device DSMs.

For the CCA platform, the resulting device hierarchy appears as follows.
Note that the auxiliary device is still parented by the arm-smccc platform
device, so the sysfs path remains under /devices/platform/arm-smccc/:

$ cd /sys/class/tsm/
$ ls -al
total 0
drwxr-xr-x    2 root     root             0 Jan  1 00:02 .
drwxr-xr-x   23 root     root             0 Jan  1 00:00 ..
lrwxrwxrwx    1 root     root             0 Jan  1 00:03 tsm0 -> ../../devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0/tsm/tsm0
$

Changes from v3:
https://lore.kernel.org/all/20260309100507.2303361-1-aneesh.kumar@kernel.org
* Rebased onto the latest kernel
* Drop pr_fmt() from drivers/firmware/smccc/rmm.c

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Will Deacon <will@kernel.org>

Aneesh Kumar K.V (Arm) (2):
  firmware: smccc: coco: Manage arm-smccc platform device and CCA
    auxiliary drivers
  coco: guest: arm64: Drop dummy RSI platform device stub

 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       | 15 -----
 drivers/firmware/smccc/Kconfig                |  1 +
 drivers/firmware/smccc/Makefile               |  1 +
 drivers/firmware/smccc/rmm.c                  | 23 ++++++++
 drivers/firmware/smccc/rmm.h                  | 17 ++++++
 drivers/firmware/smccc/smccc.c                | 14 +++++
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
 .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
 10 files changed, 89 insertions(+), 46 deletions(-)
 create mode 100644 drivers/firmware/smccc/rmm.c
 create mode 100644 drivers/firmware/smccc/rmm.h
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)

-- 
2.43.0


