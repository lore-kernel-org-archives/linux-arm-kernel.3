Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA0BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtGqgmwRkRP0KLGZ73qGIvxEcsWoL6s5n/OE13RgATQ=; b=eoBIHQUzFTUx0iTueZHi0CwjuZ
	OPix+RadcAQN9eADXF/gb85qcOzqTkzyyofBUcf6kubFKrzZwe4Cnrf2ORD4KrHEVbjfmQ5/4dIZj
	3mhGtu0pjkCb71XAXGuUR4iL+18UIyk/CTDWDkVFitfegYILMJnxMfneXbxbxtBbHJisZ7aCSSvZY
	/8nvWK/+Jn/RiAQjGLRZwSU9H13z6R6fZqK3jrf1t7fodCiDongC53aN4prCYjS5lKsVOy5nWtuTh
	367uibQMfiGvdVVIVZ1uLtRPc+zZt+ogid4sH6OgUtrg8D928mOX1HE2Plzl8ZtGu+Xr3uEwKYKMJ
	eOo+zWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqr6J-0000000Gxvu-28nM;
	Mon, 03 Aug 2026 11:44:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqr6H-0000000Gxvc-2oRC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98E9760A78;
	Mon,  3 Aug 2026 11:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662DE1F000E9;
	Mon,  3 Aug 2026 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785757496;
	bh=8YQ2M9Eps1JKx10yr4780R1ecWZB0HlgXUHXNalwtiM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=l3FjwlGIvY9J5WKcaj4U+GHHJ0vSTZaGjUixFKx7WZt0ScOo/BXhTkDF14UlaeWpc
	 GS+60FdPXJC2+HBGNfM815HDuGPwFTVT2ZMnIYj5Qqpp2feLlNTTkGKY1FDdZuu13N
	 9HEbTx8Hs8V2b68uOQF1IjA0Ra9kNb91CiPSQShAG+XdLbXXxvBJOq+KxVAT/IY/Fi
	 OCTiBlG1fa8naz1MYhSsv29Xqa60dU5Y7HgoD3PVylPvEz9cls3/EMcfStwYRpoee6
	 vmyofz453SgmnpYcoUGzSXmGhYs4tT/zboqO7Y/CymG1XWULb56CvCkZRsw3MdTHZy
	 RUiZFTLw6OXzw==
Date: Mon, 03 Aug 2026 06:44:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Ulf Hansson <ulfh@kernel.org>, 
 Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sre@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, Andre Draszik <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, John Stultz <john.stultz@linaro.org>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
Message-Id: <178575749351.2483197.6720070407824857023.robh@kernel.org>
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
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


On Mon, 03 Aug 2026 15:13:36 +0530, Shivendra Pratap wrote:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 58 +++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/psci.yaml: properties:reboot-mode:patternProperties:^mode-.*$: {'minItems': 1, 'maxItems': 3, 'items': [{'description': 'arg1 (vendor-specific SYSTEM_RESET2 reset_type)', 'allOf': [{'$ref': '/schemas/types.yaml#/definitions/uint32'}, {'minimum': 2147483648}]}, {'description': 'arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)', '$ref': '/schemas/types.yaml#/definitions/uint32'}, {'description': 'arg3 (cookie_lo in 3-cell form)', '$ref': '/schemas/types.yaml#/definitions/uint32'}], 'description': 'Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string\nafter "mode-" maps a reboot mode to a vendor-specific reset.\nA vendor-specific reset takes two arguments, a 32-bit reset_type and a\n64-bit cookie. The arguments are encoded as up to three 32-bit cells.\nEach mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,\nwhere:\n- arg1 is reset_type and must be >= 0x80000000.\n- In 2-cel
 l form, arg2 is lower 32 bits of cookie.\n- In 3-cell form, arg2 is high 32 bits of cookie\n  and arg3 is low 32 bits of cookie.\n\nAll values should be provided as per the PSCI SYSTEM_RESET2\nspecification.\n'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


