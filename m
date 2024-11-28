Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48CDD69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=; b=2aLZoe9aIFTs1BqFTQPDA9yhQC
	kumHWp436tEX1Dch8u9Lhs0K1ToTDTvBVIxE5uyRNPV21yl7Px21QGlBUaUCwtdxECP5XBQ7ar1JB
	QDRymi9d/zl5B9K6sr4lvAFZrJWSvH3xq1cqGQf6ybHVYaRcA+TNM9CNRbb0R2zf8DABWNP3Y4AkX
	R2wHQuhrFDGUDgJLieTQhktV8nH8XZp5z0lfLVhk8SUKfXOV8fX4mcTnisCugv/RPsewe/HER/Ewk
	vyWDXl9ps43JH5XPxLR3eeYKjdw9+YD8DekbY3sA/KFiXufMNdRCluyBwb+4q6SVHVEVbwHeWXIQ6
	gP4IzO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdvG-0000000FWyo-3GIV;
	Thu, 28 Nov 2024 12:47:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkD-0000000FVPd-2MxG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4349c5e58a3so5862275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797340; x=1733402140; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=;
        b=By0W/5NC/0kz+IocSdk1b6KHCU/iTPArsKqZsjXqcA+tAQKuiI4sA2Qe8G5cjaOvlW
         i+zbnAjFYYzecfZG1HHT3QU16UtaKooJZSWDvhcbVb1wUV+dD6DH1o/v50MHx2MFFKhT
         UqtHoJYWjMEgMKoMYW4UDI/2CgDtJhpnMGjiGVspSzAuIxQVTI6khHWd1UsFjL2CUT6q
         3ehLJ4mcWYwrt41ssEjb0IlpXAih9e5NDVmuypQhMMfBCo55mft2HhYGlsVW27Nmm31z
         1F5zm5LUCNqmhkeB4ZEc3cw8zkTtgWo1yPG4GeCwTolwD1Y/J9jjXFmUXVTJwbZaVIGm
         vV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797340; x=1733402140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=;
        b=ib7DRhW1xlt1FXj/FU8Lkzf7ZCBaXkERMDLPwmpmtKNth7MXZcW2u+XLmSiTDBaCdI
         CslH2bL2Rn84p4uuGn04PYjCzHfU6NZTy8cV47wz2AMHBLVFty8NTq9lEOmbbO7FTQkB
         zFDZWTZXMlpxHkYNtj0tOn19qcLD10AtRc11dzhhf1cc+UFUbIm75UQYkxvVh6+Fnmo0
         AxsScS8nJrgyMR/9ujD3CJ5FtPFXeaeFE7PB6c6mELK7JGjth4oHmDRwUkYWJm/s+fo8
         jgV9XWAvPaAw/oNVjUoAi9qbhQBPj71d+m6jlF/YxiiZ3AKBlWWFHOUOr1xjva6xBQw9
         yJFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBR03CdxR1vrgzQyh5h7oejiwu3kCBdukrdEXZlIWTGWVDIUXLOJfEYdJqjIKVxu+Ey1MumXGOFVBLtfV3mq4f@lists.infradead.org
X-Gm-Message-State: AOJu0YyxP3CCRtuApKRYYzNiwV+WLfRKzCrn3OOes16W8OddgFBeWGTA
	FCVhYpoQsrJQZ8tjO4dJAyJFGQWr4VtC+sfcpW2i3gWTfgduAHuaCZN3ATNEjcxd+twewLn0ww=
	=
X-Google-Smtp-Source: AGHT+IGowe/R/6RjexkHq81NuzVdHzhVxL86z2B2+36Nlrd3p5Is0CztUoSrf2Y64aRbSlgs+xXTiAvw1Q==
X-Received: from wmmu24.prod.google.com ([2002:a05:600c:d8:b0:434:a8d7:e59b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b24:b0:434:a75b:5f59
 with SMTP id 5b1f17b1804b1-434a9dbb06cmr75327445e9.3.1732797340049; Thu, 28
 Nov 2024 04:35:40 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:11 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-12-tabba@google.com>
Subject: [PATCH v3 11/15] KVM: arm64: Refactor kvm_reset_cptr_el2()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043541_599197_59C55BBD 
X-CRM114-Status: GOOD (  10.56  )
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

Fold kvm_get_reset_cptr_el2() into kvm_reset_cptr_el2(), since it
is its only caller. Add a comment to clarify that this function
is meant for the host value of cptr_el2.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index cf811009a33c..7b3dc52248ce 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -619,7 +619,8 @@ static __always_inline void kvm_write_cptr_el2(u64 val)
 		write_sysreg(val, cptr_el2);
 }
 
-static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
+/* Resets the value of cptr_el2 when returning to the host. */
+static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 {
 	u64 val;
 
@@ -643,13 +644,6 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
 			val &= ~CPTR_EL2_TSM;
 	}
 
-	return val;
-}
-
-static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
-{
-	u64 val = kvm_get_reset_cptr_el2(vcpu);
-
 	kvm_write_cptr_el2(val);
 }
 
-- 
2.47.0.338.g60cca15819-goog


