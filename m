Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRXV44PwQfVfLgImJrTaANIWIbJbHaU92U/BzopGLSg=; b=w/Lomz0F4ZlYmb74xgYlimJ+Ir
	884nZGos0jpkgblQQ7qhsIpMKSClsNP/kegUZFMUysG1dQGTvmW4VDKwmbTjkPdkTcFIBeCKmU9cT
	yOxNd+gHpUkCx0P0ck/fAJTbvXGNqmmMUpGIce51IIrZObfdNnoioAORG4bU5wXR1kYxy9M9G3zVe
	2vEcQoBnQYbTY4PclPUlyZe3wdlyrs3/hKCaJP403ZQ368B7hUba+z4i/efKTaP4hnZGctXFT8a4x
	w01yToXx5rV9eZGD/5nOv8cSwz1gdjxRB1hp+2/k8OMu0qV7d3+ND1uimheQvN+lXThkIW8baGwsd
	TnSmnpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFh1-00000004awG-03oi;
	Sat, 16 Aug 2025 12:07:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFeS-00000004amK-1C5C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:04:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32326e5f058so2065193a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755345887; x=1755950687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRXV44PwQfVfLgImJrTaANIWIbJbHaU92U/BzopGLSg=;
        b=DVaSY+TMtYiXO/e5C5YwjNHKa1Em8LLcuapplir9BAfhyDVXnZbmCj8nukeP842qWg
         86zyZ6jF28cF6SPmqJkL3J8gC9UTKuka1b2h4BF1l4AvvTskhK9PhJiiouJPlJLJeFLO
         1H5c7AbcqUSgNQj2vdrva81Y06ZMjfaxoPMxqy7eGpZOpdJcfPvSBqV+f2lWSrqwe27l
         swAql8wk1rDHnsZsN7uQMhOKP59pidd6fz1l2kQmcD3C6ncCE8iaGg0pAKdg8eOTEb8l
         W0fZWwSgedTgMqQnPP43/OVJ8fDD/8EH0QQ7syzrefzWgh2NFR343t8LwiM72D8k2Y9E
         u3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755345887; x=1755950687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRXV44PwQfVfLgImJrTaANIWIbJbHaU92U/BzopGLSg=;
        b=ZjqiIbE4Y8li0CCQyJ91HpCZEZPX/69h3noiJBtiYalI9aU+HoidEk5aKMcdGy17x0
         0Pt63t5BjBHEUD6qyoTMAqllhiaBmyZ8XOAB4DpFDvBc8MOJS1x9vUnK4Hh/ZlVkgYtN
         Mt5mtdDf1aH9SaUVtInE5nbAAVaIrA5L6VZwKsIJbCd04fS1O5m0899de7VPXVVU2hPO
         C6/qXG4cz6zB+41SiyeHBTJuTVSu8bDuDBmo8Pr9AvLud2j7ie/hst1aPM0OxlvvD+XX
         JzZWYinTbw65SatE+cj2nahSyB407VLCDeQB5mX3GZc97rAasY2HzlbEQxUYmVMKrPG4
         Bn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaCmZYAek9w3hD7IREXR4NwGsU159NAhRBHDNePZR+EljRKRAy0MVLiyU5rRorXf8BZHz+DuVV/QPBgMjwF8n8@lists.infradead.org
X-Gm-Message-State: AOJu0YyksPUDM0kTqx1plBeI8w5pIkOSEa+rA+uwir9lYgJAb9hKmf+B
	G3Zk71WGS9eA6cSsZZ+8CAfPjUVXq0fDFr1S97IvPhiM77KGxE8oN81UixO76jGNLjhnHPVGZCS
	r0QnOA6HGD9WYPQHYcVbE+LJB88jhjcE=
X-Gm-Gg: ASbGnctan8+8e39vz6O19bOBxp/yLiwueLc8/V/fEhfGK/IqlLXJPquv54k4gVqq/p4
	SseyATA31tM8Q7ZBKyOo78HLTNMSmyWy1Vrn63qCiTDn5uckIaS4hO6C7xpLPMNdtFbSvFWuPXv
	TCDO/hSgk08/oBo2OYbVhhYSMDeqYtSwTcqR7dMvlIshpUtTEEDhupNDqwwfnj84GlcbaAuTWyr
	rLnd00=
X-Google-Smtp-Source: AGHT+IEW1BFzCpzoqiXUOA9dcgpirpe98DZsv4T2hWuFQBIy8Cc9tbAXcYnphe1Vm1b/ToGV0aR8irsU9X8+iz/50nA=
X-Received: by 2002:a17:90b:5643:b0:321:9536:4b69 with SMTP id
 98e67ed59e1d1-3234223a401mr7394867a91.27.1755345886931; Sat, 16 Aug 2025
 05:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250729174332.3acd1a86@gandalf.local.home>
In-Reply-To: <20250729174332.3acd1a86@gandalf.local.home>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 16 Aug 2025 14:04:34 +0200
X-Gm-Features: Ac12FXwfJHuPg0toK2krfbOjtNVdPZv0eGEVf1bRzqtiV5xVp7KgQjTukRbf9iY
Message-ID: <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
Subject: Re: [GIT PULL] runtime verification: Updates for 6.17
To: Steven Rostedt <rostedt@goodmis.org>, rmk+kernel@arm.linux.org.uk
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	John Kacur <jkacur@redhat.com>, Tomas Glozar <tglozar@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_050448_322101_20B5331C 
X-CRM114-Status: GOOD (  11.36  )
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

[Adding ARM folks]

On Tue, Jul 29, 2025 at 11:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
> Linus,
>
> Runtime verification changes for 6.17

[...]

> - Add a vpanic() to allow for va_list to be passed to panic.

This change is causing a regression on ARM32.
panic() no longer shows a proper stack trace.

With this change:
[    2.943690] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
[    2.950101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.17.0-rc1 #176 NONE
[    2.950509] Hardware name: Generic DT based system
[    2.950865] Call trace:
[    2.951722]  unwind_backtrace from show_stack+0x18/0x1c
[    2.953111]  show_stack from dump_stack_lvl+0x54/0x68
[    2.953312]  dump_stack_lvl from vpanic+0xf8/0x388
[    2.953526]  vpanic from __do_trace_suspend_resume+0x0/0x50

With commit  3f045de7f5 "panic: Add vpanic()" reverted:
[    2.680077] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
[    2.690241] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.17.0-rc1-dirty #177 NONE
[    2.690832] Hardware name: Generic DT based system
[    2.691339] Call trace:
[    2.692530]  unwind_backtrace from show_stack+0x18/0x1c
[    2.694283]  show_stack from dump_stack_lvl+0x54/0x68
[    2.694536]  dump_stack_lvl from panic+0x110/0x31c
[    2.694944]  panic from mount_root_generic+0x1fc/0x2ac
[    2.695399]  mount_root_generic from prepare_namespace+0x200/0x258
[    2.695723]  prepare_namespace from kernel_init+0x20/0x140
[    2.695974]  kernel_init from ret_from_fork+0x14/0x28

The change itself looks fine, so I suspect it uncovers a deeper
problem with panic().
Maybe it changes the stack layout enough such that dump_stack() on
ARM32 is no longer
able to walk it? I'm using gcc 15.1.1, if this matters.

To reproduce the issue using qemu, build a multi_v7_defconfig zImage and ru=
n:
qemu-system-arm -m 512 -M virt -kernel arch/arm/boot/zImage
-no-reboot -nographic -append "console=3DttyAMA0 panic=3D1"
It will fail to mount a rootfs and panic.

--=20
Thanks,
//richard

