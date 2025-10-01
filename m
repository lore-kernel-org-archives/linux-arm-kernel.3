Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFECCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYBWVcMrL+XqSLPgxbyO6R+Pmodg0fLAvWpUbIMCypQ=; b=XFj8BfGPVCZ0stG/Z5Qal1a7NM
	LGj7GOksQFyV4duwqJC0ZuCHUqFV2VZX8ebjHVVKjQKXGcvBPlUX/RbD4gRq9nwrrPvfU5SwJz478
	WtQJ+E//TuweBFB9RUt+PAjNmdD5rQJj6xqO81rGTe0vEa9E/HLQ5ZjW9prDxKeLmzuRn4vvgw745
	2Sxo77cnsDsMZmqL0qGT2OXb+IyS7DyUcNSleAzFEck8sj9WDhK2PifWotJ6t5X9fRqn7xpZ/XZAB
	WINDC8AT4FLpWeExPtuT5F2+6znQJGga6TtnDScBFzHQXIHHpd0imVBxbr4vFgTnNIJZqotRMUxr2
	fQnYevlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zX-00000008yxl-18hW;
	Wed, 01 Oct 2025 21:04:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zV-00000008yvX-2fdF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UYBWVcMrL+XqSLPgxbyO6R+Pmodg0fLAvWpUbIMCypQ=; b=g9cQvjYnrBzqW2Jg75YOu3LEl8
	Ef4pIG96R0gkMFitVPO5FJbQ87PF81e4uJlTZ7+3zV9NaxUwiTlalGrcJXvwjEIUAXcziKCn/uZ1J
	l6guBEtZeZsFtVW1zFA+/AhigMSBaomSDH5eQHODNBsRRr5cB5BT+EhQkr50fR+zrYYP31zbrWCWF
	Abd0R9L70MumfLwoVWFRiweG2GWmu54Avt8jC2Ad+BNhZ6j9ptOu8YKaqx+e7dyJ1gg4lv4m+/q3g
	qnsJw17Ljk+SK48q9QulHIymijxvl1Bzt9Z45HX4bhucK5TCNdzAWEhOduPgyANUH8+L4H8ZjBKC3
	HmBC+4gg==;
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zR-0000000DoOP-0eja
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:00 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-afcb72a8816so31997566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352633; x=1759957433; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYBWVcMrL+XqSLPgxbyO6R+Pmodg0fLAvWpUbIMCypQ=;
        b=ezirQw/NNxe+y0+QMf9mNHxRSlyFpsOoJtE036JTygaBY3/ZCKUe67WkQcgRcFIXDo
         OOJG1eBzjInbpRYkodGzvZXAXWcco7eCm4A2Q1CVgRgC9KQnBgUBERFfL88tnAZxgGd5
         MaNjWdKj29ETPlDTr5mV8210vZPBUHEUmDCv3dDHTbm7e6iScvkotFSAFfcCbpJj7W0u
         Xul2aWwwC5tZU5Zw21YBA0yLks7YQMLR8SuZQLe3VCV++hN39wk9jhDNH/4FKE9+MOys
         WJD0hraF/i2Q3nV0TNDq+kJPEj/75+ITtmnfODPzJRey/3W+YHo4CXDiPZC4tIXOV8DT
         ELwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352633; x=1759957433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYBWVcMrL+XqSLPgxbyO6R+Pmodg0fLAvWpUbIMCypQ=;
        b=klvEtcn6d+FF8R5nhFuWBGD+xeLw5e2g5pA2tT297rTdpSSUCpZ3Ar3LBkxHWmfE4i
         /vB5QpPf2zW4ZzVAGLyzkEKTBSyxc9LuBlPjP5uO5CnOsczardNbqaRnVjDgy0rHRe2b
         UuAH6X69VSWp/Qc+a9Qw7tskaAFWRTIZ9DJdYzS5i1jAcuybih86z4XDKFw1bjY4AQwM
         vdC1weWd+zW5k9ejtyLA1NpjqlKA3B9r2fCsgLVGiXq8YWnUrAuxC3zq5lTK/bIgPU6w
         1kQSjiju5USnA4wdRFwHWoChq9g8ON+TDPgymvTcQYZf/ueKV+91+b06ZQfEiguD6PQq
         INzw==
X-Gm-Message-State: AOJu0YzltsaIMAHAxL+fP4lrmIYwKpJodHnVA8u+ROh1Nyu9jYitgUBv
	DQyN9dYhAdc0usRdRMbLeRktuimhZbIahwd99ddj7vSnPWAR3oK5BR029br+80EOJoypxSwrdVt
	dSkw6D7esJYY7rdoW+ZWE5SKzUq36xVRJhPfuJdpGd3W8GKN14NTuOht0RB0T5HCW3ue0AkHEn7
	VDQz11GkMmx4lFxbKBfEZHp5v++/NRfqHZXGcBEhcDNXZq
X-Google-Smtp-Source: AGHT+IHMlqwMCs9Npi3jOeY+LiGowC4953WrKZ9yJK8uSZJrjaUNV6KEIrxdClpYRueyTEYTFhCkPyP5
X-Received: from ejbwq1.prod.google.com ([2002:a17:907:641:b0:b3f:5a00:1605])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f8a:b0:b04:3dc7:7d80
 with SMTP id a640c23a62f3a-b46e585ad3bmr632727366b.18.1759352633431; Wed, 01
 Oct 2025 14:03:53 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:04 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=ardb@kernel.org;
 h=from:subject; bh=zW/Ll9u+2fAT/Va1/PfNMYyKFzy2uIhE96GfLDmS5ew=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGjdltPIlHC+BqQZgjT+Q/Oqs9tM4IdV3oG7ERBq2+2gSCD9a
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmjdltMACgkQMG4JVi59LVyPtwD/fjev
 K07ta1hTMaGo/CMNU/2cOZDAmzhu/3WAashGtlsA/joiQcKT/3M+Pd4404SNOcFD27Upbf7uPzp TSe/KAyMB
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-24-ardb+git@google.com>
Subject: [PATCH v2 02/20] arm64/simd: Add scoped guard API for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220358_455221_2AE55B87 
X-CRM114-Status: GOOD (  12.56  )
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

Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
cleanup guard. This hides the prototype of those functions, allowing
them to be changed for arm64 but not ARM, without breaking code that is
shared between those architectures (RAID6, AEGIS-128)

It probably makes sense to expose this API more widely across
architectures, as it affords more flexibility to the arch code to
plumb it in, while imposing more rigid rules regarding the start/end
bookends appearing in matched pairs.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..d9f83c478736 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -6,12 +6,15 @@
 #ifndef __ASM_SIMD_H
 #define __ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler.h>
 #include <linux/irqflags.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 #ifdef CONFIG_KERNEL_MODE_NEON
 
 /*
@@ -40,4 +43,8 @@ static __must_check inline bool may_use_simd(void) {
 
 #endif /* ! CONFIG_KERNEL_MODE_NEON */
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif
-- 
2.51.0.618.g983fd99d29-goog


