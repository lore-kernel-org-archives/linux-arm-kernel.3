Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E924CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk1EAKLTbZYRZiSaAbJXsh2aWdKZ9AQH7h2HG3UV8Wc=; b=vAoTasDb7+mdf9oS6u6P7zLiv/
	7g1sIXhxUCNtbrdKcvMgmQaelSeHVeeEO4PHZ2RwjCBKfvmjLZvIB1UQROEb+n69OTJVJRloJkCAR
	RlhdQUNTKYAPkWU3AFm1AkYa0GoRbdo3XNA7hFzTLzWilxvL37Lgd2lFnwshJauYpGOiHQ68RcX6I
	9INNCVlzjUXEI7mCGg4NLkRjozaF94aa+HmzFCQusF5A/2g1Z1qwus9Tz4H28wh3AXrN4ZF6ZiwY3
	OynuDaLshhzqK0JCpF9kvxPeHAxF/M4/Yj1ruDJKrtbiJBEIPChXm7A53VAS0b/emQNAnmqKIa0vz
	HANml3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQxW-000000000XE-3dcb;
	Tue, 02 Sep 2025 13:22:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRH-0000000GydD-06e0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 756C260206;
	Tue,  2 Sep 2025 11:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1E8C4CEF7;
	Tue,  2 Sep 2025 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813478;
	bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r1ovcLNfwVDXL+bXxzf5PSa1rUsPdW+5HC0nyoDrUBhf8Q7fZkimaoas8YJ0nLoEF
	 msIIKeGVrnqVEEx4qvi9IaN5J3huOh9ZMNGzM2EkSGmSEIUa0+aKXesdbNnfhZHkfY
	 5fs723DlvsUqcy4gYffMWWSegvDrEgFpe3XuzbHkCmki4tn2HvOEWBvEiwCk0GEQKz
	 xLv/FCTxT9yI4FEXwaGwF6a27wPBvyx3a6pIWPqZUay5aAPsuehyWZgdqlyoZp9uHz
	 lPkUAQpntbVdlaPWRh1GF0yxr4ywWpbccDEOrm4lpbxExtJARuwicq2tOFrEyYnwfr
	 kyV2hO8I4mUcg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:07 +0100
Subject: [PATCH v8 04/29] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-4-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBotth9vlQp3HEcNB3+1aXZEyLLW8Xg5amiroyT3
 Uc8RlPjvACJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYfQAKCRAk1otyXVSH
 0NlcB/9vVs/g0odZcyA1QsPFpOgkZ8RK1EFUEQuzEG+2XZdcsZ+x/l64QDrBpjtGxfUI9iRdMsf
 6kV6wWYZ8CbZ5en6OkpoKOVbaS0uVoveAvevSmis/ZH2z+63X1rj49SfTIhaXRD/MY/I80AM/y1
 Rx7ZxRWKFZ0cbZyVwLsRjzEq6F3/UzcJkRxQJ0Cpk+QdOKs/JbkcnFN7n2VQXpPgi5p1IQGJwCq
 T8sUEs+3f08NUp94pEr/szprnByKwuh/R7/sXJKl1o4lXX3bD16XA7MYnUWo0vpVD0MYMqyA34T
 LF0fDuJvEgDEsGIhZ1N1z1ttj73BN/Jhf4LnSW5Z1/Wo6x3k
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


