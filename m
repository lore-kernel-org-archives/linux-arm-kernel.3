Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFE9CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=; b=Qct+I77vmdf4lc9oehXPGTOkai
	02Z32+HN/R17Ima4yx+4fchTkXDWn+2i9Vymm+tmccz3o+4/ggoWITX1I5f+u8Rtpa0fOP4jiVCYb
	Dmnn+3a+8wlnr+4F+rWhx+qDVqWOQB94bRxNe8xE3lZCR55knk9QrzPEWLSLjCbME98q1jMAotu66
	CS6KNCJx/JKzFGfUpCaVlYNxcB1FK1UUzpHWoibiIxDm58eE/oLJ4sDItnfAXwlgjRJnoFZPCPcN+
	JPwdkjs21Z8lrKm+AnA9/CcbO49tDSCd7f0UtRpTdSAvXGhR2VAmtWC0+y6weJAZI+7KE7leMULiI
	nShHqFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipx-00000004d3Q-00dC;
	Thu, 23 Oct 2025 00:05:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipu-00000004d2A-2eQ8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 00:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=; b=O+Fndi6Ifklvwigq2INTCJlcA7
	gfr9vESM7AnCncYme+LFggWTQ0ipo6VCuLQtQns+L8nM1Y4dSRWxtxTyF9NAnsRuPSXp1vYZ4eHd9
	jsdKwPYzHSWBN0IbytupIRIeQCB/KIyxBKdxMoSelf5EMBIqURPuQcRhtRptJoJle6zAATlDsmbmQ
	o2vZwzVvW87OIGlNfWmTO901gLYTeks2Uvm8G1YfJEi/pZRAtxiRoqNbuASKj1EIn2ox0/dnhhJu9
	clIjPLg76kwPzp0sf1bgnpc43me8R61h9NCmwBNMNRxckbTYK5YpxW9A1Ba3M1wJgijI2F/5zmyO+
	JdWLp0kg==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhyB-00000000vjz-0cgU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 23:10:17 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso113582a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 17:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177939; x=1761782739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=;
        b=ZJBGNjiXo9SlTXlPYyVGpxOFRAxbC4kUK1D9LAxdoIZtW2WQdtfYiuJ7kwGkAVyzks
         jHPzshZxj+OfBQ/8e5hbHOGOEx+XEJwABcQl8RD3PAZQo+Jj/d3h0ZSDLx/VUp6XD3R8
         mx0U9r93IvKG70v22Uv7cX/w8WH4djJxqnHp+c14WhnMPxk+kMhbptBItmeK3peczR2D
         i1IYOT1zp4ztZYAUuwNAoJ8WX6hiXgvsS7N5pOfWV0jFhvtRFHnNE6l7ZYcaU2OhjuB4
         MAQcPGQ8mK+W5Y7+u9i/gDTTNfB6l6YHaVTC2NKrcpw/stLgEV5yVJkX8wylKS/eB0jE
         kA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177939; x=1761782739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=;
        b=moM+hGHTrwSAlVAWdnGoAFkngLWrZlJgC28Ih6EvYhvsOPzZBMZy5heIdJEdLdH0+D
         tiCEz3TW/1qHf28kfdO/DcIz01OSvxuuEMCFBG7vXmCKNTu9Q1b9UbnrpzehuSxY+vDT
         DVVSKFwyyvKRMxWzX+nUaVV5gmUJAZ+3epowN7IYo9kf+AYAInMEwFBDU4wMayv3pier
         tP0eKtPKB+qyYFVmTTnYmKSCl078z9i9wzt5DGVKBW4mISG7/Ak9wS7a0ZHpDdrQYQ+E
         FOcaocIBkWwSdcUYA3PPpIxLmw92VKd5MAnhB4aRC5SEqPYr+g/faDqpZ2Mk0TvDd64S
         W4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUCKn/eWtUcKcMj5DBkpQabFXtMJJXF6YDPxyPtygFZAKkc4OV/KHrTDS6quvMTSTDUM9WJZNhYocfBXJ8uC0f+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6/3nOYWub1w0J5G5r4qJvxAvMaGRS7C2klGj0X/9Uofbxf3q
	pxajr/0VHMqwSQPwVcyNXtafvAccAU2QRwet9dWiRGs8E2ONry4oP83EukuLfv4ADj4lnydkhVx
	KXM+81Q==
X-Google-Smtp-Source: AGHT+IHd943MEU/q3sfmeNkNkm5n04WovhTQk4e5Fqu5kHZgqjXBaWuFFpabxZxMuUt+TzoW6CCUrGaxrt8=
X-Received: from pjbgk8.prod.google.com ([2002:a17:90b:1188:b0:32e:a549:83e3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b0d:b0:250:643e:c947
 with SMTP id d9443c01a7336-290ca30e401mr284211495ad.28.1761177939351; Wed, 22
 Oct 2025 17:05:39 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:43 +0000
In-Reply-To: <20251023000535.2897002-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-2-kuniyu@google.com>
Subject: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_001015_433953_4DD8724C 
X-CRM114-Status: GOOD (  15.25  )
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

In epoll_wait(2), ep_check_params() performs a bulk check for
the passed user address:

  if (!access_ok(evs, maxevents * sizeof(struct epoll_event)))

And later, epoll_put_uevent() uses __put_user() twice to copy
2 data into the region.

unsafe_put_user() can be used to save a stac/clac pair, but
masked_user_access_begin() or user_access_begin() introduces
an unnecessary address masking or access_ok().

Add a low-level helper for such a use case.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 arch/arm64/include/asm/uaccess.h   |  1 +
 arch/powerpc/include/asm/uaccess.h | 13 ++++++++++---
 arch/riscv/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h     |  1 +
 include/linux/uaccess.h            |  1 +
 5 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 1aa4ecb73429..30726ce182cb 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -422,6 +422,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin(a,b)	user_access_begin(a,b)
 #define user_access_end()	uaccess_ttbr0_disable()
+#define __user_write_access_begin(a,b)	uaccess_ttbr0_enable()
 #define unsafe_put_user(x, ptr, label) \
 	__raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
 #define unsafe_get_user(x, ptr, label) \
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..910bf469128d 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -437,15 +437,22 @@ user_read_access_begin(const void __user *ptr, size_t len)
 #define user_read_access_begin	user_read_access_begin
 #define user_read_access_end		prevent_current_read_from_user
 
+static __always_inline void
+__user_write_access_begin(const void __user *ptr, size_t len)
+{
+	might_fault();
+
+	allow_write_to_user((void __user *)ptr, len);
+}
+#define __user_write_access_begin	__user_write_access_begin
+
 static __must_check __always_inline bool
 user_write_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
 
-	might_fault();
-
-	allow_write_to_user((void __user *)ptr, len);
+	__user_write_access_begin(ptr, len);
 	return true;
 }
 #define user_write_access_begin	user_write_access_begin
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f5f4f7f85543..9adc8f0dd1c8 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -452,6 +452,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin user_access_begin
 #define user_access_end __disable_user_access
+#define __user_write_access_begin(a,b) __enable_user_access()
 
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long enabled) { }
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 91a3fb8ae7ff..23edbaef9f71 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -524,6 +524,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin(a,b)	user_access_begin(a,b)
 #define user_access_end()	__uaccess_end()
+#define __user_write_access_begin(a,b)	__uaccess_begin()
 
 #define user_access_save()	smap_save()
 #define user_access_restore(x)	smap_restore(x)
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1beb5b395d81..a6e32784e6cd 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -552,6 +552,7 @@ do {							\
 #ifndef user_access_begin
 #define user_access_begin(ptr,len) access_ok(ptr, len)
 #define user_access_end() do { } while (0)
+#define __user_write_access_begin(ptr,len) do { } while (0)
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
 #define unsafe_put_user(x,p,e) unsafe_op_wrap(__put_user(x,p),e)
-- 
2.51.1.814.gb8fa24458f-goog


