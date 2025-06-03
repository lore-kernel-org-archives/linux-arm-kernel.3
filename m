Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DE0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=; b=lSh5O80a6v2Limll0/+Wjb+AIf
	9bnewoTj94Z8aoZXpOi5sax4hBAB86U39vJT06QLFqFIqclWJCStqw+shiufscgZEi9O5bMIunNtD
	uXa6J8vCJtlDFTHQplXv/Al9q1WUchw9mjKBJlR2YBrWLreDIq+m1kj5dtlX+5SnPMuKoCZAUp4V/
	zsdeo3unaWETxK3wMQBjiIyc5cNW+oBNOQSSP956RutIEsSd7GBPH+hxCn+FZVPIGviIXIpqNip7V
	gY+cL15ZI5Z0kp36wZOKnZ03YcgEk9EDXLk6M0LTv47UzxkekfCaSPi8kkJI2qmSrGYj++vNBu4Tr
	+1qxp6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSH7-0000000B828-2tbi;
	Tue, 03 Jun 2025 14:05:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0u-0000000B5Pb-10Et
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Jun 2025 13:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=; b=GSO2o7ZHWR0iGbsp9J3iTQmWZS
	SzhEPSO/syocZ6KVkmWU8ULeMueQZ9vsW071ZJp68hxJstzky6EeTIEG1/zOJ9B76gHYEqSh2BVto
	Tw7ojlZLcNZ6ew7rrNjOGHy7EoTdREM49kkzmK/jeIv7ca7w4UnQDGPCV5y8VHeXku/qKhDe2sEZe
	jcvSVlSlaKB2pyhykWmHCOPWDVbwjymnER+23nwNxuyKQRa2WC+WM4rdiPEtoRgEW6Jfd9ATuJOlY
	HwSyxPK4tu1qMiDFpW4PphUl8uFda65iBf2ZQ3r6O9eqS+A6RrJSaaAbMO5Dim37hNuHGjhke0onL
	zc57wc6Q==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0r-00000000ldJ-2XuC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:49:11 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a43afb04a7so29699891cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958546; x=1749563346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=P5B78d9jFkCI1USYXEvlZQp7XY7yXZ2M9jxIWg4ug7FRy2q1XS51qqKBdV7bpuWhQk
         dNUsZ/pWyG5wy2Ez98xQfERXKIHqZG9VdoMbUu13qrDK5fkjMdRl1Q8K933DTkKp6uow
         BBFY8E/oTd3SMo49a3O9r9829yPgCcMyzz4D69h/7lF0xPkvXhtMYyX/2091TiHVsP8o
         FxHO9JDQk3cdTBvXpxQPwJaKvfIvv0kmK9HJEvHU8JTLQucRzeqe3YN6zacVtUGxg0Gc
         d8/+ASDTJZeBRvXuZ3txv1At7B1+aeDXQhyw+3DTs2WCYUZ+iQ1opq+DHjJt5HpEfQwg
         FubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958546; x=1749563346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=kK4Qhz62gviCE4JpURgE/Y5w30pcptaNbfC+rouFPCs/hFjd48/lvtegqMN9O6eukg
         6aabG4Rw1oRWky4tmhitmie0Xq7TG+CNiVPdTCjGKfcq1gMDGLdSS3ZCxkTW0msTQ5FL
         WkOUdAH3656gqbLITeSZfJ4I6Fie8ufDmObi0mjRZxmZc4JxzM7YS46uM439RnR2qqj/
         CVITO6WdxzweczXV4Tv1U76BowLa+25Wz49Jzncc8wgLacY7GQ9Jjg8dFiO3qsc+I19J
         1qFnYLYpE2Su0y5mbasGrxPXipz3K5jUxUxgGbrrBX54ClBv0rMngkwLpKOm/XsOfxkT
         siKA==
X-Forwarded-Encrypted: i=1; AJvYcCUbvABZRw+zebYmeOr9x6/Sczg8ai7xJ4VKMbuiVr+Sa6epVlYheKublzvYiZCwLE3HdVS1UH65bOL6uyB+Wcma@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa2bepGiWFgZu5HchajO4l90R+C1hluTXWvX3ybiBb7C8PKIBQ
	jGjHrniPlMiKLiIPM+N5UGFtznM2SGLm0W1wgKC66fEuCiWycZx0GvIaTJwj03XQn+s=
X-Gm-Gg: ASbGncti1DgIbT2gU/aQyxGqUYVAmnfzr+BsAOp88apmVK3OmC4iMzxPzAYgL6IhcMh
	Z8XKlPBWc6OiZr55Bh8H1TUL4q37s7zhOsw6j3CqquP1C2hJ4nd5kdF+2mAKBWUxzycDEYVHeRG
	aqbzHtQcmExsFj/4IoHWiHOb+AeDirt3tBrnMjyK1GE4ADUOgVa/x3CMBn7nMALmM8ovHEcrMZa
	+YtJwz/jvDRpJk4AJHfCTBtabiXrAKxKqwhwss3O74RG2dkh23K4NmK7QjyxBnllOHtwtjIiNdV
	ghX65Cj8ziem+a0eXcrOo9nM2K9vCBLlGPnrTz7TInIw/3dtbOvxCB4kJWGbPCAlKKzE7urNGdR
	NKOsQT2pEVGQiEWC4FtePq1toSIY=
X-Google-Smtp-Source: AGHT+IGIU1g+493Q79vIGhbP57BxcXzG4cORozjsE0WNUaw+m77zFEPhKIIEfe6WhON7WEL1UbHK4w==
X-Received: by 2002:a05:622a:5a98:b0:494:b914:d140 with SMTP id d75a77b69052e-4a4aed8a697mr209908281cf.43.1748958546430;
        Tue, 03 Jun 2025 06:49:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772a19sm74189111cf.1.2025.06.03.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:49:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0n-00000001hCF-1wNL;
	Tue, 03 Jun 2025 10:49:05 -0300
Date: Tue, 3 Jun 2025 10:49:05 -0300
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
Subject: Re: [PATCH 09/12] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
Message-ID: <20250603134905.GJ386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144909_692417_8F00269C 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, May 29, 2025 at 04:32:10PM +1000, Alistair Popple wrote:
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
>  arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
>  arch/powerpc/mm/pgtable.c                |  2 +-
>  6 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

