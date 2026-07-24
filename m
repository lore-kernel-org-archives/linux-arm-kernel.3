Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D957CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=; b=MicXvufr0RE3vwF2SD/pHjXNDy
	AUbYOVClGT9W0fQfRvxuuMFWJi8Znl96HTy85i9aVqprWeWXSDeXJOVuW9M9m/JoIp15Ay4JAQSUL
	fo33T+QASom6Lrc3egOzCnxe+9FvvoBT6BGFQ8V+EDZn+qiKJfCc6+5+snet0ds+huFz+/kMM/1Ja
	PROVYWIUCQRlQge2QmEBXNvedFyNpqMweeTmqv3VddPjesb1gsOdt/NWZPbWZePdqtJI14IsNP3Lo
	W6kJcFG/JxLkbNKa/va6w0lCqa1YBYQ6OnFGgffsSrKhd+n+viP9qmLv4nCz3QfrfrmRQCoR6VZQI
	MMJwAmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL8b-0000000H6sC-0uNK;
	Fri, 24 Jul 2026 19:00:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL8W-0000000H6qn-1qHv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784919643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=;
	b=g80HVPU7B0FlAKS/x8rUvr+PbrLnKJu03tgmh87uMtox6kswnZY0S5v93jZH7zeZJ6ZRM5
	YOhNsVCqUVUWvGprfKdtu2qpW30DhcjzW1HJ5SLmHxC74tphfE4/WjTzmk29EQmqHYgNEi
	7ZqYDvH09yyC7XWkSay4X3PJ3760Dsw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-5KSFuhWMM36tRYTjFkjJdg-1; Fri, 24 Jul 2026 15:00:41 -0400
X-MC-Unique: 5KSFuhWMM36tRYTjFkjJdg-1
X-Mimecast-MFC-AGG-ID: 5KSFuhWMM36tRYTjFkjJdg_1784919641
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9309af14fd7so109731985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784919641; x=1785524441;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=;
        b=EXAl9rEjzQNmTemUZFAb+X1Wqr7ayjy72w86u+Z7sKwjt6qfiOmSdC9CoYLet5EKua
         gEquf1Ez/MbiF9Xr1VpiXK50XMnWVUf1FdSj5prma54WZglpCxQ4ev8XJ6rxyX3GGIoN
         XQpCALLz14Y5F152Ni2rjAa0bEJk99AKFIbXSPYc91AdCBfati3D95lt69VR6C3Dw8r3
         LZ97zTShUg1WAd2xP74cW3iBfu9tT5XsDv+7fBJK6Hc/cGNOUv8rhb1buJy6WsE3CRUG
         InhNiF9kYrUasYCKNzBlO83WTtq6hYQ7tq4Up13VmDcoBkpxKHtMRCJdf43rv79LIRB0
         CIFA==
X-Forwarded-Encrypted: i=1; AHgh+RoNTRwCP/swYv9+4vFMrfLnafomB3y9c5CzaifAv5Kj2ucA1HUw64B5Pdva/OgnYDrq7hFHAp+7+tH2ioVmCYT7@lists.infradead.org
X-Gm-Message-State: AOJu0YwV7Z1mmicd7/han0ZvkK3ng8phQJPpDqruP6v9BKU24kgkFV3i
	pXV4tg1IVF5JNAhIYUGdGf8bK03gU//Oxq5+PsPjfEd6u30zBRS2/iVxp+33gFxVWIbzoQ3TFrT
	bAYQ7edn97KBD75A0AHIxnrIQI4nDVdWqRy5SV7I9xAaQrNDeZB+TtwgUKOKUNrbP+zqdtVCBv8
	z0
X-Gm-Gg: AR+sD11G45xyzIj0ic3zHUC653iX1k/ETvtt6HR5NvnZ1hFYU0Cz1BOHkgQVHTfGETh
	U55KRH79h5sSc9veugejXvfKGx8d6zYypL1qT2cK0snbLVrdpxVwfNVz7In+09bIRQ4G+WG1LIY
	1sj3irVeYdQbOXVUH24u1pdyJyW988KbzFLsInUyGk6qw/+5zX1ApiZQm3Jp9gCREAttIood3CM
	SJ+tiBbpEza9ey4jRPsIFMP9dl43KOPSjWf6RZbjAdV01+jM5pnX23kNYMLj65HmxANBBBkr+y6
	veueJ73wBqRfk6uq7jgTGntWbxeBXeLgSzwIPtEPFf6KYYaY3f+aN40VeojRfowUW/WcnnLDvrx
	DMQZimzby5zHgLUHm52KlkJzRguQWGJOvNbw=
X-Received: by 2002:a05:620a:3912:b0:915:a111:86ae with SMTP id af79cd13be357-93103853ca1mr848658185a.35.1784919640798;
        Fri, 24 Jul 2026 12:00:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:915:a111:86ae with SMTP id af79cd13be357-93103853ca1mr848649585a.35.1784919640237;
        Fri, 24 Jul 2026 12:00:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6aab2c7sm714011885a.46.2026.07.24.12.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:00:39 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:00:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joakim  Zhang <joakim.zhang@cixtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amO2VSHtSQE98CNz@redhat.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
 <amJEjofx348vF4Vd@redhat.com>
 <SEYPR06MB6226EA6519C74A0FF0AB677482CF2@SEYPR06MB6226.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SEYPR06MB6226EA6519C74A0FF0AB677482CF2@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SdWtHuKGoRtlyPr5n8av-I9LXsIGE1IxeH8fONbd_EY_1784919641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120044_559438_7121D510 
X-CRM114-Status: GOOD (  32.62  )
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

Hi Joakim,

On Fri, Jul 24, 2026 at 06:14:29AM +0000, Joakim  Zhang wrote:
> > -----Original Message-----
> > From: Brian Masney <bmasney@redhat.com>
> > Sent: Friday, July 24, 2026 12:43 AM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kernel-
> > upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
> > 
> > EXTERNAL EMAIL
> > 
> > Hi Joakim,
> > 
> > There's one question from Sashiko that I don't see where you answered that seems
> > to be legit.
> > 
> > On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> > > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > >
> > > Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps the
> > > CRU registers and registers mux, divider and gate clocks for DSP,
> > > SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> > >
> > > Four SoC-level audio reference clocks are enabled as inputs to the
> > > internal clock tree. The driver releases the AUDSS NOC reset, enables
> > > runtime PM and instantiates the auxiliary reset device.
> > >
> > > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > 
> > [snip]
> > 
> > > +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device
> > > +*dev) {
> > > +     struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
> > > +     const struct sky1_audss_clks_devtype_data *devtype_data = priv-
> > >devtype_data;
> > > +     unsigned long flags;
> > > +     int i, ret;
> > > +
> > > +     ret = sky1_audss_clks_enable(priv);
> > 
> > From Sashiko:
> > 
> >     [Severity: High]
> >     Could this result in a deadlock? When a consumer calls clk_prepare on an
> >     audss clock, CCF acquires the global prepare_lock mutex and may call
> >     pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
> >     which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
> >     clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lock
> >     again.
> 
> prepare_lock is re-entrant for the same task (see clk_prepare_lock(): if prepare_owner == current it just bumps prepare_refcnt). So calling clk_prepare_enable() on the parent SCMI clocks from runtime_resume(), while already in clk_prepare() for an AUDSS clock, does not deadlock. This matches how CCF recursively prepares parents under the same lock.
> 
> That safety assumes resume of the AUDSS CRU is driven from CCF while the same task already owns prepare_lock. If another device device-links to the AUDSS CRU (or otherwise runtime resumes it outside clk_prepare), a concurrent clk_prepare() can deadlock:
>   Thread A: holds prepare_lock, waits in pm_runtime for our resume
>   Thread B: in our runtime_resume, clk_prepare_enable() waits for prepare_lock
> 
> We do not have such a device-link usage today. Would you prefer we add a short comment near sky1_audss_clk_runtime_resume() / sky1_audss_clks_enable() documenting that consumers should use these clocks via CCF and should not PM-resume this device through a device link (or other non-CCF path) that can race with clk_prepare? Happy to add that in the next version if useful.
> 
> > I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your driver and it
> > calls clk_prepare_enable() in probe.
> 
> Exynos AUDSS is only partially similar. It clk_prepare_enable()s EPLL in probe and keeps it enabled for the lifetime of the driver; its runtime PM callbacks only save/restore AUDSS registers and never disable that parent.
> 
> We cannot follow that pattern. Our parent clocks come from SCMI and also gate the audio subsystem power domain. If we clk_prepare_enable() them in probe and leave them enabled, their enable counts stay non-zero, so after system suspend (and on runtime idle) those SCMI clocks cannot be disabled and the audio SS power domain stays on.
> 
> That is why we enable the parent SCMI clocks in runtime_resume() and disable them in runtime_suspend(), instead of keeping a permanent prepare/enable from probe like Exynos.

That makes sense and thanks for the clarification.

Reviewed-by: Brian Masney <bmasney@redhat.com>


