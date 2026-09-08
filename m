Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A3AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsJi2lZEpF2IDanNSkhreh3goiVXfD4CAZAn7dod6ww=; b=HbESeiUK2HJnG+Py2rbSMopM/e
	e4SksOmTUxImA4iriF3yGhmGpTR4AncOtxVLfH7Rofk+Fxuee1brmUJmGLg7riQ/TCdaPGDiVKBCL
	8R7lTOPcmKy2IVUHkRib4Rcab9pAdVJLx5TALLRJ/SLY/sRO9qLT0OpSmNT2yXHqNHl3RbCL21zTT
	2Ma4kPrHMZDk1EYpV0wTQvfYNUxIlTiY61hnX4Cc8DKHt6ydNJyTHwjU/MX7GcPk0Yzis7v6MpVZa
	vq7RHphSuk4WXT7nwPRAx0sR3J6X1GBrUmtqRPQAQ8C8ZltAl2I01sJlV+YV0ylYyUiY5lHosCZYB
	cB3ibCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOh-000000088pv-3YTu;
	Tue, 08 Sep 2026 06:33:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOe-000000088pX-44um
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 06:33:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3049282a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 23:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849212; x=1789454012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsJi2lZEpF2IDanNSkhreh3goiVXfD4CAZAn7dod6ww=;
        b=Bq6y4UPXQK5S00Y++55MG2dlNRJExjKFMSdqYr/sFfYMZtOdIET4LNmkzMOzxP9nvy
         +FFoJF6BjsyYEWZZh2fXHMrObXOaEA3aGwOW48dNzpmDNuxIPmxw7HLKkblOVvBMFXtw
         rA1A9xHza+Qeyy+HzAJqOrd7TXuITUykeZcTeN2zlsdljlTdFRuE73E9A8JL5pU8d+6m
         AdipfjeFuAeGgkO5KRj4zpTvqZHyhyMn/w4EklXkF3lsnCuMlQdwijHU4GjZse+jmh2U
         AAfIL4EyqX0nCMO/ztlDpDJBeJEs/xVaXqtWpZGBGEohb1tjfp3mUK2u2ErwfmEZ064d
         ygvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849212; x=1789454012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsJi2lZEpF2IDanNSkhreh3goiVXfD4CAZAn7dod6ww=;
        b=Kh/u1HDrW8tu0do8bpnZkVbfD4x9NjqNJhQK7V+FKGOlSuVJZOYuAsMXBqws1KNis8
         rXizLf0wjpPUWWuWfEn033voJrqPqwM4cW5dRykcaW+OAJ/j3x5U7/1LHyYjCK7uS132
         cuevaUjG3Z9kWYhPsqKHvF1LBBCT+JAaIQSXGBRio5Eu8hmFcCUwSrqVGL7NPAfozL7f
         uoP1wVkx/CNTOOemkheNZ+fDDIKS2W+Q8yFRr8odeINZaKv6LlzSP8y2j2ZN3B14D1MI
         dS+MjV07OmSk+cyfmFhq2VI6Lkyn7CToYI5gvTuclJwTpt9VRyCEgPnmDPMnwXdRiANr
         jUjg==
X-Forwarded-Encrypted: i=1; AKwUvBy6xlqdJF8kzOU/FLiEA+EUY6HJT0viKGJxjXK7T1tj9gAtBlM9hLkRjqJyAOdhyTYVLuU/HLPG0o+CcH14XuyP@lists.infradead.org
X-Gm-Message-State: AFuF++lSbhxjUoVmdsI/JHtzfBqEPOpbvWhNmuhqHgt8XlNM0Uq0LJp3
	7X5fJBgwuHparzHAVxNqg+J8ISgQ7QbuW3wNgXwcALBnFplFRXK/I7Px
X-Gm-Gg: AYBFou3VwoT6WrMtxSIKOUivMTsCVBcQoSM76142pLBMGcvjuWJ2Mgej2BWAuZd+8Ca
	CvRLl3g8jG8ruYypynRzwoN6ATXUSg/lrraehF2pggWZBW0H6fwLoYLV836aF9fKNu9RlOw8G/K
	NapIrKzK+740dq1GYP+7sFwxjAUEgGIusfOGwRtpLmXRG83HC5GJQSkLGF9qG0VVbI4CMWSCyIl
	hN3HK6AvaNiKqc/A/ZEMGMwvhxc0GNJXjGuTqUWgAHA44UZp6foUPtFh5yrlYck9owN7Ej0u9W8
	RvtOpFlQRsSYkbWlfBqwo34z+56/QmVujcRU9M3JcgmO5ynrWlzZCHXdm+dLTSf9aM2Oiu7uiHH
	CuI0XEfdZV1B0rUg/ErzblkrrlDt6RrvmSUxD49S0PkvPSF3dzqfFZtcmKA8EXbcjtwchTHolOf
	95cSHZ6px3BND434vfGiQ2ZIH2JX7X+A5rcgToW9ngp9Hj+3VOJunpxyDrlfMKDCNgzATvtia+p
	fT7yzrEyENXDQww56jYtoNVOFswPPjsHf8=
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr39243676a91.20.1788849211851;
        Mon, 07 Sep 2026 23:33:31 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm31381442a91.17.2026.09.07.23.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:33:30 -0700 (PDT)
Message-ID: <bbe24480-a844-4b02-b072-6388859cdc1e@gmail.com>
Date: Tue, 8 Sep 2026 14:33:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260807060400.2047517-1-zychennvt@gmail.com>
 <20260807060400.2047517-3-zychennvt@gmail.com>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260807060400.2047517-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233333_058405_66D0D1F6 
X-CRM114-Status: GOOD (  36.09  )
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

Hi Andi,

Gentle ping on this patch.

You reviewed the driver part in v7, and this part has been updated in v8/v9 based on the review feedback.

The v9 series was sent on Aug 7. Please let me know if you have any further comments on this version.

Thanks!
Zi-Yu Chen

Zi-Yu Chen 於 2026/8/7 下午 02:03 寫道:
> Add I2C support for Nuvoton MA35D1 SoC.
> The controller supports standard, fast and fast-plus modes,
> and provides controller/target functionality.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig      |  13 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-ma35d1.c | 779 ++++++++++++++++++++++++++++++++
>  3 files changed, 793 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ma35d1.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d7b89508311f..e69120d46977 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1602,4 +1602,17 @@ config I2C_VIRTIO
>            This driver can also be built as a module. If so, the module
>            will be called i2c-virtio.
>  
> +config I2C_MA35D1
> +	tristate "Nuvoton MA35D1 I2C driver"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	select I2C_SLAVE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C controller in the Nuvoton MA35D1 SoC. This driver
> +	  supports the standard I2C bus protocols, including master and
> +	  slave modes.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-ma35d1.
> +
>  endmenu
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3755c54b3d82..ca75dae4955c 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -131,6 +131,7 @@ obj-$(CONFIG_I2C_XILINX)	+= i2c-xiic.o
>  obj-$(CONFIG_I2C_XLP9XX)	+= i2c-xlp9xx.o
>  obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
>  obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
> +obj-$(CONFIG_I2C_MA35D1)	+= i2c-ma35d1.o
>  
>  # External I2C/SMBus adapter drivers
>  obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
> new file mode 100644
> index 000000000000..61d7605c3a05
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Nuvoton technology corporation.
> + *
> + * Author: Zi-Yu Chen <zychennvt@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +#include <linux/units.h>
> +
> +/* MA35D1 I2C registers offset */
> +#define MA35_CTL0		0x00
> +#define MA35_ADDR0		0x04
> +#define MA35_DAT		0x08
> +#define MA35_STATUS0	0x0c
> +#define MA35_CLKDIV		0x10
> +#define MA35_TOCTL		0x14
> +#define MA35_ADDR1		0x18
> +#define MA35_ADDR2		0x1c
> +#define MA35_ADDR3		0x20
> +#define MA35_ADDRMSK0	0x24
> +#define MA35_ADDRMSK1	0x28
> +#define MA35_ADDRMSK2	0x2c
> +#define MA35_ADDRMSK3	0x30
> +#define MA35_WKCTL		0x3c
> +#define MA35_WKSTS		0x40
> +#define MA35_CTL1		0x44
> +#define MA35_STATUS1	0x48
> +#define MA35_TMCTL		0x4c
> +#define MA35_BUSCTL		0x50
> +#define MA35_BUSTCTL	0x54
> +#define MA35_BUSSTS		0x58
> +#define MA35_PKTSIZE	0x5c
> +#define MA35_PKTCRC		0x60
> +#define MA35_BUSTOUT	0x64
> +#define MA35_CLKTOUT	0x68
> +#define MA35_AUTOCNT	0x78
> +
> +/* MA35D1 I2C Status */
> +/* Controller */
> +#define MA35_M_START				0x08	/* Start */
> +#define MA35_M_REPEAT_START			0x10	/* Controller Repeat Start */
> +#define MA35_M_TRAN_ADDR_ACK		0x18	/* Controller Transmit Address ACK */
> +#define MA35_M_TRAN_ADDR_NACK		0x20	/* Controller Transmit Address NACK */
> +#define MA35_M_TRAN_DATA_ACK		0x28	/* Controller Transmit Data ACK */
> +#define MA35_M_TRAN_DATA_NACK		0x30	/* Controller Transmit Data NACK */
> +#define MA35_M_ARB_LOST				0x38	/* Controller Arbitration Lost */
> +#define MA35_M_RECE_ADDR_ACK		0x40	/* Controller Receive Address ACK */
> +#define MA35_M_RECE_ADDR_NACK		0x48	/* Controller Receive Address NACK */
> +#define MA35_M_RECE_DATA_ACK		0x50	/* Controller Receive Data ACK */
> +#define MA35_M_RECE_DATA_NACK		0x58	/* Controller Receive Data NACK */
> +#define MA35_BUS_ERROR				0x00	/* Bus error */
> +
> +/*  Target */
> +#define MA35_S_REPEAT_START_STOP	0xa0	/* Target Transmit Repeat Start or Stop */
> +#define MA35_S_TRAN_ADDR_ACK		0xa8	/* Target Transmit Address ACK */
> +#define MA35_S_TRAN_DATA_ACK		0xb8	/* Target Transmit Data ACK */
> +#define MA35_S_TRAN_DATA_NACK		0xc0	/* Target Transmit Data NACK */
> +#define MA35_S_TRAN_LAST_DATA_ACK	0xc8	/* Target Transmit Last Data ACK */
> +#define MA35_S_RECE_ADDR_ACK		0x60	/* Target Receive Address ACK */
> +#define MA35_S_RECE_ARB_LOST		0x68	/* Target Receive Arbitration Lost */
> +#define MA35_S_RECE_DATA_ACK		0x80	/* Target Receive Data ACK */
> +#define MA35_S_RECE_DATA_NACK		0x88	/* Target Receive Data NACK */
> +
> +/* Other */
> +#define MA35_ADDR_TRAN_ARB_LOST		0xb0	/* Address Transmit Arbitration Lost */
> +#define MA35_BUS_RELEASED			0xf8	/* Bus Released */
> +
> +/*  I2C_CTL constant definitions. */
> +#define MA35_CTL_AA			BIT(2)
> +#define MA35_CTL_SI			BIT(3)
> +#define MA35_CTL_STO		BIT(4)
> +#define MA35_CTL_STA		BIT(5)
> +#define MA35_CTL_I2CEN		BIT(6)
> +#define MA35_CTL_INTEN		BIT(7)
> +#define MA35_CTL_SI_AA		(MA35_CTL_SI | MA35_CTL_AA)
> +#define MA35_CTL_STO_SI		(MA35_CTL_STO | MA35_CTL_SI)
> +#define MA35_CTL_STA_SI		(MA35_CTL_STA | MA35_CTL_SI)
> +
> +/* Constants */
> +#define MA35_CLKDIV_MSK		GENMASK(15, 0)
> +#define I2C_PM_TIMEOUT_MS	5000
> +#define STOP_TIMEOUT_MS		50
> +
> +struct ma35d1_i2c {
> +	spinlock_t lock;
> +	wait_queue_head_t wait;
> +	struct i2c_msg *msg;
> +	unsigned int msg_num;
> +	unsigned int msg_idx;
> +	unsigned int msg_ptr;
> +	int err;
> +	int irq;
> +	void __iomem *regs;
> +	struct clk *clk;
> +	struct device *dev;
> +	struct i2c_adapter adap;
> +	struct i2c_client *target;
> +	struct reset_control *rst;
> +};
> +
> +static inline bool ma35d1_is_controller_status(unsigned int status)
> +{
> +	return status >= MA35_M_START && status <= MA35_M_RECE_DATA_NACK;
> +}
> +
> +/*
> + * ma35d1_i2c_write_ctl - Update the I2C control register
> + * @i2c: Pointer to the ma35d1 i2c instance
> + * @ctl: Control bits to set (e.g., MA35_CTL_STA, SI, AA)
> + *
> + * Read-modify-write the CTL0 register while preserving unrelated bits.
> + */
> +static void ma35d1_i2c_write_ctl(struct ma35d1_i2c *i2c, unsigned int ctl)
> +{
> +	unsigned int val;
> +
> +	guard(spinlock_irqsave)(&i2c->lock);
> +	val = readl(i2c->regs + MA35_CTL0);
> +	val &= ~(MA35_CTL_SI_AA);
> +	val |= ctl;
> +	writel(val, i2c->regs + MA35_CTL0);
> +}
> +
> +static void ma35d1_i2c_set_addr(struct ma35d1_i2c *i2c)
> +{
> +	unsigned int rw = i2c->msg->flags & I2C_M_RD;
> +
> +	writel(((i2c->msg->addr & 0x7f) << 1) | rw, i2c->regs + MA35_DAT);
> +}
> +
> +static void ma35d1_i2c_controller_complete(struct ma35d1_i2c *i2c)
> +{
> +	i2c->msg_ptr = 0;
> +	i2c->msg = NULL;
> +	i2c->msg_idx++;
> +	i2c->msg_num = 0;
> +
> +	wake_up(&i2c->wait);
> +}
> +
> +static void ma35d1_i2c_reset(struct ma35d1_i2c *i2c)
> +{
> +	unsigned int clkdiv, slvaddr;
> +
> +	clkdiv = readl(i2c->regs + MA35_CLKDIV);
> +	slvaddr = readl(i2c->regs + MA35_ADDR0);
> +
> +	disable_irq(i2c->irq);
> +	i2c->msg = NULL;
> +	reset_control_assert(i2c->rst);
> +	usleep_range(10, 20);
> +	reset_control_deassert(i2c->rst);
> +	enable_irq(i2c->irq);
> +
> +	writel(clkdiv, (i2c->regs + MA35_CLKDIV));
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_I2CEN | MA35_CTL_INTEN);
> +
> +	if (i2c->target)
> +		writel(slvaddr, i2c->regs + MA35_ADDR0);
> +}
> +
> +static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
> +{
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STO_SI);
> +
> +	if (ret)
> +		i2c->err = ret;
> +
> +	ma35d1_i2c_controller_complete(i2c);
> +}
> +
> +/*
> + * ma35d1_i2c_restore_idle - restore controller state to idle
> + * @i2c: Pointer to the ma35d1 i2c instance
> + *
> + * Restore the controller to an idle state after an unexpected event.
> + * Abort an active controller transfer, otherwise re-arm target mode
> + * if enabled.
> + */
> +static void ma35d1_i2c_restore_idle(struct ma35d1_i2c *i2c)
> +{
> +	if (i2c->msg)
> +		ma35d1_i2c_stop(i2c, -EIO);
> +	else if (i2c->target)
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> +	else
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +}
> +
> +/* Check if this is the last message in the set */
> +static inline bool is_last_msg(struct ma35d1_i2c *i2c)
> +{
> +	return i2c->msg_idx >= (i2c->msg_num - 1);
> +}
> +
> +/* Check if this is the last byte in the current message */
> +static inline bool is_last_byte(struct ma35d1_i2c *i2c)
> +{
> +	return i2c->msg_ptr == i2c->msg->len - 1;
> +}
> +
> +/* Check if reached the end of the current message */
> +static inline bool is_msgend(struct ma35d1_i2c *i2c)
> +{
> +	return i2c->msg_ptr >= i2c->msg->len;
> +}
> +
> +/*
> + * ma35d1_i2c_irq_target_trx - I2C Target state machine handler
> + * @i2c: ma35d1 i2c instance
> + * @i2c_status: hardware status code from MA35_STATUS0
> + */
> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +					     unsigned long i2c_status)
> +{
> +	unsigned char byte = 0;
> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
> +		/*
> +		 * Arbitration lost during address transmission phase.
> +		 * The hardware switches to Target Transmitter mode when
> +		 * our own SLA+W is detected on the bus.
> +		 */
> +		i2c->err = -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> +		break;
> +
> +	case MA35_S_RECE_ADDR_ACK:
> +		/* Own SLA+W has been receive; ACK has been return */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> +		break;
> +
> +	case MA35_S_TRAN_DATA_NACK:
> +	case MA35_S_RECE_DATA_NACK:
> +		/*
> +		 * Data byte or last data in I2CDAT has been transmitted and NACK received,
> +		 * or previously addressed with own SLA address and NACK returned.
> +		 */
> +		break;
> +
> +	case MA35_S_RECE_DATA_ACK:
> +		/*
> +		 * Previously address with own SLA address Data has been received;
> +		 * ACK has been returned
> +		 */
> +		byte = readb(i2c->regs + MA35_DAT);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);
> +		break;
> +
> +	case MA35_ADDR_TRAN_ARB_LOST:
> +		/*
> +		 * Arbitration lost during address transmission phase.
> +		 * The hardware switches to Target Receiver mode when
> +		 * our own SLA+R is detected on the bus.
> +		 */
> +		i2c->err = -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_READ_REQUESTED, &byte);
> +		writel(byte, i2c->regs + MA35_DAT);
> +		break;
> +
> +	case MA35_S_TRAN_ADDR_ACK:
> +		/* Own SLA+R has been receive; ACK has been return */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_READ_REQUESTED, &byte);
> +		writel(byte, i2c->regs + MA35_DAT);
> +		break;
> +
> +	case MA35_S_TRAN_DATA_ACK:
> +		i2c_slave_event(i2c->target, I2C_SLAVE_READ_PROCESSED, &byte);
> +		writel(byte, i2c->regs + MA35_DAT);
> +		break;
> +
> +	case MA35_S_REPEAT_START_STOP:
> +	/*
> +	 *  A STOP or repeated START has been received
> +	 *  while still addressed as Target/Receiver
> +	 */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_STOP, &byte);
> +		break;
> +
> +	default:
> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
> +			i2c_status);
> +		ma35d1_i2c_restore_idle(i2c);
> +		return IRQ_NONE;
> +	}
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * ma35d1_i2c_irq_controller_trx - I2C Controller state machine handler
> + * @i2c: ma35d1 i2c instance
> + * @i2c_status: hardware status code from MA35_STATUS0
> + */
> +static irqreturn_t ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
> +						 unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	/* Ensuring messages are absolutely valid in Controller mode. */
> +	if (unlikely(!i2c->msg)) {
> +		dev_err(i2c->dev, "Spurious controller interrupt (status: 0x%02lx)\n", i2c_status);
> +		ma35d1_i2c_restore_idle(i2c);
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (i2c_status) {
> +	case MA35_M_START:
> +	case MA35_M_REPEAT_START:
> +		ma35d1_i2c_set_addr(i2c);
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		break;
> +
> +	case MA35_M_TRAN_ADDR_ACK:
> +	case MA35_M_TRAN_DATA_ACK:
> +		/* SLA+W has been transmitted and ACK has been received */
> +		if (i2c_status == MA35_M_TRAN_ADDR_ACK) {
> +			if (is_last_msg(i2c) && i2c->msg->len == 0) {
> +				ma35d1_i2c_stop(i2c, 0);
> +				return IRQ_HANDLED;
> +			}
> +		}
> +
> +		if (!is_msgend(i2c)) {
> +			byte = i2c->msg->buf[i2c->msg_ptr++];
> +			writel(byte, i2c->regs + MA35_DAT);
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		} else if (!is_last_msg(i2c)) {
> +			dev_dbg(i2c->dev, "WRITE: Next Message\n");
> +
> +			i2c->msg_ptr = 0;
> +			i2c->msg_idx++;
> +			i2c->msg++;
> +
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA | MA35_CTL_SI);
> +		} else {
> +			ma35d1_i2c_stop(i2c, 0);
> +		}
> +		break;
> +
> +	case MA35_M_TRAN_DATA_NACK:
> +		ma35d1_i2c_stop(i2c, -EIO);
> +		break;
> +
> +	case MA35_M_TRAN_ADDR_NACK:
> +	case MA35_M_RECE_ADDR_NACK:
> +		/*
> +		 * Controller Transmit Address NACK
> +		 * 0x20: SLA+W has been transmitted and NACK has been received
> +		 * 0x48: SLA+R has been transmitted and NACK has been received
> +		 */
> +		dev_dbg(i2c->dev, "\n i2c: ack was not received\n");
> +		ma35d1_i2c_stop(i2c, -ENXIO);
> +		break;
> +
> +	case MA35_M_RECE_ADDR_ACK:
> +		if (is_msgend(i2c)) {
> +			if (is_last_msg(i2c)) {
> +				ma35d1_i2c_stop(i2c, 0);
> +			} else {
> +				dev_dbg(i2c->dev, "READ: Next Transfer\n");
> +
> +				i2c->msg_ptr = 0;
> +				i2c->msg_idx++;
> +				i2c->msg++;
> +
> +				ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA_SI);
> +			}
> +		} else if (i2c->msg->len == 1) {
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		} else {
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> +		}
> +		break;
> +
> +	case MA35_M_RECE_DATA_ACK:
> +	case MA35_M_RECE_DATA_NACK:
> +		/* DATA has been received and ACK/NACK has been received */
> +		byte = readb(i2c->regs + MA35_DAT);
> +		i2c->msg->buf[i2c->msg_ptr++] = byte;
> +
> +		if (is_last_byte(i2c)) {
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		} else if (is_msgend(i2c)) {
> +			if (is_last_msg(i2c)) {
> +				dev_dbg(i2c->dev, "READ: Send Stop\n");
> +
> +				ma35d1_i2c_stop(i2c, 0);
> +			} else {
> +				dev_dbg(i2c->dev, "READ: Next Transfer\n");
> +
> +				i2c->msg_ptr = 0;
> +				i2c->msg_idx++;
> +				i2c->msg++;
> +
> +				ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA_SI);
> +			}
> +		} else {
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> +		}
> +		break;
> +
> +	case MA35_M_ARB_LOST:
> +		/* Arbitration Lost */
> +		i2c->err = -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		break;
> +
> +	default:
> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
> +			i2c_status);
> +		ma35d1_i2c_restore_idle(i2c);
> +		return IRQ_NONE;
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c = dev_id;
> +	unsigned long status;
> +
> +	status = readl(i2c->regs + MA35_STATUS0);
> +
> +	if (status == MA35_BUS_ERROR) {
> +		dev_err(i2c->dev, "bus error\n");
> +		ma35d1_i2c_restore_idle(i2c);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (ma35d1_is_controller_status(status))
> +		return ma35d1_i2c_irq_controller_trx(i2c, status);
> +	else
> +		return ma35d1_i2c_irq_target_trx(i2c, status);
> +}
> +
> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msgs,
> +			     int num)
> +{
> +	unsigned long timeout;
> +	unsigned int val;
> +	int ret, err;
> +
> +	i2c->msg = msgs;
> +	i2c->msg_num = num;
> +	i2c->msg_ptr = 0;
> +	i2c->msg_idx = 0;
> +	i2c->err = 0;
> +
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
> +
> +	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
> +	ret = i2c->msg_idx;
> +
> +	if (timeout == 0) {
> +		dev_dbg(i2c->dev, "xfer timeout\n");
> +		ret = -ETIMEDOUT;
> +		goto reset;
> +	}
> +
> +	err = readl_poll_timeout(i2c->regs + MA35_CTL0, val,
> +				 !(val & MA35_CTL_STO), 100,
> +				 STOP_TIMEOUT_MS * 1000);
> +	if (err) {
> +		dev_err(i2c->dev, "bus idle timeout\n");
> +		ret = -EBUSY;
> +		goto reset;
> +	} else if (i2c->err) {
> +		dev_dbg(i2c->dev, "xfer error %d\n", i2c->err);
> +		ret = i2c->err;
> +	}
> +	return ret;
> +
> +reset:
> +	ma35d1_i2c_reset(i2c);
> +	return ret;
> +}
> +
> +static int ma35d1_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			   int num)
> +{
> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(i2c->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ma35d1_i2c_doxfer(i2c, msgs, num);
> +
> +	if (i2c->target)
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +	pm_runtime_put_autosuspend(i2c->dev);
> +
> +	return ret;
> +}
> +
> +static int ma35d1_reg_target(struct i2c_client *target)
> +{
> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(target->adapter);
> +	unsigned int slvaddr;
> +	int ret;
> +
> +	if (i2c->target)
> +		return -EBUSY;
> +
> +	if (target->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	/* Keep device active for target mode listening. */
> +	ret = pm_runtime_resume_and_get(i2c->dev);
> +	if (ret) {
> +		dev_err(i2c->dev, "failed to resume i2c controller\n");
> +		return ret;
> +	}
> +
> +	i2c->target = target;
> +
> +	slvaddr = target->addr << 1;
> +	writel(slvaddr, i2c->regs + MA35_ADDR0);
> +
> +	/* I2C enter SLV mode */
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +
> +	return 0;
> +}
> +
> +static int ma35d1_unreg_target(struct i2c_client *target)
> +{
> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(target->adapter);
> +	int ret;
> +
> +	if (!i2c->target)
> +		return -EINVAL;
> +
> +	writel(0, i2c->regs + MA35_ADDR0);
> +	/* Clear AA bit */
> +	ma35d1_i2c_write_ctl(i2c, 0);
> +
> +	synchronize_irq(i2c->irq);
> +	i2c->target = NULL;
> +
> +	ret = pm_runtime_put_sync(i2c->dev);
> +	if (ret < 0)
> +		dev_err(i2c->dev, "failed to suspend i2c controller");
> +
> +	return 0;
> +}
> +
> +/* Declare Our I2C Functionality */
> +static u32 ma35d1_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +/* I2C Bus Registration Info */
> +static const struct i2c_algorithm ma35d1_i2c_algorithm = {
> +	.xfer = ma35d1_i2c_xfer,
> +	.functionality = ma35d1_i2c_func,
> +	.reg_target = ma35d1_reg_target,
> +	.unreg_target = ma35d1_unreg_target,
> +};
> +
> +static const struct i2c_adapter_quirks ma35d1_i2c_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN_READ,
> +};
> +
> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	/* Prepare for wake-up from I2C events if target mode is active */
> +	if (i2c->target) {
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +
> +		/* Setup wake-up control */
> +		writel(0x1, i2c->regs + MA35_WKCTL);
> +
> +		/* Clear pending wake-up flags */
> +		val = readl(i2c->regs + MA35_WKSTS);
> +		writel(val, i2c->regs + MA35_WKSTS);
> +
> +		enable_irq_wake(i2c->irq);
> +
> +		return 0;
> +	}
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int ma35d1_i2c_resume(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	if (i2c->target) {
> +		/* Disable wake-up */
> +		writel(0x0, i2c->regs + MA35_WKCTL);
> +
> +		/* Clear pending wake-up flags */
> +		val = readl(i2c->regs + MA35_WKSTS);
> +		writel(val, i2c->regs + MA35_WKSTS);
> +
> +		disable_irq_wake(i2c->irq);
> +		return 0;
> +	}
> +	return pm_runtime_force_resume(dev);
> +}
> +
> +static int ma35d1_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
> +
> +	clk_disable(i2c->clk);
> +
> +	return 0;
> +}
> +
> +static int ma35d1_i2c_runtime_resume(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_enable(i2c->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock in resume\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ma35d1_i2c_pm_cleanup(void *data)
> +{
> +	struct device *dev = data;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
> +	unsigned int busfreq = I2C_MAX_STANDARD_MODE_FREQ;
> +	struct device *dev = &pdev->dev;
> +	struct ma35d1_i2c *i2c;
> +	struct resource *res;
> +	int ret, clkdiv;
> +	u32 val;
> +
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	init_waitqueue_head(&i2c->wait);
> +	spin_lock_init(&i2c->lock);
> +
> +	i2c->dev = dev;
> +
> +	i2c->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(i2c->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2c->clk),
> +				     "failed to get core clk\n");
> +
> +	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2c->regs))
> +		return PTR_ERR(i2c->regs);
> +
> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
> +				     "failed to get reset control\n");
> +
> +	ret = reset_control_deassert(i2c->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
> +
> +	/* Setup info block for the I2C core */
> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c->adap.algo = &ma35d1_i2c_algorithm;
> +	i2c->adap.quirks = &ma35d1_i2c_quirks;
> +	i2c->adap.retries = 2;
> +	i2c->adap.algo_data = i2c;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	i2c->adap.dev.of_node = pdev->dev.of_node;
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	if (!device_property_read_u32(dev, "clock-frequency", &val)) {
> +		if (val != 0 && val <= MEGA)
> +			busfreq = val;
> +	}
> +	/* Calculate divider based on the current peripheral clock rate */
> +	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
> +	if (clkdiv < 0 || clkdiv > 0xffff)
> +		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
> +				     clkdiv);
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
> +	if (ret)
> +		return ret;
> +
> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
> +
> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
> +			       i2c);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
> +		return ret;
> +	}
> +
> +	ret = devm_i2c_add_adapter(dev, &i2c->adap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to add bus to i2c core\n");
> +		return ret;
> +	}
> +
> +	dev_info(&i2c->adap.dev, "%pa MA35D1 I2C adapter registered\n",
> +		 &res->start);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ma35d1_i2c_pmops = {
> +	SYSTEM_SLEEP_PM_OPS(ma35d1_i2c_suspend, ma35d1_i2c_resume)
> +		RUNTIME_PM_OPS(ma35d1_i2c_runtime_suspend,
> +			       ma35d1_i2c_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id ma35d1_i2c_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-i2c" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35d1_i2c_of_match);
> +
> +static struct platform_driver ma35d1_i2c_driver = {
> +	.probe      = ma35d1_i2c_probe,
> +	.driver     = {
> +		.name   = "ma35d1-i2c",
> +		.of_match_table = ma35d1_i2c_of_match,
> +		.pm = pm_ptr(&ma35d1_i2c_pmops),
> +	},
> +};
> +module_platform_driver(ma35d1_i2c_driver);
> +
> +MODULE_AUTHOR("Zi-Yu Chen <zychennvt@gmail.com>");
> +MODULE_DESCRIPTION("MA35D1 I2C Bus Driver");
> +MODULE_LICENSE("GPL");


