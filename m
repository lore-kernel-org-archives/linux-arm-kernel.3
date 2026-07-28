Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED7FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1UAkumH+1EWeKiYH4cUN+rYvQoUWuyKXbz54U/PDZw=; b=WyD7MZn2tMKXafYmrW1nBVFM/M
	yrNUezKFQyOpkHjD/eO2fCBUYK44JsBi+lAl4MJndLVhXm3P9dzmkbEHFza+j4IQjk6L2I49JeRUk
	Fttj8zL+pYFlb7uTwm26+dexgktW3CxhOVR1Ydz9DZFTPS/l0GBC+AKfE41zrIUI5PJ+xk8kJiKku
	/o3CAYZ6GFhq27MpVkMo14u1vnBWm8byf6KwLNSYz2W8A90Ni8w+my4Kf65zuOXlkcZUaYec35tVm
	nGjSItaBvpAnLHjBeuy4EicVCXg0mXPlxhjioXfFF1uRoGOCRbtYf1nYVGvpKxSQPXXxsHTD0u08s
	Cd1Kt+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofms-000000052sI-07kC;
	Tue, 28 Jul 2026 11:15:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofma-000000052o9-0egG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 939A04037B;
	Tue, 28 Jul 2026 11:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80911F00A3A;
	Tue, 28 Jul 2026 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237335;
	bh=v1UAkumH+1EWeKiYH4cUN+rYvQoUWuyKXbz54U/PDZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RTVV0RhHbnYNukT6I0Qj9A9B2O4mnKjEYZU44W0ZwfANvyMazmgbQAkltRWtdTETF
	 o4IuVxS51G3o/OhApT8JT9wZT/EmUG48xRiW2rwe++MOGp2OG9R7QiIOcDoiXsJCxy
	 +aH9bjpFxpH53MZ3WRdXvOaujugbKE8xsMFN/A59rFFaK1Uo25FNHkIC4iFCyecuIF
	 a/n256CvZAkLtUP9qCcxFCr6RAEATmSacbk5QKulpB4BQItDkh/IkjIK1KVylQZtbs
	 uCcUwzgvJMRB5fzuVM+XOJSgZoeZnniPogmLh8PYXSIuaerfr2Dr4fWBrsownqYI/a
	 dX4HLzDr1rjBA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	nicolinc@nvidia.com,
	jgg@ziepe.ca,
	Ashish Mhetre <amhetre@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 0/4] iommu/arm-smmu-v3: Tegra264 invalidation workaround
Date: Tue, 28 Jul 2026 12:15:24 +0100
Message-ID: <178523218770.339148.16144926256012413621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726081904.1408859-1-amhetre@nvidia.com>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
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

On Sun, 26 Jul 2026 08:19:00 +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice.
> The second issue must execute only after the first issue's CMD_SYNC
> has completed, giving the sequence:
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!
But please check the comments from Sashiko if you get a chance:

https://sashiko.dev/#/patchset/20260726081904.1408859-1-amhetre@nvidia.com

[1/4] iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
      https://git.kernel.org/iommu/c/097bf4a02f2d
[2/4] iommu/arm-smmu-v3: Add CFGI/TLBI-repeat workaround
      https://git.kernel.org/iommu/c/95ed2da20283
[3/4] iommu/arm-smmu-v3-iommufd: Report CFGI/TLBI-repeat erratum
      https://git.kernel.org/iommu/c/d501d66815ee
[4/4] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat workaround on Tegra264
      https://git.kernel.org/iommu/c/06b15ddcfbc0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

