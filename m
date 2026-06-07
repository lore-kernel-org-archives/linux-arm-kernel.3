Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F6CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtqC+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=; b=DQy+BXusJlWAuRQ6m3pzeXwOqy
	AKZfM2xwyePItrNfmiXPjTL0kDg2s0W4UiiNMKJ2TbAE9NN3ZlWMB/iJDULV43ua5QT1aR0u7arqR
	PMy1GnBGOA1BnPagJce+3jZCZaNHA0uJeOzoYpqKRONyPg52sqvBj9WTjgBBukl6zUFecEgXYoYqk
	AglWINMqOEmonX/7meta9jAW+MoQMQ+efpwNhjmUl8HsEV09cwvblNmHj1IJRMQCni5/ponCDWyoh
	XM3DlaY8SZlEHHSfgUeqHziLHOUHb2qgaR89knf/tuhh/Qemr9zzgY841bFjAjZLdNMCCtnwVEKI0
	YIqCG2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWEwI-00000002Ien-0nF7;
	Sun, 07 Jun 2026 14:57:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWEwE-00000002IeN-0A3s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 14:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZtqC
	+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=; b=e0StwP3USm72zyvo2mQU
	YcHKr5/+CFQI2aKUNnf7qjdFK1HwL4d6INirsC0FkSENYKu8NxGVPaEu5tHsbfGA
	OCUcK25hBpWATPhRO7dix+lZ1Hge2swcF5GdaERhcwfGq71RoURu6tKz7cGzgczv
	E4Aq9NooUaf/ZgZHBDJqrEBfCzOA7zUbzazjxd+Ahi/sL4L+k53/J/88uCn//EfQ
	soOWQdw9cRVk1vNLPCsY7lVuqF7vdnbJFx3Rh9LX6/NxhE9zF309f5TgnRiQJHRk
	9u/4EIFtbBDZYcPauHG3gf9XE6UBznzg0DvF4d8suH+14Dre2sI0E1NGZiK/Rw6p
	Dw==
Received: (qmail 505574 invoked from network); 7 Jun 2026 16:57:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2026 16:57:15 +0200
X-UD-Smtp-Session: l3s3148p1@Eq0JHKtTCyRtKXG8
Date: Sun, 7 Jun 2026 16:57:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <aiWGyj0KJ5I3qB2U@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2aVdlsLqy9aeHP@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_075722_971240_983E8F29 
X-CRM114-Status: UNSURE (   7.56  )
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


> Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
> and Peng, please do the same for your platforms.

Testing is more involved than I expected. Didn't work out this week.
I'll keep trying for next week. But it may end up the week after that.


