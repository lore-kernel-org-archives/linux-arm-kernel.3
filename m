Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C3CC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj1Sf7jZXzFpezv3SWCxLBwifYa4niBMpkYPMR5O4Iw=; b=Ih0bH5OjFuZo/OHgvCHZOsm5lG
	Zy49I7mT3Dy8CdWuvRQQ6DnRvlrMXfhVx91owvHPZj+NvcPwgayI8AmHWr3EXxJqRTBbrlbp+VlDa
	4X/Hv0TvmM4iDcDpcVWT2tyfc7kYJug2q8iLV1RF/pxehVRpBXYxXX6ofcw3tUCTsGKEGEc4T9hCQ
	MqGUQPvWleUualVxSZxbMmrl/F8AGXBgon7l6U7LpRlCFNjc2EXNXan7Q0wmUU7C6S5osC1LOYDqT
	rmkhvVcwRn0aUEqXb/YgdtXjDpDFBZfKxbrLZJfyOyhOFkqawbuiMfQOzkhhrLhl87QC8VJCLkOKu
	/J/deCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMme-0000000ACSp-3Az8;
	Wed, 11 Jun 2025 14:50:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIDD-00000009YdO-1TA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:57:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90AFC629DC;
	Wed, 11 Jun 2025 09:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0735C4CEEE;
	Wed, 11 Jun 2025 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749635858;
	bh=e6TS5O+g2JwrZ8I2ZOF2aYAJsjX+AZS4VpHURqwjnLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/6FMBTwIaQN2SRyM9vkcaCmosGcBtQJ+c5KUx2YCVnXFjDAKwf0hWKHhrni5xlbj
	 dmklTuh3gfNT6cdQk/B4ISt7Gbtt+cfFSaFqiAGDp8HyX7WCSNCVQ+9ugGxnP8eCJU
	 RB84oU9HHmsM/BCT0riqULfcimJiV4k55VpfsMyzIQtBTBIOQ6r0rATDg9sItv3kME
	 lDhSusRlWoJCNI0V5+jLYHEcUpRwdl1seRedsQuzgP2OjF5L/g3RUkb1koXcnxHbbn
	 J0HWHLacUxMOiUEiwjenshSVoafxRufNA8zPFF5Zme7COtU9+zqoGv9W/ABUjyGtGV
	 21Y3/bjAhoqwg==
Date: Wed, 11 Jun 2025 11:57:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, 
	Dave Chinner <david@fromorbit.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v5 3/5] mm/readahead: Make space in struct file_ra_state
Message-ID: <20250611-mitleid-ablief-1e7f1f03394d@brauner>
References: <20250609092729.274960-1-ryan.roberts@arm.com>
 <20250609092729.274960-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609092729.274960-4-ryan.roberts@arm.com>
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

On Mon, Jun 09, 2025 at 10:27:25AM +0100, Ryan Roberts wrote:
> We need to be able to store the preferred folio order associated with a
> readahead request in the struct file_ra_state so that we can more
> accurately increase the order across subsequent readahead requests. But
> struct file_ra_state is per-struct file, so we don't really want to
> increase it's size.
> 
> mmap_miss is currently 32 bits but it is only counted up to 10 *
> MMAP_LOTSAMISS, which is currently defined as 1000. So 16 bits should be
> plenty. Redefine it to unsigned short, making room for order as unsigned
> short in follow up commit.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/fs.h |  2 +-
>  mm/filemap.c       | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 05abdabe9db7..87e7d5790e43 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1052,7 +1052,7 @@ struct file_ra_state {
>  	unsigned int size;
>  	unsigned int async_size;
>  	unsigned int ra_pages;
> -	unsigned int mmap_miss;
> +	unsigned short mmap_miss;

Thanks for not making struct file grow!

