Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOtW7RXVgWq7RbYNDWCug+4gqlzHv4az0EsugvgSdSg=; b=qyAz4asZY9RphDxWZQYeO20Q1t
	3MdpHDJQd9IofiJzLyToqDOjqBAwS5CbYSmQR93PXLeyWYq5vB/lriXYRcI45GESxUT0wCenePBrp
	dYg9dItjtzm4LMq+yHjKLYRINBamzUg7sLsKhDzQhOsFshtlPzB6eqG17zzW6N/Hap30tgA/rKiu7
	ieS3JhE1aRdMQmWV0PR9/oz8zHRLhFFvFiRe9ZTFj7kgkqpxbBYMsyPOzy488E0Wqwd6aVuR6bVuS
	E2jRjtyIRg29p1c6axYTocFc5U0QLCH1qkWP4INRqJ4DOk6vHFyOxYgpp2Bk9ElPOy68zxVpxFBZY
	3j6LN5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfAa-0000000F6rl-0FI9;
	Mon, 24 Feb 2025 20:35:16 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf7w-0000000F6ON-2Efy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB96961207;
	Mon, 24 Feb 2025 20:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E19CC4CEE7;
	Mon, 24 Feb 2025 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429151;
	bh=7Eyqt9Yi27fAwHev0xOEgY0/gsh0CaOyA02i4c7f+q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2UKt4dp2RNeu+KYdq+fQJdJTheZkYadYmOtIHueFj0GXVQuUlJv4EHvzrmv1Wf10
	 ehwrZ9x3s5b+7d6WxmzWMMg4j7Mgx9B9gfB/rtJEyp3vt7HH7+VU9jA2JVRSrwaJhf
	 xxzyDLlq5YZuzNCMthRET42kiJ6+hBHE0RvI+8YbDuoPz9OMTV0Is8E7fEyivjAp1v
	 U3itUCvauiJdIBnxgRQdJ5NycxTs/JKlte2vxWxIRwy9wZNevC7mrgPrf/9rc6xNPu
	 R22YZEkaXTAxNvTAEwTXVP2cAiV1pS/dHyR/D4yexI9v7LbZExCZvRQW3haj68/BsV
	 h8AB6Gc0w+vDA==
Date: Mon, 24 Feb 2025 14:32:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: display: simple: Add BOE AV123Z7M-N17
 panel
Message-ID: <174042914940.4047956.6244302350129117835.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-2-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-2-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:52 +0100, Maud Spierings wrote:
> Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


