Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3045DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXgF7dAgk4iTZUh4H3mCtpwk6quEN4ZF7zqR/hJvVf8=; b=H7vHztqwEgIwfq0s7BkVNX3dQq
	uAB/PjLUYN0raY/WoliROIzZmC0zV6H48C9CSrHqQVodHtiP5w5c5DeCmnq0gMC8gYZ+/D9kZCyIg
	6nLksFBoe1X1/nDfinGTGL3aw5fltNp/s9ILBH+toFWVmk33m8WfNjt9mdqxCK6eapd63IQLNaTo9
	YRTtRHElPK9sCQTlwAkFmcc4sYQmGc3kRWom5w6/YWNGBgYyyYholF3X6HjXt1/5j2WJ0j8BrXfrW
	J6iOYaxhK+IynsBXeyfYfw5tMTjyTpxAemuQjLp5QWI+NDuiMSIUeMZIJLLIcpbSNEcDXl0z8gTsj
	OTJNu4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG4U-00000000Y1A-4B9i;
	Mon, 31 Mar 2025 14:25:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG0g-00000000XT6-1ooT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0609D61126;
	Mon, 31 Mar 2025 14:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FF0C4CEE3;
	Mon, 31 Mar 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430865;
	bh=W9MupiPxxmBkPryOxN/L+ti+aXulksymMfGot8jiKJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNlrkrtAbhi58Cj9Gwmace4dnDaaWlgJ+/5tKpXbS4UQM2DHXcUTOYdvUCRkjSfoy
	 izmaVW+H4PUxQjqoELkP11nQl4N02afxowDr/nmPA/TR8CFyYMSDTbQAxl4Dq1224B
	 mcYCxZh2Jw6WPBtfVLH88WkPS3rEcrkHG8S0k49DMfoWzSESKaQR34CP8kLiEIrd7h
	 5bu1YgQwPPgycrSnUabLxp9g41RYKPWvXwHm+f+q4XuUHZgUgN90S2jTyAjvvvgmZU
	 fn38OuDtWeu++T271sz/V3x7chaMlW6NWOKfi3qxYicebW1/QciDqoHKqnxyi0OX9Z
	 8cS74b2OM+gEQ==
Date: Mon, 31 Mar 2025 09:21:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-mmc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/15] dt-bindings: soc: renesas: Document SYS for RZ/V2N
 SoC
Message-ID: <174343086357.2718398.4573636062577343035.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


On Wed, 26 Mar 2025 14:39:34 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
> Controller (SYS) binding, as both IPs are very similar.
> 
> However, they have different SoC IDs, and the RZ/V2N does not have
> PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
> these differences, introduce a new compatible string
> `renesas,r9a09g056-sys`.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


