Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C165CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvsjMwD/preuv2Qmrdbeq0ug8WdJ2lDONAxR5Koyc4Q=; b=4bmTR+B2E6KJBy8WAeEjnjDKww
	j9Ts2vajPcSyTyQb8kOX8wn+rnh6Pt2gufTEasLqnazRY9KUozxXaLtJdCaNcRN+tiZIAyuPNs7cT
	KEdPVCTpYSCimHqoJv3Vl6lxLMt0p4D21lD6izB4PTB5ciRLDo/5HPc3lGEMVbPIuuXpVJD1sJdma
	LZwdXQq2a19IEIybRwVmzskr9zBruIvaj1YA4k3aCefBwc0rdZIWG+gtlz6YhA7mCx1ftf6XkiZPT
	ENmQlSfJFScwXYKaLSslz26KKFcfZTIyeCPVZ7S+zqNwdzgbhTAVkAdtrExRMHi+gU6puc5YyCpUJ
	hX6uMsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3gD-0000000BHwt-0MtG;
	Mon, 01 Jun 2026 14:31:49 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3gA-0000000BHvx-1n8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:31:47 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8ce9d444173so16307206d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780324305; x=1780929105; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xvsjMwD/preuv2Qmrdbeq0ug8WdJ2lDONAxR5Koyc4Q=;
        b=Dc/VvGAXgWFFzzof2Ohy5CGbP1HjC5ODX2dNl3XB3GJRNUjL/GqDAUJVJo23fb4c3G
         3ZJGZuS9Q06xrOOwBbp/vhmpTHL/1Ri1wDVpDWOlg+v7ELc+5a2WjFamPte7V1HmA4KT
         D3q0cyAE7zG4yz9kNAlTrhmwtX2DWjBtBFoLfZFu1OlnbbnJ5MOd10wBWVQ7IzQG7ApA
         SMVdNF3KKAXj+v56+R/8aIm0DlG115VbPVkEKDOqZpRULQHMlSWyaHdaBOa7SCmdqtfB
         24m0/1edVKyiiyS9Ad703q60poVh3wQsxoIGqRd3OUSonGtQ5FixtiXp/vVsmubcbzGG
         OMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324305; x=1780929105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvsjMwD/preuv2Qmrdbeq0ug8WdJ2lDONAxR5Koyc4Q=;
        b=XSUIjl4GEkrZil4VWLmEkmMAsbjzc12BTxCZsMe5mwbxb+7u6XKLPuq+vYfo/uCpO+
         kQvRLrVJNhgGZ4ElhSkR9jvPDwMevHopuiZfpb8Q7BhXnt+xZLt+048GFO1IrwhN5gFO
         IzA82uZiuWlZ8tEq1K36KhkaGy+31JUwujcliDEjcref9DZjLo9km3o0V3BTRozql5Tm
         jCiGlQpcjYGgi00Jmu77WIRFO2lCNfdwHtxaBMf+HICBIAcodA8Fyiw6abTwAf0iFN6A
         vAy8XVyCMG6TjucV7R8Aa+hI31F5NOGUfZ+YZlB+eokTkj/3KJHOKT2a69daxaHP9xXC
         Jx/A==
X-Forwarded-Encrypted: i=1; AFNElJ/M2DpqBfupLkf4T1ouZQgDjGae6tMZjoau11jXszoi48QZLAH43T0f8ow4vWnK3aY2WzDva6RFFxjbbLx9WXec@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ExgsFUe2MXbtJXVJi8MXOPB2XvQluNX9UH1JZK+ij1tTqzpw
	HL6hnZ4/RtEAPfF5Iriep4Apo+8qcRKKFar1aOeGhWKoIev5x/ooZxs1CedZWFW2BGE=
X-Gm-Gg: Acq92OHEewtg96ub3s5gQldqzEsBz3Ha8QAcSe15h5zoYvAnSBNOfNG5H/rQ0dXKmd8
	cgyaYdXLOhDiHspAv+aESoZosplYun+B2VhXdWoso0u2tHlZZZWdrYXndQKLfK3Cxm4O/DBNMpl
	zG3aB/aaZG8nUBnnWb5dFbT3snSt8AxSeLStDzb7NkHkAWHE55BbTB0ogoMNMsZjY4ktCzBcx+/
	Hg7hpaZbKGatSBB/4jZRIfSS6QYKZghpxA5fWd3ldG9j/N9BPwEHRkQhIgVKgQODK4eJebk7YtD
	vMq3QoouydAFh6ZFQ8LMJXMexbQE3T0Y9ROujueS9q60pt4hR7Lg7QtLLhohNOmpHLIM/mZ9M3n
	KjyvEEMEdK3SUET5UvmHxZGUbRRy3Pu/57TPziO1NR/BKmQpmV+vxISwYI8vcYs6Hoyuucrus/v
	gRtSJVrnYB6cG50aEkhBoSgw25oIZmg+HWWPi0AghZl1lkjTBS2c1hPRGpS8NOGcwSA2RpqQ7qK
	/3N8js8yMPbmlMv
X-Received: by 2002:a05:6214:2502:b0:8ce:b2e9:a4b9 with SMTP id 6a1803df08f44-8ceb2e9a80cmr38343386d6.12.1780324305009;
        Mon, 01 Jun 2026 07:31:45 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea064f97sm94142866d6.13.2026.06.01.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:31:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wU3g7-00000001mzs-39uT;
	Mon, 01 Jun 2026 11:31:43 -0300
Date: Mon, 1 Jun 2026 11:31:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com,
	alikernel-developer <alikernel-developer@linux.alibaba.com>
Subject: Re: [PATCH 1/9] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
Message-ID: <20260601143143.GZ2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-2-guanghuifeng@linux.alibaba.com>
 <20260531235148.GV2487554@ziepe.ca>
 <a0875d9f-4aed-4164-861c-6fbbdfe04080@linux.alibaba.com>
 <20260601134322.GY2487554@ziepe.ca>
 <ff2a4364-8463-42cb-9a2b-fae1ef64c423@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff2a4364-8463-42cb-9a2b-fae1ef64c423@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_073146_472060_541478AB 
X-CRM114-Status: GOOD (  21.66  )
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

On Mon, Jun 01, 2026 at 10:14:27PM +0800, guanghuifeng@linux.alibaba.com wrote:
> 
> 在 2026/6/1 21:43, Jason Gunthorpe 写道:
> > On Mon, Jun 01, 2026 at 04:41:48PM +0800, guanghuifeng@linux.alibaba.com wrote:
> > > > > +/**
> > > > > + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
> > > > > + * @domain: IOMMU domain to query
> > > > > + * @iova: IO virtual address to translate
> > > > > + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
> > > > > + *
> > > > > + * Like iommu_iova_to_phys() but additionally returns the page size of the
> > > > > + * PTE mapping at @iova through @mapped_length.
> > > > > + *
> > > > > + * Return: The physical address for the given IOVA, or 0 if no translation.
> > > > > + */
> > > > When introducing the new function I would like to fix this 0 error as
> > > > well, it should return PHYS_MAX for error
> > > Implementations such as arm_smmu_iova_to_phys/DOMAIN_NS(iova_to_phys)
> > > all use a return value of 0 as an invalid state, so 0 is used as the
> > > representation of an invalid state to maintain compatibility.
> > I know, but this bad choice has already caused bugs so if we are
> > changing everything I would prefer we fix it.
> 
> OK, there are a lot of changes in the current commit. This issue will be
> fixed in a subsequent series patch.

If you follow the plan I gave you then introduce the new function
using the new return code and only support it in iommupt, then you can
convert the other drivers to the new function one by one including the
return code.

Jason

