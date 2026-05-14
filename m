Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19704CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kF8vI9bRnF+f9EdfIFfvyhqgDYrzH3vz8MWKfElV3z8=; b=sVX4Y/r3t62C56X8eTmH+Qq5hg
	cKgHzJav1RESk6wyUrKZEXJopoxz2MTIuZpdSdp+Vng6t0LuWZGfXtGfUle3VSw2m6A2D0Dd4o5Gi
	1fd8eawUYYTGSxhSfE6zwH4CX08QavtfhFgvJ79L3J+xlMwgmvTMkWIsfYWBfiwOAUKhzVBjdBQkD
	uv5sXfaBR0UI3goeys6XFNcRl3ZftjS12mQdyA8BlHYdGyFJpl0QhrH78s9X3nhuzioaN5AsBYUCT
	R3Ajc85nMS9DifVxkuCBCGpQt6S8mf+1b3qIG7GHP3GHpiXMPTkjYT4AJB5aTfXvbEpRfx/vZv+vZ
	M6XXtBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYl-000000055eM-3ZkI;
	Thu, 14 May 2026 09:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYk-000000055e1-07vn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 09:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kF8vI9bRnF+f9EdfIFfvyhqgDYrzH3vz8MWKfElV3z8=; b=JhSC3sDLmnv/ESsEfd1lVBsfQm
	Fh73UR2y9J4DJf/ca4QHC5r5TZqBO5/f+tl7slQd7r9FyfBUW+a+ryIW/hyKLZuG2PYXuVmP5J1mh
	/m8Yy/WJA9zqhzbbMcrw6yg488QkFgxtmrBbNwzY3Q5tjc09VnKhIrN3CQGrPZVrQ8fVwARWgllQH
	98hRtCkPzEwEC6mDp3r7zTfsUvLGjNN+LBjsHDr4qBNBS9PxTdFGFHpHMa11W+ebL+0pGua+S6IMF
	/VjIsiGctu72KYhue3pQBOYjF8wvnAsTdzAYftFxGM4imVlDTz9K0uuD57bpPCmpxtMuiAr0wRKYX
	mIvje1LA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYg-00000002ZaZ-0zIB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2DB543E80;
	Thu, 14 May 2026 09:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58BEC2BCB3;
	Thu, 14 May 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751644;
	bh=e8wmx6mCu40tXgHwdlK2Aqk7hbkeqgCMsK8w1i8eRvI=;
	h=From:To:Cc:Subject:Date:From;
	b=jkf/wJlcbOh+keKTg0DD76tTmtaN0MLAAPrvStt2rFZL9aHEiesUzcwgJU+tzS9zr
	 g5LbVSyfQBUFFv/ybgGhK/Ds+jFOYRM6cnZmtFCUxk8ztIeB9qAI7BFBmjjwuY1wDw
	 7yPj4yM57CUBVk0APUAtB2lcCzgPvfTUB6LmXjDF2MFGHrVdfxk5en9dIN8YXj4Ga6
	 g4pVhAyBtmP+cAXdaoWnnnq7tvH0LhvX3AcCv0TJ89MlwB/ITdGByCe+0EgelEMs29
	 ZurbSb5IzI61PTMP0E5SxGiolP0S1PuIhnwgfjcVkOg/F4LkD62ScR54ZnLY2M41aW
	 lLOxrpzEn5gXg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device instead of a platform device
Date: Thu, 14 May 2026 15:10:27 +0530
Message-ID: <20260514094030.42495-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104046_966704_31D76C1F 
X-CRM114-Status: GOOD (  15.95  )
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

Changes from v4:
https://lore.kernel.org/all/20260427061615.905018-1-aneesh.kumar@kernel.org
* Add /sys/firmware/cca/realm_guest for detecting realm guest
* Convert smccc-trng to auxiliary device from platform device

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
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>

Aneesh Kumar K.V (Arm) (3):
  firmware: smccc: coco: Manage arm-smccc platform device and CCA
    auxiliary drivers
  hwrng: arm_smccc_trng: Register as an auxiliary device
  coco: guest: arm64: Replace dummy CCA device with sysfs ABI

 Documentation/ABI/testing/sysfs-firmware-cca  | 10 ++++
 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       | 39 ++++++++----
 drivers/char/hw_random/arm_smccc_trng.c       | 25 ++++----
 drivers/firmware/smccc/Kconfig                |  1 +
 drivers/firmware/smccc/Makefile               |  1 +
 drivers/firmware/smccc/rmm.c                  | 24 ++++++++
 drivers/firmware/smccc/rmm.h                  | 17 ++++++
 drivers/firmware/smccc/smccc.c                | 29 +++++++--
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
 .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
 12 files changed, 153 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 create mode 100644 drivers/firmware/smccc/rmm.c
 create mode 100644 drivers/firmware/smccc/rmm.h
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)

-- 
2.43.0


