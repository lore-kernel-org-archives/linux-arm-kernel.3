Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386EDE64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=os7q9rXpWyMafYgSJToWOi2Rk+/i+oOAwv2yJX0cn+4=; b=PySFi97mkw7hGOOxROsNe2Zg/x
	SSQ+D7b0PyVfj7seYqV7fpOyX9u7sPxh1hrXukgsvOdKN1A6fMEm7aSIbRBErCr1OXSbXk2FITqPJ
	PGnXITDSyN9CWSUnVoyoX9FkYTVFX9gajaZLPEWIV/8dpqxN7u9LTkmjM2AL26BVjYl2FSZ14rm8Q
	TwnX3VMoeKNuO/zS8ww4Nxe83dRWGcwwAvnr5XHyi33jnX2mXFWOYzuGzu9ydBxQpEOq0O1W4ulpa
	beGrwG4ZSMRtO05RAfJU8LXPqlsg/2YN2D9Bf5Phyt7AMIcG0NurwFA+ymFuRLKEiCTk2GQmkyQcs
	je/twvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISSG-00000009W6t-02fG;
	Tue, 03 Dec 2024 12:56:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISG8-00000009T9B-0344
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0852DA40B55;
	Tue,  3 Dec 2024 12:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B10C4CEDD;
	Tue,  3 Dec 2024 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229847;
	bh=cKym5jL1wVVG9G/7MeEDQVRM4fdPvM6wIXw2UfuLn2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=doa94yYBy9haMntmlbm8c224q3RdvwGeJTtBfIuunDMuxA/jckdpBeET9N/vCXe3M
	 P/uZFfWnsV1iRI3k/HVF1BcJ3/I/cMP+Dsw6HpYPcCyDX/qPwO6mKJ+8Liw122qs3b
	 1wUv1tD9bLYY4Nl7EBPUHMkyAWLElHjBhyEjmZM2+cuPejgcem5Anoy5Erw3jH04S3
	 BXXL2CbhjwsJ9rGrw9R1FxFgMFBK/J+oCFcfM3r9QqbmOTrc8TJRstbJzqQtQvJdbO
	 f+KNGpv1/24jPu25x+aLSbVSHFg/JixPYpPPpB04UkcA72SvDlfAD4XPL+PgTk5Auy
	 2qVax49I3Hmrw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:27 +0000
Subject: [PATCH v3 8/9] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-8-a6c78b1aa297@kernel.org>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
In-Reply-To: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cKym5jL1wVVG9G/7MeEDQVRM4fdPvM6wIXw2UfuLn2s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz6aOsLhl+VMGWa2eZFsaOppvS4Wo9lfr2bBE7B
 cuzMesKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ078+gAKCRAk1otyXVSH0DLMB/
 wM1MdmguAMfWES2WtJrEu9ppWGk1VrwOELT9b4yycTmmf8cCrot4U5+T0rMCUJjKDXNi63T+rWFwYz
 6KNVeuiw4ea+juUNnOwWXQ7eqa3DKo0H3tmVFdVCDxNJ7FHEkPTwjBz6j3mIYYrTHaaaPxVHmeAQHv
 GdNrKyGFVcHTOG6MRUxkjfQ0hl0vnrbmdedoMHP/93jYVp9Yau9VzUgWbxEwn0pEgUnqkv4IMUzyIK
 O5q/Jxz5jN0aMb94BV1AzLeCk3nXFEWu6JZfCqX8wYjnVL3qntlOsc5KMulVRXPj40KqEitAbJN7+D
 lbu4yAt6hmPywZJ7M19w7bz2ddCz2x
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044408_117879_2974D43A 
X-CRM114-Status: GOOD (  11.26  )
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

ID_AA64ISAR3_EL1 is currently marked as unallocated in KVM but does have a
number of bitfields defined in it. Expose FPRCVT and FAMINMAX, two simple
instruction only extensions to guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 83c6b4a07ef56cf0ed9c8751ec80686f45dca6b2..6efbe3f4a579afd1874c4cf844c1c1249ae8b942 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1604,6 +1604,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!cpus_have_final_cap(ARM64_HAS_WFXT))
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
+	case SYS_ID_AA64ISAR3_EL1:
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
 		break;
@@ -2608,7 +2611,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64ISAR2_EL1, ~(ID_AA64ISAR2_EL1_RES0 |
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
-	ID_UNALLOCATED(6,3),
+	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
 	ID_UNALLOCATED(6,6),

-- 
2.39.5


