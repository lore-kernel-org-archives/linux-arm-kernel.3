Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E2EEB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mNVpiHwPyqxB2NacCnTu1bLvpRW0Y/2+k4PJEzRdXrM=; b=Gn2YRUVcSadpgo
	nrJRjutDeaD1/TRx29ke4Xhpfzuw4lnweAmhmmrF64eHBwtIgp7a1JfOGVsrqbh4eA8zujQp/dL0o
	xDKNWncW4r+Iv+WvRiDlvuZk2PpP+V8s1xrs5DHEvOqSb+SA75Pl7kPJZ7MyjQpoBAX/IoCk6f8I1
	NVmkyEu2QIWCkGH70AOOhCISSIpDFUS+tRiLmyLBGPtHozGUleGHYGBXyK9s0qGpxtP0Ubpkmdphu
	0xJ/5FHknaLIYQU879IZYSOy39KtA6CCOqowW+oETlHDLe7HW6sRdbd++GO6CEgAszXfQs+irakiP
	KacFVo6FS11Jsu0My2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEj-0000000EA1b-2abE;
	Mon, 02 Mar 2026 22:59:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEi-0000000EA1R-0E2e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 790E360128;
	Mon,  2 Mar 2026 22:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9B8C19423;
	Mon,  2 Mar 2026 22:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492375;
	bh=FaUBvjel+m4F6ioncCKqn+oV12A2Ri4kSItagqz6d+s=;
	h=From:Subject:Date:To:Cc:From;
	b=hX8K38/YihbQUTenWnyulCNOsMi8mpp1rKjo5y7TcoDlMjVFQbYlXfDrnZjLUjhIV
	 bLhdRSeE9YbBJa8rMPfzwTs7h+jGOUJMdmNVCSFXyFmyrpGkzBEd4gkAfVhAxYo2E+
	 XSVXXtzU5Wme2ETMx66S9V6ksdBQ2WPo+LvitF3FirkR100c0m6wPWzdjbDbI5W5A+
	 5Gs0LmqErjvVSLoktXCNtjk+TLRYGRiPqEFfVzsJ++7bOnRVV28cJ9bwOyPQIm08rd
	 fkiuDxbNMQK3rlW26wi1WplGwxGf9TUxZAHOF2rHT333hDRJi9Tu7+8jyldI2j284D
	 6hGcWq0aG9YTQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/8] arm64: Implement support for 2025 dpISA extensions
Date: Mon, 02 Mar 2026 22:53:15 +0000
Message-Id: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsUpmkC/yXM0QqCQBCF4VeRuW5gNZugV4kupt2TTpDJjkogv
 rtbXX4Hzr+SIxucLtVKGYu5vYeC+lBR7HXowJaKqQmNhDoIa35Jy2k0Vy7jiZPI+agQjQCV25j
 xsM8veb397fP9iTh9O7RtO2/cHQF0AAAA
X-Change-ID: 20260106-arm64-dpisa-2025-d6673ae6acee
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FaUBvjel+m4F6ioncCKqn+oV12A2Ri4kSItagqz6d+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZOvvoPDojwyp5nvchJkIbV5mZAOyGT+z9jc
 S0UvmvwFgmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWTgAKCRAk1otyXVSH
 0Oo9B/0QunqIb3ShHSa1I9yzEf/odlNOvTyIk7IcSk/6WExkdH455L8Nmu9qNPOLNQM5KdKSzFA
 opePWiQ5olY1MXC1qCkUwuYs/aZtTNA1HaeBaK1xEndW/tSfMo4hAEeyENVKcu96aVg6uZSbuOe
 5nPa1W6vArNG4D0own4pStA0SURH/miR4bRjNO87I8e+jWD00u0zIHUQz9tUfSeBC3a1m7ARkoY
 i1Qrh44LHcY9nhPe1jXog8FFw4fVr9NyfQRwnByWiQq3fj25QC6w7i5A9PeaokYhQXhQqDivU0p
 0BP8UF1Fnm64gTnvMKm5OKfBxGfftsWovR8TwCrU3o5uMFYr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The 2025 dpISA extensions introduce a number of architecture features
all of which are fairly straightforward from a kernel point of view
since they only introduce new instructions, not any architecture state.

All the relevant newly added ID registers are already exported by KVM,
all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
and the updates to ID_AA64ISARx_EL1 are all additional values in already
exported bitfields.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (8):
      arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps
      arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
      arm64/cpufeature: Define hwcaps for 2025 dpISA features
      kselftest/arm64: Add 2025 dpISA coverage to hwcaps

 Documentation/arch/arm64/elf_hwcaps.rst   |  24 ++++++
 arch/arm64/include/asm/hwcap.h            | 120 +-----------------------------
 arch/arm64/include/uapi/asm/hwcap.h       |   8 ++
 arch/arm64/kernel/cpufeature.c            |  11 +++
 arch/arm64/kernel/cpuinfo.c               |   8 ++
 arch/arm64/tools/Makefile                 |   8 +-
 arch/arm64/tools/gen-kernel-hwcaps.sh     |  23 ++++++
 arch/arm64/tools/sysreg                   |  20 ++++-
 tools/testing/selftests/arm64/abi/hwcap.c | 116 +++++++++++++++++++++++++++++
 9 files changed, 217 insertions(+), 121 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260106-arm64-dpisa-2025-d6673ae6acee

Best regards,
--  
Mark Brown <broonie@kernel.org>


