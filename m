Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83161CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1O3Bu8zIjXMBP7ybKWRLHRE3Uf8XyblsScAg5IUYCk=; b=oB8SzbOxQinmJFOjgE6sRv57kt
	hmYWN/tIbA5LUCzHl5hgFuNHuSpxZlbfFN8M6wghvdVAxm4/ULExlp+zBGxWzL5UmBvUjK3X9vghC
	xVVsxV4nBNcuP5wbujz1RZSpiElSIGXVr/Q5u5V1i/rVwWvX2M1pLqo540943d7RaZI+lShxw1Aqr
	wen/byYHXinNr3OiZb6SiE/KqWGnE7zpJ7Y79mcjEXCLX/KBOBEtKDTqCmiTyINE9CwKdigr3SBTi
	lILSA3yyEMZDHrvimKLYef44RbedhOgD9jW7HgVSO7k8MsYaVEV5LifGkVVK8cj889+V2OOVMfxPf
	GJjp+zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmMd-00000006Lj7-1zQw;
	Wed, 03 Sep 2025 12:13:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlI0-00000006Aoe-4Asv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A008E44BEF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7303BC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897472;
	bh=cR6pggU98t/+Ukijic5qu6ZCN/k9GzBjkSxa8gGSKqE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=psxDQFNqUA0AxnW1agDCBjM86eBgZ74JT2Cd1rJz0r6c6YIg9L5yDWVB/dyKfbNqY
	 7ZLsa748GOiB7mhjhAd7ZfA8Kf0yz16s0PmWze8zgCN+oiV63DSrvCAm5l4CmHbQDL
	 oSTTmG5f6r+rVGC89dPywgVkBtO5/2saXzd0zWbC+lwxN43IbLc/N2JIFlZvmatvZL
	 wbA8HXmaSHcOjOr4RYxkDguj3NEv01VtIYQp0kZf52jVOP92S6DDJ4Ekq7SVZovP5I
	 yLR8QJOzVUwT5t4hf2flXG4hKNUFCxAwpJ3IHOkAiFFWl4mOkwRLbpmr6WQ2TSehUN
	 mmSq/SUEn6fUA==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74381e2079fso5220582a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIXcbDxjE7Gpv2Gme7h+6WCmk1xlStFE6tFurC1i4hLH4PzMQTd60pp1abVXDjrNsOV7sIpofrW8Ppwh9nS2RB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz+KR7ojXhlKfoQHM+QoFNiKU3fIA+JZTFq3oMqowbee6qnAOx
	85yBHZWXjiDeCPMk9z5eue3XlwER3JEfPf0vAEcLuPAZo/egYS0g4DDY/QAb2gkVOLnCk0DQD+V
	SWPiOhzytmgTRAUu3CqaBm1hZeLqhhRg=
X-Google-Smtp-Source: AGHT+IGt8cths8yMLXGw+ylAbBkNMXTKhbmkwbSixaLVjPRLTHE/ydd0R+Ek9LJwycoLKhw9INB3N/62z1RFfHnhrtQ=
X-Received: by 2002:a05:6830:6d0e:b0:731:cac7:3636 with SMTP id
 46e09a7af769-74569d7940cmr8468523a34.6.1756897471467; Wed, 03 Sep 2025
 04:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn> <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn> <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
 <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
In-Reply-To: <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:04:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g=riWtqaB=pGcxormmnaeFyRaeG1LZyEDBzpUGrH4kEA@mail.gmail.com>
X-Gm-Features: Ac12FXznI_bHraDGh_P16Ypv18F94Duvp6HYWc01eg81rI5FCsWpKSsYAvb2qr0
Message-ID: <CAJZ5v0g=riWtqaB=pGcxormmnaeFyRaeG1LZyEDBzpUGrH4kEA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250903_040433_073202_14F112D7 
X-CRM114-Status: GOOD (  28.95  )
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

On Wed, Sep 3, 2025 at 2:51=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
>
> =E5=9C=A8 2025/9/2 19:47, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
> >>
> >> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> >>> On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyl=
inos.cn> wrote:
> >>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >>>> annotation for policy references. This reduces the risk of reference
> >>>> counting mistakes and aligns the code with the latest kernel style.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >>>> ---
> >>>>    drivers/cpufreq/intel_pstate.c | 8 +++-----
> >>>>    1 file changed, 3 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_=
pstate.c
> >>>> index f366d35c5840..4abc1ef2d2b0 100644
> >>>> --- a/drivers/cpufreq/intel_pstate.c
> >>>> +++ b/drivers/cpufreq/intel_pstate.c
> >>>> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(str=
uct cpufreq_policy *policy,
> >>>>
> >>>>    static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
> >>>>    {
> >>>> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> >>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D=
 cpufreq_cpu_get(cpudata->cpu);
> >>>>
> >>>> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
> >>>>           if (!policy)
> >>>>                   return false;
> >>> The structure of the code is intentional here and there's no reason t=
o
> >>> change it.
> >>
> >> Got it. Thanks for clarifying.
> >>
> >> So for this case the current structure is intentional -
> > Note that I'm talking about this particular change only.  The other
> > change in the $subject patch is fine.
> >
> >> should I also avoid similar changes in other drivers?
> > That depends on who maintains them, which is why I wanted you to split
> > the patch into smaller changes in the first place.
> >
> > My personal view is that code formatting changes, which effectively is
> > what this particular one is, are pointless unless they make the code
> > much easier to follow.
>
>
> UnderStood, Thanks!

Although I think that it would be cleaner to move the code executed in
each step of the for_each_possible_cpu() loop to a separate function.

