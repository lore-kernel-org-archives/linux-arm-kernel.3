Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBF4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU7P2fdQo33lU9CWhezw41R+YVngVYZZxsfcPjczaD8=; b=LQ/qLq0GNMeFk/2gZanZVZ1h9Q
	y0yyaKXyq4veYM71eKYeqeJ03HlCNFCNMKDPLhUKKGrNAu7158GRf0WOAOEXSJ5jNFn/HOAfo7WIr
	N7Fdwk5qc2qpWoBgOLX6pTIqu1FTUiGZ8bXe8adpL+sLZQ2Lzye5A7WDxhs43xHeHnVhgwOjnpG7Y
	p6VCiWUXcmzCDddOkNW+zowHTFA9NzoI4EOOMW76EOSDQKlUrZb+Fpo5mT01BT/3Obbv8c5m9o+ow
	TWrmrOesKU7WuJy5QYV2nECPlkCsgsPtiMScZJktTEtIJnGsmyoeh78kt/3HbpNj/mgWVg6QBDA+G
	4plRpUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98mc-00000002v1s-0XyK;
	Wed, 15 Oct 2025 21:11:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98mZ-00000002v1P-3DXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lU7P2fdQo33lU9CWhezw41R+YVngVYZZxsfcPjczaD8=; b=II9+KuIHljJ6JNDxMUJKU01/u3
	uxihvz7A22UHG+HrN8nFhiN08qiIE2YtWRxywh6a75ozBXd4Vw3LIgxhASL1ia9K6gG/GS+vhow8h
	RK362b8jZiT2G1M5x86ohZlL4jW0+caGkcN9BbcCHHUEZIAzIc5392OGlZ1ytEfoTDJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98mI-00B4sb-D1; Wed, 15 Oct 2025 23:11:22 +0200
Date: Wed, 15 Oct 2025 23:11:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 13/14] net: stmmac: provide PCS initialisation
 hook
Message-ID: <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_141139_824330_5BCCDD9B 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

> +	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
> +	 * perversely returning -EINVAL) is non-fatal.
> +	 */
> +	ret = stmmac_mac_pcs_init(priv);
> +	if (ret != -EINVAL)
> +		return ret;

Oh, that's ugly.

Looking back at

commit 42de047d60bc5d87e369c36115058b9dacc5683c
Author: Jose Abreu <Jose.Abreu@synopsys.com>
Date:   Mon Apr 16 16:08:12 2018 +0100

    net: stmmac: Switch stmmac_desc_ops to generic HW Interface Helpers

which added this, i don't actually see a user of the returned EINVAL.
EOPNOTSUPP would of been better. But changing it now will need quite a
bit of review work :-(

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

