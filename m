Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E38C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhFfV30KEO/sb3oCDRBx6W3tLymcOKC4hcgAgAQWZ4Y=; b=LXzcffb+dl+FTsvZ2IErgSnq+l
	6HAFu+hqDztSjqccA8kCzu8zR4YIJ/mjpIAkVU8GdN98Pnw8pUlpXEh76LbIpr3g87Y412ze1wkn+
	fuklNf0x84FpWTx9DnAOKp5Ib4n3c2+WH3k/CmkvKiLxPhk+fjjEJ0tzaLM96ypJ9DoT3VSjae+up
	PXhx6hbAbuHlsBKfoauy4M/jIpBIs9JIYujsvTWzl7P0YXxLJlrWg1y+ErBDBD5DiT6D7iK0duIme
	4KwcLtw4JoJCcRAhIMP4xwOoPgXaw48pnA49/ygYSIEhXcv6RXzy95UI3hfx+Msry69ofl7pB3XhK
	q2k3n0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zDb-00000005GDx-444x;
	Tue, 22 Sep 2026 12:03:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zDb-00000005GDr-2SQS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:03:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D446F601F7;
	Tue, 22 Sep 2026 12:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606B21F000FF;
	Tue, 22 Sep 2026 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078606;
	bh=DhFfV30KEO/sb3oCDRBx6W3tLymcOKC4hcgAgAQWZ4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1T9WEqNPXL2Cvd6Js8hrKP1/M3YU1kgqqkgL8PZYNvFam5p4YmBKhLAcm4AUUdtP
	 6Py3ZejTCbXIhvJPs5Df+HCpLXfACK4gnVi2EPaFziHrI15NApio3e2BVaOQXEr3P/
	 +69SWypVL74QdPAC/HNWa3SGY21QmJ7k4g4unnppdOQ7RnhtyPxeVgI62Xw3H51GcN
	 IgKU7pTr6KcQ29QjyxL8dWJlWixpbzHD/m/YUFwsAE35fVfiNuE7S+xv9rD/j91Jmi
	 ARv01dbzQpBFxyilyGr9nESYVnMIJDiXoaQ/n3OY+gPaxjQ5xHXgrTZujaDSy/t1nt
	 H7VDnA1tXSSjw==
Date: Tue, 22 Sep 2026 13:03:21 +0100
From: Simon Horman <horms@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	clabbe.montjoie@gmail.com, davem@davemloft.net, edumazet@google.com,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com, samuel@sholland.org,
	wens@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-sun8i: Fix EPHY clock leak in
 get_ephy_nodes()
Message-ID: <20260922120321.GD13925@horms.kernel.org>
References: <20260917113654.2149268-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917113654.2149268-1-vulab@iscas.ac.cn>
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

On Thu, Sep 17, 2026 at 11:36:54AM +0000, Wentao Liang wrote:
> get_ephy_nodes() stores the clock returned by of_clk_get() directly in
> gmac->ephy_clk before the reset control is obtained. When the reset
> lookup fails, the loop continues or returns without releasing that
> clock, and sun8i_dwmac_probe() then jumps to dwmac_remove, which does
> not call clk_put(). Keep the clock in a local variable and release it
> on the error paths.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Simon Horman <horms@kernel.org>


