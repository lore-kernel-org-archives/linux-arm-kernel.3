Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F154EE81A5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/JQs8pM36d3KULNNrqatslwjR5gUtUOBzbMqn0DXdY=; b=lp7C0yHv9jEN+Dv/vzEei4gzAU
	+kaZSIrGfJiGMp5MUKERD5Vw7f4/uyheZZsFySaZFFl3pubpDjl4cPmQHKBRd1SZaZct/Z6m4zyvb
	I4QliKROr7sChHjKzds8VphlbKwHX+nCZ0qg8op/Fb+pUYYBlSu/KLbAopv2aScJ1IqATWh1w8Pue
	EdwS5wvOy/Y5CviAw5ABtlBGWuzjV1MnG+ELmnOpX+IhCwxm1R6gzi2rkW4D0eLLvWectYuSyPFnt
	C9YsjyBZds+TmzYYV1j4aB5zXSQS6PJP5nLcpwgtKszsOIZTehVJw5V5TY7TzUCkIx/4ylv1y1vqj
	ekcKrDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2d9-000000076fP-2H4k;
	Mon, 16 Feb 2026 17:43:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2d6-000000076f1-40Dn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 17:43:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-48371119eacso31671155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771263807; x=1771868607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/JQs8pM36d3KULNNrqatslwjR5gUtUOBzbMqn0DXdY=;
        b=C70+mSMMqAkJE0PxBlcKc62ohNsCoz+opmY3xLAjJ2j6UcEFnkzjAqvUrIIjeYKRvr
         MpCzfGfQxahtq6p1si/eBunrgyaojrv8SLtQhJ+deJwsVu5KNOOFRmoOC9BchFN5OmkS
         tExhGQwg74pFkbvjRIOK784kl3LV3cVCtmBb9osNioTtUE7vvyZI8JGbyq1lBeRgS855
         cqZvCigHF5b/JKg13mgxOgwHm6IcWN0d/orEX13DFIeA8Zw4XGgtWganKT3eoXTMYOko
         1QnIrGecWcHF1X2VQn5F1hEc41D3CmTHlcY7njq0PwZfTmj+f1rumk76NH3ekugJhfsj
         lCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771263807; x=1771868607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/JQs8pM36d3KULNNrqatslwjR5gUtUOBzbMqn0DXdY=;
        b=lS/FwGRB3BQpXE2yurP4iuv0zV1ONW//iVBBc4zqKflOdt4x9R750XTViZGUIMZp6u
         wZWNXBbgI5Q3p2NZqaMwowIFAaO+OsZgtUIiF0/kdMZszuvUTeTbGQuL3pvqrYp4iRoV
         r7Z0ER5Q/1jfJZTWljQcWgnCsVIcetD8LiG2C1F67X63306nS7s4St3tCh+Bkk9mdHHJ
         UiS51CCRyWGM9mvOU0sw2YiJqT+gt7WZYXh+tEI0jO6PVqBrgj+KD5ujH8xtze7qn5Fj
         oKu8HWbcowvIEP2iePcxIXTWa4/o58YNVTY2Iu947GoYfEKx99tfjKzxg0Z/F8Tf3ttj
         PGLw==
X-Forwarded-Encrypted: i=1; AJvYcCUst8INHAA3dGKKxV0P91EmPJMCSNgjU8fQvjKIsobs1WFuNFlQzmq84stnvSg8wtUE3mRuUqwRIOChTFXyPkGP@lists.infradead.org
X-Gm-Message-State: AOJu0YxcOXyBr+gkrtpMSWG36DWkMM9Zllp2R+SQN6loOO8njetYLm7B
	pHGnP0M6GEgNRBjuRBNWY3RkIgU9kaq8Dyf2sPmzZwpsMfL782FC0ovNwbLUbaSS
X-Gm-Gg: AZuq6aIDXXJy9gn2xpoWsKOQ3a0kIn++KeVvje0aKNBLfEZ1tfkqoT+NpXQl3e6WShT
	RjTV/M5DAd3bGt9bwZ3SACvWb//PMZ7mDzdf+HE/3ZnxXXDIxiqHfGkzZeg6L2NkCmUJYuEjYqh
	wLXZ/7Rq8rn7+9zlgXO1a/JzxiShPyE7sSt/WoPsDDMVZJp31tE6AzPDIyxRbJ4qDl7LyGPy8vI
	mG+iNo0KTYwJRFqTNWjCOiHB250SdqLJcusoTjDA49DlFdL1VWDsFficAUaH5YpS0GP/BSJDdiR
	GIyV1JiZ0BsrnSSF562jz2VBH6TNzN3I6EVznx+8BHUbVZBYbCt9IXXLrM/sZcslctH7agUMv6N
	ORTBq2LaCCLhsv4Vddz2WlRjhkp7pveo4CN4tHrOLNJifzCa7u1zyAHh8Gq+3aUn3L4shpRBSdA
	0H3ndgcVcG/PT/KJjqwoZuuNr44zr21zv07JCrTe6lmMgVxfAmHpziXjnKhB3VqKpN
X-Received: by 2002:a05:600c:3d96:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-48373a66552mr194454965e9.25.1771263806667;
        Mon, 16 Feb 2026 09:43:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm829023295e9.11.2026.02.16.09.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:43:26 -0800 (PST)
Date: Mon, 16 Feb 2026 17:43:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng
 <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216174324.75d47e37@pumpkin>
In-Reply-To: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
	<20260216110915.4f0d5490@pumpkin>
	<CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_094329_067139_F57B8604 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, 16 Feb 2026 07:32:53 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > volatile structure members are almost free  
> 
> No, gcc does absolutely horrible things with volatiles. It disables a
> lot of very basic stuff.
> 
> Try doing something as simple as a "var++" on a volatile, and cry.

On x86 I just see a load, inc, store - not that surprising really.
(clang did do 'inc memory'.)

It's not as though 'inc memory' is atomic (without a lock prefix).

Also var++ will be 3 u-ops the same as the read, inc, write so the
underlying execution is much the same (ok you might save on the
address generation and the compiler doesn't have to find a register name,
but I don't remember anything modern being limited by instruction retirement).
You might save a bit of I-cache.

I've an idea that gcc converts var++ to 'var = var + 1' early on
and then might manage to convert it back later.
A good way of running out of registers,

> 
> We need to have explicit 'READ_ONCE()' etc atomic accesses, just to
> make it very very clear that the compiler will generate shit code.
> 
> We do *not* hide them and make them implicit by marking data
> structures volatile. I very much want those explicit
> READ_ONCE/WRITE_ONCE cases.

I guess you count as the boss :-)

	David

> 
>            Linus


