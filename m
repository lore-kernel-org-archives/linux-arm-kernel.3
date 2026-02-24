Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F93EFB811
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldww1WlQMkoL/zBNyH/ndnXhb+ElXOiHG/mK0hPi1Qc=; b=XlH5YgmS16vTSzScQNZ+x9aMNc
	pFWY718Jc38n0IamhBxU1KAfy4tFPUgOiIoBvmc7kLlKExhYspU9eoQd7mISL0uJBKhd/ZfIjHJ/c
	tMCEuSyNHrXlBOntkSkkEtBsSwuPfX2wbmZ3c2OnYr/maHiyUTUqwyFTpGS3K5WCEJI+a62tmZ5G1
	IC0iQDyZ3eR6VxlARfsDnc5AZztzDPcsxqdxVgeJ/Bmqa4l6sCI0pp+mKsW9UTnUSXU2/pvTRQXMU
	G27c0c1pxU1zXV2Joz7jOI63+TXE0CcpITIK7OrsNmur5hcJCT3zQ7N5Zn70lmgpBqlp4NXenVpmt
	YKaAj1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunI9-00000001bss-2uVe;
	Tue, 24 Feb 2026 07:57:13 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunI6-00000001bsQ-13zc;
	Tue, 24 Feb 2026 07:57:11 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 43A19EC0330;
	Tue, 24 Feb 2026 02:57:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Feb 2026 02:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771919828; x=1772006228; bh=ldww1WlQMk
	oL/zBNyH/ndnXhb+ElXOiHG/mK0hPi1Qc=; b=nN/T9M+vmH5YqvY1M4+dtPwULO
	CPqnNKjgIsJ2ihdGyRkXskoJXQDDmxTU1S967RwRLPJf55RPZgGRYw48Z7TAK9Rp
	Rmz5xaZhz7yAIDMCXS5XdbuTQLwVrHdNNgA05yiRl4zmM0uA8V+IVZM2RcVbz1+j
	KgKwZJdBHEsyzgoWyZF2B5koy1pNgtPhhAfnHUy81nXnwyC3n77smPEbZktI7sBt
	dG/g6vMhwz4QMBysMcbFuJTt2sPcSdw0+WBUiqSUwyreI01eVfbcHR3bcWNfeqIw
	4308RgbuurCQgufA6hqQXOl7qOITn/4dGwk9Pr89eOxZUjdOUQ0+Mb0/HAeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771919828; x=1772006228; bh=ldww1WlQMkoL/zBNyH/ndnXhb+ElXOiHG/m
	K0hPi1Qc=; b=bdmc02QWewmtGwV3ILdMIAeoaK4OpigMC1Rc9l74iN0cios4jBv
	VGiZC4gUMUJkEmy5EWeqvVjwSXTsYS0ntRXCHv0XPTJoymwKAQTYRxj9bxfS8MHW
	SI9CmQgYGTjiBvJNgawmkB1DUD6nzgSOmsqAOWOyQWP5mGaV4c7ilnxFS7BIhKwT
	CA2fhdMtM7AXx6K3p5AHIIonzi6gSUhr963d7wHpF9CA0aV2JwGFU3IcLEF38WBI
	AkvvRAR8aWTdBejQPLxS+GvmaekdpkxCPnXFgwnMM1aWwxIb5TSMHya+0elUsoo3
	iFyDGwT6aO9ERBXsohQ66akUMf5my5HbUNA==
X-ME-Sender: <xms:01mdaUjUsyTtDSNTcu2odblcfhI0IeSvrnYO7oBCOZ2bO1QDJkrJjA>
    <xme:01mdaVLkqH5ynk9ohtpxRuVYvrUb672JHQ3z-fXXYQA3Cobu-lTKT3Qb5P_NbQEtp
    1RmxQP-PsXpApyTSXn3ugJBToG0kAD1ljjxSukRz2ljcYXw2_6GEozf>
X-ME-Received: <xmr:01mdabnwOwxd2iOX4HaIZzuWaPF_lZXBfhWni4owJblHsZxPfuN35BTC61xAGN4_dTY2r0ol05HSQlhcoBVyHKBXT48yC_pmXL8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeeliedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrdhquhgrlhgtohhmmh
    drtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    nhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtph
    htthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqphhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    gh
X-ME-Proxy: <xmx:01mdaVMzwroFnj39sRBE1ZP6UfRkYYKP8xh4Eri-FxBTqYAeWrQDsQ>
    <xmx:01mdad6NQMaFSVf9mb2Rd8rz76GSjMJ4tlkXuoBGozwzlwpcb8fqig>
    <xmx:01mdaRZ7BxuC8sAAqhK2bN_4ZkTxYTKyAMI0O68eWe3Pq1rPTI3mQw>
    <xmx:01mdaSc3918Gp60VyRKHANVNtwJYzDJlpyU_g8qNCM58BSf5NiYZVg>
    <xmx:1FmdafEQ5HQiUWC3y0T9sK-O5XRFLbybtqoG4Er5bS92OzYedtH7yOcO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 02:57:07 -0500 (EST)
Date: Tue, 24 Feb 2026 08:57:05 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable
 static
Message-ID: <20260224075705.GA1310076@robin.jannau.net>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_235710_730674_B9AB201A 
X-CRM114-Status: GOOD (  14.56  )
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

On Mon, Feb 16, 2026 at 12:04:14PM +0100, Krzysztof Kozlowski wrote:
> File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
> make it static to silence sparse warning:
> 
>   atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/phy/apple/atc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index dc867f368b68..32d97226e926 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2023,7 +2023,7 @@ static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev, unsign
>  	return 0;
>  }
>  
> -const struct reset_control_ops atcphy_dwc3_reset_ops = {
> +static const struct reset_control_ops atcphy_dwc3_reset_ops = {
>  	.assert = atcphy_dwc3_reset_assert,
>  	.deassert = atcphy_dwc3_reset_deassert,
>  };

Reviewed-by: Janne Grunau <j@jannau.net>

thanks

Janne

