Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D71CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk1EAKLTbZYRZiSaAbJXsh2aWdKZ9AQH7h2HG3UV8Wc=; b=rWjgMPQBBXSo2SoQ9uXr30dhfs
	xxNgZFgEdR654zqANVXDQerFz87kSgn+FnKt9dnfiEe6ZPmZuOoEJTOlq1mURyx9TbvXZr0+v07Yp
	hbEKHr6v5aDa3Qmj0rVRlNt/SXF3XchQhcHyWtnZogLJ0FdKUDjd62UWFnDRsSxTNR+eTQ/LRqW0C
	pgeBrndycgvqem1PWu21QKhNCegArfSd2dAVCtzW3JtequS4LuT0Dzl8PfiWP6EUi/PxrG9j7e1iO
	ybegdnW4O3P86YrM7PKP3aaAhu44yYqAZoWidzZAiLq2sxWPgKkBNfWdboQgVPg0aitfc5XzjiDL9
	UZM1c1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLKn-00000001hfV-1s9g;
	Fri, 22 Aug 2025 06:33:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzL-00000001BUb-1QC6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA96F44530;
	Fri, 22 Aug 2025 01:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72170C116B1;
	Fri, 22 Aug 2025 01:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827682;
	bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wwz3Hn43I4TquZgTqBapPavDvDPrSDY0GbGUdVMxjTCGrDRz43aE0Z4t/z/qmOtm9
	 WY69Em/82JCGfEbij5ZJxRkXaDKWLiXbJosNB2gXSpr+kJ74g8HHct0rWW6phMsWSa
	 o54Gs/nxoXHEYsdYsusgI9fJV0BEJhYPOBQyQrCe6Y3K88MyiOzKVJzQRwO2zQUPSS
	 EFhyiBMQKFQ3B+kgWfEmfKS/mh7hhzOjOEa2S/hlFYUqN29YgdNdbw+zpknd1lv4hb
	 iiHeLWQ1a+Qd5Jn4GC03qnejFMSR5GrfjaFXapoe92K8+38XYXDNkbANzhcjv2b+Xh
	 rX1GA7tVDcUNQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:33 +0100
Subject: [PATCH v7 04/29] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-4-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rg1wsJ3gpmGTtJKL2YMiJAj+B1RPC9bu8N2e6PnFCu0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop827+eIQAcHDPaqxZNzgiRFdwTfBj3rLnDk4q
 YKB0Ewgl6+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNuwAKCRAk1otyXVSH
 0E5fB/4vQ1VVoOwzKnTblIqSntVYv6to2xDnjsx05+jvOatP0D5l8W/MkuG25NE4GJzFiT7NIFy
 nhlID/y9VrgB4Ab4RZKT/jDKiSgqKUHYAkbssTQM9jiHDqlo3rOKk6k41lmV8r7L6Iq06Y+rE+v
 EeaEhzIXNKO9YknisQP9nCmr+eILqG2s0CwFvWh7Iml8CzxSkR3H5UhEYNO6pAs3c0lL3kg+eta
 FwKHivsn3UaWPKWo5yWNrAnS2v1rlmWv+g3r4ADjjaGZJlystQfEoy4PW67W8P7NofucKPk77ph
 WGNe/wQtOF3OLWTqR75LP550N18yIAT1b8cRZhozoNlgFYpm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185443_422162_773C0016 
X-CRM114-Status: GOOD (  12.60  )
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


