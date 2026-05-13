Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C343CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZHV2Kb6uwd0Z6ZEGhEeHOrazGmeyX5uyJYUBguLyzA=; b=gEMu20QFq8Y9KdJ8gdJXe4fosX
	ukwBpZGpLXo/lRCBxa6qdKVeaweaG7ziFGzipUmrE1/v8y86CtnzCeZ52PPdlA3HZHIK3riBF3N/5
	lZykR+6TNJQcoHv95idDkRiNomJMxdfMJy9MlstmTjArCxKxYFgmXHs1AZTR+6j1Kf8ncsGQMePvU
	F8Wq1yHXSJsfr8x8HjkHsGPzUlWYst63YrtFG6ufx2wlEnb1qFGssXAkYlLvYHRxg1Nmw/6R2yfbJ
	nVI+TsytPeSSVvzGTZ6GQ09NaXm9di2rosFKS5XB3s49dQslcDyT2GBh3aoz0LbK254V95iu4vIhp
	+O/Ic7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDXg-00000003NHY-3Wqq;
	Wed, 13 May 2026 17:38:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDXc-00000003NFw-05M1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:38:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b46da8c48eso1955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778693919; x=1779298719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZHV2Kb6uwd0Z6ZEGhEeHOrazGmeyX5uyJYUBguLyzA=;
        b=TjPK8pN461+NXm8udJu4JOMOYAsyqOP1/cTKCUL59+UaI17rTUiXX8uIFGx4QhJ+LA
         GF16KdIarxS/nzS9IHtZHRGKk1DV6DG/4VNxN4YHdOijpviNeoyXHSuU/3fIPw/T/awR
         e4LQyf1NxTsKyZbn1bDoQLpOZ8eL/U1gRtjPtQxq0o7WEilULSl5J2tnVKU/OZSy7Isc
         qqupAhLTBsEktQnSTu/lBUIG7GRsw2tlFM5tn2+OXyBANEBR4WoDrYwPenn3ThwVUJpY
         fSkbmgiB53B2GXchSdqh0LretjWi/y1cLVvUVFeQfMfm0SNRMOUCRKZkj5WyGALexQj6
         JNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693919; x=1779298719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZHV2Kb6uwd0Z6ZEGhEeHOrazGmeyX5uyJYUBguLyzA=;
        b=k+Dkb5ZHkNonOKW087RmwsG20iqCLVrSTfySnjBRIrHZ71tRhRDErpk/RWRiOzLefQ
         g4IbEq4dQYhd0jGzjt0yaCsyG01jOTZeRgzuEGq+WfNORx7ScKiSf/qeFd2CpgxpzvmB
         l1bBo0ewTC/b5Wsl8U7E1rGlD2t30vyXnoJ9+WBgYRBS29fJuf8pM+5w/mGZ72XMVlwm
         3cMfQ3oI8C79O5rXsjViK4A2CpJybthFzHwRw6cpQH8LWu+7RNgOWNPxj0ME40ciP9IO
         65MGMa1hY7t+zbDx82lJoapy7YNETNLUe7N9toPtgPgA8jrqUKLaicBHF7a+S7bbP9kH
         g9Yg==
X-Forwarded-Encrypted: i=1; AFNElJ8eABLFHOrnjqcT6PJZE5Wap4XHzHZWDBXstgnWVFSkMGIU3M/hY2KQG4m4p6Bm+4D2HtmJ9iPWkXcsjfPhP98+@lists.infradead.org
X-Gm-Message-State: AOJu0YzCzp7kw+XW2FLGWTg9vUFuYF7BvmuMp+zN8nm8BmolNTGXLApp
	OcYX9Xih2TvnNOEJUf2qztBbyvIt8syo4Hu1Z/FzLkRnyNOUSxXu12pXYi+NrY1esA==
X-Gm-Gg: Acq92OF7VZ7q0culhajRxXHDBjB0gZtP40cyMYcKASEW6z8tm5rSJUctPTGetl6OA8J
	odxW9w+RYjqf5C93MPCDnNut/dkGbv3zk+jsZUesjVOTuM3p8eanAShm9GGqO6SP0yIRbEmk2zz
	TkfgEEeghNxvlhKj8FCy+GjrTqCEXANbLA7ojeNE+0dUnbFFod/KiaC9LxxCK5INBqc9gMRCYIv
	SFvlbF8h5s8ZEQo0poX+QO+YFgHsaWFdGi3zB/ZbOZqJAdzY7jjuYdxvSozZQHshxHlNf8qoeze
	GoWcRivX88wXJhvtYXZu5LFaFpr48zuNbMO5HaRmg0PBlLh4u6/OYmG4xG7+dzEOhZ++lQnl1HW
	MaoKFwbU75YhNh5PoldI+9HVJx21z5HxAkBqsyHNsdiKf0WUZ43wuOqJk9iITCPcE3JzyXzKAfk
	YvJ3EI88fR7waWwF/1/32pL3IAELwuaOv1jfkc50A9wtC4Uz+glvrCiMyaYu8THX13nOsAFDPor
	KsS/NE=
X-Received: by 2002:a17:902:c401:b0:2bc:a58c:fd7a with SMTP id d9443c01a7336-2bd55e48463mr183585ad.16.1778693918255;
        Wed, 13 May 2026 10:38:38 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e6199csm223692405ad.55.2026.05.13.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:38:37 -0700 (PDT)
Date: Wed, 13 May 2026 17:38:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <agS3FzgDlMADXU1e@google.com>
References: <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
 <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
 <af3ryl7G58D2GeWr@google.com>
 <4e129891-2f52-4bac-8e33-1fdde42fd29a@arm.com>
 <af7oyeleKFXpcIKu@nvidia.com>
 <agHYDxuYyqzmAfy5@google.com>
 <agRjt9XpN66ktdk9@willie-the-truck>
 <agSKZPJmFMLc0gno@google.com>
 <20260513143213.GA787748@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513143213.GA787748@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_103840_066330_BAA37F10 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, May 13, 2026 at 11:32:13AM -0300, Jason Gunthorpe wrote:
> On Wed, May 13, 2026 at 02:27:48PM +0000, Pranjal Shrivastava wrote:
> 
> > Now, if we're work on an SVA page, with only SMMU supporting HTTU. A DMA
> > writes to the page and the process (CPU) calls fsync(). IIUC, it performs
> > a lookup in the Page Cache specifically for folios tagged as DIRTY.
> > Since, vmscan didn't run yet, this could potentally drop the writes..
> 
> How does it work differently in the MM when the CPU has BBM support?

Hmm... I looked at fsync and I see that it eventually calls 
folio_mkclean() (via writeback [1]), which performs an rmap_walk() [2]
to harvest dirty bits from PTEs into the respective struct folios.
Similarly, the vm_scan path does the same thing via try_to_unmap [3].

Since the MM subsystem actively scans the tables during writeback, it
doesn't matter if the dirty bits were flipped asynchronously by HW (w/o
kernel traps).

I guess that settles it, we don't need to gate this behind cpu_has_hw_af()
and we need not care about the CONFIG_ARM64_HW_AFDBM either.

Reviewed by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1-rc3/source/mm/page-writeback.c#L2905
[2] https://elixir.bootlin.com/linux/v7.1-rc3/source/mm/rmap.c#L1103
[3] https://elixir.bootlin.com/linux/v7.1-rc3/source/mm/rmap.c#L2164

