Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE50C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7PKOIoyVvjGczbzWM0LcwxGwjrpNW1A+ekbU+ZKanpk=; b=efGe6HvZV+l/Ay
	YBxfAIXUoaKzg1kpNq6Qtwj+Nj3rv7xTvpgy3YBs4BBjcIOjp5MZOmXCmMBIiYrweSYhtU/LN/Ok3
	9NLZLlyKbCPF8Rdyz7bbZLsQnPD2pFBtY+tRZULD6KKDPIRUZAof0fG5DShSNWOI2N1CtvACh9QpP
	GYY1roXTAqfvT5Su8hUxSAd/LRCxwp09OR1Kd24DtHv8FR9ZbE4o6PMJ1xDXY/gvefzM6XS8wEv3h
	KVzdcAzMIUrpIea5eYALEKfazbb9hTDn2U3QyRBfjavfUYynKVgdqPuvgzPx8RB/aQ2MQt+WQD/ek
	ojqFvM9fWki0VW8NQlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07ep-00000007Qdu-3VnH;
	Wed, 02 Apr 2025 23:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07OF-00000007OF7-2Xhx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E7105C5B33;
	Wed,  2 Apr 2025 23:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599CBC4CEE9;
	Wed,  2 Apr 2025 23:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743636056;
	bh=nX3/gruz24nzISNsLYUs3H9vqQmZwbmWGJB7cUGfVoE=;
	h=From:Subject:Date:To:Cc:From;
	b=Go/Ed3Cwz/alHDySGecwArKJVHQHZ1FiDwWom+1wYsVT3Usv/pWCphRpdwbkcjCUy
	 qsIIpr7lSAElm2FpzUok2EsykLU1VTbH0CAKJWtJS7MtY0Em8sC6ASdCwMx4UvkGzt
	 +78zmwiSD7ELL37ErjeIV0cz5h5z1/V6skXrO52aS6p5nr5gier26m3B5oiBOj4RDk
	 KkpTdTiwta9c21E/bUj02YLk62/pyFp0bZwB+LaH+UwcQszJOqceUy3aWtukwKRtyD
	 JFiNzkE1rRovBAl86Er2h2hP3DzX0MeR5uQzXGzLz8cm5hLjm7uwDgniSsCUjh6wRm
	 hKBNB7W/f2CLQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5.15 v2 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Date: Thu, 03 Apr 2025 00:20:15 +0100
Message-Id: <20250403-stable-sve-5-15-v2-0-30a36a78a20a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDG7WcC/2WNwQqDMBBEf0X23JVkm22lp/5H8aBmo6GikkhoE
 f+9Idce3wzz5oAowUuER3VAkOSjX5cMdKlgmLplFPQ2M5AiVle6Ydy7fhaMSZBRM/bO3tk0ZAf
 XQV5tQZz/FOMLuNYMbU4nH/c1fMtN0qUrRqPoz5g0KmyMVcLOaa3o+ZawyFyvYYT2PM8fURId9
 bUAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nX3/gruz24nzISNsLYUs3H9vqQmZwbmWGJB7cUGfVoE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cZLdrB0NO2dtFqvf0MXWLWp0zeFLn8mNybRYe1e
 XZtDk0yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3GSwAKCRAk1otyXVSH0EkJB/
 9+jsZvsVXLDPs6gcGZVxpGmfa//H8yI2IrfxewqHudBfTQOgLqbs5oOQpH7gK1HD1HjkcjO9nrBvTV
 ZguofnrYaUcdjZUx2jPX7WQC+16vQDJajTLeLtcMdGuLrwpLUV3hOZwjZZIwp0F9ONX+NnCaPeBdJW
 dJtvP4O0nby/ZzzOpg8VReOitP4c3uRSXhXvr444ulUHfIigt0+8RLKiLGIaWj6cL9p+8nCfz8p0TA
 QyksgcZPw5IisW3/LMfmSpeHwA7sIcPfcZFTGZV8oKSSMah+y2y+x9xInYjcdiMalI4kO9ckHZLHwm
 CqVr1OAguVRimiy+R2aGXkMjUMrEjd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_162059_733688_B61AA9CC 
X-CRM114-Status: GOOD (  10.14  )
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
Changes in v2:
- Resend with Greg and the stable list added.
- Link to v1: https://lore.kernel.org/r/20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org

---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Marc Zyngier (1):
      KVM: arm64: Get rid of host SVE tracking/saving

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


