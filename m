Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85603CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVrQMPNfIAfJr24CcOehCxmfetUPAGxwN4bsy+g6Efc=; b=MauCJcpTcdHlOxaJRHG5lz81y7
	AhwSYQkpliLygbfHHbcTsPU1lP2Q7yZY/6WlsIJz9aMcH0LEYIHuolZuZ7iqYcbuLCkADSghHcR8u
	LG7Vwvi3UfkdCdkXSVV/4Fe/Btw7qRA/t1nKJSPI7BDM45taOrN3vEb/rvlWhsswOJGReUIXMKPQV
	FonWdAU9im+jHHmnjn00jiF1sG2M3Zn4VCyhpx9Or02/cSuD+MV7kF01me/KjP83azZen6267LV5T
	SxZxUR8fJENxO1w9x5+ffU776xXhHxeWH8SEdNL991MIaLSH4mVXym5oODJ3uQdXIXR67SVjtArxT
	rhW0HK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQeV-0000000ClJu-0UvW;
	Tue, 04 Nov 2025 23:41:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQeS-0000000ClJV-207d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C72743DB4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 23:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D846C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 23:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762299683;
	bh=fhZM85l1uSREt1wMvhWcmC7U7Dt1bJyMbgpE4R0c+9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n+R3fEbgHl6EI+6rABYnXYx7/Yftd2e21aILUVE9CsEz9i19cMFFqVt6Rq91enP1P
	 mWtOsddDwh/92H/q5WfWt6JiSea3K1YXvJIl8ibjvSMub1Fu7UrkUJCfO0fJYwa7zV
	 de5plCCpwViMhbcRsmnvkZtgaByPFsboxYY/8bVKPgaz9UgJmUzi33bvYpCFa1OCGs
	 CFwAO0eiuWBSy5Djv2IZiyEbfqT5ihZTGZ7/OIb3gzzMKoDRvCwDBq1Q0zXksyNCDt
	 3SoS/si+krK+m4i0DgxaTu1qRTzFaD6ivXanZdrRexg4EW0fQDWl0KLGq4Cw+hUxkw
	 yOcuMC4ljQ7JA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63e336b1ac4so483528d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 15:41:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRRPFBg6GnNgBgObfhYC8/T42UXcVq1MKyvYl3DBuIICBCKpItYNQmQuEP6mxjbxrbf3VfqTiiUM5dzynhEPtg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyn2dJ39mvKgJ7hWq2/n0RbSF7Zv6CwKxQoN57LeWD6u2ssRVB
	EO04tt4o8fLdG3ZwQNVrtt63IvzPNeGr7GKvnLJQOGDl2X8/NUyBMXrpPcgw1PgZKVDz1kwUR5z
	nefRhO91Q6lkGdfGuDfx7o61lg6kxosc=
X-Google-Smtp-Source: AGHT+IG5YjJyeun/FhxE1uvNILjGs7+uK5LNrsZh/uE3mdeeUAP/+Jf2de6+gEpt3P0hfy94aTVupbFfHMBjlGFOuCQ=
X-Received: by 2002:a05:690e:1404:b0:63c:f5a6:f307 with SMTP id
 956f58d0204a3-63fc76a413dmr4544668d50.30.1762299682330; Tue, 04 Nov 2025
 15:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20251103101545.760243-1-bigeasy@linutronix.de> <740b1a09-24b2-4473-aeb4-490ac42da7c2@app.fastmail.com>
In-Reply-To: <740b1a09-24b2-4473-aeb4-490ac42da7c2@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 5 Nov 2025 00:41:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsPphTjv_mDc--BDSWjRn2Q4WAGkQ1XNmTNg7VGY0adw@mail.gmail.com>
X-Gm-Features: AWmQ_bkSZkbh3lgoOtda_vhQ5EiawR6dARli3SbhpUt1IKJiv0r5dieZ5ucjNWs
Message-ID: <CAD++jLnsPphTjv_mDc--BDSWjRn2Q4WAGkQ1XNmTNg7VGY0adw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: Remaining PREEMPT_RT bits
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev, Russell King <linux@armlinux.org.uk>, 
	Xie Yuanbin <xieyuanbin1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_154124_560049_2776A933 
X-CRM114-Status: GOOD (  25.23  )
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

On Mon, Nov 3, 2025 at 12:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Mon, Nov 3, 2025, at 11:15, Sebastian Andrzej Siewior wrote:
> > this is the last batch I have to enable PREEMPT_RT on the ARM
> > architecture.
> > Last time I posted them there was some discussion about making the
> > branch predictor hardening worse. I redid it hoping it improved now and
> > does not make it worse.
> >
> > v1=E2=80=A6v2: https://lore.kernel.org/all/20251029155918.503060-1-bige=
asy@linutronix.de
> >   - Allow to enable jump-labels on UP. The UP build does not involve
> >     stop_machine(). Reworked by Arnd.
> >
> >   - Instead of forbidding HAVE_GUP_FAST with HIGHPTE enabled just
> >     disable HIGHPTE on PREEMPT_RT. As Arnd explained, HIGHPTE is rarely
> >     needed.
> >
> >   - Don't let ARCH_SUPPORTS_RT depend on HAVE_POSIX_CPU_TIMERS_TASK_WOR=
K
> >     which in turn depends on !KVM. Since KVM has been removed from ARM
> >     it is sufficient to unconditionally allow ARCH_SUPPORTS_RT. Noted
> >     by Arnd.
>
> Whole series
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> Looks all good to me. The first two patches may clash with
> the work on generic entry that I think Linus Walleij (added to
> Cc) is in the process of rebasing, but I think that is fine:
> hopefully the special case that you  adding here will just go
> away after Linus' patches, so everything should be fine
> regardless of which gets merged first.
>
> Linus, can you have a look and confirm?

The patches look fine to me, the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
(nevermind the kernel.org address on this mail, it's because
the mail is not in my other inbox because of something...)

The generic entry is mainly about getting rid of the old
RCU context tracker and ridding some lockdep warnings and
I am in the process of splitting off the irqentry parts and send
separately.

I think these patches are good to go.

Yours,
Linus Walleij

