Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB02C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+ZVcMDj6eiAq+w7fHgu0Ionz2mUULkjJy07tfVzR30=; b=FM1WEX6uXE28VBFIsoLixmFuLC
	UBvCGookH0tMZLAMi63U97q3PVGQh3ySnU7Ojz89WT6K71QckXf6j+0yY4GDxLVLOg2kMD+XY6upt
	tJx/o+2RWGIYViqV6Lb6+GNyMaFuPum4vo0/Nd2/k7JPboVdUrPHwy3v6in53maDJlYHI20DcoUCm
	bVWJLsjFlu6FN81mkj4Nsj9CqhXJhojhCEYhtbNR0OG8Sh/mf8Rh96hDeDZAYsPuzR3bbSVBmpPbS
	9La69X9MpgVE/E2Qie9q2Tc0KWkdkwGl3p3H+XJLGiekbYqQdhrvn7JsKMFymRThu3jv91cGaH64Z
	vMIMXPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0sz-00000008KgZ-2RZB;
	Mon, 05 May 2025 18:49:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0qP-00000008KHr-47D1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 18:47:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2263428c8baso19435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746470832; x=1747075632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+ZVcMDj6eiAq+w7fHgu0Ionz2mUULkjJy07tfVzR30=;
        b=qNzqudP5xM5aIrsZe9yr8wkMzzxfAclpajOnWYv6bJXDkyRZBS46y05eFnfxKQv463
         xUQ1wvyk/p/elwoGAv4Ax5U7foQC7moXURiUKSIHDehN1QyVqT0mPLyEDcW1UW/MO4kg
         wT0qgIH1SO7keXIVi1yue0ENOzo5YTJV2duY/F2Na0Eg62QCXK5WmLK1WLiJUybBA+wh
         02wGXKsGO3PZPg2tRvQ8nfW7KzBkWXCTQMjrJoGbM5itSZaXn2k0gY+b+JjZBZu72zRm
         JMP7wBFJU/Zij+lctNLl6XsXrRIVwlItm+g0xwzZ0G5PvVEg+87+Ebq6HRQsRL1Rf7V3
         U9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470832; x=1747075632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+ZVcMDj6eiAq+w7fHgu0Ionz2mUULkjJy07tfVzR30=;
        b=nHHt+q/zQ2QgvsOXA2dJjw4pBYsyV8DWIScUqahFSyMiS8oLUPaZ5oZ3jjMz81Nl3H
         UalnieVIGN0zsUN7yCXWtShIl8nPv90s01R8XaDajSXoZso86le4uxEnjBxgkOu6yUYW
         7YYoIDHn/mpt6rALe8TQ1Tu8ZHkZB6n0iwEtujhpcibkivUd89+z44T7znFp5rVVCGDD
         fiQgEaDAZ8ClzTBjsK9RSmWYMA8wrIm8FzoIHudxuZJh33l8jfn68SfDxH5tVcEKfQZX
         xEs4gPAQkrGjbp3JzJpKdEv8mtUIuXvIvGHAUuOIvjqTzekkWrMRqa8T3Pqk+EnEiJMN
         eHmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPvIzAFivHV5zkidEvy4s64NG/QYnh62Kg+fdb9/rtMjUfl4uLFbJJssbHrL3h3LOYek/2cyo4qGa5Itex76j4@lists.infradead.org
X-Gm-Message-State: AOJu0YzHRx32jfGtTyG4hLQzupP8hOVLkin4RXnz+XVPJlX9pQqvnJBu
	YbY9RF2QvKBaXFOVvmLEWu5FLdNPN7169q+7JPeNUOHILIARNLdrzXjIosHIlA==
X-Gm-Gg: ASbGnctWuJ9r4gZzXUBsIjl2CEJSGXf6qjFVGY9XuajaF7HNjOvbnlCKKkHzoYxr5wf
	8zc2mkb72lpkaMPFVsXqFkjlEStRKAM+N0K7wMvSN8qDuGIOqjpW5SVjVtoT0PYbSb1MWjWPIgq
	toCqM7SChUt9Jkw/7W0QMWqxq19BuwqhzW6s2FTbd7alP9z2W0rAryCZVZfPTI7dseRqvvpllzV
	xyTdmZvDXtsEOqhBhCuMO3s2JJ777HpHzL7aB9BJBS/n82Z+tX4WKebe65XeNalmbTs1ddLzs+5
	PmfXUChvSpQcw47MgnsbbbQFADGRdzu+2DikUBvZ10V4jYySf+VUzgHL1zdenithRQ25DYT5MTq
	tszG3YlE=
X-Google-Smtp-Source: AGHT+IF+yI+Dgd32z62Vz4IkzG0Ih79IcbEYi6NeCGDCJdKqEO9PIlfWJBKMKIGX6EtzZ1WS3NzDOg==
X-Received: by 2002:a17:902:da2d:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-22e3508e4d0mr352355ad.28.1746470831803;
        Mon, 05 May 2025 11:47:11 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522054esm58673755ad.118.2025.05.05.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:47:11 -0700 (PDT)
Date: Mon, 5 May 2025 18:47:00 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBkHpJIeDxJJSxeS@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
 <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
 <20250505165552.GN2260709@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505165552.GN2260709@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_114714_039665_DE4BC12C 
X-CRM114-Status: GOOD (  33.38  )
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

On Mon, May 05, 2025 at 01:55:52PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 29, 2025 at 02:46:25PM -0700, Nicolin Chen wrote:
> > > > > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > > > > +	if (!immap)
> > > > > > > > > +		return -ENOMEM;
> > > > > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > > > > +
> > > > > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > > > > 
> > > > > > > > I believe this should be sizeof(*immap) ?
> > > > > > > 
> > > > > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > > > > 
> > > > > > mtree_load() returns a "struct iommufd_map *" pointer.
> > > > > 
> > > > > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > > > > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > > > > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > > > > sufficient for the given "size". 
> > > > > 
> > > > > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > > > > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > > > > for a 64-bit machine. Whereas we really, just want to reserve a range
> > > > > for size >> PAGE_SHIFT pfns.
> > > > 
> > > > But we are not storing pfns but the immap pointer..
> 
> That doesn't seem right, the entire point of using a maple tree is to
> manage the pfn number space, ie the pgoff argument to mmap.
> 
> So when calling mtree_alloc_range:
> 
> int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
> 		void *entry, unsigned long size, unsigned long min,
> 		unsigned long max, gfp_t gfp)
> 
> size should be the number of PFNs this mmap is going to use, which is
> not sizeof() anything
> 
> min should be 0 and max should be uh.. U32_MAX >> PAGE_SHIFT
> IIRC.. There is a different limit for pgof fon 32 bit mmap()
> 

This is what I was thinking as well.. why use a maple tree if we aren't
allocating a range to manage pfns.. I was still thinking about this in
v3 which made me hold back from acking this. I'm glad we clarified this!

> > > Ohh... so we are storing the raw pointer in the mtree.. I got confused
> > > with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!
> > 
> > Yes. We want the pointer at mtree_load(). The pfn range is for
> > validation after mtree_load(). And we are likely to stuff more
> > bits into the immap structure for other verifications.
> 
> Validation is fine, but you still have to reserve the whole pfn number
> space to get sensible non-overlapping pgoffs out of the allocator.
> 
> Jason

Thanks
Praan

