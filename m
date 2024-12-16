Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5559E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlRETVSAd+jtsJNx5YFbu0HDOE62z9vkIYE2WXDLJhM=; b=tZiwVLh8PI7w2kyzH8x4Lfu4gj
	4IT2AE7od5JtsjAeecUrGuP9zxFqoqUBAxKHlJX2Yodv1bHAODD+wrQroUiHdNNcPmrb6TslW3FVa
	9iCtpkkKJF7BuT5yV/w+sQFJ/Fp0XC7hz9tn6Kz+LMmn+9QuQwEwaA+WkgrwMgYh6rPHVCPlBQL25
	i7QbmDh/K+AwU0eImuobXq0M1pPcbh8aq0DXFhGbeb5nhOgEE0s2P7lDMOVqYHT6Z3XNncs9vVwmb
	gKIceP49idScT1FM11M3ThBhW/4OoRRuW5kY/ZjH5FuL40g6+byqqjxWsanyOPTeuOwRE+/9pEwcO
	qrIo1kSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8vb-00000009mNV-3Sil;
	Mon, 16 Dec 2024 11:06:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8hD-00000009k1a-19w3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43619b135bcso21318845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346285; x=1734951085; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlRETVSAd+jtsJNx5YFbu0HDOE62z9vkIYE2WXDLJhM=;
        b=SV1mhbkbgl6LmZxB1ZIVlaRjYqS4ANGp8c/r0ZNpE0QZY7B2jkHezZKaTkBENjLWIi
         Ek5CbrWZAp0nwCte16J91639zuil0MdY2Y7bQ5dGyT5pSiYkEeoOhTt+nyxq7Fcb9/xT
         Ns03bdvA7ddL1YUhQ/Zsn4Ac/N67ocowY++m++eYgHPA8sjG84z0ovhN3nvw6uTfZJIe
         PVhFpOA/r4CzfPRHYZtDoH+BlGvR2Xl4QxzGxzGOt0WQg3wWwVRGmkbtu8S2FkFmkwOE
         1LeDeuC7mgc7PRylQudYS6kLv2+B7Bz5LrhsIy4/SI8pmH6PjVfBBvHorozl44NSRikV
         8HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346285; x=1734951085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlRETVSAd+jtsJNx5YFbu0HDOE62z9vkIYE2WXDLJhM=;
        b=g9dRSztMXgEIZQsR5TKwm3Vau1c3xahcHzk6NrenhslssqY00Tq9T9WTSjCdw899/3
         zVAJwVLDjLsi76v7s5TOruJv5SV5Rm9SB5lwDplHC6ja5blUkYpB0J8jY9QZm6OWcvI+
         pxGWInkh5hNnIKMRQmim7+jXlcpnhu7LnPeAdJeIlqabLyrAm0/8aJ1AdgM5WxcP2yZc
         ovlnLyojFCzC5tzJ1/Rh4GscbeyEBGSbCDdi0+GLbPEZjSZOuGk09NtqfWsjJTLK8blH
         frCiCYIDjCq4yVL5hAkp4hWgA5zO7IV45qFeZHUM9gjz9upCIXajqdVYVTkl5E5RB9nV
         q7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWbDVKkvCMGCqdaemnBxib5UFvRekhaE34yUssQV7uLk/T34T4F9cC+HLqki4Sn8sL8JKQyMzzYBYLqIqWfjQ7z@lists.infradead.org
X-Gm-Message-State: AOJu0YxeCOXJ+9QqL6cw9OVeYodd8ZsIuy45iVr0JhOD5HdRA6zpcuIG
	As3Lz6nqFDQoO5b7247KO+JacReIf/Z8c8euv8eB6u4ck0bBHyrtopPneh2QALJb+Aj9yjMzLA=
	=
X-Google-Smtp-Source: AGHT+IHaiAnCqJjam/xPbGIlUjPkbW/JNT3nelKe6+T4YUlS/5PjJrIWPgIaRiBdeWjDa4HOa1sa9Fkg8g==
X-Received: from wmlf18.prod.google.com ([2002:a7b:c8d2:0:b0:434:9da4:2fa5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c18:b0:434:a1d3:a30f
 with SMTP id 5b1f17b1804b1-4362aa1b8c3mr101870875e9.6.1734346285438; Mon, 16
 Dec 2024 02:51:25 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:53 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-14-tabba@google.com>
Subject: [PATCH v5 13/17] KVM: arm64: Refactor kvm_reset_cptr_el2()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025127_312599_44302979 
X-CRM114-Status: GOOD (  10.60  )
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
2.47.1.613.gc27f4b7a9f-goog


