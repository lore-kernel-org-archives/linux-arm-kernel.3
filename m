Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B575E68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gEXp1nhVlMXcbGgsvJvTKYIGaWGNrhVkSBXEe7Ltks=; b=vYLkx5aEiiq2LK8ezEZ3obJxMs
	x5XweiW5DiiEaOZ6h9/09cCPIUREuieXvhQlLhzmE6M4gMIuh6c3Mgs495+vJhcnBNY62nm4UnWHj
	BW/UpTmzNh4yyAbsRKsWxg2M7J/EGY5gDd0d00LX7ccWgHHQye6Y2fJLiSEAnNg2CmVrdWzld/Ww6
	RdAB3gIPS6wRFAiQZvnl6s3qQW0YCmRDuppY7DBp9FdPJL1E05ZdGLVLHgLPEut8wnSS0u0fG/bKu
	hj3dXHejnQzc0YsztPM9uqqtQ/BUjvZjuJmMuPrVybFtBQV3SG8uK2mYtTfC/BhqG761R4AVeppIj
	2WzG5DFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Pr9-00000002ptP-3ypt;
	Thu, 31 Oct 2024 07:44:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PpW-00000002plL-15kV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79B90A438A3;
	Thu, 31 Oct 2024 07:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7621C4CEC3;
	Thu, 31 Oct 2024 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360572;
	bh=cKqO+HacNDsYOGX1oXC/gkePXadnPjS5KOgqUQC17uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhzZduIsTLE6KmsEKbW1O8sF8COg0PID66sl16MUGDwWFLNDMt4WnDIxrgUdQIb85
	 bY9WRwqdcj5/n5SfhLufBmHB7Ao6fZD1ZBCBC45+pRCJ1/Z7IBLuC4SNza/FkujWP9
	 JVfy7d7o7Tx9hhjauRbtg10ChC0bDwV6wkZUyhd7BlZsXt1hgnqGNNw8YsFVN+TAVS
	 teqzBBA8m8s3c1+rzIxw6IRE9LHhHxllIC1gZ5OoUX2soOKrtV3k66za5iEd7BrWXV
	 SixWZapnydK8F1EbKgrC7JsI5/ep/eQmSsOn2VwyAIJA2jsBfY3w3X3uEwIIBBsIao
	 yXV6wZ7YYHARQ==
Date: Thu, 31 Oct 2024 08:42:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/13] dt-bindings: opp: h6: Add A100 operating points
Message-ID: <4flk2ub5dldqfv7wd7ytmmnvyvwqb7fxhw6eut2fpatnoms5li@kwehlp4mhytf>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_004254_387314_6C32D35F 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, Oct 31, 2024 at 04:02:24AM -0300, Cody Eksal wrote:
> The A100, similar to the H6 and H616, use an NVMEM value to determine
> speed binnings. The method used is similar to that of the H6. However,
> the information is stored at a slightly different bit offset.
> 
> Add a new compatible for the A100.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
> Changes in V2:
>  - Fix ordering of compatibles

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


