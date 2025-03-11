Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA332C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KguTSQIvgtBwAafIktgx7ipfSKenuYLrqb82Fbjymeo=; b=sqmcbgA/0PaBIv7K4sI1Zs1ehq
	VtpbxyO1+1tfmLOq9CwMpE/AYDIIM9i0YIvBKa/b1J8rSucL2c7EwZTADSfbsivU5VIb36kIr4TCD
	4EZoJcF2l0PaevEGCCf/s0rpZv/EQ7uKKOuU/bOyjZWF18M8vfQxoDUl9/y8fmEET7xsLNaTRBtsy
	aIIVlpbGV/+DjwjmS59BatIAc+7pWXIE8aKVyzvt760ct2kKgkOMm8F5FxbsMHY/+KNTKRCZo3II9
	JkuEz4Ii9/Ravjp3PE1CjJt8RM/6cx1eYRLXAjctdWYKCPWVK+PGpo3Onc7/WpB+AeCfFaXZJ3XNp
	L/nouRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3MG-00000006SBX-1rfh;
	Tue, 11 Mar 2025 17:25:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Cs-00000006QmQ-1J4D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A35215C6409;
	Tue, 11 Mar 2025 17:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05A2C4CEED;
	Tue, 11 Mar 2025 17:15:50 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>,
	maz@kernel.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	gshan@redhat.com,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 0/3] arm64: realm: Fix DMA address for devices
Date: Tue, 11 Mar 2025 17:15:48 +0000
Message-Id: <174171334191.3659388.13494602275110471880.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250227144150.1667735-1-suzuki.poulose@arm.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_101554_403584_06F6CF86 
X-CRM114-Status: UNSURE (   9.98  )
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

On Thu, 27 Feb 2025 14:41:47 +0000, Suzuki K Poulose wrote:
> Linux can be run as a Confidential Guest in Arm CCA from Linux v6.13. The address
> space (GPA or IPA) of a Realm VM is split into two halves, with private bottom
> half and shared top half. In Linux we treat the "top" bit of the IPA space as
> an attribute, to indicate whether it is shared or not (MSB == 1 implies shared).
> Stage2 (GPA to PA) translations used by the CPU accesses, cover the full IPA space,
> and are managed by RMM. The "top" bit as attribute is only a software construct.
> 
> [...]

Applied to arm64 (for-next/cca-dma-address), thanks!

[1/3] dma: Fix encryption bit clearing for dma_to_phys
      https://git.kernel.org/arm64/c/c380931712d1
[2/3] dma: Introduce generic dma_addr_*crypted helpers
      https://git.kernel.org/arm64/c/b66e2ee7b6c8
[3/3] arm64: realm: Use aliased addresses for device DMA to shared buffers
      https://git.kernel.org/arm64/c/7d953a062416

-- 
Catalin


