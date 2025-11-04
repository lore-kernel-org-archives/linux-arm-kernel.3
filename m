Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F4CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPlxj2XcuMR9QsPDhWUn4t42vbS9gOSK0RNqvBNP/Jw=; b=iD9TiEOEPl7U20bFMal3aQ+BUj
	+jvVgPxPqyzq1oba8X9KDWojVdjjcAgN8zUGYvS6kaBEzcqEFZZ1jX9qWu+va4pUKMUwq+xWz8w2X
	wib0loBlzMFOvVKManDmVEFIJrMUTD2v8+mOo7AD0lzlOwkuN8tYX884mvlPYclsr+SD2lMHLeD/s
	y4bnRwjX/GOk6z6C/LeUSKwbCQdJNTwaQerYcMdEkYBDAv9rs/XpF8bmQLdw0d+tWv7Tis7nLlkFR
	NBjWJvOQSdRIbj/gsmn7WtRTQAS2xjcuNRxUzmNB3iWpPN70RsMg9fy1/+6VAEKnXHYONuJPRCbTB
	KKp7IQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ4b-0000000C6kR-321J;
	Tue, 04 Nov 2025 15:35:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ4Z-0000000C6kB-2CdZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 956B7601ED;
	Tue,  4 Nov 2025 15:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2397AC4CEF7;
	Tue,  4 Nov 2025 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762270550;
	bh=UJVHyVAmxeVU6ynyP17+9c8X4Lrehhp/Ztd9XamCYzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohdV8tr1tABFtQCNJAbED3LnH0x1xomD01q/IQSjfHYXuVdHV+kI1TfSdhCsz1OjZ
	 +FhtOV4MyenzZyYrOTyOQUHRwTr+78I7S5peTa+SEnnQbwoxbRvNHPSPQ+9Bjh/EZf
	 LzmnA3YKUxXHUNeuLrWTlSS4J7264oAy6kXHyl7UZZ7ZEQEiUSeqwU3myXQtboeUOJ
	 bH0p6D29uN83tsngpAbY/gNDiZUkV168ffRXJhdLSg3fTqYahMXmFmjrc0OYxB838P
	 Ifii+JvfiyxlYirAqLu/3KFnW9QiMLXlSRLYuAU4H12KSyp/zNWH74oMgeG3J3ys14
	 vj0ZQB9umK5RQ==
Date: Tue, 4 Nov 2025 15:35:46 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Drop cpu_set_[default|idmap]_tcr_t0sz()
Message-ID: <aQodUrkaA4fE2fI1@willie-the-truck>
References: <20251015021024.366722-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015021024.366722-1-anshuman.khandual@arm.com>
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

On Wed, Oct 15, 2025 at 03:10:24AM +0100, Anshuman Khandual wrote:
> These TCR_El1 helpers don't have any other callers. Drop these redundant
> indirections completely thus making this code more compact and readable.
> No functional change.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/mmu_context.h | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

