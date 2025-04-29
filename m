Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B8FC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=; b=CaYET4DpCEamLGX5faGPpx3ey/
	dxwICtn0BTk8xO+TUmBWC24LPG9ir1S5O3qcTxv2xOsbLjCo3wAFbP+C88yJylMJNCJ+sMQWRtCD8
	xB+ylDDKtTgXHjezf3rTAtrxtHNvC8KcdQsCm0dmRLVS9z8V8hJffePPbMDiwoKE7GxRkRv5xf2tj
	/tt5ew/SsaNxcVrQbsnzkL/iWjQjoFnqpC/OclyrrVDrpV9AlofbKCeqisCU29vSqHkUd8Uck6zPY
	l7Eq9bHDRLP6QeUO8cKi/z0StT/hB5+8IFAHdmmslDFLA15JpO++eCGUafAJ7PrcMAUP1Zgs8ECk/
	FLfS95qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mh9-0000000A58H-1qhE;
	Tue, 29 Apr 2025 15:16:27 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9la7-00000009qTq-2elW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:05:08 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so78555906d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745935506; x=1746540306; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
        b=YOKbKmAnkCJPtCSRB/s3L3fvKwhPAMmhptknT8Hy939wYZWxqAbxWRlBgaPdFwnu7/
         L4KHirNbpLl+6EMU+rZiQ6OOrlTo70djHeJvpaLjLK+fgqbBitmRq7y/j0cGM56gjVkt
         EOCtgW7w7R5Y8pf6RFCzuQ5YCxZCelsDV/x3NEO8VqWr4Oy6GdBXYxmwiBXJqJvs3NCz
         MydSyNlxxIS20GTzscNs+0nHQlZ0jDdFXWrOts3RJ0eZItueeXqL7U3kBnMy/TsfMBSD
         VN+/96GLlVgQCe4UENSq+tGEMtf3eVbSSO2SEamlNg/9QyB0ieuBWU5797DRejDrbtbX
         Ev8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935506; x=1746540306;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
        b=NvVDKKiUi+fu5DQFkyWyohwaVdoD9o6dhfM8berXTm5XH5MF5Uxgh+/+oz+qWj+785
         ZA+7NzYefxFJ5GVKsQZjqUx22YNFtnbmxNSekSpCG5BoxZiVNDnqVaddSZnM6TWwcsK5
         RcSgmPfctnYdbFay30OLPvfFJ1K2jKXU9YAEI7Wf8NP7u9YLPEWPJdM3v7VFSYsb6iID
         40MZyppajxfU/kDar1EQ7AqSVh7s1VIiH1KUa4qGtBc1VmxSSraWuPGfVTBIjPfrk9ko
         eqCJuEbxGEMbbjnq/aVJ8kICFlWs9DXELgTkpnDLvyvaEWLPWBdtlDzAKbo+XJkpwUEd
         IGUg==
X-Forwarded-Encrypted: i=1; AJvYcCXlEWeEbYOmDvpLqrNAZGRZ4ENyn0RXHvQ8WapN5TQwImP58PP4btxvxQXE5C4G46H2kwFzuJCqACNDmPkOPvlX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2PjgN+P7IOhu7G+roZJ7BkwUMq2PlGfCM/ULS2qX5OrGnvtpI
	/pb5rvwzyfv0EEk/wKKorncMPsc9savKrmPwZdilWnLUaHG2ezPnnCEC0Ozp9IE=
X-Gm-Gg: ASbGncumnJ2Jbl9p/CTWTXQRJzHaChr5nVN9/YSPwOv/YspaapqS6aL6uFAxI/cOAV6
	Zyz4Ie/pX8J57hivi4z2DSm8GrsRH98dkbI0ictmePDIh8z93soYty7cZOpDLbjhdAiTcTvgMTl
	occkur2iuC5WJyk9F8Qghr0/jOhz0WtFcHQAYbMSL3L0nXOBgO1Zu95drJxoKdjAT4vDygCHXrY
	QoST0V5e1RdrvuE+RbC3leGy3BRC3hzddcQ88wJ09v0vGXGPA7mMXhbPGs6vUnDbuS6xHEfuCGY
	Yd3TsiHiVxANd7Z67YaRHR8ewXtbIgia7Jq67LXdZESnnYa0R4hTTgyq7YEuSMAuet6rkRIMCI0
	8Z4VUcNkcyknoMo/RDzY=
X-Google-Smtp-Source: AGHT+IEGHHMBFCeWwt68ed4umDEC8R1Cxg2x3qg5I1VMmEylqtVgAx6JEUyqfbECn9olvSAU7wat3w==
X-Received: by 2002:a05:6214:5005:b0:6f4:c939:a3f5 with SMTP id 6a1803df08f44-6f4f1bcfe99mr47285726d6.17.1745935505592;
        Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4e0d8495asm30959186d6.18.2025.04.29.07.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u9la4-0000000AAyC-2M6z;
	Tue, 29 Apr 2025 11:05:04 -0300
Date: Tue, 29 Apr 2025 11:05:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429140504.GD2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
 <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_070507_675908_F757F138 
X-CRM114-Status: GOOD (  22.66  )
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

On Tue, Apr 29, 2025 at 06:58:32AM -0700, Rob Clark wrote:
> On Tue, Apr 29, 2025 at 5:28 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In situations where mapping/unmapping squence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> >
> > I think if you want to do something like that using the iommu API the
> > expectation is for the caller to do a iova_to_phys to check what is
> > mapped first? That seems kind of lame..
> >
> > Maybe page table driver should not not be doing these WARNs at all. If
> > we want to check for that the core iommu code should have the WARN_ON?
> >
> > eg iommufd already has a WARN_ON around iommu_unmap failures so having
> > one in the ARM page table is a double WARN.
> >
> > Don't really like using a quirk to change the API contract.
> 
> I'd also be ok to have the WARN_ON instead in the iommu code.  In the
> case where this quirk is needed, I'm using the io_pgtable helpers
> directly, not going via the iommu layer.

Yes, that was my thought

Then all the iommu_map/unmap() calls behave consistently here..

Jason

