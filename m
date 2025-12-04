Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DCD1CDD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 05:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynb1Pz7S4Rh+mM2HiZZ5on0pKnh8R/gdfodATPNKL0A=; b=o3T/s6mGU2mSVM00u/Yt3z3ClU
	JLwpYGI3sQpacgn10P0TrCu2l26QSYJl1vNEoQdKQ/dnGJ0HcCpzJhGpB25sfi1BQ/ibv7NjPWna2
	B4K7AvE68PFbxn7HXLQYb+JlfAa/x9hFUb6AAtqDm7jLJvm7yIpirKWF8ZhPGiRrGGCThnyCccQqb
	yUoNpXokA7HMWZPg+B//m6+G2/7vAUbah/zJJzYmkY7h0DFhHiPNr1EflnT+UHA+xl7pqUo0X7D3J
	j/o8oCrH2G62moiq+7gJqpkas0JdnEhzZof5WQB2nC/LAKYLK7p/9dgTeDMfLOKWlxOttsWC5wg6O
	KWVyXu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1Sh-00000007Tvu-33qM;
	Thu, 04 Dec 2025 05:01:03 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1Sd-00000007TuV-1kXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 05:01:02 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3ed15120e55so426658fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 21:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764824452; x=1765429252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynb1Pz7S4Rh+mM2HiZZ5on0pKnh8R/gdfodATPNKL0A=;
        b=Pnt72wQxUPHT32UBmZQCqGpMIlEbzsE33E6u+dJUDPTj2YvaXGYxbcl5skaNdFkq2N
         Y/noc7Bp2t/NG4DEkCBmir80t6vYa2+dOesQiX/dT3g3zU62nrhOvP/5FmyI4gjKU8ou
         u8tD6Lq+M/DcRgpbnp+8d7PuA4Mce6MMyH6vEUSSDzRuKK0XNJ2HRDkx25LcfEpKyZ/G
         sKra5jj+d5qTqw0PuCiwzniyiwnqU8/Fi21hDcq0EEkvZGBlpkXef9s+tw26EpPxEdN6
         Bo3QCrSAgmOluQz646ey1+9jZr1+OfuDV5C27xNMB0hyVqTbDBKf6kA6eS/Nsn6G17Hl
         i51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764824452; x=1765429252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynb1Pz7S4Rh+mM2HiZZ5on0pKnh8R/gdfodATPNKL0A=;
        b=ACJ45XR8rKeLeZ7/goAI7bM6tJh/Zb+otrcMipfBPzwjZqzrQt5ZT1DtWy+t9mM/1y
         3Xvs5HOnsJWYWgkbhYVu9XWMiavjpg7gc96GFNyRULvGB05d02GiqNSrmqJMJTxo+wAb
         BCU/yiMiecPte2voCeO5eRfEh7am5SqxELPkK+/IgaMTu4/byRtxOtZT3dgBkAi7/DGQ
         BunGDOuQ97p53CIWIESe8dJUu7fk5dDZah6u+BSrzlVu1kqnQU8x2+EHemWCRaeiBjzV
         Inncft2EYSuOrjywl7q5JSfX4bf/dF2Mjk4HK449CfNgIyoIrRGIAFFPU7L3LKL2sabo
         00VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh4z/viY5PWg5aDzSVL+2CCcksMTfhzTDSdGtuBdYqHvUf5wQCnhD+lNx3/8MGQZ7qUpX1uJapayiO5V3//sjw@lists.infradead.org
X-Gm-Message-State: AOJu0YyWqHH6K0rAOfDjwDxb7nWhq5BtaofUcDu6Ztmfz5XkzDvS36Pp
	Dv71h+Ppuw9rNqhjU+7PHAqYVR2sYCP2ClFCt5jBVVuv54yHJzKoBpFGijO5g6iwFnOdxGh4qd8
	fYfovh+nduZnU3OeoIqzuYMj83pk3qCvzemzkpnvDdw==
X-Gm-Gg: ASbGncsYYgE6ucNfZgVoVSrYKm48vkdspznoO3stlC7qxj74D99U80iJlWIEaa94X+y
	+8XpM8tpNlfASvNINEcyOplZnntX4aT3Qiv+fpWFReOxCMW7V56YOx7Mqe7XMWmjue2YTtnoSRK
	GS6W2KndggLDDoWUKqkWIA+cAmbSlmO4jeddV8MsJhdjh5uye3ljSdYSDiZsRBTW2D+iWcdI1d3
	xXI6l5AL//niQHfkaH1kyHt7iuJJfZAA0IY8slzy2EYiaIm6wdXmecahvpHtf/ov4EJrXisb3Ef
	bA==
X-Google-Smtp-Source: AGHT+IGs1i5jYMwbaLlrfd7bj2pB6zXQmPz0bH8HdsC7EIxuIEFzisuXnQAnT8qR0b61+0KWK9jUwDlnypRtY3EbS0o=
X-Received: by 2002:a05:6871:7426:b0:3d2:e13c:5ea7 with SMTP id
 586e51a60fabf-3f1693a56e9mr2970174fac.39.1764824452474; Wed, 03 Dec 2025
 21:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com> <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
In-Reply-To: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:00:40 +0800
X-Gm-Features: AWmQ_bm8VR4mmm7gM0qxlsCJG381p5n9-XFc6fATbqwFqWlsUG-TXpi8vcKmNZI
Message-ID: <CAEEQ3wmz=CHkbxZwyMHGTSeXj0OFjBskgzyEKeZHk9rNOWge+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 0/2] Add HARDLOCKUP_DETECTOR_PERF
 support for RISC-V
To: Doug Anderson <dianders@chromium.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_210059_761134_766EC0E2 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Andrew,

On Sat, Nov 15, 2025 at 3:21=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 13, 2025 at 7:33=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > After discussion [1],[2], hardlockup_perf cannot be completely replaced=
 by
> > the hardlockup_buddy approach, so this patch is still being submitted.
> >
> > v1->v2:
> > The contents of arch/arm64/watchdog_hld.c are directly consolidated int=
o
> > kernel/watchdog_perf.c.
> >
> >
> > v2->v3:
> > Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update log=
ic,
> > select it by default on arm64 and riscv, without affecting other arches
> > like x86 and PPC.
> >
> > v3->v4:
> > Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECT=
OR_PERF && CPU_FREQ"
> > in the Kconfig files for arm64 and riscv in one line, with no line brea=
ks.
> >
> > v4->v5:
> > Remove __weak from hw_nmi_get_sample_period()
> >
> > v5->v6:
> > Removed the dependency on CPU_FREQ for WATCHDOG_PERF_ADJUST_PERIOD in K=
config, which fixes the
> > issue reported at: https://lore.kernel.org/oe-kbuild-all/202510240701.e=
B6r97V3-lkp@intel.com/
>
> I haven't tried compiling this myself, but it seems like an OK
> solution for the compile-time error to me.
>
> -Doug

Could you please help review and merge this again? Thank you!

>

Thanks,
Yunhui

