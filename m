Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5EBC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrJxAmxvRZ+OJcEmvKu0mS/aQ9NNqWTYt4WrKIdYpSg=; b=e+f3aH2BxJH6gkzKNyRGq+DTM5
	xtVmPk6AsxnX55eWApGY1vc01paLj5ga8ONh9uMnvnkN3DZrV7cjpC8azzBI5exNwKPVqjCZjBbVp
	vh0q50r+mx/D+H2ac2E/7V/2HapSWNSEnvalbO/+18eYm9kLGlwgw9bjvHQsULwHJdp/yH68/TsYz
	d26RJAcsfMv6DvLbyJ0n4/NW8unyUdutBFhTaVeEwHBWaOnEcQZpXG4J/8e3TgZ4GS5kDN9pIa4ho
	vyT9wZnuMeQj0OtMcZaLJ3VasHNZ7mq6IdImchTPaeBTmM+rbwQoAiH9ckd7Did1liLN9rU4RGKF0
	TAhSMHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22nY-0000000Gn5Y-3vuL;
	Thu, 03 Sep 2026 08:27:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22nX-0000000Gn4W-1zge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:27:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0755D41291
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 08:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEC51F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424070;
	bh=TrJxAmxvRZ+OJcEmvKu0mS/aQ9NNqWTYt4WrKIdYpSg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=omwLy8pQosiS6s6aNjAUOvi+dNK9JWsK13oYqOB7usOvfjM8RvkhQcnQbn4M4HaqF
	 SnH9yImhXfNS4YTsTvTVYU4mAEdHATbCFN7pbZxBWURNcwHDAJogs1Ey3OWu4XR1Mp
	 Ok1BboP2h5vYnn0kFQQG36Vqr4ecxF2zPCGtcGTy7uYPTibG4827aQ1LzlfgjF4C5O
	 MCRnQCuJPraOEWZ3GOoJonEpGIjxPDOk7RbNOGxqJfgFjdCV0BWE8IVljIwMmUfsVR
	 XHQxTk579Y1yfISx5azt6FaUNGyrnSvFJFEYfUaPez3zXLRcA73rujD0nJu0uk7dcN
	 uu1sUfLCDI+vA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1835974e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 01:27:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgQSqjMuAzg885wlCbjprDXa2pdZxWbTke7U2aPKrSbSlZnjie5gfRRVOGS8sw6RGjo9Ha3gPS2nSFr933h6Ox@lists.infradead.org
X-Gm-Message-State: AFuF++mms+p5LcD3TgmiZTiNempahPOimjCBq1DELhZUBWMdRoMHE/sP
	1J8C1Aec4105dthV2rmd5Z6pHiMa0j4elWwLR+XDacm/3EG0JNbXrtK6uM9/D06wEsfg42Xo/j4
	CVnTj/9TZ3xNFPSRAv5QfPFlR6LEab75c5vDNfo8LPw==
X-Received: by 2002:a05:6512:2246:b0:5b6:4ad:77b5 with SMTP id
 2adb3069b0e04-5b6087dc220mr3260661e87.29.1788424069613; Thu, 03 Sep 2026
 01:27:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:27:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:27:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
Date: Thu, 3 Sep 2026 01:27:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
X-Gm-Features: AcwNN1V5FdQ_WXfM8AqBAuAps-0ep9MiWg8pjvabZULokJ8aU7j9fqMb0CzLSlw
Message-ID: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips
 without direction registers
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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

On Thu, 3 Sep 2026 09:59:37 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> Hi Bartosz, Linus,
>
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
>

Why are you spamming the list with multiple versions per day? You're sending
a v5 as I'm looking at v4 and I really don't like to have my time wasted like
this. Please limit yourself to one iteration a week unless you get a set of
comments in which case try to stay at two iterations a week at most.

Bartosz

