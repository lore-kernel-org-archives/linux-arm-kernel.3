Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DBCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIdF/st4oFvQewvhyAv6hWYWHihkA3x4ZWjHakET1Qg=; b=gZjCjuRBbVBHZRkWFjBxk8JTpA
	WN/LvxxXlKHdtxywS3SF236bzI+CtVWHaoKyskG2wAadLokRTkMqeSecAMEKXvE6UpRX3EnKgOeIM
	FA8/ODI4yDgGzBz6SpBPRLK6wkL8TFAwM6OvwW5IRwMPrzq1cI9eIIjfQTPLint+jtQ2Mb1uMRJU0
	QkTe/hvmlm2toN9SQ2JzVSalXX0dTlBNMCz5QkY9NXMSIL7v1hfuG0Xk3zuCnzR3VgQfQr9BeP6a4
	ij85LiCMXqpFtXeq94ojTsj/SUQt+0jjGkYLcGdBoJlmFoLuVkoPgiUZ3kf4LyqOIpj3ljOvOEF54
	2uECz48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXSZ-00000008GeM-0ErV;
	Tue, 16 Sep 2025 15:19:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXSW-00000008Gdk-2p7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:19:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f2d21cbabso61915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758035947; x=1758640747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rIdF/st4oFvQewvhyAv6hWYWHihkA3x4ZWjHakET1Qg=;
        b=OshwZLC11uhZh2mnc3XybrA4vgakTGmi4/fW/1wkjBOnjuj41fXZStGqDZHuB1xk32
         mz6jkjr/w6jTx6LxOTzZ5iI/pYPDPc9RnFMUKc7K6vG8Cnywm7voaMV1NXz0azgKiyzL
         TdYx2ADkSKZetpvP4DYvjDY0/ltH9gjyawQVtmHvGNsSuaGOXdvua0mmw4cipKtgSxzR
         ORtFaVgFeRSFqDzM8ktqM7dkzv1Yyn/CuaxcNQyqck0bXZibc3keLS0sC4qXkmKMR/Ej
         +dbwP2MOlgqmZWEvEGDWaTtsdYDI1kLNpdVo8QxjYrtDOcUFe21bu3RLyUXPMhgL4YMU
         rx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035947; x=1758640747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIdF/st4oFvQewvhyAv6hWYWHihkA3x4ZWjHakET1Qg=;
        b=phFMiVZGWyY9LK99pKbEpxm+KVR629NEjkH0CLKLwbKrUkH876adD/k8hpYaOhGsrU
         3n9a6yFj3hx8/UeSwZigg2pVCLR3N+AIT4vsEjdWA5VVJSfx+rRDzuyxZ5My3vP7u46o
         ot8Lovplm39CO9KAcbPeazQbx8+vWzdQt8s/PO9eF1kQFki093cQMXcooW1pY/kc0Jcj
         7LHZIlYuG7siRviFtTuGJtIyB6RoCA91gJXRCYSTo5Ij3fyIVImtFz2Tz0GlD9M6IzfI
         CfHhcBQpllSe7l2fsDSGh5e8FGx+iA7ftieROOSgfx7MyuY3M5pMTTOAMzOqAIv1OWT8
         FBqg==
X-Forwarded-Encrypted: i=1; AJvYcCVn+T/15/oaGDiBhyygjIp9iixULzmiaCZ8xG4GpGghL4XBna0IsF3FCw/8enOJnEY70roS12v+y2Hohh1/i3tO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9MXxpfN+GW7El13QZrod97QWgR0/KluFHlC3/RPKxwjLcMu/G
	otoq52t/lNQhl8wJmofibUYreMsUs0j6QaNuDoXMTvOuc2X8ueudZThsNpoFBjgwIg==
X-Gm-Gg: ASbGncu3qTJsxWz+imBUaeZVCGIc4VRhax8lXKCpxrMRbjlE9RJEzE9GCHqHJqGJuMS
	adAIzrGBH2ozgJg6GZTz2DhRG30lCcXXblkO32dQjYtu1wdNgHrQ9pFjQ2d2uYncYOrybkg2ait
	3t6GwCWK59cFyIEWkvaM5q5pUbwQro4Ejar8ZELnPQLu3Xed9JH9dhNB+J4GsvZbHtGSeCWhggP
	3LaJxY0W9DDAno3X56CAGGKEnE4WxZ57hhE0Z4VXsr8WQw1H2/T6hUBUeQkFXukiJ48Z/9liNIH
	XX0wzPP88zFyQpjbeM0UuAiN4hyx3L7GnDVMk6kOF9nG40p5an9Co4aecuYGU/V7hlDTGaYdieg
	Ns7HQFp4kGmbhVvXQsz/itSWD3XjDR7UIkHWigaB8T2CnPAXcguv7bkI8hR8EPHE61cZQkw==
X-Google-Smtp-Source: AGHT+IFZBaWrZvk9P69IbqntWvXL1sAk3O+k3JpJsQacEjetwuxi2scOhS4JAiiLO+ZhfieA/FFXgA==
X-Received: by 2002:a05:600c:8b6a:b0:45f:5b02:b0cb with SMTP id 5b1f17b1804b1-45f5b02b390mr1308995e9.0.1758035946681;
        Tue, 16 Sep 2025 08:19:06 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e41b6dbdbsm211187025e9.22.2025.09.16.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:19:06 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:19:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMl_5j8G3IGulAC6@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915163858.GK882933@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_081908_726186_8706C855 
X-CRM114-Status: GOOD (  25.22  )
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

On Mon, Sep 15, 2025 at 01:38:58PM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 12, 2025 at 03:18:08PM +0100, Will Deacon wrote:
> > Ideally, the data structures that are shadowed by the hypervisor would
> > be mapped as normal-WB cacheable in both the host and the hypervisor so
> > we don't have to worry about coherency and we get the performance
> > benefits from the caches. Indeed, I think that's how you've mapped
> > 'host_cmdq' above _however_ I sadly don't think we can do that if the
> > actual SMMU hardware isn't coherent.
> 
> That seems like the right conclusion to me, pkvm should not be mapping
> as cachable unless it knows the IORT/IDR is marked as coherent.
> 
> This is actually something I want to fix in the SMMU driver, it should
> always be allocating cachable memory and using
> dma_sync_single_for_device() instead of non-cachable DMA coherent
> allocations. (Or perhaps better is to use
> iommu_pages_flush_incoherent())
> 
> I'm hearing about an interesting use case where we'd want to tell the
> SMMU to walk STEs non-cachable even if the HW is capable to do
> cachable. Apparently in some SOCs it gives better isochronous
> properties for realtime DMA.

Interesting, I guess that would be more noticable for the page table
walks rather than the STE, as Linux doesn't invalidate STEs that much.
>
> 
> IMHO for this series at this point pkvm should just require a coherent
> SMMU until the above revisions happen.

I think the fix for the problem Will mentioned is to just use CMOs
before accessing the host structures, so that should be simple.
If it turns to be more complicated, I am happy to drop the support
for non-coherent devices from this series and we can add it later.

Thanks,
Mostafa
> 
> Jason

