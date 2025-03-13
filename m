Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA311C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=; b=V77fMbHPPM03MIFfSe15MiyVD2
	VU7fJ8Jbb/L+kkjFw4xIakn9BWGmoySSu7gY09UvPIFqRh+5rZWvcTvI1K2R2m2CYtG7tvg/EXxoV
	7AupcWKwupGZrn0yNj/kWQfZqyzJzYOyKes9ApYRw9Pl+J3md7ouI1wmMJYY4kvgBjfrx6XLReGSi
	dwH/FPcLijgFVAhUEsVarE66igqOO1Xi+QHLg11l8qtewgdMfq+YsJ64bMLAc66l5q3xNfWr24JfM
	nCUSSyYREbymZC2v5Fgsw0bJZ9FdJ3Gw+Nj9RVVM/0e3pIRUlEw93bblxC4haO7RtH3ERD/KjW5v7
	ELMppPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshPF-0000000BCF6-3ulY;
	Thu, 13 Mar 2025 12:11:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh17-0000000B60V-2Ev3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
	b=dMuHn+mRm+CNZFyid06pRdGJ15JUfwAEdLIyovzT6eTCahNdZDgTI7YsQRhUVJ0Vs/xT+m
	OVzTEJ3VlH2sIRGJEvys2Hv40TVvH92ImzNafTExOGdv5qRlbFQ+naMQ9qVIKdGw8Zjdpb
	RYQ7MlPICX29XpIGACop8G9u4eLwkEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-gD1ZpaNfN221Pezj48OVsQ-1; Thu, 13 Mar 2025 07:44:59 -0400
X-MC-Unique: gD1ZpaNfN221Pezj48OVsQ-1
X-Mimecast-MFC-AGG-ID: gD1ZpaNfN221Pezj48OVsQ_1741866298
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d01024089so5948895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866298; x=1742471098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
        b=KetaEAuhy5kKfqhBbjN2aZsJlzTvJ27D0T/7/A1hcLhAqybQvwRn0/QZL5H6dG1ARp
         odXyBB2AkQsvoZRXKfWLtfX11irDqiigsEufzKsvgi/xoPLE/l46sAbMXxXeo4WwcZbZ
         YF05jvEqE2QryDy2mEsOIkpzI6iWnqQBXp33x8AM1lY8TU+Xx89w+YKL5z6w1nK06tDY
         dHRei7T2IOr/jDjSDMDUf9qUa6Lz2xozIU3gxltr9ww9hrUk4oQUh8FHpOqv7Xtl7Tfi
         YJtmBPxgX4pOII/YoZd7grvxuOaIUKOBqviLGzH5iqsTjKxx1/GeUVuc8+46fmKARYjL
         MVWw==
X-Forwarded-Encrypted: i=1; AJvYcCVDyT4TTq+khwU+bYkc9TmZM6HAQhTTespeqb7bTCLC1pTHtY7bgPEVrwIYOihsnLV2NG/B5VMNFHCVp2grkyd/@lists.infradead.org
X-Gm-Message-State: AOJu0YyR/Ps8HB+AzRwRGPBfoGr5bxd025j6AunZUwZ3O7vdR/YyJ8ZI
	OHEd1EF1JZSCVJU01m1kFz3euBNIGPZDzdz/Fu7yRv9J/P5P81m4b/C8Fo1hLgs9XXQvQanM114
	ww73/dCTpSUhdcEUdb9TNeIIjunh4Z3J5xbg9phoudkECzHzFJw2CahES3fzRLYFNZLk93p59
X-Gm-Gg: ASbGncthn6/aYAXqZpBdw2hb0LbhyTW2GuxAFcCOTvlI3TE5H8u5hswHXqTRe48idNo
	W1QkLJjzkOUHiBZQl3xw6ABi8mr1w281PArswr3/y328wT1JkDwCMKfe6LuML62mqZkFJcrN+K1
	s/+tOacxjsgxmgn1SxPbzGg0a+B/0I5PLVw2RyBRBSrvM+tOOjw2V7xkRNKFcbix39PKHsRvqdg
	vxET5y13W6hXMwQ9MHbb0nassVDI4c0sVQeZfKjLNQ/AB/6yWDdtKsK3Hq4RcN4IH9tO9lcUu73
	sVXm6SapsEzZg6cMg43f
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198762315e9.10.1741866298359;
        Thu, 13 Mar 2025 04:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3R3Nh+MesHXp5r1AiRFiydlKhpsUv7CB4RneKkaatJviaz79nmlaZTG/mhvpsulZ3LqTgOQ==
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198761995e9.10.1741866297943;
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 13/14] riscv: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:28 +0000
Message-Id: <20250313114329.284104-14-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJOwdNKNYxYe1lMTPisYIspsgs7E-v6kA3A4n6VgNCE_1741866298
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044625_657715_B4B9DCB9 
X-CRM114-Status: GOOD (  14.55  )
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

From: Guenter Roeck <linux@roeck-us.net>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..79f360af4ad8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,26 +30,39 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
 #else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	__BUG_REL(%0) "\n\t"		\
+	__BUG_FUNC_PTR "\n\t"		\
+	RISCV_SHORT " %2\n\t"		\
+	RISCV_SHORT " %3"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	RISCV_SHORT " %3"
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,10 +71,11 @@ do {								\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
+			".org 2b + %4\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (__FILE__), "i" (__BUG_FUNC),		\
+		  "i" (__LINE__),				\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.34.1


