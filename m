Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B9C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWI8RI6FOSgBCCFO3J8+gcjsjkfFsZW4MgM69Rsgqqo=; b=rhNkmRlkPtPruj8sWh8q1HZ3GH
	Hwh2mwEVZyRS/I1AcIOSN4A/6eZ/3PVaiKoMygI9ClOA7QfX4NFKCQ31VXbQBxEJZj/KQS/ynJmyh
	8XvV8RkeemLIIbgs5rza+APPRuNvI1/iK9FosFYoX3GSgCncgip04GO56ESkWifqo9k3wEHOM/6AB
	NlrqojnS/OIGo7iMq/Hg9RTxobnqgQt1dohLqTAEz011jaH6Jil+Hd7gkYpVpz8UvaChsBM/WRAsD
	xHEcdo1YYNFoOlzaWDzKT7/p10XdGqa77qM8yU/FyeeepOGaAB+njrUlxcL7SCXL/jJMTUdU2B0sk
	Q/tFe+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxRH-00000005jZf-2JMk;
	Thu, 06 Feb 2025 08:40:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxPt-00000005jN6-3A9i;
	Thu, 06 Feb 2025 08:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10CB3A43E9B;
	Thu,  6 Feb 2025 08:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78557C4CEDD;
	Thu,  6 Feb 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738831160;
	bh=4EoQP8op2lAGcHar7BdkrcIMw40H7AoccbKxT2py+Qw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZREJ8x2zY6TIGZHCfl/84rBc0S2xinJlMJs2/w3GoQEOc8gA82c3EZaZA/1evU9Dw
	 SOEdkFtAWEQ+Pule34w3jSIfcjF/Q6U8Sl4THNRKWchC0T+7gTllGLGavdKOMYPnFV
	 dFETGh+TWLGqDKOn+UQ+gfsBACv+TAbbX6elvZCIrPm4zSrhjl5WlgrpRYneiX7ArY
	 sLH4awxLQr31h653xp03Vxh0ePK2IyGcruO/zYGGMQDLUU8TGuP5nDHe8Sy99nkZjc
	 gw7495UUpZsVzmLv8bz9eJaFihO1wlcvcqZ3yRpCu6Q2o9So3ObsZiJI0TbsCw/cxQ
	 bOfz0PQL1wEtQ==
Date: Thu, 06 Feb 2025 02:39:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, weilin.wang@intel.com, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 linux-riscv@lists.infradead.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Conor Dooley <conor@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Will Deacon <will@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 kvm-riscv@lists.infradead.org, Ian Rogers <irogers@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
 Ingo Molnar <mingo@redhat.com>
To: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-10-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-10-835cfa88e3b1@rivosinc.com>
Message-Id: <173883115938.126290.3444587267516997369.robh@kernel.org>
Subject: Re: [PATCH v4 10/21] dt-bindings: riscv: add Counter delegation
 ISA extensions description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_003921_918004_C358A72D 
X-CRM114-Status: GOOD (  10.83  )
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


On Wed, 05 Feb 2025 23:23:15 -0800, Atish Patra wrote:
> Add description for the Smcdeleg/Ssccfg extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions:allOf:4: 'if' is a dependency of 'then'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions:allOf:4: 'anyOf' conditional failed, one must be fixed:
	'If' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions:allOf:5: 'if' is a dependency of 'then'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions:allOf:5: 'anyOf' conditional failed, one must be fixed:
	'If' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250205-counter_delegation-v4-10-835cfa88e3b1@rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


