Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9BFC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zr610G1lujbKEPCWGGsMdKO0GmGZfz3XXntypFH2+4=; b=MIVldV94eZCoGB7qOJRLoYu6+U
	PRGb0JNGHuoepVVlKhq8MPn0J4ln0oCbGj/M1Joudrmo4bXJqc3oSyrBs/JLcAWLqPtgI2KztzQ8A
	LCl4x2t9trBTK1mesjyOBiRxISF4WaSB0/g6VqPLKBR2S7JJwCNv3dIwzp+qQvSyaUv0aMOTPE0RS
	iXWhk5nyrV58d+7uzVmIrU1FmL8UfIFSoQrlPYl1oI8Lz1tH0eD8iYi1Z5tMewl22CIFzuvGxpqcW
	Z8G0s/ukEhtPM2AaF6RSSUee402kBmUi2wjgZaP+uzDLEP9zRm6sEFwfbKGdfnAJoR5aMg7Kqu5c6
	AnyDtCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG7s-00000000YP4-1uKS;
	Mon, 31 Mar 2025 14:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG1h-00000000XeZ-329J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7700961155;
	Mon, 31 Mar 2025 14:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE1AC4CEE3;
	Mon, 31 Mar 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430928;
	bh=U9hWi4Wcm+e5yEwX/JwrER+hs6BFslHlhI3vcKnyY1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObKmAjXytu57SfeL5ZeJdHC7hYqPQQhVOSE58amfPgX3A4NQ5F3hH9oqamChH/jYy
	 fPtQS66+YwpD3kOt4yjxSydo1AfNTloZabzlawbJiCVNie5ymIwKcG1KRZX2hmf04t
	 bErJdcJDKujI+ueXs5bi4d4gIW8bwla1uPwZ3kq4Qn6bpnBRLK0tiG1qlQEpLDoAs5
	 5dEBqTC6EjchWt2O4l7BKTv7n8bQ60AqmFVrTt4XjTQvAGYcys1OiJP7sT130UzLaS
	 LW1N7Pj9eBs13L/o0KsTqes+wNcfXlziXsHaOyue4ti9wOHitCH3EJU41+Ue/+3Nlu
	 PdUf3JUBs/OPA==
Date: Mon, 31 Mar 2025 09:22:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-serial@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-mmc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N
 support
Message-ID: <174343092707.2719758.2548566419731901168.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


On Wed, 26 Mar 2025 14:39:37 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


