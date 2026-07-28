Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16CEC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAXXo+PhSkrJo36ImVUjmOnQ0ftX4EsaB1ZksVpLTlo=; b=I8wTydQbG2Lz+dfk5EunrSBwPq
	PUEwxwOotTlp6IZSAQB+ti6tCSqyRfsxSL3IlMOe07uXCdiJW9LSm5CwqiG+Q1r9B420tPGZ5Zzbh
	zMQO291Cp3Bi5nKFXN6Xlqbz/AeW/kkvTi8fJ5FL07nnPEqTfTwonvgg4DMkrFzmYV7hw+Tivo95z
	P0fssvApaqpF0Dop+9wIaruV7OhqMOdWYjmksOuljHVFI+aHbDAVwkDz+dbDjeuMk3lrQaLd6/0Yj
	hfcoDiNmCkaJitRaJI/fVrpCv9RJ0/T6mHput2VQhVSKzIN+zzul+wkK9d+rReF/6LrVXJts81g0/
	WwoqZ3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofms-000000052t0-11Ct;
	Tue, 28 Jul 2026 11:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofmf-000000052pD-3DAO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 399CC60AB0;
	Tue, 28 Jul 2026 11:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07F71F00A3E;
	Tue, 28 Jul 2026 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237340;
	bh=QAXXo+PhSkrJo36ImVUjmOnQ0ftX4EsaB1ZksVpLTlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nArRvbYCKg21eEKy6vf51vA9HdrHSXuDmgoTk7yx8+TX1ExIRh5OWDqyGFi3MGgEt
	 bjKtlFYpWuv45xzQ1GKjPvF9yWo7VIMT/OqbhlEG+tNeySR6EafBvBMlJP+LxLOAw8
	 ox2xSeFn5t4fsTv7SdxFxnBumjLzeRpgtKxdql2bDW93hNq/YSTSuAD9Q483WntcMC
	 3Jo3mnhLTEYbEYg2fHZxRpicFVvHDMp+kzUolx4mQQDse7p2I31V/ALg+Sr6sF0A8P
	 Qsq0FyDSnEaeKg/yqE9CswG8LiW4TwOG5qHhma/jyjMbw4TlzfU+5EC97bldPGS1H+
	 YpllvocnQ+1nA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 00/11] iommu/tegra241-cmdqv: Fix error-interrupt races and VINTF lifecycle bugs
Date: Tue, 28 Jul 2026 12:15:26 +0100
Message-ID: <178523230947.340181.5626643238486784200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
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

On Tue, 14 Jul 2026 13:54:57 -0700, Nicolin Chen wrote:
> These fix a cluster of bugs reported by Sashiko during patch reviews. The
> patches are ordered roughly most-critical-first, so some later ones fix
> smaller pre-existing issues in the same functions that earlier patches
> touch.
> 
> Issues fixed:
>   - the error ISR racing VINTF (de)init and reading a NULL, freed, or not
>     yet fully initialized slot
>   - the probe fallback dereferencing an smmu freed by devm_krealloc()
>   - a guest vSID programmed without validating its width or the device's
>     Stream ID count
>   - VINTF0 leaked on an init-failure path
>   - error-map index/bounds handling and a VCMDQ base above the 48-bit limit
>   - the error ISR flooding the kernel log under repeated guest errors
> 
> [...]

Applied (apart from patch 10) to iommu (arm/smmu/updates), thanks!

[01/11] iommu/tegra241-cmdqv: Publish an LVCMDQ only after it is fully initialized
        https://git.kernel.org/iommu/c/cbc41aacd49e
[02/11] iommu/tegra241-cmdqv: Synchronize the error ISR against VINTF (de)init
        https://git.kernel.org/iommu/c/a491be376abd
[03/11] iommu/tegra241-cmdqv: Harden error-map index handling in the error ISR
        https://git.kernel.org/iommu/c/a2ee315db426
[04/11] iommu/tegra241-cmdqv: Don't run the error ISR before probe sets up vintfs
        https://git.kernel.org/iommu/c/5acd67ceb38d
[05/11] iommu/tegra241-cmdqv: Don't fall back to a freed smmu after devm_krealloc()
        https://git.kernel.org/iommu/c/d4d05f55e9da
[06/11] iommu/tegra241-cmdqv: Free the error IRQ before tearing down VINTFs
        https://git.kernel.org/iommu/c/61f0d437988e
[07/11] iommu/tegra241-cmdqv: Reject a vSID wider than the SID_MATCH field
        https://git.kernel.org/iommu/c/4379610c79bd
[08/11] iommu/tegra241-cmdqv: Require exactly one Stream ID for a vSID
        https://git.kernel.org/iommu/c/fb292bfc9be9
[09/11] iommu/tegra241-cmdqv: Fix VINTF0 leak on the init-failure path
        https://git.kernel.org/iommu/c/f40f31444773
[11/11] iommu/tegra241-cmdqv: Rate-limit the error ISR's log message
        https://git.kernel.org/iommu/c/a86c36163c97

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

