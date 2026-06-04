Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5CACD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx8Q3lCGNmWi6X5YDYYuwkPijRSSNnRUooDmPqenZLY=; b=q4hRHDsSWZ5nBNI222dAAvPvQb
	SXfCh3jhL0EZT+2yu/CkgOgcH5+2X2N3daNAViU+QEu/6S57rfqCGQi8NKGqhK2xBIrZM6aCPtPk/
	c+aJyvmXeuE7iL3ni5fYbZSI2kBFLH1iFkBMd/sRH9kR/OnHuFE+hvbdp3fzsKI8HVcNYE6MS1Rqd
	jJVhXn7JU3KlhW7nYAfjCnMf1ZmUUTs1hwtclnbe1f+oDeiONv51HTM4wqZLS0kXfqnKZqxM1MzAu
	kBlTyYce/Tcj7tO/hPVxMyDOuIXFyG10zlqIurdVHvka/tHLShgHw2pkNSLNvKlNIVxSLvHpC8q0d
	UDlDUs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kj-0000000GyHb-0gjR;
	Thu, 04 Jun 2026 15:13:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kg-0000000GyGG-2Yl2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so5941425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585978; x=1781190778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx8Q3lCGNmWi6X5YDYYuwkPijRSSNnRUooDmPqenZLY=;
        b=M9XH3YQEBxvgUVsCpNqh+lJHn3suLTEt2N3dXqF9rLUkCzIGpcwRR4dlz48wVIoXfT
         Pqvs+pOkxziQVE1e1PkvXnvtm9w9ffRUMVrbD/UEWbe13J2nIW/2WkGs5LReKeL15RhJ
         u/Jh+5bJ3Q5ExkprRzzMOmarC+WmOfTksyX8FLIMK6v9tWTxPDJva8YtnfY9BjdCQbW3
         Hp3hfeF3saWwaFfcYPcuF6P8wtLNnyQX7Ni6NgJQjC+E7Aw7IpTezP9SG0abYlL5zScC
         9a9+No87fOEP5lEITujhogXWT2/Ct60VHIqOSGxnbqG/S2Jc7X9EN9H+vZHMWJ/yG6uA
         tTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585978; x=1781190778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jx8Q3lCGNmWi6X5YDYYuwkPijRSSNnRUooDmPqenZLY=;
        b=GS3maOTRIbf9PZ98vH8byNOEc7sZgn0VOMetk/RaV5iY28SFSY6aOC4Fk79vW9rNyA
         ltj49Gmhw61n/0NawPwrKF5BJbcxQAQtPmEFui1Onvxp1Jib1EUv6Ty+ayl9gVsD7bKU
         SI4MXfJhkrAw4Bvihq/8zcE3GU5HTb/0R96r98vsQ1kgumvzmQEs1ZOtvkSCubDoQGRn
         yJQWiStZW1QgL0/liEtweJrHDhUSaOMgs7hjuLUSNEoaWzIcTIjMngSMA14iJAz6oKB/
         ZH+3UO0vFh/m9bYCIq36DGdoctlDUO8aEOAvov39hy0kzJ2Graxw/RHbxXcLkAmGnw8k
         LY8A==
X-Gm-Message-State: AOJu0YxvORYLojDcvpv/6hC7JElUd4FM00uCeqXbEfDELqJYhr6C3CvF
	vsKB0EtI2vtJPO4KIYNXzUl7KF3F0sALpW7BZtudPJ/2G78iI+SInuCd
X-Gm-Gg: Acq92OGpdSbLv6ZpsbyUxLf7I1uir6L+qfXUX9XM8oDTKwQLbSxGfEDvHW9b48ZOLwJ
	XvuBRUcaX+3aWlYAYeGEdFiTrWY/rEmVbZ7OfbVw23Okm1/P+PBNa7Uala6nITmzwFFcMuFiBSc
	L0zPQexSG8y8KH4+srY3iV+/uz4yQa7MTbVv7hhkiUwUTb5yD/52xSuhwTR4MN0wwifIRUfMjcj
	aUvgmcTsj7g61z/gko0dEyzK5noqFXHy/lEEl73sKGweOtC+n7OZzn3C+VPNT79vo4jq8LgO2tX
	Aojyc00xwz2go3+uJkqk2nk7vL8yiPHQI53/H/DHciH3ZA2iJPK3zlCHNW9bohYjBviwNLOPYEz
	eK3h6jKO5CH5EWqH/Xrzq1osSearRWTGSbyN5WPOs9AVim+UMWeAgz3sWEOEmP/vzFVtiOE+rRy
	krWXaolQnSf7euvfDtg22wb0oEKMAvmKhzhIcyCkt1leH69qdGbeXgw25y
X-Received: by 2002:a17:903:2a8b:b0:2c1:1685:b8f with SMTP id d9443c01a7336-2c163a10116mr112073815ad.9.1780585977829;
        Thu, 04 Jun 2026 08:12:57 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm62705105ad.80.2026.06.04.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:12:57 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH v2 2/2] KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
Date: Fri,  5 Jun 2026 00:12:03 +0900
Message-ID: <20260604151210.1304051-3-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151210.1304051-1-imv4bel@gmail.com>
References: <20260604151210.1304051-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081258_653303_4056533A 
X-CRM114-Status: GOOD (  13.59  )
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

flush_hyp_vcpu() copies the host vGIC state into the hyp's private vCPU
on every run. The vGIC list register save and restore use used_lrs as
their loop bound and expect it to stay within the number of implemented
list registers. While this is generally the case, flush_hyp_vcpu()
copies vgic_v3 verbatim and does not enforce this, so a value provided
by the host is used at EL2 to index vgic_lr[] and access ICH_LR<n>_EL2
(host -> EL2).

Fix by clamping used_lrs to the number of implemented list registers
after the copy, as the trusted path already does in
vgic_flush_lr_state().

Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 02c5d6e5abcbf..cd807fdb11ba8 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -7,6 +7,7 @@
 #include <hyp/adjust_pc.h>
 #include <hyp/switch.h>
 
+#include <asm/arch_gicv3.h>
 #include <asm/pgtable-types.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
@@ -142,6 +143,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
 
+	/* Bound used_lrs by the number of implemented list registers. */
+	if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
+		hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
+			min_t(unsigned int,
+			      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
+			      (read_gicreg(ICH_VTR_EL2) & 0xf) + 1);
+
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
 
-- 
2.43.0


