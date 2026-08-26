Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41462C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7ckLEdPbhTyPVPfJ+i3gxu5g8YB3cToPtYH/B0h4a8=; b=Y7XFNcFvXqcessqHrYjZTgdF3+
	aSzymeS3I+7GGJLSG7BxN10Ap5YP3CCvflx0ghcQ7IAf1+N7i7j/B+DcNLN6VIlaIwmOZIzX/3trj
	0fh0hDdnUA1vxZXjuZ/Q4GCrPvz4C6Zt+2CZnGwgZO+mytKPLeKuNMAm0J84pSPJ2nJV85B/1TxLs
	Aafluf+w5eMzsg5/Mqeox1CC9SoVo8HCS0JK3Lx/QxNZXy7KTIjq0Uuy5AOr4+aI3EQBw8EkBa8sl
	r9fz346YsIf4VhS+SZph6/mW0eL4ereEJba7gCBIuAH0T3tDHKJJ702QlaWEVg9aiLGR1kvdXTeEQ
	iOGVGS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Gq-000000027HB-0MmD;
	Wed, 26 Aug 2026 08:46:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Gi-000000027Eu-3048
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:46:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499add6348fso30995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787733957; x=1788338757; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7ckLEdPbhTyPVPfJ+i3gxu5g8YB3cToPtYH/B0h4a8=;
        b=YJFGaKtOrL90DpZxiK1hWLPAcom8o0N3rIaCO6d3+BD/Cdy2WfFW+vF9zWAIYqH9SN
         09jlK/iPw8iVtzHGrjPW3UlKfBr1w15J8czckUOIoF0R9CIW4ydTnwdSNR7aiUHw0qwj
         NNAz4LZmwl54bp/TPsnTThkwObBhw3+CfbzXjMw5bZtucpoZ1aZaX9T1Ce9eIIeoNS/G
         JSYDIYUpJUusi0YbLvmY7wvQk9338wE6eGCgoQYUhl3F405MBXU1dPP+5GzL3/k9uMvH
         xrCeYtf5LEV1TGfghOaQjn5r4CF47xosMJdTMP6MZrMrPcQJM6QpIU8dOfC3S5eADkmN
         EkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733957; x=1788338757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ckLEdPbhTyPVPfJ+i3gxu5g8YB3cToPtYH/B0h4a8=;
        b=Y8Jw94uTIfzhCJewt7FJ8F/vlmYjzmYQzHU77HtgHBvuvz8iDhKqoYzxqMEPycx+2q
         0bAMDXIYTE0T7etvB59lps5KD6uxRvgC2ii7PMoY2IeKVBfidLUOlzxOrIq6NREZchJc
         XFAGhsliayBkoQhVbRXMWzO2XJ35xG6PY3yDNiGkj1EVBua+189s4pmDxzVCN/P5sLnx
         5rARGci0JVbGeYEtZaMoBeFJZ7SFU61b+ZJ959339UzOXGcEBsFouL/ivYulzqILy6e5
         oAT9XYXjI53bDWS866j9GAp0a9K6E89dQRHMY4c4qtXiIJG6Rokl39K+MTREZaPnwcx2
         rdZw==
X-Gm-Message-State: AFuF++lKo5YMVQijLaD9vY2nHp5H8fH0mxAQK35AJB39GFtuGrLMB9GQ
	xUfMSdxoVWbvFko/AuTirIpkZ3RlZ0n/3X3HvmlCNhLnGZ2txONKnG00sva8c9HzyA==
X-Gm-Gg: AR+sD11sp4L9sylUK3YzTdJsXMvV8ljk51JlWbR42i4LPXb7EQI4W+2FSpEzfMIypec
	/QzgyzFreKxPAqYslV/FhY04vy1vHQSSbx3vDTDXf8nFNq/P4tWqHqwA1y3O1o1cR93lfsiHDhn
	EfMjkPLc/cKQ72YUwRHdGbSVzZ2E+38VELuw1EzcMn3ZnqwRChmaD7JksExbS7EeRH6RBs9n0jo
	W0c/eWGz+gaQkR1MM03hZONfS8JOyJ74dmdPkmWTbtKrpD9/huSwYRkgcp/hBrKU9aq/VXo+o6+
	YB3S3NYvAAVc9yhgMtFH3sqFCzxHzWfHS7RvnpTy8lzbziSY06s09aKTmP0p32GppCwOkHwtjqr
	Chr63I0OB8RSKHFi0UKlHj7bUODoYCKzUSFCHlXGpxfQtks7fTzRce90HgBS5c/Koi8ztz2utsJ
	XjDyFxW7eZAKWRuM6fT9yCDvzOKBE4xTPdfpR6UrkChhsSdJUJ7ZybmRJV9kQQENX12JzeTty7/
	5cps0c7Pou6Exu1fHASiQ+b0DTa7qmjyi0MPNzG
X-Received: by 2002:a05:600c:2d91:b0:493:b47f:a24 with SMTP id 5b1f17b1804b1-499dd500ce3mr457395e9.6.1787733956245;
        Wed, 26 Aug 2026 01:45:56 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5b3958sm8743505e9.0.2026.08.26.01.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:45:54 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:45:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 00/24] KVM: arm64: SMMUv3 driver for pKVM (trap and
 emulate)
Message-ID: <ao6nvupFg7neLqbN@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <178769159057.3356902.1232440069489543145.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178769159057.3356902.1232440069489543145.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_014600_788270_BE346E15 
X-CRM114-Status: GOOD (  14.23  )
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

On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > This is v7 of pKVM SMMUv3 support with trap and emulate
> 
> I tried to compile it:
> 
> ld.lld-21: error: undefined symbol: __kvm_nvhe_iova_bitmap_set
> >>> referenced by __kvm_nvhe_io-pgtable-arm.c
> >>>               arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o:(__kvm_nvhe_visit_dirty) in archive vmlinux.a
> 
> I think it is because I have CONFIG_IOMMUFD turned on.
> 
> -#if IS_ENABLED(CONFIG_IOMMUFD_DRIVER)
> +#if IS_ENABLED(CONFIG_IOMMUFD_DRIVER) && !IS_ENABLED(__KVM_NVHE_HYPERVISOR__)
>  struct iova_bitmap *iova_bitmap_alloc(unsigned long iova, size_t length,
> 
> ?

Ah, I don't think I tested that config, sorry about that, I will fix
it in the next version, I think I will just stub it in the hypervisor
if possible.

Thanks,
Mostafa

> 
> -- 
> Jason

