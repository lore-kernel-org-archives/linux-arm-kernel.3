Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE9C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqbSv16TWmOZ1tCKRdG9fVrHT8YvAibNNtV2008YnIE=; b=1P2Qo/KmyAu1aGCRJtwhQ/gv8j
	LVWlohD+9E+vziKVoH/amL3yvDk0CTn2LJp1RZTR02K6Uw4n3Y174qr9gCHDH1MpYTFW+fvYKRaAU
	gxHN9OoH72NlaRPnrDrqi2YCCf+HNiEwxJLeR5LyEbk0Z4iut/IEpoFmocHc09v63PO/FDv/+aRbc
	JiZGVK2oRfj8muNp369rWbADrI7Wa9PuKRME0yjCkFKvaMSMM9hvUhJIxgf/AwEIX/z90LfktQm8W
	G8YNMaTWLPH1OoAO5HFJbD+oRMlcXAvuoeiOtDe1qrQNZBAPrNkVtul0h+/jnr+vh0CCkPZTGCCip
	3gKoytbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts16n-000000063mq-3Zia;
	Tue, 11 Mar 2025 15:01:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts13g-000000063MQ-2Tch;
	Tue, 11 Mar 2025 14:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3AC75C6485;
	Tue, 11 Mar 2025 14:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED553C4CEF2;
	Tue, 11 Mar 2025 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705095;
	bh=y4ryVf0YNOjwtuAvfEB/68jmLIXNfkpji8SHUgQfHwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NR0tVOSg1upZbE2fEnyq9W9Y3RVKJ+tzky3/D+NrptcRvtdtGIWka/OYqly8MeSpp
	 lo076w/j5pWmgipzkujd5xbRgbtBnKD17m9kM2OOZLTqto0fy8xOrPzXDq5DKv+s2l
	 8Gnuyx71HplMB2FE9EZ3yBpwlxvZg9Ck8WL5ZE8KswsxlZ2CQjzvaOOFlwg1F5IpN6
	 fIR7Ht2Iph5kvMCIHhYCLUsas1FS7E3k8G1L9j03WTAdlqfL/yEwBslCuWgmURWkjD
	 oHhikPGChRCkC7VT5m/rET4dXsDx0+mTsLKnuSrGjKF+qC6t0/zyA1TRHC2nXV4zsX
	 6kDLqw8p1twvw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2bc66e26179so2361853fac.2;
        Tue, 11 Mar 2025 07:58:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHnXrafMSPAoYtM/Mp/ulDMokx70qrWcn4lxdYbim6L9gJZpsJ6anVUZyBqDaABqbMA0mMmXHHriSDYWtdwlTA@lists.infradead.org, AJvYcCUeT+b1eTrJq24R8qZAx4/ZD/vOKtFGKPui7/Ybmx95kyieD+kxc+h7yoE+IBhUj4oI+iGXhQMk4x8R1No=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHnWK+AvN15T8TO83JwJRAoGbhsED7GmPYb05QFow33761SdWA
	sFed0BLHu4+wKMSVYVPo5F0S8QOjDWgzo7yZmcT00WHIt/mgwaOVrE4fzap+wEx0XyEGkJEvFmg
	wBPxIadxJvge8UYVvVDN2q3Q4ieY=
X-Google-Smtp-Source: AGHT+IFQOxYvpetHFZ5qF/modjQEJMQgK5sXcQo1XO+E1NqNBmeXGZ0DgBu5WKIIpycj+LOLM2pmlvVhXDd30xgHFNo=
X-Received: by 2002:a05:6870:b906:b0:2c2:5270:f182 with SMTP id
 586e51a60fabf-2c26136df6bmr9904732fac.39.1741705094125; Tue, 11 Mar 2025
 07:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250307145547.2784821-1-ping.bai@nxp.com> <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
In-Reply-To: <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Mar 2025 15:58:02 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jpg9YGKxiXZ8IeOPwdPNsqgPkaGl3fl_2Y1dOoOEeGA0VymC_oHOAASzwc
Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
Subject: Re: [PATCH v5] cpuidle: Init cpuidle only for present CPUs
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: rafael@kernel.org, Jacky Bai <ping.bai@nxp.com>, daniel.lezcano@linaro.org, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, james.morse@arm.com, 
	d-gole@ti.com, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, imx@lists.linux.dev, khilman@baylibre.com, 
	quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075816_741001_7F871000 
X-CRM114-Status: GOOD (  15.51  )
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

On Tue, Mar 11, 2025 at 3:43=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 7 Mar 2025 at 15:54, Jacky Bai <ping.bai@nxp.com> wrote:
> >
> > for_each_possible_cpu() is currently used to initialize cpuidle
> > in below cpuidle drivers:
> >   drivers/cpuidle/cpuidle-arm.c
> >   drivers/cpuidle/cpuidle-big_little.c
> >   drivers/cpuidle/cpuidle-psci.c
> >   drivers/cpuidle/cpuidle-qcom-spm.c
> >   drivers/cpuidle/cpuidle-riscv-sbi.c
> >
> > However, in cpu_dev_register_generic(), for_each_present_cpu()
> > is used to register CPU devices which means the CPU devices are
> > only registered for present CPUs and not all possible CPUs.
> >
> > With nosmp or maxcpus=3D0, only the boot CPU is present, lead
> > to the failure:
> >
> >   |  Failed to register cpuidle device for cpu1
> >
> > Then rollback to cancel all CPUs' cpuidle registration.
> >
> > Change for_each_possible_cpu() to for_each_present_cpu() in the
> > above cpuidle drivers to ensure it only registers cpuidle devices
> > for CPUs that are actually present.
> >
> > Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DE=
VICES")
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Rafael, I assume you will pick these up? Or let me know if you want me
> to take them via my pmdomain tree.

I can pick it up.

