Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4280C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssP/vx2xvZFVkpWUGpEHUbU2ssgcSty0tchErGpJGIY=; b=jCiwQku0VdBtgrUZPmjviUgf+L
	Bp4rC86put9kvrr77uPPiBRb2baShUmIJa/xnZ5aEagYv7995rwbDywqgY7wdl+9SlFcfp/NI8S5B
	3cH2HPFofbXl2KoI+vGRiRD7RHyK/lJlzSyPrImjCLuXxAA5IGLzzJ4gdrzCY7ptrMZmYJnQkaUdC
	OV1foa6vqswBb7ZqkLWWDlBn2Na0oytjddyJcGOmihAkL0BTlcHdgrCNvRi6G/d6eGFm9L2yZHce6
	Sf1d0BiToqAgQSpPzIu2MJrNZJeUK8/svH8lHXljbYiXK/flqay6km1PGIRkY1gK1383UH57efufT
	fsW+wAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnd1V-00000000Q9Y-3tr0;
	Sat, 25 Jul 2026 14:06:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnd1V-00000000Q9S-0myA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 14:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31207600E1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 14:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB591F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988398;
	bh=ssP/vx2xvZFVkpWUGpEHUbU2ssgcSty0tchErGpJGIY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=opPXCvuEe8n3PPU7M5ujJZqB3rWQBT0RU4WQlsETK0tRQHs33oDIN6jn6wQT7O3T7
	 Z5H9hYbLDjmqf/m7XQ+/0SyxTk6y58P9hkJf1EGhKCJL9Qym2K83B+CXayO1MRo9Il
	 yfnvle/hPdRoHm3+J3abaORHTu7X6SFEElZMyCLvddn24xsZMadinGc8QlSF+XoK/0
	 uYirOsJuF68uhWVAJtb9vCYGkn+nXnFWFcQwTryaOAAcZRHOKPSZF8uRI8IjaeRi9U
	 +jSSheJTq1J7WPkby85QC3EEzGx8Gh06C1Iua+RRCdwA+nig7Mkyl2vWi5oaY9FWk0
	 4hNREfU5/WzfA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so917890e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 07:06:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpjRVjtQ+J6w0tp8Ni4J1yXHUC/cTbEy6R25J28Yw1thpDrZN1/uhlAz44Nf3W0okV6gPB68nRuGxgrS6LBquGA@lists.infradead.org
X-Gm-Message-State: AOJu0YwPery0O5HTm2NYGM7Yy6QE4MONZGBzJyzxvl+PS29oQU0LEo3V
	zej84Gmbm/k9KYVRsbK832+nT4x3uNKfRmjmijXIA/iDzbl1Q6WggykxX1jeS3pfAiEPizLm0Z/
	QMACOliT/U814XfFOypBR1hucmElfeYQ=
X-Received: by 2002:a05:6512:3d07:b0:5b0:1108:c575 with SMTP id
 2adb3069b0e04-5b2c1afb4c9mr313282e87.7.1784988397379; Sat, 25 Jul 2026
 07:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAD++jLn_DDvWAudHC2Qtz9kaaonuC0YGTXn9nvPtZfGLbtUsOA@mail.gmail.com>
 <20260725020926.11440-1-xieyuanbin1@huawei.com>
In-Reply-To: <20260725020926.11440-1-xieyuanbin1@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:06:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHow_nx+kJ6Q8JjX0qPgR8jwwLi_a8xHzgc9gQHbcNzg@mail.gmail.com>
X-Gm-Features: AUfX_mzSvjKHLHaKmkayyxfaSojjziIW6z21biYafMhxP1NfGfMVkYwI0HZIC1c
Message-ID: <CAD++jLnHow_nx+kJ6Q8JjX0qPgR8jwwLi_a8xHzgc9gQHbcNzg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: mm: acquire mmap write lock around show_pte() for
 user faults
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, akpm@linux-foundation.org, david@kernel.org, 
	liam@infradead.org, liaohua4@huawei.com, lilinjie8@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org, 
	sunnanyong@huawei.com, surenb@google.com, vbabka@kernel.org, will@kernel.org, 
	xiqi2@huawei.com
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

On Sat, Jul 25, 2026 at 4:10=E2=80=AFAM Xie Yuanbin <xieyuanbin1@huawei.com=
> wrote:
> On Sat, 25 Jul 2026 00:05:58 +0200, Linus Walleij wrote:
> > On Thu, 16 Jul 2026 09:40:22 +0800, Xie Yuanbin <xieyuanbin1@huawei.com=
> wrote:

> >> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >> Fixes: 6d021b724481 ("ARM: dump pgd, pmd and pte states on unhandled d=
ata abort faults")
> >> Depends-on: <20260629123349.134224-1-xieyuanbin1@huawei.com>
> >> Depends-on: 59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_=
user_fault()")
> >
> > This looks a bit odd. I don't get the first fix tag, drop it.
>
> The first fix tag can be open as:
> Link: https://github.com/torvalds/linux/commit/1da177e4c3f41524e886b7f1b8=
a0c1fc7321cac2
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/co=
mmit/?id=3D1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> It seems that a 12-character hash is no longer sufficient to index it. :)
>
> May I increase the number of hash characters or just drop it?

You still don't explain why you add this odd Fixes tag, which is
why I ask.

If your point is that this bug goes back before the start of git, then
just write that in the commit message, no-one will backport it
to 2.6.x.

> These tags are for the maintainers of the stable/LTS branches. Since
> the bug is very old (we discovered it in linux-5.10), they are likely to
> be backported to the LTS versions. However, the depends-on commits may
> not be merged to the LTS versions.

They will figure it out anyway, both Greg and Sasha are very clever
people with very clever scripts.

Yours,
Linus Walleij

