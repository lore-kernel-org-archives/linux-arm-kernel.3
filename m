Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0756EC02184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkbyPek4ikd/zfWm4/dF+evoWpKWcc5LjrmdhY3sgPk=; b=hNx/oJJXkPJ5jMqK2b05nt6C7T
	jog8/HU68pPlm/BmwB/CxMm1fKnmjthixKudUhw7zSgjSt7cn4jtVkmwEnB7hSbyeApBA7bA0zHPI
	fDMIOMfWy86lHzJtV5FVq0e2FGP5JKoRItptWu15nWeLztxeJiiLGaYuUYob1IIoM8kyOV7JjIJra
	bQ+Dlu1LvlQXuugYphaPyx1/9xL4vWi2RmGlDzC7lCNvq9fwxGDnb6smMskCcuGUGckig0u7xG1sF
	y3lqD/jxWIK7X2eJhfzXT7iNXSHGzgAjtuKnbipbl7i1UA6BqgHa3Uhit9jtLA850AZh+pLgXxBcL
	tkjhIpjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcl6-00000007tF7-2kHd;
	Tue, 14 Jan 2025 08:58:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcjq-00000007t8a-2yFh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 08:57:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37058795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736845049; x=1737449849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkbyPek4ikd/zfWm4/dF+evoWpKWcc5LjrmdhY3sgPk=;
        b=DnHXroqbnKA4ZcMTUGj6gSDYt4TXxDP5aruQW3fnE0A+lb7c8HF+aCylSJq4HcFRmL
         pgeEn9TpnD5OnrK8n/k3Dm9Yqrcmdq5iHz9wlGEWFEXXcLPGGp80Nf6o+AJ0HL3jl+8g
         /YOch454yKhu0GJVpaE1fD2UAI+S+INaYMZj1HTqpEizdn0XI6dI2ID0Ch9Nwh11hf8Y
         HKaSHyl4XjeqgJq87YnV6c4RViVbihF/ws/AqhGDQoPlagKnw7Z9+URAMSWMRkhnjmqW
         9pVTlktejOLVrdGe+84baHXwUZQchDyMS1lLK01A5AfEsSHza+aFWOlUpLl/Ju0Zjcy4
         qR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845049; x=1737449849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkbyPek4ikd/zfWm4/dF+evoWpKWcc5LjrmdhY3sgPk=;
        b=g4oYIZjUug1vZtb8vgBiy3Gxq+uYJYF69WJR3qs1sT8DlL34zb/xhCe8f2GypZi1nb
         ONWadWnHrRiPm0TedAwi2KemvQ3GMpAr50pPf+5BOi25pr7pIsy13ebAJhDtoFU+ej6r
         zS+tA01Y73gUGuFsjnNr0RYijLH/4+s7volm5eATyo0ZFebHaAyqSo2e8qB/aJocwA4q
         5rUMjEb+9/3ccSDDfZ/w1lJch5GSfuWZVRMl748dXqgVuZoYdT2X4+q32vN5v0b6Mn8t
         Gy/7BWL8o1vHWP8E5VbjUZy/rhtSC5o7Ipch0Xo1UdIMYnDe4Sial/5TF1fIq3Vzhe3v
         oQnA==
X-Forwarded-Encrypted: i=1; AJvYcCWSgklD7Yq9BZikHYjVT1LzuxX/jS3t6jcFycWyhdXUf3c1QC/SbhlorqmskfvymII6ZmWibdGGMUgvRTSy+0lH@lists.infradead.org
X-Gm-Message-State: AOJu0YzOrtyYKv025QpnjkEKLrsId6YtUtzD/mfTvr3KLq8OAp31dgfB
	sAqd2Bfwmb7jAlGjMYoVBJs2MoV+QrRUyN2tvN6TWEcIdyZTqbRxR/rwvvxAjYM=
X-Gm-Gg: ASbGnctSdApiehSXPtE9X3E1FTBFKOh6PoBOZ9IDdwZBBM1Wnsr7I7pR5haIPKjKzMq
	eqag1shl6KWRSQrW4gVocZKo61ClE4MKQAgotpUareWkpafaKqlslucuuFRHIxG+wZvq2agGzHy
	PczriYGt+y4Ss5vSKjxN9lunVu0arfNq+9hJ8q840ddAXuNlBAx7pVAPnhvsw728kMYm0yqmRKt
	NizqJwDHp868qcWU5EFVoghPE+qUj+aMqRNtGqAEOowpmOy7aqPfbg5PBCd/YZP1P/e+AsaoJtb
	tUwbtx6dW4+LjcTNVA2CD06xtHOQxQOfMg==
X-Google-Smtp-Source: AGHT+IGKdF4rSeZyNHxQDPMFUvUCZQHiGgOlVyiokrjzhFfjZf2+fwkH2q15v5w5nBnv49AbL+PvMA==
X-Received: by 2002:a05:600c:a08b:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-436e26dda73mr181588405e9.24.1736845049023;
        Tue, 14 Jan 2025 00:57:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5df:aa69:5642:11b5? ([2a01:e0a:982:cbb0:a5df:aa69:5642:11b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62333sm165614595e9.36.2025.01.14.00.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 00:57:28 -0800 (PST)
Message-ID: <7e97c953-5eb9-4b04-b5fc-d5436a4cb0c4@linaro.org>
Date: Tue, 14 Jan 2025 09:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_005730_786966_6F33939E 
X-CRM114-Status: GOOD (  33.81  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 13/01/2025 22:52, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> sequences to bring it out of reset, and to initialize the associated eUSB2
> repeater as well.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>   drivers/phy/qualcomm/Kconfig              |  12 +-
>   drivers/phy/qualcomm/Makefile             |   1 +
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>   3 files changed, 281 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 846f8c99547fd5132feaa1e41093b8eab51714f9..8c265ae86c7b9ddcb66b42626557ea130b674001 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -140,7 +140,7 @@ config PHY_QCOM_EUSB2_REPEATER
>   	select GENERIC_PHY
>   	help
>   	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
> -	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
> +	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy

This should be a separate patch

>   	  on Qualcomm SOCs.
>   
>   config PHY_QCOM_M31_USB
> @@ -154,6 +154,16 @@ config PHY_QCOM_M31_USB
>   	  management. This driver is required even for peripheral only or
>   	  host only mode configurations.
>   
> +config PHY_QCOM_M31_EUSB
> +	tristate "Qualcomm M31 eUSB2 PHY driver support"
> +	depends on USB && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support M31 EUSB2 PHY transceivers on Qualcomm
> +	  chips with DWC3 USB core. It supports initializing and cleaning
> +	  up of the associated USB repeater that is paired with the eUSB2
> +	  PHY.
> +
>   config PHY_QCOM_USB_HS
>   	tristate "Qualcomm USB HS PHY module"
>   	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index eb60e950ad53334a3ada3db618aa584afb33fb93..f88ba0f71a73cd6935184c8831d6cd6488d6551f 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
>   obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>   obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
> +obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
>   obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>   
>   obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define FSEL				(0x7 << 4)
> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)
> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define USB_PHY_CFG1			(0x154)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +
> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
> +{				\
> +	.off = o,		\
> +	.mask = b,		\
> +	.val = v,		\
> +}
> +
> +struct m31_phy_tbl_entry {
> +	u32 off;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct m31_eusb2_priv_data {
> +	const struct m31_phy_tbl_entry	*setup_seq;
> +	unsigned int			setup_seq_nregs;
> +	const struct m31_phy_tbl_entry	*override_seq;
> +	unsigned int			override_seq_nregs;
> +	const struct m31_phy_tbl_entry	*reset_seq;
> +	unsigned int			reset_seq_nregs;
> +	unsigned int			fsel;
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> +};
> +
> +struct m31eusb2_phy {
> +	struct phy			*phy;
> +	void __iomem			*base;
> +	const struct m31_eusb2_priv_data	*data;
> +
> +	struct regulator		*vreg;
> +	struct clk			*clk;
> +	struct reset_control		*reset;
> +
> +	struct phy *repeater;
> +};
> +
> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)

The function should be named like the other: m31eusb2_phy_write_readback

> +{
> +	u32 write_val, tmp = readl_relaxed(base + offset);
> +
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val)
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);

Perhaps propagate this error ?

> +}
> +
> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +					const struct m31_phy_tbl_entry *tbl,
> +					int num)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +					tbl->off, tbl->mask, tbl->val);
> +
> +		msm_m31_eusb2_write_readback(phy->base,
> +					tbl->off, tbl->mask,
> +					tbl->val << __ffs(tbl->mask));

Ditto

> +	}
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_enable(phy->vreg);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}

Useless code, seems you removed a function call and forgot to remote the error check

> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	msm_m31_eusb2_write_readback(phy->base,
> +					USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +					data->fsel);
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_disable(phy->vreg);
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_exit(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	regulator_disable(phy->vreg);
> +	phy_exit(phy->repeater);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init	= m31eusb2_phy_init,
> +	.exit	= m31eusb2_phy_exit,
> +	.owner		= THIS_MODULE,

Spurious spaces

> +};
> +
> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	data = of_device_get_match_data(dev);
> +	if (IS_ERR(data))
> +		return -EINVAL;
> +	phy->data = data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->reset = devm_reset_control_get_exclusive_by_index(dev, 0);
> +	if (IS_ERR(phy->reset))
> +		return PTR_ERR(phy->reset);
> +
> +	phy->clk = devm_clk_get(dev, NULL);
> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	phy->vreg = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(phy->vreg))
> +		return dev_err_probe(dev, PTR_ERR(phy->vreg),
> +				     "failed to get vreg\n");
> +
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_info(dev, "Registered M31 USB phy\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct m31_eusb2_priv_data m31_eusb_v1_data = {
> +	.setup_seq = m31_eusb2_setup_tbl,
> +	.setup_seq_nregs = ARRAY_SIZE(m31_eusb2_setup_tbl),
> +	.override_seq = m31_eusb_phy_override_tbl,
> +	.override_seq_nregs = ARRAY_SIZE(m31_eusb_phy_override_tbl),
> +	.reset_seq = m31_eusb_phy_reset_tbl,
> +	.reset_seq_nregs = ARRAY_SIZE(m31_eusb_phy_reset_tbl),
> +	.fsel = FSEL_38_4_MHZ_VAL,
> +};
> +
> +static const struct of_device_id m31eusb2_phy_id_table[] = {
> +	{ .compatible = "qcom,sm8750-m31-eusb2-phy", .data = &m31_eusb_v1_data },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, m31eusb2_phy_id_table);
> +
> +static struct platform_driver m31eusb2_phy_driver = {
> +	.probe = m31eusb2_phy_probe,
> +	.driver = {
> +		.name = "qcom-m31eusb2-phy",
> +		.of_match_table = m31eusb2_phy_id_table,
> +	},
> +};
> +
> +module_platform_driver(m31eusb2_phy_driver);
> +
> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");
> 

Thanks,
Neil

