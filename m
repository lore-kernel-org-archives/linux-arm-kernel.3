Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07386CED27F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unbOsFC7lC3Sk0k9z+89bFoeZWRx+lQUDVvLvg7/a5E=; b=0r88TteK1N+DYmTmWFTGXcVvAl
	rDyDnCZ7R5Oe3n32SDpBOnyVFig8g5aATQKjoWDalWeUVGHYC9WBaJFplCRpC+n25/KrIyheISYdm
	3w9MXM/fEJJXaMgD77e6xDlnu18l3ffXguFTP7YxDLLuFLEvdsm8rwmjRBVwkbCsmo7Mm11+S1daW
	N4tmSljXMIWF6hWXfUHQZm0W8PC8wYqaWhunQCn+v+ACPBGztTWq8LoFSDxfUMi6KB/6nac16gDGF
	PO5waqVSDghxWjMyCs1RU+EGGqvnShC75CItxeMKfa9423QNs2+3SR0YRwvCr517j6CkE9+/R0/Hp
	O6wNT4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6K-00000000FlE-2AKR;
	Tue, 18 Nov 2025 10:38:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6D-00000000Fgv-149q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477a027877eso24134345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462291; x=1764067091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=unbOsFC7lC3Sk0k9z+89bFoeZWRx+lQUDVvLvg7/a5E=;
        b=V3mkeN1MaBORqCHi5rq4OCiPLzS3omfXLWxer5UEFCMNYfb/fLuPU8QhYmUZZuhchS
         gNLGUF7GcdsGAWAqe3pa2NC2GlOV/1VzcwPedxR7uOzeV9IdN+sGE2puZKItpZhhdcnL
         WJ468KfXlNJZjlJtcXl1GosxJx3LZRdxfuUItT+6bmjswEJJuvVET9vyJYLcuy0AXNtp
         ku84zJmI5C/qZRkeEon6S+NYMolQ1VEIKuKwiuwax9LEbYm2Zyit7jx0X5D+RK49OUYG
         HhBJIdbB/eqdpEZUN5xpXv1YHPFke//ke8exNXM4MdVs8NkuWexVIi8AhiuygY5e424R
         Exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462291; x=1764067091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unbOsFC7lC3Sk0k9z+89bFoeZWRx+lQUDVvLvg7/a5E=;
        b=RARd19KP0m3vxdpvJDh1DG1Ltqr5c3Wn9pXKL2deicRDsZPNxWqVulpc4jB2ro/ZbM
         BB+6t2StP3imwZC8lbVjpWA8CQmNNEe3VSESFtOvozYldzN01MlaQ+a2503voPdpJAdL
         sYZYkOEmJzCH38OlrygzJ0ay8u5j6l/sLqIv6LeX+ZB2M2D4Gy3rmnqJZsjE81lkKvzR
         KtnP+lUM08YKqeVW77xqZKQxw6a1ex7R9xGsRLGp3VVwBEjRbK/FXyDNbB68xUqqfARs
         F3EBHniezhDX005T7FpyILRABx9eM9Upzjfs++XZe3csSAk9cBGc5eTWBamrl/YOin4K
         jWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsDz7GSu7eQeEvwvyQm6SMj6M4epCLDv21KSOt70xamlzhla9BEl9+t3qJMPPS3MRSra6vol6jYUfXtm0F6R2c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+tMwJLyEw1m/MtqwZCPAtA9Q+EvA+Qsh/dQWvP6JOpDrKmkB
	VLBCYePbmleIyar273EHWI0/amjnwJq4gP1Urvc1dSExBfrmEV99nkrm+FtcjKaUg3R76CWbmsl
	9CQ==
X-Google-Smtp-Source: AGHT+IE2uOWsWwOg/aSoJt/gaeh0LSFNR1KpaQMIFtZB7pbK2RWRU0iQCTfCVOINqILp4jWHmtPCHIlOyQ==
X-Received: from wmbjt22.prod.google.com ([2002:a05:600c:5696:b0:477:98de:d8aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3105:b0:477:6374:6347
 with SMTP id 5b1f17b1804b1-4778fe96b70mr150339635e9.22.1763462290724; Tue, 18
 Nov 2025 02:38:10 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:00 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-4-tabba@google.com>
Subject: [PATCH v5 3/9] KVM: arm64: Fix MTE flag initialization for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023813_306559_5C0418C5 
X-CRM114-Status: GOOD (  15.50  )
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

The function pkvm_init_features_from_host() initializes guest
features, propagating them from the host. The logic to propagate
KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
has a couple of issues.

First, the check was in the common path, before the divergence for
protected and non-protected VMs. For non-protected VMs, this was
unnecessary, as 'kvm->arch.flags' is completely overwritten by
host_arch_flags immediately after, which already contains the MTE flag.
For protected VMs, this was setting the flag even if the feature is not
allowed.

Second, the check was reading 'host_kvm->arch.flags' instead of using
the local 'host_arch_flags', which is read once from the host flags.

Fix these by moving the MTE flag check inside the protected-VM-only
path, checking if the feature is allowed, and changing it to use the
correct host_arch_flags local variable. This ensures non-protected VMs
get the flag via the bulk copy, and protected VMs get it via an explicit
check.

Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f6f8996c4f97..16d7bf493c18 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
-		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
-
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
@@ -354,6 +351,9 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		return;
 	}
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE))
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
+
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
-- 
2.52.0.rc1.455.g30608eb744-goog


