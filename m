Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EC9CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=; b=EoGdmA25eaB4wKOSaD3ZPe5oMx
	Mtq0nuedVFd9u+wwj2FckVAHiH3ekTOo1WxEmAF6qZyH1pJVQEEyLsF5Iaetjo47vQ1XxShn1Wf2n
	WE+qBJ2MP4Xv7O+P9xNnhDrqPKc/rF3mYoICTpEARZ9g55N/3A40FQ5LP2bKdSvikYgrXR1jLR7VO
	u6seEu06kD5tFDzyvy9McN+VlKHm/8LL846jM5DuV8o7ojJMlaMa7LvEHxGew2pQLMdBxDQ6xxPlU
	qGNCylXJPcRUeFI1aLrJh/GotmjcltD05r0T1LlJegH/7CZEFzWIcg8eeutiwdLGIuSHb44J1b2a4
	1lc9PJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPk-0000000C4fv-1O2d;
	Fri, 02 Oct 2026 16:47:16 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPh-0000000C4ck-3oP4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:47:15 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so12249840a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790959631; x=1791564431; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=OY9XWLzUytL+PtQxkEgt9xNbRZKE8xujXrsel8zwaUPwVDe+Ns7m2gnu9BOnA+oOcg
         bMtJeTOWGFWGRTPUurLPgcUE3F3ewXsjLs+57waOVeF0/52yLdX5ZP5uj1pfN3nxwHoS
         3PwpBujot65yGAqcErjKaUE8vdObDBfG4HX6SxY/Ute+TnRcRdX9M0JC+BN4I+vf4V4K
         St5k8/FCDW0aQk9DBOjU+ZnSO1GyX7UZgrjzM49P6aHcms1DpGzHicOnPkqnKi44loFb
         DQyEoDMLPjs3Uruad3eHUr8GPDKdnDzsxNVD1YvD8PXVr/9XenksuAKWj/HgCKjxFiG3
         cr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959631; x=1791564431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=dvKBQMsWX6L7D8yMydPxeAfctFtIWXObLCyIJ9XNfPRIQQIn24wJ6WJSn9MG64183w
         EgDjLaSq8U+pAERt2RrCG1mdT0reozxCcDxldH0FoQmReydWRm6YduE+6UiG4+vUU24R
         ylu3ptOiIJwDEHWxX9wUMWJMJJcXhgB5lCo1vhcIa6ljh62yzbsWdjisdgk9yKSvtWJR
         uJylBxCU6ld1ZRGvGtb0zTy4tSOBE5CRyxoHBv11WXTkqW4l+3ObrzBBOOrqIMthanGr
         1aqkA+i9ByLAb3Tvl1eFuo0t635GxCvNU4b/X6LcHXcaJ6aMkAegmfqjTCnxixfBnP4T
         bULw==
X-Forwarded-Encrypted: i=1; AKwUvBx7n4DLNfDszrdyPAeueXY08WnjctqEgv7fijpp3cEFNWCTlmVjJrkwwh1xlRffeuWYOugj0MD6IrYgSKORrZd0@lists.infradead.org
X-Gm-Message-State: AFq9FYL4RAcMeGYUdKwl4TLU3YnYKfMs4QElq7yfc2vpBTz/sVaEpXRc
	Wa4dzuKiaClIXpbFNMBydgoggpMwmxg9HkarAPANErrV7w+8SRM+6t4t133GjtcXyhlKnk8+Y41
	/iP1w
X-Gm-Gg: AYBFou0Z9hcHvz9dQq3PaRjW1gPdJLctN4/WkEMGmDjfMuj6MwufMVnNm6CtFUdpSdh
	VOy48ne3rMhllMiVPcfkK6Ccbs+P/TuCqKNvajfrks1vSdesJtf2DXOUtT9fbG0z8A+I/rni4F1
	IidwtZfslEZnEfXIHzLkK7rvCAX9u9TLP80p/M5ljEP2hSyrneh1G0kNsI89+ly7MRZ744sQV5J
	IZvxAC/f02z4IZhrudS51uCuX8zoAGVAJXTDiyLcR9V5sZ0y/le/84ZnosgANeH0xgsmRHZSFVD
	uhfMdHy+eOQlfwPbjagOzplEhmCijbR4PBfeK2vUGYal3aWYDow2hrQCWmp3Uh9E9U1LFQNNESZ
	MWBGLD8tLeOkHzbzgjrRc4qVsjXSSH9/Cowl7pj0Zhfb68n8iI1KJY15Fl/rNNzuwp42vM6hUdY
	zwm2PCM87cdm14i5sr8MFrLqUwV3wPu+Gik0XBFJ/sAzhoURGrZRzXalBTUtfQ14SOEPUii6wZT
	8IVsmwUnY1hVAspp+b0MHP7WGIOg1xP6xCTY4GaRmpurvibvJM=
X-Received: by 2002:a17:907:c02:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c2e4aac822amr274357466b.16.1790959631108;
        Fri, 02 Oct 2026 09:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:599:841:224a:bb33:b9f8:dc3b:fc30? ([2a01:599:841:224a:bb33:b9f8:dc3b:fc30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf680ddsm101999566b.52.2026.10.02.09.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:47:10 -0700 (PDT)
Message-ID: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
Date: Fri, 2 Oct 2026 18:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, ryan_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_094714_242816_15A9ADA1 
X-CRM114-Status: GOOD (  27.94  )
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

On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> Add the AST2600 SCU passthrough selector support used by the
> ASRock Rack B650D4U host power-control circuit. This RFC includes
> the driver, Devicetree binding, and board node to discuss the final
> kernel-facing interface.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

This is definitely not the way how to solve this. I've already said on 
linux-aspeed as well as off-the-list, requesting the GPIO lines is 
enough and enabling GPIOP passthrough here does not make any sense, as 
it would be disabled by pinctrl anyways.
There's a whole implementation in userspace to solve this issue (at 
least if you use OpenBMC). The issue you're facing here is, from my 
point of view, a configuration error, and you'll not solve it with a 
kernel driver that literally just enables GPIOP passthrough...

So my answer to this patch is:
NACKed-by: Tan Siewert <tan.siewert@9elements.com>

> ---
>   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
>   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
>   drivers/soc/aspeed/Kconfig                    |   9 ++
>   drivers/soc/aspeed/Makefile                   |   1 +
>   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
>   5 files changed, 148 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
>   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> new file mode 100644
> index 000000000000..e6451d17955c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASRock Rack B650D4U power passthrough
> +
> +maintainers:
> +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: asrock,b650d4u-power-passthrough
> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - aspeed,scu
> +
> +additionalProperties: false
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> index a4e384588a54..86291c250562 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
>   			size = <0x01000000>;
>   		};
>   	};
> +
> +	host-power-passthrough {
> +		compatible = "asrock,b650d4u-power-passthrough";
> +		aspeed,scu = <&syscon>;
> +	};
>   };
>   
>   &fmc {
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index 11e4db998c06..1b0281e0bfb0 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -58,6 +58,15 @@ config ASPEED_SBC
>   	  Say yes to provide information about the secure boot controller in
>   	  debugfs.
>   
> +config ASPEED_B650D4U_POWER
> +	tristate "ASRock B650D4U host power passthrough"
> +	select REGMAP
> +	select MFD_SYSCON
> +	default ARCH_ASPEED
> +	help
> +	  Enable the AST2600 GPIO passthrough selector used by the
> +	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
> +
>   config ASPEED_XDMA
>   	tristate "ASPEED XDMA Engine Driver"
>   	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index 5f61bb4cc36c..3e9618d1eafc 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
>   obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
>   obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
>   obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
> +obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
>   obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
> diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> new file mode 100644
> index 000000000000..22a6925539dc
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
> +#include <linux/kstrtox.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +
> +#define ASPEED_SCU_PROTECTION        0x000
> +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> +#define ASPEED_SCU_GPIO_ACTION       0x51c
> +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> +
> +static struct regmap *b650d4u_scu;
> +static DEFINE_MUTEX(b650d4u_lock);
> +
> +static int b650d4u_set_passthrough(bool enable)
> +{
> +	int ret;
> +
> +	mutex_lock(&b650d4u_lock);
> +
> +	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> +			   ASPEED_SCU_UNLOCK_KEY);
> +	if (ret) {
> +		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = regmap_update_bits(b650d4u_scu,
> +				 ASPEED_SCU_GPIO_PASSTHROUGH,
> +				 ASPEED_B650D4U_POWER_MASK,
> +				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
> +	if (ret) {
> +		pr_err("B650D4U: passthrough update failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (!enable)
> +		ret = regmap_write(b650d4u_scu,
> +				   ASPEED_SCU_GPIO_ACTION, 0);
> +
> +out:
> +	mutex_unlock(&b650d4u_lock);
> +	return ret;
> +}
> +
> +static ssize_t passthrough_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = b650d4u_set_passthrough(enable);
> +	return ret ? ret : count;
> +}
> +static DEVICE_ATTR_WO(passthrough);
> +
> +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +						      "aspeed,scu");
> +	if (IS_ERR(b650d4u_scu))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> +				     "failed to get AST2600 SCU regmap\n");
> +
> +	ret = b650d4u_set_passthrough(true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable power GPIO passthrough\n");
> +
> +	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to create passthrough control\n");
> +
> +	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
> +	{ .compatible = "asrock,b650d4u-power-passthrough" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> +
> +static struct platform_driver aspeed_b650d4u_power_driver = {
> +	.probe = aspeed_b650d4u_power_probe,
> +	.driver = {
> +		.name = "aspeed-b650d4u-power",
> +		.of_match_table = aspeed_b650d4u_power_of_match,
> +	},
> +};
> +module_platform_driver(aspeed_b650d4u_power_driver);
> +
> +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> +MODULE_LICENSE("GPL");


