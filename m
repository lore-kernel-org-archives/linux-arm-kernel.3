Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5D1CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg2Q9bBmj3I6B2mPNqwE8BetkFgfs8EYCHLqur8wswI=; b=iS4aWivclvgJE9b6uyzfjUdRGE
	ATXt2gEMysurwvkA02bWQ22VMM69lffQ9PacDs6teXel61FXtciZqW6wFJcOq2J6UXYV2hqMU/IqI
	qH6gWbAaQQfakeBBcfSC4/mBXLoeLZRLTdMsbAQJn8xDxWWFRgTQ6iNomFzAvuEeepVt9c2JBiN9J
	gaXvPLBduuZQ8dlSLn6FqU1zsfxA8eja/mPgt+G4+aOXO1FVt6tLkpckdJtuSAwCHXmqkyyB6slNy
	gruuClDiPl5K/EtyKELsoXl8qY6qYuTBATLOG70EKwARRJQgmrY2LBjbbqGzGl2e7tAYHU2GvwPms
	QEM5rnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa2P-00000006Hrd-0xvA;
	Sun, 18 Oct 2026 23:11:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa2N-00000006HrX-0fb4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 23:11:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7069F4074A;
	Sun, 18 Oct 2026 23:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF131F000C4;
	Sun, 18 Oct 2026 23:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792365090;
	bh=bg2Q9bBmj3I6B2mPNqwE8BetkFgfs8EYCHLqur8wswI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iJX+AQm2MuweY6aGarhbr0cJWJCqkmXocS/OcCMbEBIv3w805f3+sCawQPvgaaqoU
	 ONOD3/YgsT6EP1JhD01WlFMsAfNlYq2mj4MCCupT+s9V1/A//hHh8AU3LI+6W9m7bs
	 1b2e7aGFJo7CFul//vsTuHc/kOOx+6YP2iq4iXOiMwIuzLtVsFxCGD8ByeGjV8kyJs
	 TVIGmzyleeagQ9S4Hrc9wFMYAaqR5DxcYSYQukIAauTEQZO1hdwkneGSPI7odfSrL8
	 D959hBNMsVilmzNxVltZPAoIiWwfHw1MKFGmugB3VIPWB5a0UkVcx7TPYbuCGNzETS
	 93gOHltVcALaQ==
Date: Mon, 19 Oct 2026 00:11:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 05/15] iio: adc: xilinx-xadc: Use bitfield helpers
 and bit macros
Message-ID: <20261019001124.5f364ca7@jic23-hlaptop>
In-Reply-To: <20261005094205.1045874-6-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-6-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 5 Oct 2026 15:11:55 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Replace open-coded bit manipulation with FIELD_GET(),
> FIELD_PREP(), BIT(), and GENMASK() helpers.
> 
> Using the kernel bitfield helpers improves readability and
> makes bit operations less error-prone.
> 
> No functional changes intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---
>  drivers/iio/adc/xilinx-xadc-core.c | 25 +++++++++++++------------
>  drivers/iio/adc/xilinx-xadc.h      | 24 ++++++++++++------------
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index b4a3e6f967c4..9e4955016bbc 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -11,6 +11,8 @@
>   *  - AXI XADC interface: Xilinx PG019
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -47,18 +49,17 @@ static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;
>  #define XADC_ZYNQ_REG_CTL		0x18
>  
>  #define XADC_ZYNQ_CFG_ENABLE		BIT(31)
> -#define XADC_ZYNQ_CFG_DFIFOTH_MASK	(0xf << 16)
> -#define XADC_ZYNQ_CFG_DFIFOTH_OFFSET	16
>  #define XADC_ZYNQ_CFG_REDGE		BIT(12)
> -#define XADC_ZYNQ_CFG_TCKRATE_MASK	(0x3 << 8)
> -#define XADC_ZYNQ_CFG_TCKRATE_DIV2	(0x0 << 8)
> -#define XADC_ZYNQ_CFG_TCKRATE_DIV4	(0x1 << 8)
> -#define XADC_ZYNQ_CFG_TCKRATE_DIV8	(0x2 << 8)
> -#define XADC_ZYNQ_CFG_TCKRATE_DIV16	(0x3 << 8)
> +#define XADC_ZYNQ_CFG_DFIFOTH_MASK	GENMASK(19, 16)
> +#define XADC_ZYNQ_CFG_TCKRATE_MASK	GENMASK(9, 8)
> +#define XADC_ZYNQ_CFG_TCKRATE_DIV2	0
> +#define XADC_ZYNQ_CFG_TCKRATE_DIV4	BIT(8)
> +#define XADC_ZYNQ_CFG_TCKRATE_DIV8	BIT(9)
> +#define XADC_ZYNQ_CFG_TCKRATE_DIV16	GENMASK(9, 8)

These are the values 0, 1, 2 and 3 in the field TCKRATE
so why would we define them as bit masks.  Just use the
numbers.

>  #define XADC_ZYNQ_CFG_IGAP(x)		(x)
>  
>  #define XADC_ZYNQ_INT_DFIFO_GTH		BIT(8)
> -#define XADC_ZYNQ_INT_ALARM_MASK	0xff
> +#define XADC_ZYNQ_INT_ALARM_MASK	GENMASK(7, 0)
>  
>  #define XADC_ZYNQ_STATUS_DFIFOE		BIT(8)
>  
> @@ -86,7 +87,7 @@ static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;
>  #define XADC_AXI_GIER_ENABLE		BIT(31)
>  
>  #define XADC_AXI_INT_EOS		BIT(4)
> -#define XADC_AXI_INT_ALARM_MASK		0x3c0f
> +#define XADC_AXI_INT_ALARM_MASK		(GENMASK(13, 10) | GENMASK(3, 0))

That's an odd mask. Is it made up of fields you can break it down into?


>  
>  static int xadc_write_raw(struct iio_dev *indio_dev,
> diff --git a/drivers/iio/adc/xilinx-xadc.h b/drivers/iio/adc/xilinx-xadc.h
> index 8449fb741370..a659b7981b2f 100644
> --- a/drivers/iio/adc/xilinx-xadc.h
> +++ b/drivers/iio/adc/xilinx-xadc.h
> @@ -9,6 +9,7 @@
>  #ifndef __IIO_XILINX_XADC__
>  #define __IIO_XILINX_XADC__
>  
> +#include <linux/bits.h>
>  #include <linux/interrupt.h>
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
> @@ -141,20 +142,19 @@ static inline int xadc_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 va
>  #define XADC_CONF0_MUX			BIT(11)
>  #define XADC_CONF0_CHAN(x)		(x)
>  
> -#define XADC_CONF1_SEQ_MASK		(0xf << 12)
> -#define XADC_CONF1_SEQ_DEFAULT		(0 << 12)
> -#define XADC_CONF1_SEQ_CONTINUOUS	(2 << 12)
> -#define XADC_CONF1_SEQ_SIMULTANEOUS	(4 << 12)
> -#define XADC_CONF1_SEQ_INDEPENDENT	(8 << 12)
> -#define XADC_CONF1_ALARM_MASK		0x0f0f
> +#define XADC_CONF1_SEQ_MASK		GENMASK(15, 12)
Interesting corner case. How is it documented?
Are the bits a bitmap or is it a larger field where only
the values 0, 2, 4 and 8 are not reserved?

Hopefully it isn't that most horrible of datasheet things
a bitmap inside a field.  Those are hard to write nice
software for because you end up with a FIELD_PREP(BIT() like
you have here.

> +#define XADC_CONF1_SEQ_DEFAULT		0
> +#define XADC_CONF1_SEQ_CONTINUOUS	BIT(13)
> +#define XADC_CONF1_SEQ_SIMULTANEOUS	BIT(14)
> +#define XADC_CONF1_SEQ_INDEPENDENT	BIT(15)
> +#define XADC_CONF1_ALARM_MASK		(GENMASK(11, 8) | GENMASK(3, 0))

Similar to above. I'm hoping that can be broken down into more
specific fields. Otherwise we are magic number territory rather
than a normal bitmask for a field.

>  
> -#define XADC_CONF2_DIV_MASK	0xff00
> -#define XADC_CONF2_DIV_OFFSET	8
> +#define XADC_CONF2_DIV_MASK	GENMASK(15, 8)
>  
> -#define XADC_CONF2_PD_MASK	(0x3 << 4)
> -#define XADC_CONF2_PD_NONE	(0x0 << 4)
> -#define XADC_CONF2_PD_ADC_B	(0x2 << 4)
> -#define XADC_CONF2_PD_BOTH	(0x3 << 4)
> +#define XADC_CONF2_PD_MASK	GENMASK(5, 4)
> +#define XADC_CONF2_PD_NONE	0
> +#define XADC_CONF2_PD_ADC_B	BIT(5)
Smells like a value of 2
> +#define XADC_CONF2_PD_BOTH	GENMASK(5, 4)
and a value of 3 - so keep it as those.

>  
>  #define XADC_ALARM_VCCINT_MASK		BIT(1)
>  #define XADC_ALARM_VCCAUX_MASK		BIT(2)


