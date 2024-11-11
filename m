Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B0D3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMv1owKde0cbqIkAg6vseXGpDnKhAqxH6L/8oiXcovw=; b=L5mib8fOG/vs/yFBrHU3DvSxZU
	5T9d5IOGdYh3brbPi4NNPmCw4MlslWRITb+m1cl3/3jGmTCRi54H8/vowmHvBnit7sXXHNXpZRIRE
	8/zrDNjlz6bKCCdhtaS4DGnIEyuEVEb44BZnlHVHOPJhRzZO3P7gzfIDrtVwRc6XsXGmxaRzKzrJL
	Pyf6Ra+GPt164Hog/Lu+gfZasTUxmWGo4AIN2Frs/EneNcs8MevXZY58B1bGDtQ1OIXdbnIv6JDt7
	b2LkvhbKOVDCLJaM5KK/JpQjO7JAasXBIUIWXu/sGsxsi+daX2MWnBgZA3OzjUOB9h7LCNa0Gs17d
	IACfKzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcfA-00000001T1u-3apH;
	Mon, 11 Nov 2024 22:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcdN-00000001Snr-3V3h;
	Mon, 11 Nov 2024 22:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1FF45C4D46;
	Mon, 11 Nov 2024 22:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1683C4CECF;
	Mon, 11 Nov 2024 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731363105;
	bh=VIlzaR283Tdog9da7uW65IBczFdM3meS/Gu8+t/7E2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwIbMchG3v9mStMdJDE99fEU5q8y8nhv75vwcihmLLyzshiIPNhqxd0bI6mYRlrpN
	 c4I1F3n6Is3dqtj7oNyed9AGnflAapIpjYsZrX4aBAA3bjiPtuNv2/RC0u5EoQnCRg
	 X8hiV0lwXec/p6zA4fCRuFR+KctBMlSWIS05Ow/Mlv+QfuxgvThA56gFOXLSac1lsw
	 5KQRUhVob08a6ZDvYnFUubnwvsvlCKXOOLsrzXfDEyFEoJNlL7R9CCX1X/q0JGCm/W
	 ogrA0wH04pTxUI0cg2tWDHS3QKWVsw+RVaOsrc+jkXsgOi+gqIU9WH0MI6ny26Jvpf
	 hohZcIVOXlfxQ==
Date: Mon, 11 Nov 2024 16:11:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
	linux-crypto@vger.kernel.org, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, jbrunet@baylibre.com,
	davem@davemloft.net, herbert@gondor.apana.org.au,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, vadim.fedorenko@linux.dev,
	linux-amlogic@lists.infradead.org, clabbe@baylibre.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v10 16/22] dt-bindings: crypto: amlogic,gxl-crypto:
 correct clk and interrupt lines
Message-ID: <173136310214.2045472.18188907864270197058.robh@kernel.org>
References: <20241108102907.1788584-1-avromanov@salutedevices.com>
 <20241108102907.1788584-17-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108102907.1788584-17-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_141145_941495_61E792DA 
X-CRM114-Status: GOOD (  12.26  )
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


On Fri, 08 Nov 2024 13:29:01 +0300, Alexey Romanov wrote:
> GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
> Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
> engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
> field from schema: name "blkmv" is invalid and "clk81" is confusing
> and sounds like something global.
> 
> Also, GXL crypto IP isn't connected to the second interrupt line.
> This binding is useless, there are no users of this line.
> We must remove it from dt-bindings.
> 
> Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


