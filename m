Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C189DD2D8C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEzaVGzmOlwTp8TWch0rAvCSubtbmBjxCsLlT6mn2+0=; b=AqNU/R7xF2it3SJFBtQsVpokBt
	CaLyUDeljSQIMOBC8SJG1VTFfPn3T8dhg+IDjW71Sa6J4K3pGpRvAX5XIM16JMA+g2LjGMuwYvVjx
	i7Ql9VlRjPykadTDszW3FzlUtNlB4ANboypBcczpcFtB4nxNBwUC0c2P3QuW1gUUrLd5ThCTOYa+K
	sa0rRkn5T7l9fE3R08i3q3cU1tW+o3Egxk12mxEBGZ7KFJ6k+uOT9sZa9kzX0t8RovnOwPnyY7nu3
	4BKrm7mfZBo01hVIpvz9hlFL883Y0dEqLIuUoHZbYRf2/0hBkwfQPTSLggmboeFMQsEusuluTGIYw
	c6qABIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfaj-0000000Dyap-0FmH;
	Tue, 27 Jan 2026 09:42:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfah-0000000DyZz-1p1s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A03B76012B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A09C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506950;
	bh=iEzaVGzmOlwTp8TWch0rAvCSubtbmBjxCsLlT6mn2+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Frfuds7DWSBNrGkD5O4CtIJi05+cnwgq/JUihQJX/m8Nozz6VRf/wbbN4/4MUxjOF
	 JwBIE6No2i5Y3QacilMnVKteX8MihHl3UkRJgteDDV60uYnMfvcS7Gv3C4aOLC2XtW
	 Ep65A8z4Y/3qrlW93fnviuwfI1IMKGSsK7tLKodcrFsKraAf1dhoiDwmAHJeolPik/
	 jtBof3OagfKOFfXLcPVRgwWVh1nFgBZygVooTduqPQtk8R2YRfyMyxTZxVkR/DUpAr
	 xojQ3MBHhfFu5kCgfQYTfZ+Vdvaizgzm1ccIelB4K93ODDUBVw7zHfMmrF+I+HiWvY
	 jJJai7qlwdaqg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6495d592c45so4096110d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:42:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXB5ixTea/dfwVqxJk+hwUqru30kDA+k0fo1j1jP5F7aFEfdYtlk61Xurch0ADJPTCE4YOLy+n6FX4AyoZf8ksU@lists.infradead.org
X-Gm-Message-State: AOJu0YzyUsMkIxzFKT4MfzpzURdf8UGtY23C9jvzZzJchp53E5CJHVYj
	3FCaGUN8fWaAw0yslyxKufYpWzKCP4H/WBxcR5FQkKkulgg0tKqv2cyNGJzAudsLVKwNq5yV48Y
	LGA7frqiw7g9A+8UdH1JLOSBdmFDHFVA=
X-Received: by 2002:a05:690e:1882:b0:649:6b00:7274 with SMTP id
 956f58d0204a3-6498fc943d8mr589929d50.81.1769506949581; Tue, 27 Jan 2026
 01:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20260123113708.416727-1-bigeasy@linutronix.de> <20260123113708.416727-9-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-9-bigeasy@linutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:42:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBc8WRA0Mh21BDnfAw+8+J-hrzZ6=AzJ48H2Ls0KaXqw@mail.gmail.com>
X-Gm-Features: AZwV_Qjt95n8nm-M_W3ook7H-ev-YocCp6cwUWsCLk9XYockUegysYTnA3358YA
Message-ID: <CAD++jLkBc8WRA0Mh21BDnfAw+8+J-hrzZ6=AzJ48H2Ls0KaXqw@mail.gmail.com>
Subject: Re: [PATCH 08/21] ARM: versatile: Remove IRQF_ONESHOT
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
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

On Fri, Jan 23, 2026 at 12:37=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
>
> Revert adding IRQF_ONESHOT to irqflags.
>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

