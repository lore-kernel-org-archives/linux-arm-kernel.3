Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C4BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1YjQDcqc3C7O4GZVmiEuYMkn4ZoWkhqgGV4ipiCncSw=; b=SR5CBX5ApQ9ROaM/pRDzvAoPhu
	zP40vRGmSg32pmYu/t199YrQp9+D3gagz0by5p1JUuC3qKtcVqAa32RWXRORiLDinew+UyC0eAX9a
	2csY3yduRhQxWsQZA0yYlaFgEHAnUpxZslSxtmXYfH1VCdAD3a2xd/QT7ZljdFy3h4sGUavcDVmhL
	3SBC+mtD/0KLQwUeJKEHLa2swCs+9DJn/Z1aMKEOMdO37j+EWlyXp4BwtGxs9ejWpDvul5XnK4OQU
	I0jAaoQU6bBW/ug86QfQJu+NwGkUPPAXCabj6GYfstX81Cs04gTxYYq0wEwaFOaNzHchURRFSxvvh
	Pn8kdBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5hL-0000000CV4V-11z6;
	Tue, 10 Dec 2024 19:15:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5gH-0000000CUtM-3UUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D227A419EA;
	Tue, 10 Dec 2024 19:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1CCC4CED6;
	Tue, 10 Dec 2024 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733858040;
	bh=EfGv77Fi7tVWJPf4Pn+GHdzo5MOrRQ9k328puPrALvE=;
	h=From:Date:Subject:To:Cc:From;
	b=LFoJASA4HdOUhUgyjJ5o9/BVB7ibjQo/l6eGQZOPIugfmaxw5bhqYX+ps5Ja5oqPV
	 8/yQKsXaKEn+tdEK9pltBIuZmg5VfZrIkhbd2Mj9XSjsH0wgjzxQjtGnfBm/PRO11a
	 BZM8Wi8rEmKvF5ER3Ztgw9937/NwdZaST17bubwwWp35L7uVjnITMFJIdtNvSu+6Cx
	 rXtZLjjjx7UYJkSVS00jh+EYcILsCakuiizufdQhtTbYq9A0jyLufIfCU1bhTbLqbe
	 IHTDqHMLBtzdrhTs7NdpBmFD8BdIJnH4gYwJawE5uS7wRMkYcO5iG9x7iuPDwc9HaO
	 NTdVUpF8leWMw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2024 19:12:58 +0000
Subject: [PATCH v5] KVM: arm64: Fix confusion in documentation for pKVM SME
 assert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-kvm-arm64-sme-assert-v5-1-995c8dd1025b@kernel.org>
X-B4-Tracking: v=1; b=H4sIALmSWGcC/4XOTQrCMBAF4KtI1kbyM0kTV95DXKTNVIO2laQER
 Xp3UzcqUly+gfe9eZCEMWAi29WDRMwhhaEvQa1XpDm5/og0+JKJYAKYZkDPuaMudhpo6pC6VPo
 jVc5XSnlA4zQp1WvENtxe7P5Q8imkcYj310rm8/UPmDnlVHlrJBjPWGt2Z4w9XjZDPJJZzOJTU
 QuKmBWQlteMSdHCjyLfSiXZgiKLYrS1oABVU//+Am/FLipQFNlY31bc19p8K9M0PQEBi0+UiwE
 AAA==
X-Change-ID: 20240604-kvm-arm64-sme-assert-5ad755d4e8a6
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Fuad Tabba <tabba@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2986; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EfGv77Fi7tVWJPf4Pn+GHdzo5MOrRQ9k328puPrALvE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhvSISV9z7ibKuu5d5/mmSNW5ze6yuukXJjYXr23KE6McV1hO
 44nuZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmwlnH/j+oVPqBnmtLUuwC5roX/7
 Oj2ZIZ7r1OVkgw/GW9oGFF2Ybpcy0DVTrjmJeZTXmgZyxqyfJy7kbGpsf6c89dWiK7kaNNjYXbMvhm
 s//nerldBosC1+4WeiT01k/wZQ//Mpv3DyTMTn5L4Hnvzdj96NKHq86PjbgtPnpfVJYw+Vzk+eZCcq
 mIXGyFxLnAYhX1iOjLHV3uWdxt5T4RYd9NmL2XzHQxU7PlO7ns74knl2XWPrHzdzpsfnnPnL91L+JW
 Kn2wYDdTyLn7QKv1z6TUQJndaRltubvnefRXqK33Ozb5SVk5k69GRZvSQZYvh9WfXr8j6HX4YMa66N
 8KMZfrjTpsFucz/P0d8T7DINEeAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_111402_007002_8DABBA6A 
X-CRM114-Status: GOOD (  15.56  )
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
---
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
index ea5484ce1f3ba3121b6938bda15f7a8057d49051..5fb9b3fc61ec7a53641d7a34a5d39a334a8f5f5a 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -93,11 +93,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * If normal guests gain SME support, maintain this behavior for pKVM
-	 * guests, which don't support SME.
+	 * The pKVM hypervisor does not yet understand how to save or
+	 * restore SME state for the host so double check that if we
+	 * are running with pKVM we have disabled SME.  The hypervisor
+	 * enforces this when the guest is run, this check is for
+	 * clearer diagnostics.
 	 */
-	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
-		read_sysreg_s(SYS_SVCR));
+	WARN_ON_ONCE(is_protected_kvm_enabled() && system_supports_sme() &&
+		     read_sysreg_s(SYS_SVCR));
 }
 
 /*

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20240604-kvm-arm64-sme-assert-5ad755d4e8a6

Best regards,
-- 
Mark Brown <broonie@kernel.org>


