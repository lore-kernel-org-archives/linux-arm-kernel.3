Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9E9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CHcWnCaT/HrhQCSvfb43sx5cf+SkS6cdWRij5qxDiY=; b=Nib/yvHu610G8OhVWQ6t62FF6y
	eqP6op7KgVPtOPKrSQ/1Fl1fLCvZw8j+LMQhmbWkL6+9NhyJvvs9PXPYplYCMDhn4IFmxS33f1ViP
	Z2wMx+KaZjMEk21qdBKCf6Br4ZcdJi5E8P+TPCEpJm5uEIGssgAj+3yCib7iRAG1qWeU6Mor+u7+e
	XO7luFIBb/N1Z3jkKUN3b30/nb+PJqKf04xFQ0ldjXsV2UhcLSQB3qp2C++it5RTBrq2ot+v8W9+w
	ya4F3M7UlHhjPXPed1Y6dkYBy4ZLQYX+YIeY2kkWHNiOtAA6vy/jnxFT4RSTqMAHa6ziXQ9JQlWs1
	JU/9723A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG9Z-00000000YgS-0mx3;
	Mon, 31 Mar 2025 14:30:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG2f-00000000Xm2-3bfG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4175EA414A8;
	Mon, 31 Mar 2025 14:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E376C4CEE3;
	Mon, 31 Mar 2025 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430988;
	bh=09cF1DDuW9O5QO9g7DxuD6Lrf2Qs3ubzxujS8A/3Rho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcEBVVtrXNVyIuBDQsTheOM4Xd3dziRMcK5I8XsO2poo+r1C5pIvRN8yUdTU+DxDe
	 WVcGhg6IHdrACDrXUvFb27qiwe8x95oLJuehpxDjI/cON8U5vjGARPLBzeDEWuHK1m
	 +F/xyMnBAacXdH5yRg16xoxLmcEGY2AVTCDywYiIqBl0xG9ukDzylYdeslWFCOcnvC
	 NAgluqK9YH9X6C3JCz4NI5r85CjJPnvFdnLsaVcWj8PDAoKQ3i1rHJ6grKSfDd9j8/
	 TAxa5EIMtAejT+R1Cg9yHZdCRP81v2rX+44JA27zaC6miRvybCWThk5UO6TrLIT0wA
	 Ldd++XibU6H2A==
Date: Mon, 31 Mar 2025 09:23:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-serial@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 08/15] dt-bindings: clock: renesas: Document RZ/V2N SoC
 CPG
Message-ID: <174343098722.2720962.4671608983688904024.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_072309_961250_547E9919 
X-CRM114-Status: GOOD (  13.56  )
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


On Wed, 26 Mar 2025 14:39:38 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
> SoC Clock Pulse Generator (CPG).
> 
> Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
> RZ/V2N SoC and adjust the title and description accordingly.
> 
> Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
> constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
> clock driver will be reused for this SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     |  5 ++--
>  .../dt-bindings/clock/renesas,r9a09g056-cpg.h | 24 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


