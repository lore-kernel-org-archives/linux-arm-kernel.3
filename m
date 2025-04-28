Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A789BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0r7+wCllJmaKxCe01hHV/d2aOrZfvhrAsuNMyHCgYc=; b=WJnlXi8u9CKGSUn79AzFgHOMBe
	4GZTfWKO0SDOaCYWdHLWxBRvKwT2z+qTZfhKhd9owxlq6ip30B8+MYkFiji+Q8ZjjnxRLbacV8HRU
	DkExdXOdCTQ543BiHxwjfpgRxRqbmFw5ExBwcGT+bfYoPR9VDx/xz9/f8oL9/MsO6ByuQ0NXunaak
	qYiQh0NaNYe1+oJuC3v7hOMQudWIR+P5wTwjDygQvsUl0nKdaBaTZAyYhQ4UYvo7xinS1g3lleY7G
	HewLlAHtrzTh3mppJYaDCHLdgPygOZ+7e8fxp96eL/JcFbOrAzzD+ZO+XrjYtjAk/0prlN7pSvsvK
	ZA+JpTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SSc-000000077RK-0A34;
	Mon, 28 Apr 2025 17:40:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SHs-000000075pS-09hC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 17:29:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2240aad70f2so15635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745861338; x=1746466138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0r7+wCllJmaKxCe01hHV/d2aOrZfvhrAsuNMyHCgYc=;
        b=28jqejkEBGZV3xTsLtf0jbO0QM4BVEHcENM7Og0lL0WZ3S2qmK5qpLZuFQ/KNTQKZA
         ufMVcVB1FS9oXqs/i/yiJFzeEx/fKPgzjzvmAcxYFFrpMDmpjlGqfvjKPFw2OMANQESd
         yrjihpWP3pDNo7aza4JIz1iVNrzdGlTKeBjQHP9iS9QFc3vnv5SvIvT39sa373CCNsLV
         a8WZT8Vm6Qmfns6fYUPN6W2Mc0fprhNzBpDewZh1jg1WCmrMeAXRWqrqmbX3lczBhVGk
         XsynJb1o1nL66wuksXFqQxEz2rmmfBK51DsLs8P6ZZX8mt9zOvtHHL3D/NpC4f5RGafU
         21MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861338; x=1746466138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0r7+wCllJmaKxCe01hHV/d2aOrZfvhrAsuNMyHCgYc=;
        b=h4DliSFRNjTsP3LvARwgj5daDP+nK6dYLRycvVfP9b92/ygYaRXB2TkNPXizGHGd2W
         137qaQPoFSt9Nu6IwhWTmZBhmcE/jufJUeRPQs0UrWcYMMFM+5PHuCYdxXRryDvLU430
         J4IPs7kMXfRkzODqK0tcikGetEpw6rXiCXh7nrygY5aaNoAEAbSFCDeL4JkTLGddI/sT
         wNfKKcNIPSOWOm21P87pSc9PwCypLeeo/L+vxtwGVEqbLEqGiBqnCa8tKrsDlrZDDAir
         zhLy8YX5YWj+ObfdR4p0rbB/x5ixnFA3wXsw9iD0AzkLCqs/plDb/F5esTrj3GT3+n1g
         9qxA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BBTK88SH6hjaFCSNH+eBGhzOoG8RTZMXwG7b3Oc4dvZ1Mf+q3nHJsZyPZD6hKU4rzQDzbzMo5vF/tyCIuNUd@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2nx7/JrOsufHiA4yopgFCkBA4jfHQ1S7PTUuv2rBczoqDhU/
	zvkdiZci4p2tv67boY+L7HuQbCPCT7Y7OqNcYrffFSSA1vgMo83o+LC+E+zUxQ==
X-Gm-Gg: ASbGnctURoFMYXnLrfADdLtYpdXHGuAl9ZBTDqSXqaRR4ATrJf2h8itHi0sU9GKGVn6
	KgxvIXhKyDN3SZSV0vEX2tRhyHxegS7/C0EEWchOO5VbJgmQ/6hRVNg8Bq3+gvKpbSXzkBQ0UQF
	7fcc424K/5p1z5JIpqAgiK3KpUhMKJEizMyERI1IgSe+D5KZoWAEe5jhS4U0FheBBYFok9DciuB
	2mGW+Hc5qEqsp2H4JIwlAejHkJGEmZOC0H6J/ve2SsNXGIbQTktWAtlExTqofe9XYYfenqT2gZC
	Ja8WkH5RgUm3q6pv9CZug4qTRCOCTF+/oqZGjlN03iV+pNWKXBsytpupNBRrXjZaaPv3Lunt
X-Google-Smtp-Source: AGHT+IFvvbXqVLW7M7K4eTP2s1tq5nZj/xJsE94cw7osWMiH1XhKOhdmN98bqT0YcPcDS66bSCITtg==
X-Received: by 2002:a17:902:ea01:b0:21f:2ded:bfa0 with SMTP id d9443c01a7336-22de586f035mr708455ad.25.1745861337961;
        Mon, 28 Apr 2025 10:28:57 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061bccsm9296497a91.18.2025.04.28.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:28:57 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:28:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 02/22] iommu: Pass in a driver-level user data
 structure to viommu_alloc op
Message-ID: <aA-6zlZNQ6NsrUqw@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <f985e2802a50b5867c9d4d3182ae7b4944a989c5.1745646960.git.nicolinc@nvidia.com>
 <e569c927-65ff-4c0f-8922-45e404fefc5e@linux.intel.com>
 <aA+4mRrGuUnpG/dB@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA+4mRrGuUnpG/dB@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_102900_076105_259124E4 
X-CRM114-Status: GOOD (  19.63  )
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

On Mon, Apr 28, 2025 at 10:19:21AM -0700, Nicolin Chen wrote:
> On Sun, Apr 27, 2025 at 02:31:54PM +0800, Baolu Lu wrote:
> > On 4/26/25 13:57, Nicolin Chen wrote:
> > > The new type of vIOMMU for tegra241-cmdqv needs to pass in a driver-level
> > > data structure from user space via iommufd, so add a user_data to the op.
> > > 
> > > Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> > > Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> > 
> > It would be better to add some words explaining what kind of user data
> > can be passed when allocating a vIOMMU object and the reason why this
> > might be necessary.
> > 
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Sure. Will do something like this:
> 
> The new type of vIOMMU for tegra241-cmdqv allows user space VM to use one
> of its virtual command queue HW resources exclusively. This requires user
> space to mmap the corresponding MMIO page from kernel space for direct HW
> control.
> 
> To forward the mmap info (vm_pgoff and size), iommufd should add a driver
> specific data structure to the IOMMUFD_CMD_VIOMMU_ALLOC ioctl, for driver
> to output the info (during the allocation) back to user space.
> 
> Similar to the existing ioctls and their IOMMU handlers, add a user_data
> to viommu_alloc op to bridge between iommufd and drivers.
> 

Ack, with this change (addressing Lu's nit).

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin

