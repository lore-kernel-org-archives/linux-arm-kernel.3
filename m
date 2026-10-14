Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F829CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHoBX+HBEhfbn9ZXmO9lXMwpig75FIoeeD7oVOtutU0=; b=3JS2JYvqbxgRGpfGev3j/E+phq
	5G+Q/rz3eWHFXaWnlCorjLxLI5eUYRYVf6sBCYOXQLPcToKFzX4vAbqhUfG1xVn90aWwd/6qbeEdp
	nRGrXaY5FIk3TbDfiqyTMq+ZQWHPn5Q3baR25lso0ZJ6ombOWtrDbiHDUEQQPCQe6eBxZewabc+ZL
	neRua9GOSrNIjkgH8117aysz1Qn9moA1THEN8iWWy5oJer1cO2h+vGv57/++hwQJByEcQZZyI3wmX
	5FfRObnNxffTcDSGkrHpsoHvdsJQDhQ9CnTfHJIte8bKLBVDOe0MfuMUhnhXu15WD57YkOehx4ROc
	zonOBPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2rv-0000000G5ML-264O;
	Wed, 14 Oct 2026 17:34:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2rt-0000000G5Lc-32hg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:34:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5F914BF;
	Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D85993F7B4;
	Wed, 14 Oct 2026 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791999260; bh=DIazYOznxkvMQfk8MPg8hYekx/1bKJszrWi9fi0un7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcC6aZc+pLZLMc8Y2jvkWWDjqs+zPuhkdYidj89BVesRheQhseYiYw9GUHke29Y1u
	 2pk8EArvyX4RFNe5wFv6QVk2DpA/T0wdwCdQ2nrpjE5wxm0V9V0a6H6txpUJqgG09p
	 OM/DW9lIYgAkS/9gnGs2FWxvbFxD0Wnv9GV2rzi0=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: sysreg: Bring field definitions in line with the spec
Date: Wed, 14 Oct 2026 18:34:13 +0100
Message-ID: <179199925311.3163994.15808107527690275071.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013130247.4135515-1-fuad.tabba@linux.dev>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_103421_810423_A9A69A65 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, 13 Oct 2026 14:02:43 +0100, Fuad Tabba wrote:
> Fixes to definitions in the sysreg file that don't match the current
> spec: three wrong enum values, two misspelt field names, and fields the
> architecture has dropped, including leftovers from FEAT_TME. The last
> patch also removes the BRBE driver's check on two more such
> fields (BRBINFx_EL1.T and LASTFAILED), the only functional change in
> the series.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

[1/4] arm64: sysreg: Fix three incorrect enum values
      https://git.kernel.org/arm64/c/af0010f29610
[2/4] arm64: sysreg: Fix the names of two misspelt fields
      https://git.kernel.org/arm64/c/5fee8b920a06
[3/4] arm64: sysreg: Mark fields the architecture dropped as RES0
      https://git.kernel.org/arm64/c/cbaca3920f64
[4/4] perf: arm_brbe: Remove the check for TME transaction states
      https://git.kernel.org/arm64/c/4a90fba44e3b

