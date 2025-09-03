Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2BCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8mClpVxiqUUuW2AJ7FygEu78/AmPq4S0W+oewFRLjY=; b=P54FuU0g9vWuNFhVX01J5qaieh
	kuSwVoiODKX8cKIE48IdhUVOHqjxRAGj2gIEfW0KQqJJZMDCsBQ5GcdxMioyK6svfkxQV9ujlp5UJ
	oOIzSBOv1zlZ0yyIDKfI+xI0FgysNEtRlW3Hi0nAlTI3YUChuRQBiUP4BQVsTn6wIhsXJey/XL+eP
	yBZISUcoXeOGKO1NwtatY0D0TIG0YForRJjhpCJlqqwTKnJcNigRxMDKlaqJ1HbKkeH8zYyKyLeBg
	flVQb2cKlFgIWB7oaku0HqD6EagbMoP/4AZp9yzTNU37N95lf2pXamyLvRlUg3NWbOOz0ThMtYkt0
	hpwYA28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrOF-00000007CTK-0m6u;
	Wed, 03 Sep 2025 17:35:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnk3-00000006dH3-2qnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:41:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68027449D2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41672C4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906899;
	bh=GdyS+4iaGJbGIJ9ctC+uFtQbJ57ANyqF8rmhb7Dc65Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gREu3S3cIIExxWuJPsc+munhlGaJtSwRMnS15DA4v0a6bQz6CWCrmik3TzYj/QUJj
	 3ZloY/8FCzhwS85PBka4CYNFeEOJbr7uVgfvXPdZeoAikj7Uo0dnGkAxWxGkG+5qsO
	 Ubyh/2IuzT8yKsZ/kPtNv09e6T7qhzcGrsaH6Y8fwLeZyjglfWVXXhr2JNPe5wC7Yw
	 F1Qxtcff4RNjFLRfNMG69ZKoOHxIslevyytvdomIhf8ZQZp2ywnG4IJCrefXprlYQy
	 PWeQU1n7TY41TrGtpOURB7CSxfyFAU/wyFf1li3R+PGyBGvuiJDKyH0k8eoNUsZlzO
	 OT60wNUwudvhQ==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74595f3852cso731584a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTVrjk8AOLNbyvyPigemT1SqGBiTf06XR0fGNfJo8GYQkInZD8Q6sL/rdJ4UuFSGobmW0EF6Bt2z7knOqhx9Hu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+NxkcuDDYCK8fhQnIZx4+IEM/kCjbRWRavrhM2LESNl9GzYbg
	UfUdifMnyVxYNGbgQkC65AMhisOuzD7N2DzxqfEabhdNZoEQUTT0f0tq2BGOLwhoFUcoFhd7gc7
	hyfZYg4CICc3yBLriGen0VZ2m0kV8o2U=
X-Google-Smtp-Source: AGHT+IE8CKY9R9M90mIkT56C6rGxrcA7dBv19VhPe7gEVCnw2r6FCP2pLXabMt9+rlKIM6nRFLb5/otuT90mPVIOHdY=
X-Received: by 2002:a05:6808:8219:b0:434:97b:5eb9 with SMTP id
 5614622812f47-437f7d74afbmr6249755b6e.28.1756906898553; Wed, 03 Sep 2025
 06:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-11-zhangzihuan@kylinos.cn> <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
In-Reply-To: <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:41:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
X-Gm-Features: Ac12FXyg097RI81OLcVmXs8LtZCLVL9SQzq0jRH5EJZq7nDwUhDORw8eege7vFE
Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] PM: EM: Use scope-based cleanup helper
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zihuan Zhang <zhangzihuan@kylinos.cn>, "Rafael J . wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, 
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_064139_761133_75F40AE8 
X-CRM114-Status: GOOD (  25.64  )
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

On Wed, Sep 3, 2025 at 3:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/09/2025 15:17, Zihuan Zhang wrote:
> > Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> > annotation for policy references. This reduces the risk of reference
> > counting mistakes and aligns the code with the latest kernel style.
> >
> > No functional change intended.
> >
> > Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> > ---
> >  kernel/power/energy_model.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> > index ea7995a25780..99401678e809 100644
> > --- a/kernel/power/energy_model.c
> > +++ b/kernel/power/energy_model.c
> > @@ -451,7 +451,7 @@ static void
> >  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_stat=
e *table)
> >  {
> >       struct em_perf_domain *pd =3D dev->em_pd;
> > -     struct cpufreq_policy *policy;
> > +     struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D NULL=
;
>
> This is not really correct coding style. Please read how to use
> cleanup.h expressed in that header. You should have here proper
> constructor or this should be moved. Or this should not be __free()...

I gather that this is what you mean (quoted verbatim from cleanup.h)

 * Given that the "__free(...) =3D NULL" pattern for variables defined at
 * the top of the function poses this potential interdependency problem
 * the recommendation is to always define and assign variables in one
 * statement and not group variable definitions at the top of the
 * function when __free() is used.

and thanks for pointing this out!

