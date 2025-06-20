Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582DBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkY3+4TclUv165X4IeoYBYGpiuBHnYRD2W9QKlQ+cKc=; b=ciMwq/cPWgH+HmfuEemdoXX6rA
	Tmldg2YhYoBDa6R9jibU/36TPSmPsd8WlzQ4/aHI7ZhRWrr5l3LlnjsZSVuk/MQyqZdIOEkxgKNEO
	VyDnL56cr7mZ+lXu8xR/WSV5veH7XHdO7hDGu9ySfiMIFbjP9OXMhib1TkRW5UD0mAnDCWcZpPTqf
	xkEM5/whKWOqckCtkjQLxBGAY5/lY9CWsNW7Dqk24nvzMfZymaZmlDI6I9UaSRtMAnzODB/1HgAx5
	lYy9K2c0iOZ6S5w0x1omnMKrZzJxXc9T6HNyjHSg3uXSua+SBqJoJukjMPP2OuwfUcieyKLzDMeMs
	z7Gdo5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSW8N-0000000EwVA-1LHV;
	Fri, 20 Jun 2025 07:25:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSW47-0000000Ew6h-2eyL;
	Fri, 20 Jun 2025 07:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 691C95C6971;
	Fri, 20 Jun 2025 07:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFE4C4CEE3;
	Fri, 20 Jun 2025 07:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404094;
	bh=Itc9ddbP7s53ig+Z8sahKa7vHJExHczg9UB74ndkSPI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l3ibzmw6cfD/1zap3DXnKrGsKBbjSdP8g0Via6HC1pavu2/ECH2MlF9m04hMRtL7A
	 JAn1iwABQotzPbFEaAPh7yXXCzjXVvRJZPg7J5lj5hXBpcTT5pecqu6Ap8h1z+qlG4
	 +7pHonS5IHIPoOvrl9RDESnG936EtL7S9Obz6oDEURnDYFxrizS7DVcro3tfU+tL/N
	 oRi5BZW0FUfhbMhbPSk5Ij6detl2UaZ08imnUq2iC67HH40M0FTgva+2wbeeTH2ymZ
	 xFbXWmttm2Cb0WPzCj5GVJLJeNEE4HTeCRDTAEGVsX3rhcYMBp1+ysj6u/SASmOl83
	 WJNvYF7qYzU1g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
Subject: Re: [PATCH 3/5] clk: stm32: Do not enable by default during compile testing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>
Date: Fri, 20 Jun 2025 00:21:33 -0700
Message-ID: <175040409330.4372.17935739040360849030@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_002135_729938_EECC301B 
X-CRM114-Status: UNSURE (   6.43  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Quoting Krzysztof Kozlowski (2025-04-04 04:56:59)
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

