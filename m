Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F634C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urXvgD92XvXUF9FSp2uKI6nxQAUurCeS9+ZH/UqV2ss=; b=geLUtHa6W/+ySJAh+bYkcDod/Z
	JW6INuLKIN0abxpCPVesiTEntfE9L7p/8idBXflW/KNaOGluPF5LPujlW5IAMKqr5Z4HiGQHSfeFI
	xBQ3y7PaR9scAq14+wW9fGHCo9uATZ8+m7QoFwbGymv0w0KfQZvYNBXZWJ6FWRwybxde/qtF2SYGf
	GnRJoJI7TfmiiKoCd7tVYyUBEg8lUcTwQsSXDSg+suSWQH6ae8rAdmf6ejmsNFm9XcRDsO6aKk2C4
	EjzaC3w5C9vMUiMYakmdZ9C+iOZZiBvqyElGHX6zukR8sVEouKQz6UzhuTFqmK7VnpEu0GzknK1rN
	IZsln9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAg-00000006NeQ-1V8D;
	Tue, 08 Jul 2025 19:40:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCev-00000006Bva-21nu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DC0543C4C;
	Tue,  8 Jul 2025 18:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53A8C4CEED;
	Tue,  8 Jul 2025 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751997792;
	bh=VoEolaFTJNzpKG4M2/ParplG0VvzAYfss/xgoyqHWa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnX7/fT629zWKB7jluJEr8dLn9RwRvK1aJHFo/IkmlA6aVqpfizgL7O6bZywJyLMi
	 9SykPdXaIGfB3CgTkDfn8za3yqKwowCGsz1fk6gol3kSRiC/ZLx4bL1kxFNtTVxyXn
	 /7c7WCEid61YOWxnhpeqjGbKIFPGs/TT5KxoIKFY6/nJrVoEou/21YnVK1B99IYufi
	 bjfseF6L/4FDvKB/tnj+4WfGgFVO4qOWzWO1iKG6hDImJnOAUm1qSnrk47UwDPS+C0
	 +5cRPunQW9Etyk+dXooY5gwddqOJnpS4bUesJfTLtxtOwqhLYGIhRfiCmAobgJy1DM
	 A1D1HAIe88iPg==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v23 0/4] arm64/perf: Enable branch stack sampling
Date: Tue,  8 Jul 2025 19:02:59 +0100
Message-Id: <175198748936.383518.12260470313437607576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
References: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_110313_541750_9D463868 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, 11 Jun 2025 13:01:10 -0500, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and later versions have
> been reworked quite a bit by Mark and myself. The bulk of those changes
> are in patch 5.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/4] arm64/sysreg: Add BRBE registers and fields
      https://git.kernel.org/will/c/52e4a56ab8b8
[2/4] arm64: Handle BRBE booting requirements
      https://git.kernel.org/will/c/ae344bcb0d49
[3/4] KVM: arm64: nvhe: Disable branch generation in nVHE guests
      https://git.kernel.org/will/c/d7567e9b9ba5
[4/4] perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
      https://git.kernel.org/will/c/58074a0fce66

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

