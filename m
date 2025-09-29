Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0146CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bogWF7ZzmqTQ/ldKkIp7R7jAOYo/1qoIHxhZsbi1nU=; b=pL+k98v9UdIwgd9YNVhOICtKTE
	ySCQICxU400yht6f1fTnFp3vnF06QFsrL4UjRJW5HPMB49bbj9OXDk7Az4j7s71pwvqC55GfsvhLm
	hUSLQpbJZMJOSSpty9nE4P/6q9hp3YSJ16JZWpTiZf/uf8jyGQfz6xMi3xM03SA0j/GFnUKuov1g3
	1qDJ8qXCa+m/RemmeSzv82EAc4kIiIAugHj3pSmLc0HoteiLSmp02ftTbnlWHjrxk92iWjnr7VXcY
	GwCa5aMXBMPkc06ucGw0LqgEIffyYyiBpiowEhAWxrq26pvKYCDeC+YA6p2wYC7dDXIxB+0DM5Liu
	Dd7HqKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GCP-00000002qlZ-0BZL;
	Mon, 29 Sep 2025 15:54:01 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GCM-00000002qkO-1oAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:53:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso10778273a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759161236; x=1759766036; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8bogWF7ZzmqTQ/ldKkIp7R7jAOYo/1qoIHxhZsbi1nU=;
        b=K6eXk8rgqwKou0nWqHn6MJ4H4wlD1nowmRBlMdEp2reIpdjqzQkUj4aootwY6SGRwO
         1NMzicTS29p403KR9Vr05AV+ct0C4VfQUDOSED/TuEkH+J7ztSfkfoMNApHZcZMQdIDl
         FMjMt9NzZk3z1TLCq6m51bXH2YmSZKWCJeYKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161236; x=1759766036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bogWF7ZzmqTQ/ldKkIp7R7jAOYo/1qoIHxhZsbi1nU=;
        b=iW+hCZDVrJHxNINeEEMqV4+hcPJdEjdSYJ+sbkS80odO1i8NIxRIOhAL+bQ66aQ+zn
         szKJ+Z76B0GGq8axo/xWX73BFSRxMMIImorQq7OcmASO6b6xw1SRVhG88GIkV27o+5Zb
         oMuB9PiFrCZWJlvIful6guMfK0R5Mgjh73+vhVcsTuHj+bYqZ+7PnjmVFt7Orb2pTLIi
         u/LHB7hQ+uIx855QsvHUWTSUOMKHn3iBVUOPw7ZPyIU8aodYOs5Lq4mPbs/V90kORGgc
         YC6b+puDT9IdtNntCn3wQQP0zBBKJk5IkdsDKSn8kyg2uSa8sHF7z9cAKwiblRwdvgY0
         O/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVdwiHmlLC3w5qwTGGfhver5xPT+uwG9aAHV25He7o5M5F8rvKAGzCtctVIe5bLxQu9Anyz4DrcsrIZqoQU1CKU@lists.infradead.org
X-Gm-Message-State: AOJu0YxK9wUkCdN+TbhUqGmgUuHLYV1ADXE5Q5NGow93YD7QfT4liBvH
	uoz90gOOaixI2KTu2Ab7Xx2jhVw0upFvZM1vziJT3pnhPO5+5EnyJL+kqzY4r4GeFRM0hGznqAb
	jl3DYzzA=
X-Gm-Gg: ASbGncu8yitsbxjGbjlN55Ybs8NbJJ+/HltFHNDn8TdNR4b9hxweCixCzFnkKIEz6oy
	ti8UfaE5ptS5omSddA9OuFEk/aqcADG1qFSipY1tNj3zsZANAirLERJXiIKPZtkatUk6/p7tqsZ
	eWXRDgIplXX/+mwuiZnLTTU9oC+OpT6fgJ/X6aeOhDQThpBg6yqZX1HcioqwDW5a945tmK3QBG5
	4VGHLmcjwIbcpivmz9eVFoEKK7ijaq6GHU2fkpaEbEC61hXUxFDYOgszUjwMFJIMfb0s5iC4nS5
	EnxZyyIIkQhxJqW4mFrhn8WCt8JyAe8R2n9u/6Uy9P29LZNqxyZoDXqQ/xAovuihx8fi7p94uwp
	9JIFan1RCN8oU1j6UxuanAepfOLNIAJKhR3nj4sAxLg+C3m7+NONlXHL26IhbXdzqHsRfS2lJOC
	sBv/LWixg=
X-Google-Smtp-Source: AGHT+IGFhG5a+yx/686Q462DsFNTvNG3niob4HW1MRb6gvF4yHxKp7o5qkhDDmw0k23+bak64Cwwzw==
X-Received: by 2002:a17:907:2d24:b0:b04:2452:e267 with SMTP id a640c23a62f3a-b34bc399695mr2033888666b.56.1759161236408;
        Mon, 29 Sep 2025 08:53:56 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6365e6e9d70sm93624a12.13.2025.09.29.08.53.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 08:53:54 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso10778154a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGxaa1JjivJAH1K9QatC1cJf0rOqq0KuJ3v8z7q9Z4rvO89eyh1f3er8btZG5wdNSwtjwlHEpRH+q9nxd4Jglz@lists.infradead.org
X-Received: by 2002:a17:907:720a:b0:b40:664c:3317 with SMTP id
 a640c23a62f3a-b40664c5446mr230881766b.43.1759161234098; Mon, 29 Sep 2025
 08:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250916163004.674341701@linutronix.de> <20250916163252.100835216@linutronix.de>
 <20250916184440.GA1245207@ax162> <87ikhi9lhg.ffs@tglx> <87frcm9kvv.ffs@tglx>
 <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
 <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
 <20250929110400.GL3419281@noisy.programming.kicks-ass.net> <CAMuHMdWtE_E75_2peNaNDEcV6+5=hqJdi=FD37a3fazSNNeUSg@mail.gmail.com>
In-Reply-To: <CAMuHMdWtE_E75_2peNaNDEcV6+5=hqJdi=FD37a3fazSNNeUSg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Sep 2025 08:53:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whmf8OKRBKW_xi6SLrvicif8a2e7Pn9v6Qi+ioDJxnqmg@mail.gmail.com>
X-Gm-Features: AS18NWA_sOSQWHCpV2l3Y3mPQhfU2h00coqPdVCtJP07FYq0uVp2OVr9zTyIh6I
Message-ID: <CAHk-=whmf8OKRBKW_xi6SLrvicif8a2e7Pn9v6Qi+ioDJxnqmg@mail.gmail.com>
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
 version 17
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085358_491936_1FE144DC 
X-CRM114-Status: GOOD (  13.52  )
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

On Mon, 29 Sept 2025 at 04:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> >
> > Ah, d'0h indeed.
> >
> > void b(void **);void* c();int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto(""::::l1);return 2;l1:return 1;}}
> >
> > Seems to still finger the issue on x86_64. That should build on !x86
> > too, right?
>
> Thanks, builds fine on arm32, arm64, riscv, m68k, powerpc, mips, s390.

Ok, I just applied that fix directly. It's clearly not a fatal bug
since it just falls back on the non-optimal code, but it's one of
those "silly and subtle code generation issues" so I'd rather have it
fixed asap in the upstream kernel.

Geert, thanks for noticing.

             Linus

