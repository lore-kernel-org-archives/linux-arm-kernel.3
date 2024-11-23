Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1368AE6688E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 22:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efE+M3yoqQcQA0x9oHs4amatdhibQCSN4MCbN8A7Lwg=; b=NDlG4unui7iZWNeYzxTTIvWa2l
	qDeOjWdwbVhSZ6kbO0PVv0ddoAXsv+vaDkEbi9O3l8ekX18OS+sTH0OXcnWpq7L+W0AWvIZUVRfDr
	p5PEBAMFWZA6fWGX6yILsyzyXXIgh3sJuu4xLe0DT9LZN3a5PZ+sU0rMHaMR8hKBB6ADMQI8rZ2SI
	448ZlaPipns1INxxM+6MnQ4uQsQB3ZBKDO0T00asL6uSFvIMrhRizb7Sz3rMpKrr5rRI9R1FiqCII
	GJLUTX7gE1i33NZUlzcuPcE931I88evWVovfFEAO7yqeM4RuVeu4BNWx5enxRqxyMKskOQhf1WYN4
	wpuub9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyeH-00000004yQX-0VLE;
	Sat, 23 Nov 2024 22:30:41 +0000
Received: from [52.59.177.22] (helo=smtpbgeu1.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEydC-00000004yFJ-44cS;
	Sat, 23 Nov 2024 22:29:43 +0000
X-QQ-mid: bizesmtpip4t1732400922t0vaiy3
X-QQ-Originating-IP: lDJQcHGmgBgcXATVztEHXy/UIVbd5/CbMKaLCYIJt3Y=
Received: from [IPV6:240f:10b:7440:1:bec2:7020 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Nov 2024 06:28:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16923298256935240573
Message-ID: <7F8BEC114E3AF523+2ad7c5ce-ca20-4ea0-9a37-15b07ad2cbcc@radxa.com>
Date: Sun, 24 Nov 2024 07:28:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: rockchip: naneng-combphy: fix phy reset
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Zimmermann <sigmaepsilon92@gmail.com>
References: <20241122073006.99309-1-amadeus@jmu.edu.cn>
 <20241122073006.99309-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241122073006.99309-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M5aCtjAndv5O13Z/VZi4XiKKD5ROoi6OTgPdUTAi8dPJWNIr+tNiTH2l
	+Qob2Si7IonXxSHU+5BPbgviiuN/mkXXPPYo7ki4sdnRYYVBsOMxufxhv6Z8olgr9s1xCvS
	Oy840M71xjlTz9X4U58tfrXIVTtgObY4FHaZtV3aBdFI1s+pC7c+Oh4reB/fjN2R9RYWR5B
	C5YfsYHY9MldaBzUxHQ5u4V7J2elnQmwQ6tVWU9DBUKDgcLCVsARynko1ad99F6+k00/6F7
	acvk99Dn1KSXZNdfJ/MxD9M4/fwxcxu4pUA8M8q/y6FWsa03MInDbqlL8up3GdDs+6cXwyO
	dYfzDFJ6MA7XtxD3Fpl5zLgG04jNGKWfN/bbGV+45RUn7jTLHrbs3Fn/44vEZM5R9P85l5p
	yq3rLqeODJMzOPWW6k85xi7L9UcQpqj0ahrfOPAwmim0ghw91d7drRTQRT/fiQwdO2pslve
	YHafR7oRhqsXwwyvTicaptHc2zPtzxjXuvUV2c+ZbiMQYs76IbQYpOqUXAYa/lZlKrzfYSb
	Ru5gt8DCFgdlJ4lM66NUKvJBtJhGmWmHOztRmydej/y0sYL+QbEsksYVHWx+rFnXAiPjmlP
	SiRgb+3eXfVlwT3myizobfMIpScIXdK3zAEbLy/I4SQB8MklLT4zYurKgn7Y5OywmVvg0H2
	qC1Eg1r0hq/LLPb7jrGRSJ5HWg6wNDhck4yIn2GN8XNGHmAZmEjBzl6OvCwSDg3Sm0U6vcL
	uHIPheMOH4abOzoOPqRfuUnbDN0MZGlQS+L+XVP51882+r6zENgeYwlSFavs0X7dAwP/GUD
	uSboF4as5mwdCaFNmo4Vf+nVj/Ma/qXBzEO1ohWe3aPN3Ovvjn4RnRLrckuDTEx45NeV8kS
	kAoNgejVSHxRkKiCKPt1TgIRugLfS1Zm
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_142935_498933_3F0ED102 
X-CRM114-Status: GOOD (  13.84  )
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

Hi,

On 11/22/24 16:30, Chukun Pan wrote:
> Currently, the USB port via combophy on the RK3528/RK3588 SoC is broken.
> 
>    usb usb8-port1: Cannot enable. Maybe the USB cable is bad?
> 
> This is due to the combphy of RK3528/RK3588 SoC has multiple resets, but
> only "phy resets" need assert and deassert, "apb resets" don't need.
> So change the driver to only match the phy resets, which is also what
> the vendor kernel does.
> 
> Fixes: 7160820d742a ("phy: rockchip: add naneng combo phy for RK3568")
> Cc: FUKAUMI Naoki <naoki@radxa.com>
> Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Tested-by: FUKAUMI Naoki <naoki@radxa.com>

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> ---
>   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 0a9989e41237..2eb3329ca23f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -309,7 +309,7 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>   
>   	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>   
> -	priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
> +	priv->phy_rst = devm_reset_control_get(dev, "phy");
>   	if (IS_ERR(priv->phy_rst))
>   		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>   


