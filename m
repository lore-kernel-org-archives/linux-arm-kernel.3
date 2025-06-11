Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43A3C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 01:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=; b=Ll9b5sMbmtUi0Tt4CHTtrkX+wS
	vXZ+CkoinSwAI2at1TyNqy+qsLWDC0jIoex2A+tMqmYFw1aRyWlnw9E6Xm7+YTY+521Alff/+46wA
	MFG8FwFCJLP1fYBBh48daVVovvfhK3k8v82FTGsxqxL2P9K+dzY8pLfD0eye+whujdowgIk+6OV5K
	pLSfIY8tVwvSfSXXEdA3xESzEU9qWiHbkLdhc1gnswCLMRMpEK4uhiF8KP78xSLSxUBl52uVi4UG/
	9Dj0RKU1SDfOlRwwi4muM5EK7TQYeJljDscRm6aHk7DnlaDS8iGrMVW41QX6RfiwJs2gR+2MEJqoD
	02s6n/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPACE-00000008XgC-0neS;
	Wed, 11 Jun 2025 01:24:06 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93O-00000008SC7-3IBk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so1650435a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600654; x=1750205454; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=rHkHePtpxyRmtp02AYWGJ0+07wXY9Re5tUpG+5uWpFrcht3nV1C8K3hmQdSB77/s16
         jHF1q+fBGazF9QZg3N7F1+PwaTwLXcDV0ddndSyDIf8zZolPsTAcUJ85aBvqDNvfyO0P
         gKPe2jCfoxbVv0X52xSGP38CmaQYn68PwcjPaGNeqOUJF1LlUV7iD1744dhbxpmjskvQ
         a+HTF9dp8dXoXZ5Wp2yQwY6wr0hZCpYjNsLPEiGqKGSnqkeTP3La49Mi4ZLU5RUU19Oo
         Y7cet5iO7IOU5/3cQUeUBzMPWU2JILn9q0NBc/NX+fe4xnZvTVyRKmYGy9qxrTCpxDY8
         FRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600654; x=1750205454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=XetYZplzem41CK+TVYldcgIcCnvVsqKWm7kcbpaN6E+BWi9FurppveJplFWlseBgGQ
         K8j7x36rbjrr+qlk3FUrL9fWMZr/mBb+dZT7HFtYQ/7fNR21J3eUEe1x4AJ3mI5yyC95
         l4VfxW4bqFidnTt+7GdEp+VPL85QfuuFx8gFp0CiOJWx+CVTx0FBd1Xg9E0f7aMfT7yH
         mhBt/aiUutw8e/jcAq23qEe0Hr6MLlFIzg19FGNY1tCuG9l8oXiWk4S6rxIHt2vRVCD9
         2pMGm8eU+1HqvouHKcVLn+bvim2BxRXawJ8Nze15msUS3ZNrgWgQYm6BvbL6hX+pExe7
         1NIw==
X-Gm-Message-State: AOJu0YzwJKp6ppu8uBZu0B7yWNPeBv8cvyex82C84OUEyxpyGeUt1Z4B
	/ihOr0wzHXAYaSF6E+iE8y9KE/aFb79TLjhwIfNVjEeRzeMivN8iFUfZLznzo+4Tkb22tne+inc
	3XxZstg==
X-Google-Smtp-Source: AGHT+IED4B4s7Ytoor8mnhgXxSS0ZKiCE28nENLHgtxurTVkQjPNLlNungxBpASYaT+z3Y4fvBlDrrKUUDc=
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc4:b0:312:26d9:d5b2
 with SMTP id 98e67ed59e1d1-313b1d9c310mr956755a91.0.1749600653718; Tue, 10
 Jun 2025 17:10:53 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:39 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-6-seanjc@google.com>
Subject: [PATCH 5/8] KVM: MIPS: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171054_815741_AFAD62B2 
X-CRM114-Status: GOOD (  12.12  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Don't add virt/kvm to KVM MIPS' include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that MIPS *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when MIPS support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..96a7cd21b140 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Iarch/mips/kvm
 
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


