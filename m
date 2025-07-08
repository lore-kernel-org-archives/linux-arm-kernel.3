Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD3CC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR/TgcEAqCHK/tg9If0ZSzpG7FbkUkTA33Wfi18MQFM=; b=fLMacfQgKmrZq/bOTHUeZKHYKH
	CSXxsXckaEZ+/EqCvzkdpl7OTmKmSRxiIzr2pSHa98cXtn6jOL6IGQhEglIOb3OtvTjO4Mxe1Qrtb
	lIM4a/kjRAXxsNtMJvO7TPTLIRAeDl/Wrf8lNWa8wHLoVg0lGdrtKKHyd6ip0Lk6Aute0lDTKVbhI
	g90g3JMCodJopnC6RpOPr1CQR/yryqO6C4JAS+TFmhTU82nO6prBj/ags6AuKYaHvkRcFvw10iYSd
	y5Nv1MMm6d9bB/ydoGfZ9cOGIRE19jwJ8Vzccn+W0MGmdjhjRluZd8lhfFGdHuGptMSU+EEsrMvEZ
	sJziNLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBQq-000000060Nb-0ezh;
	Tue, 08 Jul 2025 16:44:36 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAaj-00000005sWS-2qv7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:50:46 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2efbbf5a754so3140240fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751989844; x=1752594644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR/TgcEAqCHK/tg9If0ZSzpG7FbkUkTA33Wfi18MQFM=;
        b=nW3VBy1lVw+pLwfMi5uZiAzMD0WCVCCt+bBEgcCCf6qk7EUUQAGIuohunztyWNA05G
         QpbTaD1M633u6UTvTZZ7brEX+WmPWUREW2HLOrxt8b99vQaLvcePi4oLMrn2bUf2vyjz
         tYz7V+4DaVScudfKOqIdSpVvZHRh09B8saadymur1f5JDyUaNUjT+1adqnoXvxTGxt1r
         wtYCh4RUVzT6t/6Y4zuRxtXzrQ2fOJZtEOJwinQc0KLqdKM9CbuYCvUx9OffUeDa1jaD
         /MsTBbPwlGE7FFWe9m6d3x9H9Iq8KLGZm2PTIP3or83r+pUyaG3r8YmGHtSAWxVf3+OV
         VToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989844; x=1752594644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HR/TgcEAqCHK/tg9If0ZSzpG7FbkUkTA33Wfi18MQFM=;
        b=azL4BUVr8m4tbDQyhGfazL9hBPbRdpxaNRRuIPs+s1rGNqKKu+nEH3p4QM7UEnNLf0
         qg2ByQhg6n0Cv3xk2jYF+G4QTlZrS378LX9uq/lcfO3MqRGka1G/LK+ep4QzNzaQ1F+K
         x0yW0RLmCVYvvx1i7rIxaderKpYHU3vhrd9isNnB5YK/aSorFLmNKM8zhOKf3NtFKsRe
         75OcaoufDD1nnngOdReINSSCSgVYZyIi8ZEjD/+tRurgpZreKnA0zrI3E1e8p1JMMaZ3
         HzSw5pm+POj0S6hY+Q3yT9JTBpQkIVEtc57oBpJGFOFP56hSxojE7jcuCkFFMIiEa5FN
         e1eA==
X-Forwarded-Encrypted: i=1; AJvYcCVYL76X6o3zleFUUJDVNxgV7VEWhKwb6BwbS2kg5hTO1De5qX//BVUqRKmC9H4cjshMiwKNZ6jTcMcbs7amADWs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbc/KV2Kz4OpcoU+KUKnp39sfKvVZs/mAo676AmFXYwLbR+dUx
	3DJGeGoqUNOPtEUlOQBulFDIdyt3PUaje1s7L8UVq9FTn+rLD4cxxcaHqwL96uM6C1c5bBn1140
	jSc+o/O/E3Q6RALvuW2M4mwU9mRt/lArZ85h+B+wfwg==
X-Gm-Gg: ASbGncsThfK5TQmnqNJ8DzEuNayrZFkCVtd9n3azJVNcC8W0ohjoAvUG/gNCaIr9xTf
	OP7DDXntL3IAlOm0YKSecT5/nXhSgYoMPqXrlKw9rdrthFPMb334+K3GFUi7/KSsK53MBFp84YK
	YXgceW/OJl8RaJkvLpOqRG9pXwHm3XBboUlp1KMo4xQU3Q
X-Google-Smtp-Source: AGHT+IGhIQ2d/00hL1lp2ihpRXFXuMHqlKF15eMdEWAqhGG29SEV8c2orYdqfn2UR2Uw+vlIpZwoKsKNN3Ed1kDkKrI=
X-Received: by 2002:a05:6871:4b86:b0:2c2:174b:c829 with SMTP id
 586e51a60fabf-2f796c4ee82mr12539861fac.15.1751989844169; Tue, 08 Jul 2025
 08:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org> <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
In-Reply-To: <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 8 Jul 2025 16:50:32 +0100
X-Gm-Features: Ac12FXxe1PgFTp6fHm1isStWQQM_MoDhyRf3bpetBoit9EPNjj6uOBov0c3l-qo
Message-ID: <CADrjBPr+iQ=BQ=iLhkTDmRbv+sKOYM1rRpU0Dc1FXQhkeBU_Dg@mail.gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_085045_728712_27597CA0 
X-CRM114-Status: GOOD (  31.34  )
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

Hi Andr=C3=A9,

On Thu, 3 Jul 2025 at 11:12, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Thanks Pete for your patch!
>
> On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> > Register cpu pm notifiers for gs101 which call the
> > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > hint. This is required to actually enter the C2 idle state.
> >
> > A couple of corner cases are handled, namely when the system is rebooti=
ng
> > or suspending we ignore the request. Additionally the request is ignore=
d if
> > the CPU is in CPU hot plug. Some common code is refactored so that it c=
an
> > be called from both the CPU hot plug callback and CPU PM notifier takin=
g
> > into account that CPU PM notifiers are called with IRQs disabled wherea=
s
> > CPU hotplug callbacks aren't.
> >
> > Note: this patch has a runtime dependency on adding 'local-timer-stop' =
dt
> > property to the CPU nodes. This informs the time framework to switch to=
 a
> > broadcast timer as the local timer will be shutdown. Without that DT
> > property specified the system hangs in early boot with this patch appli=
ed.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> With this applied, I see the following during boot:

Thanks for the lockdep report. It has turned out to be a bit of a
lockdep rabbit hole!
To fix this I've had to: -
1) Update to use raw_spin_lock() variants from the callbacks
2) Set .use_raw_spinlock =3D true  in regmap_smccfg
3) Create a new custom regmap_pmu_intr (instead of relying on the
syscon generated mmio regmap) for the pmu_intr_gen region that sets
.use_raw_spinlock =3D true

>
> [    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.841422][    T0] [ BUG: Invalid wait context ]
> [    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U    =
      T
> [    1.841727][    T0] -----------------------------
> [    1.841844][    T0] swapper/0/0 is trying to lock:
> [    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....}-=
{3:3}
> [    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
> [    1.842309][    T0] other info that might help us debug this:
> [    1.842613][    T0] context-{5:5}
> [    1.842987][    T0] 1 lock held by swapper/0/0:
> [    1.843442][    T0]  #0:
> [    1.843859][    T0] ffffafe9d8f1f100
> [    1.844282][    T0]  (
> [    1.844618][    T0] cpu_pm_notifier.lock
> [    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
> [    1.845340][    T0] stack backtrace:
> [    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G   =
  U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT
> [    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
> [    1.845884][    T0] Hardware name: Oriole (DT)
> [    1.845897][    T0] Call trace:
> [    1.845909][    T0]  show_stack+0x24/0x38 (C)
> [    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
> [    1.845949][    T0]  dump_stack+0x18/0x24
> [    1.845956][    T0]  __lock_acquire+0xc68/0xd90
> [    1.845976][    T0]  lock_acquire+0x14c/0x2b8
> [    1.845985][    T0]  _raw_spin_lock+0x54/0x78
> [    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
> [    1.846021][    T0]  notifier_call_chain+0xb0/0x198
> [    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
> [    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
> [    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
> [    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
> [    1.846097][    T0]  cpuidle_enter+0x44/0x68
> [    1.846121][    T0]  do_idle+0x1f0/0x2a8
> [    1.846142][    T0]  cpu_startup_entry+0x40/0x50
> [    1.846152][    T0]  rest_init+0x1c4/0x1d0
> [    1.846161][    T0]  start_kernel+0x358/0x438
> [    1.846181][    T0]  __primary_switched+0x88/0x98
>
> >
> > [...]
> >
> > @@ -444,6 +586,18 @@ static int exynos_pmu_probe(struct platform_device=
 *pdev)
> >                        */
> >                       dev_warn(&pdev->dev, "pmu-intr-gen syscon unavail=
able\n");
> >               } else {
> > +                     pmu_context->hotplug_ing =3D
> > +                             devm_kmalloc_array(dev, num_possible_cpus=
(),
> > +                                                sizeof(bool), GFP_KERN=
EL);
>
> I haven't done a full review, but sizeof(bool) should be rewritten as
> sizeof(*pmu_context->hotplug_ing)

Will fix

>
> > [...]
> >
> > @@ -471,10 +628,32 @@ static int exynos_pmu_probe(struct platform_devic=
e *pdev)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static int exynos_cpupm_suspend_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 1);
> > +     return 0;
> > +}
> > +
> > +static int exynos_cpupm_resume_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 0);
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops cpupm_pm_ops =3D {
> > +     .suspend_noirq =3D exynos_cpupm_suspend_noirq,
> > +     .resume_noirq =3D exynos_cpupm_resume_noirq,
> > +};
> > +#endif
> > +
> >  static struct platform_driver exynos_pmu_driver =3D {
> >       .driver  =3D {
> >               .name   =3D "exynos-pmu",
> >               .of_match_table =3D exynos_pmu_of_device_ids,
> > +#ifdef CONFIG_PM_SLEEP
> > +             .pm =3D &cpupm_pm_ops,
> > +#endif
>
> This can use pm_sleep_ptr() instead to avoid the ifdef.

Will fix.

Thanks,

Peter

