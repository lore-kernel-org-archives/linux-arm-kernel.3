Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3466D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIvDHxjEBk/q7zSGk0OAMTPAzA3q+FQQ/WT+Ixk4ezQ=; b=eqwh48D/Nwhie4pKe+pBiYYyex
	/ugfmB485985HOvlRjyCP41b4xmtfBZCxLUbeOX9FG7kzmAfVFRykDEkdtaaj77bg5PpBL+0v/VbM
	TxVsJo1q0s0iDe+cSzIsLamnR8rT+B6yb+8mBThoUSAg1YehCR1Z9ViTUACXIAM7tViDk++NEc3Aa
	Q9rLStoJQM7OktnzEVLt2KRzvylE3pmHfcwRkPSSWxsJoLsjWeOLHxTbe9b/5krcBFREhxJ3okdQs
	MBOImR96hrh5pn/9W1baR/O/VgojUxsWWqkqEvBRIYW06zichWNd3hwXcKzT7ikvI5HBSAH9Ori8f
	asK1Z5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSfV-0000000DA4s-2ju2;
	Mon, 26 Jan 2026 19:54:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSfS-0000000DA4W-2oKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:54:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so37741785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 11:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769457272; x=1770062072; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIvDHxjEBk/q7zSGk0OAMTPAzA3q+FQQ/WT+Ixk4ezQ=;
        b=q4cKN4kzYZto9Q9dCHQqZNwTC/GrlbVdelMstslFMz5Uro1Z1PLjsNyRGjzmtJPvva
         atSYKovGe5My5HK6wADwSGCeQfSkIN/885j4IVNo0SsDq38j/9OIuueF5kfMIeULDE+T
         CAhGQMrfxk5108i+qsXWSKk+hM2EiboT6Qkg3JaibbqL5ShuBuTjb9h174+ur9OShZxB
         kB0CeTtPs3vDW2Hv4bYvRTqbOU7DktdDseKQbj8Cjnmc4exWaJG86KCPkKbnfld/p5Cd
         mKnYNfa0e9ZWFoGfwZkcWO1KIJNd+o0nadgIs9GNhU9yFNdfzltfKTESbAeZjhTMusOF
         wPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769457272; x=1770062072;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIvDHxjEBk/q7zSGk0OAMTPAzA3q+FQQ/WT+Ixk4ezQ=;
        b=CXUzhqHVtO2GjMbERMxHS7nm5uHuZHytto7ONKc6uCyPbHpQ+XOt392EZQqUqhXsJG
         7RpRaYc+rL3uACur9vdztoFOzEWHqgVeoul7ChIrYCrsbpAPZiZow0vek70H+hezMxWG
         LrwHNogoRNA0BPelgr4RRtLqV/toKz2hIcTJMZi+xbLNS34MtJJCnhPgNe5G8bv21G3A
         mRVPjIaUMI5BdOzsIb/YvTR3IQyGCuHK0k6DqrlE9zegdM5ExYVPxjoU25Elv3soqplm
         l9ishRwM/OocYV6Z42znJVjRMt4JW3it3eqQQeWqOgpldQkLdpRrjZ8Nis93HxBZm70J
         uV7w==
X-Forwarded-Encrypted: i=1; AJvYcCUWFoiYHpQj0DaYOKAVI9pTe6kOZXH0mEzwm4mUwV2IoMh376DaWpqyY8bUY0VPPeqdVMLhRfm3qu46whzwWtdz@lists.infradead.org
X-Gm-Message-State: AOJu0YzHx6vPrjtpeQFr0pWNPdjyaJehGTGwcdFIn5B5RKiNGVUe7DzA
	PQvdKh3Ycl5F63KU+drR4r1ALaQxwTleTzN2J/Xknex+fAYw25tse8fUw7j2HLU4Iw==
X-Gm-Gg: AZuq6aK0OTOQ6oaSWpX6MpApslHi15h1hTLP3FJJr3k3nw2kvokt+VsVTl/Y8S26kTA
	Os3/REjDVeW/sY2YEFyAi84PetHCUckhTDo+YDnvvtTT2WJZMKHcs7p2SD/wg6JIY77PWETmCEv
	ETRGZ7NmSX1Q26dx2UqjG/MbRY90y2cbsdu12v6VOe7ofcL4fYvNhBJaeA0uczfpBothJ2EprIs
	E8QTodkdqLUPdAqOHbxuLrt9oPCd4VVpCCk4B+IrtGLYHJJtBVObcfBcB0plmlrY207bevR1luj
	2WuFRMc1U+wXnDfkOy0q4CHJbHF1q16nBuJHib3DDeH2L4wtYcBjfMTu/n1Efx5KuIvBbiEOKmR
	31OyGmJPAZcZrDUOrOu5IfC540hN3IpRUYj3ly0Gy3MJSHHAI6v7p8xEUIqsBSmF7MRyQ6Zvctu
	IZcUvSfRN1Fr+1aW8qukWsoVRddkAn/FER6UJU+xYjdtSPxbZF
X-Received: by 2002:a05:600c:5248:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-4805cd4587emr88693725e9.1.1769457271541;
        Mon, 26 Jan 2026 11:54:31 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:c598:7cce:ca6b:8ab7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm22270685e9.5.2026.01.26.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:54:30 -0800 (PST)
Date: Mon, 26 Jan 2026 20:54:24 +0100
From: Marco Elver <elver@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aXfGcIpeXQNRUI-A@elver.google.com>
References: <20260126002936.2676435-1-elver@google.com>
 <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_115434_748743_C45A1D26 
X-CRM114-Status: GOOD (  24.49  )
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

On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index fc0fb42b0b64..9963948f4b44 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -32,8 +32,7 @@
> >  #define __READ_ONCE(x)							\
> >  ({									\
> >  	typeof(&(x)) __x = &(x);					\
> > -	int atomic = 1;							\
> > -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> > +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> >  	switch (sizeof(x)) {						\
> >  	case 1:								\
> >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> 
> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> 
> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> on gcc-13, clang-18 and earlier, and not strip out qualifiers.

I think we only need to worry about Clang for LTO builds. But yeah, our
minimum supported Clang is 15, so between 15-18 it'd be broken.

> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> to do the right thing already.

It'd still be broken for Clang 15-18, so it won't help much. We need
this to work for more than "scalar", so even though it'll work for Clang
19+ given the redefinition to __typeof_unqual__, we should deprecate the
_Generic-based __unqual_scalar_typeof() sooner than later.

I was able to make this work for older compilers:

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 85b1dd7b0274..d6c808cc01be 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,18 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __read_once_typeof(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers to infer an unqualified type, using the fact
+ * that __auto_type is supposed to drop qualifiers. Unlike typeof_unqual(), the
+ * type must be complete (defines an unevaluated local variable). This must
+ * already be guaranteed because sizeof(x) is used in the __READ_ONCE macro.
+ */
+#define __read_once_typeof(x) typeof(({ __auto_type ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +44,8 @@
 #define __READ_ONCE(x)							\
 ({									\
 	auto __x = &(x);						\
-	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
-	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
+	auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret;	\
+	union { __read_once_typeof(*__x) __val; char __c[1]; } __u;	\
 	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\


Thoughts?

