Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE78D6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MYYRbyHSKnkKj/U1ajnAZh9FgwdbjyrEbwmDmiOJ74=; b=pJmqjLupLe6M7S/xHcLv9wDvtW
	6JwSfN91RQKUx/hbl4NRq6k80h85iVusFj+JuBSa7SVaLICGILaCKcfTcw4lmQBqAsneA2FBdl24L
	f7JLn/Ry6jCNZ/2VzZzdYcs5OsGtqmVONYOt6GhQ90FuTM6gVFc3wAE+P4nTrIHWOwNEszBO6BRB6
	j4yV+ot4EtNfuez7sTWj7UpUVlFf41MNn5sAD4rx5fB6Uaa4oF8+wcLPUHZC6kyzL3C7jaO5VlDgD
	gS80rnrgl/zdxQi4i/4f1lPUg27n4QMk+jOIfOg0OG0f1a+OrO/eZ056b63kEi3bcY9mhhIYlfbfl
	bFY/T0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBq4D-00000001pJm-1BjE;
	Fri, 15 Nov 2024 06:44:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBq3I-00000001p8g-2584
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:43:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-720d01caa66so398251b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653011; x=1732257811; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MYYRbyHSKnkKj/U1ajnAZh9FgwdbjyrEbwmDmiOJ74=;
        b=mId3xWHmo35C6F9gDEDV6pXxFI8DRIFbdvPZjlhXkgagNWWDmaNUlDAfg1PCoAQ58i
         m3r27ILoVByPNdhmxqOaIxSNk6zv+XEE3ofxS4oyAqSHabl8mj12aMNCfLe1Bk08eBb4
         wGUo36MnweCErzEkOB8uQn8cRXmAuLPWnbM3LbE6H/ATpPhCOFwBEoF//KDmVvVmfkNe
         WzgkIzOLQKxrY4eJYmKCHUtB8axFwG8Ec3fwgEBeNsLQG3awDLpV45u9WHlDVT4uAxou
         Ia/pDz0+jJuWn8ul0AOhLhS+ZYOUU0ca4EMr6b3KHeNuU9LInkFay5qqMOEZHEwHfX5R
         FqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653011; x=1732257811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MYYRbyHSKnkKj/U1ajnAZh9FgwdbjyrEbwmDmiOJ74=;
        b=on6r7JVRxj2k1rPSkuHnFJbv/xZ2KGhii1AGzT/KxB7ej727xFdCKxwVWip83A5CSu
         QY1L12gWyIx16v9i9F3q6bq5bD9e8RNmlDkjo7qV6xTrrLHoJ0pM+/xAjcCF1ZZUKPRf
         KVZtcfTSVOrSH238Bjcp+dn3A1QvX5DAmRq9Y1RQqN7ZNX29DulS9+iJYj2DkKsbEjvX
         lnvOjuMlG202CRPhgZnsHrG9Y7m/z4zo93RI/ZFmtLUweJ3qEashTxbbInhSGzfaaxw3
         ma/vErC9W6zMNgbEE9/WDulUHzr/eMkMuGv3NqmBbLnFTbz4KpcYZL1efBJNtg1YPv34
         2EAw==
X-Forwarded-Encrypted: i=1; AJvYcCWslHOY4UG7Z6HvfxZYp+wMKHcVR42jXOOMTyzNlrN3FYyaUHJFLSMuuf/M1yqnO43fiCpAVaNMOPDA+pQMUSKB@lists.infradead.org
X-Gm-Message-State: AOJu0YwkDzMRt47oX2ixsUesOQmZdSLiTwiKbSUtO+FN8sgtHv3BgXM4
	+z6hzHurSdetkVDW5W5rmeKQlLpJnAP/aAVed94OQiu2xWB6C6qrB8eR/opzkQ==
X-Google-Smtp-Source: AGHT+IHY6v9j5fvHwvuygpXSp/ldJste9oxVxyRTDqgsgbIZ7G245t9I6FYAct4vrO9HjSZAZqBz4Q==
X-Received: by 2002:a05:6a00:22c8:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72476b872c4mr2212375b3a.6.1731653011440;
        Thu, 14 Nov 2024 22:43:31 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee7d3sm673330b3a.38.2024.11.14.22.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:43:31 -0800 (PST)
Date: Fri, 15 Nov 2024 12:13:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
 logic for i.MX7D
Message-ID: <20241115064321.3cuqng7bzmphiomw@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-5-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_224332_541354_FAB602B2 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Nov 01, 2024 at 03:06:04PM +0800, Richard Zhu wrote:
> i.MX7D only has one PCIe controller, so controller_id should always be 0.
> The previous code is incorrect although yielding the correct result. Fix by
> removing IMX7D from the switch case branch.
> 

Worth adding a fixes tag?

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> "This is just *wrong*. You cannot hardcode the MMIO address in the driver.
> Even though this code is old, you should fix it instead of building on top
> of it.
> 
> - Mani"
> 
> IMX7D here is wrong athough check IMX8MQ_PCIE2_BASE_ADDR is not good
> method. Previously try to use 'linux,pci-domain' to replace this check
> logic. Need more discussion to improve it and keep old compatiblity.
> Let's fix this code error firstly.

I really hope that you'll fix it asap.

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 462decd1d589..996333e9017d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1342,7 +1342,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	switch (imx_pcie->drvdata->variant) {
>  	case IMX8MQ:
>  	case IMX8MQ_EP:
> -	case IMX7D:
>  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
>  			imx_pcie->controller_id = 1;
>  		break;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

