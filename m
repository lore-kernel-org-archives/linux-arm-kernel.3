Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81457C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El4ZtwDBRPvlTZNV7mnxHMdalHn3UlLOeM9l9oVvykA=; b=NzVFkDhR6mMek4QIYxt5lMN93M
	xS5JhALHRQBRYsb6n3ceiO0CIJT2KEfpcvKrhGO6pskNS7li/6fD7Xz3c6uIzDzcnCHZ14pwjOtne
	8I9V/hh25DWFQm0an69asKQTKT4/OunwzqsW7e9wSts4aXJYT2huNDWugrEFf6yfhi0/nv0OYtsLp
	iQ1YWvFje72YesZzc9ANs3Z4zfd8BG8FsrskzJss+3XjtR6/GRl7/rh0WhRk8N6wa3rUHoqQiw3o8
	4zzbXsOUKnJjxaKxV6uzwZof9e3b8jTP+DI+67LqjR/e1n4v2P0dZBrpV5lPpsWxlZhQwz4CQFnX6
	eNQmZwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYKh-00000004ss6-0cba;
	Wed, 23 Jul 2025 12:12:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYI9-00000004sb9-3q0o;
	Wed, 23 Jul 2025 12:09:51 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06899346;
	Wed, 23 Jul 2025 14:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753272547;
	bh=siE8fG3tOa4csUecyxtY0hUOvcCp6sqnC8Vo2a9kR/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTMJFGU14p10/IwOa7/UFpK/pDUt/w7K6xknyd7yj0E+Z+etsPiDRFNQUCPmXeCRc
	 xO2GDyIJ2qefRL/3HeF2X7qhGuXEoxOQsrAqVaaYNzweILJ8gGsfGAktcm8N33fQE+
	 g2MDZwgP3QWB7R+eaOKCLAr4CD+DrN315ufz7ERM=
Date: Wed, 23 Jul 2025 15:09:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
Message-ID: <20250723120942.GB10291@pendragon.ideasonboard.com>
References: <m3h5zbxkc6.fsf@t19.piap.pl>
 <m38qknx939.fsf@t19.piap.pl>
 <175308758352.3134829.9472501038683860006@localhost>
 <m31pq9y98z.fsf@t19.piap.pl>
 <175326599663.2811177.16620980968274114885@localhost>
 <m3seinw1po.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3seinw1po.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_050950_103764_B8626935 
X-CRM114-Status: GOOD (  29.37  )
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

On Wed, Jul 23, 2025 at 02:06:43PM +0200, Krzysztof Hałasa wrote:
> Stefan Klug writes:
> 
> > Just a quick heads up. I ran the tester and so far no unexpected
> > results. I'll run it from time to time after a reboot to see if I ever
> > hit that condition.
> >
> > How does your device tree look like? Any chance the ISP is clocked for
> > overdrive but the device is not or something similar? Although I have a
> > hard time imagining how that would lead to such effects.
> 
> Interesting.
> I tested it on two different devices (a Compulab UCM-based camera and
> a Solidrun Hummingboard Mate) and it's the same on both. I think the
> first one uses 1600 MHz industrial CPU:
> 
> (U-boot) CPU: i.MX8MP[8] rev1.1 at 1200 MHz
> 
> Not sure about the Hummingboard.
> 
> Both cameras apparently are connected to the second MIPI.
> 
> Well... maybe if it's only the second ISP, and there is only one camera,
> then we could reroute the data to the first ISP? The MIPI receiver has
> a crossbar I think.

There's a crossbar switch in the ISI, but the connections from CSI-2
receivers to ISPs are fixed.

Have you tried reporting the issue to NXP ?

> And the other way around: for a test, one could reroute MIPI0 to ISP1.
> Will have a look.
> 
> The DT has the usual stuff (for the second MIPI/ISP):
> 
> &i2c6 {
> 	clock-frequency = <400000>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pinctrl_i2c6>;
> 	single-master;
> 	status = "okay";
> 
> 	imx462_camera@1a {
> 		compatible = "sony,imx462";
> 		reg = <0x1a>;
> 		clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> 		clock-names = "xclk";
> 		clock-frequency = <37125000>;
> 		reset-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> 		status = "okay";
> 
> 		port {
> 			imx462_mipi_ep: endpoint {
> 				data-lanes = <1 2 3 4>;
> 				clock-lanes = <0>;
> 				link-frequencies = /bits/ 64 <222750000 148500000>;
> 				remote-endpoint = <&mipi_csi_1_in>;
> 			};
> 		};
> 	};
> 
> };
> 
> &mipi_csi_1 {
>     status = "okay";
> 
>     ports {
>         port@0 {
>             reg = <0>;
>             mipi_csi_1_in: endpoint {
>                 remote-endpoint = <&imx462_mipi_ep>;
>                 data-lanes = <1 2 3 4>;
>             };
>         };
> 
>         port@1 {
>             reg = <1>;
>             mipi_csi_1_out: endpoint {
>                 remote-endpoint = <&isp_1_in>;
>             };
>         };
>     };
> };
> 
> &isp_1 {
>     status = "okay";
> 
>     ports {
>         port@1 {
>             isp_1_in: endpoint {
>                 bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>                 remote-endpoint = <&mipi_csi_1_out>;
>             };
>         };
>     };
> };
> 
> The CCM registers show basically (p. 229 in i.MX8MP ref manual):
>   8 MEDIA_ISP           mux 7       post 0 SYSTEM_PLL2_DIV2 = 500 MHz
>  20 MEDIA_AXI           mux 1 pre 1 post 0 SYSTEM_PLL2_CLK / 2 = 500 MHz
>  21 MEDIA_APB           mux 2 pre 3 post 0 SYSTEM_PLL1_CLK / 4 = 200 MHz
> 123 MEDIA_MIPI_PHY1_REF mux 0 pre 0 post 0 24M_REF_CLK = 24 MHz
> 125 MEDIA_CAM2_PIX      mux 2 pre 0 post 0 SYSTEM_PLL2_DIV4 = 250 MHz
> 
> The first 3 are at the max values, MEDIA_MIPI_PHY1_REF max is 125 MHz,
> MEDIA_CAM2_PIX max is 266 MHz. Maybe I should try changing these clocks,
> but not sure how do I do that (any change causes rkisp1 driver loading
> to fail). Will look at it.
> 
> BTW the double read and double write in NXP driver (isp-vvcam) were
> introduced by (in their repo):
> 
> Author: hexing <Xing.He@verisilicon.com>  2022-08-05 10:19:49
> Committer: Robby Cai <robby.cai@nxp.com>  2022-08-08 04:50:48
> 
> M865SW-1031: the second isp port jump frames
> 
> Reason:mi read or write reg occasionally it does not take effect
> 
> WorkAround:read or write twice of mi reg
> 
> ---------------------------- vvcam/isp/isp_ioctl.c ----------------------------
> index 60741bd..e0d3048 100644
> @@ -118,5 +118,8 @@ void isp_write_reg(struct isp_ic_dev *dev, u32 offset, u32 val)
>  	if (offset >= ISP_REG_SIZE)
>  		return;
> -	__raw_writel(val, dev->base + offset);
> +	writel(val, dev->base + offset);
> +	if ((offset >= REG_ADDR(mi_mp_y_base_ad_init))
> +		&& (offset <= REG_ADDR(mi_mp_y_pic_size)))
> +		writel(val, dev->base + offset);
>  //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
>  }
> @@ -128,5 +131,8 @@ u32 isp_read_reg(struct isp_ic_dev *dev, u32 offset)
>  	if (offset >= ISP_REG_SIZE)
>  		return 0;
> -	val = __raw_readl(dev->base + offset);
> +	val = readl(dev->base + offset);
> +	if ((offset >= REG_ADDR(mi_mp_y_base_ad_init))
> +		&& (offset <= REG_ADDR(mi_mp_y_pic_size)))
> +		val = readl(dev->base + offset);
>  //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
>  	return val;
> 

-- 
Regards,

Laurent Pinchart

