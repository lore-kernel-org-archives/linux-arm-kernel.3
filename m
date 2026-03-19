Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A5109022A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc57bAx/OMYriZ60V075MuCv4Nl98Wd+cc5Pu9gHxyY=; b=IGmI0aHXuRvdQZk8FdRk4iSJAD
	15crVI6vSyM25V1HtVIr8awZB/b+/gSjIpubWZ42P1kVKs0C4jbus7qU+locJ4SgU1bBssnURTXbR
	d0UDiPCtdKEgkcOgXfnQgVpmA78TRafN8nvc1ILU1gssQ5v/XYbujXT8Cls9LxntMauS7VuR8HiEu
	9Qifb+YlZgRyHwRq/X0bsGS+Jo7HAduP1K/0XPVjPoWqB0TIqcMn3jRn7m5iB0fEdke1xqwnKp+u6
	rgNcaBZ50L9sfjmWJZciC0AE/glbhvYhLRPfXy3frGMaq2akZUOORoUPreW8076zEAADhpgTHYVhj
	NF6RpPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Djc-0000000Ai8R-3GgP;
	Thu, 19 Mar 2026 13:48:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DjZ-0000000Ai84-0M5S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4397D60053;
	Thu, 19 Mar 2026 13:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57E3C19424;
	Thu, 19 Mar 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928100;
	bh=FWs25TnUk+rL6JvNG2vl/ePh9BoVTknU8f+WnpPg5RM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgfTbnRFCHhH/IEfxSlF6WcQ1WAKrye9EY07L0+jQ94J87j332Xwz2HN4NIPeznh5
	 ndFpy5qJC8sIb0IWUMjOmeYX+ZkjgLG28KciZ0jYf6nseYEaQqjZfpwJA3jXH4KDUc
	 y/DAxJXT2fEwZy1R6TMAW2V/4W+lfuy+82yJsnL127bHD7ntGGI+xSuizM6n5a+Tyc
	 eE8y1FoBxHmvEsRpDuAm+gFj6oKJPD/twzhKmWDJt/US780k9L7VF4SjLilW0ereu1
	 RL4TSA4u9wydnlHyMWTm0SRoLAKdt70wdimN6A1g8zKS7Tnt3iI1To8Bjkwyv4DXN1
	 4Fw1yRjxu0wqg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	aneesh.kumar@kernel.org,
	steven.price@arm.com
Subject: Re: [PATCH] arm64: realm: Fix PTE_NS_SHARED for 52bit PA support
Date: Thu, 19 Mar 2026 13:48:11 +0000
Message-ID: <177392436633.2391768.4152570356691578955.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316161901.2410354-1-suzuki.poulose@arm.com>
References: <20260316161901.2410354-1-suzuki.poulose@arm.com>
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

On Mon, 16 Mar 2026 16:19:01 +0000, Suzuki K Poulose wrote:
> With LPA/LPA2, the top bits of the PFN (Bits[51:48]) end up in the lower bits
> of the PTE. So, simply creating a mask of the "top IPA bit" doesn't work well
> for these configurations to set the "top" bit at the output of Stage1
> translation.
> 
> Fix this by using the __phys_to_pte_val() to do the right thing for all
> configurations.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: realm: Fix PTE_NS_SHARED for 52bit PA support
      https://git.kernel.org/arm64/c/8c6e9b60f5c7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

