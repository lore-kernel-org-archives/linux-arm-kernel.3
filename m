Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YEbbt6KWVAKQTOZms52qg6kaPc5u/eEQc+FHs8hqsY=; b=LhQguOBKhFMK1YlRFKntKl4WFQ
	zC2emyWiP+DMXcs1L7O3cp01kKDMX7el4SL+QhN44rhgAQu5yZ31GzkyueH9MgycIFwIUA6E4khKA
	EPMxUO0+ACkzMU9y0fZN66J6y3LKPTOR+HyMrdITCGAfH0wMwA1Bw/9OHt7jCHFEr+luPwL8qahKh
	su4gG0Hlg5P/OLdi0/v8H5btsnaY+1noQDFbxCu1CLVKuJakiCGya80eYxPQ72vKjSUChLlviOEPj
	r1uU/iwmrkYIYPmv8a3ochv382vsSKLgdB5J03Fs46Jpds8T7tm6p+aUbW3usUae+rwTyx7aZpPnD
	5PqApGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtY-00000001AwG-20gg;
	Thu, 18 Sep 2025 21:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtW-00000001AuC-3AWc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31669601D4;
	Thu, 18 Sep 2025 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C50C4CEFA;
	Thu, 18 Sep 2025 21:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758229821;
	bh=mmPjYKb+Qj8tpMJDfrTGOA3tvv71+iK7ZDNstQo1RZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ovuu0LYr+kXH1+5LJdzcfJJbmgK/ntmna5r9MNgxX/+UOvIOCWbLQvcI/ulU6khgi
	 oS1HkS0UMk+U42xCvZh6HDy2n3uwxsk5Y1Ilmiiq9jpAXTF4gQq+MiWSS7P929F2OL
	 IHyeE8z9+FDZxQ1nTwoixfcYrYbXaRGjxormbqj9wAAoFx4MUFKDhCGJr5H2KwiA9P
	 sdkm+y/6LgXwfELp7Cqoa//UrQ51u4NQ0fSzh2pCWq5Wb+GELw4bTIuEnvB+avbldQ
	 cckC3IpHaLMGifHsUNr0yVCfszGqsnZ/MdyeOn+2Yn54Jp4HtyfiDZg4mx41kZvCkT
	 T+8oZnDMWHnSg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH 0/2] Enable FEAT_BBM (Level 2) for Olympus core
Date: Thu, 18 Sep 2025 22:10:07 +0100
Message-Id: <175822329813.3545519.16720487758177130012.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250918132548.1141306-1-sdonthineni@nvidia.com>
References: <20250918132548.1141306-1-sdonthineni@nvidia.com>
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

On Thu, 18 Sep 2025 08:25:46 -0500, Shanker Donthineni wrote:
> The NVIDIA Olympus cpu supports BBML2 without conflict aborts.
> Enable ARM64_HAS_BBML2_NOABORT by adding its MIDR to the allow list.
> 
> Shanker Donthineni (2):
>   arm64: cputype: Add NVIDIA Olympus definitions
>   arm64: cpufeature: Add Olympus MIDR to BBML2 allow list
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

(note that I dropped the tools/ part from the first patch)

[1/2] arm64: cputype: Add NVIDIA Olympus definitions
      https://git.kernel.org/arm64/c/e185c8a0d842
[2/2] arm64: cpufeature: Add Olympus MIDR to BBML2 allow list
      https://git.kernel.org/arm64/c/cc80537caaa7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

