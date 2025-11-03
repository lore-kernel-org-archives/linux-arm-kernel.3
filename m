Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED102CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdu9914nxmx9HVrzeaXCiD/M6gjOdAMYdjxCy9Nn1IE=; b=EflDxLsvu3SMaE27KPO/ARLrYk
	YzW1012UJ6lQsUqBQQB7NT76asKpyFRHzBlqefD3S/wjPoObIYucSTpUSwda8JZPIKBBeoaaJe1kx
	D8GHYRXUy0SxdrPAcovKOEkJg1AZMnlbhqHY7DqeGvgcYKFcl7qACRMxfMVj8+XYTlAfzV4oLssMu
	XX5EW4iphS8lXoC21jga4dplAnLjHw5AzwXvdWYuFcRvls83zpHTx6arteKl8QICf/vOa11GidAcw
	vZ/kNesGeamyhJTq4Y4TXoXI+6NqQ4+kh3dKOiE8d+zZ0wzD+LBAEPL1VcdCIoihmiM/msNFPu4EB
	LHeT2Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzTg-0000000AV0d-0lYD;
	Mon, 03 Nov 2025 18:40:29 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzTd-0000000AUzt-2jFw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:40:26 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8804a4235edso23105346d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 10:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762195224; x=1762800024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdu9914nxmx9HVrzeaXCiD/M6gjOdAMYdjxCy9Nn1IE=;
        b=gNlg5gD1+mSCtHO8MAcKpv7GyGcK3qbpf3ZNtDdkjLdTii2vzvzvhu2NkjsWUzDAG3
         ciKtBQhPkoGS3AGgCdRNp7hi2kDrLxI1Vx+Uxow9BSEbnojCx4bbcQH7my8btkiZ8xse
         mAlDEekv8mxa3RvfW8l/ar0voT9bk1+lYgvDJl0sImk7w7Q5ScibUxfitYemngSpxF1l
         Q2pxFl9q9GZOthmiiR94ThE85riT7Ej8WFiW48XvdMVBAHudcjwUQpObqHksM/2bgYjX
         2C3aL7Tt6e6UeC9eaPVx+/yiI7Q3e242Etj3Dh/c4KjhEok1Tb6Fh8i8adseWVGRLOJx
         1sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762195224; x=1762800024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdu9914nxmx9HVrzeaXCiD/M6gjOdAMYdjxCy9Nn1IE=;
        b=ueCg1l+SAQqrMx2K/UvG4Vp9ULGNiYskHbgmoxyEAZqA21zo+aEgSbDS29XsKbnim1
         h72/19eGj9YTBi+BTkcZVW86Ehunny92YWAPXs8TOM0ONKNfXjUZdYbdZ9Dtx6cMcDPE
         xnmiplH+q3ytj1RjktqCBhKWPmInRFbrL5S/kvdgrnzm0JNXqEoYc5+BUBIfyOTL3cDy
         H4bxu41Du+DwbD2JRuQB9kzKvZfpFtUu2Z/hxXpMK9XWWsDfZshyeLFhWfjgt0PWZAt4
         fY6fENReZMnCMnhhSOBVOyaDoHEBn+5gd/ucIgUcWhB/tNB36uVz3Sm+imESjYJutpAH
         anvA==
X-Forwarded-Encrypted: i=1; AJvYcCVVMdjHxTRqWJJvEtZzK4MxFbfvgEFir+TtMXsTA23V7oghzaW+pPJylgQm7kGJE1rUgcI6EfqcES2BvkVYwwYP@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8/nOIZXV4lnWNGQrwmUPSuU1joyqrncTgAs1HvJAfJqulsZ2
	/excugJW7D8RcqzOT7ZjgtcEB3/y33TQLn2/FLnPW3GAhhILWVOpxkixFwAkHQ1XKtA=
X-Gm-Gg: ASbGncvFFWOnFM8DoURC/BPE9GNEps+uQMx3OQuyiN0O5XGkjKLw6lQ10BaBiEXsEWA
	/k5PRCXDvx5XWIAMs8lEp4qL7sIhTs7SRSuHAAC6tDx1nggkgnP1peysoOo6Wmo5LYwUdgI63Rc
	+GM2hoFOSzF0nuVCF7s01ZSljcBhHsfvggYNuQkVuMvDKjYeHtBycI/EB/6CAjnkY7GmyNGYSgr
	mOl921DuZz4a4HuxCM6yZL+OJbRqnP3R3KLP7dn7V0cveuyg9uejGWXPB+TEb3uvY1xY9/24r6Y
	XCPdXRsXVBzg48EYAoT2Duaj0aYURDQv2qBoOMsPrbe5BiV6Cuczr8ah+QVp44LWDfNR3+Vbgw3
	FkKC6SzK4DnCxSG+LNIyu2fFLxQTiPMwtnTc2WAi21UpaMMWdrYH+JXZyHFcdbSxMo4YLxFUZ8y
	+31d8ZH/SNFVlcdG5+y4tSwkeTvlgsqUSs8PKidE/l29Oo5ekNxg38X8QZ
X-Google-Smtp-Source: AGHT+IGemSUm2ni8Ue1hNioLIE6R3qX4KpAYbxriXdHXzmoYn8PHCrwIpoEc+FJpyECmaBuxF5TAMA==
X-Received: by 2002:ad4:5f8a:0:b0:880:5042:e38c with SMTP id 6a1803df08f44-8805042e868mr88058206d6.2.1762195223911;
        Mon, 03 Nov 2025 10:40:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060db32acsm6812126d6.3.2025.11.03.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:40:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vFzTa-00000006S0U-2tWz;
	Mon, 03 Nov 2025 14:40:22 -0400
Date: Mon, 3 Nov 2025 14:40:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v6 1/4] iommu/io-pgtable-arm: Remove arm_lpae_dump_ops()
Message-ID: <20251103184022.GF1204670@ziepe.ca>
References: <20251103123355.1769093-1-smostafa@google.com>
 <20251103123355.1769093-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103123355.1769093-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_104025_793819_EE6FBA67 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, Nov 03, 2025 at 12:33:49PM +0000, Mostafa Saleh wrote:
> At the moment, if the selftest fails it prints a lot of information
> about the page table (size, levels...) this requires access to many
> internals, which has to be exposed in the next patch moving the
> tests out.
> 
> Instead, we can simplify the print to only print the fmt and
> for each test ias, oas and pgsize_bitmap are already printed.
> That is enough to identify the failed case, and the rest can
> be deduced from the code.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 41 ++++++++++++----------------------
>  1 file changed, 14 insertions(+), 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

