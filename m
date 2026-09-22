Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6918FC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iztKm2JMcpPyD4ogPKgWEoylK7dEWOn5IAjcyxHLqcg=; b=2+A/rqEuDyOjjahUY2XVPJ+cit
	N14d0mXUfGxtC8UoME/lvQNz1iDkhn+ou827sIA1LesOd+mCkkg2pFlU3eUPbVyOpQqyh6ygrA9gb
	5OKbzNccyxIFPvw/0hrbAx0XicWaeHoJpRQu1BLSL+EaneyrBISlGqzlVvHFhKSFa8SivJigVNTvx
	cAzWeCE6C9H+2mmuc4rGfpeCSazpvFzMBYBUbafRNXpCpitf9tLC4sJ6/9ARFTi/fre5hy54tHND1
	PtbDPe/1TQqYxW03rOa9988Ye0YWIygPMeJLTHNLq1xAAH6sFOkyjci4+WXpCJUY5Chh5jYpOx1uw
	utL0riuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tTD-00000004IQ1-1q9z;
	Tue, 22 Sep 2026 05:55:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tTB-00000004IPo-3sXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:55:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A31C43947;
	Tue, 22 Sep 2026 05:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6941E1F000FF;
	Tue, 22 Sep 2026 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790056509;
	bh=iztKm2JMcpPyD4ogPKgWEoylK7dEWOn5IAjcyxHLqcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0cvYgM8kt/cMF7FBXrvQkxWgtZ2Glj7e3ADqsEpq3bD6vXdPWL3K2NoyKhbpGVvw
	 EtP8rsjdrAEFvnuhUZ5CBWuEjXK5SUQQynKfcuWnzRRfdVm6bQcFXDTDtQr9ZKgmKb
	 uvsqAQZ251m+AZnrQto2WVFz+y4AxcUH4eRKZg1eTCVDDKudXus8BfpkPm0ehW9SCK
	 AMP1iadYeZENwWQWP+vq2xWiOGqD/zujoBpwJyDYSZtEhl+VvaeyIhKp2r+SOZ/wvi
	 so58HdN8dJGzckKAB/RmLv57qkUHFGJu/G/maafzVT2kOZoa90eShkTUXYDzEcX5uW
	 mLyah6pWuRtuQ==
Date: Tue, 22 Sep 2026 08:55:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH v1 1/4] PM: hibernate: Add arch specific hooks for
 hibernate_map/unmap_page
Message-ID: <arIYNzM7kiKlr21r@kernel.org>
References: <20260918131656.3710047-1-vdonnefort@google.com>
 <20260918131656.3710047-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918131656.3710047-2-vdonnefort@google.com>
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

Hi Vincent,

On Fri, Sep 18, 2026 at 02:16:53PM +0100, Vincent Donnefort wrote:
> hibernate_map_page() is called from an atomic context. This is
> problematic for Arm BBML3 systems where the linear map may contain
> blocks and is allowed to split as splitting is a sleepable operation.
> 
> Add arch hook so arm64 can define its own implementation without relying
> on the direct map.

I posted patches that remove set_direct_map usage from hibernation:

https://lore.kernel.org/all/20260917-hibernation-v1-0-7f7dfae3dbe0@kernel.org
 
So I really hope this patch won't be needed :)

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  include/linux/suspend.h |  2 ++
>  kernel/power/snapshot.c | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38..10fe2298d94e 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -401,6 +401,8 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
>  int hibernate_resume_nonboot_cpu_disable(void);
>  int arch_hibernation_header_save(void *addr, unsigned int max_size);
>  int arch_hibernation_header_restore(void *addr);
> +void *hibernate_map_page(struct page *page);
> +void hibernate_unmap_page(struct page *page);
>  
>  #else /* CONFIG_HIBERNATION */
>  static inline void register_nosave_region(unsigned long b, unsigned long e) {}
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index b209712cb2c3..b41952f1de2a 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -85,7 +85,7 @@ static inline int hibernate_restore_unprotect_page(void *page_address) {return 0
>   * It is still worth to have a warning here if something changes and this
>   * will no longer be the case.
>   */
> -static inline void hibernate_map_page(struct page *page)
> +void * __weak hibernate_map_page(struct page *page)
>  {
>  	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
>  		int ret = set_direct_map_default_noflush(page);
> @@ -95,9 +95,10 @@ static inline void hibernate_map_page(struct page *page)
>  	} else {
>  		debug_pagealloc_map_pages(page, 1);
>  	}
> +	return page_address(page);
>  }
>  
> -static inline void hibernate_unmap_page(struct page *page)
> +void __weak hibernate_unmap_page(struct page *page)
>  {
>  	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
>  		unsigned long addr = (unsigned long)page_address(page);
> @@ -1456,8 +1457,9 @@ static bool safe_copy_page(void *dst, struct page *s_page)
>  	if (kernel_page_present(s_page)) {
>  		zeros_only = do_copy_page(dst, page_address(s_page));
>  	} else {
> -		hibernate_map_page(s_page);
> -		zeros_only = do_copy_page(dst, page_address(s_page));
> +		void *src = hibernate_map_page(s_page);
> +
> +		zeros_only = do_copy_page(dst, src);
>  		hibernate_unmap_page(s_page);
>  	}
>  	return zeros_only;
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 

-- 
Sincerely yours,
Mike.

