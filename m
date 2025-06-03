Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C6C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=; b=YdNBRaMomUpEo5ey2SS+Grp80+
	NyvxWz7Zn2bxz2H4p+Z59EpNKafDjW08YMbneWpT4I6hxOFLF4bfzEPGbTfITpbNlEstfltvJVT1F
	TIMmRq8gYlrOtTzyVnkJxmmvIMHUe/0mbTcf8/7mewZxfM7d6GeUYJGgdbIbgo1bQG0z0UZ8y5hSb
	eoVqEQ39oV0xqLx5/0hZV7dNMmw3O8jO23O9Xcr3+XS9cfRWXpCe0mx3kk4uhPQgLZlFLEX1pNDhM
	NU/b/4JzeEeSncAy0mKdKLcYYDmeau1acjLmRKEZUPYNh4DT2HW/+7zc7yoJv2QrC/EiSOLnsIFcP
	QCqIDnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRzn-0000000B50E-1Axp;
	Tue, 03 Jun 2025 13:48:03 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRqh-0000000B3t3-3HCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:38:40 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6fadb9a0325so29136226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=lgLRUSRUUt7iEwhP+FBp7JWXXMi1nRPFPQzwF2IX/HI4PZEjAGT3u016LT3lzNPX3c
         VuzuDVL+ptmppZ75DI72V0xgFcgBEpWovu/sfymD2ybf9Qte1LvlFUyVd/RUha1nOA6B
         vmNx+xg+pPFjiihtWAr72TMLVm+GXSt3s8TxHoRZpjuxE5nXDudvTobIafnUzCBV8uqq
         iN1iK6FnrgeBEPeFc8ZhoLhMjnQzq7Jq6nOH9fRCyTC+MR3JM8bh6bKkm8vWFgaUB9Fk
         b0KqmY9F8FjidOyhAfsM7FDThHyjWWutn1Tc2B+KRjmwgN7+3lP88VfmJkHpLLfzGOaZ
         CvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957919; x=1749562719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=sHdNr5CQ6pV57xXI88LakJaX373dXOs7bzWR+QrIQO6MC1LHhF44RlVehOGNQEjTXR
         tb44UQ4HjAQiBaxRsHYVPDU/Oyauy46YjBxP0miovkom88iGIuXUIWARNl1GtZ+H1835
         EKknadAt+diIWD/8C522P271duO2Yj1GxO09iWOa8otELu0i/Ko4M6vVQhb/0KkHs1Sd
         UMc7D/Ll992KhW5EDZIARY9/P2WOfxOvhO9KXB5gCbsrCwfGuH7Wcg0oWj3T2J3hrUqs
         JNK7dcQuZh/RnJFQDMkP9aEIdrv5g0nFgk97A7F//Lp9qKTsZQAIgTzcRVLww3k6BbiD
         Xr+w==
X-Forwarded-Encrypted: i=1; AJvYcCWT6awu8oZ3WtPLlnjXFNn5hWlJmpOZsuBCLvbOIYn/kIkMJ8xvWqT8M2gCKFq1XvXunidRmyQNXnMTeKOQAUou@lists.infradead.org
X-Gm-Message-State: AOJu0YwD/6W8k8BKLmv5xaSuukqOvfFZJ5MjU5QqXFDpW3O3BAgmosX+
	L30hL2WvswBRClBBUj0gfhq8F+Yrkx+brENKkkbjAmscpfrq9BsiAkxiv0aHgj/pL7A=
X-Gm-Gg: ASbGnctFRq1ZyZLZtTMFlFKmsQlX61a7VGISyyk2a6Qt4XguaOVyLOmueTpOYY5Dfj3
	R7l578wdu+SunhoQLaL72t1b9oYZnLE133UmP3OrMedmyVwWj3HSZCDOX9qmIuSUN074pIupBB3
	hgqxCNHcxgSoH4h3gNZ/5dDySZq1Tg53UQiQNg7nAycCHO+v01/hRvssucWy0hno/7Aq0zbVlXr
	E5aElU1Q10+uyJa6Od0BRAsOWOy2jZGMAo/RndNmjNx3/euZogq0c2tKYDeAEESd0kwjVaZJYp8
	uJ8v50TonIfKdrjrgt5ZprwuPKAptREKFz3VhhmB6Qc7EtLmgD/xSWKOribNxcK4aGXoD82jzEo
	WA3EJSDha5UlNMU6z5DRVt2U6iWM=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424;
        Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRqf-00000001h6M-29EG;
	Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
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
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063839_830550_723EDBB2 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

