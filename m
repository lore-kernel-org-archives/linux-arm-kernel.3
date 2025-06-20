Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779CCC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJVc/Bqimb/04dTPJhdiePqGlWXQYi6s6TXswEG790U=; b=aHVcjL2iOZEO6LKUvSNk6sFmdo
	24jfFpTQbdvXxO6cTw12Q5377ZEU2hqulhccRDgJge/O/VBThMgChoKgobu85DX6aLj4/6IeEQZzm
	yP8tlJsr+jmP92R9+ywLtdxO6TbdZkT6pw/HRtXwMHhCeOKb1eBUszDxkwQVY/J+hHTX3oQwJk2xH
	kB1FTH6CfKG/uBwJ4US7oWLlirSg214lZloj3KvGRQXtdUzXW5P1hUYgESQShouWqbrb4sNiAoDe3
	nQ8FK4lEkY/rRegVQpmjRpv/NcQCFv3RzBp542xo7Sv7E3qDiLdkbKLMHPnBfn7iN5bsMAKO3DdQa
	+/WbFukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVx7-0000000Evb4-1nip;
	Fri, 20 Jun 2025 07:14:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVsx-0000000EvJv-0owu;
	Fri, 20 Jun 2025 07:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750403401;
	bh=VJVc/Bqimb/04dTPJhdiePqGlWXQYi6s6TXswEG790U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aw8vMIFr+cXE2mO/q8Oyu1dt9tnCq1lFaxSAROzAWBthwSXvbUQkKB1U6L6uCSkLL
	 2+acxXCyNDkhpz0/pbbOIZSy1x4qwTS3WjNq1nqRpnfLjTjFo0L1DCpeNywuHWsQNP
	 /xmQNCIlx4wV06dP6nDW2tuKvxvIBMeL/eGduIs1nknST7JZlIbBB3mMSOWU/HGi7u
	 y2y/qZTIOwZgrg6zSoXs3t0MtVzQOeK7/MmIoI9aK6W0XyouS7MCZ00VA2dRKTZQoU
	 ypcf0Lm4d/vLU3gBemeyjhzLtybrXugWPxjIDkxa8T+/Qx3H+QvBYSdQjl4eD/aXfG
	 wY/kl+cgKfeMA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 40186640A0;
	Fri, 20 Jun 2025 15:09:58 +0800 (AWST)
Message-ID: <10d493cb37748aeb1f4c97856929845727c4c3bc.camel@codeconstruct.com.au>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 vkoul@kernel.org,  kishon@kernel.org, linus.walleij@linaro.org,
 p.zabel@pengutronix.de,  linux-aspeed@lists.ozlabs.org,
 linux-pci@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com,  yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Date: Fri, 20 Jun 2025 16:39:57 +0930
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
	 <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_001003_432153_67B4BAD0 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, 2025-06-13 at 11:30 +0800, Jacky Chou wrote:
> The PCIe RC PERST uses SSPRST# as PERST#=C2=A0 and enable this pin
> to output.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 12 +++++++++++-
> =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 5a7cd0a88687..c751703acdb9 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -17,6 +17,7 @@
> =C2=A0#include "../pinctrl-utils.h"
> =C2=A0#include "pinctrl-aspeed.h"
> =C2=A0
> +#define SCU040=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x04=
0 /* Reset Control Set 1=C2=A0 */
> =C2=A0#define SCU400=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x400 /* Multi-function Pin Control #1=C2=A0 */
> =C2=A0#define SCU404=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x404 /* Multi-function Pin Control #2=C2=A0 */
> =C2=A0#define SCU40C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x40C /* Multi-function Pin Control #3=C2=A0 */
> @@ -52,7 +53,7 @@
> =C2=A0#define SCU6D0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x6D0 /* Multi-function Pin Control #29 */
> =C2=A0#define SCUC20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00xC20 /* PCIE configuration Setting Control */
> =C2=A0
> -#define ASPEED_G6_NR_PINS 256
> +#define ASPEED_G6_NR_PINS 258
> =C2=A0
> =C2=A0#define M24 0
> =C2=A0SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
> @@ -1636,6 +1637,12 @@ FUNC_DECL_1(USB11BHID, USBB);
> =C2=A0FUNC_DECL_1(USB2BD, USBB);
> =C2=A0FUNC_DECL_1(USB2BH, USBB);
> =C2=A0
> +#define D7 257
> +SIG_EXPR_LIST_DECL_SESG(D7, RCRST, PCIERC1, SIG_DESC_SET(SCU040, 19),

The documentation for SCU040[19] says it will assert the reset. I
expect that's not what's desired.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_=
SET(SCU500, 24));

SCU500[24] seems okay.

> +PIN_DECL_(D7, SIG_EXPR_LIST_PTR(D7, RCRST));
> +FUNC_GROUP_DECL(PCIERC1, D7);

It only makes sense to describe pins with multiple functions. The other
function this pin has is the reset line for the secondary service
processor. Can we describe that too?

Andrew

