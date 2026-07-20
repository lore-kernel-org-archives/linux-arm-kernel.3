Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B11C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEfQm+fNIIIRf5G5yrPlpKCXyKnl5+VCOUdK6KCQ6M0=; b=rIR+UWBGZDs7CoIT031Cvy0B4P
	0SXOjr0EGKsS5NVt+GFgpb79FWCHKqZqUFtt4SP5BZuXEJNRw9Ljoa5Nd23IT6YNtK7XbJXMzLnwm
	+SVFpmLWQfn5Pj0fzxZjcVCaOdxbyPQYqGLRSJiwyD45IXSvS+O9GB/6NTgIUesgTo2tqNoIUcuuC
	8WcQuGhyAPFPr/lNcErB/K2j8p5ev62mlLfp2P0V4McBHPwxgGgFsqyIaUoxv2nUObjyq52K9NO9w
	wYUTUlnOM4JB1674TqCohbaa3WrRwL7D/LPa6LjNYrK7yE/XBoONmvezDTz6MhsedpwR3dwxkVhWw
	9sv9PTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloDk-00000006rDm-3rDq;
	Mon, 20 Jul 2026 13:39:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloDj-00000006rDS-3Tdw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:39:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37D5943B91
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBC21F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784554787;
	bh=hEfQm+fNIIIRf5G5yrPlpKCXyKnl5+VCOUdK6KCQ6M0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RI3vLreahJGAhgtlatHkOscyo71Y2LCTFvhRAwMLIIk1XNm/x5FMR9Dwsagw98QSb
	 7sV4l7YWuKlvsv/ADHoTvX6VbzeQy6aOsrGF+2mCSEnlw2dUHVuMB9qL8wvcU1c3qU
	 vemxw9+dHy1Jym9R4FaAjcU/STnSceY7lDpjKtSxt9mcg6mx/zw4CRIYYc0FFL3xqh
	 l5YU/gZw5z8l4D8NW5lYQ5SNul06GkJW2Ykuk2hWd2bX9EC5fPpbbmmswww7MRg5or
	 7zprAf5p7duqoarODjDXjTJAmWjBbPaeUCPXfSYZJaOk1PPoTQOBOmXIw1ZvBXcv5V
	 wtzDBgTWkgpbw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c9452244aso92077541fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNySL9lYNbC5HZNyUj06rvgsrU9e1aftBB+5/emUAUmEXrlmIesx3wsvpSqPvmEuEgprzHKHyFnmzdqavXZi9v@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4wKuTw61vicW4bWxUVMk8Lph5w0+6rOofSXLGBf/vpeW9Twwd
	o1zYBMPnd61VUJv05rMaR93W6XCmCYX/XBzZqC3zm7dY8Z3x6P211xGRhaQejEuxESQnahG5ZQ6
	qK4+MqC7kG4XT5HanLd+LVxfUwo22lSfOUodosR0g0A==
X-Received: by 2002:a2e:be29:0:b0:39c:a06f:12ba with SMTP id
 38308e7fff4ca-39eb294c61dmr29234131fa.40.1784554785347; Mon, 20 Jul 2026
 06:39:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 15:39:44 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 15:39:44 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <e4f9b266-8d9e-48fe-99c0-58b61e02c9bd@arm.com>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
 <e4f9b266-8d9e-48fe-99c0-58b61e02c9bd@arm.com>
Date: Mon, 20 Jul 2026 15:39:44 +0200
X-Gmail-Original-Message-ID: <CAMRc=MefqCMgVv-o5hWoRwS2iXPQNs5nH2qHiz55+ew162LfSA@mail.gmail.com>
X-Gm-Features: AUfX_mzO2mZAcAjFU14cJl1wZGPQmD5GzWNsNbZLHTzrF2PNrvf-Va6RwZ7OmuY
Message-ID: <CAMRc=MefqCMgVv-o5hWoRwS2iXPQNs5nH2qHiz55+ew162LfSA@mail.gmail.com>
Subject: Re: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
To: Robin Murphy <robin.murphy@arm.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 20 Jul 2026 14:58:27 +0200, Robin Murphy <robin.murphy@arm.com> said:
> On 20/07/2026 10:24 am, Bartosz Golaszewski wrote:
>> Prefer the higher-level platform_device_set_fwnode() over the
>> OF-specific platform_device_set_of_node() for dynamically allocated
>> platform devices.
>
> This is very much non-portable code specific to OF-only platforms, but
> if the intention is to remove platform_device_set_of_node() again
> already, then FWIW,
>

Providing platform_device_set_of_node() and using it was done to make the
transision to expanding reference counting to all firmware nodes possible.
I don't think we'll remove it just yet as it doesn't make sense to convert
the code under drivers/of/ to using the fwnode variant.

> Acked-by: Robin Murphy <robin.murphy@arm.com>
>
> (Although I'm slightly puzzled by the cover letter - AFAICS in -next,
> platform_device_set_of_node() is itself very much a user of
> platform_device_set_fwnode(), however in terms of symbol exports,
> perhaps the former could now just be a static inline wrapper?)
>

Sure that can be done independently later.

Bart

