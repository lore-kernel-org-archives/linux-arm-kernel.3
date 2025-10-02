Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1EACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 06:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oVxpHfJcCOWZT9AX4TZoRu0JCM6j/v7Akf+l5+CCgo=; b=Ivcfd9eNsgHPPkqez+xJZgXI7X
	a4nanrrqMAHqNz02ka19rDtvTaLZBZ4O5FeGogaCDIjbqrm0ZdbSy2pQ4FUIUQZrnIyucOTZ43cZx
	RfP4kpCvrZfeMp2ePtqqtnACmzAJTJxD0LyiWz9eTlLzUhzXRgCOFKGQYevQFnnmrM5xk2MIejjRS
	VL2w/Mix1Ribt9ybfaabtuK6vDZ691n249FZsfHP443wQ7fwMyTkwCWbD+tQuPF7gFQqjKPasWmw/
	Cw+mtyc25O55cH2XFvtcw+uleo1yk9m21UFKWSHI8RdDmb+azbmyRcnhz07jmgufpIyHPPuk4MJfF
	xUi7d3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CmW-00000009jBH-1EJ1;
	Thu, 02 Oct 2025 06:27:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CmT-00000009jAf-06Yi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 06:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A88E449FD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 06:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED060C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759386427;
	bh=1DhX8G4AmQCOmJ1vB9My4LM0gaN6w+0SUeKJUVPDlBI=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=MFeV6LPB7S6quC+osEFMIz0yFRZ/gPYadWDyGeegSIBhqa/mcJJSI1sh8lnLrMWh4
	 uZi9WwqTqeDPQ2dJSyaMO43bul85r3waBDp/scEcHIVwCHy1a+fUFUwE0DUjOlbA7J
	 71NfBh8duSA1duLGG6AaWPLArcZz1TdK1ESKL60i59hNVZzygShCM75J/6uhiJy+qt
	 a/l/8HVo9sBHodLeS77/LLMxTa5cww4k2BB7BerGIPeLVTjOenZ7ggQvgybzdOQDRk
	 +oArasp3JtUxEMthqLhenn7YnApOsS0XNiU7XJcywL01Mtei8FWeys4cVBFrhAAOzk
	 zFbd/3heYZ8GQ==
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b57de3f63c8so451295a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 23:27:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGLJKXUfYxbo5pC5QF18XDKUq4i3mhaj9qWVbQpD9rcUowuGmts8Pk9fOwWH9wC/6Nzhi2ugXqOWVoS8ncurlq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/8xzxnjDPjR2NLzBxflWGQ6v11rBjPN73XcPlLCux+tOz+jDO
	iYkTY+c7HtmPmspGj2S828+GjIdVIg7dhVu7aDC1BQ8MLu1SfGnQP7WYEVQAUuDAddYJs5z5D/a
	yoMD/mWmbeKT13yczZE4PvQXr0LF58Rc=
X-Google-Smtp-Source: AGHT+IEBLYk86/uoWVqVDFVxsuuHAaYCqIcSDwfTNMYhCdYZvniopfSVQCUKi57uRCuIhyPS1zqvLHtO1RgzJgA/suw=
X-Received: by 2002:a17:903:46ce:b0:266:2e6b:f592 with SMTP id
 d9443c01a7336-28e7f2a3c2cmr78644685ad.25.1759386426550; Wed, 01 Oct 2025
 23:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
 <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com> <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
 <CAGE=qrpygJ4XgtzdnGACj-6KRiD8r57F4ogNYaA3LLMusBV9fg@mail.gmail.com>
In-Reply-To: <CAGE=qrpygJ4XgtzdnGACj-6KRiD8r57F4ogNYaA3LLMusBV9fg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Oct 2025 15:26:54 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcRw3teqahDc6RBCz8XvqLt2sHqxrOUxpA84RszcsnGFQ@mail.gmail.com>
X-Gm-Features: AS18NWCWo6vnwjd-C2QP8ttuauCGBObIKlzBdGNND_qylV7g0Yxxc3FjzsZeoAs
Message-ID: <CAJKOXPcRw3teqahDc6RBCz8XvqLt2sHqxrOUxpA84RszcsnGFQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_232709_105147_8AE3CEC1 
X-CRM114-Status: GOOD (  15.70  )
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

On Thu, 2 Oct 2025 at 15:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
>
> ---------- Forwarded message ---------
> From: Linus Torvalds <torvalds@linux-foundation.org>
> Date: Thu, 2 Oct 2025, 13:44
> Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
> To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>, <soc@lists.linux.dev>
>
>
> On Wed, 1 Oct 2025 at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18
>
> Bah. I've merged this, but this causes build failures on arm64.
>
> I only noticed after already having pushed it out.
>
> > SeonGu Kang (1):
> >       arm64: dts: axis: Add ARTPEC-8 Grizzly dts support


I'm sorry, I should not have trusted contributors from Samsung that
they know what they are doing and I think my CI misses allyesconfig on
particular branches, because for-next branch did enable this symbol
and it was tested by my CI. Also LKP tests each of my branches and
didn't report this, I think.

Issue will be fixed with commit coming via clk tree - Stephen Boyd:
https://lore.kernel.org/linux-samsung-soc/20250825114436.46882-2-ravi.patel@samsung.com/
And git pull:
https://lore.kernel.org/all/20250909183504.104261-2-krzysztof.kozlowski@linaro.org/

I understand this won't fix bisectability.

Arnd,
Eventually you can just mark arch-artpec as broken just to fix your branches.

Sorry for the mess, I'll extend my CI to check this in future.

