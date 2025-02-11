Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBF4C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX7bdOSA4MkjLF/eOV45TFG1FWsUKhPpXsxPZVry6NI=; b=Qf1tySHV3MzYbe1Mj1jFqnS1gY
	ok1ar6wLPgz9A0AZ99StveACcH0LMlT7KzQI/fsqG2xrXGcPQwgQ++j3BkElxFvB+FiyDDkPt2fAC
	a9aPVNPDHpMjkV01HDpSqFyJOFd3v/K9HdBX3QFtcGHHsesV3VS86vpnNE40ohruT+SadkyYZF2Ex
	kBvrvZ0eM5oOqsKfAVhGdYYdc3X3ExyLaMgLs9kTzX9WFPysD9/CmG9R/3hL1LOXZhyNloWwqK4Ch
	CTAGoiVshA64j2ILTfn0KJgslzcLWBdUlM7HWnJyC9EvTov1h5nfZ5p/8vCGi6TGvqvvD0ksppQj9
	OFg1iOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxSn-00000005Hq7-45iB;
	Tue, 11 Feb 2025 21:06:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxQa-00000005HRd-2JSn;
	Tue, 11 Feb 2025 21:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FCBC5C5658;
	Tue, 11 Feb 2025 21:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BC5C4CEDD;
	Tue, 11 Feb 2025 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739307859;
	bh=QBM1KecRIyqwFJKJr5Qa6EXftCFXKvIfRc/X2og4zNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJ1e4HBR4HykvJcDifuZAV8jxb26dyJveTq4z6xAuQl98eFIDF/Fzj/Ai65OpksOx
	 QUCBtM/uoWTrskBIGCgtSKyIFp6yLq2z1IhOzZRQ3aMPDXnX/AbPWXp6IpHagE0j/p
	 2ZpWzK7McjscizTIHAHMBJq0TQd3uXuGgISTx5WUgH3RmB4GAsmw9IOpXq56vgzeTN
	 5xNFdHSdjwxipTAVpG9gZcXkjwnm82a7ZekzpkFn/OxjJsu1KgdZ5md6U+4gNsyneK
	 ugdWWtiuYFFHt8WJy5FdipuWXeUXN7jxtCF9qQMAAdk61NSbuhmR7XyJ9W6VdtoOVG
	 ZLAeOXFopDtlg==
Date: Tue, 11 Feb 2025 15:04:18 -0600
From: Rob Herring <robh@kernel.org>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 07/10] dt-bindings: phy: allwinner: add v853 usb phy
Message-ID: <20250211210418.GA1172102-robh@kernel.org>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-8-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205125225.1152849-8-szemzo.andras@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_130420_634826_ED24511B 
X-CRM114-Status: GOOD (  13.06  )
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

On Wed, Feb 05, 2025 at 01:52:22PM +0100, Andras Szemzo wrote:
> Document Allwinner v853 USB phy.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> index 21209126ed00..815742c4f5fb 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> @@ -19,9 +19,11 @@ properties:
>        - enum:
>            - allwinner,sun20i-d1-usb-phy
>            - allwinner,sun50i-a64-usb-phy
> +          - allwinner,sun8i-v853-usb-phy
>        - items:
>            - const: allwinner,sun50i-a100-usb-phy
>            - const: allwinner,sun20i-d1-usb-phy
> +          - const: allwinner,sun8i-v853-usb-phy

You just changed existing users. 

>  
>    reg:
>      items:
> -- 
> 2.39.5
> 

