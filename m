Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F13C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=; b=b/zDEkT0JtxTw4CJ0Prysurvp8
	+EsVaCkFXwUtnbSt2kB75K0fuXSPdW7uZHn2zwLif3k9WnmlLtErPoYAnJ8XglwR+7D317fpAJvJP
	52jG251nP39eQPcF7YoY9KO7bBs/RMwO3/1lpjUue/ANZrjx3ToGONjOZW9WamaC89WfrFr/Y/X6i
	g1JBJjU6AyP8kQMKudIY8wxz8RMZOIcnD/s9xWPJJn0PNjAzWZYRgWjQbXLC9btaLH3YstdHxqT+3
	nJbEk0xSh37FQZ1PJIJoJ05nAfqTvqbtMDi95e/+ckkb9WzI/HicbvH/Rq2mTujEg7wdMfT3D+V3/
	jMxHQysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnTO-00000007wWO-3XnM;
	Wed, 05 Mar 2025 12:03:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplpk-00000007eZH-315I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 956E0A40EFC;
	Wed,  5 Mar 2025 10:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4705FC4CEE2;
	Wed,  5 Mar 2025 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741169915;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVElypjcaIYX5rKtiv06hcSXy4HstFjKOeRhShpFjk2Jel2eSkA/O0uK8Wninv5/a
	 hI5Ui+51QY9Sc5wOaelsMqqEki8iPKL/7clrg37rGARtPtuO5FAtalmSz/cR624zt9
	 twTkQB6/0FugO2QSLBDkRJ1MULKIVW+tzVSg6Ccu0iGgHjhAUJfebciXlktocUXdn0
	 bbIXddxhOqHs7IDCCnaG84EzsvIT+/+FsZux9DQ1iCMoMbwVVWuwRuT4u+s9e3MuJC
	 lkrQutRMyjpWtEs6QOIxSX4h5Qvjsi5oAAXmBv854hriyofgHQ/0kVmCe+F7yX5KZc
	 9wpnC/K5XUGSQ==
Date: Wed, 5 Mar 2025 11:18:23 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, krzk@kernel.org, mazziesaccount@gmail.com, 
	thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org, 
	support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org, paul@crapouillou.net, 
	alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_021836_821955_A0B95845 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

Hi George,

why is armada_37xx_wdt also here?
The stop function in that driver may not sleep.

Marek

