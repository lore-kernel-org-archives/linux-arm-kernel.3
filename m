Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA10C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=; b=gZvFMLiK1aPQpeHo88ZEIyk55g
	hIWQ/Gqk6VM0UUQ5BZfkKnyIudQjLWZ0VwgVpXkaZuIqdLuzKSoPmk251IZs2OhJSYNsaOGrfteEB
	DjhRUu19D1ISrUpoYi+km684nrnmTnbZS2Ka3lTTjXjPSielZiL7dTjfEnAZV6nIKm7bwPjBtELL5
	XGj3Ck5GpVnowLqEK23AUp8gw+HjP9iei1454gdiLRUxOjC565wWM71GBMfFr6gO5TeRG/Ht2U/3n
	xArT6njDnAXE2L4VjgcqcH9JCI1nhbGdZTFkWboXYrXoAm6I8ecatiHFv9gi/Dz048TKknwdjHNXy
	QGDCQqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40vI-0000000HQdm-2E9t;
	Sun, 13 Apr 2025 17:15:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40tG-0000000HQPi-1X7p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:13:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301c4850194so2733477a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564385; x=1745169185; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=HsVCvLsKRVWIg49RIPji/F+O6ZYwh0KUQQYuzC6wjMnpyy5mb6wFQLBXMACZMhBBOW
         vN/BNYl+Z9ydDsqu1FJ0Z2eMTlH/sqlYAQzCo1hvfTCvPo7h5wkHxWBf4ybzD2HXb9VA
         1Ex/B/zYUqdEFTBAhVYfUdvM/QoOUVsBCLA+73K0J6cdx3oeNdnb9LU6BE71DBjEO48i
         tVnh4D8iQsJ5hwrRtOIK4W3HaKJxpSByN5EneLMiEOE51LnQwWaj9n7d/rXI+C1xBERM
         cbZVYojiGyFiW89zVi+55WHWnXya6MwY9ogTCvF1u3wT12VR5AwqY7wBv83NJKrJ+w6E
         flgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564385; x=1745169185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=lCSS8ml0zh9WwaGiDUTedx2PJbblqNBYWcZnkUYly2oPTuRjSrXv9UZGlDqsNUdFY9
         oaHGiFnGBwMKMWYH0aZCw/NaE2cOE6xEHsPfSRmCR27fRqntmPM33Cc8UxYUZoQvu1pq
         kvbC3aQ+UnKRUy7sylLZOfX2r4v+6C7NAO6YraUvByAgR+2D1rPSID9A2IesGt8Pm3MV
         et9iGOmjOjqNf4nKEi2CoXhRfHvWbuMNnqEWokXD2vCn5GRGnv45T+Dn2Wt7NU8e8N25
         w6PBdSoufSsT4pqbigJNE5IU0R1EAAegfv8V1CrBksQ6Flksv9fdEEy9NLBqmQOaZwEV
         bujA==
X-Gm-Message-State: AOJu0YzF3Gc/G6yPuSmjNOLUgUpQcVGcSQR/Yulk/iYlvWg49pcYa2lZ
	wfyINaNM5R+8RSfvJD1sYzrZQXM8F1j7KZS5q2tqvQIS8pfnUC7ImAoARzOQCg==
X-Gm-Gg: ASbGncvIYfpQfBgyConXAyWA+vcTj4gjrSSg+Mtr2HsKbqK7JZkcUG0osaCmCBwS98i
	F/tCat0y3hslHgIKu0XTYwm7/EGC+SvZwHFF+04MPVYeCM6DTspg8KD8pOcXtf4i1mpffkl3l1e
	4pZk1uhG/3riU+zuj1WTHKfJr/AzXrsrI75M6oc9+nFQt2l1sh0O3FgO+fk4UZbj5kStr+YL2BD
	ALhxf/HQMIgz6LrhJhfCFpXOZFITnXnGB4IEt+4mfENxyUKeM6MukRHrRp0jANw+SHNIzQP4TQz
	Iw0ZifEwliGzY6KgfbnsfmX2l0roSQ3MV1gsGGeAMP9TfFg7p7JN
X-Google-Smtp-Source: AGHT+IFgvRixxj4CWBFzEA4Rqd/cLujQYErvo4nd7qcvFFaJWGEF/g+XbRNPiPM5DyBrqssz2FfknA==
X-Received: by 2002:a17:90b:274e:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-30823664092mr18167375a91.12.1744564385379;
        Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c41fsm10783830a91.8.2025.04.13.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:13:04 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:42:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 08/13] PCI: apple: Fix missing OF node reference in
 apple_pcie_setup_port
Message-ID: <bw5hh2mlgaxxxy6rcjksrqfkpencjx36iywy7kp4s65ah5qe6c@ye6dmhzhdlck>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-9-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-9-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_101306_407009_A2221857 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, Apr 01, 2025 at 10:17:08AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> In the success path, we hang onto a reference to the node, so make sure
> to grab one. The caller iterator puts our borrowed reference when we
> return.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6b04bf0b41dcc..23d9f62bd2ad4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -593,6 +593,9 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	list_add_tail(&port->entry, &pcie->ports);
>  	init_completion(&pcie->event);
>  
> +	/* In the success path, we keep a reference to np around */
> +	of_node_get(np);
> +
>  	ret = apple_pcie_port_register_irqs(port);
>  	WARN_ON(ret);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

