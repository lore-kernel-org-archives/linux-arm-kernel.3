Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD60D339A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0c90wdXQNTwAkNRBquwxQ7vtlBQRTY/j+jjrbZTlBA=; b=YX7snElEegR6PRnoALnGGMRsVW
	5dZbhjPVICZP3+lKkIZLhEs8PfG9IJEOwibV4KLF2HgF1DzMwO4DnOdcKJvAqvtJeO5LSwQAtvaj6
	aDJMAFWNontw4px1BmkY1oVzu9+VhxO8fl8wEL63JmnUwVihvylwEg6BSwQppGIBlXvF/gQG7Q/xJ
	Qhs9zXZmjtqIV3GrkiBZRCjov7RV9NQ+eIJQR0mE+yFDf1DAeNNY5bTtj5zvHAb18FW6Hi2XdYAFg
	DMi9sw190Z35zYw6i1Gckud3N7QlfOGCecEByswdj/9HGjWBgmV/MRZwlg8p0zYbBmp7RNuvunLdG
	EStiB1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkR-0000000BVuN-3vrA;
	Mon, 28 Oct 2024 16:37:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SMW-0000000BS2x-08AN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33E935C5D58;
	Mon, 28 Oct 2024 16:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1B6C4CEC3;
	Mon, 28 Oct 2024 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730131979;
	bh=xuzSVIC+24hcvUH3Uu6IJyxDoI8NF9z/u0YhE9kqbOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C0q+lkSKR1cXdmfA70QriKxNHoGAVcH+ZKCc+Zox4ygDHb48qTdn8VuHT2A4+o5V2
	 zoili6j4ZeZdYddsbvCBmzv4/WQgpSj7kTlw06ahaK4hCP3zTRP9o3R85+DvpU2GYF
	 JOfOD4cd4nqkmkIlo1feNr7WS5I7Lq9w9Ag0huIfm0H86flbsmELoeR1CWqpKwnAA6
	 NYQH1pJbxeuWuW0ou07d6MW7v+ovxkDt0VgRA/OeSEyVzpisDjPRrKkn0IRURMLEiE
	 huG9vkW7i5jsybC0co+F32KJLuGZov4R0mWfhQFuXfe18nE4zlmADox5tRHMwhBpHw
	 r+wobvKfES9+g==
Date: Mon, 28 Oct 2024 09:12:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, Paolo Abeni <pabeni@redhat.com>, "Christopher S .
 Hall" <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>,
 John Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
Message-ID: <20241028091256.1b0752b4@kernel.org>
In-Reply-To: <c1eb33ffd66d45af77dea58db8bdca3dcd2468c4.camel@infradead.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
	<20241009173253.5eb545db@kernel.org>
	<c20d5f27c9106f3cb49e2d8467ade680f0092f91.camel@infradead.org>
	<20241014131238.405c1e58@kernel.org>
	<c1eb33ffd66d45af77dea58db8bdca3dcd2468c4.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_091300_147336_8B98B4D9 
X-CRM114-Status: GOOD (  17.62  )
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

On Sat, 19 Oct 2024 18:49:24 +0100 David Woodhouse wrote:
> > Yes please and thank you! We gotta straighten it out before 
> > the merge window.  
> 
> Hm, as I (finally) come to do that, I realise that many of the others
> defined in drivers/ptp/Kconfig are also 'default y'. Which is only
> really 'default PTP_1588_CLOCK' in practice since they all depend on
> that.

AFAICT nothing defaulted to enabled since 2017, so I'd chalk it up
to us getting better at catching mistakes over time.

> Most importantly, PTP_1588_CLOCK_KVM is 'default y'. And that one is
> fundamentally broken (at least in the presence of live migration if
> guests care about their clock suddenly being wrong) which is why it's
> being superseded by the new VMCLOCK thing. We absolutely don't want to
> leave the _KVM one enabled by default and not its _VMCLOCK replacement.

You can default to .._CLOCK_KVM, and provide the explanation in
the commit message and Kconfig help.
Or if you feel strongly even make CLOCK_KVM depend on the new one?

> Please advise... I suspect the best answer is to leave it as it is? 

I'd really rather not. Linus has complained to us about Kconfig symbols
appearing / getting enabled by default multiple times in the past.

Sorry for the delay, vacation time.

