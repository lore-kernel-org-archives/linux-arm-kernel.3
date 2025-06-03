Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B84DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=; b=kqeQgDyU5wCypnssViHNPAYJFy
	ZnkczD5hnStSqDMsZbyyDRkpvfhO95No3VuYYc2D2sVof57pVog1GiGLPENJ/RU2VGwMd97CANBLt
	GsWHmeGX8mp1hCLY2mT++pSLe69PDLVk++aZkR+zJivKVXzRFyW+B0JeOd9mP/6j+edVXZkHPDkN6
	fLtyE1t3C8pA6QoyA/d75yD2nQTDyX4Qoqf/OLwDqs0aD0RbH6WGK5V6TzJT4MWQYtm0/65z2JB3f
	kJHmkui4NdsWZU8QOViXddpnNprDChRkE90zO7JM95t1su7oHFTAMGFU3SZYhVtXMj2fBxgAb+weZ
	wQpfPB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRvT-0000000B4bQ-3SN7;
	Tue, 03 Jun 2025 13:43:35 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRpm-0000000B3g2-3KhQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:37:44 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a5a196f057so5698471cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957861; x=1749562661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=IOWkGIyApe4s8HuMFWOVTaqGO/1SHICkDPjfmBa0gYgJR1gdN4sg+62+7eBqtdtaXI
         K+OeSjhVCYLmnnPPl2OcxKctIobxaDKsfpl5m6SG8nU1SPIKI2vwG8u41myq6F/uN145
         NyPx7O/8ZjWUhbS1U8yu7+qyLE3W6FQ2dYoN87+3PE6+/6aikbm0a27c/6fM4Z+7ZK29
         h5J8OsxBLb5k1frhDECsCt30E2fIFF8jaUlHVeNbYKVrrgs36wa47/SF1tkC9c4O8p6q
         rYHeyqiZZb7PaBhR4bIL0w/J7b92C7KMEH/n0+Cont34ue8St5KnFLKyvcI5LP2Ej8P9
         SBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957861; x=1749562661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=bQ+Y/2UbmkFC7wE1zE6Wgf8tvLCwVgQRNuzqzATY21Nh4XJonsqDKwnQsRdXzWbSXN
         VyNcC9/nKJsJkJC4dHlKf2JY2GboLF8Aq89C62nUJ/lrYD5TJtLTOGa7b3UgxRgylSIc
         UwBEwor3T+jQS108z4XHIB1SCDdixCt+xJFnx9nTBnIS0Z7VTDxzXiKyB/huu8D3Vwf0
         n1CcE3PRssSFBEoI6RaISr2zKF/Mem1VWFTM96JmQrzi9MmM7Di18k2geEcFWNz6ZhRm
         O2nK1BPI15e7ut6xo6T0vXPEO8pudr0BEMt6hmpwDP4op4RhvB40kI/Ry+OZr8EpMZUd
         zB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5nj73HZS5fWSJ3wSJonnTb7BQHFhiH6A6O4a3+Zy7WRtQM9KzBm4RZ4/WX7Yq3ah14IyGhHTuzcT7OcalPWN@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkODGT3MOr+6C5iHdvw/DslJBivfkvO79uF9aR3pyD2FjtMBK
	c/HUyug6My0yDt4GzUiF5sSvXZXV26a1yyc2hD09//abNpEFLJGNlKZQgGYecalgC8Y=
X-Gm-Gg: ASbGncuAmayhTIlK6na6ZHb2P02mOey5H5UFPQ8U5NKE5NRX8xUMwzGdK68YKXrHseE
	+M1Ss97HuKkJmEiaRDIF7I4TYgjDCfPZuAlQUEHiSjCVY233yLb+Ey5z651fP5n3QNYTpiq9lDf
	49eBD9V/Cn9wGwERC/P0iowUJOOBkxw/+bYpj/PYOEwAoYdDPosWIWaz1Lin4NjgRuiX9tl5VgV
	i7lwf7yLfgMDel7YnyXzcUT/eMz9UrN427NXG7Pv7fwPvWVNf2JWPY9A91/fvG+C9hHVtJopSyw
	REqGVXKCks91Y6nvzChYuVSBw0Sr/TtB4rd163Mgd09Q8fOA7Srxq1dRJJgv5nFh1Db0sNRp78s
	iSAc6/IWGojSpBWtRslh28GZXlNXuGui1DUtIGw==
X-Google-Smtp-Source: AGHT+IHIja21FGplZEuqybwyfzBxoI5k6ggct08qhelvg2n2Sr3vDQGi+qZrCCr84f/KmAHse8r0Yw==
X-Received: by 2002:a05:622a:4c16:b0:4a4:2e99:3a92 with SMTP id d75a77b69052e-4a443f2d1a2mr265367291cf.38.1748957861491;
        Tue, 03 Jun 2025 06:37:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a36e1bsm73924021cf.62.2025.06.03.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRpk-00000001h5v-1tYD;
	Tue, 03 Jun 2025 10:37:40 -0300
Date: Tue, 3 Jun 2025 10:37:40 -0300
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
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <20250603133740.GE386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063742_835446_60CBA191 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, May 29, 2025 at 04:32:05PM +1000, Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/hmm.c    |  3 ---
>  mm/memory.c | 20 ++------------------
>  mm/vmscan.c |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

