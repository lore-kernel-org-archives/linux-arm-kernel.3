Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20293C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liaY4NC2sqVwf3er0oXP2F/nJmw+4O/kf3+17VC8Er8=; b=PXPe6HuBF3lqR7WiiisWSyWbLx
	QS1CCvkGyh+5LK8GPM11V/N6vZjHr2Uu2Tsxd8wzpK2TWaJFMkv0WNtlqqJZOTMLarIeeswGdQkGR
	G0xjTId3nbceIdk2S7W0vNvBGvpISdLJl9wf6o/0dcSq5xVpe2v4hDG0yCnK39SWHcRrr3wbFIUI5
	n8uUPJubTaMigRir0t5pat32hhlVIpOjacXQzYQk8KdrZc2s28qnjGibYztsbKVBhOSI/xUYcc69+
	QFGl4tXK3EN4u/9ZoqrY/kqPzQUQSDGKWccsFtdLlu/RUp2vEkGC3J2P9pwQk4EGJyPbTkDr1fpQ5
	qeWSVIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ya-0000000HSEY-3AoU;
	Thu, 03 Sep 2026 13:59:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yW-0000000HSDJ-0GEC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 816C26053B;
	Thu,  3 Sep 2026 13:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6785E1F00ACA;
	Thu,  3 Sep 2026 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443971;
	bh=liaY4NC2sqVwf3er0oXP2F/nJmw+4O/kf3+17VC8Er8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JzCWvkB5JJJyHKCTiznMqKMgFXs6I0urpw97dPnBNdPHKxYrQoJDOBq82Y9//aPUP
	 HArh9YowHcG5YO3SmdyBgcgdAX1iWBIdi/eRdnvFM7Sn62w5MExECo1aOwsY61TBzF
	 dz/Qaajwvi5bfQWDkL5ff7F6AzAgu5Rg0VHAvCXRBwzUPNymjmEEtbzPXOC/WRzgu+
	 CznYZZ6I5tmE5ELwUXLA2TVKMu5X4ytSaVVjCfG3ZPhQ51S5UX76r8dKe1UgqwCNMh
	 A6DrQsN4bKjIfI4ypeqRbsnD7T1D5pr5HXdFQ+twjCefynmGmnaFedfCY87sEUCPc/
	 ve+2sdmUPbIqw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: mm: Fix the lockless page-table walk in show_pte()
Date: Thu,  3 Sep 2026 14:59:17 +0100
Message-ID: <178844029253.4160801.11282535964402738710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828174131.46825-1-kmehltretter@gmail.com>
References: <20260828174131.46825-1-kmehltretter@gmail.com>
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

On Fri, 28 Aug 2026 19:41:31 +0200, Karl Mehltretter wrote:
> show_pte() walks page tables locklessly and can run with interrupts
> enabled. A concurrent teardown can free a table page while it is being
> walked. It can also clear a parent entry after show_pte() checked it; the
> regular pXd_offset() helpers then reread the cleared entry and can derive a
> bogus lower-level pointer and fault again.
> 
> Use the lockless offset helpers with the saved parent entries, as
> gup_fast() does, and pass the saved PMD to pte_offset_map().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Fix the lockless page-table walk in show_pte()
      https://git.kernel.org/arm64/c/a77644d009de

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

