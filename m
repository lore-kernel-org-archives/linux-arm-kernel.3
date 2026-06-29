Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C823BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvQuqGNPmPlyRSdWWioxiU7bI3gu/asgds/B4e0XcJA=; b=3c2Bx0189uldeTNbhShRYR8Bov
	NSrdgLxVGXrMvC6larXdbakquA+CuUVm0J4dZVaYVXxWtDz0l/D8YKuj8mWd3aqKUzIm5EWaWUVOK
	o0qS8/rsutDLsw2GpDJcjjMnJHHKG+7kWMINgZuOhyUQDFXWmH6yFPWqUiO8pSdaV91Q5noyMtQ94
	ZRKB/Jg63sb6caC6yvZCcMRSyQ2UUJ9256AF+cBNybYodSitxKKsIlXAW365LY0eWfWxuoxntbcCd
	RsTYbJDKlLs3OxcnHlm5EzXVQ3QXR9xKok+wSbQb+70nQ3MXkseTWPN/Ky2QOslHLjxTmPq1rYlAD
	uqQYrdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE4Z-0000000F64p-1la7;
	Mon, 29 Jun 2026 15:38:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE4W-0000000F64H-0eC9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:38:57 +0000
Date: Mon, 29 Jun 2026 17:38:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782747532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xvQuqGNPmPlyRSdWWioxiU7bI3gu/asgds/B4e0XcJA=;
	b=L8ncqY3/xXetNeK5HUHfSaGB/74NxHvifmP8+JpEl86VTCaaBHcXL2x6SwuhfBex3A4JZI
	QBCZkSgB2Ux9OInklcPm+lv2HcREm6QQ1EIIKruWIH7rFJmHDMDskJfPIZ/1tFeeAEkaju
	ICKuVN7nTcnHqRfTJsa5eGwTUowk8kpFKVqbeAMKZK579KD+Qi46/9Md0sLO09AXF/UC6w
	zr9krFFYIz6RcWKdNdgJVhx1K+7bTt/W7OJ7hR/2gbO23QRi2+Qda2XWD33yB2ePpXTS9F
	U0leicin5WJpxDI/2QUzWOvxtMuiKyvyv69yOD9Eg27XJGyeHFWDSApe2bqg4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782747532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xvQuqGNPmPlyRSdWWioxiU7bI3gu/asgds/B4e0XcJA=;
	b=MPOZ9702oQzlDnpr63hoWoRECO5O28yQ6xGWMBRI91d4iZWTkvcaqRmDol2TkRl6YUiB+L
	3gJt5G4VdghH7pCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: RE: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <20260629153851.C5PbMlm7@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
 <20260624074409.5jwpWs61@linutronix.de>
 <aj43FQ7f6juXQ/tP@shlinux89>
 <20260626083416.xbVlbOQJ@linutronix.de>
 <MRWPR04MB12330C5851B5421F8EE723F1A88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MRWPR04MB12330C5851B5421F8EE723F1A88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_083856_332972_ED216F02 
X-CRM114-Status: GOOD (  15.97  )
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

On 2026-06-26 09:00:04 [+0000], Peng Fan (OSS) wrote:
> > > If you would like to address the AI reported issue further, you may
> > > update readl_poll_timeout to readl_poll_timeout_atomic.
> > 
> > What about the timeout value? Keep it as-is or reduce to?
> 
> Let's keep it as-is.

The call is
	readl_poll_timeout(, , , delay_us = 0, timeout_us = 10000);

so it will _not_ trigger the might_sleep() splat and will compare the
timeout value against ktime_get() so it will loop worst case for 10ms.

If I change it as-is to
	readl_poll_timeout_atomic(, , , delay_us = 0, timeout_us = 10000);

then the result is slightly different: The clocksource is not used
(because it also works in suspend path where it is gone) and so the
timeout_us value is decremented based on the delay_us. If it is 0 then
it only subtracts 1ns per iteration. So the worst case delay becomes now
10.000.000 iterations.
I don't think this is an improvement: In the worst case the delay is
much longer and if there is a watch in that period, it will fire. So it
does not accomplish anything.

Having something like
	readl_poll_timeout_atomic(, , , delay_us = 2, timeout_us = 100);

would lower the delay to 100us max (which is below the 1000HZ tick) and
would spin for 2us between register pools. But I have no idea what is
the expected delay and if it depends on the remote side.

Please be aware that this series except for the remoteproc/ imx_rproc)
has been merged as of v7.2-rc1. I can still send an update to the poll
in imx_mu_generic_tx() but I would prefer an improvement ;)

> Thanks,
> Peng.

Sebastian

