Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68557C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=; b=R8u1hykzVnlEBkxWxPj1TzmH4b
	ojtRsI+HGxjO9R49BXWYnujSkcXt5MHjIUsKXDVW30SYtcXmeZ4TVlE/tFtxgrYimd7hukLsXnALx
	uJzdyHDNhmdNnFApU6qX+jl+/CttiShbbzufVXvbNGJ8kIqHhfupCZNq+tPlRgWnqn/CQ38KJB1X1
	ZSLFAKwCgeFYIapFdiOwtKEWmX7GES8TPDgIMuGigfaEUsJI0h56+q/Q32XKLiMWJfiLFbiM71Z57
	I3DtWAnPyhhuw337lh8UZP/1EaEqHxGOwMHkfdFCqW7H0dTVZ2TQ0AlAfWHwcNUOAQIEDObImbpgy
	629ePB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshH6-0000000BAgs-0WkJ;
	Thu, 13 Mar 2025 12:02:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0v-0000000B5uz-1Ien
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	b=Ci9VJgM8lf8++v7H56AskHiBonueMkX1/yCkfFK2/s0zQA5vQhOZLEcNnfrNY6qvcU8oNx
	jdqmxIQdvHvkJjazpnHHsiSClDtQj3Kl3zXme1XMvT2fruFJ6xFSgeICpJji5hAkxw3Vr4
	LLPmnOiHr8UVLBfIlWjllpMjXFHsTAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-iYf1r3n3NXKKjwd8FS4FLQ-1; Thu, 13 Mar 2025 07:44:48 -0400
X-MC-Unique: iYf1r3n3NXKKjwd8FS4FLQ-1
X-Mimecast-MFC-AGG-ID: iYf1r3n3NXKKjwd8FS4FLQ_1741866287
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ab5baf62cso6561345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866287; x=1742471087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
        b=vvqzMHI+7toTOLmqmLNvjiQNFe2wKweqJjCjAa9enaAyLBczEPzamwVqO0tCJji2rq
         V/1FSZIAyOXSVi0gq7atJJmMV99h/RqmUEJmDbGX5bLJHTQlkBww41lSIIgjNaxYvLA/
         7Xx+mTaO7h5UDOHLw6NjLoILe4ESKs2Ah+pNIcB9JOrWQzCuMxzb56jcVMSAl3pCxjTG
         fsM7UImVh1XRZT5+cAtmfV7R4KsBdgKRLSbVF5UdE3dP5aElhcyOlwxILRJySEM/Gsya
         4a4O2iAc9Ck0AeGed+5idYudgSCIvEbXwMytkjTRmwRIhFB8maFZ0+lpIUuzOhwFLGm7
         N4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVgXkrnQYTdHERTGx63LIX0dKVNKFrpG67O8kLJPShh8N5wADgT5pP8RUIsyoYc03pSk4NIaLAmsNnyHqIxpwbn@lists.infradead.org
X-Gm-Message-State: AOJu0YwyY78ov8giiyPYvjvd2X9IqoYMV74bKCmH7oVm96pRX/ZWAztx
	Z8Zn5fg11j/jjWlbNdhLIMJerMp1i17so+r+kev0u8gHFMHbbTu+Ca4x6Qtku0n4r89EVg0UK09
	GXtXmQ7jvQ9QeSMUt7+OA7q3NKvUOulx3Bl9S1GXdWbRT9BR4bE+V7aTwalbTViKthKBr+sVW
X-Gm-Gg: ASbGncva0xkdOk7fG9VjaSAkQeOga6pbrCb7BDyzxBZEmr8nKGGTEfK42OcBrPc0tFg
	m6y9aXar8cOP8WLv8wZ7bb7U0nTSINdUMSn3+H236LELqanplZJE/kHgeq0CSnS598AN+oY96aZ
	+mCFToWEo0ivUBcPxfo9wxYNIMQdYD62TEyjmv7oTZ8pQle3fSgPfqjCnAWZIXmbi15Y+cQsz3x
	ZXftD8iFR+SByAvfuoaGGPBRity0MZFVY85NhYr6EN2gdIJ0dt26JO4mzGyUhLLgq/wEcel78sL
	Zlts56oc6eXbKAwHWXX6
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111255215e9.9.1741866287296;
        Thu, 13 Mar 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgHdaZ1G01z8VuKBQ3BfPMVXgqQ5rvdTXEZ7bpTSjr+Dr16GZrLUPpD2KPNpGCET/hDHX7g==
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111254865e9.9.1741866286869;
        Thu, 13 Mar 2025 04:44:46 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
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
	Huacai Chen <chenhuacai@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 08/14] loongarch: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:23 +0000
Message-Id: <20250313114329.284104-9-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1vjSz5TAVtTEunN2G91oekWeDXaTS8e6EnMcZW4sap8_1741866287
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044613_444850_E1178AFC 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/loongarch/include/asm/bug.h | 42 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..b79ff6696ce6 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,49 +3,65 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 #include <linux/objtool.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
-			     extra);
+#define __BUG_FLAGS(flags, extra)				\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) \
+			     extra : : "i" (__BUG_FUNC) );
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


