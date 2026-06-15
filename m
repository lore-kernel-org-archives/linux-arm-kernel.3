Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D79CD98E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQgiXnjJ6fSj+/sElJMxxr5OpH6R2crt7tDdnsh7rI4=; b=IOsY0XPZJSVjqk3KUkKgR5pr2x
	719pl2wGtBEn5rm25zy2/mS75XM57Am0ifgVwfcBUHbiCgSJZFZXBn/xFuMwKy7hBHMj9ZaPhn8Y3
	JU6JlPnpWHKZNkuNchaJCgXrI6GvCwrRbe0MHlOK8OVhtK394YE0nIzihaAOzIJ9U8jDK3Xkxxxoc
	lCMRIctGb/JxtN0YFKgXqgJfmXVsuX5h+Tw6WcvIQMK/VZFbK55aL+oiNdAchzWeh6nJLZvWmY473
	uCD65Bjs1NPU0zIUbLCqzYr96Drq+nglJzgEDwT7Nbkd8Tq3wEgKe2prULHtdXTVJWfrJOcYPySnU
	xV2i+UiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAp-0000000EyQx-2b0W;
	Mon, 15 Jun 2026 23:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAp-0000000EyQ6-02Vj;
	Mon, 15 Jun 2026 23:56:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15BD060137;
	Mon, 15 Jun 2026 23:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194FF1F000E9;
	Mon, 15 Jun 2026 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781567817;
	bh=VQgiXnjJ6fSj+/sElJMxxr5OpH6R2crt7tDdnsh7rI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gvzUN6UkkcOJaUBdPDm3nKWxTFho1m+/20zbBjR8odVbv83K582lvyFUALDDb7dU5
	 XFfEFL4+H5S9MxiBjIEXJv+ko6ZhNS1TPhYpTUqD7nhumLCoNpx/bRPX27GnvAiu5u
	 pFcB2ENBnL5kDYQd3AtUHIwC37JJADPl/8pJSwDhPKz3FBYR53j+sDzB1CHna+rK1Y
	 anlZp4/IvaHysWSmtGyWdxJGzsStMO5SX0AfwVZeLkFpC1GpPg3mTIW36J+DvCbXbG
	 g8beq7HTCjMBsc9kkeu2E6KgBe1qgNvgzlHPsBohG/IeB7LST883G1wX5jKKKZNYq0
	 8A7kw7kjejPgA==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel@makrotopia.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	chester.a.unal@arinc9.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/8] net: dsa: mt7530: convert to use field accessor macros
Date: Mon, 15 Jun 2026 16:56:52 -0700
Message-ID: <20260615235652.1060768-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <62e0a7e96bcadba0ec1a0f090c2fd2990c6ae0f1.1781312667.git.daniel@makrotopia.org>
References: <62e0a7e96bcadba0ec1a0f090c2fd2990c6ae0f1.1781312667.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: dsa: mt7530: convert to use field accessor macros

This patch converts the mt7530 DSA driver to use FIELD_GET and FIELD_PREP
instead of open-coded shift/mask constructs, and replaces a 0x1f literal
in the PHY address helper with (PHY_MAX_ADDR - 1).

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 4168adca949f..dcf72ab0cd66 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -1555,7 +1555,7 @@ mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
>  	u32 val;
>  	int ret;
>  
> -	val = VTCR_BUSY | VTCR_FUNC(cmd) | vid;
> +	val = VTCR_BUSY | VTCR_FUNC(cmd) | VTCR_VID(vid);

[Low]
The commit message describes this change as a refactor:
"Use FIELD_GET and FIELD_PREP instead of open-coding register fields."

The mt7530_vlan_cmd() hunk is not quite a pure conversion though.  The
previous code OR'd in vid directly:

    val = VTCR_BUSY | VTCR_FUNC(cmd) | vid;

while the new code applies a GENMASK(11, 0) truncation through VTCR_VID():

    val = VTCR_BUSY | VTCR_FUNC(cmd) | VTCR_VID(vid);

Spec-conformant VIDs always fit in 12 bits, so the runtime result is the
same, but the value is now masked where it previously was not.

A related observation is that the prior VTCR_VID and ATC_HASH macros
referenced an undeclared x:

    #define  ATC_HASH                       (((x) & 0xfff) << 16)
    #define  VTCR_VID                       ((x) & 0xfff)

so they could not have been used by any caller before this patch.  Adding
the (x) parameter and a GENMASK is effectively a fix for those macros.

Would it be worth calling out the VTCR_VID() truncation and the macro
parameter fix in the commit message, or splitting them into a separate
patch so the conversion remains a no-op refactor?

> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h

[ ... ]

> @@ -171,32 +176,29 @@ enum mt7530_fdb_cmd {
>  
>  /* Registers for table search read address */
>  #define MT7530_TSRA1			0x84

[ ... ]

>  #define MT7530_ATRD			0x8C
> -#define	 AGE_TIMER			24
> -#define  AGE_TIMER_MASK			0xff
> -#define  PORT_MAP			4
> -#define  PORT_MAP_MASK			0xff
> -#define  ENT_STATUS			2
> -#define  ENT_STATUS_MASK		0x3
> +#define  AGE_TIMER_RD_MASK		GENMASK(31, 24)
> +#define  PORT_MAP_MASK			GENMASK(11, 4)
> +#define  ENT_STATUS_MASK		GENMASK(3, 2)

[Low]
The mask formerly named AGE_TIMER_MASK is renamed to AGE_TIMER_RD_MASK,
but the same mask is consumed on both the read and write paths
(mt7530_fdb_read() and mt7530_fdb_write()), so the _RD_ infix reads as
"read-side only".

Its sibling fields in the same MT7530_ATRD register keep plain names
(PORT_MAP_MASK, ENT_STATUS_MASK), and the related ageing counters in
MT7530_AAC use AGE_CNT_MASK / AGE_UNIT_MASK rather than an _RD_
disambiguation.

Was the _RD_ infix intentional, and if so, what does it disambiguate
from?

[ ... ]

> @@ -731,38 +745,48 @@ enum mt7531_xtal_fsel {
>  #define  MT7531_PHY_PLL_OFF		BIT(5)
>  #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
>  
> -#define MT753X_CTRL_PHY_ADDR(addr)	((addr + 1) & 0x1f)
> +#define MT753X_CTRL_PHY_ADDR(addr)	(((addr) + 1) & (PHY_MAX_ADDR - 1))

[Low]
The replacement evaluates to the same value today, since PHY_MAX_ADDR is
32 in include/linux/phy.h and PHY_MAX_ADDR - 1 is 0x1f, and both forms
ultimately derive from the IEEE 802.3 5-bit MDIO PHY-address field.

The original 0x1f represented the width of the hardware register field,
while PHY_MAX_ADDR - 1 represents the maximum software PHY address minus
one and additionally relies on PHY_MAX_ADDR being a power of two, which
phy.h does not formally guarantee.

Given the rest of the patch introduces explicit GENMASK based field
masks, would something like:

    #define MT753X_CTRL_PHY_ADDR_MASK GENMASK(4, 0)
    #define MT753X_CTRL_PHY_ADDR(addr) FIELD_PREP(MT753X_CTRL_PHY_ADDR_MASK, (addr) + 1)

be more consistent and make the hardware-field intent clearer?

