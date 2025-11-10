Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1106CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=; b=OklKZQGhF0I0K5D7lr2uxBIvLW
	lQwTdEjLnb+Slp5Rp7KLsvcPWOUJkMj71GHRMcSFfyTOfQ0X7ITmN3lcGbaQuYS3pjBrqlAVHxC6E
	65G7iHa6tdJylhd4Inby6WgzIlr1qvCad+j/W4E0p/42YGYmjKQQRGcvkCJgROewPjDaTUsoS/Nsw
	l1wf9XNLffsOZFqR9XaFSxuvi3bm8Aj1QDCA3yU32kwK73wFPJFQ70+Qh8w5y/EDRB7iFw0XXUqNE
	gfOdcA/yhIwlSC+7/h5qnKeB6626FJsKQEvu5q7DZncG5HQkObt/zuAUmpHQApzvi+6pt+GlkRO/q
	4NEq2/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD9-00000005VsT-1ghJ;
	Mon, 10 Nov 2025 13:45:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD5-00000005VpE-0AA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4773e108333so18523195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782329; x=1763387129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=hb1ghN0GbYVPIAkYtpAafFeLx+ajTXSQuYjQ17+G1jnBmgcrpNoQ7UXDLW0fvSSfPf
         6h3sITiJ+5C3xSjiJP94jYozP2YzJp3r97sLFZQX8vlASQfbYf1nOeCgugJQ0Gvdgrqg
         qQ0OiXZwVvcVLk6Y//LC1fxBOsQ5K6Bzffi5mUa5PP1RDIYvwzqS+S4b3C3+LJSZRoxj
         smgmgVIu/t+4NRP3PlFnD6W/ZhMJer8GEz2fN15JJtYKv2lSLi3w4KxIUR8DFZyfr2kr
         6iqF6ddzaB3TMZmHHcQHvHqc1WkiRDDU4x2wo8+ARjJQ+mfhqnoNqGsW6SFmBsHCzEZc
         BRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782329; x=1763387129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=dkd0R3jYaVgERgaO4/24YN/Vrp/StJGIi18rOEe225Mwt62WuVIqAK9LVT9qNLInUQ
         Aa2Y+VaG4L7KcbGHcjnIMcbNc9r+ouFkLFvZboqdFgZ7w63hXcyDbkbhLVIpL6bAvm5v
         7YEaCOXWBjh1SdSO+sbRtg12YFItbJ0Bfj8FyiSBGUG40XZTVHlYaXE2ytSWrwCVlce0
         i5633j5jwdYOn+oq/TZ5cUhkzaRGIoNO+R/S5i+A6R2D+Ch9avdfNG0ahuTlUbeZqkkf
         tNNP6F8SFR8iXr3/X1OfohY4boi/rdE71PWjr+om0ClvoAzi9NM2Mtm4GMGHZGdap9nP
         wLxg==
X-Forwarded-Encrypted: i=1; AJvYcCULwPjzbppmLnhucymQmJotlE7cs94YWT8HDtqEoNCv0XpMiemN9HxdiJfB1aepPHM2W0OOW2IG06j4aPin03AD@lists.infradead.org
X-Gm-Message-State: AOJu0YySeTOA1SQt7eqqsCzKCraqUOZhCS5D4lKGH8ko3o1A+mCaOab/
	NJ+v5Wk1b9PXJDNp7NzHnc4c8+nGqx/hgwwk8tZamL73wN7TdRRnOv0l6tyt2eVmEBZxFuYErw2
	wwg==
X-Google-Smtp-Source: AGHT+IG/Lsm74PCzoMKxnaXjl9MfGJ8C+06toxg5c6W7aR24YKcuZNfY0RM1Zp40z+F1Ny8UT9itCXjEjA==
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:477:55e7:9973])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f08:b0:475:de14:db1e
 with SMTP id 5b1f17b1804b1-47773277167mr59270015e9.24.1762782328944; Mon, 10
 Nov 2025 05:45:28 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:19 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-3-tabba@google.com>
Subject: [PATCH v3 2/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054531_080467_F1DEDD7F 
X-CRM114-Status: GOOD (  13.17  )
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

The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
register accesses. These accesses are trapped to EL2 when the bits are
clear.

The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
had the polarity inverted. When a guest did not support the Trace Buffer
feature, the code was setting E2TB. This incorrectly disabled the trap,
potentially allowing a protected guest to access registers for a feature
it was not given.

Fix this by inverting the operation.

Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8d06a246dfd1..f6f8996c4f97 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 		val |= MDCR_EL2_TTRF;
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
-		val |= MDCR_EL2_E2TB_MASK;
+		val &= ~MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
-- 
2.51.2.1041.gc1ab5b90ca-goog


