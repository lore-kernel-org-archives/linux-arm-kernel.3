Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3327C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daMRxS0Kh2ADzZ81QAFwLgz+aTvbJ+pwPAdc3QnTWcc=; b=EsALYun/1C6lTR3WkCNAEx/9j+
	fnowaWh8fTV+OVTLWkPCoG/l0JVNjCiuDW513EpxiukVFUDh6AAtw7bDmjCDt5T4GoOFXeRfWINJs
	oh6k6d2bN2p3YrpN+jjZaO5sPw8ZngZa+bVUX5GCinXoVuFuoDXMkhpt95raR028TBxn58kTir0NL
	Ngc+niyischql78tXNgmBiKVbmrFeeeKkC5biwbmoCpIXgMA7i3T3FLmioP4TSdOFnIrHwdM7k40f
	0uzHZTLprCxvBraCVXSbUk1Uz9pTp/fM9xak3MF8w1DklQ27LJEaOxGT6IlqDc0UqCPFj9iikMf0n
	EsBnWJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woerD-00000004wNX-0Bjb;
	Tue, 28 Jul 2026 10:16:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woerB-00000004wMv-2dXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EDBC4027E;
	Tue, 28 Jul 2026 10:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376451F00A3A;
	Tue, 28 Jul 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233776;
	bh=daMRxS0Kh2ADzZ81QAFwLgz+aTvbJ+pwPAdc3QnTWcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fkH3YMcMn01l47wwaEb8VD+GAjV+dJyhGyQNvwBvPAjHeNlrNSfyBNREXcgCR+Byi
	 CqjbjkTpXMVJQfL+FG75ilrQLjZRbjWztjlpQ8uDmcKPkaXaQ10lCnQ6NoIS3O/VHZ
	 7vObQ5/SbTGlecuqInz9vM+DrYy4VGejABU+KvZJWpufN72jsPy/hZeoU4u25NM8xq
	 nC4UKnNi1e6mpy2r8/X3+hInjvydsZDP0gY2Hl2OqDiBfvDS1kxP9Wcs558nARf9xO
	 unUFh2X5huq9oth1yBKLho9irUqBPhL8FAOcVYI0l6FflOr6LA9medmpBr3uw/28uB
	 0celxi54LVx+Q==
Date: Tue, 28 Jul 2026 11:16:10 +0100
From: Will Deacon <will@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <amiBagGKn-Aym1DK@willie-the-truck>
References: <20260706084708.8072-1-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706084708.8072-1-kas@kernel.org>
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

On Mon, Jul 06, 2026 at 09:47:08AM +0100, Kiryl Shutsemau (Meta) wrote:
> All SMMU queues are sized from the maxima the hardware advertises in IDR1,
> which can be several megabytes each, and are allocated at probe. The kdump
> kernel already disables the event and PRI queues (arm_smmu_device_reset()
> drops CR0_EVTQEN/CR0_PRIQEN) but still allocates them at full size. On
> systems with many SMMUv3 instances that cost is paid per instance and adds
> up to tens of megabytes of coherent DMA in the capture kernel.
> 
> A kdump capture kernel runs from a small crashkernel reservation and only
> has to drive the few devices used to save the dump, so deep queues serve
> no purpose. The queues are not on the DMA data path, so dump throughput is
> unaffected; a shallower command queue only bounds how many commands may be
> in flight before a sync, which does not matter for the capture kernel's
> small device count and modest I/O.
> 
> Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> in one place. The command queue still holds at least one batch plus a sync
> (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> command batching keeps working.

Wouldn't we be better of not allocating unused queues in the first place?
That's what this patch does:

https://lore.kernel.org/r/0b035c53cb401acde8244b805d4b6a0312b83708.1782799827.git.nicolinc@nvidia.com

so help reviewing that series would be much appreciated!

If you want to reduce the cmdq size, I'd prefer a cmdline option rather
than special-casing kdump (as I've had other folks ask about configuring
the cmdq size for other reasons).

Will

