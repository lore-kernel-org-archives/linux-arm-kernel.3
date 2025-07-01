Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8115C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=; b=X3Y8IHqRphKrBBs1mutLtwfhEM
	VeyGdtvHwRf1HF8ChLlln2x4El5nXLENoNTX0VG4dcCYLl7OhRRuIYKqz7O7UIy1hqp3elexlcajW
	qw9oOK5igN0I5vphVgSMNQT7DDQlDET3XiAW5/BS5pIFmdcdUC7uHHxAf/4nDJEM+S3OoKL1gnsLB
	6waS5spS4R8CeB5hVEXTG1BKH9iBeGL/DQv7MzlcN10+q89cbcUXxsmkvv67cQmsz0+pBn7ahoPZc
	bUWGabuELYAPSUXHorRtv5ooRNWyDFWBsX9m2V5uuASdrNJgLZ6Tge9LsON+6CQM1oKHwmk7o0aTA
	2iwz29pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfOE-00000006Itk-1zyE;
	Tue, 01 Jul 2025 18:07:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWctU-00000005svn-3yW7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:27:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so5850574b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383656; x=1751988456; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=Pcnwu3qPYnXCUbg2Nizs9BljjSMglFnMDRzFRk++/8sLLE/DzvnKMBv/eNw7KB9bqs
         tQDJeb71twwM+tAHMHQ/WvReW0wfOkonsjkPIj2Y7a2tHiRXjBBJuDrkKsWIp6kTQmg2
         R5Idk8lLcUCH5eD2pQKACydvDJ2aK715vzq4p79c4ItnoiLBKuFm8LkeYDdSd9T50iIf
         9g0GJ32n/iEBPHECqlwaUyfBc2OAtdpio2ifArac3roXOLIv4Ekam7NsTUW7gSiTQ8Zq
         rNnFizXffjtXAaFlSu8l7R0LEpRnMPGxwawZG2ZSxRYVynd7jFu7zZhFG4HpFFCEzTWA
         t6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383656; x=1751988456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=kAYYfpW0QvBo+E9rkYE9s90aTu6ce3wDMKGbr3Rzu20wPKFFCcIfFhEQTZ7pChj+yq
         oCEtiXmzF2A/MrKS2SpsSsVB1frAHwj0t54XrfnqbmyPnwlntBsVNcM6CQMRw5Nvxwvt
         QJ/qb2H9/z0H+sA0OyBNfIqGSo02Osex6n8FUcNTBGk1M+hK4+j7VG2DdV4JHz0jhoLw
         Gb69PeqRwZSDc6OUm/QGI2CF9vQXUL0qcrWSzz7bz0brt3wvLRM/QW4+p79SOs0BKdXG
         smw/l1SmhVBL7oVura7zwNoHdsQoL2uYt3yD73eKXcYG/rGhHnFKbV7RAZAsIgnq590I
         plmw==
X-Forwarded-Encrypted: i=1; AJvYcCWgazXY4u9j6yCw6yRxqA+fTTVB+e2fVyJVsbnF33Bw0lDcB9pt8W5I9/O9wWcHXQoTfiY7i7b299xSWV4t5J4m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy26c6N7jI169XUeUVZX3RjDAfWvOgZ33+9ZmC2b+mFw16yKIkT
	WJXbaOtQHSwXkhriH0wBRZ49ax1WmB8jereQ3qMiSj7/1JygyNlphsgmuH4K8M/UkFw=
X-Gm-Gg: ASbGncsWY/6xFCwe1kBVJcjAKomXj6ECaXaDiFKSqEiYVl97yP1/QA+eaf6Xjo66PN5
	pq510ueuc3dYhElZQ95ONL056kpD1OsqvarkF+gM/vmQRIGSmwhEDmQxqKQZuyVj9EafRDTzOfX
	+9vpZ0HV5Bvf7F+rQCk+6mCwiI/oREm0Ile8izPJXqkiHoH2WDxBpaeZvDCJOfL88FwCDFnf9r1
	ryNgFtSH7ZkBFtjnbWpm7JpR3FteyCtIxaWL7kc0dUEASGoLOFaUq0pqv6lJ5LCGYAqgQ0RzPKq
	5zh+sPORJuOVAQ0kuFfbm2MKR3J8EgsbkFxHDo1dGfimBn+UwraoGSwzDtDHEaz3FA==
X-Google-Smtp-Source: AGHT+IHwXE6TtTbogZXGrSWNeH17X1Eg9b1iMZBmFtEaqZg3w/0LyLCHYU1l4YImcwX/ylYXOnxCQw==
X-Received: by 2002:a05:6a20:914d:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222c99ba442mr6683521637.12.1751383656024;
        Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:94b9:2bc2:7ead:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4dbsm12287004b3a.160.2025.07.01.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:27:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:27:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGP-ZVuhBdd1GPLe@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
 <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_082736_993210_58C1C2FA 
X-CRM114-Status: GOOD (  31.70  )
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

On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> On Tue, Jul 1, 2025 at 1:05 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > > coredump, otherwise coredump will report an error "ELF class is not set".
> > >
> > > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > >                                          att->size, da, NULL, NULL, "dsp_mem");
> > >
> > > -             if (mem)
> > > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > > -             else
> > > +             if (!mem)
> >
> > Flag rproc->recovery_disabled is never set to true, meaning that since this
> > driver was introduced, some kind of recovery was available.
> 
> Actually since this driver was introduced, the recovery can't work.
> We didn't test the recovery function before. sorry for the mistake.

Let me see if I get this right:

(1) Almost 5 years ago you sent me a driver with code you did not test.
(2) It took all this time to realize and fix the problem.
(3) I should trust that, this time, you have tested your code.

Did I understand all that correctly? 

> 
> >
> > I worry that your work will introduce regression for other users.  Daniel and
> > Iuliana, once again have to ask you to look at this patchset.
> >
> > Thanks,
> > Mathieu
> >
> > >                       return -ENOMEM;
> > >
> > >               rproc_add_carveout(rproc, mem);
> > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> > >               goto err_detach_domains;
> > >       }
> > >
> > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       return 0;
> > > --
> > > 2.34.1
> > >
> >

