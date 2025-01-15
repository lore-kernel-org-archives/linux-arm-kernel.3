Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7FCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KyasszcFm9YvqaeX+ZrpTJ/YJFyRL5m2LQPueQMoh8=; b=LYBqkTd7fmwgCpCjzFvACGt8CX
	BDHKBPu7WdwdXMcPcoh3qyKBvI22cmumjw6d+eC1GkbxT36EWgQC9R+dFUp1l2MAu77jVxJqq2UYy
	GMiqxIHxDJM6WDP40GULqjN1MFW49StW9dTY5Bqg04ogR0XZ1Jqj3PQJuzUB2aVm+Y62xUceIm/SO
	38b3NzAiRRC0WXrv6WBMbdBQmTNd94PSLf1675gSd7bd4/NeLp6YqhdhVAn5Z5URA7HFeBBe9+W4N
	HOZZm8LSYoxAU69zwQP2mNYmRT/UmrRP/OgdbAQ6jVlTYeVfNz9cVtnTCh90QcP3nLp2jnGK9EnM8
	z2CfWfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Zy-0000000BgGd-26mM;
	Wed, 15 Jan 2025 11:28:58 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Vp-0000000BfR4-0i9V;
	Wed, 15 Jan 2025 11:24:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so1328364566b.3;
        Wed, 15 Jan 2025 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940279; x=1737545079; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KyasszcFm9YvqaeX+ZrpTJ/YJFyRL5m2LQPueQMoh8=;
        b=NYWQ/BvKf2f+q+3fBwT2FHRdWQzs5cGioDbCv1m2iAdEz/07lhmmeTb3KvDLDPssVh
         FzJGpmIRqkOPlgA/08QG3V1WlE0czaZQd4sCfVL5+yjGGd7lvMQqgAVFj5IP/NSvBX6k
         6u79yoiwHoDwV7rtUmXQoy1W/2IgldybDNnOegaZCVzTjxAv+Y0Cb21NcJQhcyxES/wq
         sxMHCfIkmaxEWk4FDRkKjm5uai8N0eiV8JxzuRvyVNsifCmGN+Y9xMaWd5ZhmeUzBF01
         vQ2QP+WE28VxWRBSkB+SXpqBnE4r3ag3CcI/S3zdPaB3H6+dwEnQnQAyJ0S5YXoowoue
         CtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940279; x=1737545079;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KyasszcFm9YvqaeX+ZrpTJ/YJFyRL5m2LQPueQMoh8=;
        b=iC8KbnHTZvbVe/3oT031CYBANzH1a3rA68VprL3fC27hsXjLhzAJ8iasaz9o+KNvqH
         YYhs8tRKkPRImwMSuyP193LinMHqhFAfvNQzgnNXCnthRPSW5B/79u/VFwMkPJZWclRh
         TMxw03Fd/stGeCzZw/I3n4cHIql/DKZeLoq0diL54tv/sMXLXo8OHhZPGKtD1vw4t0WR
         Moeh0mBKfvO4toPD9NMf2ZjroFQUPNFVO3YyJVsdwkvfufDYVZOubLjBds9AkKzjmHYc
         EN1JVUiCai3DYyFT/MAUQQpGkNTFPyOhQ1R08OboXDxvX3XdH8PkDs//AHIx3zTz0zIE
         2j+w==
X-Forwarded-Encrypted: i=1; AJvYcCVCvKcLP20ztIsp/2ehs3OU4Ozw5gUyc8olskenJQQd43J1yRGItg2rsXRb0Swd16mMFWAynU+iFho17ApjQUU=@lists.infradead.org, AJvYcCWUHq1Tlwh+tn/CZKMkEpKykGmOz6XDzZ15cMcCLd1N8l2SH1QJLRXeAga3IQcXC3R9u2Bz0XqYlvRT@lists.infradead.org, AJvYcCX1X5pqQkMozDmF+ffpX0CNNCLD+VMtYyf58P6XyjClgrqCx/mlWZrJYyA8yPfeoj0bt93i7Enm+VXAmsNGakbz@lists.infradead.org
X-Gm-Message-State: AOJu0YwVOI+9uWExy2BY8Tkdr3x+8Mc98yeiyuz2tGS0hfmSeuC56rlP
	4UgnqImnRHYJBuBG3LHiqSA2sEr5V9m8a6//KMtuciIzifupKG4D
X-Gm-Gg: ASbGnculqbZbTdtl2uRF9H05v03qtjcvIruRxFG3dJ3zmWClYorNq47Oau4z2lDfNzy
	z+bXc5QTYHvAeRkECy0JksERtDxEwuK/0+oqa3XqwhfURm5voEx8izqlZ6GGmxBMfScJBKP6Fbv
	aL+jM3b1VtldhtpgTgDqC3Ccyo9gn1dNRnMX/1P5zuqJGAbpSrIuiItvoGt2EMuXkzOLw+JnGg3
	Go3W+SmGgRgZkklmRkv6do8UiOh0rmuAj2iL6+PCv4i4euTZGRi9wjVPbq3hfEVqrD38d/yIxyR
	KvPQS7Z5AFouzJDdWYaggBlNxnVsimSZFJqxng==
X-Google-Smtp-Source: AGHT+IG2KovCQ151vrJo8Z9Nnh7jTvQ+3WBYAWbWRzxsQoIL2lpMuzd24xgvQXbv5rOP8j7FHQ0PsA==
X-Received: by 2002:a17:907:d87:b0:aa6:519c:ef9a with SMTP id a640c23a62f3a-ab2ab70ac8cmr2866401466b.53.1736940278824;
        Wed, 15 Jan 2025 03:24:38 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e296sm754474066b.12.2025.01.15.03.24.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:24:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v1 3/6] phy: rockchip: add driver for rk3328 usb3 phy
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250115012628.1035928-4-pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 12:24:25 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>,
 linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 frank.wang@rock-chips.com,
 william.wu@rock-chips.com,
 kever.yang@rock-chips.com,
 linux-phy@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 zyw@rock-chips.com,
 wulf@rock-chips.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC1F504A-54A2-4FD7-806A-0F086686CBAB@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-4-pgwipeout@gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032441_266435_68865D00 
X-CRM114-Status: GOOD (  27.47  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 15 sty 2025, o godz. 02:26:
>=20
> The rk3328 has a combined usb2 and usb3 phy block for the usb3 dwc
> interface. The implementation up until now has been bugged, with
> multiple issues ranging from disconnect detection failures to low
> performance. This driver fixes the majority of the original issues and
> allows better performance for the rk3328 usb3 port.
>=20
> This driver sources data from multiple sources, including the rk3328
> trm, the rk3228h trm, emails from Rockchip, and both the 4.4 and 5.10
> downstream drivers. The current implementation allows for basic bring =
up
> of the phy block and fixes the detection issues. Interrupts are =
enabled,
> but currently only used for debugging. Features missing currently are
> power management, OTG handling, board specific tuning, regulator =
control,
>=20
> Currently the only known bugs are a AX88179 usb3 gigabit adapter =
crashes
> when operating at usb3 speeds and transmitting large amounts of data =
and
> full disconnection detections may be slower than expected (~5-10 =
seconds).
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>=20
> drivers/phy/rockchip/Kconfig                  |  10 +
> drivers/phy/rockchip/Makefile                 |   1 +
> drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> 3 files changed, 880 insertions(+)
> create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
>=20
> diff --git a/drivers/phy/rockchip/Kconfig =
b/drivers/phy/rockchip/Kconfig
> index 2f7a05f21dc5..aac623e84f96 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -48,6 +48,16 @@ config PHY_ROCKCHIP_INNO_USB2
> help
>  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
>=20
> +config PHY_ROCKCHIP_INNO_USB3
> + tristate "Rockchip INNO USB3PHY Driver"
> + depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> + depends on COMMON_CLK
> + depends on USB_SUPPORT
> + select GENERIC_PHY
> + select USB_COMMON
> + help
> +  Support for Rockchip USB3.0 PHY with Innosilicon IP block.
> +
> config PHY_ROCKCHIP_INNO_CSIDPHY
> tristate "Rockchip Innosilicon MIPI CSI PHY driver"
> depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> diff --git a/drivers/phy/rockchip/Makefile =
b/drivers/phy/rockchip/Makefile
> index 010a824e32ce..ec15dcf37fba 100644
> --- a/drivers/phy/rockchip/Makefile
> +++ b/drivers/phy/rockchip/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY) +=3D =
phy-rockchip-inno-csidphy.o
> obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY) +=3D =
phy-rockchip-inno-dsidphy.o
> obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI) +=3D phy-rockchip-inno-hdmi.o
> obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2) +=3D phy-rockchip-inno-usb2.o
> +obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB3) +=3D phy-rockchip-inno-usb3.o
> obj-$(CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY) +=3D =
phy-rockchip-naneng-combphy.o
> obj-$(CONFIG_PHY_ROCKCHIP_PCIE) +=3D phy-rockchip-pcie.o
> obj-$(CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX) +=3D =
phy-rockchip-samsung-hdptx.o
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb3.c =
b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> new file mode 100644
> index 000000000000..51b9f3b7fbfa
> --- /dev/null
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> @@ -0,0 +1,869 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * phy-rockchip-inno-usb3.c - USB3 PHY based on Innosilicon IP as
> + * implemented on Rockchip rk3328. Tuning data magic bits are taken =
as is
> + * from the downstream driver. Downstream driver is located at:
> + * =
https://github.com/rockchip-linux/kernel/blob/240a5660d7c23841ccf7b7cc4890=
78bf521b9802/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> + *
> + * Author: Peter Geis <pgwipeout@gmail.com>
> + * TODO:
> + * - Find the rest of the register names / definitions.
> + * - Implement pm functions.
> + * - Implement board specific tuning from dts.
> + * - Implement regulator control.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/usb/of.h>
> +
> +#define REG_WRITE_MASK GENMASK(31, 16)
> +#define REG_WRITE_SHIFT 16
> +#define DISABLE_BITS 0x0
> +
> +/* USB3PHY GRF Registers */
> +#define USB3PHY_WAKEUP_CON_REG 0x40
> +#define USB3PHY_WAKEUP_STAT_REG 0x44
> +#define USB3_LINESTATE_IRQ_EN BIT(0)
> +#define USB3_RXDET_IRQ_EN BIT(1)
> +#define USB3_BVALID_RISE_IRQ_EN BIT(2)
> +#define USB3_BVALID_FALL_IRQ_EN BIT(3)
> +#define USB3_BVALID_CLEAR_MASK GENMASK(3, 2)
> +#define USB3_ID_RISE_IRQ_EN BIT(4)
> +#define USB3_ID_FALL_IRQ_EN BIT(5)
> +#define USB3_ID_CLEAR_MASK GENMASK(5, 4)
> +#define USB3_RXDET_EN BIT(6)
> +
> +/* PIPE registers */
> +/* 0x08 for SSC, default 0x0e */
> +#define UNKNOWN_PIPE_REG_000 0x000
> +#define UNKNOWN_SSC_000_MASK GENMASK(2, 1)
> +#define UNKNOWN_SSC_000_ENABLE (0x00 << 1)
> +
> +/* 0x83 for 24m, 0x01 for 25m, default 0x86 */
> +#define PIPE_REG_020 0x020
> +/* RX CDR multiplier high bits [7:6], as P, default 0x2, RX data rate =
=3D (2*refclk*P)/Q */
> +#define PIPE_RX_CDR_MULT_HIGH_MASK GENMASK(7, 6)
> +/* TX PLL divider bits [4:0], as N, default 0x6, TX data rate =3D =
(2*refclk*M)/N */
> +#define PIPE_TX_PLL_DIV_MASK GENMASK(4, 0)
> +
> +/* 0x71 for 24m, 0x64 for 25m, default 0x71 */
> +#define PIPE_REG_028 0x028
> +/* RX CDR multiplier low bits [7:0], as P, default 0x71, RX data rate =
=3D (2*refclk*P)/Q */
> +#define PIPE_RX_CDR_MULT_LOW_MASK GENMASK(7, 0)
> +
> +/* 0x26 for 24m?, 0x21 for 25m, default 0x26 */
> +#define PIPE_REG_030 0x030
> +/* RX CDR divider bits [4:0], as Q, default 0x6, RX data rate =3D =
(2*refclk*P)/Q */
> +#define PIPE_RX_CDR_DIV_MASK GENMASK(4, 0)
> +
> +/* 1'b1 Disable bandgap power, default 0x00 */
> +#define PIPE_REG_044 0x044
> +#define BANDGAP_POWER_DISABLE BIT(4)
> +
> +/* 0xe0 for rx tune?, default 0xe1 */
> +#define PIPE_REG_060 0x060
> +#define PIPE_TX_DETECT_BYPASS_DEBUG BIT(4) /* enable to always force =
detection */
> +/* RX CTLE frequency bandwidth response tuning bits [1:0], default =
0x1 */
> +#define PIPE_RX_CTLE_FREQ_BW_MASK GENMASK(1, 0)
> +#define PIPE_RX_CTLE_FREQ_BW_TUNE 0x0
> +
> +/* default 0x49 */
> +#define PIPE_REG_064 0x064
> +/* RX equalizer tail current control bits [6:4], default 0x4 */
> +#define PIPE_RX_EQ_TAIL_CURR_MASK GENMASK(6, 4)
> +
> +/* 0x08 for rx tune?, default 0x07 */
> +#define PIPE_REG_068 0x068
> +/* RX equalizer low frequency gain control bits [7:4], default 0x0 */
> +#define PIPE_RX_EQ_LOW_GAIN_MASK GENMASK(7, 4)
> +#define PIPE_RX_EQ_LOW_GAIN_TUNE (0x1 << 4)
> +/* RX CTLE gain tuning bits [3:0], higher =3D more gain default 0x7 =
*/
> +#define PIPE_RX_CTLE_GAIN_MASK GENMASK(3, 0)
> +#define PIPE_RX_CTLE_GAIN_TUNE 0x7 /* 0x5 lowest functional value, =
0xf highest */
> +
> +/* RX ODT manual resistance config, higher =3D less resistance, =
depends on REG_1C4 BIT(5) set */
> +#define PIPE_REG_06C 0x06c
> +/* RX ODT manual resistance high bits [3:0], default 0x0 */
> +#define PIPE_RX_ODT_RES_HIGH_MASK GENMASK(3, 0)
> +#define PIPE_RX_ODT_RES_HIGH_TUNE 0xf
> +
> +#define PIPE_REG_070 0x070
> +/* RX ODT manual resistance mid bits [7:0], default 0x03 */
> +#define PIPE_RX_ODT_RES_MID_MASK GENMASK(7, 0)
> +#define PIPE_RX_ODT_RES_MID_TUNE 0xff
> +
> +#define PIPE_REG_074 0x074
> +/* RX ODT manual resistance low bits [7:0], default 0xff */
> +#define PIPE_RX_ODT_RES_LOW_MASK GENMASK(7, 0)
> +#define PIPE_RX_ODT_RES_LOW_TUNE 0xff
> +
> +/* default 0x08 */
> +#define PIPE_REG_080 0x080
> +#define PIPE_TX_COMMON_MODE_DIS BIT(2) /* 1'b1 disable TX common type =
*/
> +
> +/* default 0x33 */
> +#define PIPE_REG_088 0x088
> +#define PIPE_TX_DRIVER_PREEMP_EN BIT(4) /* 1'b1 enable pre-emphasis =
*/
> +
> +/* default 0x18 */
> +#define PIPE_REG_0C0 0x0c0
> +#define PIPE_RX_CM_EN BIT(3) /* 1'b1 enable RX CM */
> +#define PIPE_TX_OBS_EN BIT(4) /* 1'b1 enable TX OBS */
> +
> +/* 0x12 for rx tune?, default 0x14 */
> +#define PIPE_REG_0C8 0x0c8
> +/* RX CDR charge pump current bits [3:1], default 0x2 */
> +#define PIPE_RX_CDR_CHG_PUMP_MASK GENMASK(3, 1)
> +#define PIPE_RX_CDR_CHG_PUMP_TUNE (0x2 << 1)
> +
> +/* 0x02 for 24m, 0x06 for 25m, default 0x06 */
> +#define UNKNOWN_PIPE_REG_108 0x108
> +#define UNKNOWN_REFCLK_108_24M 0x02
> +
> +/* 0x80 for 24m, default 0x00 */
> +#define UNKNOWN_PIPE_REG_10C 0x10c
> +#define UNKNOWN_REFCLK_10C_24M BIT(7)
> +
> +/* 0x01 for 24m, 0x00 for 25m, default 0x02 */
> +#define PIPE_REG_118 0x118
> +/* TX PLL multiplier high bits [3:0], as M, default 0x2, TX data rate =
=3D (2*refclk*M)/N */
> +#define PIPE_TX_PLL_MUL_HIGH_MASK GENMASK(3, 0)
> +
> +/* 0x38 for 24m, 0x64 for 25m, default 0x71 */
> +#define PIPE_REG_11C 0x11c
> +/* TX PLL multiplier low bits [7:0], as M, default 0x71, TX data rate =
=3D (2*refclk*M)/N */
> +#define PIPE_TX_PLL_MUL_LOW_MASK GENMASK(7, 0)
> +
> +/* 0x0c for SSC, default 0x1c */
> +#define UNKNOWN_PIPE_REG_120 0x120
> +#define UNKNOWN_SSC_120_MASK BIT(4)
> +#define UNKNOWN_SSC_120_ENABLE (0x0 << 4)
> +
> +/* default 0x40 */
> +#define PIPE_REG_12C 0x12c
> +#define PIPE_TX_PLL_ALWAYS_ON BIT(0) /* disable for PLL control by =
pipe_pd */
> +
> +/* 0x05 for rx tune, default 0x01 */
> +#define PIPE_REG_148 0x148
> +#define PIPE_RX_CHG_PUMP_DIV_2 BIT(2) /* RX CDR charge pump div/2, =
default 0 */
> +
> +/* 0x70 for rx tune, default 0x72 */
> +#define PIPE_REG_150 0x150
> +#define PIPE_TX_BIAS_EN BIT(6) /* 1'b1 Enable TX Bias */
> +/* RX CDR phase tracking speed bits [3:0], default 0x2 */
> +#define PIPE_RX_CDR_SPEED_MASK GENMASK(3, 0)
> +#define PIPE_RX_CDR_SPEED_TUNE 0x00
> +
> +/* default 0xd4 */
> +#define PIPE_REG_160
> +/* RX common mode voltage strength bits [5:4], default 0x1 */
> +#define PIPE_RX_CDR_COM_VOLT_MASK GENMASK(5, 4)
> +#define PIPE_RX_CDR_COM_VOLT_TUNE (0x1 << 4)
> +
> +/* default 0x00 */
> +#define PIPE_REG_180 0x180
> +/* TX driver bias reference voltage bits [3:2], in mv */
> +#define PIPE_TX_BIAS_REF_VOLT_MASK GENMASK(3, 2)
> +#define PIPE_TX_BIAS_REF_VOLT_200 (0x0 << 2)
> +#define PIPE_TX_BIAS_REF_VOLT_175 (0x1 << 2)
> +#define PIPE_TX_BIAS_REF_VOLT_225 (0x2 << 2) /* downstream 5.10 =
driver setting */
> +#define PIPE_TX_BIAS_REF_VOLT_250 (0x3 << 2)
> +
> +/* default 0x01 */
> +#define PIPE_REG_1A8 0x1a8
> +#define PIPE_LDO_POWER_DIS BIT(4) /* 1'b1 Disable LDO Power */
> +
> +/* default 0x07 */
> +#define PIPE_REG_1AC 0x1ac
> +/* TX driver output common voltage bits [5:4], in mv */
> +#define PIPE_TX_COMMON_VOLT_MASK GENMASK(5, 4)
> +#define PIPE_TX_COMMON_VOLT_800 (0x0 << 4)
> +#define PIPE_TX_COMMON_VOLT_750 (0x1 << 4)
> +#define PIPE_TX_COMMON_VOLT_950 (0x2 << 4)
> +#define PIPE_TX_COMMON_VOLT_1100 (0x3 << 4)
> +
> +/* default 0xfb */
> +#define PIPE_REG_1B8 0x1b8
> +/* TX driver swing strength bits [7:4], range 0x0 to 0xf */
> +#define PIPE_TX_DRIVER_SWING_MASK GENMASK(7, 4) /* 0x2 lowest =
functional value */
> +/* TX driver pre-emphasis strength bits [1:0], default 0x3, enabled =
by REG 088 */
> +#define PIPE_TX_DRIVER_PREEMP_STR_MASK GENMASK(1, 0)
> +
> +/* set to 0xf0 for rx tune?, default 0xd0 */
> +#define PIPE_REG_1C4 0x1c4
> +#define PIPE_RX_ODT_AUTO_DIS BIT(5) /* Disable RX ODT auto =
compensation */
> +#define PIPE_TX_ODT_AUTO_DIS BIT(3) /* Disable TX ODT auto =
compensation */
> +
> +/* UTMI registers */
> +/* 0x0f for utmi tune, default 0x09*/
> +#define UTMI_REG_030 0x030
> +/* {bits[2:0]=3D111}: always enable pre-emphasis */
> +#define UTMI_ENABLE_PRE_EMPH_MASK GENMASK(2, 0)
> +#define UTMI_ENABLE_PRE_EMPH 0x07
> +
> +/* 0x41 for utmi tune, default 0x49 */
> +#define UTMI_REG_040 0x040
> +/* TX HS pre-emphasis strength bits [5:3], default 0x1*/
> +#define UTMI_TX_PRE_EMPH_STR_MASK GENMASK(5, 3)
> +#define UTMI_TX_PRE_EMPH_WEAKEST (0x0 << 3)
> +
> +/* set to 0xb5 for utmi tune, default 0xb5 */
> +#define UTMI_REG_11C 0x11c
> +/* {bits[4:0]=3D10101}: odt 45ohm tuning */
> +#define UTMI_ODT_45_OHM_MASK GENMASK(4, 0)
> +#define UTMI_ODT_45_OHM_TUNE 0x15
> +
> +enum rockchip_usb3phy_type {
> + USB3PHY_TYPE_USB2,
> + USB3PHY_TYPE_USB3,
> + USB3PHY_TYPE_MAX,
> +};
> +
> +/**
> + * struct rockchip_usb3phy_port - usb-phy port data.
> + * @phy: port usb phy struct.
> + * @regmap: port regmap.
> + * @type: port usb phy type.
> + */
> +struct rockchip_usb3phy_port {
> + struct phy *phy;
> + struct regmap *regmap;
> + enum rockchip_usb3phy_type type;
> +};
> +
> +struct rockchip_usb3phy {
> + struct device *dev;
> + struct regmap *regmap;
> + struct clk *clk_pipe;
> + struct clk *clk_otg;
> + struct clk *clk_ref;
> + struct reset_control *u3por_rst;
> + struct reset_control *u2por_rst;
> + struct reset_control *pipe_rst;
> + struct reset_control *utmi_rst;
> + struct reset_control *pipe_apb_rst;
> + struct reset_control *utmi_apb_rst;
> + struct rockchip_usb3phy_port ports[USB3PHY_TYPE_MAX];
> + int bvalid_irq;
> + int id_irq;
> + int ls_irq;
> + int rxdet_irq;
> +};
> +
> +struct usb3phy_config {
> + unsigned int reg;
> + unsigned int mask;
> + u8 def;
> +};
> +
> +static const struct usb3phy_config rk3328_rx_config[] =3D {
> + { PIPE_REG_150, PIPE_RX_CDR_SPEED_MASK, PIPE_RX_CDR_SPEED_TUNE },
> + { PIPE_REG_0C8, PIPE_RX_CDR_CHG_PUMP_MASK, PIPE_RX_CDR_CHG_PUMP_TUNE =
},
> + { PIPE_REG_148, PIPE_RX_CHG_PUMP_DIV_2, PIPE_RX_CHG_PUMP_DIV_2 },
> + { PIPE_REG_068, PIPE_RX_CTLE_GAIN_MASK, PIPE_RX_CTLE_GAIN_TUNE },
> +// { PIPE_REG_1C4, PIPE_RX_ODT_AUTO_DIS, PIPE_RX_ODT_AUTO_DIS },
> + { PIPE_REG_070, PIPE_RX_ODT_RES_MID_MASK, PIPE_RX_ODT_RES_MID_TUNE =
},
> + { PIPE_REG_06C, PIPE_RX_ODT_RES_HIGH_MASK, PIPE_RX_ODT_RES_HIGH_TUNE =
},
> + { PIPE_REG_060, PIPE_RX_CTLE_FREQ_BW_MASK, PIPE_RX_CTLE_FREQ_BW_TUNE =
},
> + { UNKNOWN_PIPE_REG_10C, UNKNOWN_REFCLK_10C_24M, =
UNKNOWN_REFCLK_10C_24M },
> + { PIPE_REG_060, PIPE_RX_CTLE_FREQ_BW_MASK, PIPE_RX_CTLE_FREQ_BW_TUNE =
},
> + { PIPE_REG_068, PIPE_RX_EQ_LOW_GAIN_MASK, PIPE_RX_EQ_LOW_GAIN_TUNE =
},
> +};
> +
> +static const struct usb3phy_config rk3328_tx_config[] =3D {
> + { PIPE_REG_180, PIPE_TX_BIAS_REF_VOLT_MASK, =
PIPE_TX_BIAS_REF_VOLT_250 },
> +};
> +
> +static const struct usb3phy_config rk3328_ssc_config[] =3D {
> + { UNKNOWN_PIPE_REG_000, UNKNOWN_SSC_000_MASK, UNKNOWN_SSC_000_ENABLE =
},
> + { UNKNOWN_PIPE_REG_120, UNKNOWN_SSC_120_MASK, UNKNOWN_SSC_120_ENABLE =
},
> +};
> +
> +static const struct usb3phy_config rk3328_utmi_config[] =3D {
> + { UTMI_REG_030, UTMI_ENABLE_PRE_EMPH_MASK, UTMI_ENABLE_PRE_EMPH },
> + { UTMI_REG_040, UTMI_TX_PRE_EMPH_STR_MASK, UTMI_TX_PRE_EMPH_WEAKEST =
},
> + { UTMI_REG_11C, UTMI_ODT_45_OHM_MASK, UTMI_ODT_45_OHM_TUNE },
> +};
> +
> +static const struct usb3phy_config rk3328_pipe_pwr_en_config[] =3D {
> + { PIPE_REG_1A8, PIPE_LDO_POWER_DIS, DISABLE_BITS },
> + { PIPE_REG_044, BANDGAP_POWER_DISABLE, DISABLE_BITS },
> + { PIPE_REG_150, PIPE_TX_BIAS_EN, PIPE_TX_BIAS_EN },
> + { PIPE_REG_080, PIPE_TX_COMMON_MODE_DIS, DISABLE_BITS },
> + { PIPE_REG_0C0, PIPE_TX_OBS_EN, PIPE_TX_OBS_EN },
> + { PIPE_REG_0C0, PIPE_RX_CM_EN, PIPE_RX_CM_EN },
> +};
> +
> +static int rockchip_usb3phy_reset(struct rockchip_usb3phy *usb3phy,
> +  bool reset, enum rockchip_usb3phy_type type)
> +{
> + if (reset) {
> + if (type =3D=3D USB3PHY_TYPE_USB2) {
> + clk_disable_unprepare(usb3phy->clk_otg);
> + reset_control_assert(usb3phy->utmi_rst);
> + reset_control_assert(usb3phy->u2por_rst);
> + }
> + if (type =3D=3D USB3PHY_TYPE_USB3) {
> + clk_disable_unprepare(usb3phy->clk_pipe);
> + reset_control_assert(usb3phy->pipe_rst);
> + reset_control_assert(usb3phy->u3por_rst);
> + }
> + } else {
> + if (type =3D=3D USB3PHY_TYPE_USB2) {
> + reset_control_deassert(usb3phy->u2por_rst);
> + fsleep(1000);
> + clk_prepare_enable(usb3phy->clk_otg);
> + fsleep(500);
> + reset_control_deassert(usb3phy->utmi_rst);
> + fsleep(100);
> + }
> + if (type =3D=3D USB3PHY_TYPE_USB3) {
> + reset_control_deassert(usb3phy->u3por_rst);
> + fsleep(500);
> + clk_prepare_enable(usb3phy->clk_pipe);
> + fsleep(1000);
> + reset_control_deassert(usb3phy->pipe_rst);
> + fsleep(100);
> + }
> + }
> + return 0;
> +}
> +
> +static irqreturn_t rockchip_usb3phy_linestate_irq(int irq, void =
*data)
> +{
> + struct rockchip_usb3phy *usb3phy =3D data;
> + int tmp;
> +
> + /* check if the interrupt is enabled */
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG, &tmp);
> + if (!(tmp & USB3_LINESTATE_IRQ_EN)) {
> + dev_warn(usb3phy->dev, "invalid linestate irq received\n");
> + return IRQ_NONE;
> + }
> +
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, &tmp);
> + if (tmp & USB3_LINESTATE_IRQ_EN)
> + dev_dbg_ratelimited(usb3phy->dev, "linestate irq received\n");
> +
> + /* clear the interrupt */
> + regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, =
USB3_LINESTATE_IRQ_EN);
> +
> + return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rockchip_usb3phy_bvalid_irq(int irq, void *data)
> +{
> + struct rockchip_usb3phy *usb3phy =3D data;
> + int tmp;
> +
> + /* check if the interrupt is enabled */
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG, &tmp);
> + if (!((tmp & USB3_BVALID_FALL_IRQ_EN) | (tmp & =
USB3_BVALID_RISE_IRQ_EN))) {
> + dev_warn_ratelimited(usb3phy->dev, "invalid bvalid irq received\n");
> + return IRQ_NONE;
> + }
> +
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, &tmp);
> + if (tmp & USB3_BVALID_FALL_IRQ_EN)
> + dev_dbg(usb3phy->dev, "bvalid falling irq received\n");
> + if (tmp & USB3_BVALID_RISE_IRQ_EN)
> + dev_dbg(usb3phy->dev, "bvalid rising irq received\n");
> +
> + /* clear the interrupt */
> + regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, =
USB3_BVALID_CLEAR_MASK);
> +
> + return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rockchip_usb3phy_id_irq(int irq, void *data)
> +{
> + struct rockchip_usb3phy *usb3phy =3D data;
> + int tmp;
> +
> + /* check if the interrupt is enabled */
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG, &tmp);
> + if (!((tmp & USB3_ID_FALL_IRQ_EN) | (tmp & USB3_ID_RISE_IRQ_EN))) {
> + dev_warn(usb3phy->dev, "invalid id irq received\n");
> + return IRQ_NONE;
> + }
> +
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, &tmp);
> + if (tmp & USB3_ID_FALL_IRQ_EN)
> + dev_dbg(usb3phy->dev, "id falling irq received\n");
> + if (tmp & USB3_ID_RISE_IRQ_EN)
> + dev_dbg(usb3phy->dev, "id rising irq received\n");
> +
> + /* clear the interrupt */
> + regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, =
USB3_ID_CLEAR_MASK);
> +
> + return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rockchip_usb3phy_rxdet_irq(int irq, void *data)
> +{
> + struct rockchip_usb3phy *usb3phy =3D data;
> + int tmp;
> +
> + /* check if the interrupt is enabled */
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG, &tmp);
> + if (!(tmp & USB3_RXDET_IRQ_EN)) {
> + dev_warn(usb3phy->dev, "invalid rxdet irq received\n");
> + return IRQ_NONE;
> + }
> +
> + regmap_read(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, &tmp);
> + if (tmp & USB3_RXDET_IRQ_EN)
> + dev_dbg_ratelimited(usb3phy->dev, "rxdet irq received\n");
> +
> + /* clear the interrupt */
> + regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_STAT_REG, =
USB3_RXDET_IRQ_EN);
> +
> + return IRQ_HANDLED;
> +}
> +
> +static int rockchip_usb3phy_bulk_update(struct rockchip_usb3phy =
*usb3phy, struct regmap *regmap,
> + const struct usb3phy_config *config, unsigned int size)
> +{
> + unsigned int i, val, tmp;
> + int ret =3D 0;
> +
> + for (i =3D 0; i < size; i++) {
> + ret =3D regmap_read(regmap, config[i].reg, &val);
> + if (ret < 0) {
> + dev_err(usb3phy->dev, "failed to read addr: 0x%02x\n", =
config[i].reg);
> + return ret;
> + }
> + tmp =3D val & ~config[i].mask;
> + tmp |=3D config[i].def;
> + dev_dbg(usb3phy->dev, "write: 0x%03x old: 0x%02x new: 0x%02x\n",
> + config[i].reg, val, tmp);
> + ret =3D regmap_write(regmap, config[i].reg, tmp);
> + if (ret < 0) {
> + dev_err(usb3phy->dev, "failed to write addr: 0x%02x\n", =
config[i].reg);
> + return ret;
> + }
> + }
> +
> + return ret;
> +}
> +
> +static int rockchip_usb3phy_calc_rate(struct rockchip_usb3phy =
*usb3phy, struct regmap *regmap)
> +{
> + long rate;
> + unsigned int mul, div, target =3D (5000000000 / 100000);
> +
> + rate =3D clk_get_rate(usb3phy->clk_ref) / 100000;
> + if (rate < 0) {
> + dev_err(usb3phy->dev, "failed to get refclk, %ld\n", rate);
> + return rate;
> + /* lowest possible supported clock is 4.8MHZ, highest rk3328 can do =
is 1.6GHZ */
> + } else if ((rate < 48) | (rate > 16000)) {
> + goto error;
> + }
> +
> + for (div =3D 1; div < 32; div++) {
> + for (mul =3D 1; mul < 1024; mul++) {
> + if (((2 * rate * mul) / div) =3D=3D target)
> + goto done;
> + if (((2 * rate * mul) / div) > target)
> + break;
> + }
> + }
> +
> +error:
> + dev_err(usb3phy->dev, "invalid refclock rate, %ld\n", rate * =
100000);
> + return -EINVAL;
> +
> +done:
> + dev_dbg(usb3phy->dev, "refclk rate mul: %x div: %x rate: %ld\n", =
mul, div, (rate * 100000));
> +
> + regmap_write(regmap, PIPE_REG_020, (mul >> 2) & =
PIPE_RX_CDR_MULT_HIGH_MASK);
> + regmap_write(regmap, PIPE_REG_020, div & PIPE_TX_PLL_DIV_MASK);
> + regmap_write(regmap, PIPE_REG_028, mul & PIPE_RX_CDR_MULT_LOW_MASK);
> + regmap_write(regmap, PIPE_REG_030, div & PIPE_RX_CDR_DIV_MASK);
> + regmap_write(regmap, PIPE_REG_118, (mul >> 8) & =
PIPE_TX_PLL_MUL_HIGH_MASK);
> + regmap_write(regmap, PIPE_REG_11C, mul & PIPE_TX_PLL_MUL_LOW_MASK);
> +
> + return 0;
> +}
> +
> +static int rockchip_usb3phy_init(struct phy *phy)
> +{
> + struct rockchip_usb3phy_port *port =3D phy_get_drvdata(phy);
> + struct rockchip_usb3phy *usb3phy =3D =
dev_get_drvdata(phy->dev.parent);
> + int tmp, ret;
> +
> + dev_warn(usb3phy->dev, "usb3phy_init %s\n", dev_name(&phy->dev));
> + clk_prepare_enable(usb3phy->clk_ref);
> + rockchip_usb3phy_reset(usb3phy, false, port->type);
> +
> + if (port->type =3D=3D USB3PHY_TYPE_USB2) {
> + /*
> + * "For RK3328 SoC, pre-emphasis and pre-emphasis strength must be
> + * written as one fixed value. The ODT 45ohm value should be tuned
> + * for different boards to adjust HS eye height."
> + */
> + dev_dbg(usb3phy->dev, "tuning UTMI\n");
> + ret =3D rockchip_usb3phy_bulk_update(usb3phy, port->regmap, =
rk3328_utmi_config,
> +   ARRAY_SIZE(rk3328_utmi_config));
> + }
> +
> + if (port->type =3D=3D USB3PHY_TYPE_USB3) {
> + /* Enable interrupts */
> + tmp =3D (USB3_LINESTATE_IRQ_EN | USB3_ID_FALL_IRQ_EN | =
USB3_ID_RISE_IRQ_EN |
> + USB3_RXDET_IRQ_EN | USB3_BVALID_RISE_IRQ_EN | =
USB3_BVALID_FALL_IRQ_EN);
> + tmp |=3D (tmp << REG_WRITE_SHIFT);
> +
> + ret =3D regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG, tmp);
> + if (ret < 0) {
> + /* interrupt write determines if we have write access */
> + dev_err(usb3phy->dev, "failed to write interrupts\n");
> + return ret;
> + }
> +
> + /* Configure for 24M ref clk */
> + dev_dbg(usb3phy->dev, "setting pipe for 24M refclk\n");
> + if (rockchip_usb3phy_calc_rate(usb3phy, usb3phy->regmap))
> + return -EINVAL;
> +
> + /* Enable SSC */
> + udelay(3);
> + dev_dbg(usb3phy->dev, "setting pipe for SSC\n");
> + ret =3D rockchip_usb3phy_bulk_update(usb3phy, port->regmap, =
rk3328_ssc_config,
> +   ARRAY_SIZE(rk3328_ssc_config));
> +
> + /* "Tuning RX for compliance RJTL test" */
> + dev_dbg(usb3phy->dev, "setting pipe for RX tuning\n");
> + ret =3D rockchip_usb3phy_bulk_update(usb3phy, port->regmap, =
rk3328_rx_config,
> +   ARRAY_SIZE(rk3328_rx_config));
> + if (ret)
> + return ret;
> +
> + /*
> + * "Tuning TX to increase the bias current used in TX driver and RX =
EQ,
> + * it can also increase the voltage of LFPS."
> + */
> + dev_dbg(usb3phy->dev, "setting pipe for TX tuning\n");
> + ret =3D rockchip_usb3phy_bulk_update(usb3phy, port->regmap,
> +   rk3328_tx_config, ARRAY_SIZE(rk3328_tx_config));
> +
> + /* Power up the pipe */
> + dev_dbg(usb3phy->dev, "setting pipe power on\n");
> + ret =3D rockchip_usb3phy_bulk_update(usb3phy, port->regmap, =
rk3328_pipe_pwr_en_config,
> +   ARRAY_SIZE(rk3328_pipe_pwr_en_config));
> + }
> +
> + return 0;
> +}
> +
> +static int rockchip_usb3phy_parse_dt(struct rockchip_usb3phy =
*usb3phy, struct device *dev)
> +{
> + int ret;
> +
> + usb3phy->clk_pipe =3D devm_clk_get(dev, "usb3phy-pipe");
> + if (IS_ERR(usb3phy->clk_pipe)) {
> + dev_err(dev, "could not get usb3phy pipe clock\n");
> + return PTR_ERR(usb3phy->clk_pipe);
> + }
> +
> + usb3phy->clk_otg =3D devm_clk_get(dev, "usb3phy-otg");
> + if (IS_ERR(usb3phy->clk_otg)) {
> + dev_err(dev, "could not get usb3phy otg clock\n");
> + return PTR_ERR(usb3phy->clk_otg);
> + }
> +
> + usb3phy->clk_ref =3D devm_clk_get(dev, "refclk-usb3otg");
> + if (IS_ERR(usb3phy->clk_ref)) {
> + dev_err(dev, "could not get usb3phy ref clock\n");
> + return PTR_ERR(usb3phy->clk_ref);
> + }
> +
> + usb3phy->u2por_rst =3D devm_reset_control_get(dev, =
"usb3phy-u2-por");
> + if (IS_ERR(usb3phy->u2por_rst)) {
> + dev_err(dev, "no usb3phy-u2-por reset control found\n");
> + return PTR_ERR(usb3phy->u2por_rst);
> + }
> +
> + usb3phy->u3por_rst =3D devm_reset_control_get(dev, =
"usb3phy-u3-por");
> + if (IS_ERR(usb3phy->u3por_rst)) {
> + dev_err(dev, "no usb3phy-u3-por reset control found\n");
> + return PTR_ERR(usb3phy->u3por_rst);
> + }
> +
> + usb3phy->pipe_rst =3D devm_reset_control_get(dev, =
"usb3phy-pipe-mac");
> + if (IS_ERR(usb3phy->pipe_rst)) {
> + dev_err(dev, "no usb3phy_pipe_mac reset control found\n");
> + return PTR_ERR(usb3phy->pipe_rst);
> + }
> +
> + usb3phy->utmi_rst =3D devm_reset_control_get(dev, =
"usb3phy-utmi-mac");
> + if (IS_ERR(usb3phy->utmi_rst)) {
> + dev_err(dev, "no usb3phy-utmi-mac reset control found\n");
> + return PTR_ERR(usb3phy->utmi_rst);
> + }
> +
> + usb3phy->pipe_apb_rst =3D devm_reset_control_get(dev, =
"usb3phy-pipe-apb");
> + if (IS_ERR(usb3phy->pipe_apb_rst)) {
> + dev_err(dev, "no usb3phy-pipe-apb reset control found\n");
> + return PTR_ERR(usb3phy->pipe_apb_rst);
> + }
> +
> + usb3phy->utmi_apb_rst =3D devm_reset_control_get(dev, =
"usb3phy-utmi-apb");
> + if (IS_ERR(usb3phy->utmi_apb_rst)) {
> + dev_err(dev, "no usb3phy-utmi-apb reset control found\n");
> + return PTR_ERR(usb3phy->utmi_apb_rst);
> + }
> +
> + usb3phy->ls_irq =3D of_irq_get_byname(dev->of_node, "linestate");
> + if (usb3phy->ls_irq < 0) {
> + dev_err(dev, "no linestate irq provided\n");
> + return usb3phy->ls_irq;
> + }
> +
> + ret =3D devm_request_threaded_irq(dev, usb3phy->ls_irq, NULL, =
rockchip_usb3phy_linestate_irq,
> + IRQF_ONESHOT, "rockchip_usb3phy_ls", usb3phy);
> + if (ret) {
> + dev_err(dev, "failed to request linestate irq handle\n");
> + return ret;
> + }
> +
> + usb3phy->bvalid_irq =3D of_irq_get_byname(dev->of_node, "bvalid");
> + if (usb3phy->bvalid_irq < 0) {
> + dev_err(dev, "no bvalid irq provided\n");
> + return usb3phy->bvalid_irq;
> + }
> +
> + ret =3D devm_request_threaded_irq(dev, usb3phy->bvalid_irq, NULL, =
rockchip_usb3phy_bvalid_irq,
> + IRQF_ONESHOT, "rockchip_usb3phy_bvalid", usb3phy);
> + if (ret) {
> + dev_err(dev, "failed to request bvalid irq handle\n");
> + return ret;
> + }
> +
> + usb3phy->id_irq =3D of_irq_get_byname(dev->of_node, "id");
> + if (usb3phy->id_irq < 0) {
> + dev_err(dev, "no id irq provided\n");
> + return usb3phy->id_irq;
> + }
> +
> + ret =3D devm_request_threaded_irq(dev, usb3phy->id_irq, NULL, =
rockchip_usb3phy_id_irq,
> + IRQF_ONESHOT, "rockchip_usb3phy-id", usb3phy);
> + if (ret) {
> + dev_err(dev, "failed to request id irq handle\n");
> + return ret;
> + }
> +
> + usb3phy->rxdet_irq =3D of_irq_get_byname(dev->of_node, "rxdet");
> + if (usb3phy->rxdet_irq < 0) {
> + dev_err(dev, "no rxdet irq provided\n");
> + return usb3phy->rxdet_irq;
> + }
> +
> + ret =3D devm_request_threaded_irq(dev, usb3phy->rxdet_irq, NULL, =
rockchip_usb3phy_rxdet_irq,
> + IRQF_ONESHOT, "rockchip_usb3phy-rxdet", usb3phy);
> + if (ret) {
> + dev_err(dev, "failed to request rxdet irq handle\n");
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +static int rockchip_usb3phy_exit(struct phy *phy)
> +{
> + struct rockchip_usb3phy_port *port =3D phy_get_drvdata(phy);
> + struct rockchip_usb3phy *usb3phy =3D =
dev_get_drvdata(phy->dev.parent);
> +
> + dev_dbg(usb3phy->dev, "usb3phy_shutdown\n");
> + rockchip_usb3phy_reset(usb3phy, true, port->type);
> +
> + return 0;
> +}
> +
> +static const struct phy_ops rockchip_usb3phy_ops =3D {
> + .init =3D rockchip_usb3phy_init,
> + .exit =3D rockchip_usb3phy_exit,
> + .owner =3D THIS_MODULE,
> +};
> +
> +static const struct regmap_config =
rockchip_usb3phy_utmi_port_regmap_config =3D {
> + .reg_bits =3D 32,
> + .val_bits =3D 32,
> + .reg_stride =3D 4,
> + .max_register =3D 0x400,
> + .cache_type =3D REGCACHE_NONE,
> + .fast_io =3D true,
> + .name =3D "utmi-port",
> +};
> +
> +static const struct regmap_config =
rockchip_usb3phy_pipe_port_regmap_config =3D {
> + .reg_bits =3D 32,
> + .val_bits =3D 32,
> + .reg_stride =3D 4,
> + .max_register =3D 0x400,
> + .cache_type =3D REGCACHE_NONE,
> + .fast_io =3D true,
> + .name =3D "pipe-port",
> +};
> +
> +static const struct regmap_config rockchip_usb3phy_regmap_config =3D =
{
> + .reg_bits =3D 32,
> + .val_bits =3D 32,
> + .reg_stride =3D 4,
> + .max_register =3D 0x400,
> + .write_flag_mask =3D REG_WRITE_MASK,
> + .cache_type =3D REGCACHE_NONE,
> + .fast_io =3D true,
> +};
> +
> +static int rockchip_usb3phy_probe(struct platform_device *pdev)
> +{
> + struct device *dev =3D &pdev->dev;
> + struct device_node *np =3D dev->of_node;
> + struct device_node *child_np;
> + struct phy_provider *provider;
> + struct rockchip_usb3phy *usb3phy;
> + const struct regmap_config regmap_config =3D =
rockchip_usb3phy_regmap_config;
> + void __iomem *base;
> + int i, ret;
> +
> + dev_dbg(dev, "Probe usb3phy main block\n");
> + usb3phy =3D devm_kzalloc(dev, sizeof(*usb3phy), GFP_KERNEL);
> + if (!usb3phy)
> + return -ENOMEM;
> +
> + ret =3D rockchip_usb3phy_parse_dt(usb3phy, dev);
> + if (ret) {
> + dev_err(dev, "parse dt failed %i\n", ret);
> + return ret;
> + }
> +
> + base =3D devm_of_iomap(dev, np, 0, NULL);
> + if (IS_ERR(base)) {
> + dev_err(dev, "failed port ioremap\n");
> + return PTR_ERR(base);
> + }
> +
> + usb3phy->regmap =3D devm_regmap_init_mmio(dev, base, =
&regmap_config);
> + if (IS_ERR(usb3phy->regmap)) {
> + dev_err(dev, "regmap init failed\n");
> + return PTR_ERR(usb3phy->regmap);
> + }
> +
> + usb3phy->dev =3D dev;
> + platform_set_drvdata(pdev, usb3phy);
> +
> + /* place block in reset */
> + reset_control_assert(usb3phy->pipe_rst);
> + reset_control_assert(usb3phy->utmi_rst);
> + reset_control_assert(usb3phy->u3por_rst);
> + reset_control_assert(usb3phy->u2por_rst);
> + reset_control_assert(usb3phy->pipe_apb_rst);
> + reset_control_assert(usb3phy->utmi_apb_rst);
> +
> + fsleep(20);
> +
> + /* take apb interface out of reset */
> + reset_control_deassert(usb3phy->utmi_apb_rst);
> + reset_control_deassert(usb3phy->pipe_apb_rst);
> +
> + /* enable usb3phy rx detection to fix disconnection issues */
> + regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG,
> +     (USB3_RXDET_EN | (USB3_RXDET_EN << REG_WRITE_SHIFT)));
> +
> + dev_dbg(dev, "Completed usb3phy core probe\n");
> +
> + /* probe the actual ports */
> + i =3D 0;
> + for_each_available_child_of_node(np, child_np) {
> + const struct regmap_config *regmap_port_config;
> + struct rockchip_usb3phy_port *port =3D &usb3phy->ports[i];
> + struct phy *phy;
> +
> + if (of_node_name_eq(child_np, "utmi-port")) {
> + port->type =3D USB3PHY_TYPE_USB2;
> + regmap_port_config =3D &rockchip_usb3phy_utmi_port_regmap_config;
> + } else if (of_node_name_eq(child_np, "pipe-port")) {
> + port->type =3D USB3PHY_TYPE_USB3;
> + regmap_port_config =3D &rockchip_usb3phy_pipe_port_regmap_config;
> + } else {
> + dev_err(dev, "unknown child node port type %s\n", child_np->name);
> + goto err_port;
> + }
> +
> + base =3D devm_of_iomap(dev, child_np, 0, NULL);
> + if (IS_ERR(base)) {
> + dev_err(dev, "failed port ioremap\n");
> + ret =3D PTR_ERR(base);
> + goto err_port;
> + }
> +
> + port->regmap =3D devm_regmap_init_mmio(dev, base, =
regmap_port_config);
> + if (IS_ERR(port->regmap)) {
> + dev_err(dev, "regmap init failed\n");
> + ret =3D PTR_ERR(port->regmap);
> + goto err_port;
> + }
> +
> + phy =3D devm_phy_create(dev, child_np, &rockchip_usb3phy_ops);
> + if (IS_ERR(phy)) {
> + dev_err_probe(dev, PTR_ERR(phy), "failed to create phy\n");
> + ret =3D PTR_ERR(phy);
> + goto err_port;
> + }
> +
> + port->phy =3D phy;
> + phy_set_drvdata(port->phy, port);
> +
> + /* to prevent out of boundary */
> + if (++i >=3D USB3PHY_TYPE_MAX) {
> + of_node_put(child_np);
> + break;
> + }
> +
> + dev_info(dev, "Completed usb3phy %s port init\n", child_np->name);
> + }
> +
> + provider =3D devm_of_phy_provider_register(dev, =
of_phy_simple_xlate);
> + return PTR_ERR_OR_ZERO(provider);
> +
> +err_port:
> + of_node_put(child_np);
> + return ret;
> +}
> +
> +static const struct of_device_id rockchip_usb3phy_dt_ids[] =3D {
> + { .compatible =3D "rockchip,rk3328-usb3phy", },
> +};

isn=E2=80=99t { /* sentinel */ } missing here?
=20

> +
> +MODULE_DEVICE_TABLE(of, rockchip_usb3phy_dt_ids);
> +
> +static struct platform_driver rockchip_usb3phy_driver =3D {
> + .probe =3D rockchip_usb3phy_probe,
> + .driver =3D {
> + .name =3D "rockchip-usb3-phy",
> + .of_match_table =3D rockchip_usb3phy_dt_ids,
> + },
> +};
> +
> +module_platform_driver(rockchip_usb3phy_driver);
> +
> +MODULE_AUTHOR("Peter Geis <pgwipeout@gmail.com>");
> +MODULE_DESCRIPTION("Rockchip Innosilicon USB3PHY driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.39.5
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


