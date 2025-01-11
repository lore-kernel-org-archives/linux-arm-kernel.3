Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DA0E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVuzCVtcC6dUhu/anlvpizxyCZzJFzZ5EYScaeLeY7g=; b=BqGOV/Fmo/7iXvCVZ7KdLqKJZK
	Qifjv4wVSEDkW8RUcsG1Yw8n+bsJk48FDC6xHW+t1NoW8wNyG/65+XVUqndrnPg2SlKWSea3Kn10N
	JI/nGj5YsdOaduwvF7wmweqkrDalbpYQ5HyZxdVw0JMJJuabdQ5xw3vc1oELIAScjSL6PKXvDNW47
	kNQsuXsbIvMEjThLWxe2xgijTZz/8mcNnphn2JAiSGsyPgB8Pq8VO/m71xhdA/3r5Z4PTnjnkQUwo
	VdMlO2aFLW7JxvAWIg7TPSQ4gW8V54RqecwKBR0Tqp5p+ijfuiWKNnLOhMfghRU70Vt7KdF6dsSO6
	H4Fv2hFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYqW-00000000cma-3Eue;
	Sat, 11 Jan 2025 10:36:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYpJ-00000000ceb-2SjC;
	Sat, 11 Jan 2025 10:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 278D05C55F9;
	Sat, 11 Jan 2025 10:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E9DC4CED2;
	Sat, 11 Jan 2025 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736591684;
	bh=fZZO1bOwQFo1CHWDq8ozMF5xVNRUoFfXSFD36dQXts0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEt9SZVAcsDhaE3khNvA4RArfSbaSsdZOo02A1OVG5A5LcKCD+z/U6fppXTQnqBcE
	 DHTRPht/9CbH5fTgCV3RP2aC2aQnBbtAIAjchoW4TwDAKODiQJSlsuqZpKC6KVCVB8
	 vhmVPlbpWSIzLNt/7ti308tHeIgRKluU/U5Q6CLJofPbYiIbZz1wcqrI32gn6N9bRx
	 Krd1Lnc5GIRl6hEvhc+YqLzIzLiHcFHl3cXCK//sX4UpFDXyDT7yWYTLR1eUkFbM85
	 ghKuyTqPhlWMDEqCucRvvKEwgNnkFOTsPkMWLYaGkmQkVaywRIYxjtg6DNc3QczD4q
	 N5qcXnanbMiTQ==
Date: Sat, 11 Jan 2025 11:34:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 06/12] dt-bindings: clk: sunxi-ng: add V853 CCU
 clock/reset
Message-ID: <tttj7va4hzpqugah4rhm2u5kganuix5iy7373h62b3rgfwvdbt@53vexrsfmskk>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-7-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110123923.270626-7-szemzo.andras@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_023445_670784_F29D9F31 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Jan 10, 2025 at 01:39:17PM +0100, Andras Szemzo wrote:
> As the device tree needs the clock/reset indices, add them to DT binding
> headers.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  include/dt-bindings/clock/sun8i-v853-ccu.h   | 132 +++++++++++++++++++

Please use full compatible as filename.

>  include/dt-bindings/clock/sun8i-v853-r-ccu.h |  16 +++
>  include/dt-bindings/reset/sun8i-v853-ccu.h   |  62 +++++++++
>  include/dt-bindings/reset/sun8i-v853-r-ccu.h |  14 ++
>  4 files changed, 224 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-v853-r-ccu.h
> 
> diff --git a/include/dt-bindings/clock/sun8i-v853-ccu.h b/include/dt-bindings/clock/sun8i-v853-ccu.h
> new file mode 100644
> index 000000000000..a405b982f914
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun8i-v853-ccu.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */

BTW, also checkpatch warns about this...

Best regards,
Krzysztof


