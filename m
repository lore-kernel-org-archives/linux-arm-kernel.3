Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD7DCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ8t2bboIzd7cHm3OScP5qlwpTcm1FmAONHyDli97iM=; b=cidNGFhmPhGuSxS4kbzwhDKPRX
	hrpaN+DhGPgJ5O56MCFhWyBgdLVNhOwO8eS1XOp+eB7YmZaurDmWcvnedQXGUzwpLdxe+cw1mj8WP
	E/8z/cWBwPM0hH0Rk0ypSdOjWLvtpmrMQAesoS4hUU1WGPCW6h3ChbUorRrPw4ItEyfta2tWDT7Kv
	0O5Ba8Qpr+lGSxj4ZLda24hN1lOlzADcR5H748kcjq4r7CLacCKfipTYY9nlDy/QyyrbMJ01Dfe1m
	/qOxBMGTNd0YGgku4Jl8HaRAt0vZ8v7ZaERqalsrP1XGu+MWLWqYGx4KhNEot/E1e/joAUIX+4Gpe
	ZNprTaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSBs-00000000QFg-3kXQ;
	Tue, 02 Sep 2025 14:40:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPUH-0000000H010-3xoO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE27244AEA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD0FC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813665;
	bh=gAWv/p7BEF+KhNFGeotQ/1FrGNmecWyX1X5tGPHcCbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HPfsH/6ZQcNOGF26sYaQeEFwmNMIdemb3Sta1S24MP4Zqrzhp4xCYmME5rlpIalRH
	 wypS78addLryNXm+pxr8ZGRJ6CcNSwygSiD1yVSMsso71z9NbVxptxqSwM6eYw/hYg
	 E0n3a2RupUKViIi/xlJEoNXhZ7BEfE1ktdGaf5/LFZ2Ez9stJf6othwGdlk629boGF
	 /qfOkz7gPd4OTUDCeTkBwoG5jhFrt7JDvzdGAjA8tfRoviw73ahpeW1eDDr4LJyfaL
	 kf0/YFTRyn96EDkuB2SQEiQU90yOjmPyWIIFwn87EXpdsYgRoiI9E5Ci5ZKOtauLQA
	 Z0F2061pPrGmQ==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74572fb94b3so1757813a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwdaxEBYKU0jTM60nlaIOBWjGtg3wt9XNciXHfiQ8IUmHmVVvvp/YgRO7b+tjpdNu2Air7RM5Y5+R18ID2MRKj@lists.infradead.org
X-Gm-Message-State: AOJu0YxRVoKbH2ZUH4CG3j2o1Fu4aJbIw1X0d3luZd7+T1nQPpz/XPDp
	n58ICJ5/VXjKOcUJgDNvCUtND5WJPTeC6vEkTcGb5PtEwGWBOCC/aCOEiV2NzfjjcYVbgCqcyyH
	MIg9XCQW53MoIimSpw2XK/cKPX2FPXCw=
X-Google-Smtp-Source: AGHT+IECJJHjGAnU1NUr4ozcxCWnRFCL9WRpq+BEhjBinEbwysmqVcNyjx+zeZUwmYMUKeDdT6dFc6CYWYPr3CoZ3wk=
X-Received: by 2002:a05:6830:3746:b0:743:8af2:1b0e with SMTP id
 46e09a7af769-74569e90f29mr6034860a34.19.1756813664724; Tue, 02 Sep 2025
 04:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn> <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
In-Reply-To: <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 2 Sep 2025 13:47:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
X-Gm-Features: Ac12FXxFwO1d3JYj5phS50T_U2DONG2wuxBfs8rK_GU-NaLU6wYAD3eFplzuixw
Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
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
X-CRM114-CacheID: sfid-20250902_044746_021920_56749CE2 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/cpufreq/intel_pstate.c | 8 +++-----
> >>   1 file changed, 3 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_ps=
tate.c
> >> index f366d35c5840..4abc1ef2d2b0 100644
> >> --- a/drivers/cpufreq/intel_pstate.c
> >> +++ b/drivers/cpufreq/intel_pstate.c
> >> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struc=
t cpufreq_policy *policy,
> >>
> >>   static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
> >>   {
> >> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpudata->cpu);
> >>
> >> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
> >>          if (!policy)
> >>                  return false;
> > The structure of the code is intentional here and there's no reason to
> > change it.
>
>
> Got it. Thanks for clarifying.
>
> So for this case the current structure is intentional -

Note that I'm talking about this particular change only.  The other
change in the $subject patch is fine.

> should I also avoid similar changes in other drivers?

That depends on who maintains them, which is why I wanted you to split
the patch into smaller changes in the first place.

My personal view is that code formatting changes, which effectively is
what this particular one is, are pointless unless they make the code
much easier to follow.

