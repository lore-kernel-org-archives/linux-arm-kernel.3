Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B0C109C05D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXPaSk6rOeSHzsuBeOwJ4iqoWQAtJOAov6388j1L0Ko=; b=lV+D29DQvBCk27ZmYzSdDhi1/0
	yu2rGho46ULx3G9D/7sMziwKU7/JjO5BWSYTpbAxwBO1CbEIIbH3z+WQnlQhMaKxzirc+rFKPJSHB
	VsiowJlLDwxmLtDyiDZg/Vx/rEPl1zF/uPXgYaOQCXsXHJQlZX2NUsVUaLRL6Y2AI0x7jgR1V4quH
	KDgKQyd0b8hS/CvKbP0kaB1l+6f+3oo1XEOW/jgbB2NZ+nKpBPxCC/ZdxpKCCVx0pPtkCe2mzvxLf
	luNtPB9HbYcXD0Lz+8Ttmt/FKgg9ICuATIBP1YdfsGAhd02UlTKmK+hjQEPJNClopoWdLzk+62jA/
	m8JO4N5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Uln-00000004DFT-45ut;
	Wed, 25 Mar 2026 20:24:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ull-00000004DEq-2ju6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 20:24:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso2329315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774470240; x=1775075040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXPaSk6rOeSHzsuBeOwJ4iqoWQAtJOAov6388j1L0Ko=;
        b=hZLixDLGumv0S04H0cMHXDJKtGwgCum7e16BzsXV4+6RNQILBoVZOpVzBLi4hynzmJ
         RScgUD1uCOMssB675cmu5kbKfGdweqN0zzMoJkIbJ7ZlBoOskP3+5dcNTe38wt8CJP44
         sha5FK+G8YmY4ssw+DjcJ+119rbgGuyf9yC6vXD+RYgUu6R5OKHd9HKOm4NWQ9FcNJIv
         oytPOLXUsah9oF0avIJhh4in86lnNUnzfprIp4RR4fBPNuwSTDhc7T+xjnmoAIjZT+Ge
         PPhp44BZYQB3iJcec4ipMUnwbaplSlz/7TJoWGPEdEZeSLw2TSX8RhIIDReFArKQJNNg
         4aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774470240; x=1775075040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXPaSk6rOeSHzsuBeOwJ4iqoWQAtJOAov6388j1L0Ko=;
        b=sFSJQcJMTAMDA173m1c0hn6+EeelnTtxO5VJnNrkhoPLKwdBaMQgqnVfvyYcy5VO9+
         yzOWSJe71Q8f3jDBRcbYGFXy5VkJ0UD+k//H6qQH4POw6F8D7uNmh0qNrnZNlGFlQt/S
         8PDqdyDhoLlG+lSQxdg7/jd6JShVLSZYfNEmvGk+fUukODj06EkwVmzAgS+c216QCE8y
         hzx4ZmKxKHycEJy3bc+tzA1RFLC/bfKKuoEKbkt0q4x6A5i/vZXO1+08ETdF5Y83/bPt
         jxwDL0iOOwh0snkh7PxYwLd8bv43Ax+KCEO9u78jgrUR7uRVmIrTJ1Ju3EX+RohGR/WK
         34mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW5S92ztYLXhxO68902l91axwTYzckB91XobvFi2cGs6qcBJlCoLl/OViD+V3r6f8ussDvI0NIwuplrL4fxyxy@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6e7FlfheQiU15534uefaU5tRaJiGmw+tAJ+/FqWQhyOePk6t
	oOU0dUgrOYIodBEGVogASQPLuhVGv/fOIV9O0Ujayrg70JkgIyeVVfVr
X-Gm-Gg: ATEYQzw+4Xlxrzqur1Y6eLqCUv7E3SyjbBXEbvU+T2Y8DfJP7XlIDOmEjBaanus56uA
	ULjKc1FJ5v1VSFwWbgMR0RvQDhAAjC0KalkobHZIk2eFOCHy4MJ/yrID34XgUCStJfVdjVR+RAw
	M2T7mju3gb1oP0P1xW5L+iVApJjCrLV54Zo3ZAC+O0Cw4nK7nwaiwic07wtZ3c+1wxhNPq9l5sC
	fO1sNglMARRB/0r+2BtiELuB0uPcTFEUb2bry4R1jxZiJsuZKGFti8kYaLpkVa5SQnqg0mNOfUs
	H1rjJBPc/m/LNyQ9Ja4hykQRIfCloqn+c5lIxSGdctmFZkqj0NsQGbPo+2ONdjhmdzXEtrVdAnD
	16lH2QyLLiaYrj4YCYbuNXfzBBUNyXbAhwnQOSISKCDGPKNR+jRcdNt23HCHVNCDIomIOueyMRZ
	xZuvIZORLS4pvNuSS2GX+gtvt902DQZ8kTiyqET+rhhzhV4W7E1OCM5mRhery2KYoN
X-Received: by 2002:a05:600c:4685:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-48715fc38e8mr75859145e9.7.1774470239711;
        Wed, 25 Mar 2026 13:23:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fbca47dsm2239685e9.1.2026.03.25.13.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:23:59 -0700 (PDT)
Date: Wed, 25 Mar 2026 20:23:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <20260325202357.3e203314@pumpkin>
In-Reply-To: <acQOMZMk0OMfIgFO@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
	<20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
	<874imftol4.fsf@oracle.com>
	<20260316233712.7cbfac27@pumpkin>
	<87ms07rlp9.fsf@oracle.com>
	<20260317091705.5a64fc56@pumpkin>
	<acPo7l_pd5rnHpSX@arm.com>
	<20260325154210.79a621df@pumpkin>
	<acQOMZMk0OMfIgFO@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_132401_764290_AE98A16C 
X-CRM114-Status: GOOD (  17.28  )
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

On Wed, 25 Mar 2026 16:32:49 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Wed, Mar 25, 2026 at 03:42:10PM +0000, David Laight wrote:
...
> > Looking at the code I think the "sevl; wfe" pair should be higher up.  
> 
> Yes, I replied to your other message. We could move it higher indeed,
> before the condition check, but I can't get my head around the ordering.
> Can need_resched() check be speculated before the WFE? I need to think
> some more.

I don't think speculation can matter.
Both SEVL and WFE must be serialised against any other instructions
that can change the event flag (as well as each other) otherwise
everything is broken.
Apart from that it doesn't matter, what matters is the instruction
boundary the interrupt happens at.

Actually both SEVL and WFE may be synchronising instructions and very slow.
So you may not want to put them in the fast path where the condition
is true on entry (or even true after a retry).
So the code might have to look like:
	for (;;) {
		VAL = mem;
		if (cond(VAL)) return;
		SEVL; WFE;
		if (cond(VAL)) return;
		v1 = LDX(mem);
		if (v1 == VAL)
			WFE;
	}

Definitely needs a comment that both 'return from exception' and
losing the exclusive access set the event flag.

The asm probably ought to have a full "memory" clobber.
Just in case the compiler gets lively with re-ordering.

	David

