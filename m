Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0A7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CwvEIV3TMTU2REXnm0Mz22rBKUJNVsJJ+pvxJSu++g=; b=kTSyvyhGrtch+NhwLdxu+jro8P
	LDupcKIKuWxgJLQFHnlfNtr8/qmQ4qx6GK6nI/H8TrVq+Pu6LIFn83ktT6sRC+sWuiCmrJoETJ/0d
	XHSuD03/Q0IFVLUqxUIHsNWuTuxdpBViyu2pN0ZtP4D0KbEhosiUINhzHtW6g2PoTzu/2iNN4SzO/
	FzpIxQ6HZb/d3pt2BLs+gfUY1xvtjZhidUahMKKNKHf2CPjM04t75buQNsvMOPdTU30s5bEcToWcc
	OVGVXBD25tO9wLvqch95AMJfPvew21USgZAkBwqvKeLS3vGM7tlsNreQRFXwp5MkJiFGoy86SsfMm
	drdD+5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIfh-00000006UWo-08jj;
	Tue, 07 Jan 2025 23:07:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIZh-00000006TBg-2Ize
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02AB85C2722;
	Tue,  7 Jan 2025 23:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E54CC4CEDF;
	Tue,  7 Jan 2025 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290884;
	bh=W8fINH3OVANmdQFVX+js38cqXZpA2truKvR5K6znyyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EIw6FR02ctl7z3kfIqI2bf77wi8c0QSzXjcmC89JQY4MtldCUJEBlMAGfS+Hg62a+
	 kvBj9dnEDE97fx3gB74HCAYWmwPkDRVxvLogNn+p9pUhzUi0wn3P3/ak4l9ylgZpdd
	 SpZNgI5yPh2qQlblqT0PWDcMtlcY581OqY1A0pYTDCqPbhos63iw/q1g0s10Finvy/
	 Ec5CCOOPchxJv97KyXjiI+vN1Oml9ZCiiAkQvG30o8oVxOWSZAPdgkr64l+YeEtatt
	 oXmxU8oCcQlAAN5NB1Qe0LHekVsvuA//WbbtKcxDXYjbIXZLHJ3Wmz3m0Vnp5H3SMA
	 eVThIa+FZdLiA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 07 Jan 2025 22:59:44 +0000
Subject: [PATCH v5 4/5] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm64-2024-dpisa-v5-4-7578da51fc3d@kernel.org>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
In-Reply-To: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W8fINH3OVANmdQFVX+js38cqXZpA2truKvR5K6znyyg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnfbIzV51I9sDzW6LbaKlT3yiu8P8lpBGtSObfUDPC
 dCxZk+eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ32yMwAKCRAk1otyXVSH0Gt9B/
 0b/5GPo8kXWfskPOztZz636lKq/ggWtkvBpiGDk3Br01bpbV68JWvM7908DnByeyzUJc+qFlAbR9ye
 IpRDbQ86HrpsNJwnmC5egOBqY/snrduWGMd7BIvUdv1Y88q46SpLRYj9k9y6KwefDDbL9OsTZzwonl
 pem+BRHEvKdUI+06b6fGWV922/2SsbMcQG/Af+81uIUJzAjDxMHWAbK5vDoDFtzoCDotezmI5wv7I+
 vWST20DT1eAUliXKVw93xPYa7LIuuZQXQ78sr9EoWtzMPq8GvDC4F7nvADhXTpBzNr+VVmoa/q4Zhr
 xaFZLOiYk5Ri/uc4EHGNnE9IdvAhbz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150125_634492_5713E9D2 
X-CRM114-Status: GOOD (  10.58  )
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

Reviewed-by: Marc Zyngier <maz@kernel.org>
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


