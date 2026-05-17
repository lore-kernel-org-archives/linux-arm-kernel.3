Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA0BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16+zieyMTrJtMicSjolIgLH/2nyTkE4OachXDRLPQoA=; b=XWLBexmYpXvzTZs0mpu4cZYW4E
	rFNGe6qafi3MwvmZIiOYlumvA/WLYvhPAn9fzSGG9FUwcnr86LNGJMfDn6VeGiyF+wrEOh3OXdxmq
	ZL7N//RZu0WnRPeLsluOakJAhwPp5Y4pjCHsTRlXlLbzfiYov8G23a3Yyw8vDIj0b4cLQuWvVdVfA
	rm5Q7oM11m48wtvt+RvpXaHNm4SxogPGxt7cY+wiZe1lHSs9loQneNmUKW9YMk5sF31jxH6UWaomp
	Y1WuKPxalp5XFpPZawSgJhtZyrjYL9ykQfJVgy9kHyItsnNeaTpq3jjau7UEmvxiTAlk0/Zuk6uLx
	lbze/ZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgga-0000000DHDY-2Egd;
	Sun, 17 May 2026 18:58:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOggZ-0000000DHDP-31Ug
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEF276001A;
	Sun, 17 May 2026 18:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F758C2BCB0;
	Sun, 17 May 2026 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044278;
	bh=lgp1Y0cbFZdL+vpyXlbpNuIdHM3vcSmyQNICRmFJU1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j12Nyp5J5wC6T9JLE39GMfLmW4mELfC1pSEmPH/aJV0RAFEGIIGLiDIiiUTuW6pyU
	 dGLt9gMFIH8v5i5KeL7WsmgjcClNdVlp6e1kurv57KswdNv24MRqFKcoVbLBNmwwJ3
	 Or+CqdG2/GxZdeUGuSBkBlIaqxntMEf+WuPAY3AEFK7NjUlmIgjhcv4GQUeWEDIPcr
	 uxY1XiesgRFCXsJ1wN7b3TeGgU/pt95P2xUxHkJtq7Lki8VWMp+X3qe1NcvGA7Ouy7
	 9QzW0Sk9lKG2x+vs19TEAdKq1sAJ/uzutqbwSrbBDSnA6Db1a+HgHyETqzLxjR0QEE
	 3K7phS0J2JO/g==
Date: Sun, 17 May 2026 21:57:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V2 01/14] mm: Abstract printing of pxd_val()
Message-ID: <agoPrkN4mJxSYJp4@kernel.org>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513044547.4128549-2-anshuman.khandual@arm.com>
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

On Wed, May 13, 2026 at 10:15:34AM +0530, Anshuman Khandual wrote:
> Ahead of adding support for D128 pgtables, refactor places that print
> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
> macro to prepare the argument(s). When using D128 pgtables in future,
> we can simply redefine __PRIpte and __PTIpte_args().
> 
> Besides there is also an assumption about pxd_val() being always capped
> at 'unsigned long long' size but that will not work for D128 pgtables.
> Just increase its size to u128 if the compiler supports via a separate
> data type pxdval_t which also defaults to existing 'unsigned long long'.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Changes in RFC V2:
> 
> - Moved pxdval_t definition inside generic page table header per Mike
> - Restored print format in __print_bad_page_map_pgtable() per Usama
> - Renamed __PRIpte as __PRIpxx per David
> 
>  include/linux/pgtable.h | 11 +++++++++++
>  mm/memory.c             | 23 +++++++++++++----------
>  2 files changed, 24 insertions(+), 10 deletions(-)

-- 
Sincerely yours,
Mike.

