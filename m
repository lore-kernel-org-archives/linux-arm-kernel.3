Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28F2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=; b=CZAFV3GnJvmnmuWKeoyiKEYfM9
	RCuohjSw1CgdFw/apBXjYzC/LowKVM3hxpFwNB43FlfontruD1wtBlK7idv88rtsJ7KDNAqyWcjPM
	9eza2E7M2YexbUHo9ETXeisoVh4Cfnp0aL0pscDfom53jrI7LZzz/Wuw3g/UVZvU2tOoJOykT1kmO
	uBeHYDdg5f0ixW8AzmbZ9fRxtsnf+/vxsvrQjkJbYIFIE7LY8Wl53xOnOk9Fdsx8U7aPzJuHxYd2q
	DmrHmK+eyGOuMLJDbAH8fwKWNIREnGmRgROTm82R69NKzpbh0jz2KElF44pd99+AmrmPRmOLMnWXU
	G9MtIYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshDp-0000000B9kz-1BhM;
	Thu, 13 Mar 2025 11:59:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0s-0000000B5tI-2bHt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
	b=MxDH+G8CfXDSQNP6WizN7KxNKH0G1D/S8F1GZ3sfpJl00C07A4Zca9ECgFg1iAGExumJjF
	9yZKjSpk8WXNC3ULS5Jzl2lLpMnEIoFMEeSAqEMmdMN4gFflxdi0gdFh71ocW/WnVeciGD
	NPT1hu1KqfHo7QioMXhpSe5acv7nsb4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-9fmU8rq-PuOOZR3eBAq6BA-1; Thu, 13 Mar 2025 07:44:43 -0400
X-MC-Unique: 9fmU8rq-PuOOZR3eBAq6BA-1
X-Mimecast-MFC-AGG-ID: 9fmU8rq-PuOOZR3eBAq6BA_1741866283
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso6010995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866282; x=1742471082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
        b=opUoJqx0mX6t+tZ93SnQv7fkrgUab5qO7r89prhW5+cJYdWnrmEIakiSy0IvkX94KS
         C6eKvW1lrHtwa9kl67V6EwVV1aTw+iMfhmNAqDR7dtWV9lK5eyWlBE+jYQK74XkyjLI3
         +o1pS8i1pi1U/dPILTaIuIzOn1AQ6SdpNp/IYcgciC43pihaWTEewbhUkRxjvuF6S3ON
         Vxh/9T3BctHSNAU/btiWwu0+9vCkAmnyBXEHbH7G6bUE/iIDpNf8Jr8OpH3ttMgQWmPF
         ETjEnd6HB7n2AdhTrwFsRVvHC6+GBlq46qN1buTyibVeY14KWdJdgoUH+ECl4uydjzBD
         1qdA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5ToNzbqyhQbuAtHxzvViXq7bxBHoXl+kMjJ7gXg8CLUtp0m8qhhGxcFNgCVA4Wgt9jwoq/pNJEJzC7FfPvWM@lists.infradead.org
X-Gm-Message-State: AOJu0YyxkfRi++NYDAXLboSA905d/KOiMuZIejW2yGYtC7grrdwU7YP1
	18on+2nVdYJ65d1OrMFKFiMU1OBJ2I1tMELUHpOPdyCypgxcQf3vR912X06jcc8wziDEn/FUZJl
	ErT9EWcr4KY3i89GHwnl2B0um9an5LPmUlHV4xJs3P8z5HCPKzm3IOPB8Mgn6axEvqNXRZMqS
X-Gm-Gg: ASbGncvntvPTn/3mykupdvktfYu5k46UHuCluG4GSznKFpYXpmM2IZDSSIDWxWUsAjP
	22RCnoy6eZ1axuKJHrb/aXMFxJHgucVIiBV47V7siNEsDPh3gS7wXIumchRYr8Yo+KgdWnhdD6n
	VioHHxW56806NV+7MRzO6YQCdJ+81HkofBze80c+P2l07XpfEdmcJDWLPQL/QgZ7m5hmCBXxWUd
	wCh+i0r0V7wj362LMAuysnhvt3IBDqWsNaoNcsMVaZlZT+cBDxPXO7mTAfFmvzXRr+eNvSVIjXH
	MzzkF+SBfhJ5nEelgeoI
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255847115e9.30.1741866282646;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXX+a12CkpViQK6U7ArlV7I00zmbs9phG5wa1a6gevfoSJzXsUnRwbzS8Xh3mqpEsYOihpsg==
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255846615e9.30.1741866282213;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:41 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 06/14] x86: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:21 +0000
Message-Id: <20250313114329.284104-7-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hvPftm8FMV5_8C8bydirlX5t8K-646NLdZHKMi1mK58_1741866283
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044610_731966_B504CC1A 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index e85ac0c7c039..f6e13fc675ab 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -35,18 +35,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -92,7 +102,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


