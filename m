Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EFED7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=; b=nHzOTa2+tm4bZGdqVukKNfhpJW
	5q9YJ3XzfNqhiuF/NmaXRsVoKvIj3MdL8WKryUFTQzzutvlRUuTHHkV9rZVWVO3O3nB9pkiIycqL3
	kNYkmIWMiWaJREh6FTwzUUbmrCjuiKfwS4VyVdvARdo96dtf9t/Gn4NW905Ik4kdfKyeM2aTDFH9H
	OYgwUMPiRByl4Ed9vWLqdwK0WwzSYHNJWS6EwYNj5HrGwmDq95x+TzQDTDaecs9AQpEby4trgFF2j
	pMVeBqVM6w7AWcomHyzXH6bK7JA64DL2MZfTO5D5E+4zy1ow5oyB4hxwJcAGOco7rq0o88SxW+NF1
	Yr/u504Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8vt-00000006mH4-37PD;
	Mon, 02 Dec 2024 16:05:57 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ee-00000006iYK-1u3r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:48:09 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385d7d51ac8so1885165f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154486; x=1733759286; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=;
        b=UPQSZoV7C5RbJpvPaE7lEI2g93Gkfi1R9n6pwv8GcfhNCTLYfN3OIooiOmXHHNYnYF
         BNwylGFo7+qeuKJbz1LHUdY9sRt11Lj1LgSzW4RvN8ozVrXKsOffQUi4ajq+mRCyYArK
         O+x/cjl7Jk9J3POMWVKFQueTxe131mD2Wt+Ze1FMXmLtG95RxuKmp5uZbOiFTuS08MiE
         Zc+HioTq9cAgvwe9k2uoQayDv6C1sgoXu+fYndtKtsKioJBzlur3s8tCe7vtnglyK514
         JpnZrRmoTCDjdG1dghiNrVskieFWI7qmM/u3AEyt/MJwi5OSpfH9D3XznwDZzx+I/YVB
         1m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154486; x=1733759286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3AEmgqEm+cvkyX+Y7gfd4xBQC+JlaYoJMIK/6vkrhU=;
        b=nejzPyU7PEeidAj1T2MumwlBKSvmc9WOKrfWxr3oAQJuMrU/AnwZ/9trsPjXfo3unj
         d0p/8f/qYSbVRFJin/yM6mcIshCUZcEqfftBNlZ9xoog8PcvhSr4rDdhJVc0YUFgJ+yX
         kMFXKnuWY9ph1IVQ4bgkJpLGbuRKAv5Ii708+I+f8mHOkKAgL/AQGxkHid4RbLvDYN8y
         jXpt9+vlEGBGH8OiNdPuRWd1kbNb7HYSOs1oMcI1ooiEbMriLmBiv1Bfo3/o18ibxKO1
         BQhEA7vxaJ83kUyMBBwipjrUryVdOe0ZM5H5dLLuhpxjdGk2jYCVylzeR8VckTnDBUhO
         bv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZumjpvgqHwEVtcvx4CnNYFlfxRstS3gnNL6lTHxDXBPg4S5fgzTBU1WvKNhodo8W1YxdM3U1f4r3b7a71F8Js@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9eL0Oj5RBeW2hHP3QBY+GxgWSBaSTeOIarS2MtxjFtvk6Llhg
	86xOLxHm1evogcdXPipQYf6ebJLrBDFviDTGJ8y8fm23nUcqMBastllmJRXSsrqniN822O93kQ=
	=
X-Google-Smtp-Source: AGHT+IGhSynrcs4SqVVKs22wLLKLNJi/dXD0I1g5U0lYlcBLFc8w5xASAAEhBPJ+vcKS1qXzNPJOrCrAwQ==
X-Received: from wmjy25.prod.google.com ([2002:a7b:cd99:0:b0:431:1c66:db91])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4617:b0:385:e16d:f89
 with SMTP id ffacd0b85a97d-385e16d1024mr11521621f8f.34.1733154486245; Mon, 02
 Dec 2024 07:48:06 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:38 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-12-tabba@google.com>
Subject: [PATCH v4 11/14] KVM: arm64: Refactor kvm_reset_cptr_el2()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074808_488928_83FBFFF1 
X-CRM114-Status: GOOD (  11.34  )
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


