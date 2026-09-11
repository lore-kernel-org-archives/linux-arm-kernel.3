Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FBCC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4i87onUuq9wqHpMEQ4jHZbbyUTENMsVIDfpzRkAdN0=; b=Nch5EGwFF5GMzmpEuhRIYfsT6w
	g9rYh3P7Mrl3WW5hzOn7lgHg1MVhGioJ9YnCSGAsJ/wFxgotSBvB41SQSqpOqW3rU8AojlguOySd0
	gnHfyYybeinDEruT1z9kbEzgbcz0BG8Zw8UWKCgYigwYB2lJNXIOALNKgmXgsMvawUYIbAfOa5UwN
	8AgKu3bg93srwKOJJd0dlq3GhbEX2ybYAKqszYeyhc396OEWYERfGYxzVn4MT7HI5Js8kt36dO6Gz
	Lpxhd5ZweWS3LrWxYh2ghoiOD/GjSjBHrDZYwEybd15iPw9Rho0Ig9cer7DnmJq13IOZDnl3c2mqa
	7bG+so7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tXj-0000000FqMb-0ua4;
	Fri, 11 Sep 2026 05:11:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tXi-0000000FqMI-0p0R;
	Fri, 11 Sep 2026 05:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6119F601EF;
	Fri, 11 Sep 2026 05:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A321F000FF;
	Fri, 11 Sep 2026 05:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103477;
	bh=Q4i87onUuq9wqHpMEQ4jHZbbyUTENMsVIDfpzRkAdN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lOJcDAiue7cyP0WKuq94zT/BOctqQE9OG04LJueetSK3L5RRibv+eF0uGpHU9MHkn
	 qrx5b0k+xH56P3HYQuR8CldIjVs3jDwyXbzEtKZjjrY0x6FOX1ztsTfvTw9edvSaUJ
	 RRxHb6BSyyMpR2rtsqSYBpovIp2plvhOj736ARNLRH/ZsY5BSRVdFN8cjcFWAIVs1I
	 It/eGS0IhiOuaPdW/uTIE1cPtOXqD3IIB77pnflyu2Pn6wlqsAoHcwsT9gnwqJMuGw
	 77+i8CI+O/A8j9182rLn4YsObYGm1XiCKB1TYLDLPG8qLJ+yWkaBbwUirORQf+V0yZ
	 EwIfijIsGHGHQ==
Date: Fri, 11 Sep 2026 07:11:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
	chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit
 ratio setting
Message-ID: <pptwnkay4jvyom2ihwtice7usgndsw2fnffkbenkg7gyjejure@4y2znrvtmbtg>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
 <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
 <cb72ff50-b62f-47fe-af40-d38558bdff6e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb72ff50-b62f-47fe-af40-d38558bdff6e@collabora.com>
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

On Thu, Sep 10, 2026 at 10:39:06AM +0200, AngeloGioacchino Del Regno wrote:
> On 9/9/26 17:06, Manivannan Sadhasivam wrote:
> > On Wed, Jul 01, 2026 at 02:19:36PM +0200, AngeloGioacchino Del Regno wrote:
> > > The comment in the mtk_phy_tmds_clk_ratio() function clearly and
> > > correctly explains that the TMDS ratio has to be 1/10 for data
> > > rates under 3.4Gbps, and 1/40 over that.
> > > 
> > > Unfortunately though, the TXC_DIV register setting was wrong, as
> > > in value 3 means to divide by 8 and, in order to achieve the in
> > > spec 1/40 (tmds) data rate, this has to divide by 4 instead!
> > > In order to achieve the correct 1/40 (tmds) data rate, this has
> > 
> > This statement is cut-off!
> > 
> 
> Oh oops. It's just a forgotten line that has to be removed....
> 
> Should I resend or can you simply remove the line
> "In order to achieve the correct 1/40 (tmds) data rate, this has"
> while applying?
> 

I do not apply the patches, only Vinod does. It would help if you can just
send a next version with this change and tags.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

