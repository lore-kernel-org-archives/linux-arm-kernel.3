Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3A60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZmnKS/w;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se/JwnRU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YAj/j/4efbhabnnhYe0OawMFMjQPvNoehqB7lBM/oH4=; b=dZmnKS/w6cbqxwYTqm64sRh/kR
	8xZ6GjQiNlRH4hRDKp5XQISSihmFMPJVUUMHFr0DuLdj0P4s5FTULOxqmWcg0QlUSDPbu1LcpNPdT
	4/N1FPYbziKJSbgrB9MaEScm64LAMUf8z3av+xOc9hCibW6M8lN7xc4SD2i46dJNkHWYlD/UP3EMV
	mmd93cx3P+CSYyGanzkRh8y7OpX8XopBDMIzipcizGZ01iKizCZkbC0GaqxPRPhqNra9Rg2q4MV33
	M1cMRNWOUIBXPLw7BUDKReRfViwxZfxUushdAtWOU5p07sOtnONMvSrLVLaFCSXDiYlmDZl5InrW9
	I1Yks3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqDD-0000000GLaD-2oPS;
	Mon, 02 Nov 2026 11:28:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqDC-0000000GLZM-2BbH;
	Mon, 02 Nov 2026 11:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDA5043B2B;
	Mon,  2 Nov 2026 11:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B841F00A18;
	Mon,  2 Nov 2026 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618905;
	bh=YAj/j/4efbhabnnhYe0OawMFMjQPvNoehqB7lBM/oH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Se/JwnRUSvAI174uNSFWm8zut3t4wPxKX5b6eyWLnlfmxFJ3gkN6dGEFZP668euNQ
	 OvJYYgJz4nE29c3PBg8TbI/Umvjs0TK8ynMEiLVIgqDsz7l2kU9HQp+ClIUHBtpR91
	 x5lS7QhfHyQ953vDyfEQjpGryIcog9WtJ87zbvsoRHiaM6LyQyH7p+fxlzw9wPKzKt
	 QBp5oHWfuF1z3Wb2VPyhiBXYb9SAtKTpUFfFj+fCg3opeWkwuw4jdb7P6bJ+1SCAd+
	 MU76NXBDYCFd3JJKikrSpY2LrsUKOOZXt/LnFpddxT7kXRQXUhVwWtpeMA2h9IXDRw
	 BZesqZeokXJ4Q==
Date: Mon, 2 Nov 2026 12:28:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
Message-ID: <20261102-spry-snobbish-hound-384cae@quoll>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
 <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 03:47:49PM +0800, Icenowy Zheng wrote:
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSI controller APB clock
> +      - description: PHY configuration clock
> +      - description: PHY reference clock
> +      - description: DSI controller input pixel clock gate
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: phy_cfg
> +      - const: ref
> +      - const: pixel
> +
> +  syscon:

Such property names are not allowed. Missing vendor prefix, missing
descriptive name.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the VO subsystem system controller.

For what purpose? How does this device use VO? What is VO subsystem
system?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - syscon
> +  - ports

Best regards,
Krzysztof


