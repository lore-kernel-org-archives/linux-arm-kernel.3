Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF546CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YTLOARiRwWk8QNejm59jNXoVMaiSI2DNwIVg4xY6GI=; b=pY1L/R8GRRJF64CbadsCOhQks0
	EyjWMdgpuhT2GPQPGFzcNJJWjTITB5wiY443BW9QiE0vXqvwySiRqWHKG8jOw4L1w9J94EI0Ukn67
	d18iTlHOIrwvSyb4l8fJ76j1fACYS2TOQyCrIe3dQXJDbjTV1Kjl8qM9UO8OV7VKV5bq/MNtjvUaF
	xBw5FXUSXiyAOY1l2+6K3yQ0LiCZhDzh3ilbc2BSdXHnRsgxJ9AtR0IkYmVCRr/+pPyViqB9efSxk
	N8l8Bb4xip3o2xkM9d7cdG7dHDTqwEFK3cdN2vE26aFJVUVSLxtqIrg8JjLJEvz36HJAKWm/OWord
	wbV6mWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNLR-0000000AXWy-2Vgr;
	Fri, 22 May 2026 10:43:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNLP-0000000AXWX-2gxQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:43:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CB9A26BC;
	Fri, 22 May 2026 03:43:01 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8013F3F85F;
	Fri, 22 May 2026 03:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779446586; bh=49ERVB42HbkzceUNDuiP0n4teSxNaWaUsT8J9PiFBJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1qNWdO1SmfjrQQ0lb2yVnJDiMBnyUxUuurt3x2TqS+jPAIpxjgjR37proU0VrQI7
	 yhEAc0n648oP4KiXgGRQ5RveySpxd1jY7QX7ErqNVvWx/sbVbTfrglaYEeGhN57oAi
	 fe20E8ILDxz3vz1Q63o39pebv6lu5c20hDthXK30=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	akpm@linux-foundation.org,
	npiggin@gmail.com,
	aneesh.kumar@kernel.org,
	peterz@infradead.org,
	Zeng Heng <zengheng@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Date: Fri, 22 May 2026 11:42:58 +0100
Message-ID: <177944657885.252010.9796978866224637120.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521073011.4121277-1-zengheng@huaweicloud.com>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_034307_724103_A2FED9E4 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

On Thu, 21 May 2026 15:30:11 +0800, Zeng Heng wrote:
> When huge_pmd_unshare() is called to unshare a PMD table, the
> tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
> but the aarch64 tlb_flush() only checked tlb->freed_tables to
> determine whether to use TLBF_NONE (vae1is, invalidates walk
> cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
> 
> This caused the stale PMD page table entry to remain in the walk cache
> after unshare, potentially leading to incorrect page table walks.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: tlb: Flush walk cache when unsharing PMD tables
      https://git.kernel.org/arm64/c/c2ff4764e03e

