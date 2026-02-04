Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E03BE8B386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F+zIb/5zD4egLNhzOFMUm4MM0Zjnd7at1gQ+Nt2kw8=; b=ErG8mv1w07Cv2BUXqeROISqSFW
	RGwm5B+xB6TTqn29Nn1t+CBHof/PsluAp/GnYWoFjM38eF6nRSiIbkgjFfvlwaDhZVdHuweXVS1VH
	mD7DSa0+x/nOwMMa1ZwD/UfiGJfjGlejQtUpqjefOojToDRowHZwJGgVXyVvpfvri4KijkK8MApNf
	Xoj13+Hi08xR6gAD2wwdIvel+5qm4L5poonC32uedyXG5ITqaIqsI1BQOuFlV0q5kqvJ2WlAy0dbz
	RS6crGyv1HpmpB0kA8PoCdJpIZ3sDu4zbHSS+aUM0HpDN2prhWofRDvo3gD9+YN2ZT0x4OUFaNCYm
	w92NcCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQgn-00000007cqM-07El;
	Wed, 04 Feb 2026 00:24:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQgj-00000007cq1-1jgF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 00:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 330FB444C4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E9CC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164648;
	bh=2F+zIb/5zD4egLNhzOFMUm4MM0Zjnd7at1gQ+Nt2kw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SW1wf0ypZCnWqc6gJQKBBrBpYOM1WpQ2sQOjsFV2/t5JcPyy3pB4LOhY8pckJZgnl
	 QtpiDsDL8J96hv0ckTQqjDSeJSuHASokrI7GdSSZ1Thtu/eo0d8TyHr6fSBwsiCZj4
	 2g7aIipEjY80vImVqSU2nPr/uH/znDvAh14U5AqYD1aPyV+2ZeWCcpi/Pi6Tt8Y64c
	 SqQZsG/Fw90PBVILopR+2I/7VtqwDWzkgSLd68PMggVOgPdwBbncHJGSvFyy3VKX9k
	 +WuZzjuo+Kfu1GGAC5vGbKK8H0cNxDPNbRqsGI8GW62r8Syr0eby59TZWam3p8z7df
	 82GGPLMlC/UBg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64931bbf70cso5584498d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 16:24:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlYz1s98pb2oLXRUCcbUlrMzBgCytijYLpy9LOzIgF15x4MfFEzo0NcM17WfTfNRz/dTJJAKq/djuooZYBuUPt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/CGTDVorwoU1K4c2hKhu0S1A7rV85HAlkFJ75EC46LNv/C2vo
	ZH8rjNqx7B5Tpw0yZb029OKd9F/4o0yMFgzabyEWIu8ju+nFFe3iVC7gUMo0R34h1eu/FkvICvd
	SqmsM3vI1R5/K7JiK9xQu7nZ0TlSCSe0=
X-Received: by 2002:a05:690c:3502:b0:794:e9a3:b132 with SMTP id
 00721157ae682-794fe630e3dmr27551617b3.4.1770164647352; Tue, 03 Feb 2026
 16:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-2-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 01:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLkH-HpUXhQfgvy9XzQY6NH6Sr0x5CFFEg82_zBz-X-amg@mail.gmail.com>
X-Gm-Features: AZwV_QhqXV-UUuEDRHCcMqOroIMeRyKz2VdLiO4Wc7_Cwhe-J4DhdP8YjQW0qcw
Message-ID: <CAD++jLkH-HpUXhQfgvy9XzQY6NH6Sr0x5CFFEg82_zBz-X-amg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_162409_470565_E59F1C8A 
X-CRM114-Status: GOOD (  11.09  )
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

On Wed, Feb 4, 2026 at 12:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> Consistently use irqd_to_hwirq(d) which is the recommended helper to
> fetch the hardware IRQ number from an irq_data structure. While at it,
> update the brcmstb_gpio_set_imask() function signature to use the proper
> type for the "hwirq" argument rather than "unsigned int".
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

