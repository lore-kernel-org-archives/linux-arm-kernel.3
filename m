Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d430to7F+bJwYs62ijVveUJQwYq/Bl3TbNr2srG04A=; b=evtQxigeakCaqgN59S24ZFsi0Q
	o/ie/7siHve3SHDE0Cmef5COSl7ABJy/JulXkD1IHSoqVH5NH4hu7IGm+9JdReL94jbQG1a4Tjcgu
	xeanq5D2cAFzzM0dnED4OpPrzdoIfKnIScCoVCkBxiCr8yuqI4Adi5tlVTBAHDZHR0a/8fLhDzd35
	EF1t2HzFosyzVLPkoVOXLsB3Q8yvlL5GM91vlJq8LZhL+OoCfzcwJssgL72mDguqnR0ytwt7CeCcc
	mcg44l+JYXz+DfpzfMhJDKsIvWBYTqFCfi+YFenIbf8NKLwAs/C10HTX+nRMTdnBtNw8E62Eph+49
	s9t7euxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNx-00000004C35-0w7h;
	Wed, 08 Oct 2025 15:47:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNi-00000004BdK-08Xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:11 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3efa77de998so62517f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938428; x=1760543228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4d430to7F+bJwYs62ijVveUJQwYq/Bl3TbNr2srG04A=;
        b=aFZqQr/I8UjK1p7cCLg2R4UgkjuGY0ME5cg791fycmyWEUGZa3CqRTuuemf/rC01QW
         2kObx8DUMUI4KaEbrMPo/YRFA/qOItFQC/W+f4xZCGPm2LQ7GmTiYb/xXvndhpaqr5Ue
         3H9hvjRnV6n/s98zxBzg7eGEFocwkztsAvXnEyojopQ858y/4wbb3Kj+gxaapzd4DiVA
         vXq6RGIfYK13I/r9589bLzv0quZkPHodhwqDqxIsilCPeSVtfh90RschsgSkNexH8Knj
         ybniuxoRvv+BodcyiuDW/9BXvFx0d+5SRD8XhVPpMxsSSSJMFgx2UyAXpmSxa5azrsXO
         2exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938428; x=1760543228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d430to7F+bJwYs62ijVveUJQwYq/Bl3TbNr2srG04A=;
        b=HZyyiSt2PiBBuN02C50zDNLcb1M1oaD2sFovRGK/xWOuHxTUr9dY16RbPZWYIZalYt
         vfhSjWMaZVZNvuSgJQf63BLPV8aftO/Yrj76uwy2LJyULcUzXJ/65CwsJd1h9luS0zbV
         4TiOtVnQiGwNx+kS9Y83nU7Cy8M/0hx8+TQlvPVMI1S3VxIuarFNv4Zxq5cHzNe4hfAE
         PSwJqN6ieA5Y3W9s273zBnohTbWHQbYMz6BjbU/AIBHk3uqSYh2qT6BDa3s9O2NSlsqW
         stnetlro7XvL2uSqlRnGaCrXJ61xXTZyMXuKy0qVQ5xVEVI7/8v2PE+0hQhxR529MaAG
         wuNg==
X-Gm-Message-State: AOJu0YxcjrsnNoX5tMCDnmGb3tf2LO0buQraiRBABW68yt3CKNhGMDsX
	lYQPB+EtUF5BJV4AuMijPs6BCCmT4Njhl8JKpTW9vjF0IOXtW+W5WiQAmTwMylJxDB8xqlIPHnP
	MEh2se+W+dkS1M54XSo6qqZD3pf2IVMTz09HXuo2/ElesjafpA/Tof7yG/7K+oKPIKy3/TKKGiZ
	H4smbpXeTc+xw5KNSxqBPBDcFkQ8jIWq1/5AMi2INHyW8i
X-Google-Smtp-Source: AGHT+IFxuPNcvfnI61ScnGz/kEaKdHt8OBEaJHISLPH795AUUxCAL4+HW8dxd6WipTwVX9VIvhQ1077r
X-Received: from wmlm12.prod.google.com ([2002:a7b:ca4c:0:b0:45f:29fc:83d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2389:b0:3fd:eb15:77a
 with SMTP id ffacd0b85a97d-42666ac2da4mr2403184f8f.6.1759938427683; Wed, 08
 Oct 2025 08:47:07 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:54 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=ardb@kernel.org;
 h=from:subject; bh=jCkHQXSdf8VNipopESRILGcuCgPWNMlfZdyre0v/uHk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZe1iU7eedkh0ZXVG1KaJNn85s2LNxVn6X6HFXzp2nI
 6vrlfg6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERm7mVkWPDjweI7tbdrJQPY
 eIJjdzxemCDdfydySVTtoncHsld9F2JkOOuxUuhE0XeuS1f/dqy3qu09MXn3XCM9na+rHyR9evz pOzcA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-43-ardb+git@google.com>
Subject: [PATCH v3 20/21] arm64/fpu: Enforce task-context only for generic
 kernel mode FPU
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084710_155196_C8CAA08C 
X-CRM114-Status: GOOD (  13.67  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The generic kernel mode FPU API, which is used by the AMDGPU driver to
perform floating point calculations, is modeled after the most
restrictive architecture that supports it. This means it doesn't support
preemption, and can only be used from task context.

The arm64 implementation is a bit more flexible, but supporting that in
the generic API complicates matters slightly, and for no good reason,
given that the only user does not need it.

So enforce that kernel_fpu_begin() can only be called from task context,
and [redundantly] disable preemption. This removes the need for users of
this API to provide a kernel mode FP/SIMD state after a future patch
that makes that compulsory for preemptible task context.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fpu.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
index 2ae50bdce59b..52a1c513bdf3 100644
--- a/arch/arm64/include/asm/fpu.h
+++ b/arch/arm64/include/asm/fpu.h
@@ -6,10 +6,22 @@
 #ifndef __ASM_FPU_H
 #define __ASM_FPU_H
 
+#include <linux/preempt.h>
 #include <asm/neon.h>
 
 #define kernel_fpu_available()	cpu_has_neon()
-#define kernel_fpu_begin()	kernel_neon_begin()
-#define kernel_fpu_end()	kernel_neon_end()
+
+static inline void kernel_fpu_begin(void)
+{
+	BUG_ON(!in_task());
+	preempt_disable();
+	kernel_neon_begin();
+}
+
+static inline void kernel_fpu_end(void)
+{
+	kernel_neon_end();
+	preempt_disable();
+}
 
 #endif /* ! __ASM_FPU_H */
-- 
2.51.0.710.ga91ca5db03-goog


