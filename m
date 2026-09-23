Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E59C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZHQHfq1ph65L7qxzKlrPBl8SiUbUAuTYjQIuazmnA4=; b=ieiGCemXt30VbH+juJQkhtJdRE
	Nm2WAIgvXDYet24myY1157M8ATkp65y4VoOPyY3IrOQ20YgWhtcl3E7iiS5zQgR/i0T5u+gQlogbI
	0BjKYMWKpi3KcXwSFjid91xPtYiMN6SEIe+5E2MTenIrT+kB2LXt6mtoNiTWux2jg9kfOvFdu1Ni4
	KN7alBb8oEYrIhMBl2NrBLgij/7DtXYuNs9fgkwpznJ/KOCbFsmkfaIu3mlJ0eK3hduGqM+Up45Jn
	BTlqF2y1+uPElqWSJn5asKdAj4GZSovdBArUL5TYvTkTQh+No50QqWa37TIYKQ/d9CL06nIIf+PEp
	H0jaVy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K1F-00000007rvj-45B9;
	Wed, 23 Sep 2026 10:16:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K0v-00000007rpN-1VCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:15:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso30965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790158543; x=1790763343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yZHQHfq1ph65L7qxzKlrPBl8SiUbUAuTYjQIuazmnA4=;
        b=fbRc0CWH/bqTuDTYVDmNaSx771zS6hc61ze9CwSgZEjJVsJD0x6qwqoS7DmreyPp9S
         ArOhRgwjN50geEofb/RRqLqwaeNd1mMCBXeS77ALmpHiWb0fmJcrOIKC42+Wl3t5oO2I
         8keGWC2LMnFLPZeJ6lRwC34b25GYR1FrLI8W0Uib9ay+qh1cWtbHA8ZJtvcVnRdClGz7
         fGvcO66S09FDLclx7ZKCr2wGckcgvxZxrNSCfxX6WLjaU+5WI85LKcUJzIt8BP8Cj+/q
         j2KmiiHyDY7EkYW6VsEmghy1zcdP9qLLOpnuR6sf+zuPU0p8AUAamWOqUgBjwUpaD1B5
         eSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158543; x=1790763343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZHQHfq1ph65L7qxzKlrPBl8SiUbUAuTYjQIuazmnA4=;
        b=dgTDWteEavaAXIG8kofcf+hnHdW3sSWzHzRemLeX815LD5xO4MwkgNQ4VprFe4nKIQ
         JfPGpvo2AuCT49mrtxyfTmkSqniY3JxY8NbpqiYcKjRksmOupl4mqLsOmNfP3cbAi7iy
         xPcxzoWuQ/utBVSRu8OwuGTK/pyaWWm6sIXiTHGAbLMYGqh2g3MPURLEzoZ4xV2R86++
         feVBf0tgTdKvcP2wiuXY3za1wKNqzWK2oDGdsHnqnRqYVyxQhoR3khetz+wZjXpc3uEE
         luy6cXWNIjLaY48ZT1BznTf/rQr8dLCQg0E6H1sq97RCH9HWigqSHP4+S4JD1xFwbGvk
         eQgA==
X-Gm-Message-State: AFuF++n2+QJMSJB/+A1JsThj38sc+07I0vckHmFFjvRT1wNbV5M0zcTg
	YYK1Ge3eIyNcY4ZGXH5sElzKfnIrobnUwA3izlRV8tnuRVK3QmsHQ5W+irEafG4wRA==
X-Gm-Gg: AYBFou03pYkTttTZ2L3bmbS6U0Dx9fJhFHuBA+nJVfvsjIGr69lvAHC2UET4+33beNT
	UXZFNeKHj2wZ3DJfxiIKH22SyS9x58ZMK/hy2YBmndyjjJxUJwsLVhyf+afi7ds563COIwwFKrd
	tTKFZ/WoVqUWUY1y37RX2BlPjwmfZ5Y/+XA8wAlYLKAZ3MEKyedkp+cWCFeRhsRAfMS7hsAW5Bk
	44BwPVjZ679bBFulfgVyKFBMSFavK/Br6YcWYcwnQysSAtJTF0pdk17Ag1K524KhNFWNCBpQr3m
	9BXedd8hTCs5XfRqKWk9nOLQ/amE51Q/wr144hPr1gqA7UiZ9uIAyW8Ov5qEpF75Ma3eVT8nBDh
	bUfVYO0nSOVlyQ/EqTZytTq2CFaCp+1tL8xQMnoEYLwsNLFCWiT2nTc7n7Pr+MYwfDJoOiIS0Lc
	3glnUTzZEU1ax3HdPysp5wuk8fcaFFZrOoYJ5hwR84IzECSiQmBpu6Bq4F+qM9Eb/QN7MLil/mM
	eluCyyaqQDvRWtVM048hGQN+HW8q2VOh/binTR4
X-Received: by 2002:a05:600c:379a:b0:49f:c6ca:42d2 with SMTP id 5b1f17b1804b1-49fe0c0bad5mr679925e9.1.1790158543084;
        Wed, 23 Sep 2026 03:15:43 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e975asm71831925e9.14.2026.09.23.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:15:42 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:15:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 05/25] iommu/arm-smmu-v3: Move hitless machinery to
 common code
Message-ID: <arOmyuQwuWkynORS@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-6-smostafa@google.com>
 <arLeIO20VQZD80nr@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLeIO20VQZD80nr@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_031545_429723_DD79097F 
X-CRM114-Status: GOOD (  16.45  )
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

On Tue, Sep 22, 2026 at 12:59:28PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:38PM +0000, Mostafa Saleh wrote:
> > Move the hitless STE functions to the common file so it can be
> > reused by the hypervisor.
> 
> s/it/they

Will do.

> 
> > No functional change.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> With some nits:
> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -59,10 +59,8 @@ enum arm_smmu_msi_index {
> >  	ARM_SMMU_MAX_MSIS,
> >  };
> >  
> > -#define NUM_ENTRY_QWORDS 8
> >  static_assert(sizeof(struct arm_smmu_ste) == NUM_ENTRY_QWORDS * sizeof(u64));
> >  static_assert(sizeof(struct arm_smmu_cd) == NUM_ENTRY_QWORDS * sizeof(u64));
> > -
> >  static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
> 
> This line removal seems unnecessary.

Yes, I will fix it.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -1321,6 +1316,8 @@ static inline u64 arm_smmu_tlb_inv_range_enc(u8 num, u8 scale)
> >  		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
> >  }
> >  
> > +#define NUM_ENTRY_QWORDS 8
> > +
> 
> Maybe we should drop the duplicated define in arm-smmu-v3-test.c?

Makes sense, will do.

Thanks,
Mostafa

> 
> Nicolin

