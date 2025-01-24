Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD05FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QIKaqbbemwWz44f4TWNlRFlZj3y5YlJKRtI3zz9LXI=; b=dYFJhGg2FuU08SgLINtWVxlaPI
	rKEr4jBhSgAAA6w65i0mWx4EhLhBIHPmh4yft5BCpJwF3GFBLBwHbR/+MaZmoj2CLHWtZhpOtkUhQ
	zK8++JkxzCl9vRik48JT77DtlKQsRzdmESRZagMDp8ad3sqmpygqV+/8sDAupPt9MJAeDd0258WaU
	ycj5NA3Zwu43hPL/zliI4PbRBzR5k/SWIaUGx8VbGkKOFGvZuCuN+wE0O8/5WoFOIH5eBOQfaUQJW
	Ec+u5dKaLWKWtHe5F297b4R0gz/3fU3vEqnuSKfMElFWhgU0Kn3RpdrXA1cHNyNXYexCcdIgsnD1a
	+hjG0KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPv8-0000000FRZ6-41ge;
	Fri, 24 Jan 2025 20:04:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPtq-0000000FRTZ-3c5K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 20:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535155C61B5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 20:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A2C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737749009;
	bh=kB0Yj6fw56hD+dYGBFuwDB3YlGtW0RV64sm6DIzXdOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hV0rQ9qDFdGx5gluvvJFRcOZjz/GrT0B23/FQ/+l4TEwchnAqJfG2xJswlONSuONv
	 DfjFuaccVnCsehoeDiqaNydBy/4ckQB4u6Ojk5xU+DHh60nLTxNrizr+p+ag/zrOQM
	 YfUwr5uEAp4Dul3rPKvoU8COj54pJS0no2SYgVKZwyzhdB7O9VrzU47LGSuu7Iidi+
	 L2QCrCwo7sac4n9NwZNKZ0V0oM6Bo5ZKzoKY71CIXYFzqP19o7hDhsUHBuiOi+Ku47
	 SHbvoc7Uyn+RihYg9/L1WGy80C/wazuhyAayHLkrZF9EtjT/olXNkImqwPnMQV0K8N
	 yZp0KUWwjWxYg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2786067e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 12:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVnKUKNbHOXoX0dVo9luX74HAcNjhRc+bJXCD5GYkFzzmOdcFL7UnLztmNa+xdRnsiBwLwLE0FKHHIncDhuhty@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gAq/mCEGtDV2I04UM2tgsApC28XPUjMLLlLhF11UxJIBux3B
	+1RrIMpPQsFfxsUBcEY9nl5sv9YYBfCi2ibk/jF0XdJNm8U6Nyqko4DpwOmyZxZtu2xRuT2KLKX
	gomKopiQzcrrGCTA1oP9mpp0bHw==
X-Google-Smtp-Source: AGHT+IFI4E8ok6ZnUBXd1X1cgum64M+dQ5G/aCCjGU+84hgDMGp37JiJm4zF1YCFsaN9zLh7Hk7stY0iKRVKvN9Pd+g=
X-Received: by 2002:a05:6512:ad5:b0:542:2190:9d99 with SMTP id
 2adb3069b0e04-5439c22d7fcmr11990382e87.6.1737749007253; Fri, 24 Jan 2025
 12:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org> <b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com>
In-Reply-To: <b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Jan 2025 14:03:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKVydDqmr-gyn1wt=1PO_p1NMze+1D+4qXWxGiGVLV9EA@mail.gmail.com>
X-Gm-Features: AWEUYZlVwnePv2ukQi7kKELxZyZ8P4Izpod4DeD-vVe5G2_hjHHUcMstEkOJyM8
Message-ID: <CAL_JsqKVydDqmr-gyn1wt=1PO_p1NMze+1D+4qXWxGiGVLV9EA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: syscon: Allow syscon nodes without a "syscon" compatible
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_120330_985094_FEB88D5A 
X-CRM114-Status: GOOD (  37.03  )
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

On Wed, Jan 22, 2025 at 3:44=E2=80=AFAM Vaishnav Achath <vaishnav.a@ti.com>=
 wrote:
>
> Hi Rob,
>
> On 17/12/24 23:41, Rob Herring (Arm) wrote:
> > of_syscon_register_regmap() was added for nodes which need a custom
> > regmap setup. It's not really correct for those nodes to claim they are
> > compatible with "syscon" as the default handling likely doesn't work in
> > those cases. If device_node_get_regmap() happens to be called first,
> > then of_syscon_register() will be called and an incorrect regmap will b=
e
> > created (barring some other error). That may lead to unknown results in
> > the worst case. In the best case, of_syscon_register_regmap() will fail
> > with -EEXIST. This problem remains unless these cases drop "syscon" (an
> > ABI issue) or we exclude them using their specific compatible. ATM,
> > there is only one user: "google,gs101-pmu"
> >
> > There are also cases of adding "syscon" compatible to existing nodes
> > after the fact in order to register the syscon. That presents a
> > potential DT ABI problem. Instead, if there's a kernel change needing a
> > syscon for a node, then it should be possible to allow the kernel to
> > register a syscon without a DT change. That's only possible by using
> > of_syscon_register_regmap() currently, but in the future we may want to
> > support a match list for cases which don't need a custom regmap.
> >
> > With this change, the lookup functions will succeed for any node
> > registered by of_syscon_register_regmap() regardless of whether the nod=
e
> > compatible contains "syscon".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >   - Fix logic when a syscon is found in list to not return an error
> > ---
> >   drivers/mfd/syscon.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> > index bfb1f69fcff1d3cd35cf04ccd4c449e7d0395c79..226915ca3c93dcaf47bdd46=
b58e00e10e155f952 100644
> > --- a/drivers/mfd/syscon.c
> > +++ b/drivers/mfd/syscon.c
> > @@ -171,9 +171,12 @@ static struct regmap *device_node_get_regmap(struc=
t device_node *np,
> >                       break;
> >               }
> >
> > -     if (!syscon)
> > -             syscon =3D of_syscon_register(np, check_res);
> > -
> > +     if (!syscon) {
> > +             if (of_device_is_compatible(np, "syscon"))
> > +                     syscon =3D of_syscon_register(np, check_res);
> > +             else
> > +                     syscon =3D ERR_PTR(-EINVAL);
> > +     }
>
> Earlier the above check was only in syscon_node_to_regmap() , but now
> the users of device_node_to_regmap() also undergoes this check and there
> are few drivers in tree which uses device_node_to_regmap() without
> having "syscon" in compatible, likely those drivers need to be fixed,
> but this patch breaks all those drivers now, atleast the below drivers
> are affected and all TI platforms fail to boot due to this:
>
> drivers/soc/ti/k3-socinfo.c
> drivers/mux/mmio.c ("reg-mux" users)
> drivers/clk/keystone/syscon-clk.c
>
> All the above drivers fail due to the above check for syscon compatible.
>
> What is the recommended solution to fix this?

I've sent a fix[1]. That's not to say I don't agree with fixes to
drivers removing device_node_to_regmap() calls. If you just need a
regmap for within a single driver, then just use regmap APIs directly.
What's in syscon.c is for (surprise!) syscon's, and those have the
characteristic of being shared.

Rob

[1] https://lore.kernel.org/all/20250124191644.2309790-1-robh@kernel.org/

