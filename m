Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD25C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=; b=W+hxIis1z3F/yJfWGrHWlczvwQ
	V2YoKMB/5kW5LeDHIauShbN3NTqsIZKY59U/F5sef6wh0xv83fWOazs1bOX8u6uFeU+JKY5utQK5i
	aRL/oCn9Tybhqd4j4xanRtniLXN7RpdWaoCVmuEt2TUNQr/mw0OnNQFnQGfa20Q6GNyZMauOK6Sux
	aXErg29+o4xKVmZ7jIx1JnY81vwBzu23X7dhoDmrFnow59caCWusY5SsRdgsdkwGTJMr2wiOOk2hj
	DsbG5tcs/PA0/LVsQ4JrSdJE30MMJs8exy/RkWgEH7HRswHnBChtac/yNR01JO03doLAGZsN1iQ85
	+pGFLGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeWh-000000052Lq-3DZX;
	Tue, 15 Jul 2025 12:12:51 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeAu-00000004zGt-1EJ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:50:21 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8bb7beb33dso459149276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752580219; x=1753185019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=kyRAzLd/gmAmKC7vtfWemRCr6CLunPG65M/jBvyhN3IyNSHenwgfX+zkCYMz/Hppl2
         n2B97L6RtqKltbkK0fhIYLDSOq1LU6zfEqo6zJ51gkurJ/dJN4ojm5u/Nv7O01eitz85
         21nwMI+KYPA1Av7ZiDSK6IsXl1TV4cobsSogUFfvztYK8ildQZo6zgKtiqHpmbuo+QqC
         2oblNomDYqsK1gIi5vw0UfpIltRS/zV6TWTARag4lUAnIPl8cxlnSeNCrkXJj2SKhwRq
         QiQcUu0pRb+c2zrZ4BsZP88MRymszReh+KRtCxZGzmc/z/0blifia5WanLtLJ6vSDKGA
         j+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752580219; x=1753185019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=sBSt7xgO4XKDBNWdWB3v8Y4v2qmqhtlL8IAGKBZF5g7bYTKU8Cu65hnvWWLXF90zXB
         8EnWBzUyB6629AsR27Nn6Q2Bg2zT/xAOX2J13dnQn06IU1rXfdN2EH4l/rY2PzN9mDiL
         50yFyeuGskvhT4Y28LWi5n2ley30G8LpnDiP4SUNDLsoP/AePEUyo/Y8qVTY7ei4MRFS
         e9zziVy7rIEZyUGWFWkzMl9OMWzKjAXLthXR3ss9D8WCoqjUkg8JeO1QjyiajMLR9neY
         K/LFEglo47/gsBWhSXFM2AHVFaAgaXUJqbqYyq4zqNesBNJXjWdsCkShxJyzC6AA4UGJ
         B/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSZUY2pEnWSwSGXeaTGp249E2tnX+yuu7z6eII84BinyOxTHoectkDcxQk9nPoKFgfKv78PBi0p+x3GQySL8uz@lists.infradead.org
X-Gm-Message-State: AOJu0YwRam7ZOTJcL8tEyfTfpBwKXFhv1GIg9+A/2gpjlLRkqZFUqi3/
	RPaNR3axbBiFso2iHACk5j6Xil3joLwi0mzHsTpsRuKML2hO1hnJDs6bBBlKZHKp2z1IwP7EsAC
	od/I3HRyqwPf5h2s+8gDP3zV67puu+PMBLbd0W//VoeLyKTY56rl/
X-Gm-Gg: ASbGncu4wOzoxehAN5b0gcNKIM6xpP7EUlg9PHkHuBkxm9gP8t6lUkaZhYz6Sh1Qvv8
	k9agBogL6u9FGt/F/hU/H3DEP2FneBnPce61pAYnFw/SGBRQymsTES41CYNXNg2UYW0595s2oHY
	yfqWZt120rA3reX1JtSugV5nOLjvskB00X4pY3mru8qbigBlIpYGRQO44T70PR+wBR+0VpRD7h+
	g4BI5F/
X-Google-Smtp-Source: AGHT+IF/K38yeveYq70L/mHAPtfjeL+GIee4NoKApQPc4/AmworpqftrKbu0K7Q7h4oLInJZL2btkmXzEuBJtreqbG4=
X-Received: by 2002:a05:690c:7483:b0:716:3dc5:a35f with SMTP id
 00721157ae682-717d5e94ad5mr256657057b3.19.1752580218628; Tue, 15 Jul 2025
 04:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250629172512.14857-1-hiagofranco@gmail.com> <aGazjaJQXl03HUJE@p14s>
In-Reply-To: <aGazjaJQXl03HUJE@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 13:49:42 +0200
X-Gm-Features: Ac12FXwJ5N_wrB84X7RLvjAxpSUj8wCAKwcHpPhNOwV7kx7yjVIlAOOax7yXEA4
Message-ID: <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_045020_341167_80353F21 
X-CRM114-Status: GOOD (  26.35  )
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

Hi Mathieu,

On Thu, 3 Jul 2025 at 18:45, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> Hi Hiago,
>
> Many thanks for re-working the changelog and comments in this patchset, things
> are much clearer now.
>
> Thanks,
> Mathieu
>
> On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.

The series above have been queued for v6.17 in my pmdomain tree.

Do I have your ack to pick $subject series via my pmdomain tree for
v6.17 too or do you think it's better to postpone to v6.18?

Kind regards
Uffe

> >
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
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
> > v7:
> > - Added Peng reviewed-by.
> > v6:
> > - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
> > v5:
> > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> >
> > --
> > 2.39.5
> >

