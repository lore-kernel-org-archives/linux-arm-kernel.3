Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F18C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=; b=hWJbaTT2Km51X+TQaNCSKtAZd7
	ZqIBqQTD6L+68UZb86Ccp2vgJOlN9kkOuO0nPSzl+jx2lnE5QMje/a4Xw7QFxRMoD7LpKoH8nH2k1
	N4+nLaYusPa1Kk8d5+EC3hdd3tahmjKFr+2HXqHtkKQnMBSTRZoJ8w6XtGpUbUXf0dnZE7ppUUfFM
	RDqKFhJEhqOwOHrP5Ci61gjSwud8VSsCaESsYrMyQ4As9jGzvw/uir3dg7n/9KBJtnC/YnJlC/O0A
	aCMQcHTk2bNEl9DVAYlw/8vt+STsKK0k0Y9HAfhyI4bW8KRHYKF76U61b4UfQhPTft+GtlGgzFs0N
	dZTaVU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQjh-00000008HTg-38SQ;
	Sun, 03 Aug 2025 04:54:17 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsH-000000088Gq-1q2M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:06 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e4063e731eso10595235ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193545; x=1754798345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
        b=Y9J5OLfhr+54ew0qcpA7cclY0/scCH0eZOToy37LlE+G6ZLFx87J/kvchxRa/61aqf
         BuDjV74MloOUYA+/xw8pKOf1vBIzwtoot35g4eN1qiFLhyiqkRzcvx7AOfRTwIKkC+xF
         UqpWYs2rYzIyshdsCc8K/sKCMFsGm7RmU9q06GCUc5ayvVC1sEFSwVcI0MKqqrw/t4+3
         pADfH7CZJFuPbKFTAUkE9Z09Nps06Y+2EhoReMC7Tz3jmJw+g0X08WzVOBwgO2JkulRz
         bMCp0QdDUXR1PA7QW1aUDKjk/3/INkRoDLQwRAB0AiSETBTKdBR2vM76R2QyYhIOAQvB
         d7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193545; x=1754798345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
        b=GvSElMdoBP5+aulgoLh31Y+TZ4KAVDTYNeMbfrxSQm8IJAF10vq+Oblc8IzyC64txM
         M6rXiBPLOcaZ64UiUQPfAX3KWdcWshn82NO42TL10iKGmRu18sha9NazoZdUOMknL+eQ
         uBMK4QCEbEHkM6tmKH5NqTtdIR3xQPYZ4sx6hw1oRiLfA5sKXDtBpUVVuwJHZuTD1VVr
         JYktQ1Ay8gNXgzWPJp7AyVlr1HfCDpSAsVM6BzjeQN2YdDD5r4Q4YiqTygng/Kr9fD36
         NjwIe4CAvR9WUCrYIyRAEmIYXWTfUEp9LXLczl7GLsQBysoBmY9peUSKb3C8lhORoL06
         FJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6CFoyiltm9v1W8Vwh3nUZCEZOnVhvytEnc3Wccxdzr78iOtU0SbtziZyBA0ldSScd+2+rnEWpfXQv7YQrNxS@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQ6AEIhcleD9i+zGOt+O1KN8eYT2HVqCldlXTbSireIcZk/1X
	Vx8WowExKSpVoE+o4ehQMSEPaGCf0jCXOBtu01zIImFNrIDfhWCRaJoG
X-Gm-Gg: ASbGncsxb+f0l06Z85lZAvlqn9uIuMYi1uOWE4ZiaksG5dRPZBAO7Vox/nFMbGhImss
	bpQpvehSn+BD3usXEnKtdGUGZEy3FDwsE9gdSTBWoaoQt6YLHj6yrdmCIMOmCbwKgfOt3dXvUNO
	4Dif8UnqKjlsyfMkdTJV42/evTPPKDHcZWqwU3CFI4UoSFkQrndwY5y4EboQj0/ij8jcAy8VUHx
	dP3+E4H82UfKXSmW7DjcClzTvgaZFB2OtbUcgMmMsj0Xh4aR8KunYm4bLycHb9X82FynTP2bXoh
	P6Cioqh2xz3Y3oJ5pH/BJ29HJJnlzB5flAv14hXKLTGcH2vrPNWkaIdRtHagdOlBeKQShz9lOgZ
	PkaXxQwaYfX4CX4XeCrHHRAZ0bsqPCXE6tz9XYJwhTnxDxz1JLxkAHZcE+EvSGQ2uNFe4USENPj
	PjtA==
X-Google-Smtp-Source: AGHT+IEBzXwTpz+6kufpgt0kt/EVEpquD0XeO5VyPFcOTsTn6fzv2h6s3BTW+bB/H1codZT3P8zPWQ==
X-Received: by 2002:a05:6e02:2208:b0:3e2:9aea:8049 with SMTP id e9e14a558f8ab-3e41615d13emr88848645ab.13.1754193544756;
        Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 21/58] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Sat,  2 Aug 2025 21:57:39 -0600
Message-ID: <20250803035816.603405-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205905_485769_C79C07AD 
X-CRM114-Status: GOOD (  12.88  )
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- $macro_name =~ s/DYNDBG/DYNAMIC_DEBUG/

prev-
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c45f5b76763cc..9bcada421e88e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -110,6 +110,14 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -123,6 +131,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403ae..e83b34b6d6b95 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.50.1


