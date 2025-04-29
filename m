Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE3EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=; b=Ckrt5EdkMjaF2IV+RyTZqlfSq6
	qRGZLEtvpxh87AOPTw0Msa+pDrC02+f0I5S2xPXLtIw0VW4oGE89w1PAhwN0eVpm4Y6ShIDIEZna0
	A3/1jmAAh6Ga35Hiji87IEmJ5vR4FfZm4kxaxc1yYwJqm2bTWTSwgDJeAWFcZnsVfHY1v1P+ARyx8
	4Ri4FEH0a1HFwH7ajAs/JiZCGGom9XTuHUsJODpLmyiob1p3zNSXtjdgEECjB75Xvmt0p//dZfOLj
	IVlEMCXMuW5QRHOFnhPAOMr5OBXaHT1gymHXyBquIP69HthWSqLjY4SBloiURL7rW0dP7OzU4lhUe
	dbqMUbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s4p-0000000AoYD-2dO8;
	Tue, 29 Apr 2025 21:01:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rzj-0000000AnlM-3405
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:56:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2263428c8baso75335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745960159; x=1746564959; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=cDBYx8L0QosUCb74CSgxL4QVyEtobxbgxqpQmST1JQla7xiMsiAgtaQIjiPTZ0oKyY
         Pc6mGaEf6iDsFASiaJzaasMJ2y0RMOTRum0BAs3Bo7nYAvTt/bIXZx8wyI2n0dOdaaN+
         Fy4irkFQSJo+musImD08uM7ysLN+tLE/mXKt/3Nz9MxNbEwCvL0pirCgW5mO5/hu4QHe
         JxjtC1Jej60NlgBs7P3D0wkiJbNkyVhllMYTGR9iRrqXn6BrfhDFM/OHJ787NKFmACn6
         vpUBcMP9uZKoFTxm+r8wsJBjMw3TvzJSTwTzamRAp/gJkVu7lEoQwccZFqg3BnKaaXht
         OHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960159; x=1746564959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=VIUg7nq6ymUh5Cw6qFOJsM7tI8FHpfClZvuzU4fp46PTC2gKr8Yq/VrKgfxRkiY3Cc
         D747FwcFtA8gZeDWn4PoWX0FKohFdqG2oYQd0f571Ya+EAtPLbxFARVrVmQQZ9CIIh2r
         S+XWM3xv/CCjmxlzWBMujT3D1CDZ4W73X4blRIGRHl18laNQjXG41pH12R/AKWVFoL9X
         wLYP4UuRqmYTa+f/0swSHWfuRI9QD2unDqqT37y9VL91ea5mo8ZheOGRJkdxwRDe/mnH
         T1e0vhhwsn+9YCima6HHZsp5fwKjm4oTDzsZ7lORttsEqAcP59LqrJIRcf/osaTn5tGS
         Rgaw==
X-Forwarded-Encrypted: i=1; AJvYcCUhPCQ6oJZxdm2nVXHwn5yzjyQ6mk0N0EtngWWkYiHjbg5i1vKF1iGbE1CFIff/pYcy/EIOctC8tHCPbpy0rvV1@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdb/GtUKzJdovmtzn7oBPrJicU6XooDwVqq7nufpflmzQxUV6
	uk0Q/N2kL1Yjox00sOOhJytpV2GLtS066peBaoNUmr4QTlsH5f8m6bRExVsTow==
X-Gm-Gg: ASbGncsTJSERxw/EDNQ0mJhbVBu/YlDeH55lbMcbORHTCMeozMJgQ9S+6GVHnHy3MVc
	F4GvT5MhesYUxvjl+yJYzTlZfmCeEDUsc4Mw7RWAk9BsiMpSXLpCvqvHkqMWqKrwEZ6ylTlZ+oe
	3OojsCJf2q4a8j9ekUzrbJpvL+odLDstdrW1I1fuI/8R1L2JHjbRUBZ8pCPpN0om736J5n3q5Co
	efghyUs1UmYjs36ktmKDptOg0400j1fIZr97xns3IJpCMkQphhtGQy1sKCXj/TmDNbo/EGQ9W15
	FKk5W7n11/gt60ITPIUw9j/m8slgnGzGguuN6pYwOpKEBq1YnsI70lc26/17Pq6adgSBidCP
X-Google-Smtp-Source: AGHT+IEDLG3SJps6W1WWtS+Z1B6wTQS34GYl+OTkQIvhX6qglLU7EkbEpqx51RkV1YpDBN8wRt1Y4A==
X-Received: by 2002:a17:902:ecc5:b0:21d:dba1:dd72 with SMTP id d9443c01a7336-22df545d1d5mr63705ad.15.1745960158589;
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52168b9sm107756155ad.226.2025.04.29.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:55:47 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBE800DsAOOZ4ybv@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBE47aySzDp2lsAz@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_135559_762521_6A30177D 
X-CRM114-Status: GOOD (  17.23  )
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

On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > +	struct iommufd_mmap *immap;
> > > > +	int rc;
> > > > +
> > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > +		return -EINVAL;
> > > > +	if (base & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +	if (!size || size & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +
> > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > +	if (!immap)
> > > > +		return -ENOMEM;
> > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > +
> > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > 
> > > I believe this should be sizeof(*immap) ?
> > 
> > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> 
> mtree_load() returns a "struct iommufd_map *" pointer.

I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
"size" parameter, which is being passed as sizeof(imap) in this patch.
IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
sufficient for the given "size". 

Now in this case, "size" would be the no. of pfns which are mmap-able.
By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
for a 64-bit machine. Whereas we really, just want to reserve a range
for size >> PAGE_SHIFT pfns.

> 
> Nicolin

Thanks,
Praan

