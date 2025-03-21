Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9889CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZjahGEv2jM4uach5PMFtJO1VaFRBw7CFrDycIm4VKI=; b=c3FQK8hkVMBeEd
	9CRFlPSOEo4ectaGgQ3MpXNkHpuKF4U3sDo4pGlztD3ru6soo+dZz1vBLGQfdVYvKK5Cc74BnqP4z
	J++nl10DroJ278vPp6XPvLTxS9C+HD7j2nZzpuXULtyjMvzv+IyWZt4Fjkt98Zh0SEsHPM/RGSBDq
	RZZHOOpBeyprUtgzyCRvx2K0Vep1FrZ4fPwWPkGBlVoym9tjZAtnQqxWOhCeU/PaaguaT/4GfKgDA
	nGNDJB7hbGENKD2Yl2A+sgEd0y8SuTp66+/VMKG+3mylR3RXNPGXo9R6GyWDNAVPuf7Bl26TGl9+s
	mCbRByJ9IETAvpdAY5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQU2-0000000DaBw-2ysl;
	Fri, 21 Mar 2025 00:43:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ5W-0000000DXSR-0LOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCE81A49752;
	Fri, 21 Mar 2025 00:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466B6C4CEDD;
	Fri, 21 Mar 2025 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742516292;
	bh=dvhT1x6Ha/Bw3B4z5pvPJgzucOfIcxXTWrysjR2AUWc=;
	h=From:Subject:Date:To:Cc:From;
	b=ulWeySvh8YdBAo7/FElflQU0cGv8AA20m4HLZdkoA/G0jaO29R1WxRZN9tomWe3ft
	 nCV2poG9HtnDyGz3W41YCYbZr8OSkyVgNa5eB9n7IL3amiq4fq9U0fdb1IpagzRETs
	 tqCQOEGkNGPnIJjBCyaN286fdpkKCKaWI0rPMlsryyltpyI9ifi6HiUG9SWZTABmSG
	 j15B5be0Up73FYtoCKUrxoHmO1CYJxOA8yqHCsOg/dSVpw/5ptPY5XjnFnYRcDlPGf
	 4vkHyk49TtOQKqkyhOq8prmCXHD1wx/X1DxF8psoDeJbhjzUmvBYa7lk5GNrG9DYuO
	 APqGmG5HPeQ2Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.6 0/8] KVM: arm64: Backport of SVE fixes to v6.6
Date: Fri, 21 Mar 2025 00:16:00 +0000
Message-Id: <20250321-stable-sve-6-6-v1-0-0b3a6a14ea53@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGv3GcC/x2MywqAIBAAfyX2nGEL2uNXooPVVgth4YYE0r8nM
 ac5zCQQCkwCfZEgUGTh02epywLm3fmNFC/ZATUajdgoud10kJJIymao6czSGrQ4dZCjK9DKzz8
 cwFYWxvf9AOgK1oFlAAAA
X-Change-ID: 20250227-stable-sve-6-6-e795d85262b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Fuad Tabba <tabba@google.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dvhT1x6Ha/Bw3B4z5pvPJgzucOfIcxXTWrysjR2AUWc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn3LA5cYCOUGD0j+Pj7wZW0yOsmn9hdBQ6c+Yp9hER
 gFqRXaSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9ywOQAKCRAk1otyXVSH0JFQB/
 99tT28/FPj3pkLM6WxUVEfV8quAOG9hreLrrKJnwNip1y07g9HgpGljI3C1zEfjxGHrjowI+kOJ3m5
 t7J4JeSyZE/l94QN3DwbUJg/dcKFbtN+CynVntKX35HHDiy986dwPLY574Vhsk+XH9JNfWoHYYJl+8
 9lfiMaIR/eg4T76w50kpNCY2Pg814uTdzdM8K3OPjyOFS34aWeYP/9JbLo/zLjgQwy+dH8+6fdJjE8
 75AC7++QyqsQ1ZSDL0bpcx+oj+SusDNkplAnNt1P6Wod5ryrduFMo9uqKpa41vxmWFw+Sy0GMfCCtk
 gmTQ7FlaN+ROWODLt49p9UywFxhcLX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_171814_257856_29E34948 
X-CRM114-Status: UNSURE (   8.44  )
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
Mark Rutland to v6.6.

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

 arch/arm64/include/asm/kvm_host.h       |   7 +--
 arch/arm64/include/asm/kvm_hyp.h        |   1 +
 arch/arm64/kernel/fpsimd.c              |  25 --------
 arch/arm64/kvm/arm.c                    |   1 -
 arch/arm64/kvm/fpsimd.c                 |  89 +++++----------------------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 106 +++++++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  15 +----
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  29 +--------
 arch/arm64/kvm/hyp/nvhe/switch.c        | 106 ++++++++++++++++++++++----------
 arch/arm64/kvm/hyp/vhe/switch.c         |  13 ++--
 arch/arm64/kvm/reset.c                  |   3 +
 12 files changed, 182 insertions(+), 218 deletions(-)
---
base-commit: 594a1dd5138a6bbaa1697e5648cce23d2520eba9
change-id: 20250227-stable-sve-6-6-e795d85262b9

Best regards,
-- 
Mark Brown <broonie@kernel.org>


