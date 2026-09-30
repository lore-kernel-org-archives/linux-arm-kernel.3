Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avRL8muPwPcnKdiovtoiteXyU541AvWBfwtADejjfCQ=; b=wZnhLTin6ApXn+
	wGcPFJPs6bkirrOs4r5msIObHbtCMLCvniwIuAYaw1MWprDW5TytHHjglMT9ua+D/8yRinjPA3x0O
	U4GuzkMhxCtaqNgrt/Do1CyrEGjdyHkQeACBRgUFTjGdkH75jZ3sTszNXZhvLOWpagI9dSQtSp+ZU
	pdOfd5Z4CCbH6Rn7N/eodgEj5+JEk87r2T2zVM+UW1YdCJ8OTOZ03DfN4VM/HS0IH4ug8PT1lwfIT
	SxDnBb21L9eOTaFc/2qjGgBUtS6pGcErZWmnx5Klxosfnwl/NrUZ+h7Y/jzaFCyzpGnSjJImJEDRo
	RQbLxm+4CzJthfs1R8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1km-00000007FEg-4BYx;
	Wed, 30 Sep 2026 21:22:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1kl-00000007FES-2RkB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:22:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 195CF43E48
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F4E1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803334;
	bh=avRL8muPwPcnKdiovtoiteXyU541AvWBfwtADejjfCQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lVGLNdd+b5Kr6s9mbR1iacX0iWpM528nSsKpynudQJHfM8DIWv2C+smngas7pjonG
	 8NdORv9MtE8kV+f9svJ7rUtL44v+HVohXyO34CuQd6LGqtoEvGmMPAcSqUbyCTgnCy
	 f47bmV0g+/PYuog8mOF2GZ3lY/c6O+cNbt6t/PPUy4ssXpS4m2VXhEL07Ze019eyxP
	 EBGgD4vjw4+A7LOYVWd2ZoRUfkY/aRnF8OKeun+W3rpy58hYi+N8BWETUfWi6WM4x5
	 I0cXNgHu4A4sGx4wG0v21vxsSpH0Pd5X2Emak1DSnLUw79ELe7KnfnQU+xo2100rPO
	 44J/q/GFlrxhg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso5173311e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:22:14 -0700 (PDT)
X-Gm-Message-State: AFq9FYICc62WaUnVy7J+z4CArXkr9hifWpn1VKhcfUezm+OPFFm4jkUM
	qfvk8TYNlUlvnKNrX5l5hLKCaxnmVsPedC32a+gvXBvOHbTUOvRyQPlfpzj5rAv2V8ejW8LF6TF
	XwsqLJQp6q6DOUOsr5htHl21GDWM95J4=
X-Received: by 2002:ac2:4288:0:b0:5b8:f1d8:7ce4 with SMTP id
 2adb3069b0e04-5ba405e1ac8mr876871e87.12.1790803333659; Wed, 30 Sep 2026
 14:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-18-will@kernel.org>
In-Reply-To: <20260918161407.2300-18-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:22:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0BqTSj2xwvYuL_GFp7S3VxZoHpwNR1-vT11mhwKnmhg@mail.gmail.com>
X-Gm-Features: AclHuK-CNJaY6-3qfpXmoVmqu6T0qCnAPQ3R77dU3kQboZXPH_Uf0-1tyE8bREY
Message-ID: <CAD++jLm0BqTSj2xwvYuL_GFp7S3VxZoHpwNR1-vT11mhwKnmhg@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] arm64: entry: Use SPSel to switch to overflow stack
To: Will Deacon <will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> When detecting a stack overflow on exception entry from EL1, use SPSel
> to switch to the overflow stack without corrupting any GPRs. Not only is
> this simpler than the previous logic, but it also opens the door to
> more complicated overflow checks (for example, based on per-task stack
> sizes or stacks which are not aligned to a specific page order) as well
> as the possibility of returning from a stack fault if we were able to
> resolve it.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I really like what I see here. The change up to this point
stands alone as a serious stability improvement because you are
not deleting code that made me feel very icky when I was reading
it. Before this patch it was pretty much an
"overflow and crash gracefully" stack, not an overflow stack.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

