Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A65D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOe8aWgdR0ExOUgevQ1MjSg/ROxYuT19+tq2GA2sN3U=; b=zQm8BGGUp1OYPFBJYvU9D1308/
	3ENYx3T86MwEcOZkxkPDCHHJtJ904jzmnd/qsjnr40GruHMnjNSH+70YByxGgDMDr3xVQ6czJbyCw
	TcAm+v1TKvF6HAPTUhgqQpUwY4/LhFeITRChV4VcNwgZ1mJTNvO57Lb1lIjd8sH43bwYa413grNMq
	Z74ZQ6O6rEFaITSUix9Iio+CXybUVRJdJpY5b62W3RiQ1zHozeOkPQ+j7cQAXgewZFBP32SqPk6p6
	pILG7FRX3thA413EQDzzqVu8gNVr3EG1syoTKksTE/3r4VDmakVsMO+YH36M8Mm2g1axxY1N2z5tu
	7/H/8wOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6B3M-00000000y9F-2Wf5;
	Wed, 30 Oct 2024 15:56:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoY-00000000uXn-03kU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AD9F5C5FF5;
	Wed, 30 Oct 2024 15:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BC2C4CED3;
	Wed, 30 Oct 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302853;
	bh=+e1UOR5/B0UfboGAjExW6hKwnbL8AeMxgKnzh/ZXops=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZiGplVAKP/U0sPI3zrjQwlgrORoD/Amz8RG2YL8LiSywrRHN2Cx53shmKrHXi4ZZJ
	 IMlUNexuRk0B8sjORDsqyFAqjW1SKjOVbu9fRGtRl9g/o5D9vcj7ZPEKyqffWetv/E
	 JwBkxiBpEonNAu2wwn2th5ekYTPmreqO3QpewtU43MtXa181QlF6jruQrUjazvErD3
	 bfNs6BFcfhM0IFx2hL+0iNtdjF1iFQBzLx4KTvk9vrLiHCTUXhB8+8pUEO51KjrbOT
	 JauqfSLvvl8JsupLyDuZ3w6lkWvBrfI/8IqPKuqccvrQH+LMYwapChXM63t1Gbw4nA
	 tLO+LsNaiTFFg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:53 +0000
Subject: [PATCH v2 8/9] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-8-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
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
 h=from:subject:message-id; bh=+e1UOR5/B0UfboGAjExW6hKwnbL8AeMxgKnzh/ZXops=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNnMV/Bo3GWRxDAxp2dKrn2r5xbzZLI28XXcyJj
 S/vf/W+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTZwAKCRAk1otyXVSH0MmrB/
 9Ayd4qbzVp0FBgF+pAqcgt/GZZQJDrGD3JEkOkV3oLoZ6HX5hGK1EC20D2lyeIhou+1QN7T3fPf/g6
 hAym5gRgz1U+7RsMrWe0kL3dOVZJa3RWzBnEgLvZhAu3H8z5PPbnzjzsgeu4YCahJyWAiwJYoGJkmC
 DUiRdx46Ue7gTazRpesGHxh4bXETEnshESOaBNS0eyjd4bI/yXCEJXhZ4fJBcY0p9USu0L7omP+1qr
 e/y0TbChayabDX6HcYTAGjePCKLKa68Yb+mRjImKIc5G/9KDo3A4NHCIhSd4cqbsgJPYyH46/ViA7+
 HLJE52nGLzQliFbGhwJ6jJgsR7t8Yl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084054_140717_F00EBBB6 
X-CRM114-Status: GOOD (  11.08  )
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
index dad88e31f9537fe02e28b117d6a740f15572e0ba..926b6a1b2d2389e95721ce577740a2fb740e4f6b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1546,6 +1546,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!cpus_have_final_cap(ARM64_HAS_WFXT))
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
+	case SYS_ID_AA64ISAR3_EL1:
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
 		break;
@@ -2409,7 +2412,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
2.39.2


