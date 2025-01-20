Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD20C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vr2EIyCsdB5gdGa7/0WwIe6wMDGX9eJ5N6s6izoCruk=; b=FPIwJ5lzznOwAXPZ07Tc4u5Eb7
	VVd5t05A2bAM9c4+/7xGu+2Dl8BFptdD+l8ERS7U0HwvfF2UMvTpKIdoZFCDLbMxZvDcjNCxKM8M5
	LetHwhOLvRYTt6jW9iArObYoBGirMhktZqi6fqtu55qNAVOVFvyve2pZVYEaTigLXuSpUQssMBubJ
	jvIAxZB7dbcQdCmjENfhecslhxZeYINnjn7np9xUOMpRfn/nhEXosrIpwPGtqx+ckljcob6E+M+yC
	XsOsq6LopHRgflOOjtmctfX1QqSik4uNIJyHL5eDOEWsqFnOO7koHbW6zSfFJh+d3DSAVQ/SPlneG
	rQxKPabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsl3-00000005n1Y-3tNJ;
	Mon, 20 Jan 2025 14:28:05 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsjm-00000005mwp-0ewZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 14:26:47 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7be3f230436so421560885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 06:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737383205; x=1737988005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vr2EIyCsdB5gdGa7/0WwIe6wMDGX9eJ5N6s6izoCruk=;
        b=YSeEoA7Y5SHVl9PZOD/7PSU8t1+sKFWmN3NpJQ3d/T/oBYIoUafAEJirmkUPm3kWPC
         CDPUFuXSG0RbGoLh6BtZ0Edq9TIvYr3rYZcZ3Pyi+jPJy8TsJIKSm8982R01Q2ck3X0/
         wRXoK52RMbw6Z+g+n0JfQn+GX0y7HoXceYsMAY3mICeZ5q75rV7gnzRBWDfGJd2ClYnN
         9kHN5B8RdCLbcv3LYOhbbFaMUtGQuZGlsKmfDtRjUpXApbB/aofzeuARjg9orZm2tjBG
         VaAwJpn0auis3SkWz/meyVGLy+wDa+ZYiEml9+wyMbQwRdKH0JtB6g0Sqirm9J0gMFU9
         TgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737383205; x=1737988005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr2EIyCsdB5gdGa7/0WwIe6wMDGX9eJ5N6s6izoCruk=;
        b=VQtD/CBj6FD6Yt4mxoHAGat9r7/Mab6QU/UXfwz7B6GkjQWgIQLaNoJFudER4B+QiG
         Yh4HBwhvmZJzba8elixKAxxs+4vDRg9G88wauo4Q/ZWdbb81nDjnSS4BffMzvLRBe9x0
         62LqaYI0m5Hiqm2jn22M/LXmkqDJfmITE6EIvEZqrlVj0MHjsxdHVSfbcyvCb1J/imTk
         xLRKp7treLRzfht6p3cVhgwh4TMADRckDZPeJASA0guDLpRHCgDXGAFgrDHbfnB1qCo+
         bdK3sIEMZrZ03F/oELRSZ+eG8T5AUHnkTd0TyZEy42Kqhm54xf7RWbZGFE1mUpS5GPqo
         06GA==
X-Forwarded-Encrypted: i=1; AJvYcCWITbFpSyM3MJzZA/RhxBNWLJBLK3oB5BX10jMjnOf7TH3WkeHMi0apXA6ua9XUn38gr/i9N+t/imxnPAjInioI@lists.infradead.org
X-Gm-Message-State: AOJu0YxObbWGYa2NtSCynZtWFonGILyWZA43E/qNsHA247osooqAKYKy
	5cJQoRgsZdFSm9TuCuRgSbDRYlzhFfFM6yyspCFR+BTcrSkN9qfjAoowgn6xKDw=
X-Gm-Gg: ASbGncvsTZ1rpXRYIyF45QrgNccp9un58I8DdlbqeWsZvwfdfE7VrvzS/cwSB4N27gC
	NJO9Hoe88hoWAUlmkbaAKFAtvesUp1mDgYgdQgZZ8bV6Gt8jOiKM0z/ODHfjFfD7Lf1Q/qIxMvA
	x9Ugc2pf/FHm0dgd2OsTCUGu9ycrxONvUc+QEP4Z1ZW+bCFb5v/4MA5eFPRAM30oJhgXhvzNHDf
	Vd8f5bFBbmMx11G35rqY1jA213JbwLBCDCcBL65dhSHiJqbLMVf6M6XLInlF6WS1xQuPBSN/BPK
	YKHUnL70dCGOiWvveS06bHklKiHPmqWhObIVyzckrKY=
X-Google-Smtp-Source: AGHT+IGtvIsUesTGjb37GoPOTTbLeWODGXjdLhV2Jx7A+73Ah5xBJFQ5DKfLkBk9bBAu2jSA4Q8O9Q==
X-Received: by 2002:a05:620a:4513:b0:7b6:c462:6b82 with SMTP id af79cd13be357-7be63288222mr2782957385a.54.1737383205075;
        Mon, 20 Jan 2025 06:26:45 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6148931bsm446023485a.65.2025.01.20.06.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:26:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tZsjj-00000003PkA-2hgf;
	Mon, 20 Jan 2025 10:26:43 -0400
Date: Mon, 20 Jan 2025 10:26:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250120142643.GM674319@ziepe.ca>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_062646_198621_3222854E 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Jan 16, 2025 at 03:23:04PM -0800, Shyam Saini wrote:
> Hi,
> 
> Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> assuming that all platforms have this address available for MSI IOVA
> reservation. However, this is not always the case, as some platforms
> reserve this address for other purposes.

Can you explain this some more? This address is in the kernel
controlled IOVA space, there are few ways a platform can impact this.

How is the platform impacting it? Is the non-functional IOVA always
reflected in the iommu_get_resv_regions()?

Why not avoid this conflict in your platform software?

> There was an [1] attempt to fix this problem by passing the MSI IOVA
> base as a kernel command line parameter. 

Yuk

> In the previous attempt,
> Will suggested reserving the MSI IOVA at runtime whenever there is a
> conflict with the default MSI_IOVA_BASE. However, dynamically reserving
> this address has debuggability concerns, as it becomes difficult to
> track IOMMU mapping failures.

Still, this approach seems like the best to me..

> This patch series aims to address the issue by introducing a new DTS
> property, "arm,smmu-pci-msi-iova-data". This property allows the
> configuration of MSI IOVA with a custom MSI base address and a custom
> length for IOMMU/SMMU drivers. It accommodates platforms that do not
> have the default MSI base address available for MSI reservation.

My understand was using DT to set kernel configurables was frowned
upon? Ultimately MSI_IOVA_BASE is an arbitary choice by kernel
software.

Jason

