Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2E2C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SULH9E6OfOiuOFSn6JwiJGJUziMTX0yhjWJBPUXREo=; b=xXNrNTvs0yHEN6L3jxuDwzLSRw
	T7HYHwsgewrDgY4WNVSjCMt56RUK0i6rIIj/58rY9ge7C5rEBZYnV8b9NmyZet684RmgWaf+LF1Mr
	aEIwAJMvTQE6uZg5X8gUCPAMJkjG6d+DpUmaNyqH9ofFz+g17LelkJn/BkI8ShxhKAYGdWXCIyXNL
	r8dfSdw902RKLkUzGgq0iFLR4v1eeB+mAij0My1CYxqs/GNNYM2ksiekO0Ay69r17WyXB/tKz/y3E
	qRwSqSFk8U5ZEwnCX1PhLNJyQslkKUNDlMN8BGSwZllxCwiC1AY2wysslx5Jd+jcle2wfLz+ZnETc
	PQVfc5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aW0-0000000AfgY-11DI;
	Wed, 23 Apr 2025 13:51:52 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YyZ-0000000ARZd-0Bdn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 12:13:16 +0000
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47688ae873fso65621021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 05:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410393; x=1746015193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SULH9E6OfOiuOFSn6JwiJGJUziMTX0yhjWJBPUXREo=;
        b=M07wPLTcO/utOUq9z2tK5Jkpt8URBFpE/SvC81kqixgGJam/ksX/z5QlUy47L50ZSo
         Gnq4t3++wxYESQ289xm3GYPRpsqwcE0Ofwyg9dd3Lv/ZsjA0M8Ri7gLbTWSZ88GaqSvV
         AozUbPAM6snA2HejsxcINuFI8gSrYwyn0MGpPEjj6MqucLYPmsYf1d5VDitujZ4m5SV7
         mJNbRodS1J9c520vOj1dRsENBp7e/AUY8lCSUgXRcHCMsxekrBEPfQqsB+dw0IWPbgxx
         uRkCssLuE7l8Lz11C4owga6b90qWAP4mmyG55FmY73r4JTYKyTFUEa0mJUtaYoFBxm2m
         Kncg==
X-Forwarded-Encrypted: i=1; AJvYcCUo15F7aTaWZiAspyAfwSR3f/3zd9JINpV8583Z2iL3z8h/hW0JcLG+qJmOCfUPUUpzG8U/Uqj66ALgHCysrGYk@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRebjvC4hX/eBOomhNzIyHZDDmnYfsJ6ma34rC/Et8PACbNbj
	BsKZS9RwcGEVJHRrSSsJtG0Wbvxt7qxq4nrqxNfgIsjRaMFtVZdKaecYMFJj6cQ=
X-Gm-Gg: ASbGncu8KyOLn5WtBVN9XFkRYq4yttkRe+RUGclQQoNL1J7y/5aXwtj0vPRgLiA/JhA
	JSTNcY5wGzBdwebBBUQtMoJz4RIsvulptN+KWoexbJx8wZBTp/fcGf0UU1oxU/D7XHn1rsoMUlZ
	65GKse/1Abgj90248UDkKgDLoaUltbhDOIOnaZgvZRVvTEUVZIbKUCi3ubFBJW5OYz5Y8dS7WHc
	IRPtXK40mmGYPsFH05tUYyFRQL74r8GbhNpvZUmbdICjlnDg+Md4/ryajDEHUEhknwCSfTLOdqy
	hpYbYf48HijqTXD3EtaKSRjWGritYChhhoyRj9gub0z0DqW0Nic8fgo3DDap1eaGybewul5QeoM
	R20v8KZ5o9IJy2P8zCA==
X-Google-Smtp-Source: AGHT+IHBMzgBIrXlVUkJKs+KdSgFhy/JUQqaklAD5B9nO2KfTcUTldqEkEaF7gQMGyQ6dOPvu9VM9A==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7c9280402dfmr3052754485a.51.1745410392927;
        Wed, 23 Apr 2025 05:13:12 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a70768sm675256685a.23.2025.04.23.05.13.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:13:12 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c56a3def84so588613385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 05:13:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXM3m5xf1X+Wca4FBHeal+KuS23Fq9OIS9tWJ9lR+J/mNcVl1d7UtsaDCHfyjfW74rrhxXFqBQrvJR5JJKztJjM@lists.infradead.org
X-Received: by 2002:a05:620a:43a2:b0:7c5:cd33:4a90 with SMTP id
 af79cd13be357-7c927fa921dmr3570344985a.25.1745410392288; Wed, 23 Apr 2025
 05:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com> <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
 <aAjTg8dgvxqLQOwQ@vaman>
In-Reply-To: <aAjTg8dgvxqLQOwQ@vaman>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 14:13:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
X-Gm-Features: ATxdqUF4pJfouZNL-puYMjM6qiO82pNopTK5v4xVxIphHVZ_AGt4pYzszuXDaAQ
Message-ID: <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Vinod Koul <vkoul@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_051315_087139_571ABC25 
X-CRM114-Status: GOOD (  27.15  )
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

Hi Vinod,

On Wed, 23 Apr 2025 at 13:48, Vinod Koul <vkoul@kernel.org> wrote:
> On 23-04-25, 13:11, Geert Uytterhoeven wrote:
> > On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
> > > On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> > > > The Arm DMA-350 controller is only present on Arm-based SoCs.
> > >
> > > Do you know that for sure? I certainly don't. This is a licensable,
> > > self-contained DMA controller IP with no relationship whatsoever to any
> > > particular CPU ISA - our other system IP products have turned up in the
> > > wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
> > > wouldn't either.
> >
> > The dependency can always be relaxed later, when the need arises.
> > Note that currently there are no users at all...
>
> True, but do we have any warnings generated as a result, if there are no
> dependency should we still limit a driver to an arch?

I am not aware of any warnings (I built it on MIPS yesterday ;-).
It is just one more question that pops up during "make oldconfig",
and Linus may notice and complain, too...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

