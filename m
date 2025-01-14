Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC51FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=; b=iQA2UTGcUpUDTI314HVL0XQZb5
	VBrOgDMfA4xoYiMspP8K/VJvGYJwpZip2PTvGgS6AbPYIxVw+73emGnC3TE0/LyCJkW4AV8XJ+B1d
	/CSDf/pgnhNqZ6xx8ktq4e4vfHIT9EVflq1IfB+npKB08jtp46qSApmT7udSJ0rpfP7Z0xQBXGUvE
	NTD+C5FuHK+tug7vMNJv94SIdwFjNXOiNekTHM/Yl/GoBS/gjuiU8Gc0UtFt+zAdtBM/DLjKajFjP
	TPYwH6qG4n0V1aCl7aoKPaTn06Lgc/RzjKLxtvxZ7yubMYyhpkbIo3IaGZht4PGol0orkyW9l6NnM
	MzTezHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeL0-0000000888S-2ULZ;
	Tue, 14 Jan 2025 10:39:58 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeGB-000000087B9-0zF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:35:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4950953e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736850897; x=1737455697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=JUt9BHMkf3pGpohG/AjwEfRHDl9LAvRbLrt/0qpLaCQ3gKlaL7pas8f8KWqwYc+eKs
         M6qQK0T4bEowM16uxsx0t2mLHSjFCTx54Kh/iDTeX28Rc4QBsKuzR4QZpDX8NTPEkt16
         st+GQke1Inecetwd92in8Hr+wG+iN8D7GDnW7RWBiKFuBYQLJIc8k2RYJ2jKulqId1dg
         D+qul/E56YMnyCqDdkg3Bk9/ZOQdNubyOLPguDzBmlNlrLMDhyXanRvxF7G1zyaCKHwh
         VOPPQYuJHsxFfT6m8IuRcpCWwKC5NQYbH1XHlLScBOPqD9YDhHJgfEceZ+PbvxlXFI6T
         SZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850897; x=1737455697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=p7fFU6OurW0B2xAt18/lVaGRuLAd0ORy2CvhScmzpd9dYmVGXHJA2KDCSG59quGTUG
         YPlI4e/5EWurn9Wh8QFyuixeE9o2geX0dRLEVkhyoj5/6vOAIIUslOQ8nebQ7CenL1cF
         twTbqxKK/pVke/2ZO0+UshTGLi+/0wXFuHdVInbxKuDm3v1BA/CQID1YVo6zxZX9XTN9
         Q3JmjkwR5d0J78TguNnjKkFdvSDKTbROZwapGaCOD7fD2ChxuKtkKcdk2wzjtkQ+3r8y
         7cLZvx2Cn53Hn4Sk3jY3/HAuXOi0Tit+jm1e8yACTuZq2HbBgX8X2vG047SLRJE50AC2
         Hlsw==
X-Forwarded-Encrypted: i=1; AJvYcCW1lUmbxttZMbDehUtePxTox/EuZ6JaJvlcZ5vfwZwDsDY4/polX0aL9Bu5oAQimCWK5e+aBu4gU4T+lgjkes1u@lists.infradead.org
X-Gm-Message-State: AOJu0YxavE5BRrA/vc9whWBXjYQCMZigGwHVuEAr8KZ+p4nY/4jiUDZD
	jYzovlyPPek+kKWj1iPc1rtLpgyh1Eqq9opxceZKZHukvUd+orSSB9lCEPxPDyE=
X-Gm-Gg: ASbGnctJUkh2PET99IAdhlDqKeesH2cpQhUC6l35oJEVSZezuk+n6xWuwUM6w796rpw
	ZVgaODXdvRTaolSIqEn2hq4U68l1kKo+S0f3SQq4gkgbsJI5vxEd0smCx+qf9/KlUR2abKEu7Gi
	16eF19kfdOxMleCieO/jLGETchIQHYGN10OKRTCGfhErR1hBCplm7ced8b0sn9c35ZVFE9VZWVG
	ZSyJEbj1P7oxudmRKqQH8l3Yzri4/QLoMT6heAFeUjaaYjc3DhZYSXEK8e/5EbNmP+mSwFiUnCs
	hsafrejUVRunzdPNA/MnpB4/rgSyhv1GayPE
X-Google-Smtp-Source: AGHT+IFwrbLGTrG2dyiu5uP2+GJnDGK0/StK5LmN5McezpTF9gNRaaageIc+tg7gnEcGTINdnMPa7w==
X-Received: by 2002:a05:6512:ba9:b0:540:2223:9b20 with SMTP id 2adb3069b0e04-542845d1b75mr6413752e87.53.1736850897244;
        Tue, 14 Jan 2025 02:34:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49ee9sm1623927e87.52.2025.01.14.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:34:56 -0800 (PST)
Date: Tue, 14 Jan 2025 12:34:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023459_302530_EED60AA0 
X-CRM114-Status: GOOD (  27.12  )
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

On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> sequences to bring it out of reset, and to initialize the associated eUSB2
> repeater as well.

What does M31 mean? What is the relationship between the eUSB and USB
M31 PHYs?

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  12 +-
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>  3 files changed, 281 insertions(+), 1 deletion(-)

Please run the patch through checkpatch.pl --strict

> 
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

GENMASK()

> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)

FIELD_PREP

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

could you please check, what actually gets written? I suspect there
should be a -1 here.

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

-- 
With best wishes
Dmitry

