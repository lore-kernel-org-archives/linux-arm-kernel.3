Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E87BC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGOs3LmheAB5/MRmZQpveixRYXMro9PfIyjH/kaB0yE=; b=o8wFI8ZZYJTGF1AFyUKmxvKdVX
	4IJTuaqmIg69PRoGoapAGkt/WmSZYe1gPHGFmIVPLt95617ttbRHjFjTpXw4/4x253XhdC0+FOkcb
	V0w9d6m/IBU+WPxhkFLC/OGICHuLOfEkwEWD6YBA2SQz5W1w03xXY/ZgImzifELurCynbD6wlUL0D
	/5b6qvpNG1KW4TPhvTp6De6mJSxWqyz7w52zIRc/u4mpwqpXIj0gxf0EcSgWlrlwxxVPrXY800kYp
	KreC7EdGcqaQdojUQymADFCZvTFPVTMx0ASz9d0gRQgpdNnKOcscpibTdCQUmulFxJtfrLXS+5h/y
	+Ad/8MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMA5-000000012jA-0o90;
	Sun, 09 Mar 2025 19:18:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLj0-000000010Ig-1rej;
	Sun, 09 Mar 2025 18:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 070625C4B54;
	Sun,  9 Mar 2025 18:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43868C4CEE3;
	Sun,  9 Mar 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741546209;
	bh=DE7rxV5hRZWbRfzVNpNP3kMmumFkL5JphKjCeeXHOkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mPxiRP5wubFDs2aPs2uofBXSSevfhY1+Vm9j0ECn/EBxpR8GmpdAAS9JN9/M9jiCn
	 bXAdVXOtQA7TDMrMVZrWkoiOrH8W4VFYUB5+QgedAAAEu0FvBYYh/T/LvJk0Id6dOm
	 n1TOCKn3vIf+kEI+1+BzugoexCdqS1V8KvM4A8mBrtL6pv+lWRtxIN3LyG4Qik1/F7
	 T4NqvW5+siU69hRS6SDVjhKPWBjNWPe/EYL5WXGQ6YJAy52g11rbIVCP1cuDSlkk4r
	 ejdb/+osl4SG2D9m1hJQ6enPOVKfMLZzxGXfkuJjy8uMOPQ7MR/w0bevrgtyLQ1Y+j
	 bd+1kSKK2B3iw==
Date: Sun, 09 Mar 2025 13:50:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 upstream@airoha.com, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250309172717.9067-6-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-6-ansuelsmth@gmail.com>
Message-Id: <174154620758.1888708.16493498235993467665.robh@kernel.org>
Subject: Re: [net-next PATCH v12 05/13] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_115010_601652_1586A5A0 
X-CRM114-Status: GOOD (  12.90  )
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


On Sun, 09 Mar 2025 18:26:50 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 186 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@1: $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@1: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@2: $nodename:0: 'phy@2' does not match '^ethernet-phy(@[a-f0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@2: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
MAINTAINERS: Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250309172717.9067-6-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


