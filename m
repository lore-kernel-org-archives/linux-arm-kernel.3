Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECBCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpVPKqIMRjG1jIEoidUQhmTjxrFW4mTmhNofpOPcJ/Q=; b=vIZZXO7M2OBN9Q0aOl/eY7G3yc
	Xqz7WeEmVUP1ye7ORBHtTtgu2xD+v7YmbjRzRw6dRGXHi6lRBQjmzi26b2AHBLWHikcX8kdtmV381
	OQp3rNXlTGii15wUPojwwoCYEqiYH+DL+LudZXcGGuSkTe9xfgI78tBAgOAnEyXqibuciOWSWxMQw
	XI+uurqPN1F2grC+AcaCKdrIXyY6G0s7svQ96t7lGgZPM6ONuU9mTRXacUBuXTCyOIhafubZB1sdN
	Z/s+IU1OUkQ2HE6HhvgRarjs30LWsH7r3HyZtSFpdy4cMwegTcPaJi0XEx9NXyOIZ99/6cNMdBAmt
	51Uk1BKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFmO-00000004bMm-2vNZ;
	Sat, 16 Aug 2025 12:13:00 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFia-00000004b8L-0645
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:09:05 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4716fb73c7so2457368a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755346143; x=1755950943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpVPKqIMRjG1jIEoidUQhmTjxrFW4mTmhNofpOPcJ/Q=;
        b=ey0hUDVklzLYJHwagnxqMV0KOq056XH9xugWcGMd5HguJAL4qd+LfqoXT+gGhaVF+u
         Boq8oVErbMmnobFX3PKhNEaP88wE/Px+fWqLycgXAKK90Nvt9QQSlZBqq3n8zvP5Vyu9
         AF7J4F3lnhdmr4wsikz6ZmLbEKfGtpeT/86826vvcgOxQpY3zbPlbByHpwqIPJ2rXt0k
         jKKl/vpJbiiegSx1oW6XyPAX2LwGC0aGiRi/UCLQqf5ZM4ksiHhhlH2Usl8NIb3zdLU8
         5NngIcGxAvcK9Ou4n7Cc4D5LEIGb6Y8YBhSSVk03fRvG/FTwe7lAPu4Ku28eqcfoVtaG
         WQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755346143; x=1755950943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpVPKqIMRjG1jIEoidUQhmTjxrFW4mTmhNofpOPcJ/Q=;
        b=Vi7PGFb7dBiN+4Mqzrw2MTcvwIk2JUTLy6KFbv0mvlYK+uZhNUWQGaAJtMV80uf/bV
         k5JHtfGlu3MUaS1LnudlPk0VdXBe7SoS9qRSj0W852iwYEob7/40j077VPRUBaWsvsy6
         zYFRK+JbYFL8ZjD0fl/deHsBUZ0lJm1GAtvCwaUVJFKlchy4aLjtPRrrjH+sVmaVl1DP
         R40hXenILwHq+RCtJDhBb33ekdEPCZG7yovmWBfLbpQYecEBAAW8hZri6GIlelMtnSqz
         VMj++drPqubqlz88BxWe7q9AU0xcTff4dlQac73M31PM/3+KiT4I7p28tAAtAXFHIiby
         7Gig==
X-Forwarded-Encrypted: i=1; AJvYcCXJykntM5HTfZdeyLQ/ziwb2gqtPihUpf6URbCjluATpt9l7MfkEnkQD7NJoURqwVxjCeaEkr8fv2EmLP2sd6Wg@lists.infradead.org
X-Gm-Message-State: AOJu0YxgaJKaDiPoEYf4GVA5nmC4jpW0BvpZKHZzYRjluzWkylqYQYko
	g3StyBBu/beOxpLQSAFap9LhhjPGNivVjENOdpx9nDSy4KaXroDSddESQrBQGeqUEQI+aZeKqIG
	5oIUKOP3hHfHRiIJ2750+8GnYwuDrgHw=
X-Gm-Gg: ASbGncuylx/IIugvRWPA4b4wOQt2ZPonNXkzwQEmoJvX+G3e0PjIoWlYTUJ6FAOULM1
	05HleD+ZsEkdZfgXHbWMVdJ7q6vVwmwujQrTbJo1i+SsveN8OaIfC+3NcAVbsiF7+EmAbKytJ4u
	NDz3MV7PjlBALtk+o/Q71W/4bLEIrMQRxKGv0LTKvUl/TAjw/kQJ3E/JgYnHHKjWUY+QBMWKyec
	6I7lM0=
X-Google-Smtp-Source: AGHT+IFp3igzfT7b1x3uF1SAPKkko31LrckBVY3utWnFQOzj4rT/By0igPlF7ebUUtoB7GfI+bWiHnizZ34PAMUOVsA=
X-Received: by 2002:a17:90a:d885:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-32341ef042emr7422913a91.23.1755346143115; Sat, 16 Aug 2025
 05:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250729174332.3acd1a86@gandalf.local.home> <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
In-Reply-To: <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 16 Aug 2025 14:08:51 +0200
X-Gm-Features: Ac12FXzUD_KlGTJO48C4AJyU8X77ErffxNXRapw8zgoVTkT6cKIJJkmQhQZdRig
Message-ID: <CAFLxGvxxXPnF2BjoHycORATma_JUbMFET+z6YGD=YJgzESBO6w@mail.gmail.com>
Subject: Re: [GIT PULL] runtime verification: Updates for 6.17
To: Steven Rostedt <rostedt@goodmis.org>, Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	John Kacur <jkacur@redhat.com>, Tomas Glozar <tglozar@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_050904_062954_65D93C06 
X-CRM114-Status: GOOD (  18.32  )
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

[Re-sending with Russel's correct mail address]

On Sat, Aug 16, 2025 at 2:04=E2=80=AFPM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> [Adding ARM folks]
>
> On Tue, Jul 29, 2025 at 11:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.=
org> wrote:
> > Linus,
> >
> > Runtime verification changes for 6.17
>
> [...]
>
> > - Add a vpanic() to allow for va_list to be passed to panic.
>
> This change is causing a regression on ARM32.
> panic() no longer shows a proper stack trace.
>
> With this change:
> [    2.943690] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    2.950101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.17.0-rc1 #176 NONE
> [    2.950509] Hardware name: Generic DT based system
> [    2.950865] Call trace:
> [    2.951722]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.953111]  show_stack from dump_stack_lvl+0x54/0x68
> [    2.953312]  dump_stack_lvl from vpanic+0xf8/0x388
> [    2.953526]  vpanic from __do_trace_suspend_resume+0x0/0x50
>
> With commit  3f045de7f5 "panic: Add vpanic()" reverted:
> [    2.680077] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    2.690241] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.17.0-rc1-dirty #177 NONE
> [    2.690832] Hardware name: Generic DT based system
> [    2.691339] Call trace:
> [    2.692530]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.694283]  show_stack from dump_stack_lvl+0x54/0x68
> [    2.694536]  dump_stack_lvl from panic+0x110/0x31c
> [    2.694944]  panic from mount_root_generic+0x1fc/0x2ac
> [    2.695399]  mount_root_generic from prepare_namespace+0x200/0x258
> [    2.695723]  prepare_namespace from kernel_init+0x20/0x140
> [    2.695974]  kernel_init from ret_from_fork+0x14/0x28
>
> The change itself looks fine, so I suspect it uncovers a deeper
> problem with panic().
> Maybe it changes the stack layout enough such that dump_stack() on
> ARM32 is no longer
> able to walk it? I'm using gcc 15.1.1, if this matters.
>
> To reproduce the issue using qemu, build a multi_v7_defconfig zImage and =
run:
> qemu-system-arm -m 512 -M virt -kernel arch/arm/boot/zImage
> -no-reboot -nographic -append "console=3DttyAMA0 panic=3D1"
> It will fail to mount a rootfs and panic.
>
> --
> Thanks,
> //richard



--=20
Thanks,
//richard

