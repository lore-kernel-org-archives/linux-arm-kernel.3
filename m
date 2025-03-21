Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CBBC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 00:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPImoECNbENM7viwFxVkoaP1eizf+cwwG4+z1GAykAk=; b=OrLaw4f3rkkUst
	3q/+w8x7QGdb6jpsz6lw01rcQiUV/xIVW489ISXQ5/yeye6VBTEa069+LoNzYx4hQW87mcQ82ooND
	sV4zyLtGbs8m9Cgx3eO3GpICt+g465EnrESi0yRJ63yn+qmS4acYAX4TWdYatD1YPjLHm22i8aGfz
	rSVCWlSTENC/VjW2HjuECZIBizVgThaUmOiX7AIP50eiApJ0rMgi5hQOraffjh4WMGOjaUlmw/Vle
	dFKrqu7U4KbEvZ/qf7CL2AXb7ru5U9zc4Jvle6FBvpPJhjUxAZKJR/iNKnn5h7rRHychKSv/ZgW8V
	lOA/nUu8uCPndffWlfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ1b-0000000DWpN-2aq2;
	Fri, 21 Mar 2025 00:14:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPyE-0000000DWG7-1Qwj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E091A49763;
	Fri, 21 Mar 2025 00:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1F8C4CEDD;
	Fri, 21 Mar 2025 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742515838;
	bh=UnwmEOzkbVYA12kIeylZ6mRzOZdlCojdMzHgIqtEWHg=;
	h=From:Subject:Date:To:Cc:From;
	b=h8G17aTXy7pKB7dyU4WVLaw42gkw94O6XAMEfaS3aQnsrNmFmPTaTor/HkUgy6nFZ
	 tDzudy0Z/oT3KtveAIGQM/x6igV8OEhQyheHxruDNoGH7DmiB1wyexwZA3iE9SiN9k
	 QibC0QttzPFh9F5CdTbkNPIPapAQ3UzDQtDdYODq1TdBydkiR07/QqgW26BlSx1soU
	 yfRVfEvDamE2bM5e64ZrMWkrU7E6Qi+fUtpD8WXcD69etMilrdpQNbitD0I2smoslz
	 50jGqPQ/JE63txaELirqjPK7NSxu2o8ATN5Ba0WRc5sruJvpM2Xt2JzcqlpD47fRXy
	 KQiEUywJgPB3w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.13 v2 0/8] KVM: arm64: Backport of SVE fixes to v6.13
Date: Fri, 21 Mar 2025 00:10:09 +0000
Message-Id: <20250321-stable-sve-6-13-v2-0-3150e3370c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKu3GcC/2WNwQ6DIBBEf8XsuWtgVWh66n80HsAuSmqwAUPaG
 P+9hGuPbybz5oDE0XOCW3NA5OyT30IBujQwLSbMjP5ZGEjQIIg0pt3YlTFlRoWyw2Fi43pxtYP
 TUFbvyM5/qvEBqpUdjCVdfNq3+K03WdauGjtJf8YsUeCkrRHaKNc7fX9xDLy2W5xhPM/zB8DQU
 Uy1AAAA
X-Change-ID: 20250227-stable-sve-6-13-5ceaf408b5f7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UnwmEOzkbVYA12kIeylZ6mRzOZdlCojdMzHgIqtEWHg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn3K5z+OUtTc8Yn+JX7kpLLlAGN05FTJOgpvs9yukl
 5RHjDbmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9yucwAKCRAk1otyXVSH0IDuB/
 9Qx4rfSQv9RPjp4QcG5wJW92CPAHkXG0TJCQuGzbqNllI333pq6rZqHS3xbJBW+tTqBOK2D47PCNLZ
 TwKkUeEE2V4oXfP9VfSVii7YsX3zgKiNJzmJXccaGRNqZjpdoM6nprl9N/5E/Ypchg0s6XJAk4OLvF
 zng/O9IcBn6yg5yKu6SDB5O2iCfnZZm+j3LiJDIaYGV9dPBtRDp2KB/uXIBry+dypUiDiI/nanQt27
 NA+peMIwULuUVSfgw4eaHTE1NWC3C962IKydHWzbhyssLydTRgi6xgusBnry/wSdGSM0OIIqMyzBAF
 Qkj4F4RPpYiXktijmdIYj1PW6/bD8Z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_171042_513526_CFBA6A78 
X-CRM114-Status: UNSURE (   7.77  )
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
Mark Rutland to v6.13.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Remove an erronious kern_hyp_va().
- Move standard cherry pick to stable format in patch 8.
- Link to v1: https://lore.kernel.org/r/20250312-stable-sve-6-13-v1-0-c7ba07a6f4f7@kernel.org

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
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  11 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  30 -------
 arch/arm64/kvm/hyp/nvhe/switch.c        | 134 ++++++++++++++++++--------------
 arch/arm64/kvm/hyp/vhe/switch.c         |  21 ++---
 10 files changed, 201 insertions(+), 292 deletions(-)
---
base-commit: 648e04a805652f513af04b47035cde896addf9b0
change-id: 20250227-stable-sve-6-13-5ceaf408b5f7

Best regards,
-- 
Mark Brown <broonie@kernel.org>


