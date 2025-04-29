Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C89BC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=; b=Wp3vmFgMVZU4a8gDKRyhiyEP6d
	JLCxOfY0GN7QxKJEvUio+kAv9ucubZNS8SDVSV8Ivtb8umWhZQZC+YjBGPDL2g9auV+hiaMdFjsnH
	LBAZYeLEhxsZw0bPKKQtHU/SgrgGCE5MazDl1jdHK2OVElKypYMqFOIY+CKAhdeNgEH4r3XWyLNz7
	f5db9rq52RiyAOfR2QEyYUmBFWHH7rmlkyGs9yBcf5q/jg1juBwY0pWmq3RoZC7Ptkcx+uDxVjgtA
	KGzQSc9bVlbbY+4ep0VArtt7RAyW5QfsAuP33xE5+/fjycwfLe6RdgSGDat+UAciILWBaF7U5l/eQ
	bqfMDQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9t1g-0000000Avhw-36qi;
	Tue, 29 Apr 2025 22:02:04 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sxh-0000000AvBA-1zKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:57:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2242ac37caeso77445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963876; x=1746568676; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=fnRtHxr1HuzT4SB/QioGww/XsQ9OJ8Z9otnDbDtJEbLoIEwUx5nnJ9Ds8RKdIJjiDH
         0NV6eLVOCJNxUG6Ex/SuLQzV7v+O5rrItX0whk0pzj8EsKiqLHiuaepDIIKVdQhRUAkD
         0gIZaA4Sh/rsu1T1u9KcUqY9ZRQIC9YZNykWD0ZRFmvPDkVzPTBAV/QNPbrAr8q+UvVa
         cyL4OSjnAZbkkfLvXdpIpGHsqGzsrpVuIz7fcf1U37C1WAZ3ssOKRY3lWuJwZyBwwkhC
         9MqZoPNFaKMZ42pLTeYNnk+5iEInm8N/N54yOss1Upzw1Rc8gPA6o+pRbJWkUvpYMiE+
         SsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963876; x=1746568676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=dNfPF5ah81jkIGPaFvrTl8X6ZX3dCmY3lABw8iIMSZMwb05aM9xhauUC3EjW8uk/VF
         rNpf17Cy0cbsFVjGp+l9/968v51ZZwMsI9umvH6wxcWVmbncFyL9S6VySA1juXCxV8JN
         rrsDxU9eQ0RCTjzrAMAIXM2uI875/0xc7Wd6BKZIi8gbX44F3DJUTLJv+/xkFMi8LrNU
         VUgPvu34Dr9PPsyG+KDGaoshRFFdk6r5rHuPoku56TX5sseQeSa1CnYmOAKLrARMB7ts
         692jVzL0uR5bZ+bbt7esw/gVM2NGIhygduHdEDP8259WaBNRWVafrMy6A5JnaXu68e7W
         58uA==
X-Forwarded-Encrypted: i=1; AJvYcCVyFFpJlUH8W7oVNWZaEItdu0Mj9VqVe13ZDpUW6qvP7+X24OpbxHIS9Lr/TcL3hxz1FJR1Va8B2Dy9j+UbH+LV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4+OXad4MJk4Ks02+zXvt7pm0dmhd8e1s7wzW2JmoCiStt3yuo
	0b5tRBaUhhLTgebHSlYSGeRkHpblVn6lC/hZ8R8pV7OmkjrzwffohvfADB0WwA==
X-Gm-Gg: ASbGnct1KKsMbw1wwRnN9UfQXl9hPP0xzhY0KL9DBhPrpFw2SKhIdYkJMosW/JljIAL
	VKz4ZsdtENkiCikbmvPoM9QNkWO9BoMXNXlTIo1wycnUbr6vgNfKaWEYWjXZ62DjbQManvAy5JX
	nnZ22qIChg+hYMEfC8DCmpudHfGZc2PDdcFQK7ZTDCpIqxqbe2N0VKx5oVa7UZZGBEbpCAi+LEW
	olAXAFimhZzLParPzJEudgO8HbQ993v2xU9yDH8F9XKY4zNuGojs0tPKFE6jNtvip9Wd/sxddvA
	Mqi5y53g9603484HJ6zVEVqc32orGeZMQcPk0qZK2xw6IbH5mkGJY3+lUlpRKPWU8b6leJyUVZN
	yEBls1MI=
X-Google-Smtp-Source: AGHT+IG2GQrBKEV0sAuQTzjtnWFNlTLvqHxPy8UFJFeAPu3X8NPH7IbodXwNU55E95G96pW683QFuA==
X-Received: by 2002:a17:902:d489:b0:220:c905:68a2 with SMTP id d9443c01a7336-22df53e1f95mr331695ad.5.1745963876294;
        Tue, 29 Apr 2025 14:57:56 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5104ec7sm107543895ad.175.2025.04.29.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:57:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:57:45 +0000
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
Message-ID: <aBFLWUvzvwtFXK5z@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
 <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_145757_522192_FE00F38F 
X-CRM114-Status: GOOD (  26.35  )
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

On Tue, Apr 29, 2025 at 02:46:25PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 09:35:07PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > > > +	struct iommufd_mmap *immap;
> > > > > > > > +	int rc;
> > > > > > > > +
> > > > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (base & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +
> > > > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > > > +	if (!immap)
> > > > > > > > +		return -ENOMEM;
> > > > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > > > +
> > > > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > > > 
> > > > > > > I believe this should be sizeof(*immap) ?
> > > > > > 
> > > > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > > > 
> > > > > mtree_load() returns a "struct iommufd_map *" pointer.
> > > > 
> > > > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > > > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > > > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > > > sufficient for the given "size". 
> > > > 
> > > > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > > > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > > > for a 64-bit machine. Whereas we really, just want to reserve a range
> > > > for size >> PAGE_SHIFT pfns.
> > > 
> > > But we are not storing pfns but the immap pointer..
> > 
> > Ohh... so we are storing the raw pointer in the mtree.. I got confused
> > with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!
> 
> Yes. We want the pointer at mtree_load(). The pfn range is for
> validation after mtree_load(). And we are likely to stuff more
> bits into the immap structure for other verifications.

Ack. Got it.

> 
> Thanks
> Nicolin

Thanks
Praan

