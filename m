Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C69CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms9uExHOqDEPf+yIwQhJ7Hl7zWRQPXB8nW2psXFwGwI=; b=fOq+B93MBp6iALy9E4K7LNV4ka
	5nCUENvnMD23Kc6FjvPDkdyN+smH/sJojaiffLWNPN5VRB1r0gSs5hwhiK+c/ST9ezQ1L5/sEcqnY
	ayPfS13LlwEWzI9lhYTKUTqxfAAQ6Q59wkf6zkIViu7giOs+IULq2R4Et6J9WUSBROPWsCMBZ8uTZ
	JEHMtZxNfjASsRc1P0TUk9L5vkXN1f3JHUYuxvuEgc89WvR4HD3lRnycARdcW2bDqiM6RTAtgYkbh
	H+zza6SI3nGBQ14kGzD7UwyEtKfex23HhjlbAQQTINPcPIqM+9vE4Yr56ifwod94ns17VeGcUXtaH
	FFiIux2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol4l-0000000EJ1e-30MK;
	Wed, 20 Aug 2025 15:50:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojbH-0000000DzH0-0bVm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A01215C6934;
	Wed, 20 Aug 2025 14:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3746AC4CEE7;
	Wed, 20 Aug 2025 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699337;
	bh=giAvZ3PXu+lP80aoBjb8+UDhRd3O2Wn5C1lPnTF310M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ip7Z3xpdlFPHciRTuRtQr5IwnCqHeEVZBsfuT33VPsVwORgPcE5VL6xry2ycBwpnd
	 wfBPtNKzobitDyFkEXyvXYap5Kra9svY1TfddY4I4irNGLvzmRcxlMUBh99Ael7sU8
	 SK+XA+yakGm+PIHDRFCFMZyrhPF8nySXfrgOgIkZDBsw201vk0XO5AICUYWx7VptbN
	 hByEQ21LL0p6tg46AYAWXjAlMcG3aBED1qTOc+/kK3Ek/LC9fK2Z+tLxA+C+4375mo
	 7xKRYz/OlI0qfEhw4k40+IqULuiHrWMtVLhK6GS1x5sXNcFLXyDGzM5HGCS8kHO+s7
	 ERSO2efDs5Oyg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 15:14:45 +0100
Subject: [PATCH v15 5/6] KVM: arm64: Allow GCS to be enabled for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-gcs-v15-5-5e334da18b84@kernel.org>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
In-Reply-To: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=broonie@kernel.org;
 h=from:subject:message-id; bh=giAvZ3PXu+lP80aoBjb8+UDhRd3O2Wn5C1lPnTF310M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBopdhxlIgAp7F1QJGg1SOe2olWOjR5Wq6td61O9
 Z/r5ZBJiICJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKXYcQAKCRAk1otyXVSH
 0NFaB/sF6rAfJ/JA1Bq6Q2rjkPRJZTG7XGBeVzum/UOih8m/VQc5dqu0fxeJ/fLgNHKhqoVXi6Z
 OgYtSBmD0PQ5dHOixeZv6jLVpecMm+JccC3XfHFYJ7B1FOvWomyHCxCX3Wjf9yq+/pMXuUrXUzT
 4Rnxzh24AOsgIY6Oylf2Pcq4/IVf15AZypVVWVnauFa7aamAL7FksYJemt0HGaRUANCsj8OnaDm
 LQN3slY54dDZpGVMxE6tK/FArCwalKvvRKvG2F0eNCMNrfm4cySAFsgKfYLlNW6kmbFmp1w56OZ
 GQnZYsoILY2BPity3gkWlDxgBnNpzw/IOxtuh84UNXEz492q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071539_226857_A92992D8 
X-CRM114-Status: UNSURE (   8.39  )
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

Now that required functionality for GCS is in place expose
ID_AA64PFR1_EL1.GCS, allowing guests to be given the feature.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 592cb5d6497a..60e234422064 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1616,7 +1616,6 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);

-- 
2.39.5


