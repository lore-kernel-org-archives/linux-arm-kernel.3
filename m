Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5DECCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r+cvVvthJeda6jwwlkAlFYev3VYphC/LLXDxRNEd7E=; b=JY299H8fZY6K6xOZm6w6vzfpkH
	SfOq7aseSrXt4e9FBOgTnxC2SCpMyuhCwBF5oG9jJRk1xsqIbLx8Je2LA87p6uONKi4aW0bhBpnkB
	2r7QI/kx3HyVKhyxYAmoN6wv7iLMX7a+ZPY1NOKCUb8TzUFV3XlvsWBwGGB8BldZROtndgSZd4nZF
	sO8I5FaJ1OSNuCuzuZlmFwo7wBt2ZFfWlJ427kRVqmyIu1ZbRxNq2aKBbxXTOjx2TW/bV1U6dDksG
	QNH+wRWrcQIoDHFOx6AQrFsJwbNCsB5r2ffGgEiRXeRGZG/2ulgr7ee7sY9SgoN14RW43KW0D4PdE
	Yff7w+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zt4-00000005KSJ-1DyC;
	Tue, 30 Sep 2025 12:55:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zt1-00000005KRu-2MTQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:55:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e32c0e273so51385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759236917; x=1759841717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9r+cvVvthJeda6jwwlkAlFYev3VYphC/LLXDxRNEd7E=;
        b=lq4TIFLnrSXxJsdse/VFiKGK48lYjH0EWNMhaAulSpjSefHF9Y0vHlSFsffeP6WUQc
         sUJJdSBl3zFlmX52ghKUOQVIIOgDfMqgLUh/xkwzQ1mSTn2GsgRXALEt+mUzkSDFzu8a
         KiOCmaP1/UVxNPeYFq+tpzmx7VlDIFjwjm6YXhNHMl/BERdOizYOoC6edXow9J0myRT9
         EHuvEz75Qe3gTDaHDZHkZI7G6t8xXucY1+h0+qyyIvBRiwGGC2BvLmrxgi3ymtBwHhFR
         wqtQyRHlFzuqAq2uu5zi92Mg3Zy+9ZduNv2XiBz01kuWDsqcZiA3IOZ+OsN/fGAu/Z+v
         W4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759236917; x=1759841717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r+cvVvthJeda6jwwlkAlFYev3VYphC/LLXDxRNEd7E=;
        b=iCz2o85ggMg+13gSt7JW/iRmt7TTpdAO6ySZ812/hV+J757cl45XvvS3S8Sx/0KhNX
         45OwLgfIeTUwSLIkW/s5Y9+q5v2OnOpca+AtddMEOmJaeJv0y3dWpZpjo7FM199/pwHt
         +hQ5hLh+MIzWOfVV0o8pU+hj0paGqV2duz3sUhYncaJf70lT5vIz93vPJh+sWj/hKeJv
         KLFViYEqkfBRMbwbV25dtBs3eD7Tb2+LAyrp6JBIsA6mMRMX6LIlrq09N6pt5+/T5HMG
         z2Ow7/fCqhn/3Sqhb2W7nK4cNVDspz/ON78JVIXGh0EuH3toV785c2WuXj8BBF9savH/
         BWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA8LwNyEKkiOn7WFB9AEvL/qtHLEzJ/L0EWrDw/K3jlopXGsThtWeitka3AbnNsQLWsxpku4c6XPDJcQwEpq9+@lists.infradead.org
X-Gm-Message-State: AOJu0YyIBmq6lbKialOKR3cVulLSdF1RGB2iYJn9H9/a2iQsAcUxSzc7
	oBMWoau5LLqhFBpfPNfsqTaBSjwjs1xABhYQ8YYeIWIxfwqochQtYvc3FqZJ4UpFdQ==
X-Gm-Gg: ASbGnct1dvXWXJtnSUQE1Zdbg6FtoVISWhiZvLbs/znoqG0EfhDgXrFGKbYcszUjef+
	v6PKu57Xwl5qz7On4Fsizo9eAjLSYRJtQcWvyyus/gqM3gUFu9MLyV0vW7nwhUAMax+LCNZh4y/
	O7CGZ2ELZ+ukY7GLBdYY4367PCvtrmKdgAvzGlUW11BTaiZezPW1L8LnpVrU7L0FHDL5E7cFbMh
	Nxq82nrTFn6l9wTMNzfXdfaSQ+lJBpabU1dgI/doJjAPHMAri/VMzUGK8e7nnV0suawZq3DVrBu
	ENN1yg1mfwtoGNQo89oggezeEXvt0zqSrKjJ0oB9uwtsRiHgmDvGug0YZrdTV0tjj7RzklxoeOe
	o35sAxzWXRWhUoTSMsXGMHaEECXct/PAhOjtyhkHnE8SZDDBZxfkuglQ+GwedLl1NbnW2MJfV9g
	KYjaD5XxOn/C7xAVWwlCWEqPgVow==
X-Google-Smtp-Source: AGHT+IGGZCxjhudadmu4TvjrKZEZvXrYowNUd3ws5uFCLuqdd4dGNuu0nzAp9pr9x9cv/JDPj1LoPw==
X-Received: by 2002:a05:600c:63d6:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-46e59bd9020mr1747905e9.0.1759236916661;
        Tue, 30 Sep 2025 05:55:16 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm22503716f8f.32.2025.09.30.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:55:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 12:55:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <aNvTME-Fmw8lpT25@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
 <aMA8vz0v0Vn-02QP@willie-the-truck>
 <aMlzLsj5slPQhWEr@google.com>
 <aNamXlTErXDs1K8Z@willie-the-truck>
 <aNpm9odmzv__2RyA@google.com>
 <20250930123839.GL2695987@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930123839.GL2695987@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_055519_637973_4824EE79 
X-CRM114-Status: GOOD (  21.99  )
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

On Tue, Sep 30, 2025 at 09:38:39AM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 11:01:10AM +0000, Mostafa Saleh wrote:
> 
> > > If the SMMU is in stage-1 bypass, we still have the incoming memory
> > > attributes from the transaction (modulo MTCFG which we shouldn't be
> > > setting) and they should combine with the stage-2 attributes in roughly
> > > the same way as the CPU, no?
> > 
> > Makes sense, we can remove that for now and map all stage-2 with
> > IOMMU_CACHE. 
> 
> Robin was saying in another thread that the DMA API has to use
> IOMMU_MMIO properly or it won't work.. I think what happens depends on
> the SOC design.
> 
> Yes, the incoming attribute combines, but unlike the CPU which will
> have per-page memory attributes in the S1, the DMA initiator will
> almost always use the same memory attributes.
> 
> In other words, we cannot rely on the DMA initiator to indicate if the
> underlying memory should be MMIO or CACHE like the CPU can.
> 
> I think you have to set CACHE/MMIO correctly here.

I see, I think you mean[1], thanks for pointing it, I think we have to
keep things as is.

Thanks,
Mostafa

[1] https://lore.kernel.org/all/8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com/

> 
> Jason

