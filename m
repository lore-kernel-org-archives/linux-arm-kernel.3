Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63354CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iPxPfD4zEjOJlk3VAJwWUFAVXWlZrkbgT/dCI7bG0g=; b=mn339OqskkcqYaQU+IA1zMIA8n
	0xXoclEA8eY1Bjs94t4N+7MlPGidVeZkkP/pJrhhT1J5BeqjBL8V2aCzPtkOFC9qw32+e+UQHjm09
	9ulabEpBMpvakbVncdTCIWwMlEowj6QSdlhifBxR94I/baaWCnFO0YTVBwzAIFQSjzI0/ePnIdbNs
	ROJwP+MsGlHu+WS7gDRdDGESM5jDabSaeLpQNjYesng6GOHovES01N7XdTxeFcorXWJ9sSnyRzWrX
	4THu+fQE8A469V2qvTf+5kWSSAOTtuAj1cSVmxQD21rmZjcBuQB6Gtb/MsM0OzCOfMcleiXd9CRGk
	1UlzWDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk1V-00000005xok-14os;
	Wed, 03 Sep 2025 09:43:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiWv-00000005Psz-49MK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0B47445E2;
	Wed,  3 Sep 2025 08:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FBAC4CEF0;
	Wed,  3 Sep 2025 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886865;
	bh=oylBBl4uKf15Rl0dYmoe29/A3Jm+GijZDxeRqxsoIuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOMd+ClNOmVD1CadlRsVv0U/kNNM90vCdRtGb6WjRtylHsNfhk4PSkXUKmwOkDR/C
	 vK48IXNSmvJhLfUAgQPZ4/Y3gTzF25nlGstPL81xMIuO/7arwJ3LmTesSNWB+nttjK
	 Ea6DUGKQxzQIFZv+bWSFfZZxF0Xl9yYk0DiPAaDFm/SVZ7gKl7jCHYView402MQGca
	 kDy41ZypNz7JVgrDCl3LO1M+UUCKtCC2YJO36/Rk4Di2pPGL8W6e+VPhPjqp8sNzH1
	 th8NXA9hTBowv0+eWIwYAV4IsxdLsWDBYykKOEV6FUNl3jIMvxOJrKr9BcIaS8YEiU
	 xTiHdPu2j49Uw==
Date: Wed, 3 Sep 2025 09:07:41 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: vexpress: convert the driver to using the new
 generic GPIO chip API
Message-ID: <20250903080741.GD2163762@google.com>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
 <175680785548.2247963.242433624241359060.b4-ty@kernel.org>
 <CAMRc=MeWnrSPrLOq7yH71wpw4vP6RJiLnuLCpwXogZn0yugFgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeWnrSPrLOq7yH71wpw4vP6RJiLnuLCpwXogZn0yugFgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010746_046174_90558599 
X-CRM114-Status: GOOD (  20.69  )
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

On Tue, 02 Sep 2025, Bartosz Golaszewski wrote:

> On Tue, Sep 2, 2025 at 12:10 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Mon, 11 Aug 2025 15:36:15 +0200, Bartosz Golaszewski wrote:
> > > This converts the vexpress-sysreg MFD driver to using the new generic
> > > GPIO interface but first fixes an issue with an unchecked return value
> > > of devm_gpiochio_add_data().
> > >
> > > Lee: Please, create an immutable branch containing these commits after
> > > you pick them up, as I'd like to merge it into the GPIO tree and remove
> > > the legacy interface in this cycle.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/2] mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_data()
> >       commit: 14b2b50be20bd15236bc7d4c614ecb5d9410c3ec
> > [2/2] mfd: vexpress-sysreg: use new generic GPIO chip API
> >       commit: 8080e2c6138e4c615c1e6bc1378ec042b6f9cd36
> >
> > --
> > Lee Jones [李琼斯]
> >
> 
> Thanks, you haven't pushed out the changes yet so maybe you're already
> on it but please don't forget to set up an immutable branch for
> merging back of these changes into the GPIO tree.

No, I actually missed that.  2 secs.

-- 
Lee Jones [李琼斯]

