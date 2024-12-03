Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EB0E64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tofD0lIjbT8sCg3sZIeXHaGCdhlcNCvuy2DPnB09oWo=; b=gGJJfe2Wpmrbi+
	Sw7CtjplX9nAJt5B9baA21WVsWoGdvnGTA7lsoAbxeaqUbtsgW0J36PhNbVOsvmmPktoqNWFVyCIa
	oACj5O3fzfauX2cI3VazVjMykemeVi6dsQQ5NqzEGgSDfcxnXBXcYKWyhuqg6u2lmE+7Ybj5MzoJM
	wAd+Y/2ei45z2QLUBuloWzrJSKcP8XNTKZ1qouDP5ZuDNn80lPOqwzGsJi9P/Ypb8rOz9fqqVL6gc
	hqfq360UdUu7IYXCAPXLKuRh9J88uXt0KzOgnZc0tkbZTqpltfp1U8YTu+iQqdtO6RxeoSSJIqwjR
	vHkYSwA9MQh6CNJ90/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISKQ-00000009UR9-2BVH;
	Tue, 03 Dec 2024 12:48:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFj-00000009Syz-1P72
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E28FA40B55;
	Tue,  3 Dec 2024 12:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F70C4CECF;
	Tue,  3 Dec 2024 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229822;
	bh=IZV9ZhzHqJVnEKcJxYKcUwlnmw8jFD+SNDgdQoZo3EE=;
	h=From:Subject:Date:To:Cc:From;
	b=eHwue4hiGhU7+JckTcKQExSjN39OQ+LcvCPsrbvsG3Jtl+C7Wc613FxEoPK2RFTVS
	 2Kva0TyImTcKhid1jZGB2I1/sw+0+YfrDr3wSW6xIXxyNEw5rkEED3PNpR6FP9+4LE
	 znyOfQ24Z4h3Tx4sGDEvnUM8BIfdNQLYj88/5OclsfM8E4LeisndOHUyn/EEkJ9/Vv
	 RRMaYeCaKL6UfOg10+pR20bEVVqXJiKwiWrZhNbGNlWMTfywM0hfddWSYBNGfwq8Sx
	 5RoIC6AoK4kjlnUmrTQZKhzSZBwoLQ67eo7UM3SlnL6hh1hYx4z8+DragFyQmrxBRR
	 H3ftvuhaDc+sA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/9] arm64: Support 2024 dpISA extensions
Date: Tue, 03 Dec 2024 12:39:19 +0000
Message-Id: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPf7TmcC/23NQQ6CMBCF4auQWTtmWgpUV97DuBhsgUYF0ppGQ
 7i7hbjQhOU/yXxvgmC9swGO2QTeRhfc0KfIdxlcO+5bi86kBklSCSKN7B+lwiXRjC4wajoIqhR
 XjdKQ3kZvG/dayfMldefCc/DvdSGK5frF5AYWBRJyrg3pOq2xPt2s7+19P/gWFi3KHyGnDUEmo
 S5LEiwKI7n4E+Z5/gCfvkMD8wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IZV9ZhzHqJVnEKcJxYKcUwlnmw8jFD+SNDgdQoZo3EE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvzz7hlUQbTGXweDHSxiaLyo/jZx/81Z2eBMmkqR
 OhrG3nyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0788wAKCRAk1otyXVSH0Kd0B/
 9wcLjxF+pY4wnLffdC8iHWzfQtl+IDjeHS7OvcKXcadzjW9nOFTjtmZYB3DN02HxbBNRU6O0V5vSnC
 luo2DkfmzB4DWPIcVCdmaIqEO1xEZEfIZ8dS7yFF9Z/wvmD3neIjP5CV8WZCznY0253/4ghki2s/cq
 KQ/ttPhSqx+3oqOOe3AP9kkWRwa09lJmljZKtBwCmnQWwEHMdtLYgzai5kZB0DXWGg9CRyz3cqxUPf
 IdYlLytkhcnRVJVasl5vzK7PQBUvYQlqFZjJPL9su+Z+O9nt76vQLa248RQjLyKhO+GYd+AbnxpUWO
 MzERraxO3i6lmp/+S6NcHURXTC7XOq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044343_497835_B8C08303 
X-CRM114-Status: UNSURE (   7.53  )
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
Changes in v3:
- Commit log update for the hwcap test.
- Link to v2: https://lore.kernel.org/r/20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org

Changes in v2:
- Filter KVM guest visible bitfields in ID_AA64ISAR3_EL1 to only those
  we make writeable.
- Link to v1: https://lore.kernel.org/r/20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org

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
 arch/arm64/kvm/sys_regs.c                 |   6 +-
 arch/arm64/tools/sysreg                   |  87 +++++++++-
 tools/testing/selftests/arm64/abi/hwcap.c | 273 +++++++++++++++++++++++++++++-
 8 files changed, 493 insertions(+), 10 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241008-arm64-2024-dpisa-8091074a7f48

Best regards,
-- 
Mark Brown <broonie@kernel.org>


