Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51DC35FF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=; b=tbaIEHuhE9YsuXAkc0zhrQJVPJ
	Qfxb7TbPJ+29M2Neo41A1S+RAyZbJt/xolBnoeTPnmvQqwBmbCN224H/YT1sFfs865dUSJ1r3jdrP
	KJBNOZG0zKOKBZniRwjfXC9rFeon9AqzLmO8Sg4aSy+z6087CU6ExhlyG+zC9J4ZEb0+9fOiVoeLb
	8UN2UDyIRqowlF8Asz1iZbM0ijxl2kITQ6Ub4azoyvnhvOCFVTAOkJnl3Ewk3jSweIlu9dcbHo0jQ
	mrL/jeoUwqJCBi+PuuXT0ARHnjQvogY+nfuw2NqTVMQ6MCBWN50UxRO0tvXphc6G37aGCmgoAolNZ
	DMdo6STA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQd-0000000BVb6-2FR2;
	Thu, 13 Mar 2025 14:20:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh11-0000000B5ys-1bXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
	b=IsknodAYvEWII0VKzxy/pdMgpRDYRZektZ9kFRQ1sQWYhSu2xoeUBUyyFwn8CKgPKSEdGS
	PHVq2ST8lZx0w4LnKoEARVPreiZXzD6fle53Du1VkA6jLibLT6NN80N+RQXHV2YNVJyeph
	vyxwgPaeDUOT2vsBpyHyFCGVFV2+awc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-hyt0A6qXNvmiaZZ4DVMHGw-1; Thu, 13 Mar 2025 07:44:55 -0400
X-MC-Unique: hyt0A6qXNvmiaZZ4DVMHGw-1
X-Mimecast-MFC-AGG-ID: hyt0A6qXNvmiaZZ4DVMHGw_1741866294
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso4357205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866294; x=1742471094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
        b=HB49uq94hutNnFxljPSiNn5tVRk+RbC5cUkTyPSP5/BRKMSaaZ2AsvVtFZsiIW/WFU
         PzGDPq81DIcl+Y8EtUmZQnZmRgCBxWXTOV08mVBU9AHu3gD+OTjvpCY+70/xbKBzFHPj
         iaa+NjCip2VVoSHW6zkohQCElW/CsVhAqt5+kQbMV+bEVDopJNXUm6l1GK/RkDKKNmR5
         20Y++lNgw3PH/Up/VySpQyFDmsbuSG1r7djsAIMjeZ+A2DTxHe6bRz1BhNK357pNfA7n
         p2fpNsd31ksnu50FabPwKKZYFigyQZkKZjH+eMN4ZC13e9P9YCF9GrujbplWn3kiRBBh
         k4fw==
X-Forwarded-Encrypted: i=1; AJvYcCVdD6hNfT4WC2UxSDCADRcDr41WufAaLTlt+WC+FJc8UTI1akYCpKBZUURpoJw+TaAgag/PhDu/w+X/NUsi9gsJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Bl2XQvfwCTSOjmqtJPaDtUp06Nmt9Wg1wzgXf0tCphNAcgVg
	WgVlJg/tK8c18OdLCFC439miYvylJ5rt0bwA5KW2T1AlD3KlCxlWEcxVTWrurVtDmUoiI6G1egu
	5Obj1SQiBWb9glVfcmYa+/LdKDijV52L0Q8xg3hAahXotkplFkXS11w9WL9sZ4nMK5KoCIg/e
X-Gm-Gg: ASbGnct/u8JXWr9XxBx5dwGhiqK2mRoZFm3USZ0RsxVFfYCAT7kRvtspy3TKTtEYxFD
	dcwwiQW1gLu5QvYkBIt/qs8g8Cms40ljvO8faCC4Y82OtLW0UvwNCXhbkn8uf4FBAO5+L7Q5XRe
	T+wR2pbl0A89rOufzj3MifusDP6BFtFDOrTTbIo5Ufh6eTZ7hDBl/ZytqxQRK8wp0QlMG/jWArJ
	01dXEnR/PpwQzOnC443XhzTGl8u1oQKhGGZcsddw5SyAxgskQeEMp6sKx6vTYEIdhyTcIopRBYs
	Y1lft8Ocur+zPl8+Im4q
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023455e9.27.1741866293869;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wHJ2zwJ8yj3cYw/s9VH9lfhVlHVsfQsMYeCFjOVxBPaF+5L2/VWS3+5UdzriUt/uCnhyuw==
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023005e9.27.1741866293519;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 11/14] sh: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:26 +0000
Message-Id: <20250313114329.284104-12-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QPVtLKRL44az91NwxD95r-U4V5Tyz4zFayhrLKj6L9s_1741866294
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044619_487212_2AB6090B 
X-CRM114-Status: GOOD (  13.89  )
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

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.34.1


