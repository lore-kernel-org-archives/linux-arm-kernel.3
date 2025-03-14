Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556ABC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 00:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cswmwcELvDfgw5YvRmpDXvmGxrsqY0/qA9QghlhYYw4=; b=CZ8XS+ZN02HWY7
	O7z+4QSfvxdXgj5VOvkei/Dk6AzVpOtgTDH/CXTmqygQeEuh3GdFXUHmk/RYLUkRCSrs7jjvNxDhC
	UH42y2gxi9vDFzf+w9twvHEEwhxcFfmEkraDiNmeMSqxHflxOiLHq3tkFaRJ4WgEXu/TA9eysoE3O
	+W+Tml/Rp4xtqjiIySMHCUqpx6j5qtc228Qz+L+MywO+lUXtSBcBBbwYpyswLNMO4DTkT34XFAaN9
	+V6NP8+kxx7bOcOLHaXj1kt/A2vCuEyE/n23I38vtiI1LfibYxndnaHBGDBCO1s+9dtoQHjPpFfG7
	7TLsKWVMpGR+Nwx89Now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tst37-0000000Cogl-1LFl;
	Fri, 14 Mar 2025 00:37:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tst1R-0000000CoL8-3QTK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 00:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFF4C5C5B96;
	Fri, 14 Mar 2025 00:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9CCC4CEDD;
	Fri, 14 Mar 2025 00:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741912532;
	bh=VyNq+KGq1MvIt8wiPP9z3NWuSyZC8HNFid8j1ag0ziU=;
	h=From:Subject:Date:To:Cc:From;
	b=TYmhn1lReFx7HqpHz7FNDUatxOYRkovryGt6eytl6lix7lIv5n6uIpOJmOr+ye0av
	 1gqtfvkezEa65puhBHAxJNsT+IuV2KMwFSTQDuSLTxa1Spx+Z1jlf4+Rc9gWS7U4mF
	 2C/LgGLz4bMeC7ttf79wfv76zaa7UCtGkRGa4f/IHQQ7aiH7jI4r92ajtKgFlISjuB
	 12KtrSgl/2UHfo1hhJx+/nekZJ4ZP6ezlimWaJF52b1lc7PrRgcvRtKCBiH1/nPxZP
	 0UkgqCvf+buMXnw2163qrVZIjqooFH6HuTg9T+uMo6R7Hl/rInvjMEcmENfy+vSmYh
	 eEE/3LgSFuOPA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.12 0/8] KVM: arm64: Backport of SVE fixes to v6.12
Date: Fri, 14 Mar 2025 00:35:12 +0000
Message-Id: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMB502cC/x2M0QpAQBAAf0X7bOW2HPkVeTjssSV0q0vJvzvmb
 R5mblAOwgptdkPgKCr7lsTkGYyL22ZGmZIDlVSVRDXq6YaVUSOjRUNYfzRuosYPkKojsJfrP3Z
 gC0PQP88LKyV13GcAAAA=
X-Change-ID: 20250227-stable-sve-6-12-777778ad28fb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Fuad Tabba <tabba@google.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VyNq+KGq1MvIt8wiPP9z3NWuSyZC8HNFid8j1ag0ziU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn03nI3rQ4drECSXEBo2LN0vtyTJ1f6g66RUTjVnPy
 wNOvBvyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9N5yAAKCRAk1otyXVSH0NKZB/
 9dOhtBrW+mr33/W9jdpsdEIw5mqmE2blfsMLfBq4tSa5siK11+owL5BRRUIgZZPfsG65cK9chUQh4i
 2IoPq23ynTiVbKG2kfmO6DGHlQss1tvINsdvYfHUSkyJ/awIKBueb+XWdsxG00daKgw7CcQd3A98vN
 zoUXD2XCitYM6znjQGCZSiPZ+5c8e0LKj1bQe6dteUR2h0tk6Ojx8FHeYM8NxW6aX/zLNteZTFIJ1Y
 jJb6Ll/vhUjmD2uZMO39pulqDXwbDwe9i4cqu4r/JRdXPAj4GDrkzQpoyH0UskWThr1tTlSUqGYMpW
 L6Ql7o+bczEt6GNBCXeapnmRtcAaWD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_173533_968846_5C0392F4 
X-CRM114-Status: UNSURE (   6.86  )
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

This series backports some recent fixes for SVE/KVM interactions from
Mark Rutland to v6.12.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Mark Rutland (7):
      KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
      KVM: arm64: Refactor exit handlers
      KVM: arm64: Mark some header functions as inline
      KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/kvm_host.h       |  25 ++----
 arch/arm64/kernel/fpsimd.c              |  25 ------
 arch/arm64/kvm/arm.c                    |   9 ---
 arch/arm64/kvm/fpsimd.c                 | 100 ++----------------------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 133 ++++++++++++++++++++++---------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  15 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  29 -------
 arch/arm64/kvm/hyp/nvhe/switch.c        | 134 ++++++++++++++++++--------------
 arch/arm64/kvm/hyp/vhe/switch.c         |  21 ++---
 10 files changed, 204 insertions(+), 292 deletions(-)
---
base-commit: e9cc806c0152fa9993f817cebf42989a3e2530bb
change-id: 20250227-stable-sve-6-12-777778ad28fb

Best regards,
-- 
Mark Brown <broonie@kernel.org>


