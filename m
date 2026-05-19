Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF6CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZTqF1pEAObGXhu7gd9s4CQmBWeYlqcuwlD1zX5jd2o=; b=aod1jD2qpdlRvkboJuoVIv/Pto
	i98SVccZq8RG645F3AkiOOcRi0GpiZ6aPZVIVqLSGY5FVthir8iInej5N7ykpjohuHFKDwpU258i1
	gsxlp2GvpQcwhHYWcCwNMF6c7M6rWUXhBTSkd/EZJ1mKwKtjf7+2OBJApIUKFdklMBPVvADNgC4fQ
	5sya2gId+N2yrgWctE/QNa/hdIDwDgNI5X1OUWHtK/22IJHXD1Xu6LkISoF9hbJKHeiBtdK8BlyeF
	bvkDd4lUuZxq3s0fr7k1h8OXClczwXH4cEZvukAtslrR0ZhVRdoNU9lWAqye3xgjTG/UrB/XIukIm
	qmnn3GdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI3B-00000001D3K-2mSu;
	Tue, 19 May 2026 10:51:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI3A-00000001D2s-1afL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F666020F;
	Tue, 19 May 2026 10:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59BC2BCB8;
	Tue, 19 May 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187907;
	bh=+f/VsvcvDGarTr6mOhk+WMyELgLXSSutUe7AMovdBhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0rxXUDuOsUSbU+QlYvPudkg/DArq5zNpx9nSWrdFVclNGaiIsqcmy6FtDeIG63zw
	 pxEoqA5u6er2jC6qAp1OVAQL7gUJXS7ROYf6H0qQn7RsxgbgW20X5JDM9FAJf3Vc+a
	 v3cbZu67ZOFQVmjAtW3/QtK3cK+RPCJ5HB+N6tDqTOvghBE7ftlJsWDKgbBNOwZqXA
	 zb8GGNInVS7jmiILnPIJ8Yg4E5vfSkSQp3cvlLXpheXKRvmPVvsQjiexhKR2F26DsZ
	 6ZsXGhQFqzDKnQ/rnNASQcKWzd2O/uITzZ3rwx4XbOK5i+dzCiZUSadswjb5IUYKFb
	 ImdwQ8lH0mkpQ==
Date: Tue, 19 May 2026 11:51:42 +0100
From: Will Deacon <will@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield
 operations
Message-ID: <agxAvl02rcPoEHaq@willie-the-truck>
References: <20260430164545.49637-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
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

On Fri, May 01, 2026 at 12:45:43AM +0800, Hans Zhang wrote:
> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro. This improves code readability and adds type/range checking without
> functional changes.

Does it _really_ improve the readability? '&=' and '|=' patterns are
pretty idiomatic C code, if you ask me.

> FIELD_MODIFY() internally performs the same mask-clear + set operation but
> eliminates repetitive boilerplate.
> 
> ---
> Hi, If the Maintainers think it's not necessary, please ignore it.

I don't really mind the code either way, so I think I'd prefer to leave
it as-is unless somebody wants to convince me otherwise...

Will

