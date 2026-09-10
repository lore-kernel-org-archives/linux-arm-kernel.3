Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB986C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BysySkwVmfiOg80mZRu2P2L0wmj7ZMlp89VNthYItXU=; b=keArw/9AWI6xp1EnE0+N2qlDKS
	+GS9ssyjvVnmFggN8VcZz6UM9b+ahKRSZlzmSNAnIBRrIo2APlgkLUZRhWm6RSb/g8mpVZaXo+h1R
	sz+S1o7dYuEF4xjh0+P9q3ELIsfaAoVJO6sxy7ksdiEUPzjcVITOyujSo9p6z/6VNjueC8JSb4NAG
	fjr8DkOj57m/Vkv7+ymR7XzQAq+tpzxQhrr9ZMiJi9hmb1cWg9FVI8nWE264SPCXFPSUerlg/8g4x
	dWuni35cxmB4arNmgc53JxKrqc6sefFB4nTLgBrQg/Qu3w6SBvMVhx4TTD3cQEc0zEUfY0yXCmVD8
	CYDVbJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOv-0000000Dmr2-2bPn;
	Thu, 10 Sep 2026 08:44:57 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOt-0000000DmqE-0Oac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789029895; x=1820565895;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yHF/t7fo4m7uiGHEup1QALUVhVMyuRlqvqxKVfUDfnU=;
  b=m8Plj2aVGk00xLZl3Z7b/qY8ansYKVgze2AyUbsmSWwc4No+FveMaFIq
   ZHBTSaDxLkA9U68bdGGIfs8nEG5XyMo0hbeZPAnthWAbXzNzrP+WXClDq
   /92lOVQ5W8/kRhqpxu6ZDk+05OC0MFCPkf+Q5QmPUsmKdveAW8WGSElIL
   yXbl4edXQOis9Ry7bSyialPln9B1QYsrBA4EilNIoWebqFRYAjP+uS6Hp
   QB6zqT/lPnYLdvEKLzJstyS6Dh6aYNFaRmuQ4zRbpVY5FJ1GH1bAl7yxe
   5BHWxkz8ak9sXOocMuPMgcLf7v9GeeQxxjCfaKrkIXyN6i2e5MsrArubO
   A==;
X-CSE-ConnectionGUID: qqP5TKDdRVqIuKen9UnvZQ==
X-CSE-MsgGUID: +PCPJsneQuuN8+dXSnRx+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100134962"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100134962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:44:54 -0700
X-CSE-ConnectionGUID: 5c0auEYrQJ+J/JRK8/8NQA==
X-CSE-MsgGUID: OIeno0AwRwaIfq4Il33w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295059833"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:44:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 10 Sep 2026 11:44:35 +0300 (EEST)
To: Long Zhao <longzhao@ambarella.com>
cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
    mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
In-Reply-To: <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
Message-ID: <07cdbec9-49af-d500-d93d-56bfcef9f490@linux.intel.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_014455_172534_D382D28D 
X-CRM114-Status: GOOD (  24.15  )
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

On Fri, 4 Sep 2026, Long Zhao via B4 Relay wrote:

> From: Long Zhao <longzhao@ambarella.com>
> 
> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
> 
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 5fba913f3301..b15de40d1e2a 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -43,6 +43,9 @@
>  #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
>  #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
>  
> +/* Ambarella IER: receive timeout interrupt enable */
> +#define AMBARELLA_UART_IER_ETOI		BIT(5)
> +
>  /* Quirks */
>  #define DW_UART_QUIRK_OCTEON		BIT(0)
>  #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
> @@ -60,6 +63,7 @@
>  
>  struct dw8250_platform_data {
>  	u8 usr_reg;
> +	u8 ier_mask;
>  	u32 cpr_value;
>  	unsigned int quirks;
>  };
> @@ -572,6 +576,27 @@ static void dw8250_prepare_rx_dma(struct uart_8250_port *p)
>  	dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
>  }
>  
> +static int dw8250_ier_mask_startup(struct uart_port *p)
> +{
> +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	int ret;
> +
> +	ret = serial8250_do_startup(p);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> +	 * timeout behaviour. Force them into the 8250 IER shadow so later
> +	 * generic IER updates do not clear them.
> +	 */
> +	up->ier |= d->pdata->ier_mask;
> +	serial_port_out(p, UART_IER, up->ier);

serial8250_do_startup() seems to defer IER update on purpose. Is it fine 
to override that behavior here?

-- 
 i.

> +	return 0;
> +}
> +
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>  	unsigned int quirks = data->pdata->quirks;
> @@ -606,6 +631,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  		p->serial_in = dw8250_serial_in32;
>  		data->uart_16550_compatible = true;
>  	}
> +	if (data->pdata->ier_mask)
> +		p->startup = dw8250_ier_mask_startup;
>  }
>  
>  static void dw8250_reset_control_assert(void *data)
> @@ -879,6 +906,12 @@ static const struct dw8250_platform_data dw8250_intc10ee = {
>  	.quirks = DW_UART_QUIRK_IER_KICK,
>  };
>  
> +static const struct dw8250_platform_data dw8250_ambarella_cv75_data = {
> +	.usr_reg = DW_UART_USR,
> +	.ier_mask = AMBARELLA_UART_IER_ETOI,
> +	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> +};
> +
>  static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
>  	.usr_reg = DW_UART_USR,
>  	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
> @@ -889,6 +922,7 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
>  };
>  
>  static const struct of_device_id dw8250_of_match[] = {
> +	{ .compatible = "ambarella,cv75-uart", .data = &dw8250_ambarella_cv75_data },
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
> 
> 

