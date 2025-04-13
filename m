Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=; b=vaDfW4x2O3xf0qFJ61004BhXGh
	NQVIQ+OV87VEXCiTSvX4WDs9B9DYcIt5/IT3zrSamm/vdv0GxrVDWaqp0vgPCcskDATO5BmGAk07U
	a/rMr6ibDPf5JAUd/7ROrRkcQCoVy7VkiBTpgiqYqvrTrAyBZudMKOGGZwQjY25OyrI0j8AgziBSV
	k+QLRg+s4jfXlGbxL1VFT9/xC/I/5Izp5ISdbXZvSjrI+SzddYWxyIlBh1A5GfzV1zcMWfvjQJGQp
	t+49SP6vkJOa+KXtsMxooXfugKG784eA81ENeLf/PCcOQwZJCaXNHllkQCyNp+YeHKCSkuQxbFfVv
	Jt1uxVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40r6-0000000HQ6K-0RSI;
	Sun, 13 Apr 2025 17:10:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40o8-0000000HPnI-0the
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:07:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223f4c06e9fso33010505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564067; x=1745168867; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=JdmKsE67/Aibgke5cUIMYM8O7D8Wq/NEw54PysydUjwXPhYXjkm55uOTMwVJd0ZhCw
         lbYc5KfOeQlZtRaOw6aYbPyqOxHSctVlOalpQcgELeZfIwEcpKhU8YU1X4dOArEA59Ep
         BGxpmMxyTCr828PBIxP9dnduCMnaYhFho899hawjEth7B7TnkqQp4wrFwjS3wj34XNZq
         gtRxZYAB3o/qDtwnIRsx19UxnsJvs56wMFrHWmeXeb8ZRIb+i7qNwZPJQjhgb+NAYfUW
         PNSMj7GMOhRRT7KUpx86m6mxSuEh2eyglhgSkFDuCKLeQzV3Dfm3kgO3Bo5y56CqS/35
         pvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564067; x=1745168867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=RGe+v0peTL1MEYsAfNtuwDkibuJNtfdXYXmBkqzEcU6F9Fh+CCc4XMunS/mQWeq1B8
         tr3sbZqMfouYpzW8HDWCbbFnnnFj9dq680kmtoxhNYh6kKPvNN8YhVozC9Y/nK/1rD2A
         EB+MnSzLshA591BTMUnHxiVPPYqOcYCjkQkk4MT959Hz/2OfT0pML/9xjQ7/JlROel4W
         ZQFqVVPWFjv+YsShYQhlzmMv2Xe0hblcTrK0ptm/LGRVMnpKIrs70cK87Q12G1f8aa1L
         7llnyp4ttPeNC4bWqWKC6NRlQ3AwzI3st9NrVz8dd7jasiVB+AwkKfFnTZr8YKKmE89Y
         N+Yw==
X-Gm-Message-State: AOJu0YyrFGS/lteOujZkUAYiAyucjNt7dg/PQWdsSBuzrmYtbkaDQLcS
	g/dXvx4CPQ3vxENdpcJxoHx2Xj3YK6bGcjLzrlkemVurrQu8DpKEpCcd6XrASxKh6UPAoWzztRo
	=
X-Gm-Gg: ASbGnctYZ0DUSYxTSeACHkxC9faL3H4T9ihJ/35zhAKunJvBSQXJulJB+PNYdQ8tzt+
	NRelPglCdVt5FcwwVekGbmDxWIpnDUkjd/I9qlzKOb4Jo/xpY+vnjx0rKbDzn6J8Dz/T6eAq5KA
	9vrDXwMvTDKkTqDhgnC6mjHgum86uJAn+E464/1e4DB4ehjNnJVuWL/mJMrDbBveCnYEeqQ+SKE
	NqQlhScDqE2xC0BgpBElmFyoEnnw7zSC6gaJ7kZnnK5+XOHLfe+2NiDn+fSHYZpHdPPmkIOT4/Z
	Ska85iy75ZfyOTHdASeCxBizw1CWSL5/iqwJsPIKknhEARjXpdCj
X-Google-Smtp-Source: AGHT+IE+gbJeUC8MORyPLq+yv1/hRBnQsVunUtWyIkSWfGWZQvtHnS9GTR0o+MdzAbYHUke6iYn5sA==
X-Received: by 2002:a17:903:1c9:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22b7eaa3209mr205867575ad.16.1744564066784;
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cbasm84608565ad.133.2025.04.13.10.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:37:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 06/13] PCI: apple: Dynamically allocate RID-to_SID
 bitmap
Message-ID: <vcoczq6foe3mikun3o5oqhawbu6ixfjfljnare32olmwxw63xj@zznl6iefhhxu>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_100748_253409_5B572411 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, Apr 01, 2025 at 10:17:06AM +0100, Marc Zyngier wrote:
> As we move towards supporting SoCs with varying RID-to-SID mapping
> capabilities, turn the static SID tracking bitmap into a dynamically
> allocated one. The current allocation size is still the same, but
> that's about to change.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index d07e488051290..6d3aa186d9c5f 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -147,7 +147,7 @@ struct apple_pcie_port {
>  	void __iomem		*base;
>  	struct irq_domain	*domain;
>  	struct list_head	entry;
> -	DECLARE_BITMAP(sid_map, MAX_RID2SID);
> +	unsigned long		*sid_map;
>  	int			sid_map_sz;
>  	int			idx;
>  };
> @@ -524,6 +524,10 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	if (!port)
>  		return -ENOMEM;
>  
> +	port->sid_map = devm_bitmap_zalloc(pcie->dev, MAX_RID2SID, GFP_KERNEL);
> +	if (!port->sid_map)
> +		return -ENOMEM;
> +
>  	ret = of_property_read_u32_index(np, "reg", 0, &idx);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

