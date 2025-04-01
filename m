Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMDDeez6kOoe0VuKaV7cMdRjNY74xD4dUkO4O1Q2miQ=; b=00BcRKr5ylkyQtmkBCoSpB0a4/
	j8mNrctvZg3NpQEAtG/6LBIpkNGWt9ThYO1LPsQI5OlbKrm4SiCnpRvPcUhO5UJ3xk7Kpq3hrjk85
	AIr+XMrSFBZFEh1i+z7+bOWyRjRyILE9YeHchR2ANNrvnfTX9sRzM39twdNcueGbIdwPZHGnxth0j
	ZAL7QWsi7EEH9pxySADSZd98dtfP0cOYCAs9Qmcn61J3bUTxjvnKdQbf6zxlR8MFscxDpbbKHAPjy
	1v24se97FHdubMp4MzkswIR+gdzteBb5LjDpRgRUc2aQzPFDE1dlFDL9Kojw3XX2ZQt2pIfwAdw5J
	Wxm5IqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb7G-00000003MMk-2yxM;
	Tue, 01 Apr 2025 12:53:18 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb0Z-00000003L3Q-0eE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:46:24 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6f7031ea11cso58001897b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743511581; x=1744116381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMDDeez6kOoe0VuKaV7cMdRjNY74xD4dUkO4O1Q2miQ=;
        b=ZvCsfguhaiqLRxArpB6jTJXW3dBIDjcLYO0nO68TYhc3GKAoS7zcLzwWiLs0HgSfRM
         m1h5cCZJR9luVSBB/+m4KN9JWqcgHDLbmHa2wt6iQQZs+XWJnqfWBwTq+Cxh1ljWWUst
         m/TCosEc9gEugS5a1CCanQMqjMw4xpWkwcIWjcuJpNeUpXSSnTWl/pibfU2hdFA0BCjp
         y81KroAjzth4ntjxfsdbZEXd/1dNwiQAjHBwst+3JqUAg3Z6BcUPxXhK9FKlU+v2y1OH
         R4LnP9EV92nUrE1CgdKitdpyT/tn9xZsyXVOHF9Xm2pFMVOnevBrUB9K4aYGsyL58csi
         IwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511581; x=1744116381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMDDeez6kOoe0VuKaV7cMdRjNY74xD4dUkO4O1Q2miQ=;
        b=wp0gLP4QkvEYKE86HteioMzf3RGd1x/N14V4OUS9Ui2Fyy2d3ROBl9x4FV2zGvbU44
         dY11NNlFJ+3SBd6NL5FGc7XCIrATUFQbiXxAbpIsxZ47+7Sdsybv8Jake9sy29X8L8pJ
         X7sv8sdOGX6+SAaLKXTD8wr6BoYieOgtmXkTsGUj1YAnQQMJtZG+rWkDlG+M0rCm7ZXp
         fp6IqB2SuTT/jMFLA5Yl1O13/658myVq5rWeL5//YDSfTBOLhsqxCptexbSZvw06O88C
         d0NO/5vgqu5DqPQKR9NB47NeQWrlq6Fj08Vu1LeRy6Ai+qqAkmtP7oNwgxd16SvNOtUG
         Ct5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0wdP2XA3a5vFqpib4ENh4a6zoa9bx5nI86Z58M5EEkmW7PL3De2dV0EbayOE3xT0/eQ1FRzyYm0h/1pt9yX2u@lists.infradead.org
X-Gm-Message-State: AOJu0YwY++LDkNsw05+W/I/hdbvZ0Hp0e006sWPCFct/QBjs04ZGrfuQ
	Jp75ZtNiMtQNdjY1XlSNGoh2vXlrDvGMdLruvyrBVf3q/4O6SHLT80Iegkgv4pjeQzRaDoM/ajS
	/A+ILg5hdgtU5PuqoUqlS0XgQiIOK5NWPF/8PGw==
X-Gm-Gg: ASbGncvjWT5cYAauMywWtxvjtJo8VuMV4dQ4kKQGR6zhH8rGcTxU3sxd4jW2AClDD/C
	mD3UNr+BS+YIwCuFL/EDuel0iJ+FIA9z9K2RAqnLQSpX4wx2D0/5C2rTHw0NMaGp4pTY0lxp+Pr
	fYo3Us4MhiKf8PCIxO1Rh7CCUAywk=
X-Google-Smtp-Source: AGHT+IGL9OSbja9iYeFzPJ+/gKIFplL+CL1DbY+6y+Uot/089lr6RvlMMypn+5FN141zeahQuPTrIh4o8rhbTIo5V3E=
X-Received: by 2002:a05:690c:20a5:b0:702:627c:94ec with SMTP id
 00721157ae682-702627c9619mr129434977b3.35.1743511581556; Tue, 01 Apr 2025
 05:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org> <Z+TEa8CVAYnbD/Tu@perf>
 <86v7rulw2d.wl-maz@kernel.org>
In-Reply-To: <86v7rulw2d.wl-maz@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Apr 2025 14:45:43 +0200
X-Gm-Features: AQ5f1JrXJtw8P-nNnlXkQzxE9Mof1YPkOE61sbdFVclhwvmQdRUQ4pvlCvXHd8U
Message-ID: <CAPDyKFrxK3Mx055hx+a4SP3CWDpWP+CEHxz+WJfT+RficK0_Ag@mail.gmail.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
To: Marc Zyngier <maz@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com, 
	joonki.min@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_054623_200341_CD4982B0 
X-CRM114-Status: GOOD (  42.45  )
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

On Thu, 27 Mar 2025 at 09:25, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 27 Mar 2025 03:22:19 +0000,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> >
> > [1  <text/plain; utf-8 (8bit)>]
> > On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> > > On Wed, 26 Mar 2025 03:09:37 +0000,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > >
> > > > Hi.
> > > >
> > > > On our SoC, we are using S2IDLE instead of S2R as a system suspend =
mode.
> > > > However, when I try to enable ARM GICv3 ITS driver (drivers/irqchip=
/irq-gic-v3-its.c),
> > > > I noticed that there is no proper way to invoke suspend/resume call=
back,
> > > > because it only uses syscore_ops, which is not called in an s2idle =
scenario.
> > >
> > > This is *by design*.
>
> [...]
>
> > > > How should we handle this situation ?
> > >
> > > By implementing anything related to GIC power-management in your EL3
> > > firmware. Only your firmware knows whether you are going into a state
> > > where the GIC (and the ITS) is going to lose its state (because power
> > > is going to be removed) or if the sleep period is short enough that
> > > you can come back from idle without loss of context.
> > >
> > > Furthermore, there is a lot of things that non-secure cannot do when
> > > it comes to GIC power management (most the controls are secure only),
> > > so it is pretty clear that the kernel is the wrong place for this.
> > >
> > > I'd suggest you look at what TF-A provides, because this is not
> > > exactly a new problem (it has been solved several years ago).
> > >
> > >     M.
> > >
> > > --
> > > Without deviation from the norm, progress is not possible.
> > >
> >
> > Hi Marc,
> >
> > First of all, I=E2=80=99d like to distinguish between the GICv3 driver =
(irq-gic-v3.c)
> > and the ITS driver (irq-gic-v3-its.c).
> >
> > I now understand why the GICv3 driver doesn=E2=80=99t implement suspend=
 and resume functions.
> > However, unlike the GICv3 driver, the ITS driver currently provides
> > suspend and resume functions via syscore_ops in the kernel.
>
> For *suspend*. The real suspend. Not a glorified WFI. And that's only
> for situations where we know for sure that we are going to suspend.
>
> > And AFAIK, LPIs are always treated as non-secure. (Please correct me If=
 I'm wrong).
> >
> > The problem is that syscore_ops is not invoked during the S2IDLE scenar=
io,
> > so we cannot rely on it in that context.
> > We would like to use these suspend/resume functions during S2IDLE as we=
ll.
>
> Again, this is *by design*. There is no semantic difference between
> s2idle and normal idle. They are the same thing. Do you really want to
> save/restore the whole ITS state on each and every call into idle?
> Absolutely not.

I agree that we don't want to save/restore for every call to idle,
that would simply be unnecessary and add latencies.

Instead, I think the save/restore could depend on what idlestate we
enter and whether it's a system-wide state (s2idle/s2ram) or just
regular cpuidle-state.

Today, we are pointing the callbacks for cpuidle and s2idle to the
same functions (at least for PSCI PC mode), but it's easy to change
that *if* we need some differentiation between s2idle and cpuidle.

>
> Only your firmware knows how deep you will be suspended, and how long
> you will be suspended for, and this is the right place for to perform
> save/restore of the ITS state. Not in generic code that runs on every
> arm64 platform on the planet.

Assuming we can make the code for saving/restoring generic (not in FW)
and that we are able to make sure the code is only executed for those
platforms and states that really need it. Do you think there would
there be any other drawback for doing this?

Kind regards
Uffe

