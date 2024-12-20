Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F59EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ7h11kZly3QoJFMB/N92RRhyJ1v9jBfDMSQ8Nj7b88=; b=oQXkm++2YFl97WE1ngLG+p15hr
	cuU12d/eXVgTWm8RcX1uTBxvT54tS2WyNpaR5fkr3Szv6h+YZvL8+FDE6MTVBNA9/Tb3sEr4gLiMt
	2p99KT0qamwprCRgHG12iaDPOwLs/Z718ID0guFOmWbcVlftwd4lEyXC88aRTY3M6SvF8QMOdJT+M
	2DfXTh0tzspTLPntYuSFNue/O6DKa8p+Jx8gncIAbQiG3vzxCFp8Jv3p2wmn/c/7S/x6FDGFBraue
	mSxxXawSl2ICSOwTq7QxeOUuFd7FRcX0+DzZ1wJqx1iQGIFahjM/eWs66aJrMHMhiRyaahtFnDjho
	56hNkq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgIv-00000005X4X-2tco;
	Fri, 20 Dec 2024 16:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDV-00000005VtJ-41aM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WZ7h11kZly3QoJFMB/N92RRhyJ1v9jBfDMSQ8Nj7b88=; b=GXa4Qlzm7nGlgbrZ9tdyK1b/Pt
	4dmV0cvmN+q4o8mUru/NTymDp7yeJBkekHfh/d0xJfVS2iuWnLXtURhSe7zDkD5ML0r8AwXJWFa2h
	BgLHKC9EpYHnew5UPpMAb2vWKUokIe70gUGB5C3Q4ZcOikq2019+w6qtLUuAEma4IjgfiHEr8/K0U
	LTpv1lXGWUQUa3kOqpI/zAz4Vi827E1AnqjOU43cMdg8raxM5Ps8h20/cUWSP035ehwcMsidD6mRe
	KpaWh1+eCUzH+jgyH0YeYQnJuve5go4mS2CJgY8yZ/7zIHCjTZtRbArlK3yTB5tDUvg2AY/S2TIzq
	tMJ/3B+A==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDS-00000005jSa-3X2L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59103A4202B;
	Fri, 20 Dec 2024 16:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158D5C4CED3;
	Fri, 20 Dec 2024 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713465;
	bh=a79dWEQuz4lN5+ZR85xtsyqrLMzIRNiH+ZgTGzqkyTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j+DXmh56L3Btf6+Rvx9v/lj7WF1rd1Mf1XID8Z9kAZ3M+t5+t8gJOxAkz3uNTEm4/
	 elq75KEhDQt8euIshEsiS6gE1x+vWWacdzIGscAXsAGkxRGCO5D8HGFEjlDPQblLrk
	 avtWc3gQBWXU/gf39yUAjPsExinlsxFtLMZ8C4A9brZOdR+hhw6IuT9UtrkzVkmnAU
	 VBx4t8NVEilPraTk/+T6zvMOzRwe/MyqP1v/BLztsNE0itaP3FzTXTcVnC26TVeF9q
	 l3Falxc5SslcFF1e/tx4KinHyAV3FBzGQ66QqAQqfmwWWjDrspDE54tZmuqc7ooynM
	 q1b58utBo7FnQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:28 +0000
Subject: [PATCH RFC v3 03/27] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-3-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a79dWEQuz4lN5+ZR85xtsyqrLMzIRNiH+ZgTGzqkyTk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBW2Hy1qulZq7d1XQX6Oaip9UEsJD/p5OTWqqfR
 SoTdq3yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgVgAKCRAk1otyXVSH0J1/B/
 sEiIHvTFQypVacv8wFQ6IUikCeXXpGO8HJ3ETxw9BOn2LpiB1GMEA3dSd5oYMRAzbciGfQc6HXaKjb
 KUU3+CDXVTd0j1bVkY2+HVgLUrNYO4iKaS9nV0yV0+0+cU1i+A7F8m42z5GpiMMI+/+2LlWKNRo9wB
 uSxHSAbWxSkIJfKei5WM9jDeDU8yXHm2p2FwO+v+z2+R3KODeUZp1JsFjhvTpkCnMOYZwTmhN7ZZ2k
 v2hprIvZlNsDYT6zFrC31afAfa8iUKZqY8Lo/hX+zbxHRUIq7cDWuYXg2HFe5JFcrClWkb0rrwYV8d
 HgU+PccmqKURz+Egk40B3ty57FkAAx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165107_389490_46943639 
X-CRM114-Status: GOOD (  11.39  )
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
index 7c66ed6e43c34d1b5e1cc00595c12244d13d3d0d..a6f9a102fadb0547b4988cb5b0c239ca90a262a0 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1980,6 +1980,11 @@ static DEFINE_PER_CPU(bool, efi_sm_state);
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
@@ -2014,7 +2019,7 @@ void __efi_fpsimd_begin(void)
 				 * Unless we have FA64 FFR does not
 				 * exist in streaming mode.
 				 */
-				if (!system_supports_fa64())
+				if (!fa64_enabled())
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
@@ -2065,7 +2070,7 @@ void __efi_fpsimd_end(void)
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


