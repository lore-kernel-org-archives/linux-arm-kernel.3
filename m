Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E16CCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMlJoJUN3z4TOoymhV2DtpiX1kn0KKwfF8qPS2pcmHU=; b=0CTqeZ9v7R0BkxWrIx/9OGCCc0
	GorbDE5dVbsDki12MgYH8QtSBfMvMV2sPUqN5Q6LsTmhUkukRApnCZZZCJjef0DDVFv1fXEetC1V1
	vnN6wNLWP4PmzTTGZj2Kd7sioW7yo0dcBeYOnIXg3j2IaunzkfSgv1CzYGuUGO57ZV0i0KTQZughk
	pNJgaIpGZNgJC+U4AQAJ3GvtokxpF/5AmEhvN8bK39Rm7weL44ChZDAP3cb3fXdtOLTWqX7a4eXkU
	V4S5/5DyNx5nCPZ4ei2k4pv+SCkgHlBq/huvtI4ehAd4cG13c0OeoHt/K6XABVr5NN4B/2d+6bnSn
	7tpmw7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDj0-0000000EFfT-3WPy;
	Wed, 13 Aug 2025 15:49:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDAg-0000000E8jg-0m8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LMlJoJUN3z4TOoymhV2DtpiX1kn0KKwfF8qPS2pcmHU=; b=L6UQnLWYrMlrHVT3n8xXDG3ugN
	clQ5In+uwWVsNFgc44r3T6JBSoeithf5pdO5bYJGi1SNHXSa859qL48xo4P+WGC8oTKTZ+S1cKZsx
	R0s06h2ClWJrEkADXDVw+O2g2EWybz1HUf/XWR0qkCz4qX1VsC0OJw6rYh1bZqibWYazJDjG+7yYu
	WUm0nDmFWiDSLyB8XwL7NoKWhfKQ9yCfF9H9BFhfQDjb3A3kwqrChLNB6gvVDaTmQeVqzk4B1VoG/
	WVnrLBoGPUthcPiu19DKeUP9pZZmkJr71epoNgBMUw/1Rax1GMKOjyp5W5wnNFG/Kj5vZkAaJeMs5
	z2SpHfyA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umD8L-0006tD-0T;
	Wed, 13 Aug 2025 16:11:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umD8C-0005rA-2x;
	Wed, 13 Aug 2025 16:11:12 +0100
Date: Wed, 13 Aug 2025 16:11:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <aJyrECCOPTZP81Sx@shell.armlinux.org.uk>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813145540.2577789-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081346_221482_133D6D33 
X-CRM114-Status: GOOD (  14.99  )
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

Hi,

A few comments on this...

On Wed, Aug 13, 2025 at 10:55:32PM +0800, Chen-Yu Tsai wrote:
> +#include "stmmac.h"
> +#include "stmmac_platform.h"
> +
> +#define SYSCON_REG		0x34
> +
> +/* RMII specific bits */
> +#define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
> +/* Generic system control EMAC_CLK bits */
> +#define SYSCON_ETXDC_MASK		GENMASK(12, 10)
> +#define SYSCON_ERXDC_MASK		GENMASK(9, 5)
> +/* EMAC PHY Interface Type */
> +#define SYSCON_EPIT			BIT(2) /* 1: RGMII, 0: MII */
> +#define SYSCON_ETCS_MASK		GENMASK(1, 0)
> +#define SYSCON_ETCS_MII		0x0
> +#define SYSCON_ETCS_EXT_GMII	0x1
> +#define SYSCON_ETCS_INT_GMII	0x2
> +
> +#define MASK_TO_VAL(mask)   ((mask) >> (__builtin_ffsll(mask) - 1))

Is FIELD_GET() not sufficient?

> +
> +static int sun55i_gmac200_set_syscon(struct device *dev,
> +				     struct plat_stmmacenet_data *plat)
> +{
> +	struct device_node *node = dev->of_node;
> +	struct regmap *regmap;
> +	u32 val, reg = 0;
> +	int ret;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
> +
> +	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
> +		if (val % 100)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "tx-delay must be a multiple of 100\n");

	"tx-delay must be a multiple of 100ps\n"

would be a bit better.

> +		val /= 100;
> +		dev_dbg(dev, "set tx-delay to %x\n", val);
> +		if (val > MASK_TO_VAL(SYSCON_ETXDC_MASK))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid TX clock delay: %d\n",
> +					     val);

		if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
			return dev_err_probe(dev, -EINVAL,
					    "TX clock delay exceeds maximum (%d00ps > %d00ps)\n",
					    val, FIELD_MAX(SYSCON_ETXDC_MASK));

> +
> +		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
> +	}
> +
> +	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
> +		if (val % 100)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "rx-delay must be a multiple of 100\n");
> +		val /= 100;
> +		dev_dbg(dev, "set rx-delay to %x\n", val);
> +		if (val > MASK_TO_VAL(SYSCON_ERXDC_MASK))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid RX clock delay: %d\n",
> +					     val);

all the same points in this block.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

