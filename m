Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F43C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=; b=F0b7xWT48BByS3a9li//s4twgB
	GCQHRzesf9oT4uh5QfA40hqlXpPJuid5Ii+h0ODepiYs5i7csyp3HE/9hny/Tnm+tbJdp3KOc75rQ
	E5ETBgJH6zvbEAATEru6J8HI9qpnOTltIAALIHzTjVOgCaStM5c0xL2M8nhXUt2bMR1B14IJUsF7d
	BDfCxJ28dFdT5iQMRH9IMCo8EmMYB3WYWPI1c2RH9Ed1JoC9PP0tklLNRkvnzsbmuhj1lPxEC8kiR
	2p4kv/gVtQ3l9IQl4kDMwuRHd93XL9S4UodyGMLyITAmk4jqYTuLC3bHCAMSGmBuyBX/ae/BD5Fx5
	FTTJ0Wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRr8-0000000B41W-22rr;
	Tue, 03 Jun 2025 13:39:06 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRnL-0000000B3Bt-3weP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:35:13 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so36690626d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957710; x=1749562510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=EaR91pv5tQfehrwZp58Y5pvW9h+o0tw+yqFmXEJrMTOrypoATw2Bn8Eq7Boet6TTM4
         YTksCzVB57P/8VCzVEejx3YTR32jxTK31MgXuN9kb4XMJppOvuzn5+D9tgfoiifc4f8E
         fk1WMPuI+bGnJtbmEDmLFudD7egLId2kRvuA1/7wde0ESk9TY07hiXVOBCJ2JraIlz2W
         SleTggMiI4SDI5HNMh0dq8zpgBEBnmX0eVKerGeXS1nQCZiObYVv5vZvqZw1eL/ugrXZ
         2ry0TV8rPYPlVcH7KLHUKiiiwPC5rs9AFfkg9T+rndODCgKw6TdsBflCOQcTqtHbMFaC
         ZjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957710; x=1749562510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=pfP4FZjs/A21ZOgRBwVIbs6KEl3sXqYXAf/eBoQAOJTN7qNB9gAp0nwiPrrcJ3XWjq
         5+srYnpG/A3kvtAx+4ub6SsWF2J3u9JDP4V4ZnFd28MgHCGbwFKim87UHfDMAYQzzZDX
         8Ezzn5s8boipebj0+SEQzjPep+XfLGqeiXzKV1pBUHU9l9b5YmJvEUG/gb3VNSDW/Qhz
         wMB3pL4tLjuEGg/mxzY/Xd8w8eJ5tJiwUW44WpIEXLzwg5wGlO7hs7yKrnMor/wVlCiv
         aJHvIdrtJRrdlfIWRta1OJB5w4BgnfZ0qcxq3/Z7ASx39EJowibmffA0QnNLTNkswhiu
         udeA==
X-Forwarded-Encrypted: i=1; AJvYcCVJKMn3zigPOB6kb8P+LU3JoHHZIAOMGZZ3ahrMEVEMErnEkqLDPol93cnxbWfvrI92/xB6vrSu/bucOh3uHXm2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2arN+8ggr6Dc0oC2JM2dqLLv/ujQTMRk6TQh1uTHcnVrqABUM
	bafxTMnPst5sIakMAJQLZzdPSYHtWWFikfF0Jly03XVVuPnHGRk9evA70oMG+RT8vgQ=
X-Gm-Gg: ASbGncu0yjzD/Dwx4ecycdmu4OFFaJVJPfZN5l6fMQzigVK5JeHzom6CWiUouk0y88k
	oCYUrg6iwEyBVgw+7VO7eWk2TAfTEXiEa4k7ybeyMb7aWx7QapA6MKPPNrqDXIam/+FfoqHHiWt
	YV4IpMRRm+VgHR2lsjyzlXWvs/3Qjr1GkYRZqf4hrX48cnPLcz58I7aJ4u/Lrl8e9hUBaRcmxBp
	50jnQs19tnHALyYXbuRkiNtfKLZMJ/U+bqA83tVKiAADtvfOI5rdVu3FTlgtm9Dfm5H4tfkO5wO
	DDSrGnpEDeTffFFEg5qfW5WyzodduAmqFnIav6dM1H4v3BZ9LWJsTVVRpz/7qdQYEsj6I84rkyF
	lkSEKSFq+53WZLlNIUo/uZYJHXVH9mqDOfIETSg==
X-Google-Smtp-Source: AGHT+IGTO1Uq6qWKkHjHjzXPtbeutCQLStskBTpgABiXf8IiWIF7+BRGzTPM/WsKdaJBbv1DscVTNw==
X-Received: by 2002:a05:6214:d87:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fad9090760mr153489766d6.1.1748957710547;
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e2fc45sm80639296d6.122.2025.06.03.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRnJ-00000001h4R-2OPU;
	Tue, 03 Jun 2025 10:35:09 -0300
Date: Tue, 3 Jun 2025 10:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <20250603133509.GC386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063511_985834_19586FA6 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, May 29, 2025 at 04:32:03PM +1000, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/userfaultfd.c | 2 +-
>  mm/hmm.c         | 2 +-
>  mm/userfaultfd.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

