Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54218CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nI6Fdd9M/ljBVrydhqfvwMnD/zDhS0cJ+5YJJ+zGUZ4=; b=QUuUE37y41P44yRgd1ISqfMERi
	L13AxHLSq64uEfnoU10yhpAWAsMsk7lJQUI8LGPNdbJhTm/ZVh28u7Zvn8SQLU6gqhkxoHl+Q4qog
	axI/PwM1NQqBVUP09BmSq4WFJJmemkvq0i/hnBhjJFUfOIJ1kcMVIqeKOlxlH+5IwSK7tiyuw18zY
	Vinwe5gieuTL2LORtGKW1tkSvS0SB2zNJK6b4nq9rR5K/H/qSjsiz3T6ppKzElsfCfWUkgGfG5MaD
	gM0z4Vo9mBzzga+Col+NIIeyvWy2x0RQvKCCPcKAPBCosTClIfd2wLjRTWvIkS2lvDlLC81MSEhjL
	fDnYdVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzZo-000000077vu-3KhF;
	Thu, 23 Oct 2025 17:58:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzZn-000000077vm-2XDV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7216116F;
	Thu, 23 Oct 2025 17:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14620C4CEE7;
	Thu, 23 Oct 2025 17:58:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-mm@kvack.org,
	Yang Shi <shy828301@gmail.com>,
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2] arm64: mte: Do not warn if the page is already tagged in copy_highpage()
Date: Thu, 23 Oct 2025 18:58:06 +0100
Message-ID: <176124228654.947262.14709608501971650824.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251022101704.4015055-1-catalin.marinas@arm.com>
References: <20251022101704.4015055-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 22 Oct 2025 11:09:14 +0100, Catalin Marinas wrote:
> The arm64 copy_highpage() assumes that the destination page is newly
> allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> accordingly. However, following commit 060913999d7a ("mm: migrate:
> support poisoned recover from migrate folio"), folio_mc_copy() is called
> before __folio_migrate_mapping(). If the latter fails (-EAGAIN), the
> copy will be done again to the same destination page. Since
> copy_highpage() already set the PG_mte_tagged flag, this second copy
> will warn.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mte: Do not warn if the page is already tagged in copy_highpage()
      https://git.kernel.org/arm64/c/b98c94eed4a9

-- 
Catalin


