Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E82C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5RvN79X/e2Dnh+83xOfluZFMOzlAF7dZpeIDtZ5KiY=; b=c0Hz1qFYWbCmpEgLRivGZdM4MU
	cGraWTKoTbv37+INMUXkaoIEvEDCGyJqmnSvPO/GfNanCHFBDoU+XjyY51y2TAiRZdX6EnGioyvGH
	PbyHU244ABOA/JQgFCf3ISacWvsaxoiKkxbV/zlG2Du3zyclZFa7rnaUi+u+mIsecqtMx2XSj+FWR
	Ukn5VmkPtWe1OPX/wgg92oWE1mNS5kabLboljEhYUaT+KHT4M7LkbB34lxapah65HMJrTf9PdKvBn
	kEX/WXnNK3xuPcFW24QzxIXU2VbAKxu/5lF2aCGyg2sMSXOsplIgQwhqOheJsb8KKobcqXsICM2HJ
	okjer5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecQZ-0000000HaIT-1rKB;
	Tue, 30 Jun 2026 17:39:19 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecQX-0000000HaI2-0iI8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:39:18 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso424564e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841156; x=1783445956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5RvN79X/e2Dnh+83xOfluZFMOzlAF7dZpeIDtZ5KiY=;
        b=eJoDzuNXo0Jsd+Lt30fnISN5W3oRZixQHf7bLtohIe9LXXIo2m8XXfpEgtjbJJqnr4
         7DQv4f/LcCL5g7X1o1zeB7GA4k81eR5NaGA9meA0x2oQr8irYSbHy3OOYaKszoM2SoHk
         f5LTAAMK1AE+iYjA6Db+r4lyKIkE+FWpcNgitmCqqUqw1upOVfNjVqO31BXXdyXBj5i5
         yRQmzID/rcKi+kNwldZwNsMGTQhPLstxHcXEp5s5QyGrYXI2pdcOVbtLErljapBt91DV
         Athf6nPyrg3YQAgeAGvWbs6196DwvVBj9GH0rz3INHxtDQD4MNQG8y3Q64Vx+BcHL8Ab
         T4/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp756qhlP1x6V1k9jNWkEIG1B18CJIl95eiJSfYBiW9XB3rujRCPqhrHX7+V8dJo804U2l00Yz6KCHDBUcubIQ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzOdj22vXfDYI/lHlI+wV8ghpvb+FUdeUuwUtWw20kdCEjDVzl4
	c2sE+D86l00MlqGTYmIIjL40qOejUwOqnZ7otxW28uJyMVbrkHsjmPiaNkzSsjePP7Y=
X-Gm-Gg: AfdE7clN/DCPWxpTIaPqOsBaDWyXjqXkMlf3fGZQS5ThLIlMeAOoXoSwA1jGp0TYhFY
	nfjacyin+UQEEGZQJIeRHj5eMMfIJtMQGDKj6XuoIp0pJF1tijdr8/qNAAOtt1/8i6kDfJagZfP
	EqoIbHRUPNvdZfsXbhAkTy7HODosuxrpFOUlkxONL85X1d1tzRmC1ZKo4PZ5qTie/Bml3rtcvfD
	YNkypngAySH8Z6aG32D8ILzh4/TlVzPezCOrvIhEQriA0rzXq49t5j9yiQ9TQyxt/UYEdiSIRmH
	JIcx1gGJIr4FlhRlaSXWOoOQuQWGCXEMJqGX4CL8mAkgiR1EcM3T2N9eR7MnNmNyzGT+MIdZkqk
	KhNOMpZB/z+hNxIE0sQYLZGadL2P9tftcJ8fxJe1gLlBiTo9H9Jw3Y56IeoQaziXk6YI69VvBlx
	40SiMCEiDXKhOvCow3ByUBnlFn429xMUnhj8LI/3i2KChCJSx47Q==
X-Received: by 2002:a05:6122:8b1a:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5bdc9439a91mr1036510e0c.3.1782841155669;
        Tue, 30 Jun 2026 10:39:15 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1a8d959sm1820379e0c.10.2026.06.30.10.39.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:39:14 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-736eec08c43so606983137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAIr49oeME2KNbtuCxp4X2Uieg2b7YkAcz+87NtqwyqErO2yIUssGrUStlUbAJh35n+VjqBoHiTBAvG9BIT70C@lists.infradead.org
X-Received: by 2002:a05:6102:6488:10b0:736:e29f:168d with SMTP id
 ada2fe7eead31-73bd49b5dd2mr832615137.16.1782841154210; Tue, 30 Jun 2026
 10:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260522143508.298439732@kernel.org> <20260522143525.551205135@kernel.org>
In-Reply-To: <20260522143525.551205135@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 19:39:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
X-Gm-Features: AVVi8CfpdU_5Hk90n_46nl3mYsXiinAyh-Bo52vsKnmAulDjunUQyOI8OG1lM20
Message-ID: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep rcu_is_watching()
 check to trace_##name##_enabled()
To: Steven Rostedt <rostedt@kernel.org>, David Carlier <devnexen@gmail.com>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_103917_255151_5D8D1BA0 
X-CRM114-Status: GOOD (  31.94  )
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

Hi Steven, David,

On Fri, 22 May 2026 at 16:35, Steven Rostedt <rostedt@kernel.org> wrote:
> From: David Carlier <devnexen@gmail.com>
>
> The trace_##name##_enabled() static call branch is used when work needs to
> be done for a tracepoint. It allows that work to be skipped when the
> tracepoint is not active and still uses the static_branch() of the
> tracepoint to keep performance.
>
> Tracepoints themselves require being called in "RCU watching" locations
> otherwise races can occur that corrupts things. In order to make sure
> lockdep triggers at tracepoint locations, the lockdep checks are added to
> the tracepoint calling location and trigger even if the tracepoint is not
> enabled. This is done because a poorly placed tracepoint may never be
> detected if it is never enabled when lockdep is enabled.
>
> As trace_##name##_enabled() also prevents the lockdep checks when the
> tracepoint is disabled add lockdep checks to that as well so that if one
> is placed in a location that RCU is not watching, it will trigger a
> lockdep splat even when the tracepoint is not enabled.
>
> Cc: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Link: https://patch.msgid.link/20260430144159.10985-1-devnexen@gmail.com
> Signed-off-by: David Carlier <devnexen@gmail.com>
> [ Updated the change log ]
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Thanks for your patch, which is now commit 9764e731ef6abacd
("tracepoint: Add lockdep rcu_is_watching() check to
trace_##name##_enabled()") in v7.2-rc1.

This is causing multiple warnings during system suspend on Renesas
SH-Mobile AG5, R-Car H1. and R-Car M2-W:

     PM: suspend entry (deep)
    -Filesystems sync: 0.018 seconds
    +Filesystems sync: 0.027 seconds
     Freezing user space processes
     Freezing user space processes completed (elapsed 0.001 seconds)
     OOM killer disabled.
     Freezing remaining freezable tasks
     Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
    -PM: suspend devices took 0.110 seconds
    +------------[ cut here ]------------
    +WARNING: include/trace/events/preemptirq.h:36 at
trace_irq_disable_enabled+0x3c/0x64, CPU#0: swapper/0/0
    +------------[ cut here ]------------
    +RCU not watching for tracepoint
    +Modules linked in:
    +WARNING: include/trace/events/preemptirq.h:40 at
trace_irq_enable_enabled+0x3c/0x64, CPU#1: swapper/1/0
    +
    +RCU not watching for tracepoint
    +CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.1.0-rc4-koelsch-00006-g9764e731ef6a #2337 VOLUNTARY
    +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    +Call trace:
    + unwind_backtrace from show_stack+0x10/0x14
    + show_stack from dump_stack_lvl+0x7c/0xb0
    + dump_stack_lvl from __warn+0x98/0x27c
    + __warn from warn_slowpath_fmt+0xc0/0x124
    + warn_slowpath_fmt from trace_irq_disable_enabled+0x3c/0x64
    + trace_irq_disable_enabled from trace_hardirqs_off+0x6c/0xb0
    + trace_hardirqs_off from __irq_svc+0x48/0xac
    +Exception stack(0xc1401f20 to 0xc1401f68)
    +1f20: c027a764 effb0e88 00000000 00000001 c140b080 c027a764
c140801c c140b080
    +1f40: c1407fe0 00000000 c140801c 00000000 fffffff8 c1401f70
c0b35980 c0b359d8
    +1f60: 20000113 ffffffff
    + __irq_svc from cpu_idle_poll+0x114/0x130
    + cpu_idle_poll from do_idle+0xb8/0x268
    + do_idle from cpu_startup_entry+0x28/0x2c
    + cpu_startup_entry from rest_init+0x150/0x178
    + rest_init from start_kernel+0x634/0x6d8
    +irq event stamp: 19112
    +Modules linked in:
    +hardirqs last  enabled at (19111): [<c0b35adc>]
default_idle_call+0xe8/0x104
    +
    +hardirqs last disabled at (19112): [<c0200b88>] __irq_svc+0x48/0xac
    +CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
7.1.0-rc4-koelsch-00006-g9764e731ef6a #2337 VOLUNTARY
    +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    +Call trace:
    + unwind_backtrace from show_stack+0x10/0x14
    + show_stack from dump_stack_lvl+0x7c/0xb0
    + dump_stack_lvl from __warn+0x98/0x27c
    + __warn from warn_slowpath_fmt+0xc0/0x124
    + warn_slowpath_fmt from trace_irq_enable_enabled+0x3c/0x64
    + trace_irq_enable_enabled from trace_hardirqs_on+0x40/0xbc
    + trace_hardirqs_on from __irq_svc+0x94/0xac
    +Exception stack(0xf0865f48 to 0xf0865f90)
    +5f40:                   c027a764 effc2e88 00000000 00000001
c227cec0 c027a764
    +5f60: c140801c c227cec0 c1407fe0 413fc0f2 c140801c 00000000
fffffff8 f0865f98
    +5f80: c0b35980 c0b35988 20000013 ffffffff
    + __irq_svc from cpu_idle_poll+0xc4/0x130
    + cpu_idle_poll from do_idle+0xb8/0x268
    + do_idle from cpu_startup_entry+0x28/0x2c
    + cpu_startup_entry from secondary_start_kernel+0xdc/0xf0
    + secondary_start_kernel from 0x4020f094
    +irq event stamp: 27461
    +softirqs last  enabled at (19008): [<c02341ec>] handle_softirqs+0x174/0x3e4
    +hardirqs last  enabled at (27461): [<c027a7d0>] do_idle+0x124/0x268
    +softirqs last disabled at (18991): [<c0234a84>] __irq_exit_rcu+0xf0/0x194
    +hardirqs last disabled at (27460): [<c027a734>] do_idle+0x88/0x268
    +---[ end trace 0000000000000000 ]---
    +softirqs last  enabled at (27438): [<c02341ec>] handle_softirqs+0x174/0x3e4
    +softirqs last disabled at (27425): [<c0234a84>] __irq_exit_rcu+0xf0/0x194
    +---[ end trace 0000000000000000 ]---
    +PM: suspend devices took 0.380 seconds
     Disabling non-boot CPUs ...

Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
are unafffected, perhaps because they are not SMP?
All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.

Reverting the commit fixes the issue.

Do you have a clue?
Thanks!

> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -293,6 +293,10 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>         static inline bool                                              \
>         trace_##name##_enabled(void)                                    \
>         {                                                               \
> +               if (IS_ENABLED(CONFIG_LOCKDEP)) {                       \
> +                       WARN_ONCE(!rcu_is_watching(),                   \
> +                                 "RCU not watching for tracepoint");   \
> +               }                                                       \
>                 return static_branch_unlikely(&__tracepoint_##name.key);\
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

