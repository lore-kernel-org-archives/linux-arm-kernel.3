Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9C3D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuomQA4el8BSAut2vwLq507qc8/7nzyKhdkv644V4tk=; b=rvzsCZYnMVSxW9Kpo47uuu28OY
	3so6QbwY12ykirdMUfB91yb4FawpJ4+R0EHjt4CKLfXImqw89fFQonl1zUCuaGAgmkc7iBBR4pURs
	Xw8OptHvAVCMsRajetLxCtukJd4rGzudaN6v0/t3++5MjExenS72SfIf38PZNSzX82aWCnxnT7YBy
	VyNBrryi0ToylyJjrKo2m6Ud3EQvC+14j2CvuSlGpzD3Ipte/16VeVK5Qq82cgL/DeTB5dQSn4uSK
	Ofp9eZqKczG+ZacPFrLjWNPTc3JfEiPlEoA3Lc/nKeP7LmUWqURJzYUfG0B2bzR+SjhbCefnno4HM
	jbDRQGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IUk-00000003VsB-1vXB;
	Fri, 25 Oct 2024 11:28:42 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I7z-00000003SL5-3HSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:05:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2601170e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729854310; x=1730459110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuomQA4el8BSAut2vwLq507qc8/7nzyKhdkv644V4tk=;
        b=HvEoIu/Pbzx8gCpCKdjEvNfBeFIPqJ97a1fVYYygbuWYIKhf7HAs25mu/wWKOLggQ9
         2WfA9xmOqzZDJStx7Q2LOi4FX4l7cXUfkP9Sqrs5gq8fT0mGNwA+vCosYqgjzv6HN9nu
         WkWiW/pYihrEuPwbjG0M2Q+p+DuQ5HxKEtufkCwzBKIidadyI64mbZqVYQOr2fE1wiVv
         28X2bgNpa6Uvsi0AmhPa1j1o8lzbNqWgqrRx2oRWjSkG01FLPeWFznpd9+zPP/AigNW2
         tkJ1WMXB5AZQBAAk1sno1gIvthz2UQnOVqrzJQNhjcpi0Bnp24FAQdUWsWcjOgCANu9x
         q+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854310; x=1730459110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuomQA4el8BSAut2vwLq507qc8/7nzyKhdkv644V4tk=;
        b=ZBAspWeDlb9ni4NAmWvaYDhvnnUBd30S5TyxPLJe5X6Rq2PkmA5Gl0CLdYwqhhDdmv
         SLAIbHTYhx66/dIMsVUqkRlbk4pT4e620XRp9VQJceI2BjLYWgRwQUdEycXu49ucGhCJ
         3EzzP2RF7zMvG336F2Dex/9qLcOIRpmOLMjS0SUYUZFO2bqxWPzo5CTTQ+c6mTeF6b4H
         mCTmcdkZ+4+4fDj7CE6wPMpSGYNxV4OwK3rwzUfdTS5zfQbPj2xIHqqUjUpq809Ykyxd
         w7e8NgYMoe4nmU6W1rSR43UNCtCIZHHV9hoIoyCFN1pTXwZ92ggK8tEqy5v/YR8QZjJo
         0qyw==
X-Forwarded-Encrypted: i=1; AJvYcCX8IESqLfDkPXMefWJYHCLLbJ5xLvlU2gDO1wb/Nl/RpaT82tr2V+M+W2GHb36W+8SoZ4aQzKaDk63mVFzAO0Vs@lists.infradead.org
X-Gm-Message-State: AOJu0YzXHsaAR+ykSAQM1LGuZYbqI9Pz84gAzHqqVu85pyNWi0btnyMt
	D9itkOuya4NZhK0j2+zkKn00ecuSuNdC8l7xP3uWOL1osVMBnrvvQZmg7g5Ic8xqieMGim9Wj32
	7hiKouS9XW/g0y+Afdj+gbIQqdXBEbzrCXUanqQ==
X-Google-Smtp-Source: AGHT+IE3hHhqGmpopThdU7fUZ90CNqImMKu3l7SDYMnc1DU7abvZQL9XTwbVyoLLrq2iIOMeoYVGfYC3GvxR504MoZA=
X-Received: by 2002:a05:6512:3996:b0:539:f593:c19e with SMTP id
 2adb3069b0e04-53b1a3b018amr5062359e87.60.1729854309787; Fri, 25 Oct 2024
 04:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com> <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com> <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
In-Reply-To: <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 13:04:57 +0200
Message-ID: <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC shadow
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, Russell King <linux@armlinux.org.uk>, 
	Kees Cook <kees@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040511_845320_754C2224 
X-CRM114-Status: GOOD (  24.39  )
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

On Fri, Oct 25, 2024 at 11:27=E2=80=AFAM Clement LE GOFFIC
<clement.legoffic@foss.st.com> wrote:
> On 10/24/24 23:58, Linus Walleij wrote:
> > Hi Clement,
> >
> > I saw I missed to look closer at the new bug found in ext4
> > on the STM32:
> >
> > On Mon, Oct 21, 2024 at 2:12=E2=80=AFPM Clement LE GOFFIC
> > <clement.legoffic@foss.st.com> wrote:
> >
> >> Perhaps not related with this topic but as in the backtrace I am getti=
ng
> >> some keyword from our start exchange, I dump the crash below.
> >> If this backtrace is somehow related with our issue, please have a loo=
k.
> > (...)
> >> [ 1439.351945] PC is at __read_once_word_nocheck+0x0/0x8
> >> [ 1439.356965] LR is at unwind_exec_insn+0x364/0x658
> > (...)
> >> [ 1440.333183]  __read_once_word_nocheck from unwind_exec_insn+0x364/0=
x658
> >> [ 1440.339726]  unwind_exec_insn from unwind_frame+0x270/0x618
> >> [ 1440.345352]  unwind_frame from arch_stack_walk+0x6c/0xe0
> >> [ 1440.350674]  arch_stack_walk from stack_trace_save+0x90/0xc0
> >> [ 1440.356308]  stack_trace_save from kasan_save_stack+0x30/0x4c
> >> [ 1440.362042]  kasan_save_stack from __kasan_record_aux_stack+0x84/0x=
8c
> >> [ 1440.368473]  __kasan_record_aux_stack from task_work_add+0x90/0x210
> >> [ 1440.374706]  task_work_add from scheduler_tick+0x18c/0x250
> >> [ 1440.380245]  scheduler_tick from update_process_times+0x124/0x148
> >> [ 1440.386287]  update_process_times from tick_sched_handle+0x64/0x88
> >> [ 1440.392521]  tick_sched_handle from tick_sched_timer+0x60/0xcc
> >> [ 1440.398341]  tick_sched_timer from __hrtimer_run_queues+0x2c4/0x59c
> >> [ 1440.404572]  __hrtimer_run_queues from hrtimer_interrupt+0x1bc/0x3a=
0
> >> [ 1440.411009]  hrtimer_interrupt from arch_timer_handler_virt+0x34/0x=
3c
> >> [ 1440.417447]  arch_timer_handler_virt from
> >> handle_percpu_devid_irq+0xf4/0x368
> >> [ 1440.424480]  handle_percpu_devid_irq from
> >> generic_handle_domain_irq+0x38/0x48
> >> [ 1440.431618]  generic_handle_domain_irq from gic_handle_irq+0x90/0xa=
8
> >> [ 1440.437953]  gic_handle_irq from generic_handle_arch_irq+0x30/0x40
> >> [ 1440.444094]  generic_handle_arch_irq from __irq_svc+0x88/0xc8
> >> [ 1440.449920] Exception stack(0xde803a30 to 0xde803a78)
> >> [ 1440.454914] 3a20:                                     de803b00
> >> 00000000 00000001 000000c0
> >> [ 1440.463141] 3a40: e5333f40 de803ba0 de803bd0 00000001 e5333f40
> >> de803b00 c1241d90 bad0075c
> >> [ 1440.471262] 3a60: c20584b8 de803a7c c0114114 c0113850 200f0013 ffff=
ffff
> >> [ 1440.477959]  __irq_svc from unwind_exec_insn+0x4/0x658
> >> [ 1440.483078]  unwind_exec_insn from call_with_stack+0x18/0x20
> >
> > This is hard to analyze without being able to reproduce it, but it talk=
s
> > about the stack and Kasan and unwinding, so could it (also) be related =
to the
> > VMAP:ed stack?
> >
> > Did you try to revert (or check out the commit before and after)
> > b6506981f880 ARM: unwind: support unwinding across multiple stacks
> > to see if this is again fixing the issue?
> I Linus,
>
> Yes, I've tried to revert this particular commit on top of your last
> patches but I have some conflicts inside arch/arm/kernel/unwind.c

What happens if you just

git checkout b6506981f880^

And build and boot that? It's just running the commit right before the
unwinding patch.

Yours,
Linus Walleij

