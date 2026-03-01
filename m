Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E66FD0078
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIl/dHV642tMqRZscE3Zjz5R/EkJp5KZJrPHqY8MUl4=; b=Guvj3PQj+i4Fn7j3CJ/cttbs+P
	QcnwyeAlWYnnL/rUdX/1ZCWYP5Lc0YKL1If4yVsT73dqBNOIqmrguhN2yzAwuO9CeSlEQngyicVLe
	V7b4rZt0frZ/w3p6F8cpZkz2DKgktlbNyOq9+5Wa/HW32eLhr4IP6gSCR0X+Sn0hegb9qC8SczrDc
	lKC1AOBV9oVYPaxWxZYRLg21YQvkhXd5NjD8kBV3BweHaiu1BL6HLvpeQyBCsPBSBtDfvSlhkO50s
	SqeNbkwtTn6iW1j2T0hYCIH5p6W79MmB26ocukjShCv/BoXjo7ZoyNlz/xMGlQ8yxzADtquZgw+fy
	mL7Oypbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwp5f-0000000BwSD-3bxA;
	Sun, 01 Mar 2026 22:16:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwp5c-0000000BwRT-1c9R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 22:16:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439a90f194bso846832f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772403398; x=1773008198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIl/dHV642tMqRZscE3Zjz5R/EkJp5KZJrPHqY8MUl4=;
        b=ZOH7wUn0pFwWlqsmDXVsiZ/GoPolA+rT/2rZ66ZEn3GNseDE9syJuTVo3R2bPrWQ7K
         qIl00/HnrP5FxDZmKxfFMkVea5rv1/HgDY2PgVdahcpgC++8gEdSmD6Lj1mYOs594br5
         WCjNm1WyqXkneut/BrR+NKVTn6SZy7IukMsPiHpJgSX3lBHcumYE4nepCqIUb/tYD0vG
         1t6DjKJxqXgj/V8n2/j16r+PBOaBGzRhG6viI+oC+nHv4SYchCrQEreO5poj93K4ZyEF
         zGC1bvBYfCrv7BwSGExO7aeIh9gEhTFbx+5TFVqwuN2iQtFG6DvgdOtHRYyEPfAkwWI4
         utYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772403398; x=1773008198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIl/dHV642tMqRZscE3Zjz5R/EkJp5KZJrPHqY8MUl4=;
        b=B27TtIWD8H5+fig35JvfUciZBUUy4YPK5BdPZ2I565kI91NT4xK7frRAxH3rEsOWxu
         BvP9Pk4kr9tAfR2NDD6Bo2ZGgUSHDj8R8vx35nHMVKBtUT2VnJnbYU4QJnm6QIZeFqfx
         VskjTngRmZQXgWARbjPZtbSVJtIIdLNTzrjIr7m0nSCfY2+ijLDo2KxZevAhXOliOn6W
         glnulSWPnYOVDXlljuZ0VCZfNq3kjXM/9j1HWCiCpgTgpb96yg79M42K2U1KWEqJAC/1
         sQUg/t+O80NWSurL8v/gIImbLuwVaUtsj9BhXZTwPI5zIBV5r3Vcn6hJrsHFvA1Aknby
         qIgw==
X-Forwarded-Encrypted: i=1; AJvYcCVuPbifPTtILdy0jWkyt1DPOHNCiRwXzfLFEGOBI08izdOj10f8jbihN3EHxHs8RpbfRFjH+N7HUgIiZBRKoCuD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzay8FiERICi7mFSkfbX151IFxk7b1nTBADQ9QNSoNPZTaZA6j1
	68731bVAwCPoaQ+HBTLkw5U9N+QySUw1GvkFzQFUQG9yc9LDb8SPSHJV
X-Gm-Gg: ATEYQzxYM9xnoWhcBhRpVlaqH+LStNlv0QtEO9Y08Zv/6349MeN5GJ65uUolGGs+gY0
	+GPMbvSfm5sRRKdINflVPCIPSH0jGZnqe0sXiiaWT+bD+lmJJcUWBc04LhEha8xp2x4sabUUuC7
	iD25NKbx+7jV4pNlT4mkEvqqIHC5s2lSeKQAZKTgCOmKODwHlsjIr+/lX62KBB66gDkCK0Uqz9V
	fmBYWsX1rTos6BTrJizSRQ1Gj4YwVn0uloP4YR68VIw8CCP5O96Wtp7HhKVT4bMSYwnmYInLG9A
	G5szL1wqBzhPQn5WaMwy0FnVvfmn+otriVkyFeDsojzBHIW7KnB0twNs0WLVCWDmp01I9UWsxiU
	8Eg5YKs+cdONobRrUlCsy9lOdlQeeKWoWO5F5AiGhd1IWKCP9CP6grtFwon29nkhkrI8MufxonU
	2Belni2NClGuTsR5OBtg/piW0oWSVr6eTTtVUv2/whJP1ACZ2xIRfgAL1elNH0r6lt
X-Received: by 2002:a05:600c:4444:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483c9c323d8mr157846385e9.34.1772403398069;
        Sun, 01 Mar 2026 14:16:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm6649234f8f.2.2026.03.01.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:16:37 -0800 (PST)
Date: Sun, 1 Mar 2026 22:16:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Andre Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const
 pointer
Message-ID: <20260301221636.0efa722c@pumpkin>
In-Reply-To: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
	<CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_141640_580309_239A101D 
X-CRM114-Status: GOOD (  13.95  )
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

On Sun, 1 Mar 2026 12:01:08 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

I also added to compiler.h :

+/*
+ * Sometimes a #define needs to declare a variable that is scoped
+ * to the statement that follows without having mismatched {}.
+ *	with (int x = expression) {
+ *		statements
+ *	}
+ * is the same as:
+ *	{
+ *		int x = expression;
+ *		statements
+ *	}
+ * but lets it all be hidden from the call site, eg:
+ *	frobnicate(args) {
+ *		statements
+ *	} 
+ * Only a single variable can be defined, and_with() allows extra ones
+ * without adding an additional outer loop.
+ *
+ * The controlled scope can be terminated using break, continue or goto.
+ */
+#define with(declaration) \
+	for (bool _with_done = false; !_with_done; _with_done = true)	\
+		and_with (declaration)
+#define and_with(declaration) \
+	for (declaration; !_with_done; _with_done = true)
+

So that you get:
#define __scoped_user_access(mode, uptr, size, elbl)					\
	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl)) \
		and_with (CLASS(user_##mode##_access, scope)(_tmpptr))			\
		/* Force modified pointer usage within the scope */			\
		and_with (const auto uptr = _tmpptr)

The next patch did:
-		and_with (const typeof(uptr) uptr = _tmpptr)
+		__diag_push() __diag_ignore_all("-Wshadow", "uptr is readonly copy")	\
+		and_with (const typeof(uptr) uptr = _tmpptr)				\
+		__diag_pop()

I'll update (to use auto as above) and resend.

	David

