Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD277D2AB15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vr/FMgunqjiuUdOvmbmO0hFpia2MsoxL+Kf4qMjyg+A=; b=hirnTNIuDwtnUD
	aE6Z9vOIHQhDcwnQ1EFELrf2JQCAds46gJYixHvtfgYKXnNX1lWMseq55SQ2tz+8vqw1VVZfdIYQA
	rhtdja/bnUYtUHBEa7cZWjkH3zEKT39nAjWsrtPEFhTNPjIRSfPnzca/jwnpISd2f5UfGPt3txQW9
	9qvXsDLzp1OPZvF46kK0ZU01bxZIopYYRwP2tAgJ1GRTLGc3yW0irLLoTrlhAFpxqhvYXNssrCuK2
	TmlX98SDU1pSPF/ZLZ7VrQW3xXYlAIC9BVQByBm3kq/Vnz92DoYmnaQF244b67NOqcOKFydvz33T7
	NhBi4BCLw2wa8NFfGrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Apr-00000000uvp-1zcM;
	Wed, 30 Oct 2024 15:42:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ao9-00000000uNs-2kLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F6E9A4162B;
	Wed, 30 Oct 2024 15:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F60BC4CECE;
	Wed, 30 Oct 2024 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302828;
	bh=Bl+5Ay3FFAKvbhH35eUMEt83qx9zkSG64B9jfI7uxUM=;
	h=From:Subject:Date:To:Cc:From;
	b=qOW/D+EbmBVAn7zk80NEXzG8+OmGSsRUnuuO5kc7a373sZbp/9JOtuhn8iwKC9d93
	 RTNm7dSttbfV/68DueQWTmBZcGyqm5iEJbHT9xqTQiQfMEuFmfeOnDSuYWrlCFu9IG
	 7oNHtYRDrj4W1QUdwddUEMXKoDJVnOxXcuk/WJxr1LsDFlh3zY6fNfJzt1wZMN9thQ
	 9MwNkmckzyGdyKPtYsVrXdJXipUMZ2CQzSSOb0J6y68haSxRl97BeL9/D4nXCVlTSU
	 vDZKc8uvM+x6HqDgA7+6t1WfT2Q9fwvuRYe+MEZxSB4bIAo/9e1G4N0qDUQIl4WtjI
	 B4+3+0VhYQEnQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/9] arm64: Support 2024 dpISA extensions
Date: Wed, 30 Oct 2024 15:34:45 +0000
Message-Id: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVSImcC/22NQQ6CMBBFr0Jm7ZhpbaS64h6GRZUBJiolU0M0h
 LtbiEuX7yf/vRkSq3CCczGD8iRJ4pDB7gq49WHoGKXJDJasM0Qegz6PDlfEZpQU0NPJUOlC2To
 P+TYqt/LelJc6cy/pFfWzFSazrj+Z/SObDBKGg2/IX3Mt+OrOOvBjH7WDelmWL8HYHB6xAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Bl+5Ay3FFAKvbhH35eUMEt83qx9zkSG64B9jfI7uxUM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNhsrSy+xHNERieWXqP1j/YLwVf78bhUbTyAurw
 QfZkv3WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTYQAKCRAk1otyXVSH0BrECA
 CB6c/mPpV22NP6+WBfhlhYwKlwBchS7yWzpSBftwPoSuYGS0t4BoON04mg80CKZZ77jSxS2kBkPehz
 kyddpgAq8Ox3wQxlE98z5L7tyQZEantMU8PD3ETBZw6aQaXKuBT4YeYFwvl2sKRnzw47NzWA27z1/k
 dNbgFlS22UXo5xRxEVqY50qFuR95vOWZULgDA5NaLG7Nj0Yg9iQVo44Fbk2GanuB1+P0UB4JVdVdRY
 rW7AC78fY5NRsevuhLVA7AsNj82qqf4f/3LQGAu5cHIZvTxYqpa780AgZCaAZTqpGBUSJdHbyJhDR8
 kFD1bJxDlLQyReI4OogHPtyEHlgN96
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084029_849532_D6152D12 
X-CRM114-Status: UNSURE (   6.96  )
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
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241008-arm64-2024-dpisa-8091074a7f48

Best regards,
-- 
Mark Brown <broonie@kernel.org>


