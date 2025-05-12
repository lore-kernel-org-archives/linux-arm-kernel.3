Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C81AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smJuIlbY/kclC3SbqZ0nbBlkclKGl5PdXg9Asj9iHzI=; b=nmlMOP5GzANT2YUG4y9OjpX08X
	wsLu8I+qz/caLFfAnKa7uMwMGy8AqERAMZnS/FtUcuPQBq+272/IVgBrVDqLdSgXr6iBCq7Tvmmn/
	oPP5JXiKKGAG+TVQ40994nIWnGaMR8UbWQPY6/+FJSwpL5awl1bTdkJ7GMqA81FxYYFIgtH2tFlAZ
	ht6VyBgvNHDmb951XV9cI2Ys79uKF+CQl+exwAn6ulwYTSE3jA7I+3ptrC0uNP2L5f/y9qM+EFHp2
	aBJlb0AB1QSWrE52iuqWyNk1DpsX73tQsgP0EAMeeA5ZgXpIXWDe2LBP58wxGhs0zrQpSyEBbPtF3
	pAX2LVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaCv-0000000AgIV-1UqK;
	Mon, 12 May 2025 20:57:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaAs-0000000Aftp-3lKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07F124ABA8;
	Mon, 12 May 2025 20:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98243C4CEFE;
	Mon, 12 May 2025 20:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747083296;
	bh=WYopPnPUw1i5AsuO8nHMj+s662geBZfWCMLAQjzs1EA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fZFs/K330IkmKc5AuLextmGbByhcgoV45YIH2XjLvi7tflgMS4VqbjL3oPHYmWooS
	 ahtt6gjhkj/JZHfKCwUeT2OsMmxu48eamKn1I1bIhPFbXFXpo/aEkvhx7c9YaqWSdq
	 4gODb+8UBzBXbwDq/5nqB/CjjOT1H+dCrZvcM5uvQZwbvGZ5i3U47kAoU5KE7W64Sa
	 RMB2Y5zoX5RPYxjJzATIG2FxdZkBHfbG9ERizdXozqndZjAR6aKSlSv+CD/0bC4XUa
	 f38sCqkjibSr7bJk43x6JJT9As7jzTylhFyYvB7KmYC7MXWilC4XoptSHfEuclNGJ0
	 7PYowlBSCS20A==
Date: Mon, 12 May 2025 15:54:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
 olivia@selenic.com, devicetree@vger.kernel.org, davem@davemloft.net, 
 herbert@gondor.apana.org.au, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 conor+dt@kernel.org
To: Ryan.Wanner@microchip.com
In-Reply-To: <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
Message-Id: <174708329324.4035802.9148165987582319414.robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: crypto: add sama7d65 in Atmel AES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_135458_955099_0E9088D2 
X-CRM114-Status: GOOD (  10.26  )
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


On Mon, 12 May 2025 12:27:27 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC in atmel AES.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


