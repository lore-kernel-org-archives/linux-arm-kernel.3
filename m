Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A875C3ABC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCLAehN5m8iGTMC5p3lfZ/Jr1wsAiJGwZJkQGDTz6Js=; b=LfxBBqjBT3WfPbi+3IWE7meVGa
	myMR6jJzfmLTgznQbrPmytmQ4iOS2DBRJB1ewEPvW+BrJliio0tNNOV/Sgc2Vg1k70cdortxKV4wa
	niWvvbhgEZnKTWdX6vzLDKJAxDuoxT64LhVeh7N95aJPl7mi3uCdTymNNsAr/mlUn/7mR1aiXU9gn
	TIAr+xCQUOlmZUNMDpv/znw2TDw0FAQ+chc3Bc6xy4XVSAQVgbGYbU11W3SmmR6ltLgNjCBiBbQ4g
	FDHzjdrWxUdcMGVr7pJj4V1+050Yp2TssvgY5ShKjQJeOW+XKo+7Zr2JNJtTtb0xpRa+iaBwFfgjs
	IKXjJydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgm-0000000DWTL-1FGT;
	Tue, 06 May 2025 22:23:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOu-0000000CiLk-3SVl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2305A5C58F9;
	Tue,  6 May 2025 16:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229D8C4CEF7;
	Tue,  6 May 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549852;
	bh=cXLy+//a+Wbc2PWFhsn34/2XszY14fVQQbnlUcjHWGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ygth1+urekfiF1GRYwFFvJEHLIbPemK0bhY89b4zJ/liMXixm3F4MhM2NYHsUJHE0
	 vqC6Z/LsjU9njN3du52P5ckCK6DCNH1cFLGUo6dqNkIn1FQ8OYqG3G9yQxqOZgBvfC
	 wNs/Bly56x6rUS2/GY1R7v253Na9nwlKGVtGXoOTr1gmcwg4+9uqXnE1Oq7LVm6rAm
	 WG6621bg6lYO/U6wI4vCagZZNdvoOlyi7j0YMmtmEdKIuLY4VSHiE0l30j9+qJ9QWv
	 sIkMpq33EELMWkjzBSKlkL3SKtvomLbuYHExsxI+vwB67cOi6Ia1PGQ37mKBU/0cMv
	 byMxCmZNHrizQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOs-00CJkN-Cj;
	Tue, 06 May 2025 17:44:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 19/43] KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_LS64_ACCDATA being disabled
Date: Tue,  6 May 2025 17:43:24 +0100
Message-Id: <20250506164348.346001-20-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094412_945013_D8D8A182 
X-CRM114-Status: GOOD (  11.77  )
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

We currently unconditionally make ACCDATA_EL1 accesses UNDEF.

As we are about to support it, restrict the UNDEF behaviour to cases
where FEAT_LS64_ACCDATA is not exposed to the guest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6e01b06bedcae..ce347ddb6fae0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5150,10 +5150,12 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	kvm->arch.fgu[HFGRTR_GROUP] = (HFGRTR_EL2_nAMAIR2_EL1		|
 				       HFGRTR_EL2_nMAIR2_EL1		|
 				       HFGRTR_EL2_nS2POR_EL1		|
-				       HFGRTR_EL2_nACCDATA_EL1		|
 				       HFGRTR_EL2_nSMPRI_EL1_MASK	|
 				       HFGRTR_EL2_nTPIDR2_EL0_MASK);
 
+	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		kvm->arch.fgu[HFGRTR_GROUP] |= HFGRTR_EL2_nACCDATA_EL1;
+
 	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
 		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_TLBIRVAALE1OS|
 						HFGITR_EL2_TLBIRVALE1OS	|
-- 
2.39.2


