Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E72E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+mQ8pd1MXrfq0VCA3JBhpAVyz6hpqG36lyPYnbJ978=; b=xGrXOJ5MO2SXTqZUR3V8CTLh2t
	QBwU4t+zrhv4d/6rvcWop2wGtyTdyCZG9u/GA30EpFwdaQDS437ov8IpcYa0+JTuObH1U6WTV8XEc
	iJ6qFAe3Ttrr1go5kQgyH3j0tzAH6LucXRNs09ZJFj98xUde3+CPWbnpLCz2mPmVcO5Nvt/f8ktiG
	pFmXiSFqUIVS1g6EitvXJc1eL+y9D/77gFGfsvsjV5Gh7hhPIXoWcVjwSLbRO1DC631bMTVJ88RhU
	uTlX/bxtjodejbdO3PkFUC8StjxHqsVyyby7TJhfA2RXOO2DL5mzVpU7UdhLZVdqZQi/Bl40TQvUF
	t9r0HaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFJ3-0000000FWN2-313A;
	Fri, 10 Jan 2025 13:44:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFE7-0000000FVT9-1ZT7;
	Fri, 10 Jan 2025 13:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B433A41F0C;
	Fri, 10 Jan 2025 13:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A41C4CED6;
	Fri, 10 Jan 2025 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516342;
	bh=6706hwt5VHDv/HYNCdAtvE3p3uI0dV7mNWaIgSNjhww=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HDJxtVPUD3p1SPdmApTnfH1ZoE4n7ZFxynwqFV038FIhmH+KTYwzMG0DrffGF/nes
	 kHPqBwAElyCI5eK2Ezs/K/2wx9Fm/iwgfWvrIY1/oBQutRKEN6/5whRMsBp3y+gCvj
	 zsk+fd0zgLouIxMHWUtxp7Fvrsu5xZEEqA02aR3WXlWLsxqWJGuyQC/zI5p7cqJ3Yr
	 IdvP7rbi4pJzlYTPlII5k1cSTkk6THrWwSveggw5lwWG65vHhOGbTYdOpY4mPzjIzZ
	 S/HtoWdh6WDCC2mmpvDMmDXH7DENiQdWf8f0jNCEyIKckZyeYqAHdxqPq6FsuvWZ93
	 CdTSfMYioM6Gw==
Date: Fri, 10 Jan 2025 07:39:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vinod Koul <vkoul@kernel.org>, linux-sunxi@lists.linux.dev, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, 
 linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>
To: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-11-szemzo.andras@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-11-szemzo.andras@gmail.com>
Message-Id: <173651634086.2650897.13417575426746113059.robh@kernel.org>
Subject: Re: [PATCH 10/12] dt-bindings: phy: allwinner: add v853 usb phy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_053903_548897_4616C5C7 
X-CRM114-Status: GOOD (  11.77  )
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


On Fri, 10 Jan 2025 13:39:21 +0100, Andras Szemzo wrote:
> Document Allwinner v853 USB phy.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  .../phy/allwinner,sun8i-v853-usb-phy.yaml     | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml:19:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml: ignoring, error parsing file
make[2]: *** Deleting file 'Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.example.dts'
Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml:19:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml:19:1: found character '\t' that cannot start any token
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123923.270626-11-szemzo.andras@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


