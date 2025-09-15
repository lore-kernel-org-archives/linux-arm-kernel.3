Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C573CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO6IHIraaA33AzZrGgraDPlur/2l0PmDTVZQ4KAkd3I=; b=zG/uN5hOu5+05VuebuUqq+UBKK
	+qQa61nHvSLOuQAPtilC+45XgTFhJxzuMQXwX55Y2Kwta+tjnBBQdGZEwgNKKw7Jlr5IgAoDKp6cI
	kuBRPbYryt0sbNQ7hRlPkQO+5gwwkuhxxTwHv3ofX0yExrppGFvkB/QqgupUYN4nzApNw8e3EsS3m
	t8SPufWJrdTc/3LIT6qp6lTn8Lrd0Wq2Bkb3eKE3kFdDf/68G/ecwjSZkvVc7wV/Jn3m762W5Z2gw
	siQBqQodf2JgDZ0nVvAmb475pxX4zlMTOtKK3dhGlGRkhFepeWaIaTnkRPP5bDAbswzGNNVcNKQB6
	bZh9bCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxySQ-00000002W6v-3sKS;
	Mon, 15 Sep 2025 01:56:42 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxySN-00000002W66-1lld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:56:41 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-30cceb3be82so2699563fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757901394; x=1758506194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO6IHIraaA33AzZrGgraDPlur/2l0PmDTVZQ4KAkd3I=;
        b=HGN14kcGpEpw73GHXWf3s+1jeh8bl5y+1GYL6mDFTUSHD130zrKgPZGysM4AzGwQkl
         y55ZnfOyAJtcmox3nEPzidLTA1pf6f+p6c0IFCcNe85e7lQylySzcfgIFfiDlS/kxzDC
         K2LQu/IEcQ/Onjyo0sHjVefLSuvgV3oVzWIFJngvNnSqt2qKk6LregcCVgumfzstYgzo
         2F+2uWrtIl+a44zMWU7nhtDH+ALULSi8uWYiVsW7zuvSMnL2UcIdN+W1fb3/5YEwzkYl
         gbiKj5KTYi1arYRchPk0e5N/5UM0V/01SyD3PMUgzI9OH7jIcYE23saxH9IWn9mlbkdu
         G2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901394; x=1758506194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BO6IHIraaA33AzZrGgraDPlur/2l0PmDTVZQ4KAkd3I=;
        b=DyhUeArG2Zc65v3FDmPTizSVJq+uIFrjTYpVncaTr+FQv12zrr/Gl043Wj4y8BuPjB
         SJhVe6nve3O3zcvg4D6NP65nSvdaUDPFTE63Rh9Xj1HDXfjYSTzciFSrqiE5FbyvshBo
         PDE4tarAcqSeRVEmuv961p68jIuN/a/yoKKCMINV2fegjX0p9lFcHEEUCNDOgh2IbahD
         ltm+c7blpa5lDkDVrme32RhQ7JYeXarz5Su2YlWd2PT9i6pIA8HOvPqkwyRzlYKl/Dm5
         RmCx700li1b+Vv1cGPf0eahPVID1+eKycklSa6myGyBCIxy0U6J+5EnOKBP81ykxfbWH
         drFA==
X-Forwarded-Encrypted: i=1; AJvYcCXvAwfGQ7GgH2No4XLqVvl7V8DZuMTWkO7/cOU6eBZ2gtB5kfo39D6bnrMTX1sWbxVZgfrv45bdyv6aTZrs8UwG@lists.infradead.org
X-Gm-Message-State: AOJu0YxKyhXdflgHM3ululM+er7+/cV6ELRjDabvyvf1qqA/yMeWMjBS
	Cf4X3Qs6IjHvS7d5gfc+CY36+L9VI/jHheOMFw3KTs3kW823BJC9K0D/HdFcVeJqpWmlQCFQ6vJ
	EaVNT1T/+85mwxwquWnR0gJlvsPFeNzJmh/oprB3AbQ==
X-Gm-Gg: ASbGnctXudG6j5sAnb8gwRo4RwamHt4U9BTYammpCyeWbhBCVY5nYSBSMVdpsyAdK+J
	Wm0PNX5umjmC7eDHTMOaizJ3oLL8jNTZeyGHGXLtbY/qW9UhxOGGY5aqSzCEskPQJf89/2Ihxwy
	Lgza5CQIxRCTCdKQ2bWOy1f4ksgZcx/etwNUwSUkYpD1aicCHHjmAJZ0YnNPvEiQG4vLlCSWPPE
	o/MXYA1IjoOD8WC
X-Google-Smtp-Source: AGHT+IEzxKXkgKqnV741v0vWC49ZtgXVeKwHXnAtJZiM2Qjz2M2QceURl7ZTg3slF5Ghl+7/2KbprcKdhFECr+rtPe4=
X-Received: by 2002:a05:6871:4149:b0:31d:8c7b:401d with SMTP id
 586e51a60fabf-32e56dc007dmr4929305fac.46.1757901393993; Sun, 14 Sep 2025
 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
 <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
 <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com> <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
In-Reply-To: <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 15 Sep 2025 09:56:22 +0800
X-Gm-Features: AS18NWB5q8BMOMaL4qJUD7HTlg6i3YBaukDHZMMVfaFmVYmSZ3j_z8EethM99sE
Message-ID: <CAEEQ3wn2FfgzKq-vwt5m=Xy5NThrGkZaY4=U45QmN4JzJG8Rng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Ian Rogers <irogers@google.com>
Cc: Doug Anderson <dianders@chromium.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atish.patra@linux.dev, 
	anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, masahiroy@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	mingo@kernel.org, lihuafei1@huawei.com, akpm@linux-foundation.org, 
	jpoimboe@kernel.org, rppt@kernel.org, kees@kernel.org, 
	thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185639_665066_2D0715CB 
X-CRM114-Status: GOOD (  27.51  )
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

Hi,

On Mon, Sep 8, 2025 at 7:15=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Fri, Sep 5, 2025 at 4:57=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 3, 2025 at 4:56=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> > > I=E2=80=99ve read your linked content, which details the pros and con=
s of perf
> > > watchdog and buddy watchdog.
> > > I think everyone will agree on choosing one as the default.
> > > It seems there=E2=80=99s no kernel/watchdog entry in MAINTAINERS=E2=
=80=94what=E2=80=99s next
> > > for these two approaches?
> >
> > I guess to start, someone (you?) should send some patches to the list.
> > Maybe one patch to make buddy the default and one to change the
> > description of the "perf" lockup detector say that its usage is
> > discouraged, that it might be removed, that people should use the
> > "buddy" detector instead, and that if there's a reason someone needs
> > the "perf" detector instead of the buddy one then they should make
> > some loud noises.
> >
> > You'd want to CC folks who were involved in recent watchdog changes
> > and make sure to CC Andrew (akpm). If folks react positive and Andrew
> > agrees then he'll likely land the the patches and we'll have made
> > forward progress. :-)
>
> +1

Okay, I intend to directly send a patch that removes
HARDLOCKUP_DETECTOR_PERF, and then we can discuss on that patch.

>
> There are also things like /proc/sys/kernel/nmi_watchdog being used to
> enable/disable the hard lookup detector. If we could move that to a
> unique file so that perf is less confused in places like:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/tools/perf/util/util.c#n70
> ie. perf shouldn't warn about the NMI watchdog being enabled and
> taking a perf event when it doesn't.

Okay, let's first take a look at the status of the discussion on the
patch for removing HARDLOCKUP_DETECTOR_PERF, and then we'll modify
this part.

>
> Thanks,
> Ian

Thanks,
Yunhui

