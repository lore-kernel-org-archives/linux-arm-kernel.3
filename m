Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33648C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow+/9+zwH5SPEvPH9IdGcsqaSRDdfYfSH3/rH1hC2nw=; b=Hl893ZCUGMCAv5MqJwEEZozd2g
	cM/YAgmjtMEibrIY67b+54ATunWfXJ+IHMqr3+y5ASBCYaUB843bvkoQtJeDgdaStlcwG8ix0bS4W
	k4i+QjCkSKcVLG/VNa5dtSID8c1iyWJiwvOMx+IprAiEcNaigdM84AwnnMBcbXTc2LBGs174UyySx
	Ulm6iWnwph8Ay2vPAGFIN+uVEV9Yp3kLhD4yO8FXLUdeqvwbb9SrL81Thd07cm5gsu36GJliEJuKI
	CH1tKeX/CT7KUhdYY9zg+u11+WC+ixZAU2gDMitUJnWCNlOUvq862+h5wh8QQosN7GCzetl8C6hno
	Aab2PGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werBZ-00000001By8-3xLR;
	Wed, 01 Jul 2026 09:24:49 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werBX-00000001Bxf-2b0Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:24:49 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1276f8414bso58076166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 02:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897886; x=1783502686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow+/9+zwH5SPEvPH9IdGcsqaSRDdfYfSH3/rH1hC2nw=;
        b=TCiqeMCmzZaUYIgyoIvEpodQ1n7TPFSqIxXEmgQlD/0m8rRJAq1voT70rQ2JWwn9kP
         9WmphrRGRfTuRyo+BxvjnsqiVSDqDJKQScqVhGd+O8o3ukWuFapuXG2pFU4lV0a3r3O0
         E7wXV8pFehGxoYakTOWRrznkNTow8v7sLXyfgJzMm9P5h9yFbfkvS041ovPHNeFJReVp
         ybc6bz1JeZ+vyOlTjUBd6hOMYNSzO62VGkhhl1b3ZKmWL+TpJ5N23Cd5N5NRHnDn3BVx
         QzRlBUmETlICqDeizAFBVeJ414kjI+aRA6wTGj8K96dCkdh8qfe2h2Z0tlPR2B4KRz8r
         JbNA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0WQ9oCNxJag57x+0X1NE9NX9uoDo3Iw0ICtQvAVawA8cov7fIG+53ZoJkL+aXrtXISopRSRu8EbqjGFAZ8o0M@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDcW6winwBKpv4WSTlWgFZijlLIEKrx0994Ucw8Bu3+Y7pqwl
	vn88mXLrTbPzQs+jjrJ25eyBcEhJxNGjVtlngb95rV2tPUPghWPcfYEDeOKVnBKxoys=
X-Gm-Gg: AfdE7cmE4Npg6bmR41ihkMiJuY8U8PzmWd8Jjgozp9ZrAXob5qJs4E5MFJmMtrhzB5t
	h2Nxr2BcgiMllGieOydFPF8FQj+neFvCKHRAHdNsMzzl6hYHVH9okv+ebn1Jcm4BalfqXgE+5f+
	3OIkukC7FRfX4JgE0RmB+Aw7RAkQ9Vr7QNc2V2mx6c+2P3tta/Jbx3c08JaBPSL38PbK60/8Uk3
	Cp4o6YhjByqdCewM8Th050acFnyohPncjnbheUFmboB0O/5LEhIZ7ExPGv3Ley87mViKSrga9wk
	qCq5WuU6qQmnGgVpCzNlhBx+F53zagI8M2M3pbpIS6FONbgs8rRFHmPF9ShQvVDB+9toA0IHcu1
	i+zD4Kt8KdnYG3XyMGXVejsjDU2QHjnvzTwUfsV6Vr+5xVv5RwkRzAK2JBvXTE/yNVvU7JNLq3z
	eEBqGfavgqxz2M5Xj9wf5VV3R+5RP3Wwz48e50hlr1KvN3S81VUA==
X-Received: by 2002:a17:907:c205:b0:c12:15b5:876a with SMTP id a640c23a62f3a-c12a9efd3b2mr38687266b.17.1782897885481;
        Wed, 01 Jul 2026 02:24:45 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0df9fsm246554466b.35.2026.07.01.02.24.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:24:45 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697ce8cfe65so792404a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 02:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrTzKKN5ssTvWtqrY6PCmFCPW+dOEOnuC/cplVcosf0JotM5B/WfEWDnO5L69IQKBA951Hwn26wyqhQcmrtIJLB@lists.infradead.org
X-Received: by 2002:a05:6402:4589:b0:697:edf5:20d1 with SMTP id
 4fb4d7f45d1cf-6989f2ee1a4mr383545a12.6.1782897883684; Wed, 01 Jul 2026
 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260522143508.298439732@kernel.org> <20260522143525.551205135@kernel.org>
 <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com> <20260630155318.7db20990@gandalf.local.home>
In-Reply-To: <20260630155318.7db20990@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Jul 2026 11:24:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
X-Gm-Features: AVVi8CfjY3jgBlKnwpLmZCzcIfOcIROBllX921r5PB5mKoy_GTLEWEU4nHyABmY
Message-ID: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep rcu_is_watching()
 check to trace_##name##_enabled()
To: Steven Rostedt <rostedt@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_022447_680435_19ED3941 
X-CRM114-Status: GOOD (  35.28  )
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

Hi Steven,

On Tue, 30 Jun 2026 at 21:53, Steven Rostedt <rostedt@kernel.org> wrote:
> On Tue, 30 Jun 2026 19:39:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
> > are unafffected, perhaps because they are not SMP?
> > All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.
> >
> > Reverting the commit fixes the issue.
> >
> > Do you have a clue?
>
> Yes, it means the code was buggy before the commit. The commit will trigger
> warnings in places that have issues. Before the commit, the buggy code was
> never caught.
>
> It's like enabling KASAN and finding code that has use-after-free.
> Disabling KASAN is not the fix.
>
> Tracepoints are managed by using RCU. There's places that RCU is turned
> off, meaning a tracepoint in one of those locations can be triggered when
> RCU is not active which may have a use-after-free semantic when the
> tracepoint is enabled.
>
> Tracepoints hidden by trace_#tracepoint#_enabled() are not caught when RCU
> is disabled and the tracepoint is not active. This commit makes these
> locations trigger even when the tracepoint is not active.

Sorry, my wording could indeed be better: this commit probably does not
"cause" the issue, but merely exposes it.

> One way to find out if this is an existing bug or not, could you enable the
> preemptirq tracepoints and run the tests again with the commit reverted?
>
>   echo 1 >  /sys/kernel/tracing/events/preemptirq/enable
>
> This will enable the events that are hidden without the commit. If it
> triggers when enabled, it shows the commit found a bug.
>
> If you get the same errors, the bug isn't with the commit in question, it's
> with the tracepoints being called during suspend/resume. We will need to
> fix that if that's the case.

Thanks, it does not trigger with the commit reverted and the "echo 1 > ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

