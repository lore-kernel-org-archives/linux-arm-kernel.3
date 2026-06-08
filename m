Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF59CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXY2HhbPtnWWjy9ZRBg6fDZvGucC9w5Mnr26sUiKheY=; b=bJRhvIFUJv9uN1qqhWFve3hmF0
	Sr2BNWVfSnWbRVexngw+oSWsuyK0kgf94T8D6Pt4YOPBPeCS69nredZ8AalmKdh/mx5PsxmxFTtqW
	WgsmHLscdi2svb0hVg7ofsYWV50gipeI6a6L9BMUa9eQWNOn3vJ8sl8E5n2/HzhpM0PhGW9Juc/HD
	Cs+HOL67Kdn6ZOmGrMjQ4+IC14QasENVGZWIfR5JUabMO/Na0R97I8StRQpKKjdCgveppOTcemtNH
	jTd8fnsxt16BDlJGEHX88LrPpBz1ZMAGeI4+06GuLJU1rbfBbisXIhrlYqB9gvNr0aBpy+OYiT0kR
	kywUIWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdY7-00000004AOG-0GCz;
	Mon, 08 Jun 2026 17:14:07 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdY4-00000004ANO-3JyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:14:05 +0000
Received: by mail-vs1-xe44.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so1408953137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 10:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780938843; cv=none;
        d=google.com; s=arc-20240605;
        b=YsqsF8r7yBTi9HktNw8oXHVqqWl7LN56nAdXvSGLqVHpSPwy3J2miue1mnZgVPYL9g
         yEeGV9JQTrDJCl82rWGxAVBYAd4p0ucPjSDsUOE0I/BlA53F98luD+bgqqQwl7yzH6bE
         yiUZTDGvzN/PyPW54+rLrGUcCNnURTQeoNU4Z4sLHXupg5XTM+DzsQPxluirAKCAEqFp
         m26yL6tdl3dcbzGE7kcVAYcc2k/k6oE1oA225WTN3T7NmuIJSKQZIHvcH+CxdJyuqbF6
         vepfXEWDK0KsingSk9zmX9V1mqbNEBmS7anVtrdk/M7MIdpCOzA/xoa8DmuGjYBvnJxs
         hxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXY2HhbPtnWWjy9ZRBg6fDZvGucC9w5Mnr26sUiKheY=;
        fh=1rk8Zx5YTMhNGEpO/j32o6/jJj6+e/rUHXxcrgTovcA=;
        b=USuakDIvkzJ2zI3I1wI7bdquS1mlFThnfIFm7i5tHECi9QRdKqJDRjki8QiIX1i7cI
         sWuFAFeqVpDEizrUDSaD3Y5ipq0H0aL+sjfnuixp4oVFakCgoasIVk1hAh0kCpXJFg01
         q7Jq6vZd7B4jcqIJTLUDmAXKhfPFvXxNrpumH9CMW4r6T4dOMg5cwO4Aevw1XujCTTl4
         XNVhrRcy6CndwmbMCbZ7YJ0TzQZB96EXu3EkQ5OVcMhj7yLxW/17zgrPpRdIainQ6pyS
         mAS+nskLnZYnMem8fL3hF0cicgM25AKzgWtIXBH1OzpHgGI2VyrN9wfyKNL1XpDC2IZm
         ljew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780938843; x=1781543643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXY2HhbPtnWWjy9ZRBg6fDZvGucC9w5Mnr26sUiKheY=;
        b=kwpu/noxTpit4z9lZ9bg6t8Mf5ljK6pkBNN8M22rRZJ3nHthj50LALYDWsXFT/ejs4
         LOA2BBB+jHOCKPC3vNPyhokZMCRaGIZTFryXWQx+zm7g8jwyEmT8yRq5hLNzan4ioxvg
         HpIxd3pPFJOn/EzxFnh9QLDKyhH5F1TRXf2ec3OleF0nbymCLpRRq6byP2+5+m9HkRAq
         qiIg8F0awMYlj6O6y0Bt8NMedp/78aoyBMrbItKTtdVaeriW3Gn6WieG3/8JnW9nvuFv
         UEINtj/JhVMkbevLtnArcMw2YYRs4lYLDEemSSEp0VLsRPxLUB9jyzE79xIHUj1Kq5uS
         kfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938843; x=1781543643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXY2HhbPtnWWjy9ZRBg6fDZvGucC9w5Mnr26sUiKheY=;
        b=FFQ+N4HdGVus/thallteN0EBZYSGd8dxniv36kW4hx/pSISvfMdIQw4XoPnPUWUeti
         XAucwPHoNnqtyg2478n/iUA6NYeHb8TsflHXKIlWzfMs2du7g475uOyveaq4+mGF+7hU
         2a47bqUWzAi9AEFujXeMsmkpNu1cQg/jtne22ol3vhqBn6PgdyjZV+jwV3d4E8cB8U6v
         EArSsyZ5h4e08PgpQUTdwkPoh5nJo+JU1rdiVTO2OpaOW1YrfbCUaO3nYfR1B8KHNnhX
         plZFPE5NaCT2qnV61cjFBbVnlcmGlobLzNlUNRhX2qVX6xxRo+mq1ieh+CdEaoQyqa7O
         M3Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9xpyTx+ZIOqOH0gj9Rg7Eohp1dCLDngKIzMiu2X2LE9g1QbQ+sZfWmSImNwqs8YR0aWL9yv2I3XazYIFbDP5XO@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXngPhfeWrXRaPNTt9s03x+S9xjWv52gXSKKc92Qku9MVFmkQ
	WFqQvKSlcoGGdtXqvAvb9K/mdWmaG468HN0EMwUgygk7wHG4Fq6OIdLfWu4c2iF3aWo1kMuTMgn
	eqF0qOL7UBfO7Z9JQJyUSCCiqwQOM9xo=
X-Gm-Gg: Acq92OGk0IAu8KUvZ7jApTtEtxCX1F+himVBquVh20WiliJ7D1NncMNNzDr6YTv0vPq
	g7ZOzOdF3kMZG9D6UkM3i9KrATN8RAZ9BQvIqjxs6pBTbcLcq3BP4LvrywCIf115hOs8cBovPTb
	pBe418bp7VSm1Omy3QLOjICBJANmtseL0D1Qr5p0XxAY1VGqqrdgFuHx3iaX6C4/xCmnRPtQD0O
	SypqIB8cFlqy8OIOLIkjlZaB+VpxXhW4h+PZcrk3zIGG762Dr+wolo1/lVoVircy8oOv1Afiqfj
	ceHaYS11qfn5jGsgVOKQeD1kmj8d4QEawbC21rO9FsKLz8N1mvhvrqmo8/oaqC/189iU/ujJerA
	IKb0=
X-Received: by 2002:a05:6102:8028:b0:659:3ae:e6d1 with SMTP id
 ada2fe7eead31-6fef194813cmr8586356137.9.1780938843197; Mon, 08 Jun 2026
 10:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260510052107.555825-1-enelsonmoore@gmail.com>
 <aibz3auoiq4CFa9l@google.com> <86765df4-0d2d-435e-85d8-b9bd4f3ea85d@app.fastmail.com>
In-Reply-To: <86765df4-0d2d-435e-85d8-b9bd4f3ea85d@app.fastmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 8 Jun 2026 10:13:50 -0700
X-Gm-Features: AVVi8CcQLZdfGK7GkL8AIz2ceIWRoj45ZqGYOIPBttfj7m0Xg4lz5ZY8Y9K80rk
Message-ID: <CADkSEUhh1NdOMTHVsErhqzyCpDGFA-FkNFaWp94e9LnB3njxqw@mail.gmail.com>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-serial@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_101404_838252_2C77DF22 
X-CRM114-Status: GOOD (  10.77  )
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

Hi, Arnd,

On Mon, Jun 8, 2026 at 10:11=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> I think this is correct, as footbridge is the only one that selects
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO and defines I8042_KBD_IRQ on arm.

I came to the same conclusion.

Ethan

