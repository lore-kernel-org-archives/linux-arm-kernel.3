Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2E9CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBYh4sqVRv985C07Huopg2HBOyHMdBgVTsPZLDQuV38=; b=d6OuzbxT0/XoIgaEyKlSkesji4
	0B2I1LpRvZWpR3mc+n9lUAqtjAV8FfTQwxCR5IgMxJxP0zimgSc3x8tQZrPexIcMfZNq8bcu/tkP4
	AW6G7xqwLMAodqB/+/+MqHQhVPdIEB7gdcnYnOlfTGoIhXBG0WOk64zOerUWf6WjkpskxYV9MM3q+
	wVL6DCKSXxxfIzS2iP/3bZD+3yten1jteWWqgYZXe7XBjylfuAzpyxSsm5XlLZJsjR0MunyhEdLnz
	Y/F6q45HM9/RQ5woy4l8Bg3tDI1vWBLgs4jxeGzF/eFwR+e2zNHwKtTsbN1E0Km3HNqrSlM5h9i/V
	UZb4J4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zcy-00000005IUH-3tW5;
	Tue, 30 Sep 2025 12:38:44 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zcw-00000005ITb-3yO5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:38:44 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ddabf2ada5so58530341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1759235921; x=1759840721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBYh4sqVRv985C07Huopg2HBOyHMdBgVTsPZLDQuV38=;
        b=G9C+k0G9j5C1VK+nFWZEGcqGUC62Tarn5sLEjExRS1CN0UbQvVtBPzfvmkd8cG0W3k
         3493AIBGTbhIu7as68gweTk9bU4o/vlK11zOhc8wJGjvZ2ptgym1Ej5rlLyCO9elI9BL
         1jgZSFMvoq12H1pK2edNOK4RrDHE4H8cYwvQzRC47H/gN0IL+qAKwwcJNWUMyr1JGUpN
         1vj7dZENwFOyliiJSWUqDyTMsM8bN42x9NeKRH4swLWZhmRGTI/1V7ZN7YxC8HHexfxd
         opVrcDhSzBjOOUrKsC65YTlscK6dVOX55hNCK+IcIkf7txWBaP4wGCtSZv8Esf4FhEEl
         FTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235921; x=1759840721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBYh4sqVRv985C07Huopg2HBOyHMdBgVTsPZLDQuV38=;
        b=i8SDAnaFFUX4A3f8J/PKK6bEjSbcnqOiR9lOy/RovdzVRSHxr+9+S0fHnK9m7eImAC
         q/+bylBQG6+j4tP8Pjh/pLX8SgICX5W73dXvo6gaDXGf/aU+rA4f/L1u6ZME+qHVygBK
         p2CQkqu+17hwOMGRhZ9PEy15TKtZN0T4dBrkHbSfZQhhZi/9yDGL5ml8hE2muKivdAd+
         70W4fJDwxmDByRdr5pqt0NGKCt5K2hIevMCaoV8/Vq8QLTXglT5RcViHQWRBQL8l2JGc
         vOs/9ztlLuCLhqb2MiThjWJcgn//DR2OvMkFriFRagaogPkldP5obv3bqXAN3H+U09ma
         sfdw==
X-Forwarded-Encrypted: i=1; AJvYcCXXqaf0/OMyynNvedIMXAW0ObCBzeSifWZ5lDOXaKcgUza5ifmN3bhS6yx8UQVNX9OOvjSoE6wpZRmKCqJhQxu9@lists.infradead.org
X-Gm-Message-State: AOJu0YwcmFMV1GoH2bMUCBQ03wRLPT6ubOUJmd69khrrLFaodfWvDhps
	QNASF8NKxHzuVEopjf+EQ8t/0+a3M5Up9plZvIXHrGfUpcrbEBUUtBgZuXB2e3dDyJU=
X-Gm-Gg: ASbGncuxXuZ9jkzzD6SaRebdOCWN1QgBHhefvgYIaEql4qQnW2bj7VawKxew1goFBj5
	SBdu6aCv/jkD9aolJzInZX0CDEEWmrM1bU4IvhSixr6NyG1ve4O8Jo27tE0DxPxWAFDs/cMYXLP
	QK1Ha6KC/6OS1nfbZDCDkMUeOzMqV2sKiaekBIZpSppMTu2kLUs3ja3EdhQiK5miwOhSc7/lnbv
	XAbJC9xt71uoYhKfc2VfLQBdCUzC678lymriqk/nssIgtUaDO1YqJp03Y7BrgHE/nTIKl/LJZ2d
	gNpjWTtLQDNfWlBH3DqhOwaSpeHW6OMi+DU2nWAafIu+VQFXfpcOZdkZtgvJlRCxTtpeff6cPPA
	lK/IRLgm+Hd7KkdUwwLdGy3g3A2XSrxN6Y37weI6IIg==
X-Google-Smtp-Source: AGHT+IHgKpbQVt29fnjPpYGRGvSeW5uUhJfqcsuhp73OzWARyNjA6lxGY/bFMFic1Y10TeqPQbcyEw==
X-Received: by 2002:ac8:5c88:0:b0:4b1:247f:4e0f with SMTP id d75a77b69052e-4da4cd41ec5mr281429761cf.57.1759235921370;
        Tue, 30 Sep 2025 05:38:41 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e34ef75712sm8696611cf.7.2025.09.30.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:38:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v3Zct-0000000CWSm-3Tg2;
	Tue, 30 Sep 2025 09:38:39 -0300
Date: Tue, 30 Sep 2025 09:38:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <20250930123839.GL2695987@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
 <aMA8vz0v0Vn-02QP@willie-the-truck>
 <aMlzLsj5slPQhWEr@google.com>
 <aNamXlTErXDs1K8Z@willie-the-truck>
 <aNpm9odmzv__2RyA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNpm9odmzv__2RyA@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_053843_034990_4F6420A0 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon, Sep 29, 2025 at 11:01:10AM +0000, Mostafa Saleh wrote:

> > If the SMMU is in stage-1 bypass, we still have the incoming memory
> > attributes from the transaction (modulo MTCFG which we shouldn't be
> > setting) and they should combine with the stage-2 attributes in roughly
> > the same way as the CPU, no?
> 
> Makes sense, we can remove that for now and map all stage-2 with
> IOMMU_CACHE. 

Robin was saying in another thread that the DMA API has to use
IOMMU_MMIO properly or it won't work.. I think what happens depends on
the SOC design.

Yes, the incoming attribute combines, but unlike the CPU which will
have per-page memory attributes in the S1, the DMA initiator will
almost always use the same memory attributes.

In other words, we cannot rely on the DMA initiator to indicate if the
underlying memory should be MMIO or CACHE like the CPU can.

I think you have to set CACHE/MMIO correctly here.

Jason

