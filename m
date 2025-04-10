Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0834FC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 23:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpO2S4wctyk68CVyOkNnoYhQpTc8ULQAveyt4WbuIOg=; b=q6sNFPJ2aIbzoXKY7WV0S7DPtt
	rBERxAHaHhP9jULyf5TFedMmSlIiWxJpJfTDPL7RoTjFCH6nHFlmNSFZSxcZoTmDsUiK1LuPoP3+B
	XwymKe3dbAZIGc/tDK/18DPkv2h49kj2Z2o7Otinv6/A/ELZR+FPzor30vmlcg7hRF0ltxdMY8vzd
	pk6z9yf4Q+pkpgAk6mcx9y0S+sqAxzUjA0Fe5Xzd2UHUusvuyEpLVFvKuR36UKVd+UKKiazZ2Sydq
	uoAAjfOJU5ud9jIxV6ON/dQDHevHkr6jxZggy77pNxMjxmJnRy6pfiA3+AHtP/gcCdGJtMmAyyGYc
	9rRFRc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30uK-0000000C1DN-0Vjc;
	Thu, 10 Apr 2025 23:02:04 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30sV-0000000C14q-3lv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 23:00:13 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5e39d1e0eso132066385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 16:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744326010; x=1744930810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpO2S4wctyk68CVyOkNnoYhQpTc8ULQAveyt4WbuIOg=;
        b=QIOGAShBHfZvaYK/SJq9b7UaiyTdLynr4INBqCR4a9QDRE8GwIRhs0bZGc5U249cky
         /tNoJ8kYZNBvRZJDyAGB4oNSvXeF1++zujjDJs3QP+c4wMFcdkJ4QimD8QRVApmbZe3K
         auuv13yWJvRl/0hX2ujW6ZQWqg91ctHXURXuifopwCxbeIzWxk7X35Ipt2SasExneg8u
         mLdKPbf7kTLWyAdiZcnOcOaGX54y0VONdc4x8j596RPN03vUMQOdYVnzc2B5YTtnPDPI
         4+04jUs9Hnlb/wuhb3mzlII+IrTDQjEVOgMBsTs5BAG7RLC8apLOI5QqD4152wEp03mx
         N7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744326010; x=1744930810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpO2S4wctyk68CVyOkNnoYhQpTc8ULQAveyt4WbuIOg=;
        b=gCHOWF8sG+qiLqeA4CQTU7tuBceXd7okQN7o3qAGuwjDCaZCV0Z796/jj8aOXTPniX
         62vLbM2ziKqSzCAqMS23kupL+/G7zRYoz0tWcWfI/JX9PBuqCH9XUt00qq5JmuULjjNX
         tL8eMOfwSO4gxnh7Zxi2C1izAD2QNPjuM6cw0RfHGVk/vtLhRuZAJZAmsMo6uGn25jAO
         AagkMUzIHbyDaV+cq6jY0QxsjsVAn1NqveVPDHnQHhhqrJWpZv4KVk2GotIkgghapCKM
         BFFxvxiw2ayCkvBf14PiMe2nUjEJDviCZ+2G1vM/Ix51EwRMgNVAajmjzUnAVwqWZSmW
         SeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH+g+RlwVdqR2n9DUN7wZfedi58yc0yxk0C5LxscRcMu4x5q/hTWqN9xBw5gMxH0GlGLi+wMjPOl7GG4GRIygf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Ppt2TP+9OebkE+iQUoQMKZfMFEw4B1/pItBbztYQHGb/Fjxj
	tJB4qPq2LLsLM2ueb1+oR71G4RLNVEpU8b6KdSSaWazol/zGR4n0cCkDcTkgTVc=
X-Gm-Gg: ASbGncsnsLkTR9wovHWKIsSr0bwFDg9uht4Sl/00F450RTHBu4MLvUEbdPF25hO0r3B
	bAFdRicU4Qmd8jk7hhpMOC0vUx8NvFClK9PJVWiw2s24R4XYBwVH+7MotcQrBvnlp12mTZQtq6j
	9WxY72T2Kvh6ST8NkDA1IrGFO3l9wp5Ap/5YEN9jcIqnGobv1ruSY/DkgWbVR+7zPf3c6FURVQK
	3pe+liDXQKv5tfztrHC3KljjmLNp9oD4Wm01ZKXRBVRM3YTR4dtW4eRYZg0o4nO9+E5M31/gqJ+
	9wbBN23gzQK7//fsr/WEsa1goZDR5axGbBWiMjl2+qA8QEeaUY1PDnFpaZlUizcPhNvoPXwgZER
	CVVMb5rwwWEalmQPHSn0=
X-Google-Smtp-Source: AGHT+IHr0/WY2Rqb4JC2JVZGgAH4AixNta9jAPZvPdjOUO1pv6CI6b5DlSO9IE1VF0/bDnrgXDRKew==
X-Received: by 2002:a05:620a:4306:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c7af12e6ebmr102606285a.14.1744326010083;
        Thu, 10 Apr 2025 16:00:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89437a4sm164415585a.23.2025.04.10.16.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:00:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u30sS-00000000GRz-4851;
	Thu, 10 Apr 2025 20:00:08 -0300
Date: Thu, 10 Apr 2025 20:00:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250410230008.GA6905@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_160012_118075_EDB4E736 
X-CRM114-Status: GOOD (  18.34  )
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

On Thu, Apr 10, 2025 at 03:50:27PM -0700, Shyam Saini wrote:
> 
> Hi,
> 
> Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> assuming that all platforms have this address available for MSI IOVA
> reservation. However, this is not always the case, as some platforms
> reserve this address for other purposes. Consequently, these platforms
> cannot reserve the MSI_IOVA_BASE address for MSI.
> 
> There was an [1] attempt to fix this problem by passing the MSI IOVA
> base as a kernel command line parameter.
> 
> This patch series aims to address the issue by introducing a new DTS
> property, "arm,smmu-faulty-msi-iova" which can be used to hold faulty
> MSI IOVA address. This property can be passed to ARM SMMU drivers
> via device tree so that the drivers can select appropriate MSI IOVA base
> address which doesn't intersect with the faulty MSI IOVA address.

I thought we already talked about this and you were not going to be
doing a DT proposal for a software knob?

And then you didn't even link to the recent discussion :(

https://lore.kernel.org/linux-iommu/20250403232619.GA681099@ziepe.ca/

It is easily solved in the smmuv3 driver without out any DT. Please
do that.

Jason

