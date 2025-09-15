Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79289CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsQckaVkw2bJf0DaY5ZGRLxLmgeFtbhYf3r3jl7uGYs=; b=rOhjJ/ZYOXdGbLEbZyY1ucnrJI
	k6mE+WsxWG69TNEih4cVkRemljhqLAA2BGToPSuqdF/0MuI4DgPmi5RO/ScRMfpA3Yn9O2p1U8sIF
	bfRCMKcn8UqbEzXUTtUp7ZoQ3CjQNWpWxGv1RJ92/lFvqwnBrbEufwEP0O6IANCC42pyyHfR+skZU
	kzEbtblXRnGoLyrjac7vp6iZ1dcnQtN5WcjJ1hbfMTqjV1vsBivZIa7kiIhlHAxf4ng6DBZp2bTo0
	INF1I+l+NFu5jjFv6VpPXeCUELr2SG0KHoW55SUhWbV3XyTxT637sOptkZvEyJKqhF+dEDrbveN6u
	wORa3xsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwpg-00000002OTG-37gd;
	Mon, 15 Sep 2025 00:12:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwpf-00000002OT3-1tSM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9637E601AC;
	Mon, 15 Sep 2025 00:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AECC4CEF0;
	Mon, 15 Sep 2025 00:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757895154;
	bh=UbiiW95aQkxFo3IVZ6BYSGYhMqA/n8zEEIb5wb50uts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U44cO0PUxNY01mFS2Jti1eqVALemOF50c3VaOKUC5xbCNlAQjVV/ygpBjc60AcKKt
	 FMQoBif5NPmfyoH7LuaUdZyMtklATc9S9hx5Gw5o7EygUN8i2q291C4qLDrQb9Xrj6
	 dMVKCKQ1mMvXq/FshFhZE9fSMJCfWkt/GBDiDW+1MyK1nQRznAlRIR+nOSZZZCpSLv
	 Z4dQQPw6w4lY8e8xzi26hYOsjXvQV4EmvZGnwuTkxbKMZWGToppz2g9Ybu9bT3gIv4
	 0vNx7ENyBIpf2Uzyqpg0b1YXhI8tljqJJqDxzW1YEMXyPXTeRS9DZt53YsWLWcSOPJ
	 pc7UW9rNtUdkA==
Date: Sun, 14 Sep 2025 19:12:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: fsl: Add Protonic PRT8ML
Message-ID: <175789515239.2294687.11215788946792312657.robh@kernel.org>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-3-fd04aed15670@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx8mp-prt8ml-v1-3-fd04aed15670@pengutronix.de>
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


On Wed, 10 Sep 2025 14:35:23 +0200, Jonas Rebmann wrote:
> Add DT compatible string for Protonic PRT8ML board.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


