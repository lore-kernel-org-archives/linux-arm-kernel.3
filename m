Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E0CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDs/WMXVmHJglssnG9XWE+nsIv0PIfh++s/inuvdTo8=; b=EAx6KQdEMEO4ooIm7kFfnZvXTy
	eo9VPFCWwH+GGzpUQN+nLQiadbtbXioKOd9C5HkD+l2pHsxvNYfMSphESik/u5boFmTQIAM1s1v8R
	J8PSiab6lMgV9nApqkUw22ffaF0rJKELwYfv7D3YW6MJCN6hSEbxS2rpQFd1zqDY5brragdeNumZi
	O/t5RgKQ5c+YTrBLOKvkOWrJklgKjdSpGgEED044jKmzSjnndCcWhAXYlZsZ7+HRKOm6DlFcJ/8MG
	wsh5wia6bnVRzZh/QJAXrgZW6vdAlLh7kDPnvxGUxY0Tf8PpgJWNv6oGLOrgBOXFhqb8W+dCCzV19
	pqkTZrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Yc2-000000059G9-3q1w;
	Tue, 30 Sep 2025 11:33:42 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Yc0-000000059FL-1uF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:33:41 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63604582e53so6041520d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759232019; x=1759836819; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDs/WMXVmHJglssnG9XWE+nsIv0PIfh++s/inuvdTo8=;
        b=YVgygEqooydBawGovZrdX7kiOWy2FKwOSg+pz3EHlxMhmkyMgRO+n7sFdgJwBdZNAb
         KzALzC8wlU2dtoEo0o3DoPiGY5XIs7FkjgmjqKNIjbvJDWazUc3CLQc+/rocK2+aBHNb
         JoCp18bBtQ0ijJRFjOx3NhI/9oVRY/5NJn+KStD2NZVDcK+ftpR9wh2wg8I0qsWYaYbg
         xypM5j2i2ts5YIVL6iGoRREKnKQBzBUZ7Xwrr9sglskWGN0AzZ0hfajaVEoKEFvHp8sS
         8lgHl/1F4hRr3mIW2wSq5/MXVnTGwHkekCta7enTnFDTyWgo0qqDdpmIn1UwIBdFlElY
         NlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232019; x=1759836819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDs/WMXVmHJglssnG9XWE+nsIv0PIfh++s/inuvdTo8=;
        b=SZkVDuYUFyIijSZ63wn0CA3h5mDgcgc9zQejPbT9eALZQ389PXuTSwP6HGFO/t9AAD
         kzCqTAEx6LTdPixwiSfiY667IPGLe6qYbnd2DI+7UXIfm7TrVJb3Ohbu7DfHYTfBCKnw
         AXc50HFx6Ri/ZBbhs/pMJR/em0F4c4c4ouHWPVCLF4Cd1rjjXYRcAIdKt0ECgLeOSZ5O
         Cmq1OggE0eSxC8pbAcJl6UxmIHuBe84Jcn3VO46WQk/T+//LzGppSG0wDz8ZDbVtuCRT
         cZuni3SZqDOAfxFf17dNXK8yjNESz2OXwPupZl3X9cdRekTALYGZxCLgNTA+u86QAZMf
         itCw==
X-Forwarded-Encrypted: i=1; AJvYcCWL4lmmvb493a2h0vXgTyQISWTF1jZkNJzXWw9wG6nLReDYBgDQ7MvexRcQoL6pwu0b+C4ch+e8kn6R0Qj3YmET@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4PbOfKfGxmVfRSNMqvVvHtuYEJaVBrDn88o3FCTBz3Ziwrke
	r14hmk1wGbGuQEeOKtForB/uIM5JJGjjTMflGg82kYAq9KDsKtjvs24rwHa+kiP6hyW9GC2qjGq
	i3g0fnHjU2daQh4uY0BPUuHsBHPdVCosOjdiAgFdCgw==
X-Gm-Gg: ASbGncvlkkiWmDCX2pfRnjm5Gb+P6nUT3j5UMkPQjHoebezsGLRGvKxlrxP3ZEQ21zw
	/2ZMw1wPBMVmWUDYZioh2RoMDHKGqXRVmE4imLKzymzYlXgCg9t7EvB+tkCxkLCycH7nY73sF1v
	WLDXm7ykY2SUsn+dAjnfVc9thqdW9ywWz9Kp3VzvTpxTUZQGtVaxUMT4excTvKqxNKRA4Wa1PoL
	hEynmS7blsLj8ZAalv+RtwaxGrZZvhP
X-Google-Smtp-Source: AGHT+IHYmCvXrXmx8HmNfb0uqyUyQC6vlR8zFTUyxQ5hryXAvEjUkDhlD0XShN9tuuH78Lwr0Mzk9/lfRrtMdvf7nzk=
X-Received: by 2002:a05:690e:15d3:b0:633:a326:3b07 with SMTP id
 956f58d0204a3-6361a85ed4bmr19217063d50.24.1759232018880; Tue, 30 Sep 2025
 04:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
 <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
 <a904d953-acb2-44f6-81bd-118f7abd22da@nvidia.com> <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
 <CAGETcx9CpOgtPSDK_qPRQ_u58w3fedSFAfFzugXW4eYq2TLECw@mail.gmail.com> <be41e552-e626-4923-a9e7-15acbafc19e3@nvidia.com>
In-Reply-To: <be41e552-e626-4923-a9e7-15acbafc19e3@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Sep 2025 13:33:02 +0200
X-Gm-Features: AS18NWC6HazxLFWbq662GHZ2xE_fLUSaAJYkDxvuA_xOhIOH2MGGHtfY_xpGVhg
Message-ID: <CAPDyKFo+8fw0GrFOazekXrb0zNsRkhzVmbOg45YZU+T2dm_SJg@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Saravana Kannan <saravanak@google.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_043340_518220_5549CB8E 
X-CRM114-Status: GOOD (  29.07  )
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

On Fri, 26 Sept 2025 at 17:32, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 25/09/2025 23:31, Saravana Kannan wrote:
>
> ...
>
> >> I have been doing more testing and do see a lot of "tegra-bpmp bpmp:
> >> sync_state() pending due to" on our platforms for basically are driver
> >> that is built as a module.
> >
> > It being "built as a module" is not reason enough for this warning to
> > happen though. One of the main points of fw_devlink is for things to
> > work just as well with modules.
> >
> > In this particular system, do you never plan to load the modules? Or
> > is the module load just missing this timeout by a few seconds or
> > something?
>
> We absolutely do load the drivers. Initially, I observed cases where
> drivers are missing, but doing more testing with the necessary drivers
> present, I still see such messages. A lot of our test infrastructure is
> set up to use NFS for mounting to the rootfs and so I am wondering if
> that can also be a factor?
>
> > If these can be turned off, why not turn these off using the sysfs
> > file or the timeout commandline option to turn them off? You are
> > burning power by leaving these on. A warning seems appropriate to me.
>
> Again the drivers get loaded, so that shouldn't be the case.
>

I realized that we also have an orthogonal, but related problem.

In fact, the genpd in question actually may already have been
powered-off, completely defeating the purpose of the printed warning
that we are discussing.

In genpd we enable the ->sync_state() support, no matter whether the
genpd is powered-on or powered-off at initialization. Although, it's
only when a genpd is powered-on at init, when we prevent it from being
powered-off until the ->sync_state() callback gets invoked. Ideally,
we should be able to skip enabling the ->sync_state() support for
genpd in these cases, possibly silencing some of these prints. I will
have a look at this and get back to you.

Kind regards
Uffe

