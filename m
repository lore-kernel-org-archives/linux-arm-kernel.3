Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C2CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQXZRV5uQCW/cxvkOhl67UpYkMhG+bZkayKSVZFupFg=; b=wYlyDc/yWLzOg66DfepBIRqZEC
	HYsJo26d2XrKYyDdnJ4WC5l2PAoRPlRLCipXnzfadoZSzmpk1V7wcnNLUdcGoe5V6JVljdjO00sH7
	aMY7bjbf7TYyKrLK79k9QkAKrfy7Zlq1C1lInHHmhZWPHqrPtA8dcTpjt04CIpljl7tgDK3P2R54+
	xVs/WBxbDtT46nRq2Pzis1S33WdeYIbgcgIKqAJnWXkPfBs8IFzuRMMBgkUIM8yh1lubhXeQS90nz
	Y25pGUHIfdbQ6Raz5K9WGNcvnFaJ4FpSt7nwJC/Q3/wJJpTLnqLeGX7Kj1iGQQm75SCeYWt9LxKuY
	Dg65tAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQfx-00000005TWO-3mvj;
	Thu, 30 Apr 2026 12:39:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQfw-00000005TWH-3t76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:39:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B80060142
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CB5C2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777552767;
	bh=EQXZRV5uQCW/cxvkOhl67UpYkMhG+bZkayKSVZFupFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ueYH73WqtJO+W8HiO6LWz/lqky3SV0MtDJsMB2/2GO5+Jicbz8n/eIy7olUSz0lX9
	 EFe5ZgF3pvFWQa7KPzbaoSC3lKYEYxJxcpFf3eXAAe/Ohci5O4WfqG2nusrmzokYKy
	 rS8cpT0GC3To5LFjAf44tZ9GNqIJcX/pNGhpkP71Gyu8Aqa5C2I1vZLdkT41MLpUNo
	 93wTTtymXdJKq3e0lUAzoqTL7bdH7X00yuqo07m9tbLeaV+9Q50/T6Kb1CERK6ECbK
	 dzULAFiFCm2yPmYuzeQZ3jrIz3r6HU7T1V24k7Df6yUux7KlAkYaXUzi9hpRzgjUrx
	 B9AZ2fhSQIRLQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c500750dso1514938e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oFBFon78E4QLEWriVHSU5X9YaWrozxVUUjk5T+w/8jv/Y9DDtZOkjpFoq5xJ9MTXwpOaAHvGgT0oF4YAvfou8@lists.infradead.org
X-Gm-Message-State: AOJu0YxacVCBPx3NPXuIUFo+N2HR6f26cyMY9l0xhQoHAH19wCjCjEo/
	xkvMl0uIDSDXj9ZyNZAwkUnmHSk66kRkKcOoFCJ06Ak4y4puq0R0/hHYOvgZ+HS6R1O+LNMeiEr
	c0aca2trbZfj0lZvOTl3hY8ZXzHh8468xycesE0S4MQ==
X-Received: by 2002:a05:6512:15a7:b0:5a2:c0d8:e634 with SMTP id
 2adb3069b0e04-5a8522b01bcmr859859e87.8.1777552766405; Thu, 30 Apr 2026
 05:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com> <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
 <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com> <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
In-Reply-To: <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 14:39:14 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf13VEM8=JkF=4N5rGH1xKHu=cLf4cco2zSJ=y8-57JtQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVfXRESNhTxasmm6--038e7o45wDQecb2lREMa864d8loy1maw5o-4PeE
Message-ID: <CAMRc=Mf13VEM8=JkF=4N5rGH1xKHu=cLf4cco2zSJ=y8-57JtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2026 at 1:58=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Thu, Apr 30, 2026, at 09:14, Bartosz Golaszewski wrote:
> > On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
> >
> > Before I address Russell's comment in v2, can you please let me know
> > if pxa will be removed in v7.2?
>
> I'll need some more time. Not sure about the schedule, but I don't
> expect to remove the board files in 7.2 now, sorry.
>

No worries, I just wanted to know if I should even bother with v3.
I'll send it with hopes of getting it queued for v7.2 and being able
to progress with GPIO core changes in v7.3 then.

Bart

