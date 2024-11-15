Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB19D6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/1UwVe3Qsy2MB0A1h4O60dSR7MLmU1E1u1iWJ0FEAI=; b=M8U7ArS5u7RaBAVjcNKcaO2Rnp
	MnLqo62E3bdn+/JjMGYvsEmlGOH9ekkMA4wC0rHCR8jPHH5RKpHcf74EAg9X+CkE6bULQT8urAO9N
	Ll61kSyoBgcZQJ+jauyXxjZQ4gwzkRYEl96JUNFBZjJYRVJ3Z3corhu78ecNrJccMDdijQUDzADEe
	xN4rOcmIPhXzHOenKyOf4d111QE5O25/cBIGfdHO7bfWZ78+ETGl+BunzLoR3BGCcO/4jRQePZFKj
	HP3FN0Qx9/I4/RdKFcYJepQ+xtgQXRse6yXWuOpt46xv5un1/N14NkTwjbolN14LbgNuW30BfwXiU
	OVbhzwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqCv-00000001qSp-1O3H;
	Fri, 15 Nov 2024 06:53:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqBz-00000001qHZ-0xli
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:52:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-723db2798caso1311943b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653550; x=1732258350; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4/1UwVe3Qsy2MB0A1h4O60dSR7MLmU1E1u1iWJ0FEAI=;
        b=YA4BigHyiLyc5YduomUOMfUsPluI/kHe+qJYas75zH4Hgx0jY6wM1fZEHQV/HHkzjd
         w/MGq09MC0ITTnN0RqrpaPg1gLyCu8F9sNFszxwuRSzFHLxiTDeGN+V2QjU9ryfs1rk2
         8OSssxNMU63GQPeevsd2rzx+U4nQ0sjJG86fb9DPpY8872f8l71F+k8zaMXPOvO3zD71
         UtQoWeGrUuHVnhsaauJ9VjRL1EzVNr+5yljGfPwqtVmS+mX8RF96ry9e2rc75Nd5QuNA
         lxeQNmx0yT0iuGbSgIT3ZDzxgbnh1IMFOA8o65TOFYaNEE3C+rumGc4LU/tCYaRm0JP4
         z+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653550; x=1732258350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/1UwVe3Qsy2MB0A1h4O60dSR7MLmU1E1u1iWJ0FEAI=;
        b=a5815fMjXHq705zFeXRvFgXDef5AZMbEupLLqbUCMFIyKrzeOINBpUptuzOrCb2dPT
         M6MWOxLV9cg6b57kvc4QZpuZCishFiQmZPovpwPyGGvf2BHQtQFmDSlPyKNITib5yYSZ
         efThzLNmrgxFqiXDdYLh6Z8V/QdCyTNKq8MpE6jooQ6l0md7V6f0Tj1o95pM3XlGW+tQ
         pF+6W8wGYuZ/T3AVpJmKkof/QGQ/kdYRMIN53dcRcEIMpn2nMjjvAbaa06SRx2UvN3CC
         ioie3nmLetAsctq+0rwMyruXYrQ36B9ZrjeQiq3SBcpgrrhhWsKwNpAvBEAGhtWWZZvL
         pz9g==
X-Forwarded-Encrypted: i=1; AJvYcCVFgRsl2hA3rsFWJYJSNyoabtoO+9BDNrh6pI0cEt6TV/fPd5oVPoCkKndfiSlOc2hvt3hM6pm7DvllqdTX1wN/@lists.infradead.org
X-Gm-Message-State: AOJu0YwGr5i/CfV8uSEvh91GO8699uPWmyQdL8x6h6fod8rfdF2Baw1T
	65Zb9Kv/QeUs9A7Iby0L9ykH4nHXfp4vtz/ALWx18G/VmuCfYyhbF3qlATjo2Q==
X-Google-Smtp-Source: AGHT+IE/YBLChBCuslucF1k1xTrQEVYs0lhSpDpzi5LeohRmyIqqfR8TDB+1oTszXaCrfQURCH52AQ==
X-Received: by 2002:a05:6a00:998:b0:71e:44f6:6900 with SMTP id d2e1a72fcca58-72476cfc9a9mr1771780b3a.16.1731653550107;
        Thu, 14 Nov 2024 22:52:30 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711c0cfsm690383b3a.51.2024.11.14.22.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:52:29 -0800 (PST)
Date: Fri, 15 Nov 2024 12:22:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
 deassertion symmetric
Message-ID: <20241115065221.scfb2chnoetpdzu6@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-6-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-6-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_225231_300469_D236DB6F 
X-CRM114-Status: GOOD (  19.91  )
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

On Fri, Nov 01, 2024 at 03:06:05PM +0800, Richard Zhu wrote:
> Add apps_reset deassertion in the imx_pcie_deassert_core_reset(). Let it be
> symmetric with imx_pcie_assert_core_reset().
> 
> In the commit first introduced apps_reset, apps_reset is asserted in
> imx6_pcie_assert_core_reset(), but it is de-asserted in another place, in

I'd suggest rewording like below to make it easy to understand,

"PCI: imx6: Deassert apps_reset in imx_pcie_assert_core_reset()

Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it should be
deasserted in imx_pcie_deassert_core_reset()."

> stead of the according symmetric function imx6_pcie_deassert_core_reset().
> 
> Use this patch to fix it, and make core reset assertion deasertion
> symmetric.
> 
> Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

With above change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 996333e9017d..54039d2760d5 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -772,6 +772,7 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_deassert(imx_pcie->pciephy_reset);
> +	reset_control_deassert(imx_pcie->apps_reset);
>  
>  	if (imx_pcie->drvdata->core_reset)
>  		imx_pcie->drvdata->core_reset(imx_pcie, false);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

