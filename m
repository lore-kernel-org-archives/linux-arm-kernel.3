Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA1CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moTm52zNGwrt++YsXPE2KY3jx72epI/Bj7ns6GGNFCU=; b=Rdq5HVcR53juNk4GuBoTjHVKzl
	k54AR4zQpAdKgEGpw1/6OhWy2Vo6Uw7cksI3EHRwmvLp4VkTTZTnbPn8JeGEAkJuaGWakAi0bksiN
	TfB471qtIkm6wP/f7LGlT8f9makxRZ0uxijyk4XjUdrPEgJFVljamfVBxQxf/uzD57Am9PrngzXH6
	y8/NJj/yh0wpu0AqufeolwNm9OJj9VU6A0LromrbaWeKZJ0naqZZnWbCFKPbMMFA26LfSNhWMG/vH
	jErdVptk5SJF4lydpzVJLEWjg8D/p1H1/rXUHhFW1RPsZPh5++K9j+haHu2PHvG2lhmUPdUYgCwVm
	wOw0qFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98ch-00000002trH-4A16;
	Wed, 15 Oct 2025 21:01:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cg-00000002tpD-29Tu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=moTm52zNGwrt++YsXPE2KY3jx72epI/Bj7ns6GGNFCU=; b=Bom20v7hWTA/fOmhbENybApAgn
	bh0ELJyCR5h59ESVdjXgeCZnRKA9ShkyyviYLKhsaTk7qQVxc+d8IOzi/iMiDeSrnGXO3FJ1Mg+l3
	8TuDMTY0yKBI6bOOmeCB/c51mwp/wsBuVx9PDYI40Wl3eqw/Pt3nWLC/bw+PUUIbgvCczt9ti9MwV
	Zhsx5HBv1atty82UaI5bzS0JM3DO+UKnyEZCsO3f91jZscS3/j2nrkDJYbdEOOeVBDgh18gZNe/OW
	LCiiVGV4r+rMze5Irvb4B/ivKjMu1opI9wYpXe8gCrum26p8Mo2GZSeA33h5M45VlhiSXa1oelyGJ
	nfQ3GDRw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cV-00000006G96-418Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46eee58d405so118175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562067; x=1761166867; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=moTm52zNGwrt++YsXPE2KY3jx72epI/Bj7ns6GGNFCU=;
        b=sSaL/QTogvK1OQKdJ99j/+hlz+l7i21ntCR669fu2fFGm78r/mWOLs8sKc2igW6oj1
         lzZo6qZyn095h0MQ87UuAfe52rAJUyJucNM8DhXIJWTaEW8dNtFeCTAK38Wnffcu+PPp
         0ouk89esZ9evMSjZ6endhKOEnFRmwTYX9nYzAJsie0uTYKV+duefFLJSY1d/cGjti93y
         LSfSs13khVfYxpT53PDNor6+rQrvM9u32+sAGLlGnWs2dIUu5mNzb2H7Y73Haen1mQqc
         QwZCnbXgtZhWkVSgCYU0zheQFHHGLoV6xljaDtqeeibchf52y9Rto9GAyNpkJ7XdiX/b
         Tp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562067; x=1761166867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moTm52zNGwrt++YsXPE2KY3jx72epI/Bj7ns6GGNFCU=;
        b=fxlzlf7NQc9ykcivF66z0RNRYKqROAQsXnp9T0mmmhzdp6GyOIVO3y3Gn0tu9QdUm1
         c7v73JE+bVR2sDQduB7wOK4Xki6MlNu7DPorMw5vgx1oMfsH6JVQwvGc8bg9YmUUpwug
         hH361fvd5d6uIHjLB/n26vY/5Ha7SOsQM4IzqAEmaudflZZ9Czio14erEkp9YordzgKZ
         Ql/fHF0E7uNMLLlVJInAbK2HCBxs2loxw7YSCUMsZs1BeFDsBfIndMENwPryM7voenVw
         AeiRFFn228wQjz+3LP0WOFl/UPp/Ed1lihpN1nPiwoshprfMZ+/8T4arJnLAvjUaLKeZ
         bW4w==
X-Forwarded-Encrypted: i=1; AJvYcCXvM5eDn8bs+lBR/pPY5FV9Bj1lnhZfkFuk6fdh8fHuT99iKGLU5zvz+pSzoYd/y2oUv6V/z9Cnb/m1cBJ5rKkS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz65jgeFoztkNjUQvfI/ORv5OFh+z3A7gNAY7ZcMatmnOMYZhJ9
	isVICqcVfZEy+IRYkIGbCKuT1bhGb/VRAm+PG8WlJX8i8mIEQmXdPkFdagMuVaT4P8wARtzJQA=
	=
X-Google-Smtp-Source: AGHT+IHH59sy7BRWjY21dGoKX4xtSPPUT5SSUEKeDj8aOzwiGGO++q5eu2jsvFIaGupUZgFYbR/j27IV
X-Received: from wmbz7.prod.google.com ([2002:a05:600c:c087:b0:45d:d60a:8d7e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4745:b0:46d:cfc9:1d0f
 with SMTP id 5b1f17b1804b1-46fa9af30e5mr238090085e9.19.1760562066912; Wed, 15
 Oct 2025 14:01:06 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:40 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252; i=ardb@kernel.org;
 h=from:subject; bh=oVK+oBrwb79YVKXaSmfzPNI2/YhF6t6CcaRgcjvBZKg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV1f3/5ul8hNbKh+8Zbsj80cisndue7zrlEc6PtOnT
 QpiddjXUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYit52RYZ4Qs+dJc9XZnP4n
 frR4rXqa5Ma+X6v4iZ38lyaPotjSK4wMX9/J+1/oEZxeKK1ySNHzvbd/MssT0+t819wvfLoxnVW bDwA=
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-14-ardb+git@google.com>
Subject: [PATCH v4 resend 5/7] arm64/efi: Drop efi_rt_lock spinlock from EFI
 arch wrapper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220119_065968_5E950804 
X-CRM114-Status: GOOD (  12.46  )
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

Since commit

  5894cf571e14 ("acpi/prmt: Use EFI runtime sandbox to invoke PRM handlers")

all EFI runtime calls on arm64 are routed via the EFI runtime wrappers,
which are serialized using the efi_runtime_lock semaphore.

This means the efi_rt_lock spinlock in the arm64 arch wrapper code has
become redundant, and can be dropped. For robustness, replace it with an
assert that the EFI runtime lock is in fact held by 'current'.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 6c371b158b99..0094f5938ba6 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -165,19 +165,16 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
-static DEFINE_RAW_SPINLOCK(efi_rt_lock);
-
 void arch_efi_call_virt_setup(void)
 {
+	efi_runtime_assert_lock_held();
 	efi_virtmap_load();
-	raw_spin_lock(&efi_rt_lock);
 	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
-	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
 }
 
-- 
2.51.0.869.ge66316f041-goog


