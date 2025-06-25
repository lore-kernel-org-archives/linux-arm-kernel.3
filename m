Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60667C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk1EAKLTbZYRZiSaAbJXsh2aWdKZ9AQH7h2HG3UV8Wc=; b=PIsdzt5OnpTWXRe2SnAyh46cJM
	lhPi7K5mMXPWLLmHufdzSsUHWMmRYCbZhoMYlzUE6Mk9MdfiXXK4m7wZJd106hxXhQQAFYNjAq0Bl
	6tsYO11vOhLU35aKKBjh4sHqF8cJPhWzseCTjMI1uHsg4o+pMt4SuytDKDRc+JqX2W2gyeLGoFykD
	7cosCdlvyJu25dyV4xNA46cUIXyMORMyExdp05bMA6paTWm83CEiYQOXsL+27b+3zWFPttskf3LdZ
	k/rSSlmM0Ek6th1jROI+ez9CRKmfXW/4cmZi+yDbe/1x0VAgYNX4sDxfqrWwmSERQtmtBx44I4UbC
	RhZJy9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURk0-000000094Ry-1cAX;
	Wed, 25 Jun 2025 15:08:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFO-00000008Sgd-3dtd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E54CB5C626D;
	Wed, 25 Jun 2025 11:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6899C4CEEA;
	Wed, 25 Jun 2025 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850698;
	bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RpyGyihbqD4osWIxx766bzikgutuVsKv2kJfogvSQEnJLKvfPgZjow5BFr7eKrJGd
	 nVqPnK7Cpb4hKmlat/8RsQSDh/COUmxsz1XlYw0goEgmZp13iy0v8MGXVI/Lf1PoDw
	 jCEoNrvmDSFSCwkerikaVSufhU+2xOuRm8RuWMB2k2jzvZvsvKCptrlnfPDr8idu9y
	 PpBGYTMjijmlabT2Hzw2rtehx/CnqFK+tYK/sfmeRRbNuWLUQTHF39I+ZFpFdd+EWM
	 WQ8Iwy5KES4j9XxeZbSJWT+KwRVN1Vwn7y14Awldipbl6+w94dzZTVeO4RmHRzmFWJ
	 ruVERYfHrHkqA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:54 +0100
Subject: [PATCH v6 03/28] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-3-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xnioDhhGxNI6CJ8F21YKG6+7JQI3B5kNGiW
 oZlAcAeLtCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcZwAKCRAk1otyXVSH
 0Pq3B/0W/8d0AqujRf5FkiOLjTfmDdxP+CMDwt08arRHr3OU9IGUWwK8fP0bRQjvTFWITJo2TN1
 jSRYk79ugbeXg9Q3bQb6v9u38fDCXclXrv7w4v6E+E2I1rjGmOxB5d8uzL+9ukCFnouTU6vDfO3
 RkOc2bybDx6DXcn8J7iXNsxcXnhcFxxfwgU7Nd5FfR3yPWWaX8Yt8oPdZ+VJp4CskT6cQ8NOr6t
 mRuaWfVSwywiiHzJjNNKO14bkTT0IbEGaAWVagyNR8M+W6vKY2y07zPFH1i8hnttzC2hfTr38Ij
 t2f98tbcw0eQBm4QeNRVBIwtByNMvrtz4p5A/Y3aj15aDMZR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042458_990239_D45FD529 
X-CRM114-Status: GOOD (  12.46  )
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
index 77f9dfaffe8b..de2897d6208c 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1908,6 +1908,11 @@ static bool efi_sm_state;
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
@@ -1940,7 +1945,7 @@ void __efi_fpsimd_begin(void)
 				 * Unless we have FA64 FFR does not
 				 * exist in streaming mode.
 				 */
-				if (!system_supports_fa64())
+				if (!fa64_enabled())
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
@@ -1988,7 +1993,7 @@ void __efi_fpsimd_end(void)
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


