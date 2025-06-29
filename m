Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D011FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfieMz5m9Z2E/riszCvxx0vxjw0boZDSxhpy/iJ0gcc=; b=KkJU69ii2oMxh8TdzzYWPXphSG
	TKjgOKpNsdAHo8EMSRoi3DF1fnmVy+5VGiYKHiTkzlxO/Ymsc5W3erXmv8Ch+BdyfDKpedyHEueaz
	iJ6dAZ3eD99JNnHHc9Kl8EfizRiGXcEpqTqPDpDGoLO74AXn/s2BfFafMXev/m9qwrCj7wGb3+1Xu
	iIOXJeeTS4CYUN+YcJjIMygvs/2kMwRBoCcRHwiS+GmISTukRqeyaXaza2C4pWledWkTAG4KcEYtX
	QYv0lQ3OcEu/R7xZubt4QkbJ1XlNB84WRXCF3+k9St7IL471nxhBN6wkMB7Ce6OUeIksnz4hyWhQg
	3S86j0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVur2-00000000S7V-4Ae5;
	Sun, 29 Jun 2025 16:26:08 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVuoi-00000000RxB-1byL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 16:23:45 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6faf66905baso17353936d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751214223; x=1751819023; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfieMz5m9Z2E/riszCvxx0vxjw0boZDSxhpy/iJ0gcc=;
        b=HiG9vGjLTh6Xl7Gga7xn+2Huw4o4vhU9jI/hOjX/CkSx/OqD5IkrQKNdJwClLXSHco
         +3myRaxpEUrZMC2oi0cGwS7w7OjK8Iaic0PHuiOn75vtOBANzNj3sVZIps9ONQgHnvFw
         oacm+mYFOKM7Vl38I58KRN0BcvFZZrDwnce+rXDRomZAd5qj1W37DCxtyzygA2FEJpVL
         JmK7UOSFVE72dEH9isczhLWt6rIUd8mv0H7BU/70Oit/G5uRfTmLLSL7yKnqbFFy8DBO
         7iU/p1G2xMrh8GFsrh8+fRETWYMK4fWe9Pp8OV1BfCoAXuar0zrIvu5AAbmRiDD4BxFk
         eTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751214223; x=1751819023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfieMz5m9Z2E/riszCvxx0vxjw0boZDSxhpy/iJ0gcc=;
        b=GTc+rGDZnppeQFz/H80KarpUCMF/8Fksj8oWW+lIIcmAejPAxqRKZAKyS4N2+ukeDS
         y3z+DCXIGV5/gbS1p3Dk1uqgrt0Khwngn8j0VqTu5XBFucx46WtTpaMFOI2Erx2+/NIl
         gMnm50lBl8YwEGB4Q1iD9w7CxFla3m+Y7UUx7+wjTtipJHi8E7sUCcVpz1O46iCFAOar
         i0Pq2UPe0UEWkV5gi7X0tBQFwicKGr2CNMTFtYxQ0B5jfT6BlYbFeY8tV/cukz9bQdU/
         j7dq6B988/NYbWsd9lXK90bwx9QvF8fOHh7bzmlMiZzAL7PoZCuztVV7yOKeR+Noijnz
         FmNg==
X-Forwarded-Encrypted: i=1; AJvYcCUcoQBha/1nESVjIDubEFAXx/103LgxANrk5d4bkb9e3xi4A9EhiobSrVP7hG4XYtYgT3usKPHy5YaAcDAFLHOt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ZQWD/0e7S7z2YRP4g1mbyelPG9UZcwnwmQx8ALC8F1M1LOtg
	mNlhCbBnaGFf4OYJjpDfATDoeQcZHX6O19tXBsb0yEWomCCd7M1rTdwshCZvTnXH
X-Gm-Gg: ASbGncsGomGo+COA8WJkTTvormQKx+vDwaArSdX3lYpFl6Y/37UIIogTxrcy5UZREAI
	yyXgQX01mEj2vb2Tul5A2ubPuMExlkC+6y58m+pFlQGg/UWeRXpARlEVTdiGO3t3a46NjbnItIJ
	Hbm4dJg2Mz4o28nWgBZZiyxkzAuW4kShvHyNsJBukLsc6ku+2MLoukdv6w9y5wVEi9cBFdcePAv
	8jBLk8ozemYCS71VJ6uxO1iZvMaIU3ZLp0jYfLv0o7OBF7Xwf4oG3EbIbWAWrF+oNyAUNS7+NGU
	2uWg31cvWU8CXY/GN70fTaPINrtW/nWFXTBewm/cosBgP06jGq1XLnVFGiCc
X-Google-Smtp-Source: AGHT+IESfg0oyaXsV4gGFWt99icXqEwyys8YI4taj0L64tG5xEmVRuFGmG2zMdbH9gxzpEcZWddl/Q==
X-Received: by 2002:ad4:5aaf:0:b0:6fa:d8bb:294c with SMTP id 6a1803df08f44-70002deaefamr184709886d6.14.1751214222731;
        Sun, 29 Jun 2025 09:23:42 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e7301sm53047806d6.62.2025.06.29.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 09:23:42 -0700 (PDT)
Date: Sun, 29 Jun 2025 13:23:36 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250629162336.tazeqojyhtgnecmw@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
 <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
 <20250627144955.tbmk6ako3rgv3djo@hiagonb>
 <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_092344_428637_00F8BA92 
X-CRM114-Status: GOOD (  36.01  )
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

On Fri, Jun 27, 2025 at 09:40:27AM -0600, Mathieu Poirier wrote:
> On Fri, 27 Jun 2025 at 08:50, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> > > On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > This patch series depends on Ulf's patches that are currently under
> > > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > > Without them, this series is not going to work.
> > > >
> > >
> > > I thought we agreed to repost when the feature referred to above and
> > > the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> > > to do with this patchset.
> >
> > Sorry Mathieu, my goal was to update the whole patch series with your
> > reviews from v5 so you could take a look and then I would resend
> > everything again once the others have been merged.
> >
> 
> Ok, I'll take a look next week.

Thanks, I will be sending v7 with the missing reviewed-by then.

Best regards,
Hiago.

> 
> > If you prefer I can wait for the other patches to be merged and then
> > send the next v7 corrected.
> >
> > Best regards,
> > Hiago.
> >
> > >
> > > > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > > > started by the bootloader and the M core and A core are in the same
> > > > partition, the driver is not capable to detect the remote core and
> > > > report the correct state of it.
> > > >
> > > > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > > > returns the power status of a given power domain (M core power domains
> > > > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > > > already powered on, the driver will attach to it.
> > > >
> > > > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > > > return before dev_clk_get() is called, as it currently generates an SCU
> > > > fault reset if the remote core is already running and the kernel tries
> > > > to enable the clock again. These changes are a follow up from a v1 sent
> > > > to imx_rproc [2] and from a reported regression [3].
> > > >
> > > > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > > > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > > > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > > >
> > > > v6:
> > > > - Added "reviewed by" from Ulf and Bjorn.
> > > > - Fixed and improved commit descriptions of patches 2 and 3.
> > > > - Improved the comment inside imx_rproc.c file.
> > > > v5:
> > > > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > > > v4:
> > > > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > > > v3:
> > > > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > > > v2:
> > > > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > > > v1:
> > > > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > > >
> > > > Hiago De Franco (3):
> > > >   pmdomain: core: introduce dev_pm_genpd_is_on()
> > > >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> > > >     SCU
> > > >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > > >
> > > >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> > > >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> > > >  include/linux/pm_domain.h      |  6 +++++
> > > >  3 files changed, 73 insertions(+), 7 deletions(-)
> > > >
> > > > --
> > > > 2.39.5
> > > >

