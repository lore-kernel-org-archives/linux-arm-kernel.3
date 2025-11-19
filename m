Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD5CF34B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=; b=2+X41kBLu+lBsw9ZH953gewUva
	QUDKQ/IG8u/0f+mEBps68hm8Ra8fwTCQcAC1a/vMNRk4oeo5qjyPvzbmmMTAvRmrKRz9BdXNaszpp
	79f0Fga618Kl2vXHOikr1H6E0RMZXqlN4M+IAht7StY+u/Ar4c308an9AGW4a9Nsl5HoAPwe1fcg8
	hI5DycYO57AEtxXYEL8bHG8M3okniKD5PigAzujEiGkEKLWy3TfAMAIrnvDl9Lx46zvm8S/zvhisA
	+6ALO0WrKTC/vfEusGxKLrFr7NCH4vIacym/QNh9FX8H2Yq8V96ZmpamiBqBxgxE/8sv3kXTogWHi
	LdQDMMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLioj-00000003LK0-1piO;
	Wed, 19 Nov 2025 14:05:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLioh-00000003LJU-1JtD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:05:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b713c7096f9so890602766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763561149; x=1764165949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=;
        b=IP7oZl12CboWgJyhRietNEmQk6CP96jbv4dSrM9OHj2/Juz2rUMbBaOkJwikFIhfrh
         fLTeei4Q8UfMcgro9fqKPfvSlrXVFYDaLe3NjV3VnIAm40wzCY07hgJ111/1GziAK6j+
         +656APkqHwFFnI/dwwerkAq7iYf/lfv1WvN1nMdCSneIqnjVYgg6L8NLUgNwlOizPANZ
         zE+sE699WTIATqgns0WHc/0YONxz2P/Usmj6gW78f4m0FD9J246ggknwt8YktqqaItXZ
         hq98f6csMVPKwgWW8rHewuSV6Ua5JjVFCizvJneJP0Gj4C4Z1KBPaO4G39rqnTBfIu9k
         xusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561149; x=1764165949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=;
        b=chi9jmh+2OTB4Yhhl+7121Bb3VuA2+Q7CdXw0DC32jNsLv/86pol8uqnB5QHSikBo6
         OQpPqEskZmlAiNLEBzjQR60fsEmD63KP9hiC1L/USSVKiqJQfspr6y/WMntFzxVMtkxC
         uoRfmcxUJD2EgavYQeYASubkVocl/qyaXQw11xXRczt2HM+GsbEHD48+rYjbUcYCD2qT
         u9M0XmpIrMOGtjYrbgo3DqklMheRSRk2LdjAJIabk0nU6jrDBJD5/phMCPwDczaWgvPU
         74VnQ8GFj7PQcZpk8/uVehA2WDd5n+gmGNRiCKiUtZeE+FjGvgJ6yLD/6hvR1JNC9jib
         HsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx+JhnKVn8SC484Hbw9+j3pVgM6TdUtQyYWhleFtiTAXKzwnfmGMCiZka+z9l3Hc0NKG+rnt3zodaBVnuHlt4o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzma0jw2ep/LbFLZsTWM1+5SHaxJojdeet6xmUc9kvHrMhAdSsO
	haT1J7DqngtLzJDBmQP3VpiePMGBdQ90bc7zL32RrMbZlJJN3rfB+gPvHYyEMSN815xc0p2Iqb8
	Cke27rSWXtd/bBv8Z73pCFU98AwzG/aw=
X-Gm-Gg: ASbGncuKO/dUe2SYGbuZQdfPWNJSlwhZ8THUqJBsIBA8Ee6rYdoREugjACxkhm8yFYi
	krIfD0gnpVs/XqKbNEHvIfJhMtFtwear6JsaCLHx2JGM8UZJuTYDODaePTAf73J2pABiB3kJFkT
	MKYHVXMnyAxmFjglDlbgWY6Hr7j+5ynZcCYuLFkIzHYO6JwfrE/RZiAVT04A29scMe4ZUOONYF5
	Uebum8PRi8Q1Al/ugpbsMCwwlVUKpTuuL5uG2P625gb/Kzdzzws4YJpRLlK5Sa2OgeHdPyqJbBF
	J9eiPlGmfAwRkrewI7bddm83c90Qog6fmxeQdlFLPr/3Tp3OZV004KeWXEzFXumvUPYMo4L66Ej
	/w8/3lg==
X-Google-Smtp-Source: AGHT+IG8awJqy+8Ui6cefioX+4jm3vcNE88fJTiAMy61wvD7oGhSHtnMD+PT7NnOtEIiRkUEf89EKMIWq7eejZMxgBc=
X-Received: by 2002:a17:907:7e9c:b0:b73:a0b9:181a with SMTP id
 a640c23a62f3a-b73a0b927b2mr1144919066b.54.1763561149008; Wed, 19 Nov 2025
 06:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
 <aR27HcbvUgvCEK2Z@xhacker> <aR2_GVi6E5gLeS47@xhacker>
In-Reply-To: <aR2_GVi6E5gLeS47@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 16:05:12 +0200
X-Gm-Features: AWmQ_bmmJ9JQn42u_VLQ6DVd6n4Jc0ZCk1wPnB_lbNfGkoqWEByKgBUa10U4KmY
Message-ID: <CAHp75Vd8ODnr+GE0kxvZ+anR31Fyou9g-zT6HC7BSARhoKD4vg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_060551_371028_8C3366E9 
X-CRM114-Status: GOOD (  34.00  )
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

On Wed, Nov 19, 2025 at 3:17=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 08:42:05PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel=
.org> wrote:
> > > >
> > > > Use the modern PM macros for the suspend and resume functions to be
> > > > automatically dropped by the compiler when CONFIG_PM or
> > > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > > >
> > > > This has the advantage of always compiling these functions in,
> > > > independently of any Kconfig option. Thanks to that, bugs and other
> > > > regressions are subsequently easier to catch.
> > > >
> > > > The dwapb_context structure is always embedded into struct
> > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/risc=
v
> > >
> > > SLEEP
> > > grepping
> > >
> > > > dts dir, the max port number is 6, the berlin2q soc families, so th=
is
> > > > means current we have wasted 216 bytes memory which is trivial
> > >
> > > currently
> > >
> > > > compared to the system memory.
> > >
> > > I still think the embedding is not related to this change and should
> > > be justified in a separate patch. W/o that part the rest looks fine.
> >
> > I got your mind now: it looks like you prefer a seperate patch for the
> > embedding. Let me explain why I have the embedding within this patch:
> > the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but=
 the
> > PM funtions are still compiled, so w/o the embedding, it's impossible
> > to clean up the code with the modern PM macros.

It's possible, but it will require some other refactoring most likely.

...

> For dwapb, I can still acchieve the clean up w/ only embedding the
> pointer. But I'm not sure whether embedding the struture deserve a sepera=
te
> patch.

> BTW: as Michael mentioned during v1 review, the driver allocates the
> struct with kzalloc and stores a pointer to it, so considering the
> pointer itself and the kmalloc overhead/alignment etc, current gpio-dwapb
> have an overhead in the same order of magnitude when PM=3Dy

This is a good point. Was it mentioned in the commit message?

...

Okay, I am not going to tag this patch, I leave it for Bart to decide,
but I don't like the idea of blowing the run-time memory footprint
just because we may need it in CONFIG_PM=3Dy case.

--=20
With Best Regards,
Andy Shevchenko

