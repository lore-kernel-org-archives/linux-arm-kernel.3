Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF74CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=; b=lNbejushOe1IlBHJTMjFQ0kHPi
	j5HMob6T/KgU3FUYUnyndTtRNxY0VXthUB7q14l6HKqj0e7WdGj/dSl9fL7k0gGTELr8qMTt2jEPx
	gyhyrk6yTGST+5wG6ym4akBzSUvDHGdwUmhqGtjhRe1vwZcPfCBzdoo3sNWbuLmKpFCF7B+3ITqEC
	ZX+jzfulQcJnRbFTdlt7DO7bB/zmygxZ1nZwX5odJ3swscvDKwtlRHouNUzVJHFJoMP8uw4Sf/Hn+
	+POo7FrNfkA5wVjCTrRBwfDug58lYVp5ifFjk9msBDqUhIyxiKGlZekKepYlMC2mHq7GjD9Ny+PxH
	JlYF51xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC15B-00000007NeF-3YCs;
	Thu, 23 Oct 2025 19:34:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC159-00000007Ndn-27Ag
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:34:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so262948266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761248081; x=1761852881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=R+HQvT9R1VllzUYxeZ5o7ANttIYLW/n+mQGATVDGT+22VQQ5NwcLMeWvQ7WzlTJ6X2
         Xp1uqrpGtTAgP7e8Z5QdZxbkYvw3oTLWF5F9B6/DV0SP8twk/vHX+y3nt4Onht/Rs41P
         Ptt3QXU6Ozbck/LTS9l9Q78HoxwXwI5YJ5iuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248081; x=1761852881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=krTeowPi0Nx1iIzmJvK9QJWkgucYKGVAzvzEup0Mc+4DPTKc7rw650N+GHZF5VQVOG
         eu20v0toH4XnfjGGfRDVfWOwYIh+h39VRO98Zyhi3L9rtYn2GqH8MKIEeLqWu4oQa3qG
         kYoA6jhqJ4VVAYXw5PFKfXj7Z8hjSRe5IhyltarHuyy/pTVAnQr7+jO34O4qx5U4QsHu
         +1WbUEJ+innJmn1vEhyfBWWC9ZcjDTVZq1ionuz3/LV3ONkj7Se13inpSpUBZ4vPEQ9f
         JoPrlHyaM1mAcvzuqMCBKq273/ITM8HQZK9rHB+OAU+C5NCr9zbdDi36DKFmRwJF5MJc
         c+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWDCEiNe+qX1HD1UjJSXnP0H5SFcmy/ygWsS8U6IY5DM6vukOI4+03ZvTrj3fswBbh01IXeVdJ29CD93byaexFr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkp/XvDAPr2JCCRgPjCk9PPCZe06UXzMCjGLB2eYSwq4pNyW1W
	zAwn3UdYi581SW7HHCVky6j7hDCXirAoI3hV/QzhFwKrjvHKgqbnoKyoxsaAUP5x+X6AFrstOk3
	qE8j1JjPIrQ==
X-Gm-Gg: ASbGncus4ukMFBgBtVNLQUbOt9vtZt/qXz4tqDjqkiIzqoYFVV3a/f8E9+QiouEp26w
	znnez/6PhJgDZSX67ZqQN6fKWEwfOoiypsQWL4f2mDILSwzeQ0NPdsNNmYp3+ZM/mNzJji4d7up
	7sVpS7cazyHOq7PN4KnEIVo4Ih2loRjMKja5CLS1XC9QvB9v1+Ugcpq+OhewKMjAZrBBl0fObNM
	hiip+Y783/u7mQrwt1UgaDoPfUsPJCTJY3ZDJSetP/VrZ39VMQuiSLk7Ag10EVn9c9dCwTxPoDP
	MHQvJlWQnCMTquC71jguiXfUaeif9Rp4W/3yjT3zCGb9qBZj/hi9gg0fbVZ3ys31HX2yDJftXCc
	kKng9uWM7Osda86HiQVTKXExycDgSwfu6z+fdrR+NnCOtnmw3UC6BFRYyWi8JlfzhkAscAI1t25
	yyloPqg6gKsCDLbFVIV9q3xvYcI7+lfaH8YYf/NX86SS9wD+fvdA==
X-Google-Smtp-Source: AGHT+IEnVb312mM0/ZUW/Cvgi9JZzdsiNzn4SI0vwox66FNvId5aPEr3WN55/5CiK8j/YPZ7IitF/A==
X-Received: by 2002:a17:907:d08:b0:b60:18d5:429a with SMTP id a640c23a62f3a-b647323fac1mr2913897866b.22.1761248081406;
        Thu, 23 Oct 2025 12:34:41 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51417143sm307645866b.42.2025.10.23.12.34.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:34:41 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b5c18993b73so218884766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 12:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKZpWl3zJ+IzLxcC/bwfLfXNhXnDy0LrtuG1Xs4NZa4VLoNr1++5lbDtl/ISGxpkPanv8dcyKMKJFpKEKXBrJw@lists.infradead.org
X-Received: by 2002:a05:6402:2681:b0:634:ba7e:f6c8 with SMTP id
 4fb4d7f45d1cf-63c1f6d5e1bmr24956720a12.34.1761247589536; Thu, 23 Oct 2025
 12:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
 <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com> <873479xxtu.ffs@tglx>
In-Reply-To: <873479xxtu.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Oct 2025 09:26:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmaCluDq9_Xyq5CJoakX9a-PwfYiYDMZ1KnC-jDJR9ceAw_ALWfx9Y5hW4
Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_123443_554100_B187DD0A 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But as you said out-of-line function call it occured to me that these
> helpers might be just named get/put_user_inline(). Hmm?

Yeah, with a comment that clearly says "you need to have actual
performance numbers for why this needs to be inlined" for people to
use it.

           Linus

