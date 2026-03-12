Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA8106ACEF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OrgL1iQRwZHOzCyRQIk0lufG4h3ls5sHWCdkmfF4e8=; b=t11CPtI4hxwSgWrRbV5IMLT94M
	w+8dN88/wP6oKzF2yRDSmutfDTMfLWF31lshVkOF0qzuCkgQNdlOk+bRZmFYUiGtoW+uxSkfczp5U
	QGGwTgrB7FQHcvYVLEQ3nohTmGuXDQxwL1l2cNcsCxEpsr/8pLSX3oXh72QAnKCfF+JQZOSdD3tEF
	SONUbrGOYZP73EPv0vAmBg5KzT3Y+xj7fQRtbjDLNi2X90y1VLkxwy6tBXT5sDPXyAM1fF3UhCcno
	P0EL5Xd6IZMUWUlmARC5Mggy4ndiyNLwqxIGB4kCDKtTJXIHLQnZeh7+8GvUSPwYAFiG52f7Z69jK
	Jx3Z1iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0n6Y-0000000FNUI-26pM;
	Thu, 12 Mar 2026 20:58:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0n6W-0000000FNTm-1vEK;
	Thu, 12 Mar 2026 20:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6134260142;
	Thu, 12 Mar 2026 20:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D739C4CEF7;
	Thu, 12 Mar 2026 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773349079;
	bh=K9BkTSEP4DAO1oqXkTRgIUsMciXJXXN0g3ET3zAlngE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FLiV1etmYVcSGbbdm/XWzQaxQrtcu+DjcXjI6bdWYsu841NM3z6Xw64cXI54+iaIn
	 L2BrHY9lnVUqIJ6938urwDNEtRFz9ffekCMe3lr4UZIlR45/w5t14m5ix5+hCEMOxM
	 z/hIOPZIY6kgBHdLKvnC8iu8NrktiaWhHWtId3+Y=
Date: Thu, 12 Mar 2026 13:57:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org
Subject: Re: [PATCH v2 1/4] mm/page_table_check: Pass mm_struct to
 pxx_user_accessible_page()
Message-Id: <20260312135757.d65e8145d9d39e1ca5bc9666@linux-foundation.org>
In-Reply-To: <ttbskgg@ub.hpns>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
	<ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
	<ttbskgg@ub.hpns>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 12 Mar 2026 16:02:40 +0100 Vasily Gorbik <gor@linux.ibm.com> wrote:

> On Fri, Mar 06, 2026 at 05:16:30PM +0100, Alexander Gordeev wrote:
> > From: Tobias Huschle <huschle@linux.ibm.com>
> > 
> > Unlike other architectures, s390 does not have means to
> > distinguish kernel vs user page table entries - neither
> > an entry itself, nor the address could be used for that.
> > It is only the mm_struct that indicates whether an entry
> > in question is mapped to a user space. So pass mm_struct
> > to pxx_user_accessible_page() callbacks.
> > 
> > [agordeev@linux.ibm.com: rephrased commit message, removed braces]
> > 
> > Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> > Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h             |  6 +++---
> >  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
> >  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
> >  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
> >  arch/powerpc/include/asm/pgtable.h           |  4 ++--
> >  arch/riscv/include/asm/pgtable.h             |  6 +++---
> >  arch/x86/include/asm/pgtable.h               |  6 +++---
> >  mm/page_table_check.c                        | 15 ++++++---------
> >  8 files changed, 24 insertions(+), 27 deletions(-)
> 
> Andrew, may I get your Reviewed-by or Ack-by for v2 so I can take it
> via the s390 tree as well?

	Reviewed-by: Andrew Morton <akpm@linux-foundation.org>

It doesn't look like [1/4] changed significanty since v1?


