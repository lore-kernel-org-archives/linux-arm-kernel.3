Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F98CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQzTpwGNxlScPCJdTKiCCBFLrO6pY3UKXdBYvlp9W6I=; b=OJoKDBr4F2RbvVgOWc0lystYZg
	2uk9vqVI85E0kFpiZCujXkT/4n4S3pYE9OgZrjEz9pOYs37kRmMkIUAqE1Ec3RBhcvb5m8VliyF1R
	tilj8TKGl4USvz2/a2vc8AxOtS167+k30UBr+8psTybR7hRJAIV66evzLHViEvXnctMrWgdz53JrR
	HevC9GRj8LLXqUURdbbaoxqPWwcV6E+huyZTuNTFsyxaKFdm52zAdpX/ubEPUOOEBKj4nG78t/e2w
	NqbrgYo1Hy5of5hfhdqJXMQnxLcufi6QlGHxdSHv/KKk8MYczJ3xKaWQ51Eg/U8XS3Ig4HeFOD8Iq
	0EJgs4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0Q-0000000A3r0-2G1X;
	Mon, 03 Nov 2025 14:58:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0N-0000000A3qZ-3wYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2650643317;
	Mon,  3 Nov 2025 14:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E2FC19421;
	Mon,  3 Nov 2025 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181879;
	bh=AbV0ABvCZd1kvghexyj1yJEoaSmQNI8stxZWlAytKKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdjF7tLZpSe+2/T4d1NisM5e2ZE1KdSWDaXa9YA3UpeH8OxQkQzgAR2RBaenDcAEu
	 Z4zl2kTgbi/a6jXjsb6+JEs89mVupNXbE5nqPPoHbDooMlHnAejkD7+MhgbitbRS0i
	 0r7ZoIrDgMV4vCnssq8b0VuhsHlsJZT7yS6y/RDn7KU8KzFngWu98hdaVB6VV7zA0p
	 zna0bygb9nDkibXNYN21mJV4IGHiIUNEkNp+2Q0NTrXecFRv4KJYtc7h1HT6/pmCQ8
	 iEQupk+t2Uw1zZY1gAZnvPlTXnsi3ZZXvoHlZW/2P0aOipfo2QI+gHGoP2L+ra1Vd5
	 PaB2R5YUigbsw==
From: Will Deacon <will@kernel.org>
To: suzuki.poulose@arm.com,
	robin.murphy@arm.com,
	ilkka@os.amperecomputing.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mark.rutland@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	sdonthineni@nvidia.com
Subject: Re: [PATCH v3 0/5] perf/arm_cspmu: Preparatory patches for NVIDIA T410 PMU
Date: Mon,  3 Nov 2025 14:57:46 +0000
Message-Id: <176217690916.2889046.15109510463947392648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_065759_994993_D47FE1C5 
X-CRM114-Status: UNSURE (   9.52  )
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

On Tue, 30 Sep 2025 00:25:59 +0000, Besar Wicaksono wrote:
> This series contains initial patches before adding support for upcoming
> NVIDIA T410 PMUs.
> 
> Thanks,
> Besar
> 
> Changes from v2:
>  * Add Reviewed-by from Ilkka for patch #2, and #5
>  * Add Reviewed-by from Suzuki for patch #2
>  * Add stubbed implementation for arm_cspmu_acpi_dev_get
>    for !CONFIG_ACPI case
> Thanks to Ilkka, Suzuki, and Robin for the review comments.
> v2: https://lore.kernel.org/all/20250923001840.1586078-1-bwicaksono@nvidia.com/T/#t
> 
> [...]

Applied patches 2-5 to will (for-next/perf), thanks!

[2/5] perf/arm_cspmu: Add callback to reset filter config
      https://git.kernel.org/will/c/a2573bc7908d
[3/5] perf/arm_cspmu: Add pmpidr support
      https://git.kernel.org/will/c/04330be8dc7f
[4/5] perf/arm_cspmu: nvidia: Add revision id matching
      https://git.kernel.org/will/c/82dfd72bfb03
[5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
      https://git.kernel.org/will/c/decc3684c241

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

