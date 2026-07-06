Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2191C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyC6uLd4SG/eFVU0+S/jOwpK4vgRdKg92Yml7ndQ0uQ=; b=f5C2/zpirCy03vS0tWMq9cIjL1
	8ckrwavR4M/896oGtxlde1uuraO6RcEBB1NdPnnmwTK85emYLP0KvQrVGa7OcizBTbBndu86lUaUg
	TRFl0R/nDqPfFzlR7T2/f+u4slKnCk/dvlkIa3Zt2mZ6B/ZVS9JH81L9hL0tuIbZFFqXh3D4gd5qx
	4P94f741KVkbtzLF9BboaOgiCqEvvi1mPgBG/0FfEUJmJPD0MQvcX9qVUeGuGTaLiIWwYAfpnpuCV
	/dfqwq6HiVCEUFPYAn8vcOoPB/hozJNMlJpYa/pVyZkrySysk+DiDPipdX1cgxt+TknpbtqCqadvU
	bLOz3QmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd8B-0000000BegP-2qM1;
	Mon, 06 Jul 2026 06:48:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd8A-0000000BegJ-2ByB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:48:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C116E61383;
	Mon,  6 Jul 2026 06:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5F31F000E9;
	Mon,  6 Jul 2026 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320517;
	bh=FyC6uLd4SG/eFVU0+S/jOwpK4vgRdKg92Yml7ndQ0uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aNpwPhaQw9RIwCkkdYM+Niad6l8inxvBTg0uE6F6r3bChE4b981OUFGWu1hzEQi4D
	 QtjyaZ0fsHh8nyTQd0PBJTpZa9R57N7+sV0jGHJTosRn+vuYgLLhF7jDDyCi5YrmYw
	 QAwj9EupMCxF4iKQxwo4eEmOSHweRJkgbmt0XHpZB4UvlTEFv7WvJWRCP/WtV/s0gu
	 m/5p0g9xtzBXKcpMnrMhT/IhJC4OOMgSSvBfdaNm6RDmZrZ/pnYyqTt2gY7+gRghSN
	 Zgo+d6oli8+2zZuQsiQ1QZ9M87MezP1ngGMO1lGmTvuTM51nlx+IVB4UUwYIjCRwYR
	 Fi0hf5vrgKTWw==
Date: Mon, 6 Jul 2026 08:48:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20260706-piquant-arboreal-panda-b810f2@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>
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

On Fri, Jul 03, 2026 at 03:30:11PM +0200, Paul Louvel wrote:
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..1af99339ff40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,mpc8323-qe-pario-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8360-qe-pario-bank
> +              - fsl,mpc8569-qe-pario-bank

None of these were in the old binding. You need to mention and
explain (WHY) the changes you are doing to the binding during the
conversion.

> +          - const: fsl,mpc8323-qe-pario-bank
> +      - const: fsl,mpc8323-qe-pario-bank

Best regards,
Krzysztof


