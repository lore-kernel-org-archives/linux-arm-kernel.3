Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529A1CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/fm4nl0KgisTT6v5Yg58GOK5F5zZrpPcJU+5CfVCJs=; b=aqsCe9sr6iFvep3rg2STk46KGt
	fRFgkxD8yZhLAA+hd5IbHyG89+70UV5l/Ee4mJX2tnCRVocmLY9N6REiEGofaFEylK7liFPbNqMBn
	g8Tsl40IcM5h1uf4WIlLYJKordIfOkBwgksQ+UXVg3eRk5LIFTCYqlXC+is7OLPsTwJ1CD1lGHqK4
	by1t08Ddc4N17z/zBzt6n2+MUju8vlFa6eJ6YHtHXI1HU4LOz/lLRtwteoIWX5gZ5uiQi9yR/VqYD
	Ejpk3Nc90XOktg91R3ik2Q09ukHCu7vEt7jJYweO23Dt6nPakbd5ecspUx9zxckMPKrtt4kAwEprT
	zvuF5CEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDE-00000005VwQ-3Ju0;
	Mon, 10 Nov 2025 13:45:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD8-00000005VqU-10xk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4776079ada3so26682655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782332; x=1763387132; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/fm4nl0KgisTT6v5Yg58GOK5F5zZrpPcJU+5CfVCJs=;
        b=ejVGUrX02CebK9XYGh16oJAoGmPE42bUhRwQg9D0a9RVrJjlgo2WmsVu8Vf/qyN3Ac
         R6nPVEaHM/q+euKJEPefshw9INP22TFyFxDgyj8VunWuvduBUJ5kh2gvJl4Cr+1wXi9n
         ARzIWftRPg7teHeIuN+UnPU++/T48P2j5WJSIr2DRMn08ndBFq3TrtvPQCJFABIP+8X8
         5B3d01tHAdfUu3oVJmJykOb0wKAagVLG889GJMxFm/tDwlimXhHB3JPyS8Y8ayKdM34t
         iyjVI59N4AmIjYCQL8zFjB3xRUDivqOtRYn4f5/RBToEwHg7xnEVTrOeMnV+KzhuqBZT
         1kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782332; x=1763387132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/fm4nl0KgisTT6v5Yg58GOK5F5zZrpPcJU+5CfVCJs=;
        b=JgY658EETcgWFt96MaZUR07nLjNzw8w8x1z7vjZ8D/boHAylZ67vTP995EUKGT2j5Y
         TP6EcaAn2S1aGuw7KyAomt44YJqGu6GPpgK9WufFyRKMK23IC42tpIhHPhDQMStjsci+
         2o+Dyi0KCEMuJck/XYHrTmRQChbFQ6giOJmfVxs3G+5mzvKB/dntEHSSfG2hXSyzDZet
         UMePte3STGHd2mE8A5XCI7Bqo6DSyaJVVpOqzEVs5Dm9gx2kGOimm8QbkDGU3VBjKwhv
         eEy5NfGyn2u2RIelXYaesfTBFpf7MWDTTOCws+n+m4Xwa86gvKgvFeqo9cghNoZzKFYh
         NXZA==
X-Forwarded-Encrypted: i=1; AJvYcCVN6d5qgZiR/WuvCLqLHRp9GUqoZ/wxPIui9b7VxMikBymQwR1EJM2ysM8uT/WLrZCRkgSGTp0GcaeLsj0y0+h8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh4HH292vepb5BA222pqbNCOXqIG1KgNKEUEPAEkjLHnZndaey
	vkC2n7kU9fN0Flyovn03HotGIHQHtttaKQXXLswauNGR5pecqM2oxffXuw8wNYEvCQzpWjRQuXy
	M5g==
X-Google-Smtp-Source: AGHT+IFrLXPatsL3cKFrxUxY0ZecRhM0O2Za13tOgEt+4mphfqOiMkTeDFkmmonelKHZAFUDUzD8DYLTKQ==
X-Received: from wmbdo21.prod.google.com ([2002:a05:600c:6815:b0:475:d8bd:60f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f8b:b0:477:569c:34e9
 with SMTP id 5b1f17b1804b1-47773271a62mr84697165e9.23.1762782332359; Mon, 10
 Nov 2025 05:45:32 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:23 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-7-tabba@google.com>
Subject: [PATCH v3 6/8] KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054534_282071_C3FBF5BA 
X-CRM114-Status: GOOD (  11.01  )
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

Supporting MTE in pKVM introduces significant complexity to the
hypervisor at EL2, even for non-protected VMs, since it would require
EL2 to handle tag management.

For now, do not allow KVM_CAP_ARM_MTE for all VM types in protected
mode.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 7195be508d99..ea5d2275d16d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -44,6 +44,9 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
+	case KVM_CAP_ARM_MTE:
+		/* Memory tagging is not supported at all in pKVM. */
+		return false;
 	default:
 		return !kvm || !kvm_vm_is_protected(kvm);
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


