Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07A0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH2sRsuQDKCFUwxkFxdc6jRskjBX6B+g7JIWjIU6MHM=; b=x3vmEVmWN/89lLWxLk9/kmVDR+
	tBcpEfqGG0Q+hi9TRraIWCnU2eD4h+X45XOWAnE9PQ+Q00r6HsQijak/3YjzG5VqQj8qx5hGzChos
	7RLl1X2E+zalEJWkOgPdCctLNxHp+vjdtVbFm4my3AgVpYzuscRI8BzEhNCIk94pX5FwNzKEcOw7N
	C7Ag0FRr6+ouaGT/UVlUjIR7CCZQzbccQASChVaZW5Ry5S6xu6K6DHCdMLYwlKxUBxAqId4JAMLPV
	i645OiINIJZsQZTQ+ReOjcTY1Jt9ZjnFKAiN42Cz5RQKvKwFzr7eoBEiJ/10Tcu+7EFNZQv79+XOr
	7dlrbgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgi5S-0000000Ck1h-3sj7;
	Sat, 08 Feb 2025 10:29:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgi44-0000000Cjqh-1VxJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:27:57 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so3757190a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739010475; x=1739615275; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BH2sRsuQDKCFUwxkFxdc6jRskjBX6B+g7JIWjIU6MHM=;
        b=eFCjoPi3/FD7jlLRmccKDYZrJyi7pNg/pnJCBlDrXveK4h+h3DHYz6hyUHNYlLoTCQ
         c80KBrrgm4FmWwNJPecKvepzYg4cMcvW7oCdrbkKJXEcjZL1N0lmC590FLzIBm8Bo9y1
         /TmAG5n2GVKht6qBh8rq905zeNSzzYtWsAVrrXi5IV1i01+8S6euy96CQsVgqot7keS4
         52sNOBdhI7YV48seSWtHbXNLSKGYic3zN/9zLqzWKqQhMLdpVudbdvbEhCQDDSIgqgZB
         6r+PNH8lKqZ9odKjGoL3LU6QunQ+qaF3UGkBe+D8E00EnVifcSL0G2CXE3MOjHkTgFt2
         Q2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739010475; x=1739615275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BH2sRsuQDKCFUwxkFxdc6jRskjBX6B+g7JIWjIU6MHM=;
        b=HUoMyPS6kMYsnT5q4UTEiF44SLIVzzISXhSEsApnB0c4elFe778urfoFnEbpL7Vf4E
         UM7Y2fOBqQGnj6DWCdR4kj3L3+3dDuHCLoR/Pg4ajYaH9J7OAKe4yjYeQLgnyQQoo8/V
         MNGap4X27BbhM0mJ7/Ow3FPVKjAtb/ZXlvLHPI7vOtcNCH8oP3leJEjbz/or4IRUqokx
         Ad2SBaRu3ROw6f8C033s6LZAJEkwKuBfjm49LPlYCWEOrQpeuQclu2J7wn4SmlaqsUIs
         U+ZXqDc4PKg1I4DEIMyEXhPVOSlZNH3i487iOB5HzhFsoZgV4eirX92GFgjTrBUq0hcT
         j56Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFCg/jp4mxK8HhAcb742JnMha5aUjhxJRY6RfBr/13e9gtz790MKq9qrfdzqUWVcq3RAPjYlB79a49bdQSMcPh@lists.infradead.org
X-Gm-Message-State: AOJu0YwEk9gwd8rDq6EYXodncYVjZi00aIk4foNg2c5XM45L1wAEIICl
	3PUlYRPo16HFZE2xatrCco5xTn1cw5CKIbmZgYqP6BgzgnLHYAiRv5AvmhuZRZ9OcVp/G6Kf5r0
	=
X-Gm-Gg: ASbGnctStZAdnxVsvSXJrTeY9aQ3EC36bvSfoIN8SetglvXEuQ5ivACG/jaNZUkq+Rs
	p1kkSGU+tb+u0lUmZ0Eji7teE4/honFkooKYjrMctXK85jIGgVw81qfVco7U7tlwndlbKIIvJ8U
	NXnCInChriLRqO/v2zJL/ik12RdaycSeMLS0U+7UZ3GMMfR/Vz8YRBjsxrdQEAGFC+UCPVHzkEm
	kj9rtIqBOpW6zKNDaGOf0b0zlyu1xFavBjZQlV5y2qewrGBD1zSk5laV1+EZc79ELWOv9GpWamK
	YvJ06m86wqGrurWbOztginYS
X-Google-Smtp-Source: AGHT+IGUNe1cmqKWgJdr+fVDu2jVqtRunfHrv/+wQ1RGFBGWqyXmtmbiQqDh/EPUsA/NiaPcsxvF1w==
X-Received: by 2002:a05:6a00:6f1a:b0:730:74f8:25b9 with SMTP id d2e1a72fcca58-73074f8430cmr2616103b3a.17.1739010475341;
        Sat, 08 Feb 2025 02:27:55 -0800 (PST)
Received: from thinkpad ([120.60.69.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c1622esm4450247b3a.141.2025.02.08.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:27:54 -0800 (PST)
Date: Sat, 8 Feb 2025 15:57:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: brcmstb: Adjust message if L23 cannot be entered
Message-ID: <20250208102748.2aytlzgzbvm6u4vi@thinkpad>
References: <20250201121420.32316-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201121420.32316-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_022756_409136_734F7C2A 
X-CRM114-Status: GOOD (  18.58  )
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

On Sat, Feb 01, 2025 at 01:14:20PM +0100, Stefan Wahren wrote:
> The entering of L23 lower-power state is optional, because the
> connected endpoint might doesn't support it. So pcie-brcmstb shouldn't
> print an error if it fails.
> 

Which part of the PCIe spec states that the L23 Ready state is optional?

- Mani

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e733a27dc8df..9e7c5349c6c2 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1399,7 +1399,10 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
>  	pcie->sr = NULL;
>  }
> 
> -/* L23 is a low-power PCIe link state */
> +/*
> + * Try to enter L23 ( low-power PCIe link state )
> + * This might fail if connected endpoint doesn't support it.
> + */
>  static void brcm_pcie_enter_l23(struct brcm_pcie *pcie)
>  {
>  	void __iomem *base = pcie->base;
> @@ -1422,7 +1425,7 @@ static void brcm_pcie_enter_l23(struct brcm_pcie *pcie)
>  	}
> 
>  	if (!l23)
> -		dev_err(pcie->dev, "failed to enter low-power link state\n");
> +		dev_dbg(pcie->dev, "Unable to enter low-power link state\n");
>  }
> 
>  static int brcm_phy_cntl(struct brcm_pcie *pcie, const int start)
> --
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

