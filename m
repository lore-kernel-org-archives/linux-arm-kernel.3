Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E8C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QunHrjexqM3YNdAzQ9fxGyGs/UN0h4e2tG9ct5mWKz8=; b=DMKlhs6dMurtkBqg3YeG7M8sdd
	/mITOiQQq1Lhreg68M8Z1a5XaQlz2TwuV+0B1px+uXzWuqk3SuOmMilbTeAFyuKjafdUGBOtatyPw
	coLPGnP9Rj3UCv0VUEzuvnhFmgXnQzMNd/ddmv5LDHuYqrP+o/OXJGPJyiyCim1HgUTcPSBLua7u1
	MaX2PX0CypF1wnDG4Px1fNXnsMmFBvIW+F4gBwVJhoFQTa53+L/682dUDlIur4w64WdoCK/bXmxSY
	qQ+fkCx6NAQkwi8/7wn1PGWoNQG5jzPQDqL4/f4ajd+Hdr7QA6TaVgIYlvp4Hov89S6xvrVw1GEOE
	QeD132Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN2C-00000008ORX-0tIT;
	Fri, 07 Aug 2026 16:03:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN2B-00000008ORN-0say
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:02:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F68443CDD
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6747B1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118578;
	bh=QunHrjexqM3YNdAzQ9fxGyGs/UN0h4e2tG9ct5mWKz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LyGwr1WqjuuDjO+8wskxEaM7Xx/gPPjuwTVMKUi3e6K8eZ/17Y/fT8x4A76dCUpus
	 9UO9Gj+Wf0e662qUyFzs0uoLAgcQGVJao5NHIqd8wAgMKkJ5d75cSkQNJMGQnHT2nZ
	 05wvnEU0uvv2zKVuOjWOOiDVN4EHUwILeOWO8ggMBykrnYW9mp6J6e+MyjNeO02zPZ
	 qZTLEQHh/pvVLcj/v0WbQHBTe4qfWJ+Y0P2pL4AlFA/Hgve4txt0YzmuTOuEOIH2lw
	 BQDysjjIvAP9CW3U6usNSvOfA0w2H9H0Sxmj2plyrqGshSGUgfFx+gb54ELTxYnmZw
	 ySGa0iFCAFv/Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso3793537e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:02:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOs/nrBuBhE/3rx6+rGyociQ9bRoGcXv7O8GD0VUnKgJ4dCN0GD84FTuix2AkOVOHhbAwLJkk7Ei4yMJYzK5Nk@lists.infradead.org
X-Gm-Message-State: AOJu0YwVbvgg56kn+0vh06Miz/xIcn1zgSJcFBFeegUw58g21t5m2LrC
	cp4h32/AeNhfDghOeZPYoUFNnxzZUHKPUUBujY9wkn22PDM+M7yPI3k0LjEHTDCou8Ati0tW+sG
	CP+bot1Myuladtew+5FrFZlyTyFCPdW8=
X-Received: by 2002:a05:6512:304e:b0:5b2:b941:ddae with SMTP id
 2adb3069b0e04-5b2f4b88c38mr3800563e87.4.1786118577072; Fri, 07 Aug 2026
 09:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org>
 <c10eb90f-3da5-48c4-9734-1913ea62bd9d@huawei.com> <CAD++jL=ZiU4K1h7Xo8-eOGcfLEWjsHTQ9xk843T-VFoOCX7BUQ@mail.gmail.com>
 <5a3389e5-53b8-4fc5-86b8-87fe689e1b60@huawei.com>
In-Reply-To: <5a3389e5-53b8-4fc5-86b8-87fe689e1b60@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 18:02:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmWCb0eMOKLDcefsyHfVHk+v6FOgaAG-opjnmi=cDA9MQ@mail.gmail.com>
X-Gm-Features: AUfX_mzigYvYVUH6y61BS8AaNenVPO6k98z3FNGQcRwLzTUfeS-sBIkW3DD5oaQ
Message-ID: <CAD++jLmWCb0eMOKLDcefsyHfVHk+v6FOgaAG-opjnmi=cDA9MQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: entry: Convert IRQ handling to generic IRQ entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 7, 2026 at 9:21=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
> > On Sat, Jun 27, 2026 at 4:57=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.=
com> wrote:
> >
> >> I have a small suggestion regarding the `interrupts_enabled` logic. If
> >> arm32 could also implement `regs_irqs_disabled(regs)` (similar to what
> >> arm64 and some other architectures already have), we might be able to
> >> unify this across subsystems.
> >
> > Yes, the patch implements this, hehe :)
> >
> >> Specifically, we could then replace the custom `interrupts_enabled`
> >> usage in both the arm64 architecture code and drivers like
> >> `drivers/irqchip/irq-gic-v3.c`.
> >
> > That should already be possible with this patch.
> >
> > I could also make a patch to replace all uses of interrupts_enabled()
> > with regs_irqs_disabled() as a follow-up to this patch (which introduce=
s
>
> Yes, we can replace all interrupts_enabled() including irq-gic-v3.c and
> then remove the interrupts_enabled() in arch/arm64/include/asm/ptrace.h.
>
> https://lore.kernel.org/all/ZyDu9XHNmxMHBMSI@J2N7QTR9R3.cambridge.arm.com=
/

OK I will add this one as a Link: tag to the generic irqentry for ARM
before I add it to Russell's patch tracker.

Yours,
Linus Walleij

