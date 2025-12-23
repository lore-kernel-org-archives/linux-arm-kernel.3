Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B21E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FmHld6C7D/jvyq8IPj92Nc/LN1+ZQgtd9ZR0K2p74Y=; b=FPdqdebqxCNxnn8oZhMptMZE1s
	0fab7ag6gFqJ/3ki5AIv6Sa1excCdJxYiqvxey8k+PEz0tf2hL2spUWcbwHvK7GdZDfALeLd5zREi
	ODR1ANv1SPeMA9IxXNCcT24lM+Lm8Fi95QrF1y0pzcGPOM66GKATpROZqK4l0fdaKnuIVYwggkwKz
	3+W9doEBCgo4Z4DQIWS3dwBxU1xi41v1k5cw/wPNO9h0WP02Z5mhjLs4Sh96bQ+veX9b522p13rr0
	9SWpYilAq5CVADsd1wWqN/ktqo4x22JzHcPjHZmYO5N7uw63x8hZIslg0BR7yR//JvXOSS4UEuSm9
	yPCb9niQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr62-0000000ELLD-2lgx;
	Tue, 23 Dec 2025 01:21:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr61-0000000ELK8-0gHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 462AB60172;
	Tue, 23 Dec 2025 01:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275FDC19422;
	Tue, 23 Dec 2025 01:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452912;
	bh=wS/Sr3h3O9OGRzttKyfjnEZ56/U90EAT24zyvgc9Crs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NCRgEV4Kpsov+E9xvN2oqiENZrZmI3cK1QfAEGgL+6TEdEaBRQ+TkqvIlNkmt0tMY
	 M4pFTGj4mkpfXqyEEmGM3vZt87+ZXH4YJK78gh1Vfhh1mAu1Q10GeOEXQHoV8+2YZg
	 sxJfXBikOufoBdkliAIb4aueDqZ3Ca5A1HM4OT0opWQieykAM3gtVQ4sQOjLFhcVZx
	 uPW/Rqh/USCV/wi7OaDPbm0vmA8DzbLzp/QJ4mLnlysI86abk2NMsBcMG0dQ3xJI+W
	 PITJ6HsijJbh0QLe/hwLWKWLQyeZpy1l5gfg2zDoD3Fatc+K5AEPWfnuAowM4AVvYU
	 JULYuYvv9MeSw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:20:58 +0000
Subject: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wS/Sr3h3O9OGRzttKyfjnEZ56/U90EAT24zyvgc9Crs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6FOp/yeFdQmWsIDTjuHRv8lf47vDI2UyZQS
 cSy5dLq5y+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnuhQAKCRAk1otyXVSH
 0FcjB/9jxj9yHS7RtIqKmD88+ux1RuhFty0fPQPxGsOatiYtfDitIClUYiqlQe5PczTHfVw8vw0
 fEldJX5Zh5i77R8pJL4zR2DJ6LSqoWkxYToLw8aAw2nrhlSAWNsdGBOIRzb6YKgkzCsfr37KC1c
 ELgf+8Fitx4EJcFcUwPObrAWPiC7C0gMdHZob6hrtLeH1xZSDZhMoJUk0eo5jDIob/nzvG1G3Sa
 rOvHSqywKra3AIdZQJc0P6OsyrEGzptWIr03M5+tLzNBCkknJ8IDDf/ijO6tvgTWpim6574o0em
 cks9cs0ZBC42gOiUFnMZMa7WG3dn6eVmIOS4H4Lfk/zaUClB
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

Currently when deciding if we need to save FFR when in streaming mode prior
to EFI calls we check if FA64 is supported by the system. Since KVM guest
support will mean that FA64 might be enabled and disabled at runtime switch
to checking if traps for FA64 are enabled in SMCR_EL1 instead.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 887fce177c92..f4e8cee00198 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1948,6 +1948,11 @@ static bool efi_sm_state;
  * either doing something wrong or you need to propose some refactoring.
  */
 
+static bool fa64_enabled(void)
+{
+	return read_sysreg_s(SYS_SMCR_EL1) & SMCR_ELx_FA64;
+}
+
 /*
  * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime services call
  */
@@ -1980,7 +1985,7 @@ void __efi_fpsimd_begin(void)
 				 * Unless we have FA64 FFR does not
 				 * exist in streaming mode.
 				 */
-				if (!system_supports_fa64())
+				if (!fa64_enabled())
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
@@ -2028,7 +2033,7 @@ void __efi_fpsimd_end(void)
 					 * Unless we have FA64 FFR does not
 					 * exist in streaming mode.
 					 */
-					if (!system_supports_fa64())
+					if (!fa64_enabled())
 						ffr = false;
 				}
 			}

-- 
2.47.3


