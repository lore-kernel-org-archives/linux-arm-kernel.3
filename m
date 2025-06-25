Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53622C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdJo+z0vm5JiN80v0QCdL16jvVHhfBh1ZQWFjmMj9XI=; b=tGctp6oOa0hM2NLTtMD8VGLyrS
	h8XfLXNbuXqXB19MnOBU33uuqxffIAWbPgKkHYGQLFPYq4t0wXhN8q61iHJI4930u9FF5oIfs+oRn
	Fl2KAjhtqPcm0exUWC3wWibENWHqtTODUDD3J8wU8thVKtB26wqE4Od/zNcONak59ViIs7C6/xZI0
	vjzRvglbnWE1TQGnqSgxDiSG5QyK63iMNQWvT3sGryTu2QO7xnjOotHptTpxmEkNJzuxt764Pb6+p
	5PBj4Nnj7OKmC7h2r/MyebYQSm936nGQHiQRX6PXmc9NxjlIIhIUBvfWYHFl/Fw+30oEv+8dE+ML4
	BW4oAAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXYx-00000009xVm-0pPi;
	Wed, 25 Jun 2025 21:21:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV3k-00000009dQb-0zfc;
	Wed, 25 Jun 2025 18:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JdJo+z0vm5JiN80v0QCdL16jvVHhfBh1ZQWFjmMj9XI=; b=izdi6TZCfLXeP3Oa4Xbn8pP1LG
	imJOyo6MuSh7YJf/xt5XHWS3JhciwMerpyRXgOH9VJZ/uKxRHS0sjdhkxPKQCMLmMG7cbQ9LzoYME
	1R2suOGY1fb83C3Su2ZkoXJCDHq6O662zH4e6Sc9VP7anYFqV/OZHuwjmf/wpRaj7dY3h8KGnXw3t
	L+TCUFXB8fJ2us86to7XQJ11YZPPxJ8FJ0oU0c9klfIsq7r9VzyLq3FURxh236zCABSQ8OvjoO8EL
	VgOPL+JDMKzGXHcHeBvQMEsXUqGlZgVTIOUfE1Vw/JqN+DXJ1L20FuNmM6TXaIevtuFT1uI5fmCRt
	lPUuXZew==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV3h-00000005vii-0Ddo;
	Wed, 25 Jun 2025 18:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30D31437BF;
	Wed, 25 Jun 2025 18:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2B2C4CEEA;
	Wed, 25 Jun 2025 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876878;
	bh=YIqdFUnrDKWeVurIumCT1yOoNMX9Wmo1YKjLdM7JSjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWtv+78wMBu4N9UTopIIMUNW+CMD2DzcNjsZ9E/gZv4rrH8qSp1646DCcIZauoJUp
	 wsDkvqfgC+xderKq/1fUAQE1Z7VSfm3ajte1uo0DWT5m7mGMwTWVoYyi0PvtDTK9nj
	 8LIv+T3ivxaZmpMx1xp4PjniDxaupneqaqsa7WJM2gRm+Sw/e/HNr0CJ088Tyz9L+D
	 UTEnbZavZaxGHEEp5UK3DN9dlnBNCtmo8Gpuic94H88xBDqYyGNoyssLn+QBllqVrh
	 ZyMNGoc287Qy7+hKeovf3oMEKN8WCWak1yYeKEWzY41lCoENV+hlrXyArNukjRik1+
	 T/olh0kJmpNeA==
Date: Wed, 25 Jun 2025 13:41:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
Message-ID: <175087687639.1999653.9393745012974436532.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_194121_428051_93F58CBF 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Nishanth Menon <nm@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 03 Jun 2025 13:57:11 +0200, Krzysztof Kozlowski wrote:
> According to Devicetree specifications, device node names should be
> generic, thus Mailbox provider should be called "mailbox", not "hsp".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


