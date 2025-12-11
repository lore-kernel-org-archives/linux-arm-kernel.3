Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45419D41C1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhwV7f9asMHZiaDeExGO7dFsVYOrCmIj/2dE9NEaIr8=; b=2OuxnLS9DCVwYf/Rf9yDmeOskT
	AJkMJxRT3VOvgE4pNngB7cP4iYG4Phv9+JJ2u/UlpL3HsVFWxyIivHo1rrDJzO5U1IO83C6N4gU6W
	w6VRe+/wGPxTo1PLabZUWfGJGb2Q06zAVIWz1xqOepJ41YiKfyL7zcIyAaF8DQuyKmizWo0ByJTFL
	lu9kqs/EZniwyJjRfPFOIFv/vNVMCpGiVglmJt3mcY823r5nNPdZyqHaPjXri+4Tq3PSC8LEQ1lzx
	f0grlze6XSm+rSmR0/ddtzR/IQE8Pv6bAPJCF5xlMMLLSyBf1V9wlK/s9MPFR5K8HqsgVVO7NTCDP
	6JHPlGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCf-0000000GUto-1Eli;
	Thu, 11 Dec 2025 10:47:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCb-0000000GUpl-2sqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4779981523fso5943945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450036; x=1766054836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LhwV7f9asMHZiaDeExGO7dFsVYOrCmIj/2dE9NEaIr8=;
        b=jajZpE/CNcE+T00sxqbGDzq9vcoIcf2jSsS2eSZvW3b1RWCXYwi06CNwqBox3mmTpv
         0Vlj3B75cON7ZDo7+P7wQ7mXoqKEEdOapPdim0aBwkoiONzq2FcxgZ4jSGJVnE4+kqCc
         yfID+JZ7SQKhVPld1WEKq6miEHZHSfF6087AskAJCmW8zZ5snyVcXsg3Hia4cB/122IJ
         u8Ckct/qzdp/NlKlv4gyKhOQR0RReKpiaz4QO5kHUMvZ86nbugvExWrPLqeDLenS/hGH
         oiWyk3krmSxRZ10gwG6PbXbvSuQODUfegyi+i/yJTuOenavN/5kMARiX7ovPI8ZKW0MQ
         +oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450036; x=1766054836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhwV7f9asMHZiaDeExGO7dFsVYOrCmIj/2dE9NEaIr8=;
        b=p78gAoFkQtsTv9Bt8hZy6QOxO+AMAAX3qlqCDHS7RbRJduC7YMgOrJtcFVNnFKToof
         AmXGgyAV/klPgoFwOF/cZsH/FgGJIqe/6Pyk84AZRk01I+bNKKj6PQHJSid2mmMoM3rR
         Wj7nUtvdA64PB3RnEOQQNQGmGs3MATSD4UqBn6DcAs0hzFMvjnT5UrDH4tLYc33OFCLJ
         9F7EyF8IhPeJXztS1cNyfpbhvXoIWQRxk/hWV0yM68+1oDAm4Y0xsVcNrAncEzvgcJYk
         wTE0gpngTu/1CNFKamplgmpSoJe4GYjYPNADqzOixrRo/7Po3glPaoL8DV+redRgBo38
         FHIA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYhbvn9s864Op8WMtHruwkKXr4Abm64ZikAswfMKWtctjO/AdhbnW2i88sKenSYxqPpFEAdA3ij2IJ9N4C1Ju@lists.infradead.org
X-Gm-Message-State: AOJu0YzMzw48oucBUaNSap7/2tyyFt7lFR9iI65kSyGManMGiIccjS1O
	ldWFIPD2/5LiUNye6hw1Bjhi4ycJ2LK6Ay+lq8XwuTcAmgljc71OzL0nQgyFn5alzw4gJge0HDG
	7Dg==
X-Google-Smtp-Source: AGHT+IGddMYZDqjoM0os2VzLPgjYnQL3pqMGYeFRpzOdPX9ZWdrz06l4/4Li1Syb/xu5pe0iDfVKIhjoJw==
X-Received: from wmbjv23.prod.google.com ([2002:a05:600c:5717:b0:477:79a7:7d7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec9:b0:475:dde5:d91b
 with SMTP id 5b1f17b1804b1-47a837925eemr62714245e9.17.1765450035947; Thu, 11
 Dec 2025 02:47:15 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:06 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-7-tabba@google.com>
Subject: [PATCH v6 6/9] KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024717_730640_04AAAFEA 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

For now, do not allow KVM_CAP_ARM_MTE for any VM type in protected mode.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 7195be508d99..5b564576160d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -44,6 +44,8 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
+	case KVM_CAP_ARM_MTE:
+		return false;
 	default:
 		return !kvm || !kvm_vm_is_protected(kvm);
 	}
-- 
2.52.0.223.gf5cc29aaa4-goog


