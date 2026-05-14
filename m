Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3E4CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ranXWKRhhfeffYG39L6YAknxenMYzYXGHr09Vb/2vp0=; b=GA/NqSRQxAEJdzXddyqb54eZ6a
	dc8e6gvoPC0yfta7ftK0RquXVyO23JqxV1RYzPc8ATrxF4D93J1p5GNFCXBvt0v99cFtq5R2zAEsq
	5kdOPi4S7YV/aeRdf6WHFr+Tk+biQpAOGiVinYGLnj+T1fiXHTKjWDPXeSoCc+f5MQp6TBFz0aYz9
	jKbv9WXdmBoJ2JwvjGgFx4fKrJLLlbsDVwEo4lmdu84ydCAPJZj7O64Yj+Hi8y5VEDucbkNJaINAy
	FZNweKad7SjcuJ5TAs1bCZPUzB83hqW4vkUM6Hcqqe1wWyoYVairTsCspJOGVdyjkNAVo+CFHT146
	8AEIcTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZZY-00000006ACS-3cVB;
	Thu, 14 May 2026 17:10:08 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZZW-00000006AB8-1fgC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:10:07 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-71-86-nat.elisa-mobile.fi [85.76.71.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4gGcJf05VvzyNR;
	Thu, 14 May 2026 20:09:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1778778597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ranXWKRhhfeffYG39L6YAknxenMYzYXGHr09Vb/2vp0=;
	b=NBmeMdjENBZTv7/Amm+WcH+TaIAVge9MiDpPc7lqohkAw3Yxll7B2Fq4P31BjFEqxZAZXr
	pvhjydh1WCfWORgWOg7eggMsIXKqgoM9EW/k/DMxGVsEfVZYkSFKhzJIuv21phLMxkSVBR
	TGl6dqLpHkSmVHQ46MIhlLNzay74470=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1778778597;
	b=QPYw6Vu51ExZfbQa3Xj3m/1pL5ULQl202XrGAgHYwZCmkap4askr0+RYiySHKCPNWTm/uV
	wQHfc5vQ0ZKht7lm/yg+tcPi/ZITb+Ip0VPf12Lu8fZoL3twhhNblYyVrQCsyuKT4sm0/4
	DGI5syvOFtPw+Kh1soGrk9DAPhpIuJU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1778778597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ranXWKRhhfeffYG39L6YAknxenMYzYXGHr09Vb/2vp0=;
	b=lUtqBFVa0qm8A+UC5ouzsPiunNWCpn+iSiB1yuaIBBvGrtv+En5LaVobuqeSEBiTKnfC2y
	a8m08Fn+kifwUh+pl19P1UNOM3zGNxSn88WFI69Vd74FwsWDtnuaJ4T/0xx9pB7lI4RZl5
	WkgloBlnkeewHzjEJTAEv2NZbGWeEmE=
Date: Thu, 14 May 2026 20:09:51 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
Message-ID: <agYB3-T9yz9-hdr4@darkstar.musicnaut.iki.fi>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
 <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
 <20260513145926.2dc4d037@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513145926.2dc4d037@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_101006_612478_BA44451D 
X-CRM114-Status: GOOD (  10.66  )
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

On Wed, May 13, 2026 at 02:59:26PM +0200, Andreas Kemnade wrote:
> On Mon, 11 May 2026 15:34:39 +0200
> Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > This converts Nokia 770 to using real firmware node lookup for GPIOs by
> > > attaching the software nodes describing GPIO controllers to their target
> > > devices.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Hi!
> > 
> > Gentle ping, can this be queued now for v7.2?
> > 
> So any objections from your side, Aaro?

It's fine.

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

