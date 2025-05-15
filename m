Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7DAC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4QvTI9RPDnKEiJAmQecfFJxHUswBG2VAp0lLtBwF0g=; b=zFNg1DRNXs7MzSOtW6E30/yxXg
	3hlQWyqY3K/MNzG3uY9sDImVFI9JEWkIHP9qEujhEF4HgXAIBDu1hj77Z3QL2ppGLLaHby1lkeMf3
	eHxVe7+NscFQWrEm2uL5S3OcCyXgcBy4mAgpmPKKT6ZuZFFD30t3AhT1P5pv3HxJf+EeYaVLaTLvs
	KU9rzwmWccOU70bg+m4X4EZukzUe4/8Rt0A4VQclkJgbBi08C8dR7sVlwBZuh1Mk4J6P/rcX0Kksm
	pZTNgR9wvD4ysbO8FCoWS33HnYve/Hz98FN2tTmjAIS3uScpWj95JbMCndTStDbMeqt+TOxjJ0Kkv
	8GeEGWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWzI-00000000R2s-03Vb;
	Thu, 15 May 2025 11:42:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWxI-00000000QwE-0g8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4BF544CAC;
	Thu, 15 May 2025 11:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D59C4CEE7;
	Thu, 15 May 2025 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309251;
	bh=AtLrKuyB/2mv1b3YAJljBOxYlY0Y4WwepVYWImQje1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnOivIrMpnQgHRo/eEvXMJRZ6zFtOo1KqVTzjuYabmi1wOzGb6TFo2fxKlbCKAFDc
	 Qdm7ri21X1blh4QyzFqFK5p+92yj+TEs9UNZa0/Uy/65s6S0nBkG1zBPMorZq/Wkg2
	 XbUsf+fHGIX6dQJG7x1ZW1Chr9XEFTFG99ZyYexGRMvIqP2EcK3bdZXrhIji4OJ3Vz
	 J82Xb8iQ1D5wAhTjJhcWs6FKCRK4yXLbALX9lF4f0cn37h2k4rfJlpVYZYcijpwFnK
	 3EcakqZvpDzlKNDB4hy4QQcL/X6hfMqBvNND5fXbFJN/oiMM8q3t9g8jLj/dZokUv6
	 wqjbfkQfssTYA==
Date: Thu, 15 May 2025 13:40:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <lqspn72kegy6b7rrpefbajvomcefs3d764ndtwescwhg7jz6bx@hhu4gzkcms62>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
 <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_044052_221723_21764F0F 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Francesco,

On Wed, May 14, 2025 at 05:51:27PM +0200, Francesco Dolcini wrote:
> Il 14 maggio 2025 17:14:32 CEST, Andi Shyti <andi.shyti@kernel.org> ha scritto:
> >On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> >> Rework the read and write code paths in the driver to support operation
> >> in atomic contexts. To achieve this, the driver must not rely on IRQs
> >> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> >> jiffies do not advance in atomic contexts, so timeouts based on them
> >> are substituted with delays.
> >> 
> >> Implement atomic, sleep-free, and IRQ-less operation. This increases
> >> complexity but is necessary for atomic I2C transfers required by some
> >> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> >> 
> >> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> >this patch is causing a build regression. I'm going to revert it,
> >please check the test report that has been reported and you are
> >cc'ed.
> 
> I am looking at it, it's a warning with W=1, not a build error.
> I would not revert this patch, just wait for a follow up patch
> or comment that will address that warning.

please send a v2 already fixed I don't want to keep a regression
even if it's a small warning.

We still have time until the merge window and this patch is
already reviewed by Carlos.

Thanks,
Andi

