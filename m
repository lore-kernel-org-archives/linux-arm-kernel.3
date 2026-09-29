Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B6CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOv7kS0HNWPjs/Q/hGDfbLcUNYkegrwvUSvy0nguU/E=; b=dht2BH01JLOhF53Hp2EPcGoggA
	qnEXauJg5i56bgvljrtyqUSCZLWgRNqUrGmOgOFUhg5vxziievwGAKO84Q0wW4iXU2qvFkSoOVtSf
	dvUfLHYoTrxNWFvtd1N2rchuLSP0oQInTI/U58NaMb0T+rn3pj/JLYnXMNl0Lu+/CBb2uVwaaM+UV
	Iob00jJU5P6qcxwQ/Ntoqr3xrmho2WxjZ4eMGeRLIQ7iPDD295VqNGSBHUF1uuPDMEbFSAUbMRjhK
	Pr2gNwfz2y0CpS5mSANdcU6aV/Qhn3PACe0Hsp1r11w45THLQ6SJf0jaos3bLXhhUFfjMf1lMzqwF
	q9FGByPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBem2-00000004Wx1-3ij6;
	Tue, 29 Sep 2026 20:50:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBem1-00000004Wwi-2ps9;
	Tue, 29 Sep 2026 20:50:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12F394069E;
	Tue, 29 Sep 2026 20:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F5A1F000FF;
	Tue, 29 Sep 2026 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715001;
	bh=AOv7kS0HNWPjs/Q/hGDfbLcUNYkegrwvUSvy0nguU/E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Mn2AyFYQgQxhfZ7RD4Ya642yiIK8/2l2E3CQFZ0TSOL/LEpwRbPotUFT5i7aW44VN
	 z+C12JVtubChjHGmVCPT95OXkm2OsPQqHnn3/piKqm+k+KAideiHehCs4RqHDL0tNj
	 1ST0P0VyRbmWap0koRQ/yI21kOGxDr6EA1y1ycBRpRCIpy7a2jMzn/9C04WSYthCIF
	 J1yDtyTqVawdYjRvbbN8mKVIjLN2gSY3fcSV5NW2x4EVDgZMxyXXKmlnrPt2EJAAd6
	 ZGl/qpz2qkf67KftPj9Ngw1fsUuApS+EMC1UytzAT25Ye+emUoT/YXSh9C8r35hEQV
	 G3jHYpOInq3pg==
Date: Tue, 29 Sep 2026 15:49:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 linux-gpio@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lee Jones <lee@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-spi@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, linux-i3c@lists.infradead.org, 
 linux-i2c@vger.kernel.org
To: Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20260929061417.20733-16-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-16-jszhang@kernel.org>
Message-Id: <179071488985.2683003.6376725914058156145.robh@kernel.org>
Subject: Re: [PATCH 15/20] dt-bindings: clock: add Synaptics SL261X clock
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


On Tue, 29 Sep 2026 14:14:12 +0800, Jisheng Zhang wrote:
> Add support for clocks, plls in Synaptics SL261X SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/clock/syna,sl261x-clk.yaml       |  92 ++++++++++++
>  include/dt-bindings/clock/syna,sl261x.h       | 131 ++++++++++++++++++
>  2 files changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/syna,sl261x-clk.yaml
>  create mode 100644 include/dt-bindings/clock/syna,sl261x.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/syna,sl261x-clk.example.dtb: syscon@f7e10000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
Documentation/devicetree/bindings/clock/syna,sl261x-clk.example.dtb: cpu-wrap@f7e30000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260929061417.20733-16-jszhang@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


