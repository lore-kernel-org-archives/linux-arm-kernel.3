Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D086AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VzXGEtZX2uZQUMocdUvqc485agqWmfFcfxW3ezC7Hg=; b=uOyIpNJcH3JzPEd2rMXP5cFRoR
	1G77xx72W42RUhXwieCEMzzMof2Id9RS8IVyjUNLv+I3AS6mevzhtLZxDluo6h3oloUQYyOztR8Vv
	o5T4ihp3wC+wCVyKBdZPXWQgmNEABIlXBVcNG7CbU8V/AbLgeVfzjAPzdxSPZgPI1VN0tfQYsbTgu
	0gdJ2AG35sZJeYEWZr50BaWK+Vz1f9brPaQDXeT9kq73XiMcnHchXcWjuFHpJhR034U1eOhC2RuZM
	FrbgdcSpxhUG9ABtzZK2c6I/9gx9eYmHauCC43PCzeHsgOWQKH5FBgDZ4ZvEZFk8vvyXRVsW5Vzr4
	wxjkglmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjj7-00000008XWe-0eMm;
	Thu, 27 Feb 2025 19:39:21 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngOB-0000000806j-1ZJ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F17761548;
	Thu, 27 Feb 2025 16:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411EDC4CEDD;
	Thu, 27 Feb 2025 16:05:28 +0000 (UTC)
Date: Thu, 27 Feb 2025 16:05:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-kernel@vger.kernel.org, will@kernel.org, maz@kernel.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, gshan@redhat.com,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 3/3] arm64: realm: Use aliased addresses for device
 DMA to shared buffers
Message-ID: <Z8CNRqJ6dJAG0Daa@arm.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <20250227144150.1667735-4-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227144150.1667735-4-suzuki.poulose@arm.com>
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

On Thu, Feb 27, 2025 at 02:41:50PM +0000, Suzuki K Poulose wrote:
> When a device performs DMA to a shared buffer using physical addresses,
> (without Stage1 translation), the device must use the "{I}PA address" with the
> top bit set in Realm. This is to make sure that a trusted device will be able
> to write to shared buffers as well as the protected buffers. Thus, a Realm must
> always program the full address including the "protection" bit, like AMD SME
> encryption bits.
> 
> Enable this by providing arm64 specific dma_addr_{encrypted, canonical}
> helpers for Realms. Please note that the VMM needs to similarly make sure that
> the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
> unprotected alias.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

In case this goes in via the DMA API tree:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

(we could bikeshed on the names like unencrypted vs decrypted but I'm
not fussed about)

