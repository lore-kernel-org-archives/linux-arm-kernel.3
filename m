Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C69CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP2fMzrU0K8D7zvaOGjEP0wUd36Gy0Q43v1N1nD45Hk=; b=V20Ujvg/DDxWm0n9Qkaju/PpQT
	VdAdthxRIX9EKRF1joYl1weHOqtB6SF7RGoSVvTnBYjWhUBh51N0gFdQt3r0IZP3SoenbLaY5Hx6T
	TC6mPnbU2mVwMqojphzHP+wYKBJNHrki7rjQF4MJgW42uE6O4k/lFG7r/bqYzAQG2qA3zrmGNm957
	GedJZOX0qIvlE7BK0BgC27SPGtoGPiUyZGcWthR0AOWu9gHR28YmrFBbiKxl2Iw+QjcxSTQ476Lrc
	fy1FSECiDmzm08HU+KTaZ4NAxV4CqAf5BMIo8C/06flV6x8lU0Kf0OK9Ctx3TOFK/ppaZ30WinQ5v
	Z655nFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQT-0000000F2rv-0Agb;
	Sun, 04 Oct 2026 16:51:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQS-0000000F2rc-0NbR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 16:51:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26615602C4;
	Sun,  4 Oct 2026 16:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3CC1F00893;
	Sun,  4 Oct 2026 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132658;
	bh=LP2fMzrU0K8D7zvaOGjEP0wUd36Gy0Q43v1N1nD45Hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=haSH8Acg1QJNOZMgF+ewqo0gnPt34E2RXBCcsBvNhEw9QH7PFmJA9Ea0GPo7PZZGg
	 PH5konCHCpj6esW6lh/gaEDccb+/zsISKmrH6I2Z8GVRdcSXCqE/rummn87cHwRZbu
	 F9Bryn5C2povyRiuKjqqSle2fc0+9EBHqWPGSeS+eZwiRlcg/kYkWcUdlC4YiRW5Y0
	 mLrWJ/yg7XAFFYNaeZzD7Mdjh8Cb1kvLudpD71Cj4qjZ0kbwaoNX8TCnpmnuyC9m2B
	 znaheuZy8If/AkTOjQ88hWvyBNJvVv435bZMcggB3/VKeq5H/1MIjxr2RK4JhMAmcA
	 mZBFkqX00Z9bg==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	bhelgaas@google.com,
	praan@google.com,
	kevin.tian@intel.com,
	kees@kernel.org,
	smostafa@google.com,
	baolu.lu@linux.intel.com,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	skaestle@nvidia.com,
	mmarrid@nvidia.com,
	skolothumtho@nvidia.com,
	bbiber@nvidia.com,
	harsha.v@oss.qualcomm.com
Subject: Re: [PATCH v5 00/15] iommu/arm-smmu-v3: Add PRI support
Date: Sun,  4 Oct 2026 17:50:42 +0100
Message-ID: <179112969067.2365011.2400275632382171863.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
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

On Tue, 15 Sep 2026 09:38:12 -0700, Nicolin Chen wrote:
> The SMMUv3 driver doesn't handle events on the PRI queue or respond to IOPF
> faults. This series adds the missing pieces, using the IOPF infrastructure,
> to convert PRI page requests into iopf_faults and issue CMDQ_OP_PRI_RESP.
> 
> The iopf_queue_flush_dev() contract requires the driver to first drain the
> hardware PRI queue and synchronize using a threaded IRQ handler before the
> IOPF software flush. This drove the additional commits compared to v1:
>  - arm_smmu_wait_for_queue_drained() drains the hardware queue by counting
>    the entries that the threaded IRQ handler consumes
>  - arm_smmu_attach_release() moves the teardown outside the global lock
>  - synchronize_irq() closes the gap before the final flush
> 
> [...]

Applied first three to iommu (arm/smmu/updates), thanks!

[01/15] iommu/arm-smmu-v3: Disable the impl before disabling the SMMU on shutdown
        https://git.kernel.org/iommu/c/ab0dbf411ace
[02/15] iommu/arm-smmu-v3: Add arm_smmu_attach_release()
        https://git.kernel.org/iommu/c/580bbfcdcd2e
[03/15] iommu/arm-smmu-v3: Add Q_POS() macro
        https://git.kernel.org/iommu/c/02b5c4639bcd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

