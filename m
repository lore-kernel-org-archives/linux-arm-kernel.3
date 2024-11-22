Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79DD75E29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdzcjtKcPCFIYKoG4aLfkBMjNTuiZe1UO/NhF2ssDps=; b=DAOW1GCqanVR286JTG3f4hZ4kB
	z4x5xOSx0ju7Gd76CeGK2jVaAA2lil3We6NRT9xc2hPhMNCWqzbThijpN9LRBXA6qwTdcFYugjWNb
	rx4WbxmKLFvT9I8qXy67p8ru8nYoWPu12FMbyMnT3R1A9nNwlb6nlgnrGMvZgg9iKB6uh8xBo4T3W
	9yoDyJz+EYhKzZukhpcXSwWE556m6gwWv+GJeJbF+CnHnvNfiANG2YIWjYpk/yNOakscaNsPv5h0B
	vhVoWFbA7G65EIg+FU7tfGuCSVmW7r8L1EG1zJJRtQo0Qo863Ufq0MUropph1UkDsKC6YM6CBGkha
	4PLD4+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERfe-00000002LIT-0yju;
	Fri, 22 Nov 2024 11:17:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUx-00000002JVP-3mRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:52 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e293150c2c6so3732100276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273610; x=1732878410; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdzcjtKcPCFIYKoG4aLfkBMjNTuiZe1UO/NhF2ssDps=;
        b=hCRWfnndKTAAILnBhpThH0ohhBAn4YMfZJWynJIwCRBP2c+98PgdA95tbPEgMNBHCX
         pZMeV8C8xQ4ev4pFSlJ5usUXqjAXHNi368N7UsEJpIM7Si6/71AkIBheH1Z6HhBO0YI6
         jph4hJOPIgHHUSfszqwdfpzj7CwZjivkMV/JgJt3HLlcvCUvAHYK7QRmMIO+d4dxvCMD
         t22Nq4+5QbtcS/K6dDSOtngi8Jy26sLv3x+g0Z0voZ5yltnukJ5XN6CziRNwScZXNAs5
         723DRAt4j4qmJStoIKokzNWUTPBEVzIuCKDPQvNN2ZUuQnH8AAUYiJB2amFk5lBcdD75
         Oh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273610; x=1732878410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdzcjtKcPCFIYKoG4aLfkBMjNTuiZe1UO/NhF2ssDps=;
        b=O4pQCA/NNuGsiB33lx+/rB1jwYi0NncwB+zMXkNzHiXAlSre1IEx9qpLhHgxI7WjWc
         Ez3I0E4qmJ+Gnv6y/avKtSGaEfP4fQ7nOZNfhbDfFDCN/FcpInXbJzVGq3hT3/OUN+GH
         wF6YWh6hsB38KW4f7e8CwLcloRRrcUeo2E6HCtY3/ci3+7rRQ/asQJQMyc9X/P6LdmAG
         gryes47OjK/mwmC3R3JGfd6WdCaZX+Qz2079VgbJv1Y2aVy4T8N86qzoGENlvTQTLR9v
         Tjq9jGYu5WvzAG3X1m1XAp51gJa8VfmSUTh2gYR5Sukwsd0na6GWSTE/iX2IJ+/klX1K
         mUOA==
X-Forwarded-Encrypted: i=1; AJvYcCWfV4HnKDfdb20hqysioIHdf10c0RrCeE2thvT+GCMV7NPBk2/UofrwYCejOVM45/vlz+bxwVbzk92zhOjLDbU9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Q5j6a47iBYRkKxwA+ndxoybNmsMCC53RKizURYRVWbCJATXi
	sg/i1maSBdwslspvDNPQwfOMQ88+PShpPr9Hr8p5nS0VDjZKbIFmGvbBM9rH5b5V1j4uOyoxqg=
	=
X-Google-Smtp-Source: AGHT+IEDyz1NhZvJVWey0V55b9I+icgbi698SOPFguzKApUlQ+aj+8HutiXfXKDa/HG43pXBb+nLXDLnwQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6902:1745:b0:e38:78c0:1a0d with SMTP id
 3f1490d57ef6-e38f8acc4bcmr1062276.2.1732273610567; Fri, 22 Nov 2024 03:06:50
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:21 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-12-tabba@google.com>
Subject: [PATCH v2 11/12] KVM: arm64: Refactor kvm_reset_cptr_el2()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030651_935958_5DDA356D 
X-CRM114-Status: GOOD (  10.81  )
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
2.47.0.371.ga323438b13-goog


