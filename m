Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C493BC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBpFdjJKRK2wPZJQzSRTw4eJ4hUT7j61gGfvcZ13EGg=; b=ziQmP3eGM58lrR6FerIx1P2eM7
	RjeKbN2ePKVFdyIZCRAI6NbeDlHyZYOaLT49RMefmyzuWCwRNgFWoINdQWNsmCzhlI0canxhEJix6
	7R+bWrHC9s7d8/mESxw/fBHT3BgaasiuV9lOfEZuccwJOz9pO9YdMwterU2K4nMhb5CKQjkF3Fuxe
	QxHxMf/vkp2UJMOrgSyr0b+EJ5eOwaPiEiacswTMgvJ1FiU9Y2ZZh+2A6sphQxF0CMuFP3WxF+vs5
	wlJuZlo4Wi7JlDnLUTLbIuLcpdNWAoOLLO2QEdbTTE/3X1Wt8fqyDyiMMHXbagWPCVg2+q8pC9VRX
	nEmcsvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrk2-00000005GDH-0EF2;
	Wed, 02 Apr 2025 06:38:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzriH-00000005G7Q-0M0x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 06:36:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22423adf751so118512205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743575796; x=1744180596; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBpFdjJKRK2wPZJQzSRTw4eJ4hUT7j61gGfvcZ13EGg=;
        b=POl2yD13y7ZUhjn6k/2n0fZSN/dZLkwGFMZm4KWRyiJt6v/vidtGktSRBuS9q97mJo
         RW+fORMrFWTf1y0g7XNLu9KAAbha2ecI1yCzd4/6tPVetac9dkRAMhepUfk+2TfveoLb
         trGF+TQW+Il2pyRjfHQemb/Ftnh8/2mWV0A/Tl8k2pD6pQW4rsXtn8b724y5rk3dLian
         tno+ef7DIP1fEraCC9px5tIkYyeFP6VEUGFlJxaFOVApUO2BSqaxdQSuy+XKVqmluMDP
         vq8dKWY3VQQW4Hi2icsZCz6C3+EEJXIGfvYLW5n5eDmFF4+61/jazZMTg2ebIMQBI8EE
         MYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575796; x=1744180596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBpFdjJKRK2wPZJQzSRTw4eJ4hUT7j61gGfvcZ13EGg=;
        b=puAZXbNxnQFGSDHx5eytLqXTg/KZ5RK5JB8pWh1L5EzWWD+9e9M9Xr71O3L47gERsg
         KEJ034uOGVm9ae49s0vfFerZVW6k1XFeV0uXNBSqY2GoUlmYfNAjz2pzEgfi4JNTOCR/
         L2GU+lFZasi+kjVhgp7eZ4GME1l2fFpjfzyf6+cJAx/A44ctvMXHdN7kWu/6wl8HQCeh
         5k0xcRboQUUMih/EzHnzG25wOOMwc0XWwyv3w7tWdz8zDTQeMB3xXYi5iaenXjcRz45Z
         TJzYHHoj+D5zxZ1Rt1Gr5Nqm0hLLfZSTQWXQW8niPz8C3hxPAWxrC4KqBXpeiUu2WZPh
         +NDg==
X-Forwarded-Encrypted: i=1; AJvYcCUoBKv+Yl6fs5Tv5z6tIMWqX5L1dJ3nGBt6gOTMfc+U6FmYVYhsipRGwgN4DmIoAVmZZC692/l0bcS+2oBvi5i0@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGBl3WlSgfS22h/edJ2EVKE/nxm3pHoYQ37jZAisicoYvgM37
	R4qvliymiL4z1HaW8F5RJqMqml1UWJfdPfs+Z7P+cq3VqUyFnoqprcByKs4S5A==
X-Gm-Gg: ASbGncsprlf9ctlbL5QoMW81gcN+jlTJYsVactaKlYZRw2OEn2xiQ2I1K74wMqtAG0q
	Gr8zV2ffTZO5+oJ4Vd5ma6NEPIEXyHH4hwI/9E4XHUBMDqNCCauACZnBQ5qhTx1x3oe0ab90I1A
	tRW5+VLVnzAhwxpHWma0+251XFqVuopEL6es1sfdKOAVb8nvEqgwpZq5ShbtybyqTdCHVdbe4uR
	5AmQM5I2j0XBXXX6olqzL0Fpxxc+2BrK743PRfAd4wpqWBK0xw83DG4j6QDeZ+j01qwF6SFwdy+
	WI0iaDevRNM8wK3nshYxbWaNkt/Na/2wABfQwFmVvfpROmZuDzP3Pjve
X-Google-Smtp-Source: AGHT+IE6fEQRPpZTuVLgYtn/kGTPJXOscRmOwPKgic6LUNeFQjJDmRybRlM29Dg7FxrNgKq/c8uH3g==
X-Received: by 2002:a05:6a00:1704:b0:736:51ab:7ae1 with SMTP id d2e1a72fcca58-739b60fb6a5mr7052602b3a.16.1743575796230;
        Tue, 01 Apr 2025 23:36:36 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22356sm10115837b3a.39.2025.04.01.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:36:35 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:06:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
Message-ID: <fatfobrf53l3ngps3rl67gayhnlsqncgd2tabgcspac3n3o4xt@a4yrmtvaitai>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_233637_249222_000932BA 
X-CRM114-Status: GOOD (  21.50  )
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

On Fri, Mar 28, 2025 at 11:02:09AM +0800, Richard Zhu wrote:
> Add the cold reset toggle for i.MX95 PCIe to align PHY's power up sequency.

What do you mean by 'cold' reset? Is it 'core' reset? I see both terminologies
used in the code.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 57aa777231ae..6051b3b5928f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -71,6 +71,9 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_RST_CTRL			0x3010
> +#define IMX95_PCIE_COLD_RST			BIT(0)
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -773,6 +776,43 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> +static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +{
> +	u32 val;
> +
> +	if (assert) {
> +		/*
> +		 * From i.MX95 PCIe PHY perspective, the COLD reset toggle
> +		 * should be complete after power-up by the following sequence.
> +		 *                 > 10us(at power-up)
> +		 *                 > 10ns(warm reset)
> +		 *               |<------------>|
> +		 *                ______________
> +		 * phy_reset ____/              \________________
> +		 *                                   ____________
> +		 * ref_clk_en_______________________/
> +		 * Toggle COLD reset aligned with this sequence for i.MX95 PCIe.
> +		 */
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				IMX95_PCIE_COLD_RST);

Is this really COLD reset? Or CORE reset?

> +		/*
> +		 * To make sure delay enough time, do regmap_read_bypassed
> +		 * before udelay(). Since udelay() might not use MMIO, and cause
> +		 * delay time less than setting value.
> +		 */

This comment could be rephrased:

		/*
		 * Make sure the write to IMX95_PCIE_RST_CTRL is flushed to the
		 * hardware by doing a read. Otherwise, there is no guarantee
		 * that the write has reached the hardware before udelay().
		 */

- Mani

-- 
மணிவண்ணன் சதாசிவம்

