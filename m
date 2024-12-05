Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9880E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73SZW2MQjFqdAN1Sdd8XLZhaUnreQcWGlY82lHCm058=; b=4L3gxh0bQkfXEztEbsuxWnjRkd
	f7vnAIy1VVwLW/yht5SUs92fT2LPL4MJCukJJ0oBrzCoKuZlLnZ/ZfeHDnGjSpgc2ic1KV87GCnO/
	I7fJbpFqJR31kA2DO5EkaFTnXfsJbdE44svjjLjijd2cftAiQcgyIRB2qu2iQEEwhlkzAtP8LITdf
	+kTboSaUwwpMAeOCVAlMi0Br7KKGeFsseo8KFoIXBt5S5UJaa5rHBmdPjZV8fRqaYiU667hkQHT6q
	Pg7N0UvGdmDvUMiYxmECwJmqkFrrOej1IkhwTeWJE0BXEpyECGrvMjOrFBHcZal4Q7yqD9UxMnlCV
	OXKc2+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGYs-0000000H6xw-00A4;
	Thu, 05 Dec 2024 18:26:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGVp-0000000H6ZW-2N9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44EFC5C54BC;
	Thu,  5 Dec 2024 18:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3866C4CEDC;
	Thu,  5 Dec 2024 18:23:38 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org,
	jean-philippe@linaro.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ryan.roberts@arm.com,
	broonie@kernel.org
Subject: Re: (subset) [PATCH 1/2] iommu/arm-smmu-v3: Document SVA interaction with new pagetable features
Date: Thu,  5 Dec 2024 18:23:36 +0000
Message-Id: <173342292875.1735998.11342538299837592943.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102341_643489_5CA53D69 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, 05 Dec 2024 13:48:09 +0000, Robin Murphy wrote:
> Process pagetables may now be using new permission-indirection-based
> features which an SMMU may not understand when given such a table for
> SVA. Although SMMUv3.4 does add its own S1PIE feature, realistically
> we're still going to have to cope with feature mismatches between CPUs
> and SMMUs, so let's start simple and essentially just document the
> expectations for what falls out as-is. Although it seems unlikely for
> SVA applications to also depend on memory-hardening features, or
> vice-versa, the relative lifecycles make it tricky to enforce mutual
> exclusivity. Thankfully our PIE index allocation makes it relatively
> benign for an SMMU to keep interpreting them as direct permissions, the
> only real implication is that an SVA application cannot harden itself
> against its own devices with these features. Thus, inform the user about
> that just in case they have other expectations.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
      https://git.kernel.org/arm64/c/f00b53f1614f

-- 
Catalin


