Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AAEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjd7hfsfd8muVVZ7aQvyk8gZxPAzOHt7LsUJD0zUuLw=; b=LXFSIMtiq9vFbxFL1OFAsgV8Ai
	sUoHMtTpOkopoTmMDzExsAfXvn78+VGLUX1iLXq004ppzu2Y9ky6LXjkXNYaJSOZ9GFirwmc8MnRz
	aD48icZMhvnlVRHdWr1ZgnIBjZRiQqRpeoTf9vq2//IDYploXS048+p7eHQCX1jXkSOheCR/3S3BG
	+K7CmPjSvjz/JhNdacgKFfK45ECUoWMkrkg6ZPxobiCt5ve3ZgzLztq+XXH3g7V2Qam7bhPqB2sSM
	FJByqj2W2bhJsdlN8uHqhLmeOCGkjZFWDFVo+qhFoPGvX/ZC47eDsj3AXUueNBB+ld7vNC00wNm1v
	aKCGfGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tioKI-0000000DiBa-14vx;
	Fri, 14 Feb 2025 05:33:22 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tioIr-0000000Di3o-3fax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 05:31:54 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-866e8ca2e07so477303241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 21:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739511113; x=1740115913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjd7hfsfd8muVVZ7aQvyk8gZxPAzOHt7LsUJD0zUuLw=;
        b=IDHO2HkwbguN9ulmUe5IyVWEcj2DLDPPiHR7X4ArvWaXblSxeiTeZbTb/U2+J8B5Qf
         keqHo0KXucybjfCEsxr5slVXaGJfqf8Kahj41YZjeFxllwQRNAX2vVv0gvLHsj+IQUI1
         Hn/H3DIWFTmmON0cmx0UP6r1Gkcom6uWsjpNuFWXd53RZpKTLzKCofTkdqGPBiHNg9BD
         d7mNPiFSvRrss+s365H4ULlbrqPxJftYAuLwPCz37Pgk5S5MMQd8/iPWQdvbRMMWa9w8
         gVQrZMX11n1AUwED1pv0gqrEAN2JkFClfZZUjdfS8kHxLEMXwPVs9S1W41kgboh/BiRx
         qixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739511113; x=1740115913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjd7hfsfd8muVVZ7aQvyk8gZxPAzOHt7LsUJD0zUuLw=;
        b=JG6rU9v9aOXXygy7HJlvq9WrLM+kOTJd7YzVupWB6/pstkBNnZ0s/FbEHI5z7byx12
         X0ToubcgYeb1h+8VUDl2Lnzw6pJ4qNJvmV6me1DwBBuLLkpCthfGmREZWnZWP0vaKLab
         aejRFgZw4t5LF9wlkQ88PvhIj5x+SN2qe5XVi+c6719JCfvRb2aMvT0GlsLoVivYKJcA
         Lypi6sxbtFmVvn8ZVNltJbii/RkHRzg91s6el2wlgNQWUpyH34NbVw3DGOCJOc4vxqhi
         iqiNxDvx6RchNgCX2NLf7WdMTR+X2KbeGbfOL+m5/q+Uqu5/ftoarLNzwgMoSLL+jUaH
         TMeg==
X-Forwarded-Encrypted: i=1; AJvYcCXc20BNf/yEExWNdzBJIswS7TZXQSSXo64LiGVs3Yh0g8h6Nf5NpVz++L4YSr/QFLApApW7ETdMFWY5NzoVF/RD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2UeS+joNv6civfI2cqFn8onnDWiBRRwmN54H6ayyujV8DAAjN
	1GEISXMLuCVl/++ZWPZ7jNrHNIIklcJ7cBdbQS+JxmJOAZVZbxBS
X-Gm-Gg: ASbGncsHqLJcrCUAPfohRppmraTTmdCx1QhhqwPAFEAlJbfztMVcZmgtu8Dhkm+54/M
	ltiSq6qjUm+MiPEQvP11fy6D1rqUnq62bdOP+invt1Ur/CNmHKemC1GhwkYQ8/s4I/dupDk9iBm
	8e1yHxk8FIUou4kbrOGBv29BTK267naVaLiO0wIcyI6q1pvrETtnSGzv7Awraa3fqy1AHYNEWNF
	OWnj49X6iEOD2zNaSHMSUgqFl5KNOX1OUl5tB8VB+9QeJOb0Vsfz5hm1T9kdos7v62VlpMfk0AL
	V6IFF0OenJO9mm6dCxw4P4vuBgzYHfPJ2ePHB1dMI7dlB7jaXJg2xB4tYSuqfA==
X-Google-Smtp-Source: AGHT+IFgHjSNeoBNptiiEbwluBRQ3IXW3sqx+kBS5+5e/IvlWs4t7RMLzUKV4L4Hb4cfDBGmOWGE+Q==
X-Received: by 2002:a05:6102:162b:b0:4bb:ba51:7d64 with SMTP id ada2fe7eead31-4bc037433efmr4855118137.17.1739511112688;
        Thu, 13 Feb 2025 21:31:52 -0800 (PST)
Received: from droid-r8s ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc07961654sm406029137.19.2025.02.13.21.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 21:31:52 -0800 (PST)
Date: Fri, 14 Feb 2025 05:31:43 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: alim.akhtar@samsung.com, andi.shyti@kernel.org, broonie@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 0/3] spi: s3c64xx: add support exynos990-spi to new
 port config data
Message-ID: <Z67VP6zMwFcqFurH@droid-r8s>
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214043343.263-1-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_213153_910601_931F0242 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, Feb 14, 2025 at 04:33:40AM +0000, Denzeel Oliva wrote:
> Changes in v3:
> - Reordered fifo_depth handling in s3c64xx_spi_probe() so that the DT
>   property takes precedence over the default value in port_config.
>   This allows node-specific FIFO depths to be applied correctly while
>   preserving a fallback.

Showing evidence:
[    0.339111] s3c64xx-spi 10920000.spi: spi bus clock parent not specified, using clock at index 0 as parent
[    0.339119] s3c64xx-spi 10920000.spi: number of chip select lines not specified, assuming 1 chip select line
[    0.339467] s3c64xx-spi 10920000.spi: registered host spi0
[    0.339589] s3c64xx-spi 10920000.spi: Samsung SoC SPI Driver loaded for Bus SPI-0 with 1 Targets attached
[    0.339597] s3c64xx-spi 10920000.spi:        IOmem=[[mem 0x10920000-0x1092002f]]     FIFO 256bytes
-------------------------------------------------------------------------------------------------------------
[    0.587452] s3c64xx-spi 10650000.spi: spi bus clock parent not specified, using clock at index 0 as parent
[    0.587462] s3c64xx-spi 10650000.spi: number of chip select lines not specified, assuming 1 chip select line
[    0.587847] s3c64xx-spi 10650000.spi: registered host spi1
[    0.587986] s3c64xx-spi 10650000.spi: Samsung SoC SPI Driver loaded for Bus SPI-1 with 1 Targets attached
[    0.587997] s3c64xx-spi 10650000.spi:        IOmem=[[mem 0x10650000-0x1065002f]]     FIFO 64bytes

