Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7057D1D866
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGcGdJQ4d2lSMQGLwi6l+oRPZTLZMjA9uQc8WfswYHM=; b=OpuG16ORiI6GBoWRuxvidRrALp
	Jn2IogCm/15UWoCLOWMC87mehh9FO3KXQOrvOiTcTfCdkhNgIgkb8zmqfwaUKB/GsZQ/xzUYmKwFG
	coW0lCQDIvnQBhlSZesice+jiUoFMTA+uWpsc1XA+JzB2wq8CLUoRByY5ji9kZaHHl3hn8d9H5cid
	/Cy/Ui67q5+QtPhwD7jz1pYIZGIx8SB2vb7nHjF1NBrWx/uuN7dgfw/OLGF5peFm/2o6KSMR+NlYV
	UTtUdtLk7nEW57/M5SEXXZf8ooqlcw2MQLaK088oVg3orglyz6kKjtHDbNv8/vpxNjNOfb8bBk/hO
	RSsdsUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1tl-00000007V7f-0KsO;
	Thu, 04 Dec 2025 05:29:01 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1ti-00000007V6d-2HYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 05:29:00 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-44fe6771b2dso124311b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 21:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764826137; x=1765430937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGcGdJQ4d2lSMQGLwi6l+oRPZTLZMjA9uQc8WfswYHM=;
        b=YkGFFSQxDPTy6HF4xU6FU7hqAFjdRlDmdjxim6KAY+iDfz2jJsvE1eb1g5nwXsyV53
         QjpX+v3SCuDoQSbtuOjBtJPmCBmB4VhFHtb1edEK5kEuXWmbeVgqkzzY3JLWlK2DLUUx
         QdWnft95SWJO87d/VrL7yLOfCIFpR4DtSJcjnvhet/IqGCJIcQUsTMwdAm5gvsVewbTr
         XA3T4Fi7bmH/oNOLMpP4r8xP31z6sEEvtACCNs36BMEHS9OqLUBZchCcjesvHCRg3zqu
         RpnrMsn6QF3wTB6NmxNPMKSHmlXiNaoIaflaRCcYlt0cCbcYMVQQudjjF+/DpZwxQefp
         uBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764826137; x=1765430937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGcGdJQ4d2lSMQGLwi6l+oRPZTLZMjA9uQc8WfswYHM=;
        b=soiv9ThKBLB96Tck+vVpiBCaHZuSqqyaKU8SX2atCiGjL2x/+zs8XjaBiCb9feipyR
         vr0Bjm5ZEIM8mPGQezCFoKi7oD+pmxUBEEKA2gfVriAs/IHcbejt7PctrXilNTALjy2z
         pD/k369qsV8AIs+mzoeKnlRqqafsbccqE8CXlK0nfzFf34WPeMryIj82bxCYWjD8xVUJ
         lElHSWuhIJkMOtUrS6djM+g21Vww/wAWp4JS25G5arMFA530ZCccT4SHHYnWa7rI9CoH
         YT+/ihrTCBMsJ+DXPeusotTKRxIEicNZ4lEIap/pyEzM0xHXnJzTVsG2tV8VKSXP+4YZ
         wDWA==
X-Forwarded-Encrypted: i=1; AJvYcCViez1+syQxEuZrimPpioJQ2VlrP4JMgrxNW3fcbiWdFefi19XXWQ8o3Un6PoSn7teTJb59dFttDMyrjqbZ2eE+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj+j8Aj8UeIMzg1Q4FvI9inKthlBkAIHNeTEvDaV+T7TFJ4Nfy
	VYNDsD6TqSGmOR4upHY37dXy2R6k9nfxRv7c+SlyKLCTZAhUlZp7QrKk+dl7dmHQilt+O/PJx+Q
	Y0ibe5CqAkO680XPkiOB5KIU54rpAyzHBysW6RIhSRg==
X-Gm-Gg: ASbGnctvcR2YsP6WCa1M668yo5gLqTQ9gTlLATvlvlDJswioBhPnQwZ+s8NJl/yAXQt
	UxMj1GUxxTPirndq0RPkrQAT68/LQQ5k43QUDAOffJbuHC+oyhzsP7oaxuBw3/mjDCefYfGb8PE
	oArfKB3+zWSXWy6Xql2N3AsXiQKqqiDfEnI2Lnp9i24PRd/XGCpnP2jczRST1HUUnAkVZZJrh7G
	XO0hrez2pacL3RBMQqusoLFrqNy24sPGujudBleqPU6Vg7MclAW1tBVnUK9n+CwjG6HG2H5Ue8=
X-Google-Smtp-Source: AGHT+IHPXO4mJt6XFTl0jVeuamRWHb5DefXnFnY2jPbicVsNKKRdQsCgbNBsmbzVUe+uXweaiUokpDpWwGHff2RkRUM=
X-Received: by 2002:a05:6808:10d5:b0:450:44b9:68e0 with SMTP id
 5614622812f47-4536e3de274mr2882636b6e.11.1764826137356; Wed, 03 Dec 2025
 21:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
In-Reply-To: <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:28:45 +0800
X-Gm-Features: AWmQ_blKLNMUWj4oLV3fkP9gPW-qpOON3cyf_xYq6m6lr9r97yBqEg-AEwpXlh4
Message-ID: <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_212858_579575_8FB7BB44 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Radim,

On Thu, Dec 4, 2025 at 12:07=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> > Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> > diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/=
riscv/riscv_sse_nmi.c
> > @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, stru=
ct pt_regs *regs)
> >       type =3D atomic_read(this_cpu_ptr(&local_nmi));
> >
> >       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> > +     NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
>
> Please document the intended preemption design for all SSE events,
> because it will be a nightmare if we forget some assumptions in the
> coming years.  (That includes the relative priorities of RAS/PMU/...)

Actually, LOCAL_NMI_CRASH, LOCAL_NMI_STOP, LOCAL_NMI_BACKTRACE,
LOCAL_NMI_KGDB, ... are all implemented via the single SSE event
SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED. Per the SSE design, no
preemption will occur among CRASH, STOP, BACKTRACE, and KGDB events.

>
> Thanks.

Thanks,
Yunhui

