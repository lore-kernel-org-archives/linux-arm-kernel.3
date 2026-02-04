Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD33E95363
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kaiQtP/iaWho6NnkIdhYXZgDPHMlV5rsICgI0eXVi4=; b=tcrF+tYcWV1ZtKDOoW/D5O067Z
	Bx6H540SiSBND2jey8HM49t6s67cJTnojoAbrr0iclFUn3aZKfyYqNE8+jEWYGNg7PaLPheUtqP3Y
	5W2/N/GlIqMWdfuZZ3WwelA4tSVGz/7GP9b7mhcG3dHvW+jcL2K6uMzXZNI3l2+7HLgEb+Anx0U5Z
	xDUYnFnN7VKzt7eL9lUdZImVsnEaf43AnsprdkCxW6gEqYN92hvvJaJkDhrqiy6ufXXjjN9hbrdiU
	l3OA1SWRt0pLMnjeXue956V0WFRKncp/0E/jwXjRYuAw/TPyhnC69s2ddo0UeB5YYZ4aj2He0LB/j
	oXtWp90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZVy-00000008FIy-1HLX;
	Wed, 04 Feb 2026 09:49:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZVw-00000008FIX-2Q1N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D06FD43E7B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 09:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A817CC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770198575;
	bh=8kaiQtP/iaWho6NnkIdhYXZgDPHMlV5rsICgI0eXVi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CEOv8LEP6iFoIiFYU7Te67Yq9Z9T0PmK+QjAfso/Byzt1CNFXwpbdziWfY6v+7yT2
	 t5GGCw4sgS5YQxTZsncsvMManz2fh8WOglZ3Zdh5LffdXwKrBDJgXpi3w3G+BXJ339
	 d4lbnVl7AsdGO5ahX7WEGL9UTQvfpNnTcDoPr5gY4/oIDq7lMow25ZiK81eDwkvvXh
	 aqmXEQv1UPZ4fqNO+9hLhB4u30SF7FwB6QX/UJt5sYBfstcPpovZyp5MRcC5rPD10C
	 zAhc2OWdYfwGpPBO0DGami8JGwMz2I6eDe0i4+JKDMrBwx1C2tmWWZ78BqiBujH+tm
	 duOjaIlREyuAg==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649e456e7a8so26703d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 01:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRJEdsWCWbpYnH6DMv6cN8qv7PHpD4F/zYyv+qCOQmpXfiSEJojete+oWlXMNJ12SanJEpYMqtLR5kIl1ZN7be@lists.infradead.org
X-Gm-Message-State: AOJu0YyQRSpUs3Zkvj842WqW3Eyoza8DSWg1HPTXUuwA7uDs3/hPnLns
	s9z+O1Tk87nDybOs/fFtroOldrdSgMUT7y3nWyUS+2rvofEDT7df43hf92LNetLMLnbqoFScvOV
	pGWMzqy5/9IkVvhQK3WF4D4gpWKaBRc0=
X-Received: by 2002:a05:690e:4189:b0:644:45a9:c0d7 with SMTP id
 956f58d0204a3-649db491366mr2305878d50.55.1770198574951; Wed, 04 Feb 2026
 01:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20240121203009.9257-1-ansuelsmth@gmail.com> <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com> <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org> <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <86pl6kamjk.wl-maz@kernel.org>
In-Reply-To: <86pl6kamjk.wl-maz@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 10:49:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkfcVSeKf9eNzXpe2AUD-7Gaw47gxHwqZtLuomWed1u8Q@mail.gmail.com>
X-Gm-Features: AZwV_QihE7lWtltnGDpeXGtkMcDHc73t89AvxRNxkQxHCcPQ2JtXzrtpuqeipMs
Message-ID: <CAD++jLkfcVSeKf9eNzXpe2AUD-7Gaw47gxHwqZtLuomWed1u8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: Marc Zyngier <maz@kernel.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_014936_654282_ADCD3E38 
X-CRM114-Status: GOOD (  15.99  )
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

On Wed, Feb 4, 2026 at 10:24=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:

> > Another reason would be that appended DTB is in the same
> > league as the GPIO sysfs despite we GPIO maintainers hate it:
> > a feature users highly desire because it's easy and convenient
> > and practical and quick and thus refuse to let us drop. Every time
> > we try to deprecate it more we get a good beating.
>
> I don't think appended DTB is ABI. The GPIO sysfs definitely is.

The reason the GPIO sysfs is demanded is not so much because
of ABI, like if applications are using it.

It's more about developers wanting to play with their systems
interactively to figure things out or do makerspace projects
using GPIO.

Likewise I think appended DTB is appealing to developers because...
"it boots, ship it". ;)

Yours,
Linus Walleij

