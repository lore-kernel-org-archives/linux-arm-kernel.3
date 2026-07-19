Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D3C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=; b=MJSJGIM/PP2Xt18mHzToG321cm
	oN/vnvqNXm6G6z5jAxHgt2QgxezYOlCghLx8UiAaIARXTt3emdi43qmaHxEwD/K1rcaKGsNFtY8JH
	ooZAbCOOIrUxChvsRGivTnkk8a2kBKN55pzMjJYQdfNxyVvTLU+D+5X1fg0vvl50uRqx1SKDT2Sqf
	+9ks4cvBu8aVyjUig8Zwo6OujpBmkcTcYTneUPe9ftCxGJjHEdavNCvoxXQoMsUjY1iH5TCzjM6WD
	wNECDMgYmBMDdOLHOVmSEnbfR/0IttUhECG4X2TIe/wFXQiGFizI2KrYgs02zVqj5Hh9csO40ABc0
	ATUIwslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlae5-00000005SHS-2JFw;
	Sun, 19 Jul 2026 23:10:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlae3-00000005SH0-0FYX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1624A4402A;
	Sun, 19 Jul 2026 23:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0285D1F00A3F;
	Sun, 19 Jul 2026 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502602;
	bh=/QjA1AblP9L+Kt9SpYOOkyJVVOOzYmepn7GTlwZFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EJ9sE2RiBUQxCFuiFPXydF8h+uV9Oy9JfnZoPElmM2kbR/b2HQejIeI4k1dz+0tfG
	 0P49uU3jU0v84VcJ6AD2Um3eelB7mOANMLTF30BVxg9fQXIlYVE0dgc15Vw0UhfwPo
	 IX9pugXmLBGZCV3UHjx5Zzl9MnJTfSoWWdDyD2WVfiyE2NzZvcvXFHWV5Ackr4rtBv
	 355Vo5lNfnAPlLp41NxPp8/0yEBmKzIKslEneDX5X7+sfpeG+rHXA3L5pVwgShi0ju
	 RwDG05tfDUJMIKG3AT5ecklSdjgHc8sFlKUQDPv5VMuCa8gLO2dU4U3G06Cv4bcurj
	 snfa3LAeqSBnA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:28 +0100
Subject: [PATCH v13 01/32] arm64/sysreg: Define full value
 read/modify/write helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-1-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gzzsP4OMBAKH5syutaWFaVFk6QC8CDQSj953+mInO7w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVkoZMR/6y1nJ/QvDSknCa6UuF/9J5+arAKAY
 E1vwX612VKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZKAAKCRAk1otyXVSH
 0CKVB/9VsKJu9cgSiiJyfHAFOEYwnpjgfc124TY52Kf6BosY1o36PT/bvwe8l2uc+BC88AVO8qc
 UYH/G90hEkt+KVOeXtuYPKuqjDap3wbBeoCBneyrdzbzRH2wbZqzYji6pqncQonOWyYVhBbLxtZ
 fQ4AqxqOeNqSdjoKAVGEhPKki7hQHZyVLgoYrtahZsV+StV98fdPqWPAA+/y4Mm4+2ubVUzH6s+
 XZ805kjF0PARqHXiJ515UsgZbK/t0dugTEE9Ey99qbxAx30nayxoM1M4utxzSpLUzyvEicTYFKR
 JcVWUZKHwFgqGR5rLjJCgC8Cat2hDBIpjw2GVeunOjuK9EaV
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

We have read/modify write helpers for updating bitfields in sysregs if they
have changed but we do not have them for updating the whole register.
Define sysreg_cond_update() for that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..4b96449e0ffa 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1235,6 +1235,12 @@
 		write_sysreg_s(__scs_new, sysreg);			\
 } while (0)
 
+#define sysreg_cond_update(sysreg, val) \
+	 sysreg_clear_set(sysreg, ~0UL, val)
+
+#define sysreg_cond_update_s(sysreg, val) \
+	 sysreg_clear_set_s(sysreg, ~0UL, val)
+
 #define write_sysreg_hcr(__val) do {					\
 	if (IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23) &&		\
 	   (!system_capabilities_finalized() ||				\

-- 
2.47.3


