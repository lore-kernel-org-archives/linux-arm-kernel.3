Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE2EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v/wJhtRheGrBNk/eUbUsf7vIX1j+RdTlIZyw89qsPRE=; b=veQl4EIpVapdL1
	q5aQi9KqXfrnBdibjPXm4qZLW7oo3pgyBP8oaWMN5Up04wFz36eruhs2Kg4p5LnOmQZCDRK6tiMz6
	uQfx4XkZgbV8XY4qbo2+eaILJyBKJSn+v9oUVF9//x1MEZ88kEhAYwGG7Yswhz4ejVVtdy1ShiDdI
	qjTmRDepaf5V/EPGxgMbKy5XEkV0Ix84wDHwgBw7vK9gdsC7X2pSBF2SHL5ZXCgX8u7bLMBbtODC4
	Gtpqoqoo/V4YH+dDvoucRaWxD1k9bytH1Wq2+gOoJfRRn0Jvmv8HEQUO+C+dQGQDh3c/dOpV1Lvaf
	cSaJLhnx+CViCrR4auGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9QN-00000006mPD-1uSX;
	Tue, 25 Mar 2025 18:54:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9LC-00000006lTt-2Dkb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0E41614C6;
	Tue, 25 Mar 2025 18:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6957FC4CEE8;
	Tue, 25 Mar 2025 18:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928564;
	bh=dMnezC4ayMJ3IPQofFQCbhpFIaP/JJW0J5RFebyBYdI=;
	h=From:Subject:Date:To:Cc:From;
	b=r9UKjknPytbiyC8ao3vIlO3IHvjjOX8QhbrJNZvHHIJ508ceweEL2zWK2U35kW0VV
	 QhQEW0kyHmJckX3j0r/aYdt9SO1KAMZlS/j9XwzwPKimMQ+DNRZpdzxzgrGzr/997x
	 6uoDcrz0Ms52ftX+bquYJNW8H1/1aq0Gz5Jiq3JK4CPIygImx4vv70Gu+7d633tGLE
	 Hx9TxrWedwBpHXXO/kBzeomkjBC2bjV1wf0HwWDPoZbFeIOTKkzyyn7L592vP+wKYT
	 BXjxsDR66+SDGvPf6l9oly0m9NkSIa49zhGK/OWxMCpVtw5/F0ocJGvwaPDCtzIySZ
	 c6S5x7vGvIqXg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.1 00/12] KVM: arm64: Backport of SVE fixes to v6.1
Date: Tue, 25 Mar 2025 18:48:14 +0000
Message-Id: <20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/64mcC/x3MSwqAMAwA0atI1kbaSCt6FXHhJ2pAVBopgnh3i
 8u3mHlAOQgrNNkDgaOoHHuCzTMY135fGGVKBjLkDFGFevXDxqiR0aNFU7nRUu2G0peQojPwLPc
 /bMEXFrr3/QAySG3WZQAAAA==
X-Change-ID: 20250227-stable-sve-6-1-075c1295b363
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Fuad Tabba <tabba@google.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dMnezC4ayMJ3IPQofFQCbhpFIaP/JJW0J5RFebyBYdI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn4vqmCPwzcGSfTLOgeQzSiZW0IL4tQ4gwy2MUcCBh
 H1gZPsqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+L6pgAKCRAk1otyXVSH0Nb/B/
 9HIGw2v6yKXfbS3mLuw+X2L259feQoMEIwZ85e0Cjq9BUN4+xY/sFb1ruNIZC3voVU3DiSdqEes/yV
 FUZGE1lcMQCHwiK9XAT5Bwv8xsMZWKPjjN5n6C/o78Uutl2Wm0H4DK7B2XmifIeFX5VXmR/Ul/HWHq
 maG/Aq34b7vfa05OkX3JpGME3uIPlenoVStzJU5EuLJG+lnhRHpS0qOACLvHSvT0Js9Nd0WkrjjDuw
 N/bclxtZP/mJbdTEE+gVt6ETuDfgBR0Bl5BPYnBDOSq7CdpHTfzdyt4PE/R0kRhA8PXrIMKdT/Ivol
 mwY1eD8ShrnljyxTC71ePoBLmRM2Oe
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

This series backports some recent fixes for SVE/KVM interactions from
Mark Rutland to v6.1.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Mark Brown (4):
      KVM: arm64: Discard any SVE state when entering KVM guests
      arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE
      arm64/fpsimd: Have KVM explicitly say which FP registers to save
      arm64/fpsimd: Stop using TIF_SVE to manage register saving in KVM

Mark Rutland (7):
      KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
      KVM: arm64: Refactor exit handlers
      KVM: arm64: Mark some header functions as inline
      KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/fpsimd.h         |   4 +-
 arch/arm64/include/asm/kvm_host.h       |  19 +++---
 arch/arm64/include/asm/kvm_hyp.h        |   1 +
 arch/arm64/include/asm/processor.h      |   7 +++
 arch/arm64/kernel/fpsimd.c              |  69 +++++++++++++++------
 arch/arm64/kernel/process.c             |   2 +
 arch/arm64/kernel/ptrace.c              |   3 +
 arch/arm64/kernel/signal.c              |   7 ++-
 arch/arm64/kvm/arm.c                    |   1 -
 arch/arm64/kvm/fpsimd.c                 |  92 ++++++++-------------------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 106 +++++++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |   8 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  17 +----
 arch/arm64/kvm/hyp/nvhe/switch.c        |  91 +++++++++++++++++----------
 arch/arm64/kvm/hyp/vhe/switch.c         |  12 ++--
 arch/arm64/kvm/reset.c                  |   3 +
 17 files changed, 259 insertions(+), 188 deletions(-)
---
base-commit: 344a09659766c83c42cdd4943318deabde89a9c3
change-id: 20250227-stable-sve-6-1-075c1295b363

Best regards,
-- 
Mark Brown <broonie@kernel.org>


