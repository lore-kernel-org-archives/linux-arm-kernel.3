Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB3DF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bamg8/ml7PrtWHn46LWcYHhnFixhVO90fDKjcr9yHfo=; b=B+bNO1SY08sF/l66DjiSHE+GGY
	McUFAjiA/uweIN2nKkIO8Zugp828bweHwuqJpLd1oDHGkeUZ9aloCGAyhO+hw49bCGw12Fnt9fQQt
	IaHD2hwz4q8i2Z/Ozl+3r+rYmfZeOAcarNQUsginZp1WkvD5R+OHf9M7DoRcAJFSlpgfwG2WpJSZS
	sUP25kxSPpwttj/QDxUsaie02MkbBDNyOmkX6Ln4Dn/CbyuXDlgywX6myTsJjJJveYWAPkKlZCvGe
	OBTe79hEQsRs3HbfnU5lDsbUONSkE+eRblKW/qzQlc1+XiEPSLR7KXUF4whXfKTR7mqJ1YC8KX/OW
	Etmovo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w0-0000000210S-0Ch7;
	Thu, 05 Mar 2026 14:44:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9vz-00000002103-2udV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE1E661850;
	Thu,  5 Mar 2026 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A428DC19423;
	Thu,  5 Mar 2026 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721854;
	bh=c9Fpr1Thyeh86mf/IzfwmmsmZmZJ43SuIK2fQQSl31M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1OCncZlCb2IbW/XDaHO+OHThv5nJBpCClo52khj2+5pE0g5FtF+R1vMucV9dFoGJ
	 ePFIV4ey+Cx6uT+BOzWo2RvPBluY4CPt/0Xl38C0aVkMGzDSUTANPHiqyhsmGkF/j2
	 sfIVZUQv6G/DLLV391Ui7q5CHLaw8Vp/Y3BQ02rn3mYC74sKbTXv4ZiVt0B7GJ77k8
	 PCkG7gsO6xhel5yOUqhBmWhlxPc24Qj7DvsiSgcEiWuu5S0u9NOnsjSYgEkYX7qchG
	 S5095qghVnaC/AWneOI6cYMtAvslJXF7QJARakypeksql46yHiKt816unkLNiv+xzL
	 B/btBTPytKNCQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 01/36] KVM: arm64: Don't leak stage-2 page-table if VM fails to init under pKVM
Date: Thu,  5 Mar 2026 14:43:14 +0000
Message-ID: <20260305144351.17071-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If pkvm_init_host_vm() fails, we should free the stage-2 page-table
previously allocated by kvm_init_stage2_mmu().

Cc: Fuad Tabba <tabba@google.com>
Fixes: 07aeb70707b1 ("KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..3589fc08266c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -236,7 +236,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 */
 		ret = pkvm_init_host_vm(kvm);
 		if (ret)
-			goto err_free_cpumask;
+			goto err_uninit_mmu;
 	}
 
 	kvm_vgic_early_init(kvm);
@@ -252,6 +252,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	return 0;
 
+err_uninit_mmu:
+	kvm_uninit_stage2_mmu(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
-- 
2.53.0.473.g4a7958ca14-goog


