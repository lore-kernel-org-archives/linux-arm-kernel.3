Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C1C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpYoUff4tpb7ZnYnv11tnvX2uEPBYr9ascXUqkCwOTE=; b=MzK1EO5A8cGt7/S3CFY2o5QdKJ
	TJsEq4e9MeTk+pZ5tOeYfME8iYp1rMcy3x3fqWMtziS1jfmX/oGQVwMoEMD6CuNDzmujxf/rVJ4RL
	4FQf9NIg1NKmFKbC6E6HiI/6jSr0VnvMHgivE4nGSUgQTw1hDWZsAKexX/sQL6ZBGu5XvWMdPUUfg
	SA4mgWbFsx8Gnc+QSSDSlvX8xXtT78TM6xjRSTYfvmQlH8fPwlThvAweP5zWCj7Oxje2eWEfmiWlW
	oj/s2deJONp2qcWRtCdNhVkzB8iCM18ZWaKgypW+caJhKIe89WRt2E214vf8HOGjxswSGsFxkHjxz
	c5JBwFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sfW-0000000Asgt-3gqc;
	Tue, 29 Apr 2025 21:39:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sbn-0000000AsDP-3d5m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:35:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2242ac37caeso74655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962519; x=1746567319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpYoUff4tpb7ZnYnv11tnvX2uEPBYr9ascXUqkCwOTE=;
        b=c+HepXwTwS6+M+Snu2JJGYPifLATcVd8Lyc3rPOGFxZ87v8nKEp1lk/wvQ6UPyg82X
         H8/SoG2SpXhdyOhKn+AEoc5u8K9NWYjVv7/Mjq9PsbjqmYZ7VS1yq9b98jkZjuhyIF8F
         G356EsJ17t500K3OAlO7EF6TICzFIxrZCWlNrcNXTkMRnzu5a09BqCNPjzfklOpbyoXC
         nNF90S6Nz/bCKSTmuDaP7dfXxfox/zo2h1Bhkqn3UENAiWc9peYaEsWYJCcEBXXS8D/0
         8fPx4Neo5zOrVdeVFjKyo4WvGIc01KpjLh4AjkkDqQafdDn3zByqLGM+7MUMCsKZEUoy
         6cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962519; x=1746567319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpYoUff4tpb7ZnYnv11tnvX2uEPBYr9ascXUqkCwOTE=;
        b=QilxxCFHrnwSkQK+439CKEJVq6FgRkv/JWybaMUpjwGtFnGUi3BTdEsxG8An62P5Qh
         Hmq3ra67chM2w+Ius90ePZe9xoQuznlZKEfv19+VqMxgc6U/44bdllkhlGrJqoTlFFoE
         H8rP8+yGP6PaCqKlejrggXiA9GsYvmhE/XZEM6qYqn7cH57QNyfEKkYOP0jHgQk8SUb1
         Di5iraWYKh7KjjYW0gHYpc2E6lp0tSjThK1rDk8LqjIFSNbxUxDnLCMFghxor23C9AW0
         E/tkHyX+bkvr9NP+KnVbGuOhG+JJoBxX5hRopAfPsWC0QnlkXuyVdpSAwjkISotxqLz1
         ddew==
X-Forwarded-Encrypted: i=1; AJvYcCUENtLOHGqp61NlKgq+txXP0Sm4a/YUWPtSCAZk8x5PE4gfvbM+quBATZ57AlTfNBXFlyqt7aWZSicxp/6F/gQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YydGrkdTBN31yOJEQjSBG5fBzo6VKIIogc2LSe/fCTSXAdIr3zZ
	Rpi/Acvg+nTZH+HNh4AoDmQIPkMTKUo3vbYKNi8YM1QQgRVNobIzKWoV01jyZg==
X-Gm-Gg: ASbGncsksR1joYiGC1VxwlZG8JiKRDhYoMsVP55HvRhYQbwnJJNQuRtc9r7OgEOnMYf
	+fRvQVDswaufn6g5AdsL8IE2Ze/OvZW/nwTrhIWTKM6+hZqXBj8KJh8p6I4dfKTQAgL00RjIIbC
	3bGZbiH5jRO/riMdje3UQSVo2RKt/qyATk8LmEXOvn6wBOYTZV9eMdGMrrGrJgz3LwXpJi37ZUH
	HpJkuCEcUd9RYpXVGzsXFQJtiHPD0ZtorHrGshstYQ81RHEvq1GNLS5x9NBIJsKVQnAyeKbR+sl
	r9O1TiMznz26hP1O8STwkU8KDCURtCXR2DyZ9aOw0O7Gt1rQQTOeBapVYQOM8GsB98jfp/Pz
X-Google-Smtp-Source: AGHT+IEiAc8Ows6C4iR4kgPCFAlWxuerupIBpLK64UuYqayp18C/qOLe733Vqo0YiAcQG8JFaBI7KQ==
X-Received: by 2002:a17:902:f681:b0:200:97b5:dc2b with SMTP id d9443c01a7336-22df54469b2mr228275ad.15.1745962518918;
        Tue, 29 Apr 2025 14:35:18 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f08csm42489a91.39.2025.04.29.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:35:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:35:07 +0000
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
Message-ID: <aBFGCxcTh54pecsk@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBE/CD4Ilbydnmud@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_143519_901220_DCA95452 
X-CRM114-Status: GOOD (  22.94  )
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

On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > +	struct iommufd_mmap *immap;
> > > > > > +	int rc;
> > > > > > +
> > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > +		return -EINVAL;
> > > > > > +	if (base & ~PAGE_MASK)
> > > > > > +		return -EINVAL;
> > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > +	if (!immap)
> > > > > > +		return -ENOMEM;
> > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > +
> > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > 
> > > > > I believe this should be sizeof(*immap) ?
> > > > 
> > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > 
> > > mtree_load() returns a "struct iommufd_map *" pointer.
> > 
> > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > sufficient for the given "size". 
> > 
> > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > for a 64-bit machine. Whereas we really, just want to reserve a range
> > for size >> PAGE_SHIFT pfns.
> 
> But we are not storing pfns but the immap pointer..

Ohh... so we are storing the raw pointer in the mtree.. I got confused
with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!

> 
> Nicolin

