Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=; b=bp9pX+sPIV7Bc0yPWWAqBazMBZ
	z6Wt2FipvYmHAXHVW+9yaL0AQ2dZ+l4L/3+QJGVl9Y2QFaHjXikWkOueiM1Q6Gi7Zjzw6Bz8stotU
	5eRrQBGIZknOdjLnqGMdzQmce+PTvxMRHXhsxH/KB8Tkjt9InpVi5bJN5ub1nBMjWDfx2HxXD/3jR
	u/2BuLFZTkubM9ktGMB/6bXS40QdfRekkJYm70G3F0sPXRPFZVPy53RA/tVb43gposnWB09W9oMeu
	QTkM5bIVipLmmkPFb3MqsM8bSEumDC6+Is+sD8puEGJhknvf1HGeej5jzuT5j3mY/K9tnoqLzKLH1
	EvJMs/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpuq-00000001x8y-3d4Q;
	Mon, 06 Jan 2025 16:25:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpte-00000001wpi-0NUj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:24:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216281bc30fso242041875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736180645; x=1736785445; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=;
        b=a8YqZcEBrSR5DNAWXAOaDNYxazV4j7vZYZSzwBaviqqkIwTtgx4nwwSqQTZfZ5vhPG
         n8Y0hqAkdRP3NCO85LG+tp4tSITwomPR5yrjEcbiTchQoWqsdKbPZ3vJ8heXEfvNyMbv
         DjTnQF7kWVNZG//3n2KVUe5lRlaifYoUhmda2agY1TrVhBalmVPKzqLsuOLKwHWkFHxy
         uGW8VqTIWQgQuy9/4xmS2db5DZI5+sFtrhJZwBtXIRui62H6094eqx2cSDKmJiE+rzTl
         6GPzeE/tZV9a6t4EFJTTTd9Wf0n9pDwNS8sxFXsLaOoUjpi4g/la3BJtJBtfdI5k+sYT
         cSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180645; x=1736785445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=;
        b=ER7nbTo3UIwmwCHY9ufrLEQa9SJ+WpZwGOhKtNMngOsLU2bawdxNSD1RqmfcgN1zST
         kX9vXrK93uj/CccWMU6PRwvXZGUZPUJFjahMIUG9Tft7no89BNXgOiYCGPq6p8UJrgan
         YcT40RDUd2VY7HgOTO+BkF9CBmnCj6nTUxpsM02tRG4DZi98D0WV5Qdk2xHThdSJWZTw
         Pd6WTJeWyfV8vNP6ZBJsaQIGasP/xet/BSKMG4Av8bLJkEy/XUQFgHyGlIokUgSmP25G
         Prb7DAXPZunadt+c/Zrs4Jx7J7c0swAmPWCUfDvMfA65ZZ2FJ9Z/J4Doh1+qFeim8YLq
         QSbg==
X-Forwarded-Encrypted: i=1; AJvYcCUQJj9ikGDVWNoen7OvZWAbHk0Onki8zPylKFq3snw0BBpyIyeG65c6AqmNLBda65n7+gpaUbi/FgmKvXz5lELn@lists.infradead.org
X-Gm-Message-State: AOJu0YycYd0xC8nkEO5qNexMXVQomNMrTTgFMGtkCEFcadr57P+m74GO
	c55sHANUAzfsoU/p6jl6pZ8kdPgprJRGrXC7vO88XADPPkbY5ng/+Japq1pOYw==
X-Gm-Gg: ASbGnctSK7VaMTfHfHs3D0wA+xyO7SqgZLhVyFa0azIWVSBdrl34tuSl4eT5LT111tE
	4JZvwl67NHWznn7WjlsHghVKU26+4OobZ8WLY0m5DLP2yPQ4h55AHdELf0mfP76W+4FvcH/MYJW
	Nbp0mekV4117dc0mCbJPMJNQGQR6vofbDdUKyFRlg36SLOG1CC5RdkUrwb+V+BRG1aKnYThySZa
	7ZOpTF/UPF9mPRJf9TdEevZDJ+gMNbtzmpW5A28tkrHzFbkcT0s6kufNmev5KD5ogU=
X-Google-Smtp-Source: AGHT+IFdRHlYP1im5zetO+/SjNKJaY5KNYN5HfbqNmxIWZ26dMrClumWmmikkawZQrxTttP5oKteOA==
X-Received: by 2002:a05:6a00:1706:b0:726:f7c9:7b36 with SMTP id d2e1a72fcca58-72abdd7bacdmr98645349b3a.8.1736180645400;
        Mon, 06 Jan 2025 08:24:05 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm31660071b3a.116.2025.01.06.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:24:04 -0800 (PST)
Date: Mon, 6 Jan 2025 21:53:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 5/5] PCI: mediatek-gen3: Keep PCIe power and clocks if
 suspend-to-idle
Message-ID: <20250106162352.neo5pkunbdakizar@thinkpad>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103060035.30688-6-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_082406_943501_BED51A2C 
X-CRM114-Status: GOOD (  23.28  )
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

On Fri, Jan 03, 2025 at 02:00:15PM +0800, Jianjun Wang wrote:
> If the target system sleep state is suspend-to-idle, the bridge is
> supposed to stay in D0, and the framework will not help to restore its
> configuration space, so keep its power and clocks during suspend.
> 
> It's recommended to enable L1ss support, so the link can be changed to
> L1.2 state during suspend.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 48f83c2d91f7..11da68910502 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1291,6 +1291,19 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * If the target system sleep state is suspend-to-idle, the bridge is supposed to stay in
> +	 * D0, and the framework will not help to restore its configuration space, so keep it's
> +	 * power and clocks during suspend.
> +	 *
> +	 * It's recommended to enable L1ss support, so the link can be changed to L1.2 state during
> +	 * suspend.
> +	 */
> +	if (pm_suspend_default_s2idle()) {

I think you need:

	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE) 

here and below.

> +		dev_info(dev, "System enter s2idle state, keep PCIe power and clocks\n");

There is absolutely no reason to print this message every time system suspend
happens. Even dev_dbg() seems unnecessary to me.

- Mani

> +		return 0;
> +	}
> +
>  	/* Trigger link to L2 state */
>  	err = mtk_pcie_turn_off_link(pcie);
>  	if (err) {
> @@ -1316,6 +1329,11 @@ static int mtk_pcie_resume_noirq(struct device *dev)
>  	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
>  	int err;
>  
> +	if (pm_suspend_default_s2idle()) {
> +		dev_info(dev, "System enter s2idle state, no need to reinitialization\n");
> +		return 0;
> +	}
> +
>  	err = pcie->soc->power_up(pcie);
>  	if (err)
>  		return err;
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

