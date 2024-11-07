Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3840D43346
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRDI+649hH+JjST3sTYe7hJR+KGryyCjtMm9e9Q722I=; b=oBoxMtBPqnejHq0V3zsX1sZci8
	wEUQ0UNFxJGQkEyyEowwzaWgbeKv7/yqW944uJE57afoIrGs3fmCNcL2TH+2Pkj+PXRJkSREnIghn
	jN81jH2cl9tgSDF99M7rUBMfpF4YMmXrnfJ07vMXgj6e4FwFHU7ucgT4WFNchhONYaa8mdb8UNpOX
	WiaByN+em8xCDcffCZ/CpMHV25so3DEuqYceXiF4q4ligZTjJx992TxbU4L6Gyt/tkxrhhwswnQ17
	ZqYlw+f0dsUrCK10G1Wq+tfaTXSFF9GXStHPz0W0wD/m6yaHEUKBWE1NDE7vdEAZH7tr97/HLc++3
	qBG96xIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Fh-00000006aLz-3xN1;
	Thu, 07 Nov 2024 11:00:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Dx-00000006a0J-3FuN;
	Thu, 07 Nov 2024 10:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69E4C5C57B2;
	Thu,  7 Nov 2024 10:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8473BC4CED0;
	Thu,  7 Nov 2024 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977128;
	bh=FvXI9LhKQeUyEplKY3xQXpUbOHKklovDwuvsPa0FIdI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h/iZoZ0j1WurWR4a9zvQ71EzEMHS16mmZBnmFH8ZLNHYFoTockfEw/LCNdnzgvSOs
	 EqM2iwLxmNAacR26GvzBJG5kTvG3MguI3ds0e0L3j0iwzdXs2Vjzh9ODdnFj6DHE/4
	 U/J78uWpB9WKp7XEhsz/bJ8poA6FCo+Jp49sCblr/9oDefe3yHvGrJfPSGZw5Acj7K
	 YPx49zJFSG89PeFbmf+QFXf+DPLs4pjlfNdvdKEE+hcuOJNNW8dOlIoo5l4X4UOb6C
	 Ei6Rk9sLFH/40QraQaEFY4NW+8+rQX6Rmaz9oNuyDcL258kKwH+eutzE+F96kEWM31
	 vu9OaDDp8NLuQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5ee3e12b191so357934eaf.0;
        Thu, 07 Nov 2024 02:58:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1QeJ7jTjwmR5NLqImMKb0v9kjJ0dJiJDVjNyztDzFHosMsOZNeq4iqjCQ2XXzNvMX9pb3DaPa5oaUO/aBemg=@lists.infradead.org, AJvYcCWD8rO0fFnZSXVKCtrig1Hjq1/HdAXIjxQhuGkHWN9/YL3Z6gLCnHlSocLaAbXKEcBtXFt2x7WqiVGzhWHGMuOs@lists.infradead.org
X-Gm-Message-State: AOJu0YwyWJXc+olMX54wKG/ci7MKrd67NDSYHjWi/bvs3xzQbyWJT7Ai
	6bct4cIooHj4dZ47sf84R8ktAqEuy8pmDb0L44VNxzjGUOZEYITvReR8sWWcwCpHworQ7JXF9I/
	Gd0bc0bY2ROeWk3UDQko2CbViIJw=
X-Google-Smtp-Source: AGHT+IGaFG/lGWoIgTdUCj6fF06/lKof9rgBxrGEdVjSBcAfxC5ZYl2aCRdvEnk/gXTBVlwbjmLcKxom0jCcxDGADBs=
X-Received: by 2002:a05:6870:780e:b0:288:5c55:dfd5 with SMTP id
 586e51a60fabf-2949effac51mr24463758fac.31.1730977126802; Thu, 07 Nov 2024
 02:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20241104113615.1397410-1-ruanjinjie@huawei.com> <786c90d1-29e7-72a7-acc6-394b3bbaeb75@huawei.com>
In-Reply-To: <786c90d1-29e7-72a7-acc6-394b3bbaeb75@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 7 Nov 2024 11:58:35 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jC9_03euACrmahnDRBgU=0O60p0rkChR2BVOxx0J2Pzw@mail.gmail.com>
Message-ID: <CAJZ5v0jC9_03euACrmahnDRBgU=0O60p0rkChR2BVOxx0J2Pzw@mail.gmail.com>
Subject: Re: [PATCH v2] PM: EM: Fix wrong return value in mtk_cpufreq_get_cpu_power()
To: Jinjie Ruan <ruanjinjie@huawei.com>, viresh.kumar@linaro.org
Cc: rafael@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com, 
	lukasz.luba@arm.com, qperret@google.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_025849_926490_AC0D6FB6 
X-CRM114-Status: GOOD (  20.49  )
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

On Thu, Nov 7, 2024 at 2:50=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
>
>
> On 2024/11/4 19:36, Jinjie Ruan wrote:
> > mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
> > em_create_perf_table(), the later zero check for power is not invalid
> > as power is uninitialized. As Lukasz suggested, it must return -EINVAL =
when
> > the 'policy' is not found. So return -EINVAL to fix it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW"=
)
> > Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>
> Hi, could this be merged.

It's for Viresh to take care of and please replace the "PM: EM:"
prefix in the subject with the proper cpufreq driver one.

Thanks!

> > ---
> > v2:
> > - Fix the driver instead of em_create_perf_table() as suggested.
> > - Update the commit message.
> > - Add Suggested-by.
> > ---
> >  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/me=
diatek-cpufreq-hw.c
> > index 8925e096d5b9..aeb5e6304542 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > @@ -62,7 +62,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, uns=
igned long *uW,
> >
> >       policy =3D cpufreq_cpu_get_raw(cpu_dev->id);
> >       if (!policy)
> > -             return 0;
> > +             return -EINVAL;
> >
> >       data =3D policy->driver_data;
> >

