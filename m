Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0370C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50Td2QFFbdeG4Q8vmrbU0VgLDZfZmFLv8+GForJ8hr8=; b=0+A3x3lvfjbYXpHFXpPQ4JAkJE
	mi6Y0JO0iCvpeIvfL8htLgNEe0yCqR/Vm8nFQd7jdczOA7iSEw0DVFJuvAl304gUf0oywdICpJJnG
	tyg9L4ffIipJSodWqJgueseeNjFLWdYwDx5fop31PresyRcTabsq2pLWES4kxAI+N5roFqb1uEvZK
	IZHTD1exGUgI8+Weoz7hopyP5MOarYT/4PuqTMfCP/xNr9jYI3GQiiDsbAiEGvSw6+K4PUA5jhX36
	KwkvmxaMq4tFDiDdM/298YIZKNZ2gnUChF3hRQHb4Rn6I8WgFpGUpS2HOA8ZhN3k8T0UB4QgM+3UT
	pH3F5MSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1til6R-0000000DHRm-0ERF;
	Fri, 14 Feb 2025 02:06:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til0y-0000000DF7t-0FkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 011C25C5BC3;
	Fri, 14 Feb 2025 02:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D08C4CEEB;
	Fri, 14 Feb 2025 02:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498471;
	bh=XKkgc2ILOcIk5OZtippiLeHcza1bJLfSqPNREumRZo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TIwiYkpbfwwAR8616SkmJGruf5XyQrNCGdKxu/NIsJDAEVgvK+gPhTrL2dsmJig0+
	 uhJb7W4STeUohsGvPAGGbSfP8U7Mn38w+hDl9N6xDa27kGl2Qtgt19hhNQNuDj/bAR
	 T9NmyYhqPX06nmRJiWSrmbU+JgB9HzbaB4K/dIE8XI7GlFbWT8pbi8fZ+6cn4UyZAI
	 IOsiqMvdPmVYTXHdM/dbtKyb1ZPYcT5X8Brlf8mNtNisCHrztHBh4bk3I8emn73ACf
	 hgRjQJe0eZpgrg7krEs4ww1YKO1Absj+KZo8xs94kDx9Nk0dQY0wUGVdj4WZzqE1Vh
	 LwMd+f1PSkgXg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:46 +0000
Subject: [PATCH v4 03/27] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-3-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XKkgc2ILOcIk5OZtippiLeHcza1bJLfSqPNREumRZo0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPCoUhVMtJEjvpA+QPVPDAXTGF2POU//l0shFXR
 9FqDoS2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jwgAKCRAk1otyXVSH0CQ1B/
 9AR+Gl+YtCX69mA6Ju8BvQmrPUol5Kqjmozm7grMCtnUYXnpKGXCfXTtFTOD+0KPTWtOuz7rbTMgPM
 PDbxzQn0WY8n2twP/Vqr8ZGlP35ntN8jLUQILxqHpXpvEeqVHPTlYYYnJgI7Fogyt6ACXZ0qlShy36
 RDrsSyPT9joYNzzuPyoEl+LpLUqZZE+VleDeRcclR5c6gQl/UbG7aTAZv2Wr8UYoBVrg9mrHF2WDDv
 XYDcLzJlwMyJybV2A7rAD9gNxjJpmBWBT+Hes9LVAVx6wpH2KBZdMbf85qP0ZPdnuC2t4OL7ZwrL9U
 1WHaTwS4MLi/SKd9EOMvaYhLR7r+LR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180112_192966_79188FBB 
X-CRM114-Status: GOOD (  12.00  )
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
index 446a379d87539bb37a9d4eb7466a73d8819afc56..a97af9daea472cc57bafc0564fdfe4e327924db1 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1955,6 +1955,11 @@ static DEFINE_PER_CPU(bool, efi_sm_state);
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
@@ -1989,7 +1994,7 @@ void __efi_fpsimd_begin(void)
 				 * Unless we have FA64 FFR does not
 				 * exist in streaming mode.
 				 */
-				if (!system_supports_fa64())
+				if (!fa64_enabled())
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
@@ -2040,7 +2045,7 @@ void __efi_fpsimd_end(void)
 					 * Unless we have FA64 FFR does not
 					 * exist in streaming mode.
 					 */
-					if (!system_supports_fa64())
+					if (!fa64_enabled())
 						ffr = false;
 				}
 			}

-- 
2.39.5


