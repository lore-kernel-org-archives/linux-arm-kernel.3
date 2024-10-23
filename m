Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67087D2E029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4fse5uVjkXSRlm9twrxt5BDX3ptBzbtir4fG7Pw4Tk=; b=odN245lS5yYopVoxMWco+isUDT
	kSy/bsn4xX9NAD6m//y9F6T89ze9mjtJ/4oLy7THeVha+WX8flrbyMRAlNwykSEIIGHLw0rE5xkyC
	4Ca3X+QjiUhZqaMvy0f6LmKqvkXULc8wssyJTKy4h2blSqXT7masoPybxDr0zMCTi0zk3KUV6J0qj
	OjGg48q9L+6rpwdmD+AJsCrRocXauq7Vo7QOJsjAjPOX6Bug5Xlr7zRneXPpfkc+jvHVMnsejiA5S
	PZTSZ4SyZ7+detuHd42zFoXCaOsTO2o3vzqfJjX12dsFzZS9slHZB1ff+pMuwl9oc0zEQTNvT5N3p
	s85HPMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XFN-0000000DgbK-1rxD;
	Wed, 23 Oct 2024 09:01:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X3u-0000000DdSP-00Ji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D475B5C5EDE;
	Wed, 23 Oct 2024 08:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F54C4CEC6;
	Wed, 23 Oct 2024 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673389;
	bh=lgGbkc6uaJYpUzsc1Gh3kVF2XFhM1rzwAZjnJSwPphI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rN6WKyaA6gR0etHHoxMHugUoM5I4bhZAvWw0Ih5lCiYC9+06idpzCaGNDt9NvmdZi
	 Q19ul2J0lVL4ndKksr0hM2KOnjWV8LhUyDO5LRUIlfmS2iDUhzrf7cjOqubyJ1eHA2
	 8EsC5ZBfdj8hChTqynVuEK8Ee57NxEc5PgM/ZacW9RvRXX83tIOLW1SoOGCK1Ip7qU
	 25QoQhymEmjdUcY8Nvwr5t7g5mWV2QpwMvpcO16SqPmBwDZ/3X8Oa/rH3DR23eTbQb
	 n+RINzAmQv5SOWrdMC8yUxe2O1zKphVfJDfQaH2jDrLaEmmj2HUrjJSjJvnHkhjw5a
	 Ho9lsRDUwqTvA==
Date: Wed, 23 Oct 2024 10:49:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
Message-ID: <e6sz7p4lgkmuvgosafob5dvwtvp4ruzuzmwz4oyepcajfui2xm@fom7mj5fbik6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014950_149458_D6F3A73A 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Oct 22, 2024 at 05:56:51PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming

Why? What is missing for existing hardware support?

> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 5d17d6487ae9c..9a7ecfea6eb5b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -207,6 +207,54 @@ patternProperties:
>                3: High speed
>              $ref: /schemas/types.yaml#/definitions/uint32
>              enum: [0, 1, 2, 3]
> +          st,io-delay-path:
> +            description: |
> +              IO synchronization delay path location
> +              0: Delay switched into the output path
> +              1: Delay switched into the input path
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Why enum? Why not bool? What is the "synchronization delay"? Why this is
needed per board?

> +          st,io-clk-edge:
> +            description: |
> +              IO synchronization clock edge
> +              0: Data single-edge (changing on rising or falling clock edge)
> +              1: Data double-edge (changing on both clock edges)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

All the same questions.

> +          st,io-clk-type:
> +            description: |
> +              IO synchronization clock inversion
> +              0: IO clocks not inverted. Data retimed to rising clock edge
> +              1: IO clocks inverted. Data retimed to falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

OK, so if not bool why this cannot be a readable string?

> +          st,io-retime:
> +            description: |
> +              IO synchronization data retime
> +              0: Data not synchronized or retimed on clock edges
> +              1: Data retimed to either rising or falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Missing blank lines everywhere between properties.

> +          st,io-delay:

Use proper unit suffix. Or is there no such?

Best regards,
Krzysztof


