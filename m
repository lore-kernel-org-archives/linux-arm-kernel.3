Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FEC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBdUVaXmnsficgyAZ6a/uotxS9hvkMAlUvTvgvoTIYo=; b=Vpkpmmce0B9KrxAJ63J7Cakdeh
	pb46MT/24UykJ/cMVBcDl/RMoWcV/ZcElY2cF8QocLRj3oPfUIt/hbq8/2nE4N4z09uZ3buywd4ux
	Y6FB/A11d3j5dmBgk1K1GAfkQLvQ6eev00Xpd43blE6zo6aw01NLfvragzWy6KLs6O2B6GXPeXwa1
	qFeiM+wOwwLXx9bc1V43KDI4goa3NXvHcR6kusHpeSsp0ErmDXv006DSVVmyxZ069RwrGss29NqCA
	qO8IGN1UD7BIqgF7SyL6idMldJLZLyKmTa7chuEMEK3edkt1h+swbifvlkvIxd5P5f4yzizSjxZye
	l+ZyYJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DCJ-0000000AnAp-4An4;
	Tue, 01 Sep 2026 01:21:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DCH-0000000AnAV-3oBo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 01:21:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B54D0408CD;
	Tue,  1 Sep 2026 01:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FF31F00A3F;
	Tue,  1 Sep 2026 01:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788225716;
	bh=QBdUVaXmnsficgyAZ6a/uotxS9hvkMAlUvTvgvoTIYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lrYZkVU8GXUY3oKmWLqdUGt/YfpBXqQVfk+KQz8tr5TRgjvYQ4ND1evUU2DXd/nVq
	 A/DCSB5TAw/RedREy/u3j8nbAq0sO8/ZZzpPSSqn7SU3OnuDCyMgULmKvC++cjHS14
	 eSrbDTDD8FEJL92Ts+L7yRg+8eYRRU8vhfjhfT0GJNwckMNi/EnDEu7zMZMbGICzTa
	 e3dc5wTerx36exknn4Grag84aJNXO8SX201WSrghffU/eBXyK4dkmN9Y621bf8FQfU
	 7bUcYtOZv+c0zb7ZsBgmgRYxIED8yJAGpnb3iuKzZAvgwb+Lx2ir0MvfbI431kAc+c
	 caVV12LGRLe4Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH 6.6.y v2] Revert "arm64: mm: Don't remap pgtables for allocate vs populate"
Date: Mon, 31 Aug 2026 21:21:46 -0400
Message-ID: <20260831-daily-reply-0002-arm64-idmap-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831152906.7000-1-kmehltretter@gmail.com>
References: <20260831152906.7000-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> This reverts commit 54322d95309d9aa4cb77b34ee4b6c8b541f3e21f.
>
> The 6.6.y backport removes the clearing performed by
> early_pgtable_alloc(). Its replacement clears allocations made by the
> generic page-table walkers, but 6.6's create_idmap() still allocates an
> extra root level directly when a sub-48-bit VA kernel is loaded
> sufficiently high in physical memory.

Queued for 6.6, thanks.

-- 
Thanks,
Sasha

