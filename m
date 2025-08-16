Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63404CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98v+GQR37jUZrrhIVoXs1bpSTPReJ+eLN39iwkIPiQ0=; b=IWnKrt7ve0uLgM7flgK3lJFAKO
	2nUNuy6/YUzT9roo6aOaYo3z78C6/L2ixPDTjLv0NZl9zeGeo7oecE4bDkKrVgCXe1A+gMF4m0Tyd
	NuFrKJSbxRp/hOG8bzcqiJFCSj4RbNHBjsPX1QaD+XsuFEZ+hKNG00gQuSuwfm7wx6AuvAdoiEF+f
	rggw4EevnlS46YwiRfiW8iPgSUAeS8gmgFOJeV/+5Gyv6F7SUq+9i0s9+LblPUXJPANI1q2esQVac
	oN9bmzwQ5NxlpNFgAAPGBkhQawMCfxrDemesMdHWnwfs/SXspR6Fs299ppNxadiW+4Rcp97cjup4G
	ZOhAgqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unMaz-000000056RX-0TMn;
	Sat, 16 Aug 2025 19:29:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unMYO-000000056Mr-24zR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 19:27:01 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32326e69f1dso3094329a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755372419; x=1755977219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98v+GQR37jUZrrhIVoXs1bpSTPReJ+eLN39iwkIPiQ0=;
        b=WoCDUmoQADMRIorozluc0w/TWJ8DSDtcfyO2npkV6gfhLH6ddCEWV00ZnV2cm1xAXE
         y7KjkUoKniCpi2ZMyipPYhDFgmDbXqWQTQpBrK20/J2ZblgPnhMeQM2SZhOYfmhawEZb
         pKnA/ZQ77/gZ39sSl8Vi/qu99tWYGBSyZ+9K16pdpZ2sDwlRh0XzPFJ3i1dWYsNjcqHO
         Xm0Eoxt9E+ErDHIg1s1HWw5unWLcNWZaJlb10nCydw3r9RIecp2pzNjjRTVt/KDpm/fQ
         T7hOmLm73OSv6eERIECOIryISO00Uy9wz595YEk2IdjOoIzLw1+zi0Z+S1YxZ01kqCiD
         021g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755372419; x=1755977219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98v+GQR37jUZrrhIVoXs1bpSTPReJ+eLN39iwkIPiQ0=;
        b=jWwNohWVXAYT0WFm3gqoRNkUU6W6Fq3kDsnb3gnYbMsxK5NU6HP1CTtvuQZB0M+pke
         ZRpcYRBA48hQnYnwI/WHnuJHQthkEO58s2sUdkeJa2FZHouu034W1HkE+/j1rdAoI5E0
         NQ2YtfuObuWoojT9vwr8Bc3puPBE/P0DldgM6FyeW2JVjFMr5TN/w7tBl4D4dWdfkAoV
         nPt58ypP9QFe2oH59jo8Y9Dwm3Xa2OLGhEB76bZ/oHwprAcXzHG5d9M6lxIuITByUTtz
         XFYmoGLNuu0zv3hOGHYiGgH8dF+CgsW11/BDO1XoS203QS86mLVUH/2SAN8KUaXOsi8P
         i2tw==
X-Forwarded-Encrypted: i=1; AJvYcCUIpE+nKXj8twiTcAq3/Dsz+fPW+2Ze8GxEhFWiv1XJHgqwTKOv4jesp89tiwLr+t35CLZJYgUeLifeFPoTcnop@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTc7QF02P6WmiNpp+yAxot+skvcKdJqszG+bxIgeLr678hkM+
	SV3v42UiiAyJVVZiYvmOc1FWyS727hOd5ntQ/U1iZeDH24p0aCZBhtVSY+ncCn5WiPri82bKCZ5
	t1lAPUp5+Bv9Z2cum3k64gvDDo9kgT5gQV6Sv2Qo=
X-Gm-Gg: ASbGncvl6bkzTFgEIPJTLBorQSQalHZXWNvvpH3QvLtEyutBMPli4d/gxZT4uF9Tak6
	TCASspthZtpZZbeQEcjX0UYNYWMBVq0OPlnRmuZTIn29Jk/e45QD0uIjBcAxM5HyhQMl26TmPeR
	ZI7KRq3vyYrm7u+KOKIx/OgCob/BZUc35zLlZtfBpCo9LFrBkKAvMRvlLrC7Ff7pPvnccakBshj
	DgV1DQ=
X-Google-Smtp-Source: AGHT+IEE9w0eDr0giKjZk20A1Pk3m05SaMmyflvdhQBUu+6YJyhI0rlrRT7NjlqjdN10aXpuWTwvHAh+BYrz/XNiSAo=
X-Received: by 2002:a17:90b:4b0d:b0:31f:11d6:cea0 with SMTP id
 98e67ed59e1d1-323421589e3mr9199868a91.27.1755372419504; Sat, 16 Aug 2025
 12:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250729174332.3acd1a86@gandalf.local.home> <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
 <aKCLGvmPLPwjyw13@shell.armlinux.org.uk>
In-Reply-To: <aKCLGvmPLPwjyw13@shell.armlinux.org.uk>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 16 Aug 2025 21:26:47 +0200
X-Gm-Features: Ac12FXzdBhCoG8V0CvvyVhmTbw1btQP3UQhsuJyyoAGbjZ60mJ7mUJQTmo-IeOg
Message-ID: <CAFLxGvwPwrG6KVsF=hKn1SmbC0yjLVjm6h8t1+qFE0GkO7rUbQ@mail.gmail.com>
Subject: Re: [GIT PULL] runtime verification: Updates for 6.17
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, 
	Nam Cao <namcao@linutronix.de>, John Kacur <jkacur@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_122700_557536_80B4A15F 
X-CRM114-Status: GOOD (  13.82  )
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

On Sat, Aug 16, 2025 at 3:44=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> > With this change:
> > [    2.943690] Kernel panic - not syncing: VFS: Unable to mount root
> > fs on unknown-block(0,0)
> > [    2.950101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 6.17.0-rc1 #176 NONE
> > [    2.950509] Hardware name: Generic DT based system
> > [    2.950865] Call trace:
> > [    2.951722]  unwind_backtrace from show_stack+0x18/0x1c
> > [    2.953111]  show_stack from dump_stack_lvl+0x54/0x68
> > [    2.953312]  dump_stack_lvl from vpanic+0xf8/0x388
> > [    2.953526]  vpanic from __do_trace_suspend_resume+0x0/0x50
>
> Please lookup the value of __do_trace_suspend_resume in System.map.

Hm, I see it twice in System.map, both times non-global.
$  grep __do_trace_suspend_resume System.map
c0303098 t __do_trace_suspend_resume
c03c5758 t __do_trace_suspend_resume

>
> >
> > With commit  3f045de7f5 "panic: Add vpanic()" reverted:
> > [    2.680077] Kernel panic - not syncing: VFS: Unable to mount root
> > fs on unknown-block(0,0)
> > [    2.690241] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 6.17.0-rc1-dirty #177 NONE
> > [    2.690832] Hardware name: Generic DT based system
> > [    2.691339] Call trace:
> > [    2.692530]  unwind_backtrace from show_stack+0x18/0x1c
> > [    2.694283]  show_stack from dump_stack_lvl+0x54/0x68
> > [    2.694536]  dump_stack_lvl from panic+0x110/0x31c
> > [    2.694944]  panic from mount_root_generic+0x1fc/0x2ac
>
> Also please lookup mount_root_generic.

$ grep mount_root_generic System.map
c1c01814 T mount_root_generic

>
> > Maybe it changes the stack layout enough such that dump_stack() on
> > ARM32 is no longer
> > able to walk it? I'm using gcc 15.1.1, if this matters.

In the meanwhile I tried also with gcc 8.5, same problem.

> Also please check whether you're using frame pointers or the unwinder
> (CONFIG_UNWINDER_FRAME_POINTER or CONFIG_ARM_UNWIND).

With CONFIG_UNWINDER_FRAME_POINTER the stack trace is sane,
so only CONFIG_ARM_UNWIND is broken.
I kind of expected it the other way around...

--=20
Thanks,
//richard

