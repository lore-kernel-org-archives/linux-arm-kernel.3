Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4F7CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06dhcOjk7xtKnoaCq/pBsM3+GvkIYSpvDs3WRK86UCo=; b=o2QT6iMgzRHPUKgavMCNLfaPM7
	hncDedU5zT6RKrCbTwfQAm1oq0CY4QGDHptdKpLce5ki6O31BPWP9EBrEDTm3pbvHrxm9a/+ZHR9Y
	afFHY3CMdeO9/JO5KEAcbfAFy+ANNoTuBlbinB1drn2k/wjJRXHcJ/tKLSOWxZyKcohyq6geAGi2w
	heo6iLu06GiX1ZWmGku9ECr458oBa8/1H6fZc7k9O4PRnMSViv7fHqaA/BLt15bpNSg1H5ZjftFcZ
	Bj6KUI9LJnqu2cX17AIyStfiVALp2ptreoydSO+IZ+YQ2dP9j7o/Xp5TQZEsVk4h83aUuyM8uP3BG
	Z67ZLUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPh-00000001aqc-0W6i;
	Fri, 22 Aug 2025 05:34:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwv-00000000pG1-17Qb;
	Thu, 21 Aug 2025 22:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=06dhcOjk7xtKnoaCq/pBsM3+GvkIYSpvDs3WRK86UCo=; b=fWq5TP9uMm11xXNKvmJPjWe1KQ
	HJpTXpRHqZzs/UTiiJN9cNXHGORomjuaDcLi5z72ostVzaH5EAQYGptp3MHL+irU2EqNj01ZQ3umP
	IJN26Knf9tx7vVmEywI8oOHqSqWSKiT/mEoM5q3WXijJGOfLyMyMGy/0y3hXHi1eyo+27PtyUdpd8
	5nC6rbtaofdv2wpZWnQZPXS4VOrLl18VFx3ttikpNu/P/5SpYbmRbGbCirDsED5F1ORkavGmNj56W
	KzbY1rp5MGbW3cX9n2+PZ6rlkjTRnJL3cN1LZvEWGsXS1X0iojulptTPXeId1DDy17jNnt+0tF5pE
	kIRfEsCw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwr-00000000h1j-08xS;
	Thu, 21 Aug 2025 22:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 821F4A5873C;
	Thu, 21 Aug 2025 22:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1335BC4CEEB;
	Thu, 21 Aug 2025 22:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755815993;
	bh=GD7PJkZToLyN/G6cbgeaBFRiaVPlRrInWRqkwNMGA5A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Yb3myAfSJfILtlMiaszHClJxxkXZ/Ultvs3mR7J9CqIP/z5wf+Q+VV8xV2mB7QtYa
	 lKxj+Ia0ox6sV6AkZ/SbA01BNTer2ER7hqcDX59Q8seqkSdHjCZYbX0nqWBXop1sbH
	 /lo4hRoYzz7p9JTJVxVKAwJPAOWmKwWhGRWXNXXltewAGNs1itzUmdsGjOYs2siaX/
	 DjbILz797hYqIg1DwLGJbzagSL82A2zGYPk706ZxQUmXoaR+NRAejIpSe05ZCQQUQO
	 j6bBRkdHutGkLdqHnFrz0/ln2tLn9tTc4xP5ntfuKxZ2/wyiZu7J4jCAIf4pVHLa6j
	 NSpF0t2DgaXjg==
Date: Thu, 21 Aug 2025 17:39:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Janne Grunau <j@jannau.net>, Felipe Balbi <balbi@kernel.org>, 
 linux-usb@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, asahi@lists.linux.dev
To: Sven Peter <sven@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org>
Message-Id: <175581575975.1136737.15772006298653971684.robh@kernel.org>
Subject: Re: [PATCH RFC 03/22] dt-bindings: phy: Add Apple Type-C PHY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_233957_393392_25129FA5 
X-CRM114-Status: GOOD (  12.30  )
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


On Thu, 21 Aug 2025 15:38:55 +0000, Sven Peter wrote:
> Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
> SoCs.
> 
> The PHY handles muxing between these different protocols and also provides
> the reset controller for the attached dwc3 USB controller.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../devicetree/bindings/phy/apple,atcphy.yaml      | 210 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 211 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/apple,atcphy.yaml: properties:power-domains: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/power-domain.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/apple,atcphy.example.dtb: phy@383000000 (apple,t8103-atcphy): reg: [[3, 2197815296], [0, 311296], [3, 2198142976], [0, 32768], [3, 2147483648], [0, 16384], [3, 2192113664], [0, 16384], [3, 2192064512], [0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/apple,atcphy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


