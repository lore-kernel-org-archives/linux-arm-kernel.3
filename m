Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C806E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ov57mukoVNM97FQNRv9YN74knW45OYK5Dvaj9o2nrg=; b=kDYe3x8143vcUqOgmWGlqh+KX9
	o0LwC6nQkzPIBe1pxoTwrMKHTdem57mnbsJwcGq3J/fKrrYVUl1GWENIEEmFHP0ON9PV8SnjTtCcR
	NnAYcwd+9FjXw0Ihjzajc0J+SQuVkY4TMvxvjNrJWiqcX6Q4yVrkZwzY9mFNps6kkF3AvyGIwrnqL
	zCQN7BLcrSKHlU30NSm3LCpF7bW5c2w7TAzPSn41IOlKnnEJRxBuahKOt2aA9w1hNsO9C8kwX/oEW
	Hjkf/BC1SRNIX2ElC5viKtN/4qOhw0aODApFU4LkF1fPQavK8eEFnUjFEo8dRDnIKGFTmT8FxnpUt
	MDyxXHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9IO-00000004Xea-2Hl2;
	Fri, 13 Dec 2024 17:17:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9GO-00000004XN7-0Fbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 17:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0627A42D70;
	Fri, 13 Dec 2024 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30639C4CED6;
	Fri, 13 Dec 2024 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734110138;
	bh=NjO68/4nw+UEWFu3KmtWhUhnC0oLYN4ipiYpYuD9K5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+L6qAouX7ebPUEU7rg451bIO2bAuBVcQx+aw+c9s3wAomHfVNqJpvAkSU3nnTTTu
	 udPTG6A9zgi8i4YMXByqvhxvSEpEC6wHBxbUepbk9k1utvsPbqvzQ10ggmC2bEyfXp
	 HFEZVsPlMFMgv6aLEN7mZPDpcBjMaPmzf3LiBgydLHI4yeHEz6lSc6fYGr5sF3v1Kt
	 5hWIqt7I5QCF65b4Rf6mfqhPlkQNxfhfUcC5G4bDgHLWQfIE4+0vZ8ho7/djUyPxjM
	 U+tY6YYSbMkERryXPdJ/HMqVh3WX9pA5gtKDJsdsHz18FioFl0zTIeDGYoAlK1Pbww
	 0A/UuQtaqXHUw==
Date: Fri, 13 Dec 2024 17:15:29 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <20241213171529.GF2418536@google.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
 <20241211124454.GE7139@google.com>
 <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_091540_158450_CD936927 
X-CRM114-Status: GOOD (  13.03  )
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

On Wed, 11 Dec 2024, Mark Brown wrote:

> On Wed, Dec 11, 2024 at 12:45:56PM +0000, Lee Jones wrote:
> 
> > Seeing as the vast majority of this 400 line driver pertains to Regmap
> > handling (!), would you be kind enough to cast your expert eye over it
> > please?
> 
> Is there something specific you're concerned about there?  It looks like
> it's just data which should be fine.

Just the mass of complex hoop-jumping to get all of these Regmaps
registered.  But if nothing stands out to you, then it's probably okay.

Still, I can't review / take this until it's a proper MFD.

-- 
Lee Jones [李琼斯]

