Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2ADC54799
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCAAbzuDu/XRR/Cr2/ZXfO3PjBkOsRVBjXrj1GCAeYY=; b=pmFL33DGeSDihDfEP961Vo81NN
	/JFAfT1ZIganuNmJ3OAoOQf1kTCAo94d2mLSKn1aFqn0tHyE+aszq7VN/Sk6GsVGi4zvZyEpwqDGA
	WKUI/rjYSOSxl5oEmCJSYvggIwEyqUYeIe5P9fMMC1yvqw4BORJpPNWr1ApEFNtKTjZDxvawr/7Nw
	xxJdbfCc5C81Hx2cc8gmfnMRFOeSZ1CTZG3rZqtKB1aEakYVP6+P8a4mDQgzs+acbRbnCYK7m1haW
	j2vyho5V33rWx5uidjJm3sxKph4AuSYZwQ7oJLonBSOyDxrG/VCjTduhgrYcC5ZlsTaQPFkOEdRqv
	MjRtSomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL3x-0000000CcQP-13rJ;
	Tue, 20 May 2025 11:23:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKu2-0000000CZ6F-30HJ;
	Tue, 20 May 2025 11:13:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AC705205CC;
	Tue, 20 May 2025 13:12:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5U3SwixaLVp; Tue, 20 May 2025 13:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747739574; bh=JcTfyPwYXtIxo4dejeRGS5+u2GxKMAhNdEA4FGFzwUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqyCp6GhIbD9XMbB1lXKSYY69m1pVEhPm6ROQyfPKndbz596lyhofxx6ae/3FrsCI
	 QuV0PC2cHTo53E8lJwRvUYimCZpWunCHe9P11+jRc6iIiWXrezyKE3o2H07m6t9lkh
	 1085BSRuYWOFyOIoWhTMkQrFD1//1USK2S7SMIUOgMa+wdED7TUkkauHZbhyT45zvW
	 8GcWcUirROwIyz4ki+tX2p3ArmX1ck2+chw/nAHJcqpYS+VS/ozrqja4kTJag06sU3
	 DFnQPst9wk7HN1bt+S0KOmP1cODUpMwfR7KZtQz5NxUzYFk4Oj3ANzd8lfqq7zAgkT
	 L4iT3KUIoCLgA==
Date: Tue, 20 May 2025 11:12:40 +0000
From: Yao Zi <ziyao@disroot.org>
To: "Diederik de Haas" <didi.debian@cknow.org>,
	"Vinod Koul" <vkoul@kernel.org>,
	"Kishon Vijay Abraham I" <kishon@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Frank Wang" <frank.wang@rock-chips.com>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	"Detlev Casanova" <detlev.casanova@collabora.com>,
	"Shresth Prasad" <shresthprasad7@gmail.com>,
	"Chukun Pan" <amadeus@jmu.edu.cn>,
	"Jonas Karlman" <jonas@kwiboo.se>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
Message-ID: <aCxjqDr3VivDCrBx@pie.lan>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
 <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org>
 <aCv8vRu8gjrvK8wr@pie.lan>
 <DA0UO4TYFWAU.DOE3O1UBNN6U@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA0UO4TYFWAU.DOE3O1UBNN6U@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_041259_311473_CFB44CA1 
X-CRM114-Status: GOOD (  26.37  )
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

On Tue, May 20, 2025 at 10:37:38AM +0200, Diederik de Haas wrote:
> On Tue May 20, 2025 at 5:53 AM CEST, Yao Zi wrote:
> > On Mon, May 19, 2025 at 09:26:05PM +0200, Diederik de Haas wrote:
> >> On Mon May 19, 2025 at 6:16 PM CEST, Yao Zi wrote:
> >> > All supported variants of naneng-combphy follow a register layout
> >> > similar to the RK3568 variant with some exceptions of SoC-specific
> >> > registers.
> >> >
> >> > Add RK3568 prefix for the common set of registers and the corresponding
> >> > SoC prefix for SoC-specific registers, making usage of definitions clear
> >> > and preparing for future COMBPHY variants with a different register
> >> > layout.
> >> >
> >> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> >> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >> > ---
> >> >  .../rockchip/phy-rockchip-naneng-combphy.c    | 560 +++++++++---------
> >> >  1 file changed, 288 insertions(+), 272 deletions(-)
> >> >
> >> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> >> > index ce91fb1d5167..1d1c7723584b 100644
> >> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> >> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> >> > @@ -21,78 +21,80 @@
> >> >  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> >> >  
> >> >  /* COMBO PHY REG */
> >> > <snip>
> >> > -#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
> >> > +#define RK3568_PHYREG6				0x14
> >> > +#define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> >> > +#define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> >> > +#define RK3568_PHYREG6_PLL_DIV_2		1
> >> > +
> >> > +#define RK3568_PHYREG7				0x18
> >> > +#define RK3568_PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
> >> > +#define RK3568_PHYREG7_TX_RTERM_SHIFT		4
> >> > +#define RK3568_PHYREG7_TX_RTERM_50OHM		8
> >> > +#define RK3568_PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
> >> > +#define RK3568_PHYREG7_RX_RTERM_SHIFT		0
> >> > +#define RK3568_PHYREG7_RX_RTERM_44OHM		15
> >> > +
> >> > +#define RK3568_PHYREG8				0x1C
> >> > +#define RK3568_PHYREG8_SSC_EN			BIT(4)
> >> > +
> >> > +#define RK3568_PHYREG11				0x28
> >> > +#define RK3568_PHYREG11_SU_TRIM_0_7		0xF0
> >> > +
> >> > +#define RK3568_PHYREG12				0x2C
> >> > +#define RK3568_PHYREG12_PLL_LPF_ADJ_VALUE	4
> >> > +
> >> > +#define RK3568_PHYREG13				0x30
> >> > +#define RK3568_PHYREG13_RESISTER_MASK		GENMASK(5, 4)
> >> > +#define RK3568_PHYREG13_RESISTER_SHIFT		0x4
> >> > +#define RK3568_PHYREG13_RESISTER_HIGH_Z		3
> >> > +#define RK3568_PHYREG13_CKRCV_AMP0		BIT(7)
> >> > +
> >> > +#define RK3568_PHYREG14				0x34
> >> > +#define RK3568_PHYREG14_CKRCV_AMP1		BIT(0)
> >> > +
> >> > +#define RK3568_PHYREG15				0x38
> >> > +#define RK3568_PHYREG15_CTLE_EN			BIT(0)
> >> > +#define RK3568_PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
> >> > +#define RK3568_PHYREG15_SSC_CNT_SHIFT		6
> >> > +#define RK3568_PHYREG15_SSC_CNT_VALUE		1
> >> > +
> >> > +#define RK3568_PHYREG16				0x3C
> >> > +#define RK3568_PHYREG16_SSC_CNT_VALUE		0x5f
> >> > +
> >> > +#define RK3568_PHYREG18				0x44
> >> > +#define RK3568_PHYREG18_PLL_LOOP		0x32
> >> > +
> >> > +#define RK3568_PHYREG32				0x7C
> >> > +#define RK3568_PHYREG32_SSC_MASK		GENMASK(7, 4)
> >> > +#define RK3568_PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
> >> > +#define RK3568_PHYREG32_SSC_DIR_SHIFT		4
> >> > +#define RK3568_PHYREG32_SSC_UPWARD		0
> >> > +#define RK3568_PHYREG32_SSC_DOWNWARD		1
> >> > +#define RK3568_PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
> >> > +#define RK3568_PHYREG32_SSC_OFFSET_SHIFT	6
> >> > +#define RK3568_PHYREG32_SSC_OFFSET_500PPM	1
> >> > +
> >> > +#define RK3568_PHYREG33				0x80
> >> > +#define RK3568_PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
> >> > +#define RK3568_PHYREG33_PLL_KVCO_SHIFT		2
> >> > +#define RK3568_PHYREG33_PLL_KVCO_VALUE		2
> >> > +#define RK3576_PHYREG33_PLL_KVCO_VALUE		4
> >> > +
> >> > +/* RK3588 COMBO PHY registers */
> >> > +#define RK3588_PHYREG27				0x6C
> >> > +#define RK3588_PHYREG27_RX_TRIM			0x4C
> >> 
> >> Would it be better if RK3588_PHYREG* comes after RK3576_PHYREG*?
> >> 
> >
> > It's intended to keep RK3576 definitions below RK3588 ones. The RK3576
> > driver makes use of a register introduced for RK3588 variant
> > (RK3588_PHYREG27). Since similar reusing doesn't happen reversely, I
> > consider the design of RK3576 a superset of the RK3588 one, and put
> > RK3576 definitions later in the file.
> 
> I understand that logic, but OTOH in patch 4 you put the defines for
> RK3528 before RK3568. And RK3568 is not a superset of RK3528 AFAIK.
> It's just different?

Yes, they're completely different things. The order between RK3576 and
RK3588 is decided within the RK3568-like variants. And as RK3528-like
and RK3568-like combphys are completely different, they're simply sorted
in alphabetical order.

> That's why I think/thought sorting them (all) alphabetically would
> make more sense.

If putting RK3528 at first really confuses you, I'd like to add some
extra comments to explicitly split these two kinds of register layouts
apart and claim they aren't compatible. Although to me it's somehow
obvious, as most definitions are prefixed with either RK3528 or RK3568.

> My 0.02
> 
> >> > +
> >> > +/* RK3576 COMBO PHY registers */
> >> > +#define RK3576_PHYREG10				0x24
> >> > +#define RK3576_PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
> >> > +#define RK3576_PHYREG10_SSC_PCM_3500PPM		7
> >> > +
> >> > +#define RK3576_PHYREG17				0x40
> >> > +
> >> > +#define RK3576_PHYREG21				0x50
> >> > +#define RK3576_PHYREG21_RX_SQUELCH_VAL		0x0D
> >> > +
> >> > +#define RK3576_PHYREG30				0x74
> >> >  
> >> >  struct rockchip_combphy_priv;
> >> > <snip>
> >
> >
> > Thanks,
> > Yao Zi
> 

Best regards,
Yao Zi

