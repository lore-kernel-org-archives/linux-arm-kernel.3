Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A63C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+QGET4qV+UDZIlvjxt49M67k16gv5jcgKlGqhRI3r0=; b=AVb0yA1r2YSdF1Y1pC+eDfiAkw
	SBVWw5cGPM9ako6ndspvcwjSnVGt+SDp/brwVPrjNqP4/YfBM+uf2+UK5t2JCa1PufKZwm22U7141
	pVvGqYRN59uf+L7q9SCCMTA6m75eWpOcuPFsRBfoqXoklavANFTOMTnd462yB2+f/1f0lptWqzxmA
	zGTaPoIgv6mIfJHgbv+wQMkbd7nw+KJjdpY2Po9Dd71EYzlkbmNl33vceVutL5ktsKkWvqsoXZAa7
	gq+N2cd773HM1KYps+zIumoJVMhJ5Xrwk0KL5VZuHDZQeQbvyZeTOcKt6432jr2YNGjd6rvU7i2mR
	8bAetGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaGv-0000000AglU-3QoF;
	Mon, 12 May 2025 21:01:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaAu-0000000Afuo-3g30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F6F24A84A;
	Mon, 12 May 2025 20:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59535C4CEF2;
	Mon, 12 May 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747083300;
	bh=1Wb+WsqVMEuJbQLKe8Gt2DrmhyU52bmcmcDDaS0ZKGM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j91pA5YqJOECZEmryiT5l3eX4hV0AuxbWjsTsrMlWWDn5zyzR47CwRWqoZHtT9dBr
	 /UjK3+vR48nO1OS29TJe+i2IYrwZhC81RB5ufv4bhlhUF1R93NsqNjrh9PUW5P/kYy
	 kaox+g6mX6dw+D0WwjUvR1YqGpBjAvKASKjPen4oybX/MZW/rVm+BXrKvw4Aj/2ZHd
	 8FQv3oElcivsirQYuC1D7c+aBdrBPohHH6VRTGDedaxDP6FjOqiteP0Q9V4rvb/L1O
	 YoXYXggIrTTPcpxJIVg33jvU0p9EZVHemdjOFl4YuZ4bKc5RLH7SctCIKuTSJZLlPN
	 Rnxip5KxZHOsw==
Date: Mon, 12 May 2025 15:54:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net, 
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, 
 olivia@selenic.com, devicetree@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, 
 herbert@gondor.apana.org.au
To: Ryan.Wanner@microchip.com
In-Reply-To: <ea33a6222dda7c60fd404a4b0e9c4824e19ee1bf.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <ea33a6222dda7c60fd404a4b0e9c4824e19ee1bf.1747077616.git.Ryan.Wanner@microchip.com>
Message-Id: <174708329457.4035885.12979027152382055790.robh@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: crypto: add sama7d65 in Atmel TDES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_135500_932161_47EF1A89 
X-CRM114-Status: GOOD (  10.12  )
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


On Mon, 12 May 2025 12:27:29 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC Atmel TDES.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ea33a6222dda7c60fd404a4b0e9c4824e19ee1bf.1747077616.git.Ryan.Wanner@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


