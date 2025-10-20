Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0771CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UtO/Ve7QiGpMlUuu0IVSIrQoQ/KH9yo8ixVSg0L1bc=; b=OFoeC2ZOwigtT3McTaUnbzBDnl
	l6JvpRYz5f18UgKXo0CHUo9T9Fc/P3kZSVqyn211mMCVaIS9I9ssI/s207M2EGwm5ZhBQx/8SsmZ7
	UW6MXeVW7EcQS4rj2Hi77yuq2BOjNBXkZ/nGfbPyyN+TyRxgh1kbC6Ie6pdog6dn654iq7+MucSIg
	Obg/X6tbR+Bp7G61U6uxKEcyYnhBpvPLns9ftjxKZXv5NgAUMONIZO08fx0hDN4tIKB35BCeSRXGv
	Ba5MXTFyZZH3MsVVFOKiXH/cBoxPZle2uiQOafPXHTcsz+GR0WlffNv3+MpTFqLsLbRxHNyyoK8h7
	M7T9818w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoAd-0000000D5TS-2ylE;
	Mon, 20 Oct 2025 11:35:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoAb-0000000D5SK-314U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 373E1489C1;
	Mon, 20 Oct 2025 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A9DC4CEF9;
	Mon, 20 Oct 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760960120;
	bh=ZioengeclCBPyaIw8m5VBq2tqjHhRbeGcSeZSVPGoOk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MfN84N3FvlrHrKO6hwp0uof+Ta7bEnnpHDT3YaLa+WZMR3CMdo0kZHWC3c1U6E2pF
	 J5umlW8m4tmUBXWCdMwHbR4/0xVpTKgZPBLKDvRhZKJDxJztlux+q0MDAfDEkL6tk4
	 8OYnemTQgRJ0/6UVcCgGgfTHTwvb9712A6SjcKvzTp9OqaiU46BCKQI2Ydk8t6rmO0
	 EPlKRiwgd6lPVQLKfkryxc/KWv8F9NGbZx7wNrM1RS06vHJfcAyHaIhAQpol9wOgAt
	 CEIBujREfOOxhdxe8FDc9qugI9RYC1kUt+djUMqMw1/KQ0j89XW7VWnow0FdMexgWY
	 J7M8KbhYwuI/g==
Date: Mon, 20 Oct 2025 06:35:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, conor+dt@kernel.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, krzk+dt@kernel.org, 
 andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
 benh@kernel.crashing.org, devicetree@vger.kernel.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
References: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
 <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
Message-Id: <176096011475.23064.13799548826512417145.robh@kernel.org>
Subject: Re: [PATCH v19 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_043521_803949_FA8416C5 
X-CRM114-Status: GOOD (  15.50  )
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


On Mon, 20 Oct 2025 09:31:57 +0800, Ryan Chen wrote:
> The AST2600 I2C controller is a new hardware design compared to the
> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
> 
> It introduces new features such as:
>  - A redesigned register layout
>  - Separation between controller and target mode registers
>  - Transfer mode selection (byte, buffer, DMA)
>  - Support for a shared global register block for configuration
> 
> Due to these fundamental differences, maintaining a separate
> devicetree binding file for AST2600 helps to clearly distinguish
> the hardware capabilities and configuration options from the older
> controllers.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 67 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: properties:reg: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'address offset and range of bus'}, {'description': 'address offset and range of bus buffer'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
Documentation/devicetree/bindings/i2c/ast2600-i2c.example.dtb: /example-0/i2c@40: failed to match any schema with compatible: ['aspeed,ast2600-i2c-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251020013200.1858325-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


