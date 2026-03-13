Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F80107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZHP+nmQxYBG9XCuehu/97dhHO1vliPQgGZ+V2Z0h3w=; b=DRFiKJytDhovOUVzRYRFB2aNt5
	kPo1QM4r3ZxST3K5dpT8uSDGb+A7KfvXdX2oVcBo6TCUSfQ8594cQr7Lf4h01FD6qpfrIQUn7xn9C
	YpBSjBvNtqHA8jSD5wxwXCXq6Yk/pbW4xtGeYlVpxytzlAQSsyxgSJZuaNSDarOea2HYh9936+G/y
	I+WCkXII9Rwwfi414FXecrHz/3aiIwTfb3rCI82pdEXDyJwTlTTdEq7naxiAtoREL6EDwW/K3Qjkp
	P0wsp4o/jKly88KsJeOxRcQSyGBiRuwRCB6dg6G2Q+/UvxLeR/AJJ7KPAiogoUAfJiBJK47Pzf9v2
	2nql7+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oD-00000000hRm-1r94;
	Fri, 13 Mar 2026 16:56:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15o6-00000000hRF-44OT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:56:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso22251515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420973; x=1774025773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZHP+nmQxYBG9XCuehu/97dhHO1vliPQgGZ+V2Z0h3w=;
        b=ei38Gy3teX0sDCqghsG/ns75+bwmEv6qhQj95mtyzJIdkSa9zB/xLk5JpCuK91V2MN
         HYhYiyZkGzr30IAabZVf2zhIfTkfGyyOlHzCPdPQ9rijY1s/D03CGIFB3bQGwMAxpnsO
         kzEcKfve9tCp3MbvujhFiSsXg4lcMNITUFnnY+gwC3R1Mx12XeFDEi/eefJ6ndBB3CMg
         Wl6StPeBFcwmrIMiHpmoNWLWAlisAsqikMgHeONQ6ew6+KBO4vMmeLvT1JJQ2GfID3NQ
         nyMJ3HhtPUkioi9UjplaXLdV+MlDhbACdSoDwzCl1vPlsrFdak/UvhbdtzsJcuqM9Otg
         nJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420973; x=1774025773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZHP+nmQxYBG9XCuehu/97dhHO1vliPQgGZ+V2Z0h3w=;
        b=mOxQeA1kLB/FBkk+1GVWG9DdVIXeNZDLVPcsK2kYMR2E53d+dgIjE2Ym6I3Y8J8zWs
         KRItP3lr137t2kxmXIvD0YSauaTbPcvxb8vhQ05MupN+Jxz5nSfK78tr4bWaSW1EwuLT
         A1/bBHftGeCxfWdE182KQ28a4u09Jl32ZeK/mYd8aktTNJ1yTA05wxenlYJYuj179GMU
         tnvToXx5WB8ygiOOBwLVrtHIinsai8fEtLtbMuL6Q1ZzIYTR6iG0UKxI/JPn6lmt2DHj
         gYSkKXz8Ohkdlp7TqG48jlp7xmG3ldXxNpU7vYYFJ8YtSRMRdDvy0IRKBZ+ZB9CoBpOP
         Gl4g==
X-Forwarded-Encrypted: i=1; AJvYcCWzs8h5f0/Kd2JfKJ26LK6y9dcKIA3/GPpErqkR97CYFKaWHw99/Nuwk1pfZN2yhhIJC9ZY2SdX71zuENSMPtW2@lists.infradead.org
X-Gm-Message-State: AOJu0YySW++KFpDcw6Wm2WZ41TL8TB08127VVXDlWyHxvflbAOXi8LM+
	t6wFVjBKxi5gXOvOpJ+vtrnqyHBNAYj831xG2oBjJgsJW0PPGpBszg0C
X-Gm-Gg: ATEYQzy5KwhDIB5MRj+WmWTCDZx9fLpMs7TxqNEG0LSWuKwjDwrF9Fzn0mUTZKFM8IV
	c0wF3SWXJDdvGrh22/AViJzzRo8E7TqgQ+UcaqIJ8syvkd7EvJ7OMcYyapowqLpkwEbb8T6dGrz
	HCCdBcd0m6LQurggHQ25vmOncfSoKFYOi1TSUCqPqtB/KhvSxgD4mmtXZGiv5623QpfHniYg0JQ
	OGn+puBHzq5NSfnWypX1xhgdyEI5o7RU0dEJAoOphNfWfU3NmkIN2DOhkKPOcEKM6SwGobzreoG
	W+qf6y5t6aqoVSpeoplPx7e9sqli9NZzRxigfAsJ4V9A8yoICK8UCo2ngKydH/JmLdQRRxTOI70
	WweoPzoTwHMOlO4rA9NQkHZp3VMog/5HEE7AZVo3D6jDquPKh1K7VzPDrr/3VSfnlASjI265nrj
	MUEOzWrt1MuHM42mV52/eZge858Jm1QSyhgoyZbEZY6Qo+aXrG/6FL/ZoIzMYe7/w1fggRDuH9f
	+jXytdM/l56XjgdWU33vzSDp0tYhVUAbKHJ1wXCyW+D5Q==
X-Received: by 2002:a05:600c:3590:b0:485:3b34:2f61 with SMTP id 5b1f17b1804b1-485566c9464mr70256375e9.7.1773420972648;
        Fri, 13 Mar 2026 09:56:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm202895695e9.11.2026.03.13.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:56:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:56:09 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abRBqaTybiVv7mv2@Lord-Beerus.station>
References: <cover.1772642881.git.stefano.r@variscite.com>
 <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
 <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
 <abRAaZkks9Jilo-S@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abRAaZkks9Jilo-S@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095615_879357_5AEBFB51 
X-CRM114-Status: GOOD (  29.19  )
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

Hi Frank,

On Fri, Mar 13, 2026 at 12:50:49PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 04:54:42PM +0100, Stefano Radaelli wrote:
> > Hi Frank,
> >
> > On Fri, Mar 13, 2026 at 11:13:35AM -0400, Frank Li wrote:
> > >
> > > Can you rebase to my for-next tree
> > > https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next
> > >
> > > And new file, run https://github.com/lznuaa/dt-format to keep node nice
> > > ordered.
> > >
> >
> > Sure, I will rebase the series on top of your for-next branch and send an
> > updated version.
> > If possible, it would be great if the series could be merged as soon as
> > possible, to avoid having to rebase it again on newer changes.
> 
> I try best. I go though as reverse order patchwork order.
> 
> https://patchwork.kernel.org/project/imx/list/?series=&submitter=&state=1&q=&archive=&delegate=
> 
> Small fix go high priority.
> 
> >
> > Regarding dt-format, I can run it, but in my experience it is a bit buggy.
> 
> Put bugg in issue list, I will fix it.
> 
> > It sometimes moves comments to completely unrelated locations and does not
> > always keep a logical ordering of nodes.
> 
> Logical order is hard to follow. Each one have difference opinion about
> logic group. I am trying to normalize and machine script. I use same rule
> for every new dts file.  property order is not so important. The key is
> node orders, which try to avoid add duplicate one in future.
> 
> > For example, I saw cases where usdhc3_wlan was moved before usdhc3_sleep,
> 
> > and pinctrl nodes were not kept
> > at the end of the file.
> 
> About pinctrl nodes at end of the file, we don't stick this rule. There will
> be more than one pinctrl nodes.
> 

Thank you for the clarification and for the work you are putting into
reviewing and maintaining these patches.

Regarding dt-format, I will open issues for the cases where I noticed
incorrect behavior (such as comments being moved to unrelated sections),
so they can be tracked and fixed.

Thanks again for your support and for maintaining the i.MX tree.

Best regards,
Stefano

