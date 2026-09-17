Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC2C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB+lkJpEGs/Tp7yJ8tDun2hxafZcPxZcGRyzDGf/Wmw=; b=m+umrkvun6RDC/yEJxlnUZBoHp
	+BMxQwpi8COfEdEFcmXdFCnRdTbqty9MkgJVceI4x3/eghCbJ7pFlQrb5Q7bpXXbnF0t8bZ5u+G8q
	j4dSqr+xLDdHhTci0XFXd3tHfK6S50jm9IonwJAEvLIbx4hSbGiXWJtEtUV5km+kuH/BbciXE1K+e
	oDz4S9a2F/0cyveuSV59ay0Wc1M/q3U6pU+XYH3F9nWCLoTnm7byrO1Y8MeDsfO6SeWLTypgMQT/G
	6EbO2naKZ4CXFDGtH3BkNtLKWMzmJ8l7+SsnDwHgnNoL41uBVo2McupSe3VZ3Ddgu8upYbpl5cxZ6
	05J0iphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H94-0000000CH7T-0CwN;
	Thu, 17 Sep 2026 18:47:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H92-0000000CH73-0nu7;
	Thu, 17 Sep 2026 18:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 774D2601EF;
	Thu, 17 Sep 2026 18:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AEE1F000FF;
	Thu, 17 Sep 2026 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670859;
	bh=RB+lkJpEGs/Tp7yJ8tDun2hxafZcPxZcGRyzDGf/Wmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U5yvLhR7kg3AUOGxWevVobUxFG5cDrRoDZl3Uf29aZVUbCqfsQeQccEGxNHVyjLlb
	 jByeQD+TBohUtSnVdtWFs3wmHc0yWebo6rAzygp7op11HA9K/nA0kfUTEc1LzYW6p5
	 Y5OPeTJo6eXJgWR+NNcJR0pOlZXy4JHAEwH++z4NzmRLqUMPOeImRb6UheiNcxxKOz
	 VGealALA/WvaAKvHrrXMxdJ2I/kEXd392Uu7EbUEplgLW926Mz+5VrG1Dj20vvA3rs
	 NiHhoUdiKVRDZYkT3rOl7OPKueo6PjGoEjO0P5g6bTv6iICpnEJUwxvat/xsW1XL5c
	 rrIildFOO0SiQ==
Date: Thu, 17 Sep 2026 13:47:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Correctly restrict
 number of resets
Message-ID: <178967085576.3095640.4739017152985753392.robh@kernel.org>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 12 Aug 2026 15:44:56 +0200, Krzysztof Kozlowski wrote:
> Add missing upper bound of number of resets for DWC3 node, because
> "minItems" alone does not imply one and any number of resets would be
> allowed.  Ideally this would be restricted to "maxItems: 1" (as in a few
> other bindings referencing snps,dwc3.yaml) but
> arch/arm64/boot/dts/hisilicon/hi3660.dtsi defines node with four resets
> and a generic compatible, thus make this one an upper limit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


