Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC49BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3LMo9OUhCt7iuD9sUwObFV3HjBdU8mIDrDWMzZ4g6Q=; b=N/SayktsSI4kmaCYAm+dPx3jAJ
	bmAM1LnRuabWRIjQhbd5WaD+S6L+sDrT49eQR4dfwiVjaXOKvOMds2MHwjfkVoCaRMBZDuscYdmk+
	OKZdyxGyzNXGGcVQT6OLYbYvkc2MRxpjidYOAsv7vk2AnQHP9vuLKCVy0C5YsH/EHaLw+S3VyTOLv
	67OizZE7JIgwHRvQdZ7DMClBGwfbPNDsGb/XKXXbSIUvQNCA9FQUlWhnBPuK8kfDwVZoMUDdCSfAN
	GIiyfMVsAIe2KltDhuQnIcf3yV3Pdl2SKoWH2T8G+K7oi6QoPS72NN3NmKNlNKDbLE0pdMrUf4ivH
	XdqsWI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAen-0000000EV9s-1ihr;
	Mon, 29 Jun 2026 12:00:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAel-0000000EV9Z-2uIW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25776424CC;
	Mon, 29 Jun 2026 12:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADC91F000E9;
	Mon, 29 Jun 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734407;
	bh=H3LMo9OUhCt7iuD9sUwObFV3HjBdU8mIDrDWMzZ4g6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aCKCScNIw7pY1NYDeBsU/PN8yQETYoNGnOvKW9qOn0jGqvLent2MpvdaKon7xo0Xj
	 buSv7W1ouVicuoBqYkdTiwX01kg6xeJoym5FPcnHA0jvV+HpIDuH9+NFTIbFuKKG//
	 4xOY+p9Cn3xDnc4Gr7ykkqi1rqNF9adIPgF3r2qYIiYSUVye+puqD9MQhUphqiGCZT
	 1RdlILLnr5a4crM7xC3ucQbPAr8ac+itE2SJ6fE5X6R+JqT64OiEuzg/VN/ektNh0r
	 xNs++EQWMkgAcABIRhhatIXkdrHQ4BiKshf5EstgaeUmEfry4vB+HFDioXqsB7NfZe
	 A8tdAbu0pruuQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
Date: Mon, 29 Jun 2026 12:59:57 +0100
Message-ID: <178273154856.1018225.14785712662574952579.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626012845.475959-1-anshuman.khandual@arm.com>
References: <20260626012845.475959-1-anshuman.khandual@arm.com>
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

On Fri, 26 Jun 2026 02:28:45 +0100, Anshuman Khandual wrote:
> flush_tlb_kernel_range() could flush down an entire block mapping just with
> a single PAGE_SIZE stride. This capability was being used umapping PMD and
> PUD based block mappings in unmap_hotplug_[pmd|pud]_range().
> 
> But later on the commit 48478b9f7913
> ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()") replaced
> this PAGE_SIZE stride with [PMD|PUD]_SIZE strides, hence forcing multiple
> PAGE_SIZE stride based TLB flushes on platforms where TLB range operation
> is not supported. Revert back to the earlier TLB behaviour along with the
> required comments that were dropped earlier.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
      https://git.kernel.org/arm64/c/ff4c5a0de1f2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

