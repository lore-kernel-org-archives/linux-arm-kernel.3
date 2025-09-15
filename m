Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A45CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0dQJiAhlpboEPbiA8CUsmS/UKRFituLVy8EIbbov3M=; b=oMfVeFFerALQGta1AeXS7h4wxi
	xm4LJw8aqU+yj2izVpHLKAFTKUnM7XEOcGmf62C13pzWu6uFVixf6puGy3zcc9MrGL1Fx8rQsam7Q
	7El501UcSWnGZmA8Y+ZuroYf5NWYVWtRGptN/6ykTk7Eu5qyRU3TyaJIxSNHEGPo+/57TvLyFZFie
	cdj002BjB2XnqDErDxEYaHO9nXUJkdxqo9I5Fs2Doia8QcQWcWnNZeBjBQIdt+B3KXRIw4NUhoW+N
	OmtU804Ugbw2xp4oYKajb0vvlLrrHRDcfqltfRFaWz3Ii5v6ncgfQa+p5azRV9BxxE0LeMlTR1EuE
	31pOkTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwof-00000002O5z-1cay;
	Mon, 15 Sep 2025 00:11:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwoe-00000002O5n-16qs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 353A7601AC;
	Mon, 15 Sep 2025 00:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCE8C4CEF0;
	Mon, 15 Sep 2025 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757895090;
	bh=J3AJunPYZjvT3fBNOBIckknDBrGE+MfaU9bXgPby/a0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZD90E4AiDIV43hBZmJzBk9jr9saqUD9qMC+wCdrnqi4iZCE/wAhYj95gJ0t47+lb
	 MfOI3mMEZhmZg7ys9rkuJa0gRSLUdmmvVYzZTLCcVSkcrNtNzrxBjwtGvDkmd+1YgS
	 BHLEC0aoy5mkzRlGwW4wQobbGOwiXKEfa3VIzgiuRcxilucittQg2AL1boynqY1Kxz
	 F02scaSH6Vc7ADt+gRQzRpt5zOumCi80E0GijXxY1h15qAqXDtxw4tehrvWElJisHv
	 MfsSB733yqaGUX3/kYoiP9gBWdAE8OU6BziFW4merg26OYkOyUmk0DWDqSABuGHIS3
	 QBrVsR0AGMnCg==
Date: Sun, 14 Sep 2025 19:11:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: asahi-kasei,ak4458: Reference
 common DAI properties
Message-ID: <175789508944.2293375.7905961656761093444.robh@kernel.org>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-2-fd04aed15670@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx8mp-prt8ml-v1-2-fd04aed15670@pengutronix.de>
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


On Wed, 10 Sep 2025 14:35:22 +0200, Jonas Rebmann wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


