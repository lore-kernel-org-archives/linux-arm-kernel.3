Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A963FCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=945rH/e5rNYp7DXMDC1/KmZIttMnGVuMabmAVl9nIC0=; b=24eHDFvsHTX6J2JruGfFlMH49U
	2fOOw4psbD1SDz7gyvEwHrKzWzM+Jy0xWUDg6A9rFQs4CByQuPN3v1QooB1Sj0yfS5mjNzl9m92mC
	o7jSxJQ4JxHDARPagPZKxODNtt2lDXdRv7izt6vFv7QDnwr4XMELgECJkZuBbl1MxkggFN4gtk2sF
	JFdTpe63aDdRhY2k4iADq4HQRBggBSelNVUaF/zl7WteCvA1543wVgsGaOtuQTbMnS2xYRz3F1NuT
	h9p+8JnX05S4k8syCut14VoA8YXYw0QdThOhOWP+G2I7m72ddaqTRwjXOsh38RcwxVD8/ncbPKG4P
	4JiC2sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybKs-00000004RW4-2Blw;
	Fri, 06 Mar 2026 19:59:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybKl-00000004RQS-1lfu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:59:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ae523d54d2so11465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772827178; x=1773431978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=945rH/e5rNYp7DXMDC1/KmZIttMnGVuMabmAVl9nIC0=;
        b=TkfAPxOiATJq58vgJkQsP8ZLGS1k5Z9Qq4kLJYhp7+dH7uvUQnzamwT+qAoqtAwbJp
         qWHExUdvPsfa6RxQCWTXD60VViGXmvQNRE4uy/Dl/jGLpfUb2+pJi1U93kUGAC9rY1UR
         9ttEoiuMcRuYVFH/sYOolMVU/iHvGdH0DvaBrL27uqIzpf/1KURnD6PhQrg8nzNwR54Y
         Wk59Dz3ML4oGVCnkpIf7FgrV0vUBPbcPKyArip9ECDJhfrp0xyTN9cg0mQ+01KCmIuTi
         2y40l7bB4utHrcuRoMdppDAiiZhJmKB50P1+nQWiiy2dTdCfMR5p1X3GzyRSJlPPxsGN
         CX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827178; x=1773431978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=945rH/e5rNYp7DXMDC1/KmZIttMnGVuMabmAVl9nIC0=;
        b=CMbNwLXCUXKBLUCKUxTtBUnRhAI2BFe7wV0phEPHnD8FHxvUGyArmrGIAvPQlsAz4k
         /JDBUEP/cJb9qN/74n5biHTVhD17vnTEIHC+60k384shwDnuxVmbg++e+F8Pap+L98Wc
         osorI93v54CGW4vgx7j5Oj9NOW2dR/Q9uEXpJCeSwC+sG8pWuiLaitRqbtwN4HnVA5mx
         8onou7ezjUw3hGlD9MBKz989zyFJyE9RzDXE/BfGtHHwvaRPqCqbi8vRunvXyx9y4nfb
         wmnWUQpYkldEKe8k0HOC/YsW8ch+myK5PyOLSVg+M6sAdPWxdQX9/6MF6d8CoyFwqsY1
         zSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb4B9idrqDesZrhu7kCdNIJ7QDuDPrxT8EOJDY1uMZx1XQHOTG0xO/vcmCBm56IakGbMefxB3qLR43zrIsi3QC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1hnya2ZdyK7SKQJb8Fvq2rNoh3ur4hdmh2Dq0Tyz69M5sbfIa
	tnFfmZpcChLfWE38oEpz/fp+FEbqM5w531UghlgZs1BW1+CVDTLkhCjFxYQRmT0sMb15K1yfXRU
	FIXBVs60D
X-Gm-Gg: ATEYQzz+dL9CH3c3JPIrY6Pa4ork4NGAd623/jlzGsXHQGBJrY/yYD3IytIqs644bgo
	0scXzWfv4plD2/Kj3+CKdHbCWv3SuzPsBJq/Gn2/ERjYXV/aPKruaK7vmE1ecvxD9xBxevqWTyE
	TNlDB/UKcHeK4FgMLOcAlsw0dEh2fP8udobBEsvCz5ToMfc+D3byKrhH9ptIl5O8+n00Qq/IF16
	32tr8ZQbnMEBiRT5of/l+9luGNyWE5/HkaMs+AghQX5qs377l17xi9Zfv4pTmmE3dPYHr5ePCpl
	pI8fTK50gS4br567mOeX16dXAGkewmi84aEhic/UFVoLTQyihrXBGP3f6HrbqH48YfB3twaMLIF
	PPqejgtLaSU+vTSOawRg/53z53MrCyh1dz0A3FpPzIBauNM4qZ9M+a9uu0KNWUQ/miFCFMhEpWX
	cp3lWHnHnAeXBE/Il5rGhCdkUMff1T5qsxlfw5hY52AULkkd39TZxyXtF+g4r2BA==
X-Received: by 2002:a17:903:2f8a:b0:2ae:575f:3755 with SMTP id d9443c01a7336-2ae8ad8939bmr404865ad.20.1772827178041;
        Fri, 06 Mar 2026 11:59:38 -0800 (PST)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2130sm30703795ad.83.2026.03.06.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:59:37 -0800 (PST)
Date: Fri, 6 Mar 2026 19:59:33 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org, praan@google.com, 
	kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com, 
	kevin.tian@intel.com, miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <aasv1HYOKuuJyi1k@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
 <20260306130006.GF1651202@nvidia.com>
 <aasmWvA-sqi0KJwO@google.com>
 <20260306194312.GL1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260306194312.GL1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115939_476713_9E6F6880 
X-CRM114-Status: GOOD (  22.24  )
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

On Fri, Mar 06, 2026 at 03:43:12PM -0400, Jason Gunthorpe wrote:
>On Fri, Mar 06, 2026 at 07:35:19PM +0000, Samiullah Khawaja wrote:
>> On Fri, Mar 06, 2026 at 09:00:06AM -0400, Jason Gunthorpe wrote:
>> > On Fri, Mar 06, 2026 at 11:22:52AM +0800, Baolu Lu wrote:
>> > > I believe this issue is not unique to the arm-smmu-v3 driver. Device ATC
>> > > invalidation timeout is a generic challenge across all IOMMU
>> > > architectures that support PCI ATS. Would it be feasible to implement a
>> > > common 'fencing and recovery' mechanism in the IOMMU core so that all
>> > > IOMMU drivers could benefit?
>> >
>> > I think yes, for parts, but the driver itself has to do something deep
>> > inside it's invalidation to allow the flush to complete without
>> > exposing the system to memory corruption - meaning it has to block
>> > translated requests before completing the flush
>>
>> Yes and currently the underlying drivers have software timeouts
>> (AMD=100millisecond, arm-smmu-v3=1second) defined which could timeout
>> before the actual ATC invalidation timeout occurs. Do you think maybe
>> the timeout needs to be propagated to the caller (flush callback) so the
>> memory/IOVA is not allocated to something else?
>
>No, definitely not, that's basically impossible, so many callers just
>can't handle such an idea, and you can't ever fully recover from such
>a thing.
>

Agreed.
>> Or blocking translated requests for such devices should be enough?
>
>Yes, we have to fence the hardware and then allow the existing SW
>stack to continue without any fear of UAF from the broken HW.

And this applies to software timeout also I think, since both have same
end result.

I am working on a series to solve this for VT-d and testing it
internally.
>
>Fencing the HW means using the IOMMU to block translated requests.
>
>Jason

