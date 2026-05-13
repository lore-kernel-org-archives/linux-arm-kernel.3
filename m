Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezXQwA1bTr4JmObmofRNYrBy4UfsX59CPxxan0BrTBM=; b=Os1lRojs+XVwxZla4DiLStJWxV
	+EF1bXEErI6C7jeY1BDrWT32CIHPuzdZe1rNB9/v/1BiGqagsu87i0duefIZodyxm2zwvQIScI9nE
	2d3UgeS41ljEgmUUOHoM8anD6OqSNjWbRKvRTiuLMySNHhFFSCSR/itnDwBDbxANy9iE4vkK9oo5F
	aQiLQhpji0EwqyGLZdlTcjvKI2v4NIa/EIe/ShSzFvN3lrP/YXADu+XqpbZiOkkL15hd09avvEZTc
	7TY9nF4OfB5j7GKBLWlF69DxZBq/L+5dgNCVeyjccQeegxespcqcsWyEagKzowJdBXSjTHwH6m0gA
	AxtptWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHXl-00000003sDc-0TuX;
	Wed, 13 May 2026 21:55:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHXi-00000003sD5-3gLX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:55:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48d1c670255so17655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778709301; x=1779314101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezXQwA1bTr4JmObmofRNYrBy4UfsX59CPxxan0BrTBM=;
        b=uZpwHu6Bryb3wxQJ79pQwCoV4sIaGsstHOJNeqk7B8v8yxxZlcdn8vZZfUARaSijyi
         ZTzRZ02WxYKrUWCXo5tCKDiKCDfG4qws3E2FcNFFOJhpv5QXbzVba3xdRkMebo7HdCx2
         7u/iJd6KCFb/BURAsDq/gzjw+38jUOba0kptMXoCrg7GK390/XVgPApHBSBZl9UyWdK4
         Gdzcs4zhIHLOZr4xyqOVK0316/jOcAP9ZTfmbdMrJIi1i65/AopxOBctdr/QsCE0Kgtd
         QzLCDqQQX9K0UBoqTfulybd6ukmIJcC9I3khCzx5LaT7mxYUj4Ke3WyLu0RDalfAG6jj
         txTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778709301; x=1779314101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezXQwA1bTr4JmObmofRNYrBy4UfsX59CPxxan0BrTBM=;
        b=ebGdeBs+c0Wxx7u2MoAojidF23qaT/CenVWDnQE3fuZHVNCeBaQk+BAm2dLiVzVw3p
         Q91fQQ6r9hBdNWs4wrelI1GSksUFebqODOM7hF+wkNWgQS2khooZm0FO3FtEMbC52ZRk
         w6vTGSIVA5ZxXzEKdlk6kIw2il0l62oMAtcn6bNhIfM4UlBmPEgoXuUySHeLATG6wijk
         PobHebyVK9KLrPb0jUVTqzV5hAU5HeEjjXM1IsFnl/L3PL4DXg/U65700OXVq3omWGj6
         fxLWJdAF4cUl6J613A+BI66k4L2/Fh66t7hWCfe7YduSij5Nx1G7PoWkOy+5hd8Uvqhu
         Vftg==
X-Gm-Message-State: AOJu0YzICiPGHdqQ1IuhsbGMN3de6mSvQEpqvTn0TSEb2Rl2BuyTQVWL
	kOjzjNSM0gqrBHNYHalPA13DLVZbTgjM/v5APZezFzkryvelnYwaHjUdcKEBxKafcQ==
X-Gm-Gg: Acq92OF5+mrQohUfHYNfGhVl3P9kCWCxCLclsvgbDxUHZdSKvrGVaMBMPpI2KoK0Ueg
	jCrnuOBTiCLaVPNKFjQcCwddRMfFcpHRPbZEKNjK1NE3zSAgMneija/UfARlB5pR95AMKspnh32
	tiQzkF04ms67SeQ3RabZR48+vjeylGDTyM5LipZc3GbpIBw6mjp3/yaOZWcsxYkbVY50l4GWlvv
	kC/RgYnbIAHl/B1QnHjyAkOZyBdRgGfflRpJdSfEScnv9G0DTu/ygqGuPdWWFnaNDVKhWVXLcaD
	xZAsT4W7Fhh1vozoL8BCw6g/xvO46cU97laxZcMx3JIaZqGorclxxxLZi/2qlxeGjgK0OzpOmFu
	XTvV06+WE5YRq4VMf6b4af4eKv1nOAQZAynr32wlMdAschjkpmjXt5GIzJ7TkQtlzFbe+YoW5SX
	9snJygMQoOBLyG6uGJm50nxloOBZYaBVqsVsDAjt7dshN/yXGHxKQJvaRKHLiZ4T06jkc=
X-Received: by 2002:a05:600c:a404:b0:483:6a76:11a6 with SMTP id 5b1f17b1804b1-48fdafcf030mr95235e9.5.1778709300573;
        Wed, 13 May 2026 14:55:00 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19b1dsm1499641f8f.17.2026.05.13.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:54:59 -0700 (PDT)
Date: Wed, 13 May 2026 21:54:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <agTzJuKQoBqfQkq7@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
 <20260501122424.GA6912@ziepe.ca>
 <afiO2WL4ILGfmUui@google.com>
 <20260509232155.GH9285@ziepe.ca>
 <agG6n4CeuIMD57G1@google.com>
 <20260511141849.GO9285@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511141849.GO9285@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145502_925722_A81D41D7 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, May 11, 2026 at 11:18:49AM -0300, Jason Gunthorpe wrote:
> On Mon, May 11, 2026 at 11:16:47AM +0000, Mostafa Saleh wrote:
> > > IDK, why? virt_to_phys() is part of the iommu-pages API, I'd just
> > > leave it.. If you want to narrow it then #define it for pkvm when
> > > compiling this file..
> > 
> > It is not going to be part of the iommu-pages API, I meant in
> > io-pgtable-arm, we will use something arm_lpae_virt_to_phys()...
> > which is then implemented differently for pkvm.
> 
> Again why? I think the main goal should be to not mess up the normal
> code. 
> 
>   #define virt_to_phys pkvm_virt_to_phys
> 
> Does that, we should be leaning into this pattern I think, not adding
> unnecessary churn...
> 
> If anything is needed then it should be an iommu_pages function to
> wrapper virt_to_phys() for use by iommu_pages uses but I'd rather
> not..
> 

Sure, no strong opinion, I did post this patch along with cleanups
separately in:
https://lore.kernel.org/linux-iommu/20260513215203.3852661-1-smostafa@google.com/

Thanks,
Mostafa


> Jason

