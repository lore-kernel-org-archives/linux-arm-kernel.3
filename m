Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D265EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mjd27FEYF23xjXjRdKK62j/aOvSlWvgLYzQcrk8wqmU=; b=jKAntFDOqvmxyH
	U2u0PliSv1mV78HKr41tR9RpEqfslba5pp44ToStUtTkZtip9gPvfkeBBXwk5L+pUsIj+io6UwwhC
	KFl/1dzIxzGb9OgatnUTUf1Tku3YipSPlvs2YfzOR4+WKxCZlFfyLkeQ6CVUgGHXexUW98KgejXIq
	I5NOUYKWXGI15wGWk2KDA76iP5RAyv1OqPHNpLb5HQjSzf4FL5bpwvONFY+LB5sCfYBI9hkx0KsTz
	r69H/E24S9WawaTM7AMlGH86YKUv406ddkwnzZ0Qis8/7xvNodUin09HkcE3r1LclGZnzsk9lOq41
	lTch7QLYzhY+pGm0vkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBAT-0000000DMkm-01NV;
	Wed, 11 Dec 2024 01:05:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9O-0000000DMMJ-0Wav
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B5F6A41C0F;
	Wed, 11 Dec 2024 01:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E8C4CED6;
	Wed, 11 Dec 2024 01:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879065;
	bh=jLX4rlgMDPCJWTDHkPE3yprw7Tf6zXMkVO5ew0qsRzg=;
	h=From:Subject:Date:To:Cc:From;
	b=VIPt9K6avZPGcJX95i8dZcZr4WHiFeI8pQWxYiEQ1IxNs3eY2ofLeuQAKXbWBYM9/
	 sQmT5tfAA3Oc40yH+mwcwBsGb8iq3PvNUTjff3ekPbZ2fDCKO6XKQqfvWpVRWQ75Fh
	 SQQrQNXbR1TGoxJ6cZKWhXuhsIfPWFCmS7+DLxYFa+ItGPmwLy5JSnQ8GzhUxdg7sp
	 dPVdyiUY+zBuDQ2Y7sUv4SQ6LoWndxj/YiGWvlUbC3oGA+zkx8NF+80L15nyCD7+/l
	 vBFD9Xr+9ttQQ4/HymTlKu/TtpjxUoGkJ4NW9Ift8s+I7zaF6hwGR+G3aZSHwUYD+u
	 41qwgAo9MsEHw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/9] arm64: Support 2024 dpISA extensions
Date: Wed, 11 Dec 2024 01:02:45 +0000
Message-Id: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXkWGcC/23OSw6CMBCA4auQrq2ZPmiLK+9hXAxQoFGBtIZoC
 He3JSZqZPlPMt/MTIL1zgZyyGbi7eSCG/oYcpeRqsO+tdTVsQkHLhmAoehvStKUtB5dQGqgYKA
 l6kYaEtdGbxv3WMnTOXbnwn3wz/XCxNL0jfENbGIUKApTgynjNTTHi/W9ve4H35KkTfxLELAh8
 CiUSgFDltcc8z9BfAQOYkMQ6QdVaVMyRF7oH2FZlheedAloNQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jLX4rlgMDPCJWTDHkPE3yprw7Tf6zXMkVO5ew0qsRzg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUOpUj1V2UXYPLuLrtYppEWr2dhV1p85fuVagzR
 gYNQooeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlDgAKCRAk1otyXVSH0BzyB/
 9GDTPkWnyb41SmxP3yIFjbgzxKspUYlH7g5GhliS3owYK1Zp6vFQGZ+qQHXW1QyBWYhXoYm+gPcNW3
 tApSmN4cH8lEJW21vvhZelgf5FsSNTfv7axUvnrNsTdqfFX0SqT/YUbMWc8A7Vq6drXVOiWBRkn2dP
 /nTdH+5hSEAxf/rb0Hj7a698k5s6+dxkGERVWV06OvuBtnjvPBXiN695n1RY6tQOS3ZbRAk+XZ+nGd
 7NUwOHysJDA7vQEQsQ4YSXl10w2jSHvSpFn7Kr6Lh9ps4s5yeMj6ihPa8LK/HXbt9SfJMFgu9zRPQL
 1Yrcan4GgMgqPM+IKvJhVzUBxGL19i
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170426_296303_615F9187 
X-CRM114-Status: UNSURE (   7.07  )
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


