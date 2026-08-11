Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5CBC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikcxj6SHN3sVCruA83BzqEfCpM169W3arl0JAL9WDpw=; b=tKpRfGkYype/nKcwpCvokeydY7
	cCr65vR3ouG5eXKoHOB6teSqxE6NWioL+yeQZTa6IeCeLHlH7/Lo1y2K7jckk91aU5PgCz5pe/3Iv
	hruwT3RmpM+/+W7slLYx9cbnzW8h+ylUlWkxmNCVSM8kzxjTDXMNHPbeS8LszJ8Z6daJ/1khpoypr
	JbhW21tGcf8/7BlM3G8Fr+E7AmamALVcvzFzBAx24IHjqtAqodLt0AROz11IDYO2XXRsYEmv7Lnnl
	+OZFFgZbKMdPj0kCfHseD1uQa0ykvftotbYM0Vvb1V9xlTASYuVYo7AYvP99tP1LHrdsjUqM+qvy0
	+AZieKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwCt-0000000F6Us-3FAs;
	Tue, 11 Aug 2026 23:48:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwCs-0000000F6Uj-3tlI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0894560AA9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1131F0155B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492109;
	bh=ikcxj6SHN3sVCruA83BzqEfCpM169W3arl0JAL9WDpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iapUpz8ejqkcpdE87vY7E3JarlsiWxLFD8dM5LtD+C7MaZLPl6aLiYSPKEDRJ1s68
	 P9GiOzZHW2upQ9iiYszBlViNB5wFkZ37lHEYJrPsD2Nr8C6YL27Um15uYpVVjn6xBC
	 h10woQxbYhIzZjd4bWzyx/p+lE5BFiYOMTvA1smgazco+eV/i20VKzwL9KPaT+0lGS
	 PUltnbwtiqxvbF/WBAmwnXUYCggc8OaPqzwbSztm45yK9MG7GVXoffXBfRKBWaeWsx
	 T2ZdWKpt4y/4juDI9KwTIRL2hfbliobNsiMtRfpbWzMCK1akoCzi9AiPneum6vVQag
	 6Rpp62unF35vA==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so1516736d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwbGWLwalRLjt98eMv2fpYVQTGZgu0yoAR/8Awpr4Js+pouiJg7GNiqP8slndfQnpKO8cwKyFwFlE7BjB4xWGg@lists.infradead.org
X-Gm-Message-State: AOJu0YyeeVpWtft/kRfQvL++YT89md3qEcN/MMx91fePhlLTQrfYCBVI
	HhNYBLgg7ULmVdgfoJhdGjgfdobVN1bElvijJEvNwMmRCVrfduJWrZ9iJkP01FgxUYsf35lcZk7
	rRRXf2/E4b853zeXuVwbcePk/+P+SB94=
X-Received: by 2002:a05:6214:5014:b0:8f5:5866:161d with SMTP id
 6a1803df08f44-90a6fef979cmr8295456d6.2.1786492108807; Tue, 11 Aug 2026
 16:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <3c65abcb71c23d04470f45862523b0363ee4d709.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <3c65abcb71c23d04470f45862523b0363ee4d709.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:48:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7RDPw6TSAc0f44P9bm58DK=5Q41gdhVoy6Z1s9UiKn3Q@mail.gmail.com>
X-Gm-Features: AUfX_mwVcdAxqF54qkAocwB8JOvtQSEYvvnkAztsUnfN_9WEZHGTqqpAoPTqEa8
Message-ID: <CAPhsuW7RDPw6TSAc0f44P9bm58DK=5Q41gdhVoy6Z1s9UiKn3Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/22] objtool: Refactor elf_add_data() to use a
 growable data buffer
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
> Instead of calling elf_newdata() for each new piece of data with its own
> separate buffer, keep it all in the same growable buffer so the
> section's entire data can be accessed if needed.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

