Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8kMJ6I4YmQdQsrFI9Awn42ktKYfNkq/jPHULCPuHwY=; b=f8h6tT/pzm5hudfCzShffd/hYd
	/j65oymme92z65KymvmRbGvoni5bX+wBjI8bX7oeaR9Arh/LGF43vkmEaO1cERXdh/HwhgOtggelf
	Iu5tmneaUS46B4U9OVWCBobA94tvXpJzaJBdcJUfzm6yG61lVHbMKUbn8s1AjHzLSeQx7AvHny6ba
	/jSVgYvAaBAAMAGQt5pTgGqWpOowIfecigVGEwt6pMmuH9IDs4dPnXym/5AyxAIfdTgOwLhiJTw+7
	AOKNdyaRHhEdhXxqbQ/VYrXyQWPW64ktefjJQ6SmcUAQT++bJ5iMSU7EiYMY5SzxGNYtDI3+n7E3w
	b5EaNqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gv-00000009rLC-2gmb;
	Fri, 12 Sep 2025 14:23:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gt-00000009rJX-0tS0;
	Fri, 12 Sep 2025 14:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F4644D21;
	Fri, 12 Sep 2025 14:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABDFC4CEF1;
	Fri, 12 Sep 2025 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757687034;
	bh=Zzeb1xA15y7Nd5yeEIlwzepKZqZbRO8bXy7c3wtivpk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eN1uAaP2ISZdR+wzUrgH6fkCA1Rc+22UTI9Qi8awhRBkN+SC6s2gxcNujr0aMwvfL
	 ZYrSat9StKeVpa+M1dWYj2BuPoiXYf68dBmar+TOQKd+0/sL53ZifrOqSueOW4K8UD
	 aoG+eWvBQ+KQWq542E2ZFDN3PXgRNiDXb3zEf04qc0JTWb1+byDyWUmvtNduYVxsOn
	 GZfxkaxoH+ssE59hv0NhuDOyT0u/e5a44rrsU1swetAGqwK1+BUZ8CvR3Ph5bZQS6S
	 EDzp/Et3NNz2GG5mIUXGaE7aDnKi8TdfqzDks6JCBp+7BtzuzBRlorZdB4ltnebma5
	 pa3wZyCiBmG5w==
Date: Fri, 12 Sep 2025 09:23:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Russell King <linux@armlinux.org.uk>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Golle <daniel@makrotopia.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250911133929.30874-4-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
 <20250911133929.30874-4-ansuelsmth@gmail.com>
Message-Id: <175768614723.1333721.12484884958652765550.robh@kernel.org>
Subject: Re: [net-next PATCH v17 3/8] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072355_296324_EE5362B9 
X-CRM114-Status: GOOD (  13.59  )
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


On Thu, 11 Sep 2025 15:39:18 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/nvmem/airoha,an8855-efuse.yaml

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): efuse: {'compatible': ['airoha,an8855-efuse'], '#nvmem-cell-cells': 0, 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'shift-sel-port0-tx-a@c': {'reg': [[12, 4]], 'phandle': 3}, 'shift-sel-port0-tx-b@10': {'reg': [[16, 4]], 'phandle': 4}, 'shift-sel-port0-tx-c@14': {'reg': [[20, 4]], 'phandle': 5}, 'shift-sel-port0-tx-d@18': {'reg': [[24, 4]], 'phandle': 6}, 'shift-sel-port1-tx-a@1c': {'reg': [[28, 4]], 'phandle': 7}, 'shift-sel-port1-tx-b@20': {'reg': [[32, 4]], 'phandle': 8}, 'shift-sel-port1-tx-c@24': {'reg': [[36, 4]], 'phandle': 9}, 'shift-sel-port1-tx-d@28': {'reg': [[40, 4]], 'phandle': 10}}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/efuse: failed to match any schema with compatible: ['airoha,an8855-efuse']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250911133929.30874-4-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


