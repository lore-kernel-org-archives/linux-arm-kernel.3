Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BdoDX02yA4l0YqlCA+cgnYBFlW3ntWEuYftz+GCH1k=; b=so256rzlIPSVQfZgP4yz1YFIsL
	pF8l14NRejhpdSSCazX9KXhK93kvD8xjzqJXKixqQqc0ppV03WdDc0fBiqHI9sSD/YNlRISMLeICF
	bcReEx8TGy67hrvP3ljJtpK/rqCTLi/tw7nh4lVkwrSEoVe/oocN2sZt9oW6Ht47ozDNE+sPT/vL4
	gkR/zMvaR79bCW08a4grjGmk4rk5+xw2LPJa5J+VD+rj8bvSMCk7lcVKQUN7K7W8lJ2uykumuYCKY
	Ljq+JXFPQMZsII3MwXdSQE+IFwJn1mOrfSQVYuvNwJlUmfO4t/8rtwyXInmJD7/qKXV0qkoYMm4m2
	nWb7ud3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Czl-0000000DeXY-3LIw;
	Fri, 11 Apr 2025 11:56:29 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CrN-0000000Dd4O-1MbG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:47:51 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3A0D21F998;
	Fri, 11 Apr 2025 13:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744372062;
	bh=6BdoDX02yA4l0YqlCA+cgnYBFlW3ntWEuYftz+GCH1k=; h=From:To:Subject;
	b=MT7mrBDC3FJk6ZgLxtNGgMDefBqrNq+r2oEhmmlaC5HeztAvBCqVglQe4wI5+L6b4
	 TmLSHVnTBp3gy/uVjNtRPZDmbCE00wiW5KSP0Baajr8RvHuNOv4rI0YPd4boGL0tCU
	 qkd9xXq4xR+TTG/fYGOzMnqDH8f6LGpa6f1vr17ixYNVbUsIKFcG3yLyNhhkpuGpB6
	 X1RmdDLdrLKBbq32GM1uLnbk/BAaiJDBrNHnldi/gm+je8YprzK0eUDsrYezXQIGFh
	 kueZ5Pv6+/uCqkx7Q5YEQqkLYj+NaZ7vwVURk2FQN0dUlizf2sAKnIMYIuisuEUH2D
	 mcdkk5X5XIitQ==
Date: Fri, 11 Apr 2025 13:47:38 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250411114738.GA43965@francesco-nb>
References: <20250319145114.50771-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_044749_969845_026BD1A3 
X-CRM114-Status: GOOD (  10.30  )
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

Hello,

On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Any comment on this?

Francesco

