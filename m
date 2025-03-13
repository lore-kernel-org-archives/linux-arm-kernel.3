Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB075C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhFJsw8uawrCjQJevU/7j+bAkPgtLqvzMAQJU5JD9+8=; b=usYzr+NnD1qqR5WCloaUA69tOl
	aCGJOznf/IqDuhwgsoA5UFuxTXkr4me/ECLeY7C29pHYNfNPq4PUnGPZ8I+VTFD7qpsVYhppt5wyZ
	DX/VO7q0TgTQcLoGIWY3iIBW6OAzMaT44CWpLoSfIS/F1HhZFRygWu5mdObdM0KqWgtF53GeY2x7H
	Zi7pXde0sG4HwApOCyVqNnfOyvf8asqaT9G0KuwNmkz8a+KUo6fdhb7DA3o3LQWnp2qIhKQtgO9fX
	KMgevQfFRUoEq69L2e9HI4G4/Dqcg5RvWUu1VkPFTavNaxk+B1BSXPWlSqZy61XPM/711p2fSW7s+
	CL3JzTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn2E-0000000C9Ve-37oh;
	Thu, 13 Mar 2025 18:11:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmbZ-0000000C4rG-1wrg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:44:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso2700163a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741887864; x=1742492664; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NhFJsw8uawrCjQJevU/7j+bAkPgtLqvzMAQJU5JD9+8=;
        b=UMyovoRr/XHNRqeQbDKXkDCYdoyG67h5eisFkjTElaBszbiTUOz3CfknhxelWHZM5P
         erwlk8/RZoQDMh7HWilQuHZMmAhEFVOUHjQ/FAvjELl02BA8SpgKKYXBaUmf84s99qnO
         p7ZNX/QqocWI9U0crgvjwwa/gh3UCBDh28x/6Y/+jNZAym3DkWpbhGsL469LbsULO2zn
         h2UGxyuM6bR6MZtTyXs5t+/FPFk39UtcTMp41J9KpZ3HsFAbyunbVF2nTbXlOOrbuuFC
         ng9mk58sEL5Ok6XFJQuMI4rD2JuEBilNl5XubJK5B4bgHIh3D300r4UNgn8MAgm7nUwI
         HAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887864; x=1742492664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhFJsw8uawrCjQJevU/7j+bAkPgtLqvzMAQJU5JD9+8=;
        b=U9YfgMx55dJoQdYpmdavSBrXw0H8aFq6QQct1NpxlF8h3C49KN8FKrk8mptGb3OWQn
         MjeLP9rDYfQjHY+3pQOfmF0rNZru91QMUX8BuSA7Ui86x3LhKCVfYeNuJhTL9kAIkLKV
         iGSq4SBhhUhjm6Y73WjReGyjYK34boQIekd4F3heoJXCC9YTXexRgg0gJTRPoTA7Rr+8
         P7mCcsBjE0eS9OvrMu8lW6729ZakCi0ZCTpgdpzk5UVodcbeQrPsILJetaQdk6IJ0SP5
         EPjL9panTy93mPf9IGWxgihDmxm2S2q7Qeo5qLEnqcaeTqfQfrT4nDuPj11aDHdfqaGu
         znHw==
X-Forwarded-Encrypted: i=1; AJvYcCXekd0rN/UzOPUrPfL/d1rr5U4VviTUVEROtG6PXVAF4L3RHH6Cgn8C34w56LBjt9j05JTFCWGkg01nlvlfvF+E@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfQIty/mDBzhtUe2Ng/XY+NF+addLiw4NlsnwHnBHual90GE4
	z7W0hbJIBW1znfxsmE3fVNeK7PdVaof9jMO6q56cqQIzDcTvblWrETIER3aNUg==
X-Gm-Gg: ASbGnctMEhQDFQCCZJRG2/091LtSVvlHFqGX6JzYckyVQYwE8MD9cyB3er4Lp/GM5zU
	465bamOcY7SsaQqYLrG+eN4FSxcl65EG4M8clQ1hF2vtb61GdGFyMV2jJHn60lOqOlKQObDRsvg
	n8a1niQqTL+26sm4xMKLUsDBMf70ragFyA8nwBIJSXxg2Rx+Sivn7aTDOwttEzStvGDTFmKvkpV
	KpCx8/cPqMobNezIx1b3wgO7/07Pzq+1mDoojJ7bJPuXHyFlTu6fUIWiMhMDRdU0G5areSwdZeP
	ukU4K3ZRihJhErjAhvDEmpTBnjFgEexi32RiY00OkwT7dFXblZYFbQ==
X-Google-Smtp-Source: AGHT+IEaq+Fi1cGt0rAKa6Fc1r8aIz7Paw4eI3nREquhMURMlKswOymRbr7ex68I++4IhbW37kjVlQ==
X-Received: by 2002:a17:90b:54c4:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-3014e8619f7mr487146a91.19.1741887864312;
        Thu, 13 Mar 2025 10:44:24 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30138b4751fsm1670259a91.12.2025.03.13.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:44:23 -0700 (PDT)
Date: Thu, 13 Mar 2025 23:14:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 1/4] PCI: cadence: Add support to build pcie-cadence
 library as a kernel module
Message-ID: <20250313174416.n3c4srf6hb2l3bvg@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_104425_511062_A97E1EF4 
X-CRM114-Status: GOOD (  16.01  )
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

On Fri, Mar 07, 2025 at 04:01:25PM +0530, Siddharth Vadapalli wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
> 
> Currently, the Cadence PCIe controller driver can be built as a built-in
> module only. Since PCIe functionality is not a necessity for booting, add
> support to build the Cadence PCIe driver as a loadable module as well.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  drivers/pci/controller/cadence/Kconfig             |  6 +++---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c   |  6 ++++++
>  drivers/pci/controller/cadence/pcie-cadence-host.c |  9 +++++++++
>  drivers/pci/controller/cadence/pcie-cadence.c      | 12 ++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h      |  4 ++--
>  5 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 8a0044bb3989..82b58096eea0 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
>  	depends on PCI
>  
>  config PCIE_CADENCE
> -	bool
> +	tristate
>  
>  config PCIE_CADENCE_HOST
> -	bool
> +	tristate
>  	depends on OF
>  	select IRQ_DOMAIN

Even though this was added earlier, looks like not needed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

