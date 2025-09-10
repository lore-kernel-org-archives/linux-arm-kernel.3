Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09095CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb8rn+o/7hVLmNx0470CoSk8kVZjdZO+vXlMdQNmAxk=; b=KGLOv3gf+EUWDdYXJVTOskTRiY
	bYtEQ9iEmmFPx8g1nEaRbRXSnO29fBMSWA/DhXAcCAsPQlv6Uctk06ucbu69rUM4aaK9YFN0SMDoD
	Y1mX28FS4AjRquWd9aP+1NsYdXQV5aNfqzk9W1W2caQfYW+3nRkR6jmK6EiLn0xU6UZAtxu2TWcpm
	JVVbDtcvfKPA0pCudhg40vOqhwrHHb4p5nTkdzZo+40f/R+bKcGy5u7oXmxFDFJxNMQc7nV1kGwQe
	x9k4o9dO+t+1uEr3Drbag9UTE+IRQ/nMiNfqp2O/fr5QNw8PutjFkiEJ9+uTVrPadSU7SpAYP1j2M
	jJD7dW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJtD-0000000E64G-27cH;
	Wed, 10 Sep 2025 12:25:31 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJtA-0000000E61p-1KAS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:25:29 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-336cee72f40so59378361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757507126; x=1758111926; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb8rn+o/7hVLmNx0470CoSk8kVZjdZO+vXlMdQNmAxk=;
        b=Bqbklh3qZMA6PjCSqQUhFwMaYLqMqVYl+pT6cwqTJHoDm973NJH3zIYOIixiJTr3+b
         DoxUZJ5GLivjIsvbYUOcQXrUsAy57MyiPrTeisKlFeBbpZL9ziggUwoZLY+lqPAnTcXi
         TYfLe+GqyLGEtgjvZ38qbyLUf6MWAB+kSsToYr4lHcTF88VlVMOd4ZaphRKB3wx3o/q6
         7MIt9E752oaZZkiSiL5K+i6iPnlJx5kykScsQJt4aVtSNbiG0f25qG55aL+UdlbjHPtA
         9Ygw7eI9e9qDHq8XNnVvQSH4mn46fq0G+iEfSVQnizC+1wA/PJqxd99JmbbHeeKOulJf
         M0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507126; x=1758111926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jb8rn+o/7hVLmNx0470CoSk8kVZjdZO+vXlMdQNmAxk=;
        b=UVXyioyaRXG8kAcF6scCh66Sww6XjkF5UhpcxDyvwZCHvRmI2GWR5xQDQ4HKHrcT2B
         Spo5xvrM+Ob+H3oxD6cG8cThezmiwxCZn04H95ok6QW79eKz1RDTcQpfG/S4otAplWVf
         OP0bKXpZNQ0jXvazAY2Pj9jaVIEv6/TZH8OkGgo6D4Ruoqlo/64NhmWdD+uB/PiNU/RM
         tsJfLSzTCcqnJHzNAcNTcTQDPyySpx3hp+8u6slnuVT20J1A8HEQoqYFtGoP7VWSZ07a
         y+9eqqnpjLSh6c+jb3cwObzdhI7YCyeUHy2TrglRc9edQ0R6bbUrrayLN+zJgtuiGoCV
         Srdg==
X-Forwarded-Encrypted: i=1; AJvYcCXXLC+EiLq08HI4D7yeUDDAaaLLihRB+jsViQrlsuxkYb2BhXrcK07JJnlEKNRyx0cEtNiQBlyKQi9mE9fbqi44@lists.infradead.org
X-Gm-Message-State: AOJu0YyRkFEkPdNCM04pye40zhhqG4CfWYtbuNOzFX4gn8G37oiLlEXx
	+i7FZRItHpZZ61vcKYv5sR5TBVVgBNFkdYcrdgd9eAVoKw+o9J4qvnAMyHV6arA7IxZFT+DMkRV
	DCCmrrsS/cZDIaJvAWemg9qCyknqqYKTmPCX0RzUfIw==
X-Gm-Gg: ASbGncu1xyYsDFJ9eLskJatO+gYxorPyu6/Aq79bjSypwpKQAnGU+YKq2aArTAh66/7
	LUtAQ8i3wqF8lr+1DPyj7drewOqwuAe1mO24uUI1O4KyU4IJTSOL4ijNaexCKkDB81aCmR0+JLb
	mzkI9htVwwZAL5KbeRy/9Xot/IR4/6M/rIq2Sjae+8j9bIewWCvesOvRbEso6h6WSj8z4ot6rKg
	4PSjpKc7MrTIhQ/E3DTbqt88mfp
X-Google-Smtp-Source: AGHT+IFpOfA2Vx8asGOoswaq+u2iYr23nDNKUHrWZWNtcdlEvv8oM+dzSE/hD6j0Xw1XIKlEFSbJcTZHF5YA5L01CHA=
X-Received: by 2002:a05:651c:2222:b0:34c:e79:7827 with SMTP id
 38308e7fff4ca-34c0e797cc5mr7496491fa.21.1757507125790; Wed, 10 Sep 2025
 05:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-arm-remove-high-pte-v1-1-d0899882815f@linaro.org> <7dfbb373-fb44-48d1-9880-747faa47e079@app.fastmail.com>
In-Reply-To: <7dfbb373-fb44-48d1-9880-747faa47e079@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 14:25:14 +0200
X-Gm-Features: Ac12FXz8vGvAJ3GsfjfvZvjkh8hgdiVonDvi86w4Nv_gPmhE_jPbQsRJhU373_o
Message-ID: <CACRpkdZ=4n=_yeWY1MSDRuQ=H-P=QiTcQkJF_YDHMfRM2RgDZw@mail.gmail.com>
Subject: Re: [PATCH] RFC: ARM: drop support for HIGHPTE
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_052528_356347_5401BD3B 
X-CRM114-Status: GOOD (  23.64  )
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

On Wed, Sep 10, 2025 at 2:15=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, Sep 10, 2025, at 11:47, Linus Walleij wrote:
> > Matthew Wilcox suggests HIGHPTE is a burden for the
> > kernel MM, and only one ARM system (vt8500) is currently
> > using it.
>
> I think the vt8500_v6_v7_defconfig entry is a historic leftover,
> instead it is currently enabled by default on all configurations
> that enable highmem.
>
> > This deletes the use of HIGHPTE in ARM32 clearing the way
> > to remove the feature altogether.
> >
> > It was introduced in commit 65cec8e3db60 "ARM: implement highpte"
> > in 2009, so this RFC is intended as a discussion item to
> > check if it is still a desired feature 16 years later
> > or if we can get rid of it.
>
> We discussed it last year in the context of the PREEMPT_RT patches, see
> https://lore.kernel.org/linux-arm-kernel/20241210160556.2341497-4-arnd@ke=
rnel.org/
> and Russell's reply to that.
>
> I still think that dropping it is the sensible tradeoff here in
> the end, as it should allow further simplifications in the
> pgalloc code. Your version of this patch doesn't (like my
> identical patch from December) actually do any of that though.

Ah, I was blissfully unaware of that patch, sorry.

If we go any further with this let's rebase your patch instead.

Yours,
Linus Walleij

