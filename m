Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F429C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=; b=ADCpv2oHpy6RvrMXG26ZlbfvVN
	vEbVFj+xzLZxB6kxhK0hkEsf4hI1xro2bFhBKq1rPMEuGb/Z5HOKLyRSTy9JF0mLQrB+lvtBGDzGq
	BexlmlFb14QzNLLWmMwwA/0AhXKvI0sotTIp1rWchzdP4YsFKI6SlTSwDWIEpCCbqADQw6H79MyT4
	IKyKt3P5Y/wOtH6FrfqjhX9naTMKDztTESOiOm5r+fVOkUDKFvoK1PxdGAogPPBqA4MMAPsHhtO92
	XsMCGrfAYB2YehTzrojSxaeF9TJadhw/tCHVi3YNG3wdmKLtb7Ch357md+b1Jfvex54+Bt13gRPCK
	CBjJ+jdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40gF-0000000HP0G-1Y69;
	Sun, 13 Apr 2025 16:59:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40eM-0000000HOnK-47VH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 16:57:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22435603572so32538395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563462; x=1745168262; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=TydoxYkyvRiHAyIOCmKQOUmpQ7zZUJADJG/CmcnGbsoCowqKGLwd7CXzrXHoajzL+D
         FA9pFiqIrEFqNte1goBUfTPeHNcWUVP6rP+xjmrU8tfUoeFU3IgRRZFx6H+gqEunV14C
         ErDxVHyJxHHGTsHG4agdFYZVyyf5gxe8qTqU22VDf0A7wL20aY9RMo1KHz9TiIWF4412
         rnH74IbjjaJL5DYtX4PiWc0sPttMJ3B7zoktLeVfKnu1mYnShw//4QIvM0uPAgiQOTAr
         kadrtQqoC83txzFFrJIcPivOVx/Pum8AtHA1tUXlUB7qAiSwRtR6QlZMfhPXO4DEVV0n
         Ch0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563462; x=1745168262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=Sak94G3rtEu39g7lifLfKeLVbTR84PsKnqswGfHf9U5Y331Gla5TH7k/GUHMNn99B4
         7NIZ5Ikgm6t70/RGcnC/NdVUdFeWiSupWfGxQ5v94PVEat2XFz6mARfGMAZ0ph+T25yI
         RknTO+0LncCM5kr2y03SLQKuNowMk0I/0Xb0BEdbLcNXC6GkdUFByV1l1TjTL6rh53yH
         ELsANThRw1qhhU4IkNxkJlI6uFn5OtBjJjW/RItNTbXSjqHpyUzpSMBeL2aAWVZPJtD8
         XYMi3BH8lGeMtcMCud2aIQOgY3GSjmtVgJo+OHaiVNE3fh9MquH2wJXnNQF303Wqy0AQ
         IWCQ==
X-Gm-Message-State: AOJu0YyXV4cgCFL2PUKV46XsmiKhohq0oBWtVuAtZBIV9pEP75dDAGWq
	Ar/rzlzK3JPabycioSN+hUY8wRTbZUZaijlYyFdd2hwrWTPVp9wq25HHf6CJAw==
X-Gm-Gg: ASbGncsRhv5OUDbAAIQGszd8CRNKLdAUEdf5PheDY5nRyTvd9fGA7QSpoOB5YQREjZB
	0HMsSrSStBjfQQqvfqZ9oDpDyN9zUMXcQi/9R2Dmxao1URs57j9aOdeEtMv84O5tUPqYNEglTNw
	B6UYYKUFIGu+XV3pke/rC7PIZAhhfqILbFclI4BGCGH08THd3JYzI9UDQzzKewCYNV6BQd2Rz7x
	PKlns1rT0FPrDcFLrKkB8mQcr+kgc6AF2XExJOe3u8yRrD0PYd3cLCVNfLxZ429yMs2ZzIn8/Gb
	IucsNN3Kq7BuKGqt1XZu9JiWQaQv8DVR6+hH9AJSjmgHXyByfnNg
X-Google-Smtp-Source: AGHT+IGJt4v7frYs5ZTIrelHv7KmYlMcRfj04mYpK3QHDu8yhzesA2ae/Fc6/h0nwJZRdeyltFrEww==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr132747235ad.46.1744563462265;
        Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb84bsm84013885ad.236.2025.04.13.09.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:57:41 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:27:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 01/13] PCI: apple: Set only available ports up
Message-ID: <k3wj3wkk3cymyacboalkhe2fa7jvkpuehq4knpsouoyhvoavpl@bafg4oakp4lr>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_095743_035679_1C7F89FC 
X-CRM114-Status: GOOD (  20.38  )
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

On Tue, Apr 01, 2025 at 10:17:01AM +0100, Marc Zyngier wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Iterating over disabled ports results in of_irq_parse_raw() parsing
> the wrong "interrupt-map" entries, as it takes the status of the node

'as it doesn't take account'?

> into account.
> 
> This became apparent after disabling unused PCIe ports in the Apple
> Silicon device trees instead of deleting them.
> 
> Switching from for_each_child_of_node() to for_each_available_child_of_node()
> solves this issue.
> 
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Fixes: a0189fdfb73d ("arm64: dts: apple: t8103: Disable unused PCIe ports")
> Cc: stable@vger.kernel.org
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a7e51bc1c2fe8..842f8cee7c868 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,7 +755,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> -	for_each_child_of_node(dev->of_node, of_port) {
> +	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
>  			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

