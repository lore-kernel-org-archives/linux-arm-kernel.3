Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2680CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeQYWbY1S4fZ+YczB8KbzZBm49i+mRKtPu5B3WoNWrY=; b=B+KRv6+7hX+xjVAXlJLBS9SzsZ
	5III/no/aQAYjuAPS5OCKvW0jyN+AqsTmhRAEUxbY2saxvatwiyYp5yi50qusvNWsPuHHGZfUmPEE
	271in8V7FQw07xtJSGNtcsr9IjYEoqNqMu9SY4GEcdzNIU7+MnSUGGb53BA8yhTebJuRRH+uMa9Us
	zpnPd9bgajQ50J0lIbQE0QvXhh9NfbUsY4JfbtsXLPPBz1tgqlJlqcthsiMbHFqriR7Dj38smtQcG
	A4bSnrc/GokuGiL382LAqigmt/q7bxEiSCBiL3S2vWz2wdzrPJtYqvq6vN1lLJ+LUuc6e4iJxD18r
	bl01YVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxmp-0000000BILc-3Y0l;
	Mon, 01 Sep 2025 06:13:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxXt-0000000BFlk-1K1e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:57:38 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-61e27fee909so780320eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 22:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756706251; x=1757311051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeQYWbY1S4fZ+YczB8KbzZBm49i+mRKtPu5B3WoNWrY=;
        b=QyCScfTQtp9oPJ/SYl9r5cAZ4ZW62aRnS4Yx/Pk13+ZNf5dtrXIdPxwhpbS7nkTABN
         Oa9HCDFq2oP+zoliFIAyASVjwf2WXxW1K9SohGReY/J2HN++/T5e6KesnlYoV3HxU89r
         J7pYcVqkNMQwcPoeIs+VX9yWLwsLQA135FTbV9FUIF6bDChvov639cvhjXBcFSL+VuQB
         8jwByrE7tayux0Mb+rtdssL1W2PO9jJop2tLbA+ym3eG51M4ZyxVDpg/7DSbWOG8J6cH
         Bx55nzWjIAHV64sFOogb/PdelH4eMN60z3QK8KMfGPH39EDIrXlimY4UbIvkk40keKiJ
         uhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756706251; x=1757311051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeQYWbY1S4fZ+YczB8KbzZBm49i+mRKtPu5B3WoNWrY=;
        b=bMPksEElyZT8gzLVxJRrWDK/5nzJwjYm+45GBCFBPuWBXUnxal7NJLhCm00BfyAl+I
         IkmFBxzndrNE6clDKD0XHvum4Z0Ed0THD9odA+7+govpM65KjkyMMox5gk/GOWZRvfCm
         Geq1D4ThTbQb2H0qOm3dydJC7aTviuHI9ncFx2i+Xq8cQF1ujcnQ40ho+6cTmHxNLoqn
         /xqXbIIo6bAK2RhU7QYTSIjFEq6QtEw1z5kM0ZjcBXtIFP4i5KE+V15shVrHV+o+OkGi
         h9Mr2viepfpx7oVZKm1wRpmc41cadp938dMQgqvjZyATC31f7TiU2qI4ZUwG5aDj8d10
         JzLw==
X-Forwarded-Encrypted: i=1; AJvYcCU5JtH4GUptAUtWpr0fJIMmwNE7kQjlISbBN6lzbnLaOtvyb1x2tqaDalKCBzwUhLdFAihc38dKu8tVpNAoqdOC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WExF7omclDFSV5Pi+/NkrJqS3C/Qytmjj3TvobpJ3Qe5t3sN
	WpRhzBnf3Lxn/A64P5lru0GaPO1alebT9H7+gFT72bw+UGfq1RxwD8EdUNlP6APoSdd71lJHwBW
	P0IDgZkg5HvJfS+cC4mnp6nCifmXO0ctI6EccZq4RTg==
X-Gm-Gg: ASbGncuL5c3ljnPlrBJiilg+0OFmMhvQgpFS+D+SvXGdpJnWyvBEp5vIpDed9PM8Vl6
	XOqchEstBdPK+wuaaajLSaWCd+B6Jv78OFJVI+CtjGmwB6RUPu6pIjTox9OGlzeNvC/mlGuocQh
	pNuAmckZYDIX5rrN4Ag+CshfsHEov9aU6Unxg7msJ5+Rx/GvpAFvNuNhhxJ+X76CWygVb2Sh9nn
	/NhoiS4Xz4DqYNhE+Q+MElHMkPtBw==
X-Google-Smtp-Source: AGHT+IEtvyL0v+dIqPd4cVuA9FY2MWzZGsXTxWqPBDg5RCf2ntrVdCNu37vpIo27yokw6idnCUTUmPkUJc2WW9ZSX9I=
X-Received: by 2002:a05:6808:14c2:b0:437:75a1:34ff with SMTP id
 5614622812f47-437f7dc9eadmr3255975b6e.43.1756706251452; Sun, 31 Aug 2025
 22:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
In-Reply-To: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 1 Sep 2025 13:57:20 +0800
X-Gm-Features: Ac12FXztNIRPMxCTXiinwhNyATXzi2utzF9owhxKyx-0keFQXx7jGWYBvVSkODg
Message-ID: <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_225737_347725_2FD74B95 
X-CRM114-Status: GOOD (  19.31  )
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

Hi Doug,

On Sat, Aug 30, 2025 at 5:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> > to arch_pmu_irq_is_nmi() for cross-arch reusability.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  arch/arm64/kernel/Makefile                   | 1 -
> >  drivers/perf/arm_pmu.c                       | 2 +-
> >  include/linux/nmi.h                          | 1 +
> >  include/linux/perf/arm_pmu.h                 | 2 --
> >  kernel/Makefile                              | 2 +-
> >  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
> >  6 files changed, 9 insertions(+), 7 deletions(-)
> >  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)
>
> I'm not a huge fan of the perf hardlockup detector and IMO we should
> maybe just delete it. Thus spreading it to support a new architecture
> isn't my favorite thing to do. Can't you use the buddy hardlockup
> detector?

Why is there a plan to remove CONFIG_HARDLOCKUP_DETECTOR_PERF? Could
you explain the specific reasons? Is the community's future plan to
favor CONFIG_HARDLOCKUP_DETECTOR_BUDDY?

>
> That being said, I did a quick look at your patch. I'm pretty sure you
> can't just move the arm64 "watchdog_hld.c" to be generic. Won't
> hw_nmi_get_sample_period() conflict with everyone else's (x86 and
> powerpc)?
>
> -Doug
>

Thanks,
Yunhui

