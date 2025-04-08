Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15868C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sty5Yv/Femd2TJXJbd+uftLVXZtVSCgledVFgZIlgV0=; b=RUhOeEE8KOQx54
	2CcSROp/guC5mveiKfPCH5wz4STetwgmB0CVbiHRfla5fcQrcd528NSn4oKLrzqN4V3tLY6amqFoN
	+OAYAmolRS56+6Q4N8rskERIbQHKtw64Iadb6nmAlbO/JRYS4BFzD4r2OS0OLRSMzIS/CENxsx433
	Ue1qlFxl01E1iafkaisMqkKiBuXWNcJX++7n+NZq5+IV05lYhnqCfo7TdlrMjXRVxvKXPh6YhUG6p
	cZ3pfPEpp3phhou/HWOptTv9yIwaUE/0iQkIb7GN2ZYkuQwrd5vqyrq8E/966ofG3DBJwGleH4S2u
	pMzljm8WGtD67TRu265Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ebu-00000005EuY-2kKz;
	Tue, 08 Apr 2025 19:27:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DaU-000000055qF-2Y7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE688A48FBE;
	Tue,  8 Apr 2025 18:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BB9C4CEE5;
	Tue,  8 Apr 2025 18:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136537;
	bh=eHdcGx888xtlC48ZA5KqHMbjHiCFTZ5zjevtdOgk8Z4=;
	h=From:Subject:Date:To:Cc:From;
	b=BvFRBEcl5OsEQi7f/QftnXa7g9jZZyjRi+h36rRb9nVHmg7uJlE73TTQvQyRn5/lP
	 CCz7CnVOGM7R1mJlPiucwR7aIBuRbyBA8yMv2ufrVMBRmykVP3EQ75eyC3F8NwhDMN
	 LhW3o5eX67JkPQROJPeB7jNVqI0TVFzTFtevv1MLc1UoZiGRFLzeUWB+RSWJA38hsP
	 oRVaxCgcVeA8c+hpq3bF0nDQqobZ8zTP8tsHJSbxOfXAKljc40pccb47pfcwGHJkE+
	 hIqBBtuoDHgcpr2TKjvym4QlMTkjr9TVqr2QOdw8p78oFppsq2kOWzTVxcpWc03L4f
	 MNBYQrymw3lHg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5.15 v3 00/11] KVM: arm64: Backport of SVE fixes to v5.15
Date: Tue, 08 Apr 2025 19:09:55 +0100
Message-Id: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNm9WcC/2XNQQqDMBAF0KvIrBuZTIxKV71H6SLqRENFSyKhR
 bx7Q1YtLv985v0dAnvHAa7FDp6jC25dUlCXAvrJLCMLN6QMhKRRUS3CZrqZRYgstJBadHZodNX
 S0FsD6evl2bp3Fu+gS6nhka6TC9vqP3kmytxlsUI6iVEKFG01IGtrpUS6PdkvPJerHzMW6RdQZ
 4ASoNCo2jStITR/wHEcX6/bJTb2AAAA
X-Change-ID: 20250326-stable-sve-5-15-bfd75482dcfa
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Fuad Tabba <tabba@google.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eHdcGx888xtlC48ZA5KqHMbjHiCFTZ5zjevtdOgk8Z4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlLibYUDyzvWj6QR2m2X0cD8FPDQOXDzOCKdBw7
 v4qG836JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpSwAKCRAk1otyXVSH0OjfB/
 961xgT1ybYDeYy1GntLMrAWWGvOVY3Q6F5R1f8BgjIVQ+5KfSEriODye3WBRgqL9Cb1g6qC74LsMvn
 Hb+y6f3wRTR+CFM9z3/i2ilTpyi/ffAa+H/9Vwt5vwNUyhldIN9VX1IcIVIk61ZbborgUYBYVBznK/
 YJurG1b7TrVrQE6Ysipc3lmVl8wlGwJzO0UO95YPY4HVAKLFDvSSIYJ/95ClMxQrDGqFtcCM2hUgmu
 ari3U0Mn0VvEcUtH6hSs4tPZB53iSaxYHbRL2GzCZHS3jPpgmUVRzQlBfJvBkILhtnxU/N1mISnDck
 GPDKxyb+jQD7ob2iBuovmj2CMsmScy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112218_776899_F34C7143 
X-CRM114-Status: UNSURE (   9.94  )
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
Mark Rutland to v5.15.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Explicitly include "KVM: arm64: Always start with clearing SVE flag on
  load", it was included previously as part of a conflcit resolution.
- Link to v2: https://lore.kernel.org/r/20250403-stable-sve-5-15-v2-0-30a36a78a20a@kernel.org

Changes in v2:
- Resend with Greg and the stable list added.
- Link to v1: https://lore.kernel.org/r/20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org

---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Marc Zyngier (2):
      KVM: arm64: Get rid of host SVE tracking/saving
      KVM: arm64: Always start with clearing SVE flag on load

Mark Brown (4):
      KVM: arm64: Discard any SVE state when entering KVM guests
      arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE
      arm64/fpsimd: Have KVM explicitly say which FP registers to save
      arm64/fpsimd: Stop using TIF_SVE to manage register saving in KVM

Mark Rutland (4):
      KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/fpsimd.h         |   4 +-
 arch/arm64/include/asm/kvm_host.h       |  17 +++--
 arch/arm64/include/asm/kvm_hyp.h        |   7 ++
 arch/arm64/include/asm/processor.h      |   7 ++
 arch/arm64/kernel/fpsimd.c              | 117 +++++++++++++++++++++++---------
 arch/arm64/kernel/process.c             |   3 +
 arch/arm64/kernel/ptrace.c              |   3 +
 arch/arm64/kernel/signal.c              |   3 +
 arch/arm64/kvm/arm.c                    |   1 -
 arch/arm64/kvm/fpsimd.c                 |  72 +++++++++-----------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  86 +++++++++++++++--------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |   9 ++-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  52 +++++++++-----
 arch/arm64/kvm/hyp/vhe/switch.c         |   4 ++
 arch/arm64/kvm/reset.c                  |   3 +
 16 files changed, 266 insertions(+), 127 deletions(-)
---
base-commit: 0c935c049b5c196b83b968c72d348ae6fff83ea2
change-id: 20250326-stable-sve-5-15-bfd75482dcfa

Best regards,
-- 
Mark Brown <broonie@kernel.org>


