Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1603C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz3n2kx5aGQtVo+6M77EKhOapmsUAGWKVN5VjqkySUc=; b=kQdqpqDeEyKY4R1JAMfV9i3ANM
	NriQzBvuBXUZI4mNS/4ifpcoaeJaGnbkKool+bR1WMXkTfxcCA/KcB5+0d06Qjb53eQUodjFAAO+F
	LZH0jdsWMFomDnpX/JOhYKC1Bp+qBPTq5P5emAbU0j+3PU+ErymvxFKxdk2+84FsoRtM+SiFwAMvl
	vu6CTF7wBx5l9Jnardt8UQ4O2Gy71Yopy1dhN5c8JAzAdEdnBsIB36/Ed3w0mHBG822GjFn7i/yu3
	9v+YsnzSDriLMtMuZFdMo4/CYAWJ26ZAjEUT0UNAcUXn8ZNSQvKX5ZJi5EfobnWWymUttydnHVDwK
	vK2FJ6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwOU-0000000F7Sw-0V6r;
	Wed, 12 Aug 2026 00:00:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwOS-0000000F7Sp-0mdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:00:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F71F601E0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA8C1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492826;
	bh=Fz3n2kx5aGQtVo+6M77EKhOapmsUAGWKVN5VjqkySUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PlQxJre3wy30GRTht0NaDiT6QxgHBkeIi2mvB5MdkzGM/HTTIPxbTdficg8Itvrw7
	 7u4jhXyMLsUhS5tfCmUHx9QNNAx1I9p4wvRJODIAd6NWsL7yynMX0bAPShmpuwo3EM
	 u7WkK3w2SsitWx3Y3KFAljhLqo0Nyi7xAi/q8ZRazXokaQN3rusuNcY4ZuqZtmA7Yv
	 2M1lZpe99pHIIj2Ts6oPwZ/hdmx51+GdK/Imh+NxuQl41VyVmAXvzGXz2xXdbAnlVf
	 CCOLRo//+rCDzwGVaDKq5rUBM2ICcxMl0TGCE6ahchG8WIZKJ9WPEUtzg6enaMgYMo
	 9e3/n+8yp6NFw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-934956bee57so48914585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxyBgrjTgUHoQA7+vSG8Ffk2r5KDtH5PeV9B+RiZXxRDx0dG9twnEoZbHPK9KND6x/iLXqXLzsJNN6/v/AXmjV@lists.infradead.org
X-Gm-Message-State: AOJu0YyEAzLzjwxH2by6Xkg2McdlsiOY24gKqN6qA9ArqQezOrwiYPF0
	NtCaoETKKj2pumEI4Y7iC4sjQgUlCUuhzlv5Wya/FZ4RO/SsbMrpRnt5MaNckjk0QAqcj4oTrru
	jOC/XXz0zDehIp8eu+cl9GVV3o6We/mM=
X-Received: by 2002:a05:620a:2713:b0:930:fa5b:6ee8 with SMTP id
 af79cd13be357-936b3e1a2d3mr134602685a.45.1786492826100; Tue, 11 Aug 2026
 17:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <6f447024ac8b79a1a6f1b8eb1c5eb1b51017af79.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <6f447024ac8b79a1a6f1b8eb1c5eb1b51017af79.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 17:00:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW67-1chkvWrkySov3YMmiMvEWBSkE=b9xJ2Auay5GUazQ@mail.gmail.com>
X-Gm-Features: AUfX_my4jo80oP9q5uyoFMIHTpQXW7THsLSWkeLbBnzcmKVQED9n-OqEpUJakQo
Message-ID: <CAPhsuW67-1chkvWrkySov3YMmiMvEWBSkE=b9xJ2Auay5GUazQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/22] objtool/klp: Don't correlate arm64 mapping symbols
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> ARM64 ELF files contain mapping symbols ($d, $x, $a, etc.) which mark
> transitions between code and data.  There are thousands of them per
> object file, all sharing the same few names.
>
> They aren't "real" symbols so there's no need to correlate them.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

