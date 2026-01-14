Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D0D31A14
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=; b=NJPF1IKt7vUAfOloGE/1bwGClS
	nwKYyZA/sgweXDv9gTaT+316syOlC+py+vdf8AKGZaz1Wu/mvaFa6oPFhrpO9cWZGl4YnXXIs3yNF
	j7ahqUS6Hj4j1O8Dvn1Q2quWimXI6xPMcQkFMv8Imj5kInGrwHkD3m8AQow09k3CX9LjhNW9DKezD
	NI/vwnqejXwu0+/XPf3z4UqbGcPNS18qDDILAXC4Q7Ncj+W6m7E6jeMCxg1g9tYmROAKIHVUfoNvj
	zCIDRqz9+fTTHfJ990LzRKOxy7IVHOgeStdrVy7JKrT9whcV/Qdh1MIySDvBFysTSZwmOKVd3xQyX
	ZiP9i4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuli-000000089j7-3f8x;
	Wed, 14 Jan 2026 06:54:14 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfulg-000000089iY-0SgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:54:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7ce2b14202fso3597111a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 22:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768373650; x=1768978450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
        b=OTVklU42ezItv3FR5IA+xJezVOnevf+fkITRtO8blXKaAULoN+uvbcizpXFKvHldQo
         iUqrbPVYRyqDGZYtqUvCDD5Wu/7+28exkhk2MBW8S9Ah9cGEPMJYsQ8lBUV/Csr5qiGA
         4sA46yF0hdWf4naK+WfIBevAXwAyvOB7KsSGBxwPg2XCRtSfBY2KN+Dc5mwQI8I8tqrv
         XDLKI+jxJ7rA3vt3WkS1in/QzO38G5ZU/HrqMOyOemFgNnjPSrVg3q8NaZ3wdJbOYqUY
         rIBWqxSEm/2nyQmLheEbM8eUk2W58NY53IZFlPPdqTO/qfgtzNxhFSfSwpEB1weX3D7G
         rRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768373650; x=1768978450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
        b=SF9ZO8NhqgqRG1v+L+9NEMlPJNv7yv7p295M45NiKYwGq5jl2OKRDUbn8219TBsdMZ
         +wpZpvw5dWnkCEQrtjMcYx3/wr5PH7YEECrTJYUISBCUGeAfkOc0qFXAuKWMhCR8JQe+
         qvAmxjZjRMeBALnnPnKpkSet/lTMUZUxr9ODhWgIFoTFysYKvmwmX2zYfzbsQxVDM19H
         6Z4C41h1cc9p7jIM9a4iDj1w0puEOMMHGBM1uvqJ9Xes3iXzXXpuE7W6CpMcc1WH+9Cz
         fTW0nBCLL9KJR8gXWLS+bfZsc3DySwTEf+rq6ysgTz3ff2xwi3ifdn83Dqv9fXWLU/xu
         b6og==
X-Forwarded-Encrypted: i=1; AJvYcCXX14Zya7TLSG8fQHC362hTbMd6e6rfQXXom99jT2A3CYFlLKf8ybFmRjBx0njn8AmqDlfEGcN0FkQeUu17kaz4@lists.infradead.org
X-Gm-Message-State: AOJu0YznHu1mTNeyITdBxW3f+L/e5RfO+fEVywzoLFjEEJ0J/O8OjSsR
	Aq3sMc9A7WZv3b/hsxPVND5OwB//sW8q9Ali2LQHsMX5dPA1xvJ6YFgZvv+p0eqPL8yUnA8h2/m
	ij0yvwneTQSrVferjRgBB+gYUZ79iSLQWqOANejkj1Q==
X-Gm-Gg: AY/fxX523WxEwJ7zXdvodZ9Ng9hGbBqsLJWTbB/u+tMiNwgr5iQmp6k8GdGHpwmtNeO
	TqAPL/UJEPrnvaZYJE4wEPl5DHZIuXOyj8IbJCA/Qp7HNN4G965/edcKmuXFiE1/HttDeBDWJp1
	8/Tl1OlwV17CY2gAbsmTbgb+AkE5jo3mP7ypZtSMRoQETzYEkXnCFmAM8ZyQYr2nFA/UBjWLYBa
	2EIyvbl8mZpzJA/YMHgyY8ZCVdgkupHLLnGMP6blwtySfZiesnNAOmJIKk6T6leUNwRFAI683n2
	75xYEINYkbaA5E144v5d25Uvomn0+wHylEE3
X-Received: by 2002:a05:6820:668c:b0:65f:2902:4fa4 with SMTP id
 006d021491bc7-66102df2e32mr770769eaf.65.1768373650571; Tue, 13 Jan 2026
 22:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com> <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
 <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
In-Reply-To: <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 14 Jan 2026 07:53:59 +0100
X-Gm-Features: AZwV_QjQvehCkstZ603G-yGEHjndP2wcqmxShTV0eKq96xdT4eINMWBA-NAc2Vg
Message-ID: <CAHUa44ERuPKeNHoU9UpLWTxZrSvR15RbiuOPXqi2SBYnBfg44w@mail.gmail.com>
Subject: Re: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_225412_169245_FDE050DB 
X-CRM114-Status: GOOD (  24.38  )
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

On Tue, Jan 13, 2026 at 5:09=E2=80=AFPM Gatien CHEVALLIER
<gatien.chevallier@foss.st.com> wrote:
>
>
>
> On 1/13/26 15:45, Jens Wiklander wrote:
> > Hi,
> >
> > On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gatien Chevallier
> > <gatien.chevallier@foss.st.com> wrote:
> >>
> >> Add the stm32 debug bus driver that is responsible of checking the
> >> debug subsystem accessibility before probing the related peripheral
> >> drivers.
> >>
> >> This driver is OP-TEE dependent and relies on the STM32 debug access
> >> PTA.
> >>
> >> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> >> ---
> >>   MAINTAINERS                 |   1 +
> >>   drivers/bus/Kconfig         |  10 ++
> >>   drivers/bus/Makefile        |   1 +
> >>   drivers/bus/stm32_dbg_bus.c | 285 ++++++++++++++++++++++++++++++++++=
++++++++++
> >>   4 files changed, 297 insertions(+)
> >>
> >
> > [snip]
> >
> >> +
> >> +static const struct tee_client_device_id optee_dbg_bus_id_table[] =3D=
 {
> >> +       {UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> >> +                  0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> >> +       {}
> >> +};
> >> +
> >> +static struct tee_client_driver stm32_optee_dbg_bus_driver =3D {
> >> +       .id_table =3D optee_dbg_bus_id_table,
> >> +       .driver =3D {
> >> +               .name =3D "optee_dbg_bus",
> >> +               .bus =3D &tee_bus_type,
> >> +               .probe =3D stm32_dbg_bus_probe,
> >> +               .remove =3D stm32_dbg_bus_remove,
> >> +       },
> >> +};
> >
> > Just a heads up. With
> > https://lore.kernel.org/op-tee/cover.1765791463.git.u.kleine-koenig@bay=
libre.com/
> > we're switching to use bus methods instead of device_driver callbacks.
> > That plan is to merge that patch set in the next merge window.
> >
> > Cheers,
> > Jens
> >
>
> Hello Jens,
>
> Thank you for the link!
> Is it fine if I push on top on your "next" branch for the review along
> with the appropriate changes? I'm open to suggestions.

Please base it on the tee_bus_callback_for_6.20 branch instead.

Cheers,
Jens

>
> Thanks,
> Gatien
>
> >> +
> >> +static int __init optee_dbg_bus_mod_init(void)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret =3D driver_register(&stm32_optee_dbg_bus_driver.driver);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret =3D platform_driver_register(&stm32_dbg_bus_driver);
> >> +       if (ret)
> >> +               driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +static void __exit optee_dbg_bus_mod_exit(void)
> >> +{
> >> +       platform_driver_unregister(&stm32_dbg_bus_driver);
> >> +       driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> >> +}
> >> +
> >> +module_init(optee_dbg_bus_mod_init);
> >> +module_exit(optee_dbg_bus_mod_exit);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> >> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
> >>
> >> --
> >> 2.43.0
> >>
> >>
>

