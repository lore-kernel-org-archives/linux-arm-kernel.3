Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C692E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m+ET+Zqg9tQxeAGLU9XbtDVMxERtE+a+ib8Mt5gizWc=; b=Ek30ZFKWh7Ldfg
	O09Q+PIh3OkaIqhzen+Qr1cq1iXV1irm0+y24XA+KkBMtCTSRxe3KKcpB0zjWxHyMoTz6pMpwi0sq
	4IanOrZpudDxEhFpagBxFQPkWyuotLMFo/T0NYhmhe1HLF3wtFUEXHHTtftgMxJ8JWMWMsLjtpsIK
	y1LzyAaAhnp36xjWb3SnvL7aCIhbAkUFdF05xMizaSXIAzSSUlye+Nly/B7dXOvo4reqwYmtZHIMg
	CPATBgu1bd6ISWqL0vFkG5EHgqGOxiQK6jT0cKVxrfO4KH/KwyB27n5+eZpZvycUuIpk7nnEYStjw
	/oENuEg2gQ2XPIHep8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIaz-00000006TcK-3RhO;
	Tue, 07 Jan 2025 23:02:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIZV-00000006T68-3seb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EB03A41E8D;
	Tue,  7 Jan 2025 22:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB61BC4CED6;
	Tue,  7 Jan 2025 23:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290872;
	bh=4/74AoE0KevQY71fa48SjfyBNjcL4errS2YyxZ5ajuQ=;
	h=From:Subject:Date:To:Cc:From;
	b=g0XStQxsQUhFJHIe0Y7DbunDOLYpVvdB7P9VqbCxxJ4liGlJZJE5dkf7Ougnm4RGI
	 ep6cjl/vaOthEFMx3RoXsciQEa8KZtrxe8LT+spILQfH/Swnit8nfpdMDKTMjx3ISw
	 yolgzSITIFxRm5aF2OyrjCJ55RbTHl38e8qX22V0F79gddlFMak8o2me3CCjBYkVIg
	 tLvzE1ejxd42IfQrBXm5y1vS9L2AwWKELj/NBfSKUQjFvnR+WMFtKzrsi61MuqbHFi
	 7N69wlQB97gckLt8BVy4nvEIuWT+VjJpdIeNUj0ohM059N9YjzhWnCLLG2hIRA3mKT
	 EFHHeCDVk67/w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 0/5] arm64: Support 2024 dpISA extensions
Date: Tue, 07 Jan 2025 22:59:40 +0000
Message-Id: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyxfWcC/23OwQrCMAyA4VeRnq0kaddWT76HeMhsp0XdpJWhy
 N7dTgQVd/wD+ZKHyCHFkMVq9hAp9DHHri1RzWdid+B2H2T0pQUBaQRwktPZaDmm9JeYWTpYIlj
 NttFOlLVLCk28vcjNtvQh5muX7q8LPY7TN0YTWI8SJCvnwdXlGrv1MaQ2nBZd2otR6+lLUDAhU
 BFqYwAZK09c/QnqIxCoCUGNP5iddTUy09L+CfpLQJwQdBGg8RqUs8Y39CMMw/AEEHjXCXcBAAA
 =
X-Change-ID: 20241008-arm64-2024-dpisa-8091074a7f48
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4/74AoE0KevQY71fa48SjfyBNjcL4errS2YyxZ5ajuQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnfbIw6kZpk6FmQX8Lcp16zn2VhkK18HvMB9LAKEdz
 eikIoK6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ32yMAAKCRAk1otyXVSH0HVSB/
 9eqUSUIQRfN14xSJQCK2j5joDXhTo8ICd8i/TOuFWQjroSc4fvBWhxpPuIubgie6MmjclU0OdXweic
 CdKYqINBJpMaaCr6UU/3V2ouhN+nJp2Z5ju+2IXc0ocyXgZHYemtqGb2fSIct9G73RIG7hl0iGEl0+
 buHtdVxVgjTOLQSAirhf93+M0f3auRTMBcYHKI/5ngMDE5WjRiXNNp+XtFrr7+5rZAlB7kQIzfuMgf
 IFH91K6VvotQrd2pc0EXSb/sF/9GNC1ugxkLQiF6NYVY/yrUOXdlcwuJvl7c6VSCHRvwGSCYB1OP42
 Coz+ZZdiFPOOJhXaEWN9zuItopz7ci
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150114_100704_10FC29D8 
X-CRM114-Status: GOOD (  10.38  )
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
Changes in v5:
- Rebase onto arm64/for-next/cpufeature, which incorporates most of the
  sysreg updates from earlier versions.
- Remove SF8MM8 and SF8MM4 register defintitions which were removed from
  the ISA in the 2024-12 XML release, along with their associated hwcaps.
- Incorporate Marc's fix for SVE hwcaps on SME only systems and update
  the hwcaps for the newly added features to follow the same pattern.
- Link to v4: https://lore.kernel.org/r/20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org

Changes in v4:
- Fix encodings for ID_AA64ISAR3_EL1.
- Link to v3: https://lore.kernel.org/r/20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org

Changes in v3:
- Commit log update for the hwcap test.
- Link to v2: https://lore.kernel.org/r/20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org

Changes in v2:
- Filter KVM guest visible bitfields in ID_AA64ISAR3_EL1 to only those
  we make writeable.
- Link to v1: https://lore.kernel.org/r/20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org

---
Marc Zyngier (1):
      arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented

Mark Brown (4):
      arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601 2024-12
      arm64/hwcap: Describe 2024 dpISA extensions to userspace
      KVM: arm64: Allow control of dpISA extensions in ID_AA64ISAR3_EL1
      kselftest/arm64: Add 2024 dpISA extensions to hwcap test

 Documentation/arch/arm64/elf_hwcaps.rst   |  89 +++++++++--
 arch/arm64/include/asm/hwcap.h            |  15 ++
 arch/arm64/include/uapi/asm/hwcap.h       |  15 ++
 arch/arm64/kernel/cpufeature.c            |  71 +++++++--
 arch/arm64/kernel/cpuinfo.c               |  15 ++
 arch/arm64/kvm/sys_regs.c                 |   6 +-
 arch/arm64/tools/sysreg                   |  26 +++-
 tools/testing/selftests/arm64/abi/hwcap.c | 235 +++++++++++++++++++++++++++++-
 8 files changed, 441 insertions(+), 31 deletions(-)
---
base-commit: d66e21d59ed0e043e68ef8c6541c1e9f1a962614
change-id: 20241008-arm64-2024-dpisa-8091074a7f48

Best regards,
-- 
Mark Brown <broonie@kernel.org>


