Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B812CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLNJNXAhbpZp8f92ANlBR1Z3x7HxYh/GbYA3fzeJAq8=; b=JD1VvpRLTdFIlAa8GA3x5JutxM
	TiuCQXqN9PrOImk3/BzxafWNuk1LpiFTUWPdMJzg2KvzJ6nKBJ+BHUlhuEzVpuER/QBTtAG7Z8NIk
	dL7ak9Ub11qPpeuocGRdjMMtuYh6wa2zos7NfZu5CTZbVxxm7aXPzehMmF5MvGTfM4p9r7gtP1SO6
	+o9FGMiLovnQtEd7jMpi+rlKVwZ15bguurNusYzVFsJxkXW1GMhPa5aIQlZ6Qe0wwiKNuGmDjIUMY
	XAe1YimTp+tGeA55kVgxsmB6wvaqlvGjx+R0RLxvLzj/N8Gr95Bognlxqb8ksH3JhxjYK0ngQ96vl
	4XYkOxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcix-000000038jQ-3hGI;
	Wed, 03 Sep 2025 01:55:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYUu-000000026if-3VRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 21:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C7D441F1;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772A0C4CEED;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848299;
	bh=pIkxlL/RsKrNHjL9bzr/Ff/bVEvw0mwr+CfKjwjIOWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+keo995h383ZM6+v2G9KoeMPR42keu0j33nhQxYc6hfkUa2nW0X1VT4IikS1jlju
	 7BpXG4Tr+rbHR9sLEMO6qebGvsnUgQALfJ6iuUQLYwdm/TsGaL6hhJphBF5jk3cPFs
	 pmH9ySG+xHDliQ0PVjLWLx3URJVjO8AuyvndLsSqL40j750mGjHLoRYacugUjGiPSe
	 KrQQXllhd8pbTgz09P95VO70njQKboE5y8wbztLV+yerxWcae9AtTJYPPM0v0CnnYY
	 xTTqopJeLy+spwriyMqSMLmU67yEsqcWHy517VjzNj5OlTBErvr8WGdQmucpEQApWr
	 gGia+LdgY2fuA==
Date: Tue, 2 Sep 2025 16:24:58 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250902212458.GA1184537-robh@kernel.org>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_142500_923256_65104222 
X-CRM114-Status: GOOD (  17.14  )
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

On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v5: New
> ---
>  .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 53 +++++++++++++++++++

This should move to bindings/gpio/

>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +--------
>  2 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..e6ba319a75c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +description:
> +  Bindings for the Freescale QUICC Engine Parallel I/O (PARIO) GPIO controller.

Just drop if nothing more to say than 'title'.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank
> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +    description: Offset to the register set and its length.

Drop the description. That's every reg.

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qe_pio_a: gpio-controller@1400 {

Drop unused labels.

> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";

Doesn't match the schema. 

> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    qe_pio_e: gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

