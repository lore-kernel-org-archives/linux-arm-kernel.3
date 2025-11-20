Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B23CF8848
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPbZ/MMBlqKL6sY5staimMEFjAxFe5tDcCF6a6LfuA8=; b=jGbZlhhLRDIXZldnV+UGBiap9e
	dF2scVyFEsV6ixP/ynK5FwacnTI659Yg3XwN/Ph4ZNoSVrFa6W10Z/mW9YfvHZx8J9jrba4bG2CnN
	iPquKCclievT0dsuVPumJENparsXN4ca8tHlcSBKRrIptOHX2GzLlo60wqOUSp3dyi2/mlY/h3zRD
	lu9RYg1Yema3NkrdTXd5AIeFmgh2IZi/RNapES/TgRkW9JBbKF1NKGLffiErGwi2u6aPCKWzva1eY
	209dN120dqaThnxwLDewagjKVm2T9/WAAK8ETcCyMsSoVLCU35jC2fnB9vpUZSdZzqWfdA7odGUcs
	Tk2uEYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3GX-00000006c0m-0y4S;
	Thu, 20 Nov 2025 11:55:57 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3GT-00000006bzv-3tKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:55:55 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c71cca8fc2so491126a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763639748; x=1764244548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPbZ/MMBlqKL6sY5staimMEFjAxFe5tDcCF6a6LfuA8=;
        b=GJuXfecmYv12mraXBIMMvzhGecBmOp3YTZHRMWmuYLoXZoyrmpbQO+eggGZGeI8jJU
         xxREgFnzYdSLgXKnoM5svRZlVFnfCcZr1yoQ+m85L/26NFg+pbKOzMnA/BrBz39bVSzg
         Nvuv9XC60dF8ZHJDoENkGW/hNi9YPxC8E4OSkPFycxwLpIe9thUJWCxMNpgQ25twQs4a
         7baIDOPU0gVJbPmKKtSD7HQ0mvosZltzvERogHowVXfv1c3ScGZwswv1EOl2cSPLdEhu
         rWc2BOjbP0bAy7Wk/MVdNvxDE9WiAZy/6BLLV2+WEEXiUc3c2k+u67zg0gB6NdMhJGvC
         278g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639748; x=1764244548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPbZ/MMBlqKL6sY5staimMEFjAxFe5tDcCF6a6LfuA8=;
        b=O8zEmq6rF1MBR2R951BmT+VkK4A3goQB8V1YC8p30Oo9A8eHXBDCjyf7fEg4wi7FIK
         6QA7F92617XgSAZWjHbjxHu64ZQr5TgsG2XktBEH5erruXomOJbz8XKznw8iL9j0VOC2
         tOHOENlkNkTk5maM30utuC/JH/pjAinnrxXnp7L7ZYGIoOyEb4WS5/t9o6K34Yh+FyAo
         Xs0aCZWjR07zDS2NJ1hgrmjzLip4AIBfQVk+dpQpKh1ZiZTSGeNDdSbunXWNgOUdpmyf
         Ea/2SfE/l1BitTyLZMMRJFliFq3mqTqLQxqguvD0qQtWGM/8XAAk9zpI3u6aPvEkL8Ks
         zb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjn9nch7p7AY7PQ3/MsK3uWPYOz10xnHjDk8fohwDosRckILMk7QMt0TQkFR7SK0POUglHT7Jencnt0DLorXGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwGeZp6qn5lL43mJA3kXrjP6V5QUl5/F8GFuevy4NI2msZe/PJz
	Ry81ihFg0sjfhv5HIz53MRAbmnBixYId5+m3M69l7eYRgmQlo39kjYwx6Dqi1RA9CGYrA4OrDmD
	4J5L/QAjFFfYIzJbi687MdXzjAc4mjOPptVJk1s28pQ==
X-Gm-Gg: ASbGnctQPzcQkojG1nW7CD62w1JIAV+YiowTCwEqw5un9NE1RSikAiFVtAmlJl9C9BG
	6/L4TV2bTqrcNWyJfdxuqz/vhZnevFecp7VVA/xvjPSob+J1YR35jf0kziUBvBY12x7+Px8+QzG
	D1rC0LLboCRWQmWqyv3AWaGlMDkvo0BLn1IXsg/9qnMuAxTxcorMKkLosLAhOqt0FyltE5O9JDe
	KQ6art54tgzLKlkDm1TiQ1YL/cfNEMlG0T8axEVTXPRDnqVdYwXIHl8svGiUmxu9mZNv1CRNMWT
X-Google-Smtp-Source: AGHT+IHpDeJMe8ZZtzxgLRCQKD7wqL6JmcD0Jn0lIo0MbFaZpxjcg4KZTbI05sJ0ZQ+i3DCKX3kGvRf9pRCNdR4FYfQ=
X-Received: by 2002:a05:6830:81db:b0:7c7:61f1:6fd3 with SMTP id
 46e09a7af769-7c78e4a1439mr1162694a34.9.1763639748262; Thu, 20 Nov 2025
 03:55:48 -0800 (PST)
MIME-Version: 1.0
References: <CACnXVncnu6Rnx64GemdBvxu+mTqYEMGePoR5OvaJh3gC4uG-NA@mail.gmail.com>
 <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com> <4a24df59-a209-4f2f-9465-f98482e83952@rivosinc.com>
 <00786ddb6d626442879072851d455bbd8ef1181d.d460d6ec.7656.4a45.8288.5b0b88825811@bytedance.com>
 <515d639f-7814-4104-b757-63c16429d325@rivosinc.com> <e8510685-3ed1-4350-b6dd-c997a3c74847@linux.dev>
In-Reply-To: <e8510685-3ed1-4350-b6dd-c997a3c74847@linux.dev>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 20 Nov 2025 19:55:37 +0800
X-Gm-Features: AWmQ_bliwpS4X7hu-IBEZeDyTTzJapuiXoirGj4l0lrExTNQEX06mlHwkGqRBpE
Message-ID: <CAEEQ3wmXGJz=aoWLWeGQBTb4w7=FJnVOsELgKz1Gs9NoChM01g@mail.gmail.com>
Subject: Re: [External] Re: How to Avoid Starving the Kernel When Using SSE
To: Atish Patra <atish.patra@linux.dev>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	=?UTF-8?B?6Lev5pet?= <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?5YWD56u5?= <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_035554_259705_3F9C5617 
X-CRM114-Status: GOOD (  62.25  )
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

Hi Atish,

On Thu, Nov 20, 2025 at 5:09=E2=80=AFPM Atish Patra <atish.patra@linux.dev>=
 wrote:
>
> On 11/18/25 12:51 AM, Cl=C3=83=C2=A9ment L=C3=83=C2=A9ger wrote:
> >
> >
> > On 11/18/25 09:46, Zhanpeng Zhang wrote:
> >> Hi Cl=C3=A9ment,
> >>
> >> It seems that your patch is based on the PMU-ctr-delegation version. H=
owever, I'm using PMU-SBI and the SSE extension of v8.
> >> So, I made corresponding modifications in `pmu_sbi_ovf_handler` as you=
rs in `rvpmu_ovf_handler`.
> >
> > Hi Zhanpeng,
> >
> > Indeed my modifications were based on Atish rvpmu series.
> >
> >> This indeed prevents the kernel from hanging during perf sampling, and=
 the sampling results look good. But according to the debug results, I thin=
k the problem with this approach is quite obvious. After this modification,=
 most `pmu_start` operations are triggered by `event_sched_in` rather than =
do_sse. That is to say, `pmu_start` is delayed until `event_sched_in`.
> >
> > That's the expected result, point being that the IRQ rate should be
> > throttled. Depending on how slow is your platform, overflow might kick
> > in faster leading to more throttling and thus delayed start of counter.
> > I do think this solution is the one that should be implemented since th=
e
> > overflow return value from perf_event_overflow() is exactly meant for
> > that (ie throttling IRQs).
> >
>
> While that works fine for the events that already overflowed, what
> happens for the counter that was about to overflow but stopped because
> the SSE event handler is called ?
>
> In that case, you may miss those events until the process is scheduled
> again. Depending on the frequency of the event that may be okay or not.

What if it's tickless and the CONFIG_NO_HZ_FULL configuration is enabled?

>
> We also need to think about if we need to handle such scenarios for
> other SSE event ? For example, a continuous trigger correctable RAS
> errors can end up in the same situation.
>
> Should we provide a generic sysfs mechanism for users to disable this
> SSE event ? By default, SSE event would not be throttled but an user can
> opt in for throttling by writing to the sysfs.

Other architectures such as x86 and arm64 do not need this option, so
RISC-V should not need it either.


Thanks,
Yunhui

>
>
> > Cl=C3=A9ment
> >
> >> Actually, I'm also planning to try Atish's PMU-ctr-delegation extensio=
n, such delegation optimization seems to be helpful to alleviate the hangin=
g problem. But I think this is no longer the same issue, as it requires com=
prehensive modifications to the hardware/qemu, kernel, SBI, and Perf itself=
.
> >>
> >> Regards,
> >> Zhanpeng
> >>> From: "Cl=C3=A9ment L=C3=A9ger"<cleger@rivosinc.com>
> >>> Date:  Fri, Nov 14, 2025, 23:41
> >>> Subject:  [External] Re: How to Avoid Starving the Kernel When Using =
SSE
> >>> To: "=E5=BC=A0=E5=B1=95=E9=B9=8F"<zhangzhanpeng.jasper@bytedance.com>
> >>> Cc: "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<palme=
r@dabbelt.com>, "linux-riscv@lists.infradead.org"<linux-riscv@lists.infrade=
ad.org>, "linux-kernel@vger.kernel.org"<linux-kernel@vger.kernel.org>, "lin=
ux-arm-kernel@lists.infradead.org"<linux-arm-kernel@lists.infradead.org>, "=
Himanshu Chauhan"<hchauhan@ventanamicro.com>, "Anup Patel"<apatel@ventanami=
cro.com>, "=E8=B7=AF=E6=97=AD"<luxu.kernel@bytedance.com>, "Atish Patra"<at=
ishp@atishpatra.org>, "Bj=C3=B6rn T=C3=B6pel"<bjorn@rivosinc.com>, "=E5=B4=
=94=E8=BF=90=E8=BE=89"<cuiyunhui@bytedance.com>, "=E5=85=83=E7=AB=B9"<yuanz=
hu@bytedance.com>
> >>> On 11/14/25 14:36, Cl=C3=A9ment L=C3=A9ger wrote:
> >>
> >>>>
> >>
> >>>>
> >>
> >>>> Hi Zhanpeng,
> >>
> >>>>
> >>
> >>>> On 11/14/25 11:24, =E5=BC=A0=E5=B1=95=E9=B9=8F wrote:
> >>
> >>>>> Hi Cl=C3=A9ment,
> >>
> >>>>>
> >>
> >>>>> Lately, I've been thinking about how to avoid starving the kernel w=
hen
> >>
> >>>>> using SSE:
> >>
> >>>>> SSE is powered by M-mode irqs such as M-mode PMU irq for perf sampl=
ing and
> >>
> >>>>> M-mode IPI for inter-hart injection. Meanwhile, kernel is powered b=
y S-mode
> >>
> >>>>> irqs, so the kernel may experience starvation when there is a flood=
 of
> >>
> >>>>> M-mode irqs, and kernel may cause such flooding of M-mode irqs when=
 using
> >>
> >>>>> SSE, either deliberately or inadvertently:
> >>
> >>>>>
> >>
> >>>>>     1.  Malicious SSE handler: Kernel may deliberately register a b=
ad SSE
> >>
> >>>>>     handler, which triggers a new inter-hart SSE request via ecall.=
 This will
> >>
> >>>>>     cause an endless loop of SSE, rendering the kernel unresponsive=
. In this
> >>
> >>>>>     case, the only thing SBI can do is to prevent the nesting of SS=
E in
> >>
> >>>>>     `sbi_trap_handler` and ensure that SSE events are executed in p=
riority
> >>
> >>>>>     order.
> >>
> >>>>
> >>
> >>>> That seems quite convoluted. Anyone that can load a module can do wo=
rse
> >>
> >>>> than crashing the kernel :)
> >>
> >>>>
> >>
> >>>>>     2.  Perf sampling: Kernel may inadvertently choose a bad parame=
ter for
> >>
> >>>>>     Perf, which causes PMU irqs to occur too frequently. Continuous=
 PMU irqs
> >>
> >>>>>     will leave the system with no time to respond to S-mode irqs.
> >>
> >>>>
> >>
> >>>> But this one concern however is valid !
> >>
> >>>>
> >>
> >>>>>
> >>
> >>>>>   Hence, I think we are supposed to improve the SSE framework to av=
oid
> >>
> >>>>> starving the kernel so easily.
> >>
> >>>>>
> >>
> >>>>> Here is a case study of perf sampling:
> >>
> >>>>> When using PMU-SSE for Perf sampling, the kernel may hang and becom=
e
> >>
> >>>>> unresponsive due to the PMU-SSE loop. Once we start to process a Pe=
rf
> >>
> >>>>> sampling using PMU-SSE, the kernel may fail to respond to `Ctrl+C` =
or fail
> >>
> >>>>> to exit after the timing of `sleep 1` completes (these are the two =
most
> >>
> >>>>> commonly used time-based sampling methods in perf).
> >>
> >>>>>
> >>
> >>>>> By default, perf uses a relatively high sampling frequency, namely
> >>
> >>>>> `perf_event_max_sample_rate`, and will adjust it on demand if sampl=
ing
> >>
> >>>>> takes too much time. If this frequency/period goes beyond what syst=
em can
> >>
> >>>>> handle, it will make SSE events connect end-to-end, and the system =
will get
> >>
> >>>>> stuck in an endless loop of "SSE =E2=86=92 PMU interrupt =E2=86=92 =
SSE". The kernel is then
> >>
> >>>>> starved (at this point, if you print the `sepc` of SSE completion, =
you will
> >>
> >>>>> find that the `sepc` remains unchanged each time, indicating that t=
he
> >>
> >>>>> kernel is stuck), and the kernel can never escape from this loop of
> >>
> >>>>> PMU-SSE, because it can neither respond to Ctrl+C interrupts nor ad=
just the
> >>
> >>>>> sampling frequency.
> >>
> >>>>>
> >>
> >>>>> Current solution: The key to this problem is that every time we fin=
ish
> >>
> >>>>> sse_complete, there is already a new PMU irq pending. Then we resum=
e the
> >>
> >>>>> kernel execution via mret, and the system will immediately trap bac=
k into
> >>
> >>>>> SSE.
> >>
> >>>>>
> >>
> >>>>> The PMU-SSE-Perf processing flow includes the following steps: `sse=
_inject`
> >>
> >>>>> (mret to SSE handler), `pmu_stop` (clear PMU pending bit), `pmu_sta=
rt` (set
> >>
> >>>>> a new value for PMU counter), and `sse_complete` (resume execution =
to the
> >>
> >>>>> point where the kernel was interrupted). The reason why kernel trap=
s right
> >>
> >>>>> after `sse_complete` is that there is a new PMU irq generated betwe=
en
> >>
> >>>>> `pmu_start` and `sse_complete`.
> >>
> >>>>>
> >>
> >>>>> In order to address this issue, we propose to delay the procedure o=
f
> >>
> >>>>> re-starting the overflowed PMU counter during PMU-SSE. When kernel =
triggers
> >>
> >>>>> an ecall to restart the overflowed PMU counters, SBI can check whet=
her it
> >>
> >>>>> is SSE-powered PMU handling. If so, we temporarily modify mhpmevent=
 CSR to
> >>
> >>>>> stop counting kernel events. In this process, M-mode events are alw=
ays
> >>
> >>>>> inhibited, and U-mode code will not be executed during the
> >>
> >>>>> `pmu_sbi_ovf_handler`, so we only need to inhibit the counting of k=
ernel
> >>
> >>>>> events.
> >>
> >>>>
> >>
> >>>> I'd rather let the kernel control the PMU SSE event delivery by mask=
ing
> >>
> >>>> it at the end of the SSE handler and reenabling it later. Additional=
ly,
> >>
> >>>> that solution being in the SBI itself, it does not guarantee that al=
l
> >>
> >>>> SBI implementation will actually do that correctly.
> >>
>
> I agree. The solution has to be implemented within Linux kernel rather
> than in the SBI specification as it is a problem of the SSE event
> handler & user (in this case where incorrect sampling rate is used).
>
> >>>>
> >>
> >>>> What seems odd is that the perf_event_sample_took() call at each end=
 of
> >>
> >>>> PMU event handler should actually allow perf subsystem to throttle t=
he
> >>
> >>>> rate. I'll take another look at that part to make sure it works as
> >>
> >>>> expected and that we aren't missing any bits.
> >>
> >>>
> >>> Hey Zhanpeng,
> >>
> >>>
> >>> Could you try to apply this quick'n'dirty patch on top of the SSE ser=
ies
> >>
> >>> and check if it still hang ?
> >>
> >>>
> >>> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_de=
v.c
> >>
> >>> index 7dec9c2afa9b..0fb8749c476f 100644
> >>
> >>> --- a/drivers/perf/riscv_pmu_dev.c
> >>
> >>> +++ b/drivers/perf/riscv_pmu_dev.c
> >>
> >>> @@ -1326,6 +1326,7 @@ static irqreturn_t rvpmu_ovf_handler(struct
> >>
> >>> cpu_hw_events *cpu_hw_evt,
> >>
> >>>          int lidx, hidx, fidx;
> >>
> >>>          struct riscv_pmu *pmu;
> >>
> >>>          struct perf_event *event;
> >>
> >>> +       int ev_overflow =3D 0;
> >>
> >>>          u64 overflow;
> >>
> >>>          u64 overflowed_ctrs =3D 0;
> >>
> >>>          u64 start_clock =3D sched_clock();
> >>
> >>> @@ -1423,13 +1424,15 @@ static irqreturn_t rvpmu_ovf_handler(struct
> >>
> >>> cpu_hw_events *cpu_hw_evt,
> >>
> >>>                           * TODO: We will need to stop the guest coun=
ters
> >>
> >>> once
> >>
> >>>                           * virtualization support is added.
> >>
> >>>                           */
> >>
> >>> -                       perf_event_overflow(event, &data, regs);
> >>
> >>> +                       ev_overflow |=3D perf_event_overflow(event, &=
data,
> >>
> >>> regs);
> >>
> >>>                  }
> >>
> >>>                  /* Reset the state as we are going to start the coun=
ter
> >>
> >>> after the loop */
> >>
> >>>                  hw_evt->state =3D 0;
> >>
> >>>          }
> >>
> >>>
> >>> -       rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
> >>
> >>> +       if (!ev_overflow || !from_sse)
> >>
> >>> +               rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
> >>
> >>> +
> >>
> >>>          perf_sample_event_took(sched_clock() - start_clock);
> >>
> >>>
> >>>          return IRQ_HANDLED;
> >>
> >>>
> >>>>
> >>
> >>>> Thanks,
> >>
> >>>>
> >>
> >>>> Cl=C3=A9ment
> >>
> >>>>
> >>
> >>>>>
> >>
> >>>>> In this way, we can ensure that `pmu_sbi_ovf_handler` will not be
> >>
> >>>>> re-entered by the new PMU-SSE, and minimize the modification of per=
f logic.
> >>
> >>>>> The price is that we gave up sampling a small portion of kernel cod=
e(from
> >>
> >>>>> `pmu_ctr_start` to the end of `pmu_sbi_ovf_handler`), and we probab=
ly need
> >>
> >>>>> a new parameter in `pmu_ctr_start`.
> >>
> >>>>>
> >>
> >>>>> Looking forward to your suggestions. Thanks!
> >>
> >>>>>
> >>
> >>>>> Best regards,
> >>
> >>>>> Zhanpeng Zhang
> >>
> >>>>>
> >>
> >>>>
> >>>
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

