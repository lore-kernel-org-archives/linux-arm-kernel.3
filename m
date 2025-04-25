Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCFDC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivd78KmDTpQQYR3V4iqZRpcBAqYRLEDV/deWqE8MYC8=; b=th1hubdDocih9opIXFuxKx0X1T
	rhJoDxaHbYtfxJXg8JsqE1Id9rPSI44fKoGxQzaQSyIdW8Lgp7pyNR21lVwUa5Q23djPKj9jhVqLM
	B4QoLOGpHg5jlZwwRrRFii0HbAO3QuX9hiC6cDoHaYuZONZFKlrd/Z3SOreAfwWlvOH2bevH0gnUg
	ts90nhQMf8OyoE9hyW4SJeWynOujuyBZcqcFIs8ThXevZYAYrbgkklzASvuAj60ko35A09AMf4VOh
	jhEGyfG9HBVjVN6dVOxCJ5XV5tkeiwMnI52YbOpCYFjWCdvMQFFScXzLy3YfoLSD+iun7UWB4RM9i
	u0FLxJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ctx-0000000G6Vx-1DNp;
	Fri, 25 Apr 2025 06:51:09 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Cs6-0000000G6H9-3Lue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 06:49:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3035738a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745563753; x=1746168553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivd78KmDTpQQYR3V4iqZRpcBAqYRLEDV/deWqE8MYC8=;
        b=GEvfyQRJGdlogfo8b+w7cV7QaHHfaZpw8YUY7Q0A///r4oT/ycF3lz4YzVIqtzt6rk
         P9os/WAUz3UY8feAvwTbj0o0tAjc1sigOuEMbU8Mv/FcuHTYrlLNaXcYjzxano2W5WEu
         /XtRqlJzsZTlAptRfEz9EMNtSNZxBAP1v5u0N5mOS9S8blNmW5mvVz7gAXKG9uyXAOCs
         /aLtLM65zYR3kJFDRCE61wYwb+8AtmxWy15XtBcTPoStFRemXjspiCj4atAETyNO+9Ta
         YcIp/fNmYnVeJTWUGTUgG7NhKjhv+r1H5VPwGXWkH7qkTRihOn6B2boNOUYG6xBBboZI
         mHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745563753; x=1746168553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivd78KmDTpQQYR3V4iqZRpcBAqYRLEDV/deWqE8MYC8=;
        b=Ty8Ikt7EwpuZP+Rfvvr0JGzk01+3PNWqjwqffqXHeTlfjb8ZaCj27zH4IGKE++NgXH
         cGPaNA/u/VGFDK+FTEBCjYRzNnt9McbN51BMSOscwgrh+TnCtTxuia5zqoYo9MMPSiCc
         9LTu+PieppkVB3skieCCh2h6PBf3yANuLPws4xkf9vyGwD83lM/mXDm773dY5SzhKQYC
         U4OR3kb6dX8X/KhQinrmLK8UkeE9a7pdCpy7Hqt7s4ELlTrKJSMuNeiIJ6jCAsauoWAQ
         bYcPZsHMlLODPTEVZoIbV5n4AuIdpj1cAJ+p0qoXHN+pJhCw1ZaurkcnPMgzwsqOVOVS
         i07Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCPFpnx35dMv5nxLICWFSHC6wOGpumEf6xyJnxUjxPN+T//yID4uSxtX/mlq9hbcfH/82onXre9VSq8USswse5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz2TitMSnJ2trBFOKKn8dxCrdPnBwR07hO1IUxf4BYY2pzeyOB
	HNOZZ115bpfBxNqp3qrUBhsOjlEU4wIfuT35kIRjMpRfbN+XvGa+4FCOohb1NQc=
X-Gm-Gg: ASbGncvSXTdr6U33EK8+o9d0e5TOAr4tF1R9q30cU2fkfDR6yQPhGKSYpUe6d+fH+Wc
	CNUjhs5b03COqWcOApaMIGYZV9qIaHIuzmq54+mKoyKcWaoNjH6qLZ5hYcPCB+8b8iRFubdazwd
	5pTbbjw5D2loxulH8dHRA3+GOQ36m/Zbgog7AsPfxNia7CWtXdQtp1NuLh0hE8yD0p9hVcTvb4h
	0aAHRjh0OK2B39cOhv8Ew0SXF1aEw4huzwXh7fuDeif40w2ECpcnQdbRS7Zzq2Y4RPF3Ws2poi3
	ZTTVNF/hGoPEnzxAfljkjI3pHU/sOAaFhwVIwQ==
X-Google-Smtp-Source: AGHT+IGQNb36uoK9bF0qPR/AsAvXCwScqxDy/6siJaen64B0+GB2PNVnR8JlA8SrrEexTfvIVgUYKQ==
X-Received: by 2002:a17:907:7283:b0:ac4:169:3664 with SMTP id a640c23a62f3a-ace71177806mr107959666b.33.1745563752925;
        Thu, 24 Apr 2025 23:49:12 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm81776366b.168.2025.04.24.23.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:49:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:49:10 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aAswZg9s41s/m/se@linaro.org>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_234914_858267_7448378A 
X-CRM114-Status: GOOD (  31.82  )
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

On 25-04-21 15:00:13, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization

Nitpick: Drop the double space from the beginning of each phrase.

> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 3cfb4c9d3d10dce49bb93b241f9b56c75b934601..5d55ed0bd198d786d31d5dbee8f32e6fbed875a9 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -167,6 +167,16 @@ config PHY_QCOM_UNIPHY_PCIE_28LP
>  	  handles PHY initialization, clock management required after
>  	  resetting the hardware and power management.
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
>  config PHY_QCOM_USB_HS
>  	tristate "Qualcomm USB HS PHY module"
>  	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 42038bc30974a376bb2e3749d57d0518a82c35fe..4a5907816c65ec15b85e1fa5d22003ee8e2a3e97 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
>  obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
> +obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8746218914afbd814ca90639edd8e2cf47ff99f1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
> +#include <linux/regulator/consumer.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +#define SLEEPM				BIT(0)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +#define POR				BIT(1)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define SIDDQ_SEL			BIT(1)
> +#define SIDDQ				BIT(2)
> +#define FSEL				GENMASK(6, 4)
> +#define FSEL_38_4_MHZ_VAL		(0x6)
> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +#define USB2_SUSPEND_N			BIT(2)
> +#define USB2_SUSPEND_N_SEL		BIT(3)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define UTMI_PHY_CMN_CTRL_OVERRIDE_EN	BIT(1)
> +
> +#define USB_PHY_CFG1			(0x154)
> +#define PLL_EN				BIT(0)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +#define FSEL_SEL			BIT(0)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define HSTX_PE				GENMASK(3, 2)
> +
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define HSTX_SWING			GENMASK(3, 0)
> +
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define HSTX_SLEW			GENMASK(2, 0)
> +
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +#define PLL_LOCK_TIME			GENMASK(1, 0)
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
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, PLL_LOCK_TIME, 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, SLEEPM, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ_SEL, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0),
> +};
> +
> +static const struct regulator_bulk_data m31_eusb_phy_vregs[] = {
> +	{ .supply = "vdd" },
> +	{ .supply = "vdda12" },
> +};
> +
> +#define M31_EUSB_NUM_VREGS		ARRAY_SIZE(m31_eusb_phy_vregs)
> +
> +struct m31eusb2_phy {
> +	struct phy			 *phy;
> +	void __iomem			 *base;
> +	const struct m31_eusb2_priv_data *data;
> +	enum phy_mode			 mode;
> +
> +	struct regulator_bulk_data	 *vregs;
> +	struct clk			 *clk;
> +	struct reset_control		 *reset;
> +
> +	struct phy			 *repeater;
> +};
> +
> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +				       const struct m31_phy_tbl_entry *tbl,
> +				       int num)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +			tbl->off, tbl->mask, tbl->val);
> +
> +		ret = m31eusb2_phy_write_readback(phy->base,
> +						   tbl->off, tbl->mask,
> +						   tbl->val << __ffs(tbl->mask));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_set_mode(struct phy *uphy, enum phy_mode mode, int submode)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	phy->mode = mode;
> +
> +	return phy_set_mode_ext(phy->repeater, mode, submode);
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
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
> +	ret = clk_prepare_enable(phy->clk);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}
> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	m31eusb2_phy_write_readback(phy->base,
> +				     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +				     FIELD_PREP(FSEL, data->fsel));
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_exit(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	clk_disable_unprepare(phy->clk);
> +	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
> +	phy_exit(phy->repeater);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init		= m31eusb2_phy_init,
> +	.exit		= m31eusb2_phy_exit,
> +	.set_mode	= m31eusb2_phy_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	data = device_get_match_data(dev);
> +	if (IS_ERR(data))
> +		return -EINVAL;
> +	phy->data = data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(phy->reset))
> +		return PTR_ERR(phy->reset);
> +
> +	phy->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy->clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk),
> +				     "failed to get clk\n");
> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
> +					    m31_eusb_phy_vregs, &phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
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
> +MODULE_AUTHOR("Wesley Cheng <quic_wcheng@quicinc.com>");
> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.48.1
> 
> 

