Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F2FCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfEw+vmZQa7y2I57+xbALyP2uxbf7nEAnGZOJevuxd0=; b=bGrxCiMS0qICc5YQQ/fA5tqteg
	qsg7VZYO643gztPNBKm9y2OYt4DTu5pUmBjAYsDHlbW2maSMnz/X1dHKxZHil9AiZwnTtS7gFh/e6
	KlMp1OTTseqLP5MOD39513zDqCNxF6Fr636XuAFCQQt2CJ7Q8BaAz1zQFsshCTjzMISunrsInLeC6
	Wss7ubd+voHnSDYjoMy6fsMEQwIFJm682FYaT3VFFWiLpk5HkyKhCmldrdFzYLSt6caMKNJ2obgHN
	oJMM5sjY0hbJR0aVSFLphYgcZbii4HnmQkLEn1w7RpXvhd7M+yoOpYIoxHkcX3xkwzW01/2BdXGmQ
	VMcuAAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPi-0000000C4e4-0Klp;
	Fri, 02 Oct 2026 16:47:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPg-0000000C4cr-1lyJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D30936022E;
	Fri,  2 Oct 2026 16:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23081F0089A;
	Fri,  2 Oct 2026 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959631;
	bh=lfEw+vmZQa7y2I57+xbALyP2uxbf7nEAnGZOJevuxd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J+o/QENJmct9gAt9stt6eV9AJtscL/saju25nYWe+J6/8xNQFyOU4F4v22WSfwxwU
	 uELUeJm2xPwbXyteSnbprTpYMJmhZ6CFmewpIErhB2cct08CLg5CdMYrF7b5NfigtI
	 gxYgFq2iL7W9WPi5w5pgaXpGzO4S2uF5wHe48gYkyq3f+mJpvxbeb0boacmKrUnrMr
	 rHLLvfj0IR73iZkgbswR6XPyzISDgnlJl3S6oNW3CQYUQHGqdUzXEUza2CXSi8iOsv
	 OE1CZa8vG8aG+W9eFx3N9xPqINrgs9/ioSah1diNhiUEgN8ZxktqBUKPzxQaauFPs2
	 FR1yfGeiS1nwQ==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	praan@google.com
Subject: Re: [PATCH v2 0/5] iommu/arm-smmu-v3: Fixes reported by Sashiko
Date: Fri,  2 Oct 2026 17:46:41 +0100
Message-ID: <179095609026.2120495.10251338517190758348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
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

On Thu, 24 Sep 2026 08:56:11 +0000, Mostafa Saleh wrote:
> While running sashiko locally on the pKVM SMMUv3 driver patches, it
> reported some pre-existing issues in the SMMUv3 driver (the RB tree
> corruption and a missing NULL check) and given that this is not the
> first time a pre-existing issue appears in the driver from sashiko,
> I went ahead and passed the whole driver to Sashiko which reported a
> dozen of other issues(except the last one in this series), I included
> fixes for bugs I believe are true or worth fixing (others were mostly
> missing NULL checks or bizarre HW/FW configs I don't think are needed).
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/5] iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
      https://git.kernel.org/iommu/c/84366fb547ed
[2/5] iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
      https://git.kernel.org/iommu/c/ce58940ccc3d
[3/5] iommu/arm-smmu-v3-test: Add missing error checks for inv array
      https://git.kernel.org/iommu/c/388986bfc540
[4/5] iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
      https://git.kernel.org/iommu/c/8105675f3374
[5/5] iommu/arm-smmu-v3-test: Fix UBSAN error
      https://git.kernel.org/iommu/c/b370a5e979f8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

