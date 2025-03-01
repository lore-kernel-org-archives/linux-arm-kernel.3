Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71059C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 07:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMyfAQMi7XN58LfB1Yr9WXjsnjFEiBkWPwHeF12IGj0=; b=ELgAnb+NITbWyWNxlwO2ZuK0Op
	bAHyg/xH2FspOFvpz60OnECRJuceuJ0ABwOfAx+cmfWwoew94GsuTNAbcSONYet9oiBP58ekLtuN0
	fmtX5PaudR6hB1TftL64djMF0/Uum8fqRn0mZi5Vjw7ed4NmphV//RCHmwX5IXvXLAz/Iz2XLBMhI
	7w0LefzS0XlaZGj0px7UWJgw1hLjMjjo8rSRHmgqEv8+OQbYIw98ZMShxqABSuwEsyvWq5wzf184v
	0pHQ0FXyA+4S1g9yabcGpXUWRk9sgZ7bvkLcmj75tvycbs+//3qJTSkuGExUepe6tlxQm4xdCpl89
	hLd75ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGy1-0000000DY2F-16cG;
	Sat, 01 Mar 2025 07:08:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGuk-0000000DXOJ-3NHz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 07:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E0225C3F39;
	Sat,  1 Mar 2025 07:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F14C4CEDD;
	Sat,  1 Mar 2025 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740812732;
	bh=yuV32O2uacAQPpFXxHdzerV8Z0lORjwgQUBONgdPDh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vl0VyKZWz3vG3O12uSfoyp3OypG0rM+HcoZ7wkh5vZUgctgR/LBcFWq75Fyjt+wXL
	 b+gNN5AWEZi0xN9VEpKICCwUPda0JkzOGFisFMDupjrCV/7n6dDbKyEQ3q43aJiLiO
	 v4j6yJTq2OfVQEH/0bEt7+9O7anvmoUEcUnld4+/BT3yn7u3s/j4eBeh+DGSNP9uiC
	 W/9OF3DJSngzizuIHc73DvTCsxJOO00TKBi6BJ+IJbqbqwmUQUpPwbdhPURghXbNsP
	 5BJmoe+UD+A6LkXDt2hyPwuzYEvZokhESPx1kOiuu/Dw/BN4sY7Yk1UKXMyvOYUGJv
	 GqbMRFqu0X2Bw==
From: Will Deacon <will@kernel.org>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunhui Cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 0/2] Fix dwc_pcie pmu driver issues
Date: Sat,  1 Mar 2025 07:05:23 +0000
Message-Id: <174080955779.3218826.2678564312238293449.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250220121716.50324-1-cuiyunhui@bytedance.com>
References: <20250220121716.50324-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_230534_885868_66E0F969 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Thu, 20 Feb 2025 20:17:14 +0800, Yunhui Cui wrote:
> v1:
> Only sent the patch titled "fix duplicate pci_dev devices".
> 
> v2:
> 1. New patch: "fix the incorrect reference count".
> 2. The "fix duplicate pci_dev devices" change is made in two places:
> One is to remove the modification of the PMU name. The other is to change
> "for_each_pci_dev" to "pci_get_domain_bus_and_slot".
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] perf/dwc_pcie: fix some unreleased resources
      https://git.kernel.org/will/c/6eb1e8ef586a
[2/2] perf/dwc_pcie: fix duplicate pci_dev devices
      https://git.kernel.org/will/c/7f35b429802a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

