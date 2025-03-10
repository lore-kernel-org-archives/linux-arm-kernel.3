Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBACC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+18SRPMXTHEGVTw7LXJnbiMrmO1TfAf2bnPhjnkOZug=; b=r982z1QleP+Vs0LSmoI7kZ1l+/
	gzOEZR38+igg6FVenkRThSefWMgAuM0DDP9iSDcd+aTKSk51XnR8mxvBoRgiG/osPPLkAeO2tyfr0
	vznrNwVtsHVRlYeru2tXDVpgi8eRmqKmIcVAwQ01o7bkRPGb/wYVA6yHhvMS0+A650kEFWv7MMpwR
	gABW9rI5B3uiNmNu03MgZcLN2gZBia58rLSxm0rwMCiIwpmrAZH3W7HK9AdNfLnda4ff7vTrmLrxB
	l1PwWB4bGRImaXnJ3CqxswudtGlSc7uHsKMkV4q0wqfiCWYoy2HuDzuGI21MixwUFV4H7NppnaZdp
	75mZabgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trY5j-00000001pxU-3Eyv;
	Mon, 10 Mar 2025 08:02:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trY44-00000001pkY-3srq;
	Mon, 10 Mar 2025 08:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2324D5C420D;
	Mon, 10 Mar 2025 07:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8967C4CEE5;
	Mon, 10 Mar 2025 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741593643;
	bh=5pb18jHnC9oIYuysg+/rVDZqxx+VuW6N1Fk5JOZi52Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LuCX5OSxtvek+3jpeLGGivDX9bH5syZEQoh3fo7lIu2tSrUfzV1OSaBB+3YTJxt0i
	 XruzWeoeQam7CCtEEnyjDL4Ygz3VqYrPrJiJ7Np0TGF/EGCnkyUQoLY3X3JadalAy1
	 rOP/GHb6ALOJNzOOgNcC2cA3GUjWfSlDV4MGx4CpH+jBP+PdzHcGs57g/l9kxSK2k5
	 lFbrR25L7gee4y5RYyw8vmQVUSZhLdCxwn14Czzkfv2pobA9Lx7Bw12DUL0itcAoV9
	 pS2rWV4p74DN6Pe06y/fJw0WvemJiOBhpYR7o4y5zp8LpI8OvLCZZubb88iFxqeYVE
	 yukd9Ws74Pg3g==
Date: Mon, 10 Mar 2025 09:00:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 04/13] dt-bindings: soc: airoha: add Documentation for
 Airoha AN7581 SCU SSR
Message-ID: <20250310-aromatic-chihuahua-of-priority-4ee73b@krzk-bin>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_010045_077134_C9756C95 
X-CRM114-Status: GOOD (  23.18  )
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

On Sun, Mar 09, 2025 at 02:29:35PM +0100, Christian Marangi wrote:
> The Airoha AN7581 SoC have in the SCU register space particular
> address that control how some peripheral are configured.
> 
> These are toggeled in the System Status Register and are used to
> toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
> or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).
> 
> Modes are mutually exclusive and selecting one mode cause the
> other feature to not work (example a mode in USB 3.0 cause PCIe
> port 2 to not work) This depends also on what is physically
> connected to the Hardware and needs to correctly reflect the
> System Status Register bits.
> 
> Special care is needed for PCIe port 0 in 2 line mode that
> requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
> mode.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../soc/airoha/airoha,an7581-scu-ssr.yaml     | 106 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> new file mode 100644
> index 000000000000..4bbf6e3b79a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/airoha/airoha,an7581-scu-ssr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SCU System Status Register
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7581 SoC have in the SCU register space particular
> +  address that control how some peripheral are configured.
> +
> +  These are toggeled in the System Status Register and are used to
> +  toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
> +  or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).

typo, Ethernet

> +
> +  Modes are mutually exclusive and selecting one mode cause the
> +  other feature to not work (example a mode in USB 3.0 cause PCIe
> +  port 2 to not work) This depends also on what is physically
> +  connected to the Hardware and needs to correctly reflect the
> +  System Status Register bits.
> +
> +  Special care is needed for PCIe port 0 in 2 line mode that
> +  requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
> +  mode.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-scu-ssr

That's not a separate device, but part of the SCU.

But more important - such definition of choice of serial engines is
really not flexible, not reabable and not helping integrating into DTS.
Are you going to grow this for next chip airoha,serdes-wifi20, then
airoha,serdes-wifi21, 22... ? And then how the if:then: would look like?

Assuming you do not have here child-parent relationship, like usually
for serial engines, so then this should be somehow list of devices
(strings) you want to run.

Best regards,
Krzysztof


