Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1B5CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyqXd6ge5y2aj27CRXRh3J8Q1q4rd+TcymckOxNEG8A=; b=soL7eDZcDhvzoXsEefl/4FLV2F
	Vl3gwRVyo9jQcPFLLRLpGzGKuC7TExUDV7VY22+cY5A5nadf6d3UfphvmARWDc2DIVxmjB5hlGoJR
	stAxvFPNJ7apeA45M6l7TIyD2ymPl6bGGPVu9TKmWZBgSoFSjA1uQ2aB0vHDZwLonfZD0opq1+Vub
	CeeB62YEJChO1u4A0QjFuwxCowBy/+ZJs/ASItZRpTTjfCz6lnoDQc7nxvqwY20DEOfRgaDycGm2T
	bMtxRmMhsaRlEVyZqtTJrROs0jiavRSW6eQzduJo8rqBWS3nAjPyCxbhZBewJty99jUIp5/Fcl+Xa
	tUELfO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3bY-0000000G05F-3Xdx;
	Thu, 06 Nov 2025 17:17:00 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3bV-0000000G04i-3fdk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:16:59 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ed79ad2846so9089841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762449416; x=1763054216; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyqXd6ge5y2aj27CRXRh3J8Q1q4rd+TcymckOxNEG8A=;
        b=n/CPUbSampdUwZrwgHmJQtE8qf7m8aCqB+FFQx9bAin4h5M4ZzJbFxkbRwEZbYq84l
         4LSB0CgMIyHnaBCJlNofkbWu9DzU7swgAoqMeeO507Ps5rUCk8nXt9k7CBG9xcyvL19s
         3zNqhVmAuGnrPJp3qto/p6CK1cfmA6led2TCYM5ts9kaGBkANJArlr1X6SiNJVIaKSyQ
         WepJzXGODk+0DYkZ13y+pKWYNHr+U0KEOOSZg39Y+7LbrpfumPrjq9IETZwNDU6OjrXU
         zTSeklossDCApaSoB5aZ8Etdg+NxBCTQUviqNRXGc33JXoZJ4kB5olFFkOs5OjQgnxdT
         kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762449416; x=1763054216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyqXd6ge5y2aj27CRXRh3J8Q1q4rd+TcymckOxNEG8A=;
        b=Lzlsq9ThKEm7D+9RiiyvQe1FZ23btOEjoGVPjKyH5wCyM5p/bbN6/3UWZs+32qG/El
         CUdneQ/El1aIaJb33KVD7yZU2EcfsovckjxqezhTIDYxH/qBYMRtgYOeDJknEcReP1TV
         r38O3upVM0SWXq/3DsvW65IhQiGZTd1RayIUL0s7Exag77Pj15tWqG47c+R5w5P/Gg3j
         rkeWc06B8V7WyVx7nmABDJWoE/Jbc+VqGUDmBGGdgiva2utIP5SAKbjg0MxixZ3bv0ND
         8w0XiZZtBe/ZhvJyqpi3ztNSWTO1UB/reIE7TW12gJ7ItG1pYlhzZirvpEgoLOx1i3v0
         wdmw==
X-Forwarded-Encrypted: i=1; AJvYcCX42eN29SxFngMzp7Ih7Wm/BIumVp34i5mTU+J87IiTJc8Q+vqO4bOQ9bC1Kk0v+zwMQB4xU9PsolU2b84W+pT2@lists.infradead.org
X-Gm-Message-State: AOJu0YwoagR/tsbeA+9SGnB5T2uVZj/ecsDuXBeBpeb9UXCrOK4irq4V
	ZeYvEnGvfAN9a/u9RWi0AkK6rqNGRK9rCawstHeL3BmttvH+LQUNXutOfOpv/A0MstQ=
X-Gm-Gg: ASbGncvK+02OKxfCs7Zl2CWt/3ZEl9wVe7e4/ngUgVqhlmeZE5nyZsdkK/6ZBMBt7jN
	xdEM90GA21F++PQ6Cy2Oe17b3ResKOlE4wHj0cxBqE9ciC83Y9sTRHnOoQ+s7gw9oFys9jKLxke
	gHvPI/riJYsdjYkbp6x0meb3iyeDtq3OzbGbTrrp5R/rZ0Hx1V+N1GSOxOywpyacafhBK7gX6YN
	IjkZ76Hm8tGHsX+/ftQX4Yy6dPYeXYT8lxzi8tujwxfEtIQAVlx00yUvrvZXMavtE2UmC8Kyx32
	qpUDDHaPzlZVjCYb6DuIVrn4IfWGQ44YG+I97RvYizsEIzMhip0a0Hp0ozjNDV29PhZOm72Pn5H
	AZOi60XDCnUdlN50E/0tb63jhMd0fUGbvUwZBt4FT/KT/zUrVBohyiVDqR8BIZf0leuDFyjNzs8
	4YEX/jrZmj9xwcQF3qvXGDDgc/DfHlSC1i5trWVXY2BqcCVw==
X-Google-Smtp-Source: AGHT+IGm7rjI4btGT0uAp5U2+RTOpSSDx/JneJwxU99rel9EmV7Mer/iD0OJK3RWNsxIkY3fdHP+mA==
X-Received: by 2002:a05:622a:410d:b0:4e8:ac66:ee44 with SMTP id d75a77b69052e-4ed725e06eemr111576881cf.39.1762449415840;
        Thu, 06 Nov 2025 09:16:55 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed813b7ce2sm21908131cf.24.2025.11.06.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:16:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vH3bS-00000007OJk-2iYD;
	Thu, 06 Nov 2025 13:16:54 -0400
Date: Thu, 6 Nov 2025 13:16:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <20251106171654.GV1204670@ziepe.ca>
References: <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
 <aQt9-kTCe8TpuyVq@google.com>
 <20251105171208.GN1204670@ziepe.ca>
 <aQyBIohAuxNHV-XI@google.com>
 <20251106132331.GU1204670@ziepe.ca>
 <aQzSzhcndQ3Ry0a2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQzSzhcndQ3Ry0a2@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_091657_946930_B54EF944 
X-CRM114-Status: GOOD (  23.81  )
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

On Thu, Nov 06, 2025 at 04:54:38PM +0000, Mostafa Saleh wrote:
> Maybe I am misunderstanding this, but that looks really intrusive to me,
> at the moment arm-smmuv-3.c is a platform driver, and rely on the
> platform bus to understand the device (platform_get_resource...)
>
> You are suggesting to change that so it can also bind to AUX devices, then
> change the “arm_smmu_device_probe” function to understand that and possibly
> parse info from the parent device?

Yes, it is probably only a couple lines I think. You still have a
platform device, it just comes from a different spot.

I didn't it audit it closely, but basically it starts like this:

-static int arm_smmu_device_probe(struct platform_device *pdev)
+/*
+ * dev is the device that the driver is bound to
+ * pdev is the device that has the physical resources describing the smmu
+ */
+static int arm_smmu_device_probe_impl(struct device *dev,
+                                     struct platform_device *pdev)
 {
        int irq, ret;
        struct resource *res;
        resource_size_t ioaddr;
        struct arm_smmu_device *smmu;
-       struct device *dev = &pdev->dev;
 
        smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
        if (!smmu)

Probably needs some adjustments to switch places between pdev/dev, but
the ones I looked at were all OK already..

In the aux case dev is the aux dev, otherwise dev and pdev are the
same thing. devm related stuff has to dev.

> One of the main benefits from choosing trap and emulate was that it
> looks transparent from the kernel of point view, so doing such radical
> changes to adapt to KVM doesn't look right to me, I think the driver
> should remain as is (a platform driver that thinks it's directly
> talking to the HW).

I'm not so fixed on this idea, this kvm stuff makes enough meaningful
changes I don't think we need to sweep it all under the rug completely
fully transparently. If you need a couple of edits to the probe
function that's fine in my book.

Jason

