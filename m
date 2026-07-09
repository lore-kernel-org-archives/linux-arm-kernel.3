Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bSVn4A7P2buqPsSBN19q3GFhevpNvbqSjxF/MHUfow=; b=fn5mRgy+y0mykzOj9Cj9WP6Q4q
	Hnd/3BUEFxQOSGixagUfoJW7GxmngCJ0ONCjVkmiGPdG3HpHWzgawq3zgxnI0s4ge+s7cM0lImZYp
	J1kOqmcO136NUZW8P4u4Hh9PlNw74ibTlxd4cPHkydf4Fp0+GrSGU+DxYIk/9CXoYE+5hTGPRQ4wn
	fMKksu0ROcw9dU0G50LDWNhXQwdLxne3or8A5ywsh/yT6A0e3ljzeKzNJt1xAlNmAegIClqbN0WjV
	ZE33BK/jdbQycpiqDYM+sSsQGZ/ATcdCNIZQKBrOUFa6TTfJWYVzDQS8PbwjZfGWYMwJHoplydf7x
	DuWxefXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whth8-00000003Gt5-0LfI;
	Thu, 09 Jul 2026 18:41:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whth6-00000003Gr9-1A0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2C096137D;
	Thu,  9 Jul 2026 18:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA941F00A3D;
	Thu,  9 Jul 2026 18:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622515;
	bh=/bSVn4A7P2buqPsSBN19q3GFhevpNvbqSjxF/MHUfow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hHF/IZz1Ta9NxvzXbrgAoQr7FPeQrc7btiAG99TedhzuZi0hnE4M2DtIGWrkTnAj4
	 Oq6fw/BhUkqIP5ZgyRL9lAaEy7gdYZZ7CkRNltfLj+xPg33uPOHDiIly27cPw58dJR
	 mjVkU1jDEYqYbCpCTzoIPGsSDo6LbttWupVgVlzskUSh0QE4ZMXUDJsPeu+ew8QPte
	 BMgrRKMpCYs0Ta4ESgz8T/DUmAQz8Z8qT2jh3lB7wsXJnQWzqTuwDmIx5s+Y4RtoaC
	 3jM4NSFIER4ybY7S8dw7Cktp0LGtCp6APsPob/lm1jWwavvfAbt0snzCa06yuZgsAF
	 RMjouo73fBBAw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:45 +0100
Subject: [PATCH v12 24/29] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-24-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tZf10BakJWINVrDfcuSYxIcK5/guAElrikKeFmB4JK0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r8JU49KyKGDpAOFI1HLxI8tL/Q3krxUnOWR
 SWMOiagbCyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q/AAKCRAk1otyXVSH
 0ImlCACFAAWNkDdIXe42uzKeF/ybrRNEroNV/kBk6OdMUcsyVMxABv/4XZo7lASAQk/L33JK+4g
 X0rlhQqFTJSqlrsDOZccQoTFD2mhqB0kkfoPJcNtY0LuA+jSQ+je96Le8Zn+KdBo3yaEHCMoCdh
 x7z7qZwQ/ucrWDldr1E7dB4tn7I7IQ++e8HQFJHpLH2+pWavZkUuMZpFM5tt9YeWr5gt/9mze9w
 clk3/8JVieuDHgOzpPSzC8ZfoVBN1THqxvZn8fIJoAr9gcZTIX+awgfcyECf8sdxX5zLigaCU6D
 5mI82ANhCFQtKthM7cZonJ+Z+KR88wFrFetyKTiPQdzWXZlk
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

With support for context switching SME state in place allow access to SME
in nested guests.

The SME floating point state is handled along with all the other floating
point state, SME specific floating point exceptions are directed into the
same handlers as other floating point exceptions with NV specific handling
for the vector lengths already in place.

TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
main guest register context switch.

SME priority support is currently masked from all guests including nested
ones.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 2 ++
 arch/arm64/kvm/nested.c             | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index cdf3e8422ea1..9df3cea39b09 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -42,6 +42,8 @@ static inline u64 translate_cptr_el2_to_cpacr_el1(u64 cptr_el2)
 		cpacr_el1 |= CPACR_EL1_FPEN;
 	if (!(cptr_el2 & CPTR_EL2_TZ))
 		cpacr_el1 |= CPACR_EL1_ZEN;
+	if (!(cptr_el2 & CPTR_EL2_TSM))
+		cpacr_el1 |= CPACR_EL1_SMEN;
 
 	cpacr_el1 |= cptr_el2 & (CPTR_EL2_TCPAC | CPTR_EL2_TAM);
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 50e25ab9b604..fb6087426f95 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1630,14 +1630,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SME, SSBS, CSV2_frac */
 		val &= ~(ID_AA64PFR1_EL1_PFAR		|
 			 ID_AA64PFR1_EL1_MTEX		|
 			 ID_AA64PFR1_EL1_THE		|
 			 ID_AA64PFR1_EL1_GCS		|
 			 ID_AA64PFR1_EL1_MTE_frac	|
 			 ID_AA64PFR1_EL1_NMI		|
-			 ID_AA64PFR1_EL1_SME		|
 			 ID_AA64PFR1_EL1_RES0		|
 			 ID_AA64PFR1_EL1_MPAM_frac	|
 			 ID_AA64PFR1_EL1_MTE);

-- 
2.47.3


