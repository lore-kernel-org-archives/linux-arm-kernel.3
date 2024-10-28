Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A2D5B14E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUJJyDUKdqwQp5P2iDHbBhaQ+bfnlI5fMXuxcvkGehA=; b=ZQ/q+7ToqQGY5f
	4JkZ5CWZRA3tyLEQ0rd6zjA9Ya4jADDzFptJvl8i5EM+sCoEw6xaFbW+Ft+VlM0Mm9A4Zi6AfLJtz
	UWzIzFFCdje51WrwRN8nGQz36u6jg92kPBw00I4bSlggKwt/tpT+Ob50BH25kwMzfIt39EbxyPGVY
	iAzHY+jwGtrOPUcA1MBxmhRZ8/WC0u0WaUkCCpA+wXiHvE4WK2hF1bFwKA4/pnbbZ30LYuH2k7P8A
	9OSRuNS99l2Ba0jlTcau4cZEL8t5/FQJxZLTcoSgSjekZMzLHmuKw9yDRTaTT5nVPCZQJe9Eu1I5R
	0tGs1UoJGLbAZvak1rbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WmY-0000000CGbs-13H9;
	Mon, 28 Oct 2024 20:56:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJk-0000000C9UF-3oAB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F8545C56A5;
	Mon, 28 Oct 2024 20:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7768AC4CEC3;
	Mon, 28 Oct 2024 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147184;
	bh=sol/MuipOzf7KPplFOyD2hmajqHTW1hr8fw/YDH04Sw=;
	h=From:Subject:Date:To:Cc:From;
	b=YSeYfq1GuuUN74PjNeQwmirBJkoKp/sKxRnF1E0Cnxy/y1QoLmAM2vqqeGHE9VqDr
	 24AYIkLN6LpsE7bzTaIbUdsFgKjnReK2OgfaOgRW5hxOcDVzNXaS3i3cgGk1wXaaul
	 r1wlMOU1pRtvOgrZBVgnvUszYGAWfdhP9fqsqdr2zYnuEDxDOAbbtm7usJX9zzv2oH
	 912tL0BaXFWuCmy/tbYZvRaCjB6yl81KS5PBdTRFJXggknNLWr7Y6U4YbYk/Io+fXI
	 LZEOjy5wj/rk9qBqs6z9g8a2dxjAN5hXmx6kYDKFHOCwG4RC3d4jo/Ip2lIm9rmdTS
	 2FXDR7Le6+nvQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/9] arm64: Support 2024 dpISA extensions
Date: Mon, 28 Oct 2024 20:24:09 +0000
Message-Id: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOryH2cC/x3MQQqAIBBA0avErBsYQ9K6SrSQGmsWWShEIN49a
 /kW/2dIHIUTjE2GyLckOUOFahtYdhc2RlmroaNOKyKLLh69xo+4XpIcWhoUGe2M1xZqdkX28vz
 LaS7lBStH7MRiAAAA
X-Change-ID: 20241008-arm64-2024-dpisa-8091074a7f48
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sol/MuipOzf7KPplFOyD2hmajqHTW1hr8fw/YDH04Sw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/Nlf7bEh5sJxyS9APvTiice6ZVXCG3VF3/2rCov
 VfneMG+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/zZQAKCRAk1otyXVSH0Dy2B/
 wOJiOkm/F/QceJ5m1SqfcfVDltQ/WB5NLgUx/abPOvKJKrbmWPOVlM4ZOcWcoqqwm2WUnLTJinRb6D
 Yrk0wRqPes1owib+tQ9R4rxSXf5pOUI0d1/DzGdycCoMa4QUmrMSYBlvAAIerccegORPfVM/lL5YxG
 PzZ7UhJatVuiXQyhCOb/8kB98i26M6ojfWJXd6gMxUI1eRRgIAEdQ0wqmQq5QIHJilv/Hn/UHB5/Qi
 nUG1pfjtnTrYw68Py5XqNo0+tE24AhPFSxitA88NKsolV34Po9NAz9/wdhSxQBKlHiSh21iaPaMQIr
 HPhCbK9eSGiCoQ/zjsALkEuGLYb77P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132625_070412_5BFFCFDC 
X-CRM114-Status: UNSURE (   6.07  )
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

The 2024 architecture release includes a number of data processing
extensions, mostly SVE and SME additions with a few others.  These are
all very straightforward extensions which add instructions but no
architectural state so only need hwcaps and exposing of the ID registers
to KVM guests and userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (9):
      arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601 2024-09
      arm64/hwcap: Describe 2024 dpISA extensions to userspace
      KVM: arm64: Allow control of dpISA extensions in ID_AA64ISAR3_EL1
      kselftest/arm64: Add 2024 dpISA extensions to hwcap test

 Documentation/arch/arm64/elf_hwcaps.rst   |  51 ++++++
 arch/arm64/include/asm/hwcap.h            |  17 ++
 arch/arm64/include/uapi/asm/hwcap.h       |  17 ++
 arch/arm64/kernel/cpufeature.c            |  35 ++++
 arch/arm64/kernel/cpuinfo.c               |  17 ++
 arch/arm64/kvm/sys_regs.c                 |   3 +-
 arch/arm64/tools/sysreg                   |  87 +++++++++-
 tools/testing/selftests/arm64/abi/hwcap.c | 273 +++++++++++++++++++++++++++++-
 8 files changed, 490 insertions(+), 10 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241008-arm64-2024-dpisa-8091074a7f48

Best regards,
-- 
Mark Brown <broonie@kernel.org>


