Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009FAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uRLCXdLzb4exE9EX3UwPPfJOF++R02ZMsB9cLfhyoQ=; b=pDawBW5I0sthbimsWq+ReLKwg5
	aIqTGV/5BSDsqQCsPkZFMIsDilfy2Iq28Me1kl/IkCMLNIGInMO1J4REWbhFKSzeIrJfWJEpfvGcc
	e9SW1EFabzVXGVtg0pZTYW48l3K+NJmGIM8Bs5YDiGLMzNkYt0tdNVB3FpUdtPda6ERcthPpH7u6o
	0pG4kR42UyiLccNlhSH0Z13oQ5FUWsgTDX10bx0/qAm/vCIYtS08gVSfE39UvEbVJ2WZo19ncWZVy
	IS+f8v6+loSbUB4iakn6tXX9gd/mltwwTWkXisaoat9qiszss8922MU52vQFHIKFdCIeEcV9xO8cu
	1BL4l84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSck-0000000BAFk-1vux;
	Tue, 03 Jun 2025 14:28:18 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSWf-0000000B9fD-2G47
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:22:02 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-72ecb4d9a10so5733554a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748960520; x=1749565320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uRLCXdLzb4exE9EX3UwPPfJOF++R02ZMsB9cLfhyoQ=;
        b=beCOrLxfw3/uky9nrqaXpMaAFW1zenyNpNEZP3HYxq86aIswc3Kkn7JCZ2ri14A2vp
         ooBao5zNCiYMLi48XR5UJwYac1gQ8gvV+2KiyuBya8r6/Uh+uH3+vuMJlRLfagMXNhyA
         WF/AYXMzls9gMLhYczTDys1Uvpew8zooLRr+u6BhFSRK9leLp730V8m5gxl3n6nYgMkz
         B15V3MnTsnApLL8rSXAT33/EsHgwSnz8U2695ys7MHDHnuZEIE7wd/o33SKTWdp+uT7m
         M6RpJuiBV4vdCSm4yVpR23WiCaOlxFcvy6X81ABpDANlPJRcKaQyWZiKwEgYLsnHO/PA
         wmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960520; x=1749565320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uRLCXdLzb4exE9EX3UwPPfJOF++R02ZMsB9cLfhyoQ=;
        b=PPg4wbOp+v/ZJ5KdiF0TLICQOwjRoBIPjaOj3Pij8FNKHYM5I0AGAKev6GGue3eqKn
         rkhqM2DiCYSGgAjsz20QEswkT1mn4AIWGQ3dlOfCZRD2xzOi5GwEVUxqgofKtDeNSnyy
         Zsfwhet1NuSpzLkCdIQLgsKGSnFfZyAEVmLarKl/fVXtBFQ8B9mUGLj+WumOq2FI5nQ5
         FS6GhVT3iqzGZA8F5V/M5ivNvYa/Z4bloiK1ZrmFNgZ0JsiuLQ/NZX4Y6aKOW2cXNzYq
         FeREGokmSpmksdMwZNNvEd9/l4hqUXAH+nJp4AWsn7Pf3FJeEoNpX3fbrQ74927QWMn7
         rUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVmcyYOLErGxXbBNbhYSBzlkRweBcq4/5gdEeDIeUGkTzS8THHvzYuSeE+Grt8TedwYT2Wo2E4hlDVTMovHULsX@lists.infradead.org
X-Gm-Message-State: AOJu0YxrQG9RyZ+by0vojZ4T4Ny6p3+E7XTrq9K8DS8+Xn5+54OkDQse
	grhTqf8+ayCMNU3HJPqWMN94tzJIE8zECNQcnohZFRV2MvW1Yr/cERIF
X-Gm-Gg: ASbGncs8gy4hzYt3r9QT4vCvTwdFXnnKNdQNxvkUExtz5v2fEB7m8Cfx8wplOGInJI4
	AG0zQGFy6ULGN+3NCAt1zCZ71scHnJ6ajR708qMYDojW6WawCumDKglezv444rsh94Wgx7TcQzV
	vYC4FDA7mVQYtNIPlI+NKWXYlJzqlKFSnTNIVsLYt4bbpHN4MqmHZYHuxXHAfBhR6PS1cfKwfrc
	i0/0zvKrfYjyf+K81sJEOcwm83a6FLXpphrOyRyrBCZ28NTVSBM4QChykZ+cWFOocqunUM5nlAQ
	HIkUhAjwFQSm7gWTmu0KvJTdw7hYSN8JnKLBDdVREHWtwxRSRmSHNGVsdJhO
X-Google-Smtp-Source: AGHT+IFkCT6KXDiNwC9LZ8x7mvQVq5dsUSOwWeNt5tI1w1w2MQsYARI+9tl0cuB6j+Q1q13EXmEjPQ==
X-Received: by 2002:a05:6830:6687:b0:72b:94d8:9466 with SMTP id 46e09a7af769-73676b969aemr12031524a34.28.1748960520043;
        Tue, 03 Jun 2025 07:22:00 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a38f77dsm7670028241.22.2025.06.03.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:21:59 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:21:54 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250603142154.6xa3q7gd3kxk4kxo@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_072201_579660_9DB33389 
X-CRM114-Status: GOOD (  28.72  )
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

On Tue, Jun 03, 2025 at 02:09:14PM +0200, Ulf Hansson wrote:
> On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under review,
> > "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> > this series is not going to work.
> >
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> > powered on, the driver will attach to it.
> >
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> >
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> > v4:
> > - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> > - imx_rproc.c updated to use the generic power domains instead of the
> >   SCU API call, which depends on Ulf's patch series.
> >
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> >
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> >
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
> >  include/linux/pm_domain.h      |  6 ++++++
> >  3 files changed, 59 insertions(+), 7 deletions(-)
> >
> 
> We are awaiting further feedback on the other series [1]. As you have
> tested it, may I add your tested-by tag for it? Or perhaps if you can
> send a reply to the cover-letter for it?
> 
> Anyway, for $subject series:
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Sure, I replied there with my Tested-by. Thanks for the review.

> 
> Kind regards
> Uffe
> 

Best Regards,
Hiago.

