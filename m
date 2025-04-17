Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F32C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AhtPie7NzHkxaNruZltOZjBCvQYgqYWiIKVBsmIiAs=; b=kmKNunkgtNtcCVdt+E4lOLvsWj
	r9BLevq8GBRN7H2Ydl6DmNoF46+urhVGvmF8eDy97D6HcgNsdWz5y5E8pNRAo/uxktMZO1AbarGqJ
	Es2TEFnlg6J7mD/LpSDER3itJAyc7Ob+MYU7ZxR1dhQcVi3Un8XyQNi33o7Lt8nNsD23WLNK2j9d2
	HabZQCXlZ7c+nc8kEH9dL1RIkaiKpkSD/SSGEZpVNYHzUJe9Klr8l8YAfga7FbZiQ6sOBGxSdtC5+
	zscffIAHqeWoNJJqrNvqwMC4mGyigIBYtLrdXREuPsbr18863MOI7j6qAJdMPz0PwcTRgC8i2tklI
	UhIytvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DCI-0000000BJPo-3BRT;
	Thu, 17 Apr 2025 00:33:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D4n-0000000BGkm-1oEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CA79A4B0A1;
	Thu, 17 Apr 2025 00:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E07C4CEEA;
	Thu, 17 Apr 2025 00:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849556;
	bh=tPu3T/ssrLPDpFX8WvOwNRnWMZeoT9OAjrJWDn8Vwx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oZQLo9ydMVLxzdYzQ9RK60r1FW7dPEbCTAswkPteIJsmUr9GgXFv4hORixeSsURCy
	 1nA2hduyaKSogcRqAh4udgKbcrbK+aAWA4TSkbXQV3oIOa07NuoMFEXI0iPXYsd+Ra
	 j8OIsoTdAXXGIX9mK/P5fi27y85Z6FqHoRpwKLGIdemJpWddIfyExaGTObjnNWH63T
	 PQQyLLohAloBiBEBcFMEbqkNxYL/oJocYeaih47rsJFS8bxK4UeI2p1+D8ld2TCUaG
	 ptYMwS8zZ4O4kLQ+Uh6ge9YZYqzfFjgjCIv62eGnLxrO5wKxx3fB1u2iwTSJi2GrYb
	 0Iu6G1L+bXzCQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:07 +0100
Subject: [PATCH v5 03/28] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-3-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tPu3T/ssrLPDpFX8WvOwNRnWMZeoT9OAjrJWDn8Vwx0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEpxxYFzzmZ8wZSn8UroEkSMQbZKdAPgqAK1wThy
 CmeEtziJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKcQAKCRAk1otyXVSH0Lh7B/
 40Li96Qf1d/u6urBOWrA+jCl0rvogHJVY5H5GpHIDuVmr6+HdGdtQrG5obR2zPCrprSLLQe90fg7hR
 DFvslYEmd6jP6muZG32DInOuNHGtkcKpiwj2wMETd03Z+140KCFgGIPqiqnUYDZS5lqjjvziCOC0Lj
 WM8zMEKwcLDTbHjSLBZFFUmVX/VurzizBZQ8LFk3Sv5LvD52SFBalF7jP2KcfPJWxMjnvExXOR3vgs
 GCfJd/llnvJfqLsntJSmNUryVoxx8kwgqGGek+nIhC5kbQ382lH0bwXQq0Tzzw8yuvfJDPCGGqehS+
 b1VMi9LCt97sPMvJHga3V/84q/gvR/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172557_611334_E2E72583 
X-CRM114-Status: GOOD (  11.68  )
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
index 266ce7a9f195..83a4f8d3e895 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1913,6 +1913,11 @@ static DEFINE_PER_CPU(bool, efi_sm_state);
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
@@ -1947,7 +1952,7 @@ void __efi_fpsimd_begin(void)
 				 * Unless we have FA64 FFR does not
 				 * exist in streaming mode.
 				 */
-				if (!system_supports_fa64())
+				if (!fa64_enabled())
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
@@ -1998,7 +2003,7 @@ void __efi_fpsimd_end(void)
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


