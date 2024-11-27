Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D63D6ACE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObEAKTDZmUedWJ+dNRvk/Q4VebIa7Xuf87r5KsdA+uo=; b=n6/TJd0hMA/wAx+upfCzjNgeMx
	hMVyQgPFjvSCw9jdCJRrYartNbdByDu8Wnl9WTMpEWJaqXbow2+nvJUs7yJu6W51VKZqijGe/dlX1
	tgA6UDWC2rJ2BePbI2WhybguI2ejgV92lmgvm+J3AuilhKW3YQSJEeY475NL5wuUPgRo7+NxvEKDe
	n/GbhK/6AQH1MsfZSJig7kSoZDeU2AMetVQ2OU4nGpxswyTQh44tiO+gA9wFCMlpL5M5W3LocBP7b
	ilV3Yft7IBYolwpq8MbchrKiSTuNlOQGS68oLA7mY0Pbept71IWwIp3AgcXj73lCdRs3bPja44cqV
	0Mivw60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJHG-0000000DOyr-20St;
	Wed, 27 Nov 2024 14:44:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJGH-0000000DOo8-2AHg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 208D85C5C66;
	Wed, 27 Nov 2024 14:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CC7C4CED2;
	Wed, 27 Nov 2024 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732718604;
	bh=XHWAmWVGdvPSI+4U+sDv7f5UDi0JdephXUkR8n9wRiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyYlY9tYSOHhCWuC5K4ImBvKCQ81XUWA2iczhn7TbOMzKZ8VvZJt7W5NYQ2+qa32E
	 pj+hJD6IdyxuXBr47GpxUMTGDgJgna60SaEe09D9qzOlkpYNr6t0e3IK7WmzItGU/Z
	 w3xrwq0m3SrxfWJ3uH9EWAgzxtuf3KmVxihQ3ZYSGIVASZ3/EZA0UNuwJ4hKDAsbrN
	 hQ/5hrNK7wzBJyatOtywdc9MplvI70zECRxGLb3GoOdRdYkBUBYVc3hqZzePCxXAbJ
	 dyGcCrcpjhSyesv/niPTiGXh7PcfmlOAtfVYUEgE3nZal+lt3KOkDwGNXJyi1/1wFa
	 tPa5UAWsObtGQ==
Date: Wed, 27 Nov 2024 08:43:22 -0600
From: Rob Herring <robh@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241127144322.GA3454134-robh@kernel.org>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_064325_644238_E326886C 
X-CRM114-Status: GOOD (  23.68  )
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

On Tue, Nov 26, 2024 at 01:49:37PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
> 
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..89414a0d926c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +description:
> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
> +  It is not kept alive during system reset and it is not battery-powered.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ipg clock drives the access to the RTC iomapped registers
> +      - description: Clock source for the RTC module. Can be selected between
> +          4 different clock sources using an integrated hardware mux.
> +          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
> +          available during standby and runtime. 'source1' is reserved and cannot
> +          be used. 'source2' is the FIRC clock and it is only available during
> +          runtime providing a better resolution (~48MHz). 'source3' is an external
> +          RTC clock source which can be additionally added in hardware.

Is switching the clock source at run-time possible? For example, use the 
48MHz at runtime and switch to 32kHz or external clock during suspend. 
If so, you need to list all possible clock sources. Really, you probably 
should no matter what as you need to describe what's in the h/w, not 
configuration (though configuration is okay when it's fixed for the 
device).

> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - enum: [ source0, source1, source2, source3 ]

You can do:

maxItems: 5
items:
  - const: ipg
additionalItems:
  pattern: '^source[0-4]$'

Though I will have to relax constraints on 'additionalItems' to avoid a 
warning.

Rob

