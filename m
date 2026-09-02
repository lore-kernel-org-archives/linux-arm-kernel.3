Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23385C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Bq3n+d6CqRiWka+r6Puyq82APtewnlh2hBeOLFbC3w=; b=uMXLuSJQc7xz1gUFaA4OUqv9MF
	VcwlAAvoMo2C+7eN9vU561W5Za8EJESsHth7xUr7l8nvsmSIePVsvhGSzXr3b7ampK62SO0Xok4+C
	9CgF0NzcKKXdYK3LwTlhh0UlZI54k+MdlanXVt7FNt3ocXK0xQMtk9PfO0ioypbwFHcDyucPKG9MH
	q2+52Ol2UGhBOb00EcxUOylF//fPtfyL8cTiIGwGsXSQ7FU2YOA6G3frKlE6gxZ4RNy1l5Kw+P5pa
	DcwdyGa1+2MzZPWKzWxQHu9ESRmEfFMrJ8H+zKEthdn8lfqA+1j85riD6UraXqKieWMYDaZ1C172w
	ZggjFBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1d0B-0000000Dmo3-2yWz;
	Wed, 02 Sep 2026 04:55:11 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1d09-0000000Dmnc-2Cxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:55:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1188A11D4B1;
	Wed, 02 Sep 2026 06:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788324898;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0Bq3n+d6CqRiWka+r6Puyq82APtewnlh2hBeOLFbC3w=;
	b=SGde+sPNe3xV7Zvq3omYCHqKEviYf3ImreWf67FsFcpVfK8ba7uKTmKD/t1cdTz7OBrDVr
	xDwsRYs1brjC8zgueF/G26DeI5AKj0IKpD6k5SwN/0iDw2A4AdE11CpxEsKCEHQbNOjXqN
	th+7z0KqS1s2tFAVNq1FGi9kifc/xwjMJEyFzJjtnSnQL2RgsdxgHnHVUrzGDlBUvsgkM6
	4898Cb3e+yA9hcnVgpCpahwgM917+137PJfNH9wQmi8v6qO1m3jTraWv5zq/APdqcQiYQM
	V2rUwv9+cB7C1dNdcTsHb3LRc3MGi+tKLqLbCLUYG/5T8Xlnuuu2Tyi/9n8EMA==
Message-ID: <ba70e613-0be8-2655-f750-c96f1e35b87a@nabladev.com>
Date: Wed, 2 Sep 2026 06:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>,
 linux-gpio@vger.kernel.org
References: <20260810062105.299808-1-hs@nabladev.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <20260810062105.299808-1-hs@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_215509_923114_EE8032DD 
X-CRM114-Status: GOOD (  39.20  )
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

Hi!

On 10.08.26 08:20, Heiko Schocher wrote:
> The current driver requests the optional CSI_B and RDWR_B GPIOs but
> only configures their initial output state and never changes them
> afterwards. As a result, CSI_B and RDWR_B remain inactive or active
> throughout the configuration process.
> 
> This may work on systems with a single FPGA where these signals do not
> need to be controlled by software, or where the signals are configured
> to their active state. But this does not not support systems with
> multiple FPGAs sharing a SelectMAP interface.
> 
> On systems with multiple FPGAs sharing the same SelectMAP data bus,
> the driver must deassert this signals in probe, and actively control
> them during configuration.
> 
> CSI_B (Chip Select, active low) selects the target FPGA. It is asserted
> before configuration data is transferred and deasserted afterwards so
> that only the intended device responds to bus transactions.
> 
> RDWR_B (Read/Write, active low) controls the transfer direction on the
> SelectMAP interface. A low level selects write cycles, while a high
> level selects read cycles. During FPGA configuration the driver drives
> RDWR_B low before transferring the bitstream and restores it to its
> reading (high state) afterwards.
> 
> With that info from the datasheet the driver is now changed to:
> 
> - deassert the CSI_B and RDWR_B pin on probe and store the
>    optional GPIO descriptors in private driver data.
> 
> - toggle both signals around the configuration data transfer
> 
> This allows multiple FPGAs to safely share a single SelectMAP interface.
> 
> Signed-off-by: Heiko Schocher <hs@nabladev.com>
> ---
> 
> Changes in v4:
> - add comments from Xu Yulin
>    replace wrong gpiod_set_raw_value() with gpiod_set_value()
>    deassert CSI_B and RDWR_B in probe as in patch version 2
>    rework commit message (correct the description what current
>    driver do on probe), why this is not a problem with one
>    FPGA, and why it needs a change if you have N FPGAs
>    sharing the same selectmap Interface (clk and data pins).
> 
> Changes in v3:
> - use 0 (deasserted state) and 1 (asserted state) in gpio_set_value()
>    as commented from Micahl
> - rewrite commit message as requested from Xu Yilun
>    - describe what rdwr_b and csi_b do, and why this change is needed
>      for more than one FPGA.
> - add comment before asserting the signals, why they are asserted
>    in this order.
> 
> Changes in v2:
> - add comments from Michal
>    - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
>      as validate_desc() checks this in gpiod_set_value() call.
>    - initialize the gpio variables csi_b/rdwr_b immediately with
>      the return value from devm_gpiod_get_optional(), so we can
>      drop local gpio variable at all
> 
>   drivers/fpga/xilinx-selectmap.c | 36 ++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)

gentle ping.

Any updates, comments on this patch?

Thanks!

bye,
Heiko
> 
> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
> index d0cbb5fdfe3a..e9b1d15ca054 100644
> --- a/drivers/fpga/xilinx-selectmap.c
> +++ b/drivers/fpga/xilinx-selectmap.c
> @@ -19,6 +19,8 @@
>   struct xilinx_selectmap_conf {
>   	struct xilinx_fpga_core core;
>   	void __iomem *base;
> +	struct gpio_desc *csi_b;
> +	struct gpio_desc *rdwr_b;
>   };
>   
>   #define to_xilinx_selectmap_conf(obj) \
> @@ -30,16 +32,30 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>   	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>   	size_t i;
>   
> +	/*
> +	 * Assert CSI_B and select write mode.
> +	 *
> +	 * UG570 states in note 4 in Figure "Continuous x8 SelectMAP Data
> +	 * Loading", RDWR_B should be asserted before CSI_B to avoid
> +	 * causing an ABORT on the next CCLK.
> +	 *
> +	 * To be sure, set first RDWR_B pin before activate CSI_B
> +	 */
> +	gpiod_set_value(conf->rdwr_b, 1);
> +	gpiod_set_value(conf->csi_b, 1);
> +
>   	for (i = 0; i < count; ++i)
>   		writeb(buf[i], conf->base);
>   
> +	gpiod_set_value(conf->csi_b, 0);
> +	gpiod_set_value(conf->rdwr_b, 0);
> +
>   	return 0;
>   }
>   
>   static int xilinx_selectmap_probe(struct platform_device *pdev)
>   {
>   	struct xilinx_selectmap_conf *conf;
> -	struct gpio_desc *gpio;
>   	void __iomem *base;
>   
>   	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
> @@ -55,16 +71,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>   				     "ioremap error\n");
>   	conf->base = base;
>   
> -	/* CSI_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	/* CSI_B is active low, deassert signal */
> +	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
> +					      GPIOD_OUT_LOW);
> +	if (IS_ERR(conf->csi_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
>   				     "Failed to get CSI_B gpio\n");
>   
> -	/* RDWR_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	/* RDWR_B is active low, deassert signal */
> +	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(conf->rdwr_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
>   				     "Failed to get RDWR_B gpio\n");
>   
>   	return xilinx_core_probe(&conf->core);
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> 

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

