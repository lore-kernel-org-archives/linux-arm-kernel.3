Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB915CDB467
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiUT5ABfb1SzLS+/NM78To0mA4a5Z1HMNy+YIWkerC4=; b=Cc+B+J2H0xKYM5a1oBFV7ViEMM
	BdiS8XTwS+T79rIYI+BMOdr0yi/vMdZJPuNJCnxCLRsVd3VKwFsJzQQbe4CYbKU8VodcOXJlCgKf3
	8bIAA4JN3ByZ1d9kr2Acrz5AnuqAyFuFkF7ol7Ta+/SlTCfp+EUGFUJ78JNDVg59ZcZ01tqs0KwJj
	7WiW+kw8r/aJWT2UyLAiEWsTPjgYJfq27cGSiMejWoaqs0/WfIp89ZiXio80ogVhNbXx5nLHjsz81
	TKjoUGf0pYRRm1WKPdCax3gWZpOYsiDu7LgrCPef5weZcAqcvmJCvy7wxi/WvyrT05Y38jlfIjJ4B
	CV8Dd/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTIC-000000024cB-3GYC;
	Fri, 19 Jun 2026 07:05:32 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTI1-000000024Te-1HRa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-463dd955dafso1080312f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852719; x=1782457519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HiUT5ABfb1SzLS+/NM78To0mA4a5Z1HMNy+YIWkerC4=;
        b=MMSj4vmMa0h+k7+9apm4OdIP4MJKZUtdVFDsKe7rp39+WsgJymGFNmdRY4qKLyHUH/
         PoHyU/idCUWXxAOLxDX6D0dRCmTInVvqnDlqNEL751mv18VlbfmEJ7AIJPdSWcWLd4kq
         iHQa0XBuPxBkG6Zwjh8ZCWlgFD0MBJzmPwmE/oH1Ao0yObQ7bsARx84enqKfkuw4eJPP
         h5ne2UyToyrJu1rux2QLmPNKQYzG5dso7Y4AtsElaf9KZfQGQV3CQ5eUYZ19Pl30kMvz
         Q/feLrf1vY8m3/hiV9SgD+QcZxbLwgcz6tu7DnnQQOugrFJU+GAqLYFZtwxoF8SL9yy/
         8fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852719; x=1782457519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiUT5ABfb1SzLS+/NM78To0mA4a5Z1HMNy+YIWkerC4=;
        b=nZCSXSz/g5pBRcUpIP9M7cyOqJJudwWmTGX88Iq3LNpE4vPu+zbX4tRmmxCR7n+Qhz
         e8f/yDEQHti0MMRU+eRPbWJB4dSayJnA0+jZtP8ItiHqWhcUE5OhZZM6jG7dGXs3eTsI
         MXpyagWUuEBx7W6GHKAwMHhnTnV2nNBChlKQNZVNrizK6t5gic6gHnPdJOmf2dCJHYoN
         YTL+DtacJG977z9d/Npe6rOWkW1ymt+bs+W9NXSvVMR99wjKC0sYKdNSicMX/3Ul2TTm
         e4t+Xwx6OoFNTPfNrIPIfFMsyFvGH2ZugWzzPUYsjiua+nvM/3R+N4IlWKG/DFpl4Njd
         Zeug==
X-Forwarded-Encrypted: i=1; AFNElJ8i5c+ZL2GfzcS9K0hLNtkD/e52kB/xjE0Nid18my+2vsaA4tBgcO86H6Ju/bATF9dvsOgQJ35FozkfC4l2wrUW@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOhBCnMrrNSZqWMTt6VJ/EtzIH1AtuujVd3aV5uvkrg0Ynw/o
	sAGevHyaLkeM2MsppHE3sfsyK7pkUBAAwcReeQ9ioPmXijZMZurIODu5isJCAkgYhZMU1MEIF8y
	r3w==
X-Received: from wmfv3.prod.google.com ([2002:a05:600c:15c3:b0:492:4352:4fc7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c48e:b0:490:b0e0:3de2
 with SMTP id 5b1f17b1804b1-4923f5a8fd6mr40569085e9.33.1781852718385; Fri, 19
 Jun 2026 00:05:18 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:07 +0100
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-8-tabba@google.com>
Subject: [PATCH 7/8] KVM: arm64: Add primitives to flush/sync the VGIC state
 at EL2
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000521_373270_FAEF5CD7 
X-CRM114-Status: GOOD (  14.81  )
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

pKVM performs its own world switch for protected VMs but has no
primitives to move the per-vCPU VGIC state between the host and
hypervisor vCPU contexts.

Add flush_hyp_vgic_state() and sync_hyp_vgic_state(). Flush copies
vgic_hcr, the in-use list registers and used_lrs from the host into the
hyp vCPU and pins vgic_sre to a fixed value; sync copies vgic_hcr,
vgic_vmcr and the in-use list registers back. The active priority
registers are handled separately by the save/restore-aprs path.

Bound used_lrs by hyp_gicv3_nr_lr, the cached implemented-LR count,
instead of reading ICH_VTR_EL2 on each entry. That clamps the
host-supplied value and avoids a per-entry sysreg read that is costly
under NV.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 55 ++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index f25ee3971528..0194965930e6 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -102,6 +102,45 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	*host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
 }
 
+static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int used_lrs, i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	used_lrs	= host_cpu_if->used_lrs;
+	used_lrs	= min(used_lrs, hyp_gicv3_nr_lr);
+
+	hyp_cpu_if->vgic_hcr	= host_cpu_if->vgic_hcr;
+	/* Should be a one-off */
+	hyp_cpu_if->vgic_sre	= (ICC_SRE_EL1_DIB |
+				   ICC_SRE_EL1_DFB |
+				   ICC_SRE_EL1_SRE);
+	hyp_cpu_if->used_lrs	= used_lrs;
+
+	for (i = 0; i < used_lrs; i++)
+		hyp_cpu_if->vgic_lr[i] = host_cpu_if->vgic_lr[i];
+}
+
+static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	host_cpu_if->vgic_hcr = hyp_cpu_if->vgic_hcr;
+	host_cpu_if->vgic_vmcr = hyp_cpu_if->vgic_vmcr;
+
+	for (i = 0; i < hyp_cpu_if->used_lrs; i++)
+		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+}
+
 static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -150,13 +189,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 
-	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
-
-	/* Bound used_lrs by the number of implemented list registers. */
-	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
-		min_t(unsigned int,
-		      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
-		      hyp_gicv3_nr_lr);
+	flush_hyp_vgic_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
@@ -164,9 +197,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
-	struct vgic_v3_cpu_if *hyp_cpu_if = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
-	struct vgic_v3_cpu_if *host_cpu_if = &host_vcpu->arch.vgic_cpu.vgic_v3;
-	unsigned int i;
 
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
 	sync_debug_state(hyp_vcpu);
@@ -179,10 +209,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
-	host_cpu_if->vgic_hcr		= hyp_cpu_if->vgic_hcr;
-	host_cpu_if->vgic_vmcr		= hyp_cpu_if->vgic_vmcr;
-	for (i = 0; i < hyp_cpu_if->used_lrs; ++i)
-		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+	sync_hyp_vgic_state(hyp_vcpu);
 }
 
 static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


