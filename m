Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF8FC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzNEH5LOAV7uVf2fuNEUyq4fxGqo7XGg0gkJqBbGqwk=; b=iq1fuCxiSFSZMbyFVJFllpAl8J
	bVQ2TtPMVMerfnZzXtQc5f6lwVj0l+WoyNEXR/AZJdop+FQ2e814oUfihi5TJRaNfLmJRS1R8D3q0
	oXWKbHRRw+sYsVt9OUFzDxqqE+oBLZ46BRF0i8D6xmM5trGsbSkW5EG9IbVTDN2ZBACA/7oTdxlPd
	cLfvza7DtvDUWQvh7wYo6MFV5KpBeOA2wSCH/xJzkPco+sMrH4w7ueEIdzdNNPkuwVidhNjPY9cF7
	Sm8dM4eX3boO51xgn5LywJVAQNrFI9bfl7ZNR7JnTuhl9tKmL0ZsJXySv0TeA/ID6DbuT8uqwLeCW
	CMdq0VWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl75-00000005y9n-1sJA;
	Tue, 15 Jul 2025 19:14:51 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhj7-00000005cX0-3BBQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:37:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3402176b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752593873; x=1753198673; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzNEH5LOAV7uVf2fuNEUyq4fxGqo7XGg0gkJqBbGqwk=;
        b=yU94/eDProDZuM+l2SUpFV4ujFYuDqpLhVJztFfJ8/r9JC4fRymhkbWTH0LuIe7Qn/
         9W3ofpnIv1flhq6JbdRcycOq/Mxi7gVKK4cS60mgu2mRXIWUINx95ZTA/3k7LJw7xIrs
         +og7johpR/3Eadt2P5HGCwNI9eUjRUnv80qJ1Ucdx00TF+LugZF7BAXTOrupT9jIghOT
         l36PO5JJIgnHdRuP3tq0gjhToXnz3U1iEYlfCWhkTG6BBw1ApgW/tTZII2zD3aOa0JSx
         xLIgerbJyn9+gHM8F4wD6M2RkN0apdzmSZTcR6mdiqx7XPgZ6BqfwWJEMxYCg+2XZ0pb
         CYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752593873; x=1753198673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzNEH5LOAV7uVf2fuNEUyq4fxGqo7XGg0gkJqBbGqwk=;
        b=JqdgN1VD6eePgHQQp7dywMuE3ZtfsrnShr+OxxuTbX2f+btCt7B9ERG31odUP1wwpg
         eO/nJx0HFV9Dx4H/c6MTbWYvkvuNj+pCcWYAPz68C560VQw4pz8f37u71nLpw8Mr2Dqt
         6m4j/gEj3GbXjdTjWdiSnsllCoW/aRdJoDuzQ9b9iAez2lH92Dtjcf1mGXEPkNCpeDF7
         RADC/f7uiwQv6UfEi9M6aH8W1bannOeGBbZrka44BJdf6MTXaLmobZafbYWSHjNwdjUh
         FkbB9R0MDXocmZwGiWYf3liNEbyivtLY/Wpm5jFw2FMmjNLzCTrSdEjsWBTYFjOBhhYO
         FUog==
X-Forwarded-Encrypted: i=1; AJvYcCVKkIYXh5i40OwKfbkllVNNP0X17QnklCwtR8bHgUhByDwG9WqcOMIcRxlMOyIAvUdomGTPwAna/bTyqSPXlwZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz39M59HQ/BhblbSn9wzYE3kFbTSnEMqlJMyl5LiqCuLGXHk8s5
	0oLC2csSuQwrbSKPDUPiRdErAJMFiRA9EQdrOu10trZV65LtIRLq+y4gKpFTWT2pf8k=
X-Gm-Gg: ASbGnctILQFjpmXSj/xuXiEC6YaF5ZZ+yVxuZyJYYMRPIciSabBft24TLDbvaiiXTFG
	KKOqWaCjdpwQU4MUNrA03ole5NgkE1algNiVokHe1qF4a3WmZVS1rVlfBWsObeqx1qE32qA2P4X
	2fq/5F/7pR8wZSF2Iq7vw9ad1z8dqOUHbPkVnetnTYwUl3KGivET3S+hpwDRH1gWl/BFqiK/hch
	0dKJXcpWnW7P2RyjxJJ4zbHkhSKUX49MJMQbAA1vEz6R/c5AUV17SMp5LiznBkqBiNImbjioMcS
	wzvAwfP9T7D2baVvKyBR/Kxri6p3jSoSFE+W+iQcqcabJ9ZFHXihYDYBIeju59BenIJvuyBcPYp
	K+B5ul5VVezDm8e7NjGlyTBwk
X-Google-Smtp-Source: AGHT+IGfUd3Wq8tKCUsCK6+tRCHhWda76Q4+cIiZSoc97uhXtJTnyEkJT/SdNOXKgCueM3T97WS1Aw==
X-Received: by 2002:aa7:8887:0:b0:74d:247f:fae4 with SMTP id d2e1a72fcca58-74ee0bb5748mr26983642b3a.4.1752593872779;
        Tue, 15 Jul 2025 08:37:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3f17:6d67:cf82:708])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd605dsm12780538b3a.18.2025.07.15.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:37:52 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:37:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aHZ1zRiAuX2PVYcU@p14s>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
 <aGazjaJQXl03HUJE@p14s>
 <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_083753_801011_020E5A08 
X-CRM114-Status: GOOD (  32.43  )
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

Hi,

On Tue, Jul 15, 2025 at 01:49:42PM +0200, Ulf Hansson wrote:
> Hi Mathieu,
> 
> On Thu, 3 Jul 2025 at 18:45, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Hi Hiago,
> >
> > Many thanks for re-working the changelog and comments in this patchset, things
> > are much clearer now.
> >
> > Thanks,
> > Mathieu
> >
> > On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This patch series depends on Ulf's patches that are currently under
> > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > Without them, this series is not going to work.
> 
> The series above have been queued for v6.17 in my pmdomain tree.
> 
> Do I have your ack to pick $subject series via my pmdomain tree for
> v6.17 too or do you think it's better to postpone to v6.18?
> 

I may have spotted an error condition that is not handled properly in 3/3 of
this series.  Given that we are already at rc6, it is probably better to way
for the next cycle.

Thanks for sheperding this work.

> Kind regards
> Uffe
> 
> > >
> > > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > > started by the bootloader and the M core and A core are in the same
> > > partition, the driver is not capable to detect the remote core and
> > > report the correct state of it.
> > >
> > > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > > returns the power status of a given power domain (M core power domains
> > > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > > already powered on, the driver will attach to it.
> > >
> > > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > > return before dev_clk_get() is called, as it currently generates an SCU
> > > fault reset if the remote core is already running and the kernel tries
> > > to enable the clock again. These changes are a follow up from a v1 sent
> > > to imx_rproc [2] and from a reported regression [3].
> > >
> > > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > >
> > > v7:
> > > - Added Peng reviewed-by.
> > > v6:
> > > - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
> > > v5:
> > > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > > v4:
> > > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > > v3:
> > > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > > v2:
> > > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > > v1:
> > > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > >
> > > Hiago De Franco (3):
> > >   pmdomain: core: introduce dev_pm_genpd_is_on()
> > >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> > >     SCU
> > >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > >
> > >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> > >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> > >  include/linux/pm_domain.h      |  6 +++++
> > >  3 files changed, 73 insertions(+), 7 deletions(-)
> > >
> > > --
> > > 2.39.5
> > >

