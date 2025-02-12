Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8520C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmuEXf1MqNde8WSAXAEAqHcQUNMxa4IndcTrL+a1x4g=; b=zb6z/0HYH7yXXNVmhqhhapdfLO
	xYsL1GpCmuiAvMDsvD3BHS5GnOG3PR52ka2q7G0JUApfoSJEjMmwxuftKknUZYRNjtYX2hldLSmqT
	z4Tal+hdRMgeFMU0h7J9OW3c76zh43xEO4PAIduzoz47cOrd8Nttwokwm7JSnhglG/x1AucvY4yy0
	YmdNdIZcKr6sYMoZP+eVbe/MNxIZM4grVJjL4XChhTO+IFNfwMl4Olm90BGpxWj0hkNJBv5FpbgF1
	N4hmQapLGwoiTe2cUnqXimNbQB9onT9W25BjqZ2LuDGCGntYOUkDv7UcVuvtq81CPPzKKrv6p89xd
	YoCwEj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0u3-00000005kDK-1dk5;
	Wed, 12 Feb 2025 00:46:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0sd-00000005k0Z-3Ze9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A21A5C51AB;
	Wed, 12 Feb 2025 00:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDBBC4CEDD;
	Wed, 12 Feb 2025 00:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739321130;
	bh=5rRoChObeNqNxfmbCbT8iUIfiBHkKWAFVjiyqgK4VdI=;
	h=From:Date:Subject:To:Cc:From;
	b=lpFYXFUt+KAocrDCcNBlhRj+YexM6svmmv4blnBwr7/gvIS9+zIFa2M0plNMl0vIH
	 egkj2HURSf4Yz6L7zsKrF+g4KSONRNDVuTrLYiIv5LPewE3N7dZNY3f4HzYn6Laqc5
	 8bLm4IlbNyv05uJZfeCKuIfpArbkGgCT+7gKAFzvC40HA+iKQB1AMrqQsMna0HsvUX
	 vhlHU5x/Lks1kf0dytJd8JBlwm5jIRsFTHuVrWyWPkxzTfvfU6GJO+aP/CEkj0XB6f
	 HMLDIzLgeqkDXBeMcPGUHnz4+lUPlsVk0dZssZ3PNLE16oOah8UPNVRmgNiiLMIa1N
	 QDEcxZzugEODA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Feb 2025 00:44:57 +0000
Subject: [PATCH v7] KVM: arm64: Fix confusion in documentation for pKVM SME
 assert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-kvm-arm64-sme-assert-v7-1-0f786db838d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAjvq2cC/4XO3UrEMBAF4FdZcm0kPzNp4pXvIV7kr7thbSvJE
 pSl7266oKuU4OUZON+ZKykxp1jI0+FKcqyppGVuYXg4EH+y8zHSFFomgglgigE914naPCmgZYr
 Ulta/ULRhQAwQtVWkVd9zHNPHjX15bfmUymXJn7eVyrfrP2DllFMMRkvQgbFRP59jnuPb45KPZ
 BOr+K1gRxGbAtJwx5gUI+wUeVcGyTqKbIpWxgBCRO/2v8BdMV0FmiK9CePAg1N6r+CPwgXvKdg
 UY9DrEDgT6HaK+laQ9RXVFO+F8qACdyD/KOu6fgHzMGksFwIAAA==
X-Change-ID: 20240604-kvm-arm64-sme-assert-5ad755d4e8a6
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>, Mark Brown <broonie@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5rRoChObeNqNxfmbCbT8iUIfiBHkKWAFVjiyqgK4VdI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnq+8nYl1hKlgAf8UHLSYhrZpD14NjnmH5zjzaln2A
 iud10pqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6vvJwAKCRAk1otyXVSH0LWKB/
 9WcV7yweaKsEXcht6lTbS/nW+jDulcbredFQ/S5R3OBygrOiXxhYUMUhYQlRIExRnXH0PDMZTvaSoQ
 zMyBGJN9tL1+P8UhBZTQGSqJp5Gl2l8g92E0lzW25OMVlUwPh6+znCOVyuB311NRYle1PwpH+jHfWv
 Nl76YHN6j2/owhMof3gXUwZ5u3rgiM56wATZzD0IlpoqG34LEqY1TEHn0k+J4CYcZrjJOZH3aynwLC
 QcigqJizzoQ1tYUz1QBgmMYNE1g+bm06HQFRe+BZRLY3wzI7OR7FDV7RhoVuI31EY19Py9KCA53Fpb
 epELU9TEUOZqVllh1DSdfdIRe/PAbq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164531_988165_22CE0164 
X-CRM114-Status: GOOD (  16.93  )
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

As raised in the review comments for the original patch the assert and
comment added in afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are
disabled in protected mode") are bogus. The comments says that we check
that we do not have SME enabled for a pKVM guest but the assert actually
checks to see if the host has anything set in SVCR which is unrelated to
the guest features or state, regardless of if those guests are protected
or not. This check is also made in the hypervisor, it will refuse to run
a guest if the check fails, so it appears that the assert here is
intended to improve diagnostics.

Update the comment to reflect the check in the code, and to clarify that
we do actually enforce this in the hypervisor. While we're here also
update to use a WARN_ON_ONCE() to avoid log spam if this triggers.

Fixes: afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are disabled in protected mode")
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
This has been sent with v6.10 with only positive review comments after
the first revision, if there is some issue with the change please share
it.

To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
To: James Morse <james.morse@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---
Changes in v7:
- Reword the comment.
- Link to v6: https://lore.kernel.org/r/20250210-kvm-arm64-sme-assert-v6-1-cc26c46d1b43@kernel.org

Changes in v6:
- Rebase onto v6.14-rc1.
- Link to v5: https://lore.kernel.org/r/20241210-kvm-arm64-sme-assert-v5-1-995c8dd1025b@kernel.org

Changes in v5:
- Rebase onto v6.13-rc1.
- Link to v4: https://lore.kernel.org/r/20240930-kvm-arm64-sme-assert-v4-1-3c9df71db688@kernel.org

Changes in v4:
- Rebase onto v6.12-rc1
- Link to v3: https://lore.kernel.org/r/20240730-kvm-arm64-sme-assert-v3-1-8699454e5cb8@kernel.org

Changes in v3:
- Rebase onto v6.11-rc1.
- Link to v2: https://lore.kernel.org/r/20240605-kvm-arm64-sme-assert-v2-1-54391b0032f4@kernel.org

Changes in v2:
- Commit message tweaks.
- Change the assert to WARN_ON_ONCE().
- Link to v1: https://lore.kernel.org/r/20240604-kvm-arm64-sme-assert-v1-1-5d98348d00f8@kernel.org
---
 arch/arm64/kvm/fpsimd.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 4d3d1a2eb157047b4b2488e9c4ffaabc6f5a0818..e37e53883c357093ff4455f5afdaec90e662d744 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -93,11 +93,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * If normal guests gain SME support, maintain this behavior for pKVM
-	 * guests, which don't support SME.
+	 * Protected and non-protected KVM modes require that
+	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
+	 * host/guest SME state needs to be saved/restored by hyp code.
+	 *
+	 * In protected mode, hyp code will verify this later.
 	 */
-	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
-		read_sysreg_s(SYS_SVCR));
+	WARN_ON_ONCE(is_protected_kvm_enabled() && system_supports_sme() &&
+		     read_sysreg_s(SYS_SVCR));
 }
 
 /*

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240604-kvm-arm64-sme-assert-5ad755d4e8a6

Best regards,
-- 
Mark Brown <broonie@kernel.org>


