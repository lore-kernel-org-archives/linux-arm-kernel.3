Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACBEE73165
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1e73Tql6+b24rgf2gDbimCQdFoje6dSGN+5ui579isE=; b=0waXd5MHI5YNdzfzn8KlVLe4qQ
	jHGLaWNKX43wqwhkxTY8OBDr6O7dUQvMV5wzG0lDwROK2XA5jdALmKGew1QE+EtY+wPIAxDdaQrKu
	wcqPbowpyV+0IN+UdQB3dfLnUEIlxaLNriHowjl9id/FCeX62WKJ7p04NTBzQSzqjdBt2R2x/q3To
	GzKXttQ3odhQ/W3sUoaNNp4BO+M+/5tMdkhPx9krmu2qKGXUsoYWEFtKrsITDyPvlKsJK03lDZ/xR
	nNqcq+w2emjQCQQcP56yfNSUSUouQxScjp0EUpC/BH7bC0grIPN/7lpcfSfuqrsN94q6lqh0Tkl3C
	1MpAsXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzay-00000005WAR-2Tb0;
	Mon, 02 Feb 2026 19:28:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzaw-00000005W9h-1aLl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:28:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4805ef35864so41255745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060500; x=1770665300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e73Tql6+b24rgf2gDbimCQdFoje6dSGN+5ui579isE=;
        b=e+Lb2IYHWB6NePGlTUihBVpCmj7Uyfb8X1OM2eSZ3lqdtXNPxcb6sbDcKwXbf2xC6u
         NshUpLwyTNfD62Ia/mtb6ZkyP/m/6PwDpE0Er43tYy+ob/SbuFIx4ed78RAOsr9UMeSV
         FXmfUPym4ZakiBQndbC1cgRn7KCJywpfEZCY+3LWJalvn1mYARCT8UBq4RviHocTekhY
         IarXcIpTIGeeqtRUmXLkQly/uleTdaO43UajU5YPzqW1cB9b0uRR+v9r5YYUgS4ooOGK
         lNwoppY46/bcIozXRBEUEs8OHXeysOgEhkUP7YO4nVQnd8CjSrvkZUyVJYVIy5/Zaf3y
         t3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060500; x=1770665300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1e73Tql6+b24rgf2gDbimCQdFoje6dSGN+5ui579isE=;
        b=IEPmfhV9m81Kvp28ZQkLu859VKLMYaircnyBJc9MZj11rQyRPIINwvTRBkbcm6FYuD
         qPoKqZ/kMDDPOWLaaCT4bPBy0vJLcvcRt8PTU2Bpee7DpWwDppbK/57VesZmZMMg37Gy
         0e16xSm+DGXG8/wOkxUz5PLco4nl7JhamIz5OX/QvWfa8oUKwhTeE6DVDUMO+iyRtSei
         JLSAu/wi4g7xovbjDjdH7u+8xlJxQWPTtsUcetpNebF9S8fmUUi2TYjbSS4z7uTyHaAh
         JQm9ur1QQEVvclheD80ZeZyRyBYQCUlQ8AmoVW8jFql1TMGV00sAlntvA8VweCGH6pvc
         ACqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd5kYnyuDmzkn2HUiTBglTnxu1Lih3k3AJtYd6LZWgL/JClr49hTepM5/82/fBkl2FDkHcgNPnIagvfLU3y7DZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7bTCC5uyQB6LRTzib9AKCadqTVyXkUaTp8SKW1hrKYyx9TX6s
	CcYKW9jnnZSBE25VkRbIpQREytVE2uXNPEw6tmrrO98j8pp/mGsmQ+F1
X-Gm-Gg: AZuq6aLGw8vEt2W5ewfsQD61BrTc5gkWE5EB6l+DMEXqJ0CwYbjoJ5vZ8in7t7yLbP5
	4mRxDg9cb70tBZ7IRU40xXMkYkzNro8G+YPHnRwm6rPZy2lLFl9fuuEL0OqUvnBzG59CXD5oHWW
	Vv+0wGqMCIrjxWP+po/2XwsSAN6i+ekoxGThlerOylSNwch0E3P5AaCgMvOBUhcahpbXsVKlC+i
	Plupza3B9kyLXGqHLGUbcAoKypm3PeEOyBoNDOBA2ATGyDTnfNGGtkUKhiNKtdARwf1zxBUBjGy
	Y1IqndxeyAD/m5XhxD+s1yCb4TLiCZHh7nF8kxqhh3DKJlTFUz9e6Vwpkunx+8qrSxspg7Nvmkv
	tyQx0pEmpjK1y1sb26lUaOZ3TzUZbUk3iSJwaKMPytE7u7xlCYgLQv7ZLO92JkdttaVbfdd6wXo
	o6ytRyDncsoOvMNSM4j90ht+/4nnjYtBFwPjn6nEH6caa+ErD/rylj
X-Received: by 2002:a05:600c:1f8e:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-482db447b14mr158848135e9.2.1770060499792;
        Mon, 02 Feb 2026 11:28:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051626c1sm8323325e9.13.2026.02.02.11.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:28:19 -0800 (PST)
Date: Mon, 2 Feb 2026 19:28:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260202192818.3002fe7a@pumpkin>
In-Reply-To: <aYDEiOutq3_O8irP@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-3-elver@google.com>
	<aYDEiOutq3_O8irP@willie-the-truck>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112822_455822_22C34159 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, 2 Feb 2026 15:36:40 +0000
Will Deacon <will@kernel.org> wrote:

> On Fri, Jan 30, 2026 at 02:28:25PM +0100, Marco Elver wrote:
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
...				\
> >  	default:							\
> > -		atomic = 0;						\
> > +		__u.__val = *(volatile typeof(*__x) *)__x;		\  
> 
> Since we're not providing acquire semantics for the non-atomic case,
> what we really want is the generic definition of __READ_ONCE() from
> include/asm-generic/rwonce.h here. The header inclusion mess prevents
> that, but why can't we just inline that definition here for the
> 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> we use that to implement __unqual_scalar_typeof() when it is available?
> 
> I fear I'm missing something here, but it just feels like we're
> optimising a pretty niche case (arm64 + LTO + non-atomic __READ_ONCE())
> in a way that looks more generally applicable.

Is that path even needed?

I'm sure I've built an x86-64 allmodconfig with it being an error.
If you look back in the history it used to be an error.

Anything to simplify READ_ONCE() will noticeably speed up build times.
Even on x86 just removing the check that the size is 1, 2, 4 or 8
makes a measurable difference - and that check doesn't need to be done
on every compile.

I'm not setup to do arm builds - never mind LTO ones.
(Yes, I know, it 'just' involves downloading the toolchain.)

	David

