Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC23D374B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZB7CYIMrTPJpxPDZT6iWNpjR/IeD9DuD9obSxsJzvI=; b=tLLlFbDInb3wF9GhLajI9wB+rh
	JTqq1P+DpmsHoH//O77ZXFoJlLLR7JUbdx6MUkp2CtDt/t700eyaXg8r9aZgflmB2+CUW+TUMZyBn
	IeGELF5Kw+hl8A2T/2vVJQ2phYXHSkDf5cOFX8jDt0yCR3OuBYWTqwS8TYPQ2d3QGdwqKcz0v4EjD
	+FABIjTw0X4zhgXTZDbzt2NWYdXDS/2kmQmQBK7/GM+Tn0LoKjaumOB1Mp4IM+SBiAwhFRfgHyzqO
	GEEbqLGqIXiGPIycWqyc9f57enmhHkT9EjCvpw0qIPHyYOn/1FC3+GFFJrY7hoLGy8NgYtxORWk6O
	lawMPuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePy-0000000A9Tl-0tm4;
	Fri, 05 Dec 2025 22:36:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePv-0000000A9Qv-3Iqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77F9C43DA2;
	Fri,  5 Dec 2025 22:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352C8C4CEF1;
	Fri,  5 Dec 2025 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974207;
	bh=a+i6OuMIceb2KmmLexgRXeIiGsHIMcZGP0HUwSar5+U=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=M4zQviDM94cwfYTDIH84VqYAmVj0dqH0Tk/7q54eVs17XLFKBu0T7B5q5YuhobEmB
	 hK1PEvvEroUi5XELMncX3pmEso7mVWTfkJBrQT2EYpkYwuUvhYmsz9WK294W1rGCuf
	 EYWznZ7HduZdpML6Q9dCylQGrRGYRNxSESl0qxi/aipNWSoGfdC29HlZXiEUXost5Y
	 /swkuERMh3CQO4L3iwT+ZV55vBa9OjS6/JozBH7oM7r4+oMJSBBNbJnZXeCgZppeJr
	 wUpOdRAWO5GQWlr0jUn1zISlX3L6Ba73qmGpV0s23INhHhLNuhXxWnw5vEJPBgG0uM
	 Z+MyP2N8q9IyA==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linus.walleij@linaro.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 arnd@arndb.de, devicetree@vger.kernel.org, stable@vger.kernel.org, 
 krzk+dt@kernel.org, jserv@ccns.ncku.edu.tw
To: Kuan-Wei Chiu <visitorckw@gmail.com>
In-Reply-To: <20251204164228.113587-1-visitorckw@gmail.com>
References: <20251204164228.113587-1-visitorckw@gmail.com>
Message-Id: <176497381720.863571.13455719382013086980.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: integrator: Fix DMA ranges mismatch warning
 on IM-PD1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_143647_868695_F9E64227 
X-CRM114-Status: GOOD (  17.37  )
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


On Thu, 04 Dec 2025 16:42:28 +0000, Kuan-Wei Chiu wrote:
> When compiling the device tree for the Integrator/AP with IM-PD1, the
> following warning is observed regarding the display controller node:
> 
> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning
> (dma_ranges_format):
> /bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty
> "dma-ranges" property but its #address-cells (2) differs from
> /bus@c0000000/bus@c0000000 (1)
> 
> The display node specifies an empty "dma-ranges" property, intended to
> describe a 1:1 identity mapping. However, the node lacks explicit
> "#address-cells" and "#size-cells" properties. In this case, the device
> tree compiler defaults the address cells to 2 (64-bit), which conflicts
> with the parent bus configuration (32-bit, 1 cell).
> 
> Fix this by explicitly defining "#address-cells" and "#size-cells" as
> 1. This matches the 32-bit architecture of the Integrator platform and
> ensures the address translation range is correctly parsed by the
> compiler.
> 
> Fixes: 7bea67a99430 ("ARM: dts: integrator: Fix DMA ranges")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  arch/arm/boot/dts/arm/integratorap-im-pd1.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc6-2004-g29bce9c8b41d (exact match)
 Base: tags/v6.18-rc6-2004-g29bce9c8b41d (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/arm/' for 20251204164228.113587-1-visitorckw@gmail.com:

arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): '#address-cells', '#size-cells', 'dma-ranges', 'port@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml






