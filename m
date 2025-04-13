Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2290EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=; b=iwyYOd6k3cUQ8pI6vmKeg1BTmc
	HL0Swhie8hytQXdqaQCg+r3z38/1u9uh8Nc1u8a6lWUylCOz99esIMCkrmdgZaJTFUrmhuGDCh7bf
	pf7oCgRY/qMELkZiPocr5L/I/jy61KuvjmJT7tJPqwQw8Gs0R5StTWr1t9hFP3qE4eE0N5m/qdyUJ
	8BqYqfr/PVH6cac4nKD8Ub58tySAWjt6GSppQ2RVQMK8ZJVwWyy8OWQ1IicCui1K18HJuarKOCQS/
	UC5AEcdu7dKN3DsY6HfmKZmjQg500UBnc9jhs0SZ5mPhVnsTIrT4tcXSEpGFv28I0nXxzJOqHg3BH
	FTP/rkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z2o-0000000HJNZ-3Vgx;
	Sun, 13 Apr 2025 15:14:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z0x-0000000HJGG-316f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:12:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2243803b776so49836335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557175; x=1745161975; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=zQcEqnzigXt5dqL1fSGtaMdSNiSUvyg2+9Qz+YrhwLrNMQpKv1U6d9CbQzvBhxB2TD
         u5mnfYJJYj5W/s4K+gGvOQvwrhq7yfX+oDoWOQ3ZUgjd8C3HI+LN8lRNgzsxzBifT4x5
         3MCfs8TPfQfOIGHYees3xT1PssyESGlpRCsM23VgmD4OMl8gtBZEdON7hH1LhXikqynW
         nzdxPq1ZOuf4mTstXDnFK7W7LuVOYSVYYq/u8NkdoXmhk7svIynC6zhZu+51XybK72/a
         d0it0tBXbMSLHyF762qJJOBG9llSEO01y4q2eYNgp0jBCm6ID/eHESiGraeeOnaWqV6p
         oLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557175; x=1745161975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=ik7BV8vx0Eqn1CwMNygrO9TdDPMsJFgr6WPjUL0TRLzVonzmG5NK4FE2wNkBgF6eab
         NuFBeyVnzBaY3X/lWP9+za0ZrRwaeWSQN4nycqqXs1Gz++pggVDHVhZwpYl5vPuUY2w3
         sgkMUxfZP51wH5/vMORIgph4mkb4wvz4l4lx4Hbad5x8+CTdMVL7xS1CXevLH1AT/rSw
         ZCoMhTeNlh699fsFP9aQYPtHQtwWFAYVpWGPr/gFnQ5UHAd3ljuf9HGJ0bN3l+HMJKvV
         KEyLTZJm2zhzVGFEcvQepY+ZWS3zx4iWOSAHHQTgLDzdwIwQ6+Fx5fWMxBq80kBZ/Hxf
         uI+w==
X-Forwarded-Encrypted: i=1; AJvYcCU6fcyNcZLQ1s5gNbGcB2wnCjbke3eDaJOKEH4mgpDgRUbb9Sw26zMfddMjIa982xJ1G0VgFEbNlPs7T5fR8Xx/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5noBjP1uQPZfJhlTQ0Qd+T48q3kiAuv7ZBBLJ0wUC5M47huRc
	Wqnq9c9hqM/FSbVtnxKqsECLYdlk7QsJHvEmNTegf8rDKESeBohT5zAP98g4rw==
X-Gm-Gg: ASbGncvoVYG80YONLl5IhiZT6aTK79v5sZDU2E8nVdvPj/DQP99LcZhoi5+NkK6Tyyz
	GvEbfKVapFQ2HJzs22lIgSYGjWI9YNZF6TPMpD3XhZOdWZ7SSBVnPO0N9t52EfUtbEdd4FmPfb0
	HwNFYdVg5HUFps+Op+9eRfNnav9Tjf8OANCmFccYiJsvPmAPWqOroR/S6w3879VL6YPv03Fgj5A
	Bu47lOFaU+U1krQWophtppT/JQFekcUorPzFGycGWEyYY199NiQi8EyXPkNW+ZU9nyrLHWtoMt4
	6K3j4KFxoqP19eEVgLroXt453tbLOIL4C5jR1EifjZ43PZ5Vc5w0
X-Google-Smtp-Source: AGHT+IEl1mfp4h8joqe88PR+eqAgq+GkZLNrPfPvCZVzAzUCEhJOKuX/kTRe8Qw9Vvxua7aCf7iBqA==
X-Received: by 2002:a17:902:d484:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22bea4ab6abmr108986985ad.17.1744557174513;
        Sun, 13 Apr 2025 08:12:54 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm9589319a91.46.2025.04.13.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:12:53 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:42:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in
 workaround link training
Message-ID: <2hbtwy3tfzip7dglixhcipaykxxg3ph6hy3bwn5ujmvj75mwvy@6qcqptbakkey>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_081255_773295_AF7B280C 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Apr 08, 2025 at 10:59:25AM +0800, Richard Zhu wrote:
> Remove one reduntant dw_pcie_wait_for_link() in link traning workaround
> because common framework already do that.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a4c0714c6468..c5871c3d4194 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -881,11 +881,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	/* Start LTSSM. */
>  	imx_pcie_ltssm_enable(dev);
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		goto err_reset_phy;
> -
>  	if (pci->max_link_speed > 1) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			goto err_reset_phy;
> +
>  		/* Allow faster modes after the link is up */
>  		dw_pcie_dbi_ro_wr_en(pci);
>  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> @@ -907,17 +907,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  			dev_err(dev, "Failed to bring link up!\n");
>  			goto err_reset_phy;
>  		}
> -
> -		/* Make sure link training is finished as well! */
> -		ret = dw_pcie_wait_for_link(pci);
> -		if (ret)
> -			goto err_reset_phy;
>  	} else {
>  		dev_info(dev, "Link: Only Gen1 is enabled\n");
>  	}
>  
> -	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
> -	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
>  	return 0;
>  
>  err_reset_phy:
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

