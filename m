Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057F0D10388
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFVxrWwlGXu7xwVCAmBNg01QSRfDgCIGYPTLM5Loo7A=; b=XExzBEeuizIEGKvF9mjFxLNAHw
	2ZELRfN7YAaOegtXd6auejYShamfMD3MVnlhO7uTLEe7Jdzk/6Im+uQ1gDYHmzPtUzzGIM+0VFovq
	YrZfra0BCiivPc9E66NkBBh++Y6zKELVIBXgqUVAZeqUhtPaz9xYIfggfJbKsSvOSn2x/jSrbFJHH
	8me7QDLk4N7bgw7CgRK2Uj28LbpdQDjWrRiiHYzjGmiIAY/504LYgFCy4OD0iyntMBu47KJTTY+eR
	RbBWEmmSVaBxYjMYfojxr6PNr9NV3iNOMfmtVtMjZP9ewPsL0ZZ3Zvs/sN5Gxjf/bo7r/yF1rC87Q
	YzRTazlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t45sd-00000001uf2-31HN;
	Thu, 24 Oct 2024 22:00:31 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t45r5-00000001uVg-1NMc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 21:58:56 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so12512841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729807132; x=1730411932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFVxrWwlGXu7xwVCAmBNg01QSRfDgCIGYPTLM5Loo7A=;
        b=ENyxYYKAkd/MugRXKdLdsK4U1fHk5xqxhxgrWJA4BqqUx+hMR/xttK6YWOtkHKQH/A
         R9PM2JUvGQTH/l3rBGjL4j6Owk9ly8AvFDDV8fV3/g4Lw1fTwl1WrsqOHhgl0vb167JJ
         EYjJd9DotRKKpTufk438JtKy0Be5d9TVz1flenV51oe7H09ULUfduiQTPnPOsPjiWoZk
         j7BU22yR3jARHW0kjWT3BoR+zN+UXoaBrAmCD2je5H5daFOWJS6kswuqDhe0sCaXP8Qf
         iX4M5Fm3g1tYykUZ+1BZwteWDC5QytkKkYzyYzOTYHADZf1A7soRSThrMz31vVwDwU6D
         SFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729807132; x=1730411932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFVxrWwlGXu7xwVCAmBNg01QSRfDgCIGYPTLM5Loo7A=;
        b=UmDiwfNZifpF2zdMS/VCaRDpN0oZgWzy5l0HTLV3oOuYdKlnX1Do9feWc0nd/T7Xn6
         mZr3muBgEv1Le188dVhE9ZBIkaQjmQniHnF0skGPaYREpPPkzQHEnnts5T5mdZKZks5L
         W4/2sDfp4mtdb1bNsno9LmFhXQUt72pw4+EgrdBeclwbX31IVsdtszKz3kURGJhbUbD/
         7HrKTBkglkNWmNwTLOpALVj1kzjTPz9qpRJbttnxfuQGUlHG+tQRTR+h0b+H4c28dYON
         v2oAoYLSl8YkXUc3UAzuc2FxPvuyiflR7Vw+Cy8w/ITCqL1fKgKZHJvRwuSYctGvlefp
         GkRw==
X-Forwarded-Encrypted: i=1; AJvYcCUeCatLG+aoVzRZOi7ouNo0bAMHn0P5+azKEb2V0vtqhMDl5MXSu3an8ty7DW/wNcBqUp3NH8WweZPDV2mNN0X8@lists.infradead.org
X-Gm-Message-State: AOJu0YxNuW5p0b4NLXbDke74R0gYJNICOYHPe27+Rk5bs+YVBWSEpsEE
	pZ0T5OyDVWiwwzxGdvelb4Tq1O8fs1qmWDlgSS+lRuPoPnwjUozH2OiarBKnwYzM1Z4T9u+/YwS
	YMbOH/pU0mLo5OQJFPqP2HPqxuFtapqLdB5ET6w==
X-Google-Smtp-Source: AGHT+IHvsIXQR72a7B+0VLm11VGicY9C2xyjpGaCCytBMfZbl/D5DRFsNMPKYNptUhXB3YcX5jP4S4kynK/SQjQw+0o=
X-Received: by 2002:a2e:9010:0:b0:2fb:3e01:b2bd with SMTP id
 38308e7fff4ca-2fc9d35a589mr34560231fa.21.1729807132380; Thu, 24 Oct 2024
 14:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com> <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
In-Reply-To: <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Oct 2024 23:58:40 +0200
Message-ID: <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC shadow
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_145855_423484_3A3A65E8 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Clement,

I saw I missed to look closer at the new bug found in ext4
on the STM32:

On Mon, Oct 21, 2024 at 2:12=E2=80=AFPM Clement LE GOFFIC
<clement.legoffic@foss.st.com> wrote:

> Perhaps not related with this topic but as in the backtrace I am getting
> some keyword from our start exchange, I dump the crash below.
> If this backtrace is somehow related with our issue, please have a look.
(...)
> [ 1439.351945] PC is at __read_once_word_nocheck+0x0/0x8
> [ 1439.356965] LR is at unwind_exec_insn+0x364/0x658
(...)
> [ 1440.333183]  __read_once_word_nocheck from unwind_exec_insn+0x364/0x65=
8
> [ 1440.339726]  unwind_exec_insn from unwind_frame+0x270/0x618
> [ 1440.345352]  unwind_frame from arch_stack_walk+0x6c/0xe0
> [ 1440.350674]  arch_stack_walk from stack_trace_save+0x90/0xc0
> [ 1440.356308]  stack_trace_save from kasan_save_stack+0x30/0x4c
> [ 1440.362042]  kasan_save_stack from __kasan_record_aux_stack+0x84/0x8c
> [ 1440.368473]  __kasan_record_aux_stack from task_work_add+0x90/0x210
> [ 1440.374706]  task_work_add from scheduler_tick+0x18c/0x250
> [ 1440.380245]  scheduler_tick from update_process_times+0x124/0x148
> [ 1440.386287]  update_process_times from tick_sched_handle+0x64/0x88
> [ 1440.392521]  tick_sched_handle from tick_sched_timer+0x60/0xcc
> [ 1440.398341]  tick_sched_timer from __hrtimer_run_queues+0x2c4/0x59c
> [ 1440.404572]  __hrtimer_run_queues from hrtimer_interrupt+0x1bc/0x3a0
> [ 1440.411009]  hrtimer_interrupt from arch_timer_handler_virt+0x34/0x3c
> [ 1440.417447]  arch_timer_handler_virt from
> handle_percpu_devid_irq+0xf4/0x368
> [ 1440.424480]  handle_percpu_devid_irq from
> generic_handle_domain_irq+0x38/0x48
> [ 1440.431618]  generic_handle_domain_irq from gic_handle_irq+0x90/0xa8
> [ 1440.437953]  gic_handle_irq from generic_handle_arch_irq+0x30/0x40
> [ 1440.444094]  generic_handle_arch_irq from __irq_svc+0x88/0xc8
> [ 1440.449920] Exception stack(0xde803a30 to 0xde803a78)
> [ 1440.454914] 3a20:                                     de803b00
> 00000000 00000001 000000c0
> [ 1440.463141] 3a40: e5333f40 de803ba0 de803bd0 00000001 e5333f40
> de803b00 c1241d90 bad0075c
> [ 1440.471262] 3a60: c20584b8 de803a7c c0114114 c0113850 200f0013 fffffff=
f
> [ 1440.477959]  __irq_svc from unwind_exec_insn+0x4/0x658
> [ 1440.483078]  unwind_exec_insn from call_with_stack+0x18/0x20

This is hard to analyze without being able to reproduce it, but it talks
about the stack and Kasan and unwinding, so could it (also) be related to t=
he
VMAP:ed stack?

Did you try to revert (or check out the commit before and after)
b6506981f880 ARM: unwind: support unwinding across multiple stacks
to see if this is again fixing the issue?

Yours,
Linus Walleij

