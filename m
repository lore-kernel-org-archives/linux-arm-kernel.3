Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C723CC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNOyp6GigbpFbkWc21TYYEkbgjhm7GRBbYgFaFWOY4A=; b=qHjwAyO4fEvg99o9ri+6HGEVWD
	9OThRemOat33i11LCLX6+0ASeKVtmMy1DkHZ0Ia5pWYqY2+qLrSSsJBT7daqaAfPVjdkuR6TKdZkX
	LZhivsuTOk6/bhp3l7Pczztit6klLPU0WO1Nkx4QOhc0hpIfOV2RMrstZsPJQ+jC1v+mrXgGhtRZY
	GhB3mEHx75ZcOMFP9T2tD+vR3rRaWezlmxcdIireP82GjVkbeT/k6ShFDHRLMXUwoW61/1hotnwmY
	r5+0WAg6oyYlarLQy4c2rtREe+ikL14Nwv23CYBO5jdCjZC8gGHYOtSdFMeXcTP4fkJ3/e4z6CC4A
	FVPGrlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dfk-000000056jz-1n6b;
	Tue, 08 Apr 2025 18:27:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Daa-000000055rj-1gdl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDF39A48D1E;
	Tue,  8 Apr 2025 18:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3DCC4CEE5;
	Tue,  8 Apr 2025 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136543;
	bh=DHaryj/zCLrbSQFZpiYi3QKZgzGIpgsLSnX9179Q5K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D2Ppd5i4W+A1WmJFUyd6uuPQjtTKicLwsVf6YDcZAmC0qV9YADvJS0dMIvEEMk0y3
	 ee/K+LWSRm9iZefWkk8E41WYxUGP35gfjJG1sB0WLEmwLv1USasIyy1AsfKoTyI/VD
	 ebC0DVs5R9OrDKB/1o6pzg9lOrtYN8iIO+vBtqcPNYj3rZpKx2aYY6igrF5burginR
	 4etQQDuyBSAKGMo1vlLGfp+lhi0t+AwySNsnxpcXsVvJMXzBDtBEfEOTPzxPB70GJ3
	 llpDSQZTS5h8eVaV8DW3tTr9dr1O/f1o5+46sZaj7fx6fLYma0G6lBCgNKcm++Lvd9
	 ttRNNwZzvTtSQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:09:57 +0100
Subject: [PATCH 5.15 v3 02/11] KVM: arm64: Always start with clearing SVE
 flag on load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-2-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=06yjEiaT5GfiKOx7oXipPxuoURJltRxjW1MKje5sij8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlNXXxeqvd2CLOCotpZJXbf0hekyj7Jzjju625g
 ZKOXEd+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpTQAKCRAk1otyXVSH0GqCB/
 9TF13fM9RkX5iTdLahTVsnI3XOcb3c0bGqgpF8O+KkzOMaAI66sl6Nz6qF74i4If+djyJKwLGCWQ1y
 +euvFe60hGhhzlnbmJ7SMhI7M+hi1hjadiWuTCRq7uHK3zof4ibjJl3Iq6I/Ip8N9Njc5J+m9iHN89
 90cQRwvyugmwyTcWgd4vNSixakvZM8Egmedt6+rlf6IwRw2EGvbCro8sfT618cHmw4N1jcU00TQ3b3
 z9HM4hsi9a6l8HQ5w6Pulh5oOBpFarhX7r+TcG50k24Fc3sFEtn2CrPM9dVxEUmsi4lZlKnF8Gj/NH
 Hwwvql2qocwQt9XzF+6B55eXicY3ay
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112224_572125_7E17178F 
X-CRM114-Status: GOOD (  12.12  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit d52d165d67c5aa26c8c89909003c94a66492d23d ]

On each vcpu load, we set the KVM_ARM64_HOST_SVE_ENABLED
flag if SVE is enabled for EL0 on the host. This is used to restore
the correct state on vpcu put.

However, it appears that nothing ever clears this flag. Once
set, it will stick until the vcpu is destroyed, which has the
potential to spuriously enable SVE for userspace.

We probably never saw the issue because no VMM uses SVE, but
that's still pretty bad. Unconditionally clearing the flag
on vcpu load addresses the issue.

Fixes: 8383741ab2e7 ("KVM: arm64: Get rid of host SVE tracking/saving")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Reviewed-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220528113829.1043361-2-maz@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/fpsimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 2d15e1d6e214..24734bfcfaa0 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -75,6 +75,7 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
+	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }

-- 
2.39.5


