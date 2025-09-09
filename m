Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E7ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeojvgOoj27fx5wlpnFPiJSqcaAod3+dZ6jf/qLHH+c=; b=2xfS/Hkh7WNcrqC13Iqjgs6WPN
	OpOyjsf+vLZeuybUyq2Qnn7QAx9T3MJZzZ1RgCv6QDx7QL7wixwHNeZT8WfHinLig/s7wp+n/kuH4
	MGFp9FLlvTNVwoapEt//O1JRYozSE/SaxJmQJDivLWH6dlH4zpk8gjArKvVTjugFraRnBdHGMaYgN
	NL3FlqUGxN9FejXyNLcy8jpe8o2/VAdFTrQCSX3Qjl9jGwu4wOZGdOZbbe1uvINYIImQjFsDlzABF
	/M+MttZJTFWknJU3KKpVZkdNvRseyFnGPHLHxDWh3DLgzfXBRiZNVLt50l1XX0KsF412aaGBHsKRm
	ZiEnb9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvudX-00000005xyi-36K8;
	Tue, 09 Sep 2025 09:27:39 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvskd-000000059O6-0FeY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:26:52 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-746d754f656so2997908a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402810; x=1758007610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeojvgOoj27fx5wlpnFPiJSqcaAod3+dZ6jf/qLHH+c=;
        b=JyqoS+ReXQOh5iab+HRiwlXMUaB9lN9ik4+j7QUKrpG3VojaGNnfuZXu/I9Vp/Vjsc
         r4HTCGXi5854Nwv4nlwwuwuut2YUNXtumxcIW2E6AjHxPzstztniOERrEhL9o6GHVo9r
         qfOwfoc/ygJsaqVhG2I8osG7T8YqiWCQ0Y0ANMUVz2wW4K+6zs5ky5Z8RajymvdYIf7o
         W0nqqhtf+LeQQFhDF2tuMtP6s53Ilr7QmbCXb/iL35Z1zMc7Swy0kopbkXhKueNfGwII
         VnkFPnm3kngOFlD/DRqwo0wQrGCtIBlgEjHWcpLVQE0QZLIMSpsUBJ2HJJir7Bizti6h
         B6mg==
X-Forwarded-Encrypted: i=1; AJvYcCWhRSX20Tkmn+ddEq5YVzwG0/5yusatL0/XFhvrh6L/itwvOnjlJnW/KZb6+txZT0O8NMdPWGQTSZzRtrnCFFQh@lists.infradead.org
X-Gm-Message-State: AOJu0YzSqIdC6b6d7F5F/k2ynbuu9UoGbBa5yCYYR0hV+L/FZbOvBTWF
	2PPwNaggxJ6g1kK5s1ToLdjwNcnHwWBND+JhjL78YyTz4x3YqlZlPaRTAMM/rx3O
X-Gm-Gg: ASbGncvpTbyP6wZfV6esC0DfM/EKTx5iP98n/IagjV/ONvox3mQ40e+vNXtCFoeqptW
	WW8JF9TQEUCSAbAr09EOelTVmBT5ETNYlOiqSBIegfED1tVG0ASdGjDjVHkXpnspZHItTN+BQRT
	s42//255CPwYgJ3PoYsc/NDxacy7k+N4KobF+JBkwYSk0VxHFUArzLcsDlJjR+pg8Lph4iLbn0p
	xRK0+pwY+CkPrT18p97fJHvzJJ5wqwD1nANM4e5Kh/oXDD5sNTgE0UjoxSkZ25pvX0reW/kDU9k
	2gjrOepi+4/TVZWacFd1gR2eLuNOEqRncLHCaOM6MBTNF57QUIvNLdjjzyKLA7zBhNYJEI8kLQI
	n9KSLACXHXY4f16HbkObS/MwJhGabDHexqEHMHSC73Q6EYrzaWlnNuJQMpSoj
X-Google-Smtp-Source: AGHT+IF76DZccjfUmpLGmJwd98ZKHuwNUukQHeh8xlMWS0upzNKOQoZjBLZF4tZigleWJqRbhPKA5g==
X-Received: by 2002:a05:6830:7010:b0:749:17d8:5c67 with SMTP id 46e09a7af769-74c71e04e4cmr5697794a34.14.1757402809659;
        Tue, 09 Sep 2025 00:26:49 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-74ed123b612sm2205016a34.34.2025.09.09.00.26.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:26:49 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-31d6e39817fso6804979fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNaW8b05YGM86/V0+8xO5oE0/kZtqI7wmxkg8lWNwMN5Y1QGYG/a8mnSy4ZRHSx6+btd0ZhlEPaSztRIzLWPxx@lists.infradead.org
X-Received: by 2002:a05:6122:2a0e:b0:539:1dbf:3148 with SMTP id
 71dfb90a1353d-5473a6b5e5dmr2681615e0c.2.1757402393942; Tue, 09 Sep 2025
 00:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
 <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
 <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
 <CAMuHMdUAhsZMbkUzwb=XnCNyvA3aOvuhkKL4=1nOPQ0w0if-HA@mail.gmail.com>
 <CAPDyKFrWv3ObciCtrb4YE_K6to5xxx79DGcPv0=nP9LR60=xYA@mail.gmail.com>
 <CAMuHMdXoLnQR_hB-jXeGxAudwwpFRcQjrQcCb8iYCOz32yHinw@mail.gmail.com> <CAPDyKFqvjeuXhk7H4nH80RY63QfKwGO_61UW=MJaU8Qiahbt3g@mail.gmail.com>
In-Reply-To: <CAPDyKFqvjeuXhk7H4nH80RY63QfKwGO_61UW=MJaU8Qiahbt3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Sep 2025 09:19:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6HpuAR+CgChWXrH_59R2VtQh6aYzFr7TxbwYqhTvBFw@mail.gmail.com>
X-Gm-Features: AS18NWDmHT-3R8QmqJ6KdmkENOe2qYT7JumC9ZBMppvAjXadPk6DLp2HtLSHeEQ
Message-ID: <CAMuHMdU6HpuAR+CgChWXrH_59R2VtQh6aYzFr7TxbwYqhTvBFw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002651_103425_5353367E 
X-CRM114-Status: GOOD (  74.14  )
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

Hi Ulf,

On Fri, 5 Sept 2025 at 13:09, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > > > > > >
> > > > > > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > > > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > > > > > > due to e6020000.watchdog
> > > > > > > > > >
> > > > > > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > > > > > > clock-controller for PM_CLK handling.
> > > > > > > >
> > > > > > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > > > > > > these bogus pending states, and no PM Domain is powered off.
> > > > > > >
> > > > > > > I see, thanks for the details. I am looking closer at this.
> > > > > > >
> > > > > > > In any case, this is the main issue, as it prevents the ->sync_state()
> > > > > > > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > > > > > > cleared for any of the genpd's for the genpd-provider.
> > > > > >
> > > > > > I was under the impression there is a time-out, after which the
> > > > > > .sync_state() callback would be called anyway, just like for probe
> > > > > > deferral due to missing optional providers like DMACs and IOMMUs.
> > > > > > Apparently that is not the case?
> > > > >
> > > > > The behaviour is configurable, so it depends. The current default
> > > > > behaviour does *not* enforce the ->sync_state() callbacks to be
> > > > > called, even after a time-out.
> > > > >
> > > > > You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
> > > > > behavior or use the fw_devlink command line parameters to change it.
> > > > > Like setting "fw_devlink.sync_state=timeout".
> > > > >
> > > > > I guess it can be debated what the default behaviour should be.
> > > > > Perhaps we should even allow the default behaviour to be dynamically
> > > > > tweaked on a per provider device/driver basis?
> > > >
> > > > The domains are indeed powered off like before when passing
> > > > "fw_devlink.sync_state=timeout", so that fixes the regression.
> > > > But it was not needed before...
> > >
> > > Right, the default behavior in genpd has changed. The approach was
> > > taken as we believed that original behavior was not correct.
> > >
> > > Although, the current situation isn't good as it causes lot of churns for us.
> >
> > I did some more testing, and there seems to be a similar issue with
> > DMA controllers, which I hadn't really noticed before, as I have
> > DMAC drivers built-in in all my kernel configs.  If the (optional)
> > DMAC driver is not available, you need "fw_devlink=permissive" to make
> > drivers probe devices that have (optional) DMA support.
>
> Well, after the deferred probe timeout, the missing supplier depency
> should be ignored even if you don't have "permissive".
>
> Typically we get a print in the log that could say:
> "pm-test-drv pm_test24: deferred probe timeout, ignoring dependency"
>
> ... and then the driver-core tries probing the device anyway. It's
> then up to the consumer driver to allow probing to succeed, even if
> the DMA setup procedure fails.

Well, that didn't seem to work. Perhaps we still have some drivers that
do not handle -EPROBE_DEFER correctly. Will check...

> > > > > > > > Upon closer look, all "pending due to" messages I see claim that the
> > > > > > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > > > > > these devices are part of a different domain (usually the always-on
> > > > > > > > domain, which is always the last (32 or 64) on R-Car).
> > > > > > > >
> > > > > > > > So I think there are two issues:
> > > > > > > >   1. Devices are not attributed to the correct PM Domain using
> > > > > > > >      fw_devlink sync_state,
> > > > > > > >   2. One PM Domain of a multi-domain controller being blocked should
> > > > > > > >      not block all other domains handled by the same controller.
> > > > > > >
> > > > > > > Right, that's a current limitation with fw_devlink. To cope with this,
> > > > > > > it's possible to enforce the ->sync_state() callback to be invoked
> > > > > > > from user-space (timeout or explicitly) for a device.
> > > >
> > > > That needs explicit handling, which was not needed before.
> > > >
> > > > Perhaps the fw_devlink creation should be removed again from
> > > > of_genpd_add_provider_onecell(), as it is not correct, except for
> > > > the first domain?
> > >
> > > There is nothing wrong with it, the behavior is correct, unless I
> > > failed to understand your problem. To me the problem is that it is
> >
> > It does print wrong and confusing warnings indicating the problem:
> >
> >     genpd_provider ca57-cpu0: sync_state() pending due to fe000000.pcie
> >
> > (no, the PCIe controller is not part of the CPU PM Domain)
>
> That's a good point. We should fix this to avoid confusion.
>
> > > just less fine grained, compared to using
> > > of_genpd_add_provider_simple(). All PM domains that is provided by a
> > > single power-domain controller that uses #power-domain-cells = <1>,
> > > requires all consumers of them to be probed, to allow the sync_state
> > > callback to be invoked.
> >
> > if it would be just coarse-grained, the link should be created to a
> > device representing the controller, not to the device representing
> > the first PM domain.
> >
> > > If we could teach fw_devlink to take into account the
> > > power-domain-*id* that is specified by the consumer node, when the
> > > provider is using #power-domain-cells = <1>, this could potentially
> > > become as fine-grained as of_genpd_add_provider_simple().
> > >
> > > Saravana, do think we can extend fw_devlink to take this into account somehow?
> >
> > Doesn't the pmdomain core create a device for each PM domain, so the
> > index could be used to link to the correct domain?
>
> Correct, we have a device associated for each PM domain - and when
> of_genpd_add_provider_onecell() is called, we get the index associated
> for each of them.
>
> If I understand your proposal, you are suggesting that genpd itself
> creates the device_link between its corresponding device (supplier)
> and the upcoming consumer device(s), at the point when
> of_genpd_add_provider_onecell() is called, right?
>
> It's an interesting idea, but I am not sure it will work. To create
> the device_link at this point, assumes that all the consumer OF-nodes
> have been populated (to have devices available for them). Maybe there
> is an intermediate step we can take to instruct fw_devlink to treat
> these "links" differently?

I am not sure where these links are created. In the example above
"ca57-cpu0" is the device name of the supplier, but that is not the name
of a platform device.  Doesn't the core create devlinks between platform
devices? If yes, who creates this link to a non-platform device,
and can that code be updated easily to take into account the index cell?

> > I also had a closer look at the few pending sync_state() pending
> > warnings I do see on SH/R-Mobile SoCs.  Their PM Domain driver uses
> > of_genpd_add_provider_simple() instead of of_genpd_add_provider_onecell().
> > E.g. on R-Mobile A1:
> >
> >     genpd_provider a3sm: sync_state() pending due to f0100000.cache-controller
> >     genpd_provider a4s: sync_state() pending due to fe400000.memory-controller
> >     genpd_provider d4: sync_state() pending due to ptm
> >
> > All three domains were already handled specially in the PM Domain
> > driver, as they must not be turned off, so these platforms didn't
> > regress due to this series.
>
> Okay!
>
> Again the prints are confusing and annoying, but in principle we are
> fine. Thanks for clarifying!
>
> This also makes me wonder if we should skip enabling the fw_devlink
> support for those genpds with "simple" providers that are special
> (GENPD_FLAG_ALWAYS_ON and GENPD_FLAG_RPM_ALWAYS_ON). It doesn't make
> sense to track consumers for them, I think.

Makes sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

