Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC43FCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HiF5drf3rvuABmv6sPErXIP4rKLg0zCEPYPnEhOmOzg=; b=OPUvdoMRmfmrCC5VM/mZ6P9tGn
	+B9njASDjJew5DcMS/MJfvwp0zWGfrOmj35aqZGU+B08/gqmQnu1Kzt53Vn4wbY150hbgn86qZDNa
	WyOcKmvvX2YRVk8S2ZyKyqiD0XOKuywSmt2WkFmi6W2cksvLr2osBKHTPFq4f9NmGOnEoQZWM/hs5
	z+p7YvlE2PDFVviloGiZhC/6fkj0UIx7GzPtKTmBkwMBDe6kiSumi5GWT7CmWVMs72m6AuFGl6bjP
	N4+w9HTYosMyIV/puZg0n4NqkNipGG7Z0lzxl+aK08QH/3AACvhVN3sPqFLbBE1/9YBeWtI7roG2K
	k3ViOuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNST-0000000CGwc-1jQ6;
	Sat, 13 Jun 2026 12:27:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNSQ-0000000CGwC-30WQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:27:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so11937295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781353645; x=1781958445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiF5drf3rvuABmv6sPErXIP4rKLg0zCEPYPnEhOmOzg=;
        b=n7OUtAXpQ8qKIUozcHZ2sV/URCXOATST3di6NeY7q1zfVY/VN90qJz2fTc41tWgGcY
         dyKpRhqYNwhgdMHrQ4fkHurnMOju8ZqwXWjh7WTvZupRpfR4/CymPWGs9w/HYLdZ/B3P
         r4PR9l96qi8YNy1IhzxI/s6SFSc1xjyC7xQY5Vgk1k5sJeMdtxC8s9N4ulNCGUpwmSzZ
         U4WPDSYKwk98NcDqiWgfLrSvzG6g8EdLTY2kbYzWHeYQJ6blKrYFi5pXrXGWPrQK+Ttx
         YEbD+h5kPUosiMnbC3fR6NpCtIcfK6qC+mqcQAn54FMb1/VyKrtdGJnnYZzOq5FrD4wg
         oIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353645; x=1781958445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiF5drf3rvuABmv6sPErXIP4rKLg0zCEPYPnEhOmOzg=;
        b=br/OKHNgCrK28Xr9XFXebb369beafuYJjR5y5tE0EP+O5G0eSHZqR0lqLty8zKP6D7
         xm1+jhozA7FDRmpT54BFoA/PgdZWss7sua5GogZGL8x4e1qRYsmquSrMfiSmpXI5Gfol
         1gDCoBfHYB4LMTYV5YWNy9JHAHFpd5rHbCnZRGAnBx0TggfWTty1q4jF4h+puvvRMaTw
         A66Fz17mL+HvmaLJdy+YhuAojHqAK43Xg4S1UR0a2A2CcBc0CCANP7o5rj7z7hbl5vmJ
         NoEyarLfhnKW1fWcURc2ZKzDjMg7AfEYTkmwGKz/qlsvUykLvin136cr5fDb0ffw26Pk
         wqHg==
X-Gm-Message-State: AOJu0Yyv7lfXfutZJ5kYzisDGhgvtYBPTbE/dS1sViXzqUZ2ofSiVuki
	V3Cpb3ChIcAuDeHHBDDRgzdQVxgcURfcGQvL6+MxNZrtUk31C/GXDmsG
X-Gm-Gg: Acq92OF2LJJ9i5YpQpna9gCFZNyhRidebJNjAY9ZSfYu4W31S1VD11Ffzh6jb3baMaw
	H72kCudlkgxfa/GY0ta7eM1sIX3oZcaj+m6N6BaxwMYWIEIH4/3vAnicZrqh216Kfd80ulSFfpB
	nN3Z64mT/d5VFfWUfsikvByjjAxIhpGGxTSGu9RiLXsXOvzdSyekZBtQh3Udw50WysbEOzD/kA3
	sKnXCu65fog3GTms1X4663Fdd/F/2pzCljiim6uu0KXrbUQB0jiLu2WLW/kax8ouFYDbHW5ss7f
	Me/2irGWtWtBtWGlh+dmGhGR5lQaXaONiDw4u0OWLsvsL1AOT/ntOpvV7G0S1Nn66UGhOxfpNrb
	Zin3HpIrFmfSRros2IH2Po4fZr+if3rBuDSDY0w/U9dD2ccKRacfyft0Ea8C10y0lKMQzrWQd1P
	oS/fKHiA8bgpSIbLE=
X-Received: by 2002:a05:600c:3e06:b0:490:a964:14f8 with SMTP id 5b1f17b1804b1-49220084947mr40343985e9.8.1781353644739;
        Sat, 13 Jun 2026 05:27:24 -0700 (PDT)
Received: from debian.. ([185.3.146.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm76465685e9.1.2026.06.13.05.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:27:24 -0700 (PDT)
From: Tal Well <talwell02@gmail.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tal Well <talwell02@gmail.com>
Subject: [PATCH] ARM: Fix potential register clobbering in __get_user_check
Date: Sat, 13 Jun 2026 15:27:07 +0300
Message-Id: <20260613122707.512353-1-talwell02@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_052726_838342_3474A134 
X-CRM114-Status: GOOD (  13.22  )
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

This can happen due to local variable registers being call-clobbered by
uaccess_save_and_enable or uaccess_restore, which can happen if they
become slightly more complicated than they are (for example contain any
memory access while KASAN is enabled).
In that case, the first user access will fail while trying to execute
the init process and the kernel will panic.

While this is not strictly a bug given r0, r1 and r2 remain unused in
the uaccess functions, even something as simple as making them noinline
breaks this assumption and there's no reason to rely on it.

This is similar to the issue fixed by commit df909df0770779f1a556
("ARM: 9132/1: Fix __get_user_check failure with ARM KASAN images"),
but that only handled clobbering of r0 by the uaccess_restore function.

Signed-off-by: Tal Well <talwell02@gmail.com>
---
 arch/arm/include/asm/uaccess.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index d6ae80b5df36..290ce8710773 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -180,12 +180,13 @@ extern int __get_user_64t_4(void *);
 
 #define __get_user_check(x, p)						\
 	({								\
-		unsigned long __limit = TASK_SIZE - 1; \
+		unsigned long __limit = TASK_SIZE - 1;			\
+		unsigned int __ua_flags = uaccess_save_and_enable();	\
 		register typeof(*(p)) __user *__p asm("r0") = (p);	\
 		register __inttype(x) __r2 asm("r2");			\
 		register unsigned long __l asm("r1") = __limit;		\
 		register int __e asm("r0");				\
-		unsigned int __ua_flags = uaccess_save_and_enable();	\
+		__inttype(x) __tmp_r2;					\
 		int __tmp_e;						\
 		switch (sizeof(*(__p))) {				\
 		case 1:							\
@@ -214,9 +215,10 @@ extern int __get_user_64t_4(void *);
 			break;						\
 		default: __e = __get_user_bad(); break;			\
 		}							\
+		__tmp_r2 = __r2;					\
 		__tmp_e = __e;						\
 		uaccess_restore(__ua_flags);				\
-		x = (typeof(*(p))) __r2;				\
+		x = (typeof(*(p))) __tmp_r2;				\
 		__tmp_e;						\
 	})
 

base-commit: 062871f1371b2e02a272ff5279c6479aff0a37ef
-- 
2.39.5


