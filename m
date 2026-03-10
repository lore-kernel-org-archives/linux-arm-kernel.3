Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48820FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QgFRu6ww+X4eKkkmrkBaNqzfyYluZEMATZgmk40+ZI=; b=OiCQQq6sbkxPoO5iHwAUpsKtrc
	68dlxH77CD8oz211EbvGJ5C0VwHkP+LsskF349XsrkSWnR4dzhO6XlcHj8412m06tROUY8QF7G122
	whxecE1WRTJTDNEauHQDinCvY0ou6jXX15YCtjw7RUbaNWENgnL/8w3oES7Hi4PwzDS6Y5B7kmaMI
	4Z49AO6XM5htwoY/tOtmYVqDNCPkm8XDGv+yv/x0roOmZWusGmpdQNqigKHSkQipXQCJYVoK7SX5/
	UnBl8GX6PGTgsqcqRXtVu0m960Dpw0VCJLto1K6ZVOqcIS80iV4TzhCnUyNj1fxguviH1vo1QXxw9
	jZnTXukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznkD-00000008eoW-1CsX;
	Tue, 10 Mar 2026 03:26:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznkB-00000008enh-0MMz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:26:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ae4b40999bso34095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773113210; x=1773718010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QgFRu6ww+X4eKkkmrkBaNqzfyYluZEMATZgmk40+ZI=;
        b=wjC7HsX4Q/Bo4LUGpXaWU7IuWurrKp9s8tjED/o5Ll9MyzShIp5ddEBLmmaUe5QdrZ
         F/HyP/RpalFGyW9IVDAmsSvGoUkWHxHie4N2svq8ULsgSaiXzq4pNgqHKKfVX9lUeaLL
         ldyoPVcB/wgPwnjoN4E/cb97jKI9LEXDzJCF0LimXhnRxjDZSYVD2TOUY0z2r3P61UTw
         kmNdEZgdyjs5Rh7AQnl+QOgMvmyhYxIGoIVqXjCeXoSF/WLCY5jxheiZAKYr35fHSRMb
         VfitMBH67QGeTdwY2r62bLsEY/LjjREWlj3VASmTjkypFqq6ZLbid6w7PbEzgJiI+T6i
         k3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113210; x=1773718010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QgFRu6ww+X4eKkkmrkBaNqzfyYluZEMATZgmk40+ZI=;
        b=UR3hsroodVU0vcHQv9le1D4QEYkvCKHEJia5kob7D5Mhcbn4HmCWLSONYbH1LrRAh4
         Kv3IZRv1zruk2v7WpL3kPkLK0GDoSRORl2AxElbzzhgio8o22JJpwYxK2ZscxXSst4IQ
         DTSOvfZREERB3NyKydMNHxwYCuUPYqhJz0r0XhUxvsiCw9tF/FT4WojbT7YyOXaoL9cK
         vDvUeVF6OMaffMEaGwy1d8XqglX78/Z78lkKWXWyKtetSU7RX7PwbHsZMpA8sd0Xb+FW
         j2YF/Pic0k6a3UM2/fCb5KM7B7iGydAMub2lzXb1FQPbQPBo508xOUdqYwZJ/VfHub6b
         aP+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWxO1b9Cv44/bl6uoy09CRSBZXpQxgyJGfH3PLaz9/JQGsy0LqZadtp3DTenH0blj9HZ3+NG5zl3oZ9r3r4ZUH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2lBzjJMxXjHylcXSG6Txgxr6CRTfPD/lfOIgLrnQHxXeGdGz6
	hydVw/swjbHmKb538tmGqvbE7BdBe+tcf6CmQHkmcUWicn5QDYBEIB7N+nUk5Zmozg==
X-Gm-Gg: ATEYQzyf3zc+C2CTP7fw/UD2QIL6ZJBdeYNUZ0/y5+PQ9JdM5SD96KuQCrwjLJe8WFx
	6QOA3jXcGYKBYwXhIsFGcht1CdI/jFmO5emR50i0nFD0rH+0zHZIooZm4qfjGjbbag6NIWJ+i6O
	2sqNHVp8DOpfqRGpCLVzht4J6wuo65Evp1A7GXk7nRKHX3QGde0wuYd4BKMq5DV+kr/3kElV041
	QEs2XT8+MMNZGpLbN15iSvox7dJzp07m49NSYB16Ong8GTQBn7pNTlEsWdfSWV4wY3K7CVYDzi2
	T49ug1c/CFIGnfREwgXb9Lre0ooP1zdV6T9b2kNXbUiljI3ZcQKNmNMGv4cOH7WVt8d6UWEXmRK
	vgmisV9lUp6S6gve081ayjWsUJRQFEe0n5tCCc4sJUh7czrrGB0rHt/smlCzPtzoXZk5pGSLmPc
	9qHQjOzXt2JqiKoocuxIHXZM2QXB7aBqXyxBJv4ObKGHmguzWCYIuRqEdsp4fdjg==
X-Received: by 2002:a17:903:1a07:b0:2ad:6f9b:7817 with SMTP id d9443c01a7336-2aea30c2c43mr124325ad.22.1773113209615;
        Mon, 09 Mar 2026 20:26:49 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585b3sm152536955ad.10.2026.03.09.20.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:26:48 -0700 (PDT)
Date: Tue, 10 Mar 2026 03:26:44 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm <kvmarm@lists.cs.columbia.edu>, kvm@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v4 09/17] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <aa-PdKMKz5SndqB0@google.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-10-seanjc@google.com>
 <YfrQzoIWyv9lNljh@google.com>
 <CABCJKufg=ONNOvF8+BRXfLoTUfeiZZsdd8TnpV-GaNK_o-HuaA@mail.gmail.com>
 <202202061011.A255DE55B@keescook>
 <YgAvhG4wvnslbTqP@hirez.programming.kicks-ass.net>
 <202202061854.B5B11282@keescook>
 <aa8fNT3P54t5W53T@google.com>
 <20260309223156.GA73501@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309223156.GA73501@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202651_162528_09A0E1DB 
X-CRM114-Status: GOOD (  18.63  )
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

On Mon, Mar 09, 2026 at 10:31:56PM +0000, Sami Tolvanen wrote:
> Hi Carlos,
> 
> If you need a stub with a matching CFI type for an arbitrary function,
> perhaps you can do something like this (arm64, untested):
> 
>   #define DEFINE_TYPED_STUB_RET0(name, reffunc)			\
> 	typeof(reffunc) name;					\
> 	__ADDRESSABLE(name);					\
> 	asm(							\
> 	"	" __ALIGN_STR "				\n"	\
> 	"	.4byte	__kcfi_typeid_" #name "		\n"	\
> 	#name ":					\n"	\
> 	"	bti c					\n"	\
> 	"	mov x0, xzr				\n"	\
> 	"	ret					"	\
> 	)
> 
> For the !CONFIG_CFI case, or architectures that implement static calls,
> you can probably just point the stub to __static_call_return0:
> 
>   #define DEFINE_TYPED_STUB_RET0(name, reffunc) \
> 	typeof(reffunc) name __asm__("__static_call_return0")
> 
> Sami

Oh that is pretty cool it worked for me. This is the patch I tested
with. Still needs a bit more plumbing but no more CFI issues.

---
diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..708dbdf2c9fe 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -5,8 +5,10 @@
 #include <asm/assembler.h>
 #endif
 
+#include <linux/stringify.h>
+
 #define __ALIGN		.balign CONFIG_FUNCTION_ALIGNMENT
-#define __ALIGN_STR	".balign " #CONFIG_FUNCTION_ALIGNMENT
+#define __ALIGN_STR	__stringify(__ALIGN)
 
 /*
  * When using in-kernel BTI we need to ensure that PCS-conformant
diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 78a77a4ae0ea..8b96eb66d2c8 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -184,6 +184,9 @@ extern int static_call_text_reserved(void *start, void *end);
 
 extern long __static_call_return0(void);
 
+#define static_call_update_stub(name)					\
+	static_call_update(name, __static_call_return0)
+
 #define DEFINE_STATIC_CALL(name, _func)					\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
@@ -270,6 +273,9 @@ static inline int static_call_text_reserved(void *start, void *end)
 
 extern long __static_call_return0(void);
 
+#define static_call_update_stub(name)					\
+	static_call_update(name, __static_call_return0)
+
 #define EXPORT_STATIC_CALL(name)					\
 	EXPORT_SYMBOL(STATIC_CALL_KEY(name));				\
 	EXPORT_SYMBOL(STATIC_CALL_TRAMP(name))
@@ -306,8 +312,25 @@ static inline long __static_call_return0(void)
 #define DEFINE_STATIC_CALL_NULL(name, _func)				\
 	__DEFINE_STATIC_CALL(name, _func, NULL)
 
+/* Move somewhere under arch/arm64/... */
+#define ARCH_DEFINE_TYPED_STUB_RET0(name, reffunc)			\
+	typeof(reffunc) name;						\
+	__ADDRESSABLE(name);						\
+	asm(								\
+	"	" __ALIGN_STR "\n"					\
+	"	.4byte	__kcfi_typeid_" #name "\n"			\
+	#name ":\n"							\
+	"	bti c\n"						\
+	"	mov x0, xzr\n"						\
+	"	ret"							\
+	);
+
 #define DEFINE_STATIC_CALL_RET0(name, _func)				\
-	__DEFINE_STATIC_CALL(name, _func, __static_call_return0)
+	ARCH_DEFINE_TYPED_STUB_RET0(__static_call_##name, _func)	\
+	__DEFINE_STATIC_CALL(name, _func, __static_call_##name)
+
+#define static_call_update_stub(name)					\
+	static_call_update(name, __static_call_##name)
 
 static inline void __static_call_nop(void) { }
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1f5699b339ec..b60a1991474b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7701,10 +7701,10 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, NULL);
-	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_handle_mediated_pmi, (void *)&__static_call_return0);
+	static_call_update_stub(__perf_guest_state);
+	static_call_update_stub(__perf_guest_get_ip);
+	static_call_update_stub(__perf_guest_handle_intel_pt_intr);
+	static_call_update_stub(__perf_guest_handle_mediated_pmi);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);

