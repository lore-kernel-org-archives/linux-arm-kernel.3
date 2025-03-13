Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdALik7flTFVSWTVblU8JKKGGV2JCoENkhxrfjNtUxw=; b=McYUrsGpVidSVRx/Zk4wQsdHwy
	cEFcrCCq2CVt0enWYic86e6drQtP3mNMq86/puzG3naNrIZZssVebsFQrl2Ed3peKT0Tzbr7zh10R
	/3Ep27IvouO1tNnM8hxKBLKEg74OK9hKKEIaUg3ZfhKz64siOJSVGyzDr+TF5f8t8FaRxhzJw2oWP
	S3485Rl02cRMWLnMWsK57mjbolcF7fI3Ms7gzblmQKK+GzOLHHvm9gAqJepCHnkBkjRw38s/bRFIH
	FLdQ6boTayjsPEKZg+6mnLFJLlRTk0Jk0+B4JI8AzN0T5A9ZQWt5n2RtspnJzIvgSYXryF3+/R28E
	v7jKh+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshKM-0000000BBKo-354N;
	Thu, 13 Mar 2025 12:06:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0y-0000000B5wj-22fk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdALik7flTFVSWTVblU8JKKGGV2JCoENkhxrfjNtUxw=;
	b=TYj6APdLqRfHJjGa8AW9y7qyjO1zHZrjO0+o+NerkLP+toPaBP5Bl3RMTM/t92Jt85vLfv
	KjiupLqNL+RXa8BqYqB8W2kdWCeT9ySeSHtQ2lYBTVwfR9D/uUSJkp6tz07LN5+s+BPjWd
	kiNc+icZrFjZ0kBy6BJQHu2AuG+VqVA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-2ofHh8QrODqQsZK9xRl0wA-1; Thu, 13 Mar 2025 07:44:52 -0400
X-MC-Unique: 2ofHh8QrODqQsZK9xRl0wA-1
X-Mimecast-MFC-AGG-ID: 2ofHh8QrODqQsZK9xRl0wA_1741866291
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391425471d6so306812f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866291; x=1742471091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdALik7flTFVSWTVblU8JKKGGV2JCoENkhxrfjNtUxw=;
        b=HZeXl5eo/gowzPzjeHEvWK0d/B2599y/TkIo+gRHSZ95UZ5tqPff5W5/kPvZnqoPK6
         wVB+kHvws6WUx77qVjOSjuL/oWzpzGge707lOqM+JkU8WFtYnhfMDsBTp5FyYNo82vuZ
         +pbCx4AAJYgkchZn5Gs/dbu3LOgg5wn0qz6i32gHJugA+IaJ4/TK5vgO+P0OrjyjUmgb
         A6Xgo0qv/4HGF3U5L7pHhsxcT7C7VguCJqXnw/W9mobR87cdRaZeVUN2ZOVY8a5+MFxq
         yyPDckk/tn0BJCpK0tY8x1GpmI+WaY1Qtvn+GTtRD6XXmmpsP52nsh5ujcyxmjMKDI4a
         /xpA==
X-Forwarded-Encrypted: i=1; AJvYcCXjRXpA9kiKwLLM+JPQPiTngPWgunInc5GBaD4ySA/2dqIc3rdiGvpEbP6/gZtvWbYIA3XlcGeQztVgNCfuvwPR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3eQ5+qv2/b/SKS7UpQo9zkauapy2CNfkud1LIfUsrQbEwr+x+
	qMH5FSCObNI7NedZTJRkT0y49SrMq6NKmaBmpxFUbjSsLmhlmRnJ4FlNktQe5rn+BnyjT2hRqdC
	94u/dUDHPoWR3+XzDTi1U4Jibun9GdALvv/RIibybJlukUO7kSevDKPI4jkL77bCng01A/yT/
X-Gm-Gg: ASbGnctgD+z/n5wau8HbcEuxisOMe+CPlqdZhvx1R4gJOhYG24lMZnsSvjbHSVodR7Z
	siqPdxheNzhI/zhNTys1ug+EgEYBS7rRq9DMbcG7jOn4IRDzmUMbv3d5XHrQnYWzoKRepq1i3x9
	1HY0PslSPYU1MIC8RVl75ccUZyMpeJ8sMlWwB07lPK4rrf5XRp/UYSRgTtd39qhwmMoVyhpMvLr
	PvJHt8k9z/ezpGb0DPb1ggIweZfwX3a62mylhVxHoMi22328TLEOr2Td6r4dIWKXQvl8rwUfIbc
	+uphgY3SVw34L5JRw0Qr
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39132db7543mr19148428f8f.50.1741866291552;
        Thu, 13 Mar 2025 04:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc68icOs2UFLsGvYM02K+KaAXrxdUkEYYl5CYIXnV4BsTbvYwzMB6bzWlvY18H1nYSqaV5qQ==
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39132db7543mr19148405f8f.50.1741866291178;
        Thu, 13 Mar 2025 04:44:51 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:50 -0700 (PDT)
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
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 10/14] s390: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:25 +0000
Message-Id: <20250313114329.284104-11-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bv1Dp9Bj9uhO1taswXJTjDyztcEYuL0U7LcC9warlGs_1741866291
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044616_604152_9EA18D12 
X-CRM114-Status: GOOD (  12.85  )
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.34.1


