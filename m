Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C80CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJXDwlYRBGiQauYvcS/uQg8N6b5KdvjxW0OG+TvEDNA=; b=0h3mSbFfWJFmm9YRlDIw9lCT2k
	3VDS4yLGQp+vWdnL2Np7+lCVUugM/TYtqPGvz+G8vl4nppRnRfx33A1fTPD92+0e7z6fFgk2wHvwy
	1a02UBKmFWqf5JUxpPWcq531SAZaq6tFNQCqhduwAlj833zvuYNKGAn9CqZ1EAvRsJOEblOatD300
	Zho0M7EwnsTo8i7Grc8zEEgMtER6deuGzExvG2UnRo63jgm4oj45quez7RPa3HBVs4UEVfecXPQxf
	jXJvpxv2NoBU9AbBVGP9vo3fXUPjztVynuTfROy7OyxFLFxSaYuNwohxXy6d0w/4OmhvLtbAcEjrJ
	wx8VQxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHpO-00000007cnk-1bb8;
	Wed, 10 Jun 2026 12:14:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHpL-00000007cmy-2fbr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:14:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CA266001D;
	Wed, 10 Jun 2026 12:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D761F00893;
	Wed, 10 Jun 2026 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093674;
	bh=eJXDwlYRBGiQauYvcS/uQg8N6b5KdvjxW0OG+TvEDNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nyy5nAebPLlB9fvkqgGoe62Li7gXnOplK/IvuacbIqI3FfXAYwj/wIuRgD00dNH8E
	 BU8KukPyd3tLHQyflqJkm/COgTosBE7xr2RrxwfJqe0RPR8Rw3c97bkUA2KM4iqQhF
	 7gts8EiDEJutNN+ZGgfkUnTwUvlJcdVTutxNqUgE+YquPWplsS9SViYhBOMkakV8OS
	 BC/A6g7pWqo+oHJn0tPhPxcGaiwU5JHf5kdn7u+XbLpTFoSenj0XAgKYR94cB2UgA8
	 4q1H4JXpO+LUt2USfCklvB69gFc88BhBC6oOk7SScemty8sx1dkC33y2AljbsXUFb7
	 0QFCZXsNEv9eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
Date: Wed, 10 Jun 2026 13:14:25 +0100
Message-ID: <178108882631.788926.2947350412570700520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609234044.3945938-1-sdonthineni@nvidia.com>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
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

On Tue, 09 Jun 2026 18:40:44 -0500, Shanker Donthineni wrote:
> NVIDIA Olympus cores are affected by the TLBI completion issue tracked as
> CVE-2025-10263. The existing ARM64_ERRATUM_4118414 handling already uses
> ARM64_WORKAROUND_REPEAT_TLBI to issue an additional broadcast TLBI;DSB
> sequence and ensure affected memory write effects are globally observed.
> 
> Add MIDR_NVIDIA_OLYMPUS to the repeat-TLBI match list so the same
> mitigation is enabled on affected Olympus systems. Also document the
> NVIDIA Olympus erratum in the arm64 silicon errata table and list it in
> the Kconfig help text.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
      https://git.kernel.org/arm64/c/ec7216f92e4e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

