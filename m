Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12991C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h24MVQB3Pa7KJ+3oRq0AeB4axZ+WgLhuj7lF0iEBNPM=; b=IXGqii4J9ELtAxdo0YAh9es0KM
	Ze6XGkQSCMaUld813AkDJnPXorZBuBL4cTR2WVDQCvlvLZPBUVzuefAKaUJ0a6j8cc79keLp1xOfi
	Ssv/Byn4+9/mgfEnkI/DUCzjGP9v+//TdXSuRlQ2meqROuO90HP+nv71o0v5UkTqZxhXkEWdDHAOr
	b3vCGmdsG5cKPrwfXRRZO/BXg3S8xT7aM3nGYmEwNk4QTYry9yCORGDqshc9BsCCe73wAKSeGJfVc
	BK4pY2oVtsqaSCnMObYqmEMTpBcHApz8bW07LyL7KQGJoAeWyolL5AA7R2cezD2amswL7dLdb/W8l
	+LC+VFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG6B-00000000YEQ-3SKM;
	Mon, 31 Mar 2025 14:26:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG13-00000000XWy-0hi2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 742FFA40558;
	Mon, 31 Mar 2025 14:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6C1C4CEE3;
	Mon, 31 Mar 2025 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430888;
	bh=0Pm6SE1CsM5OheYKnhI6q5puoPhrV1EB/nOjRx65ljg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uP9GrF4hFSGPfkkBoTvOAXueutIGYi8ah4rJdpAbjPgySADVmfnn2TNtrRIqBt56w
	 2ZB7W/kAqMGaPkQr86mRj2J8d8LXuYNnJmiUnnwQV184Cr9jdv0IYjPebQ3vJFYpVG
	 8gzWdPZsEmbBdjA0tRhbKXxoK0GF3L0QR9loq6ZlBNC6bmNNhCBtoOuOyI6JSReGDu
	 pClgCw8r3WdQGXEGRxt630DjE8JrKdAJRAsmX4zu2dgM/Bg6V/3Io9sA7ZqW+Wv08C
	 c26PSA1pnsqnZPv2+X9RR10U5DYuV1VrAUgztgPWMsjgFFUdW3nJmNIcrRj1TJlKWw
	 mV/hbOFIqRTTQ==
Date: Mon, 31 Mar 2025 09:21:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-serial@vger.kernel.org, Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 06/15] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Message-ID: <174343088454.2718898.2281236440720595243.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_072129_267361_2CC4AF04 
X-CRM114-Status: GOOD (  10.96  )
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


On Wed, 26 Mar 2025 14:39:36 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
> The SCIF interface in Renesas RZ/V2N is identical to the one available
> in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
> allowing reuse of the existing driver without modifications.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


