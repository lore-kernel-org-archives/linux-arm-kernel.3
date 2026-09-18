Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E156C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xKONjRtCurc8WbnVsXxctUnGulmYkSraLp8ZuykmOI=; b=fFWf9kkSGcQyCE0Y2xpGQoLMXF
	uVBC4OpVL9kX5nlNlGMHk0GciBFs9R3tgyFb/TArNlAGzDnLI9jl58qroiPNBzTOEiNcYs+HwS98c
	b5nfwitugp0jU44ZVn+/oaQq5ejTIE3jL8FwPPnr14ILnRJbBwziErXMeN5fDGYfXbzeMEuhyVsJ/
	TIV/UjS1QtkFnRpYeMySlIVY1F1eyum1sQNrEgoQKIvLUSBCdY6RwoGxrSP/8VeeyWLJfS1DZGrml
	vuMSaicz/xs1ebrvlTwYish8hAaDAGuxPAwf2q4sve3Ta2LZGEOPdSpTLJsf42AQ4LFQVrJ8LsVP6
	Qa2scwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eXR-0000000FRMN-256L;
	Fri, 18 Sep 2026 19:46:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eXQ-0000000FRM7-2CjJ;
	Fri, 18 Sep 2026 19:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D52F602CC;
	Fri, 18 Sep 2026 19:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136491F000FF;
	Fri, 18 Sep 2026 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789760783;
	bh=0xKONjRtCurc8WbnVsXxctUnGulmYkSraLp8ZuykmOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lCgqvQSgcziEjU4PZtqtEprTy6iKuFyOEE9BW3tqy44D9VL04HVsRwqvwKmKyGPZE
	 NwXHSur8WSM1IPdNOmQP+APLeUJ1RgNieNoT1ANmj/YhATUjVAcPfRgrYZM7TZM+N+
	 bMcfMFu0SMYn3hjJ7O9KN5RVCaf7IcpOhjjBsP+dzV3ywNB7ghaQOrg8gutdNiu1k0
	 3CNauiux7L+ru4TiIBlqXV3+OrXmwOHNXonb0u4a1KKeHVKyatPX6HGHjJif/WeWei
	 deOCnWZK7ivR8UQYr8Q9r/ovO/8j6VpqEaUN+qwysGhODUQPRDPqCsR7gIx3J3phz2
	 s2ZawkkrqOC2g==
Date: Fri, 18 Sep 2026 14:46:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ricardo Pardini <ricardo@pardini.net>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, nic_swsd@realtek.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: net: add Realtek RTL8125 PCIe
 Ethernet
Message-ID: <178976078089.1640411.4176382061491076376.robh@kernel.org>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-1-c1b9e5f10cd6@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-1-c1b9e5f10cd6@pardini.net>
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


On Thu, 10 Sep 2026 22:07:51 +0200, Ricardo Pardini wrote:
> Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
> controller. As a PCIe device, its "pci10ec,8125" compatible is the
> Open Firmware spelling auto-derived from its PCI-SIG vendor/device IDs
> and is already covered by the generic dtschema pci-device.yaml. The
> compatible itself therefore needs no binding to be valid.
> 
> A dedicated binding is needed because board DTs describe these
> soldered function nodes in order to attach ethernet-controller
> properties to them: a placeholder local-mac-address that the bootloader
> fills in today, and potentially nvmem-cells, phy-handle, etc. in the
> future. This binding references ethernet-controller.yaml so those
> properties are validated on the RTL8125 PCI function nodes.
> 
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>  .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


