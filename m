Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AGpTogrvCPWBydQqzteHSW+GUiLBabrwrLHeF9Ep3c=; b=D0n4OoxoqCiknrppVjQGEYJV/o
	W39yiAAF1wO7lDgesUxT2Yqb3qI5qo14mhT/2S0i5OSqLYKG9lTwtqA0PHk7zBfo3OWiewlO+FERD
	u3RFM5A+7vx5BfxD66/KcTW0fM3y/RgglXpxkYF21am9XheKtmMpTG+jMkXIW7YnSAd3gxHmP+6Zj
	R7oZoBCQDJ7s3/TgwfG6XGWRXpdmUfEOuKUsfx6eAU2W66V9b9TAT+7euubCfwzNIl5ORfS/5dGl7
	PKVi9ISKm2yfLKG2AArlnwrepa9vDs2vUL3dD4Bxfq37iuNjfpBxUGjdOIkcUyRRFZLXide1QNck4
	YZJOsTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS5P-0000000DyKN-3tgg;
	Mon, 11 May 2026 14:58:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS5O-0000000DyJs-0cwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3530B60125;
	Mon, 11 May 2026 14:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68499C2BCB0;
	Mon, 11 May 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778511500;
	bh=Ocv0eUycPk0CJDmrlNGryA52QS55d9KUwCdX+WPq4N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qq6v9hCJCNAOPwWEuRPCYdzi53rg5FZ2AHVl1yPd4FR12j4VY5yjDUVHT0J2egt/V
	 hU8S6L/lRa215mjso+6ImB1+redlPb8jXZ9iLdo3x5PnLtjoLT9m+mZa8K7qvx6A4h
	 6RdX46hlMpP8DHITatCq8BlnFogL51I5q72kWZ8c=
Date: Mon, 11 May 2026 16:58:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, sparclinux@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, Xin Zhao <jackzxcui1989@163.com>,
	Joseph Tilahun <jtilahun@astranis.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH tty v4 0/6] 8250: Add console flow control
Message-ID: <2026051157-antelope-epidermal-6238@gregkh>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506121606.5805-1-john.ogness@linutronix.de>
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

On Wed, May 06, 2026 at 02:21:55PM +0206, John Ogness wrote:
> Hi,
> 
> This is v4 of a series to implement console flow control for the
> 8250 serial driver. v3 is here [0].
> 
> The 8250 driver already has code in place to support console flow
> control. However, there is no way to activate it and it is
> incomplete. This series provides the necessary missing pieces while
> attempting to be as conservative as possible, so as not to introduce
> any side effects into the many 8250 variants or other non-8250 serial
> drivers.

This had some rejections in drivers/tty/serial/sh-sci.c, what
branch/tree did you make this against?

thanks,

greg k-h

