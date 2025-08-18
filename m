Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC37CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=glgdEFIB7zdu3yoxhg1zANRyBYCaUfO/hEIaHE7aRPM=; b=MHbIRYs2pJQfuf
	FyKVED67rJJVjtprOFbSgrRYawY3v2Cq1pqw/w8KRXyAaVm29IHEp2Z5lCl3I+yB2cfDgY36T8UcW
	OpWphBGzgTogP4n5QaD9EBCjy13W9gqQTVFcrVkhB0wU62FrzyIltVzrGJ9s1ikgpPyk3vzjYfxzH
	4w6kuHV/uiGJ0JHXMnJSxxlvDmUQCVQzz13t0q+U/CpSHj7iMoxo5LE7FOpUjhUvslUheGyiQHjqd
	cEdhQHuJV9xehUGn7Uhy18s5HQ9CL9FqO8dAvJwLkPeNc0zhZpOzz+I+WaQ/k73cfRWNZo5Tz0nuG
	4yyt3ujCHQYUqsrKdXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nu-00000008i4H-0pOo;
	Mon, 18 Aug 2025 21:27:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Uu-00000008VgN-2cwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 290A945F0B;
	Mon, 18 Aug 2025 19:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2F9C4CEEB;
	Mon, 18 Aug 2025 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755545183;
	bh=+y/vOOo8jAZA17Jtz8gRMU0zs0a5jt47Bouz8MVv3Wg=;
	h=From:Subject:Date:To:Cc:From;
	b=qfDDwrE+BVp5zL1+EDWcdMm7DmF/RDfc139D2y/CQIlaGUYVodu81jkwikSMnQAp9
	 I6RIQpL6z+vUbr3V7f/oao7P8ecH/sO6LvAa8gv51EltIpuqfeFBLOPDwjrF1O/XCq
	 ARoyCzVY3yd1NvKMFVR6KGeaRKuc5mP30SqfNLuf/Psh7+Mxtli77t09TWya4cAkaf
	 7eaPmhtMhH5/niq6dqMUg+SdujDRCt50ZzIhPsb4uyR4K+LfRgdZC+A6QpQroNGfKu
	 3v/o6HbGyBOre8ZFJYdaycQMX+ZajkeTaG4trVyK3qk3A6yClCydTDmX7dlovz2KPi
	 P8EBQe0D/+0Ww==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/3] arm64: Support FEAT_LSFE (Large System Float
 Extension)
Date: Mon, 18 Aug 2025 20:21:17 +0100
Message-Id: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC59o2gC/1XMQQ6CMBCF4auQrq2ZlgKtK+9hXECZQiOCmZpGQ
 7i7hcQoy/eS/5tZQPIY2CmbGWH0wU9jGvkhY7avxw65b9NmEmQBpSx4TfdS8SE45KAFWGd03Vr
 JUvAgdP61YZdr2r0Pz4nemx3F+n6Z6p+JggMvdV4IqxpXKXG+IY04HCfq2OpE+WsryHetTC1ab
 DUYY2yjdu2yLB+mc/9x4QAAAA==
X-Change-ID: 20250625-arm64-lsfe-0810cf98adc2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+y/vOOo8jAZA17Jtz8gRMU0zs0a5jt47Bouz8MVv3Wg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoo35Z9ywOmVIYyAGuED3un6+Vp7m7E8UOzL3eO
 oaGa9ejrgyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKN+WQAKCRAk1otyXVSH
 0Pn0B/9Lgel83JGwfCO6weWZrwLTSxZ2NGgB1wsezpQ0o8+jWonTcI42s6sUDwa5kbmTm29twd3
 au1tIWNztBPPSfYtmfR013a77/8OggTudCW3WkyBYW60gOe+W7oO9VZ7ncmJjl0KdLpga9/CJo2
 QrcJs0AQeSYSfDSX2aUFarsYAeJf0BOpcZQQqFmRcBJeEYfOXJuoPISSlTl2QToQGQbEIsSsuHZ
 czwK5wGZhCDuyu3Rz5InsNXmq1P2Yw0DbkfMp0rYdaX6NClG3rFT6zQD59hMfeqRpSHeCawPxMD
 Tpj8xMNFP4Z9IbXUBYDpqVYc5Y1Csw1L4AH82yeJPogRglaZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122624_711585_CF003E98 
X-CRM114-Status: GOOD (  10.16  )
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

FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
memory operations with floating point values.  We have no immediate use
for it in kernel, provide a hwcap so userspace can discover it and allow
the ID register field to be exposed to KVM guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Rebase onto v6.17-rc1.
- Link to v2: https://lore.kernel.org/r/20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org

Changes in v2:
- Fix result of vi dropping in hwcap test.
- Link to v1: https://lore.kernel.org/r/20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org

---
Mark Brown (3):
      arm64/hwcap: Add hwcap for FEAT_LSFE
      KVM: arm64: Expose FEAT_LSFE to guests
      kselftest/arm64: Add lsfe to the hwcaps test

 Documentation/arch/arm64/elf_hwcaps.rst   |  4 ++++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            |  2 ++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kvm/sys_regs.c                 |  4 +++-
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 7 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250625-arm64-lsfe-0810cf98adc2

Best regards,
--  
Mark Brown <broonie@kernel.org>


