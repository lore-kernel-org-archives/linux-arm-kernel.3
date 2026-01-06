Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C4DCEFD1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 23:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NavBkDa/CswpUXG/swg+w1Q05BZl8ljU8PNkFyAd/3Q=; b=asqjp1l8S58mfjSp/AiYIepewh
	ixjwY8siTXLTJJ6/BPVXhLfrfHe++Xqr5zpM03gg93VNnGR5s0DcwXKZKawO++vFY0D5qO4brFx96
	5yqRPiQyf6iTkTsmwy54B9bEHo95J62uFCu5aSXkHhE+QD3U5Pwa0Se52IXn2mbe+TKS/xsqPL0AW
	YjnucAE6L+96fergufJUXtpIr8DguAXhtV1Jar7fH2g7bsDMc0zTLoU6K8sGminazL0FJHJVSFG0s
	WzpZdfPGbNqpYN3Fby6TejH+pvrk10hVSt1fSy9+7IbaUoijKI0bgvXgQ4nHui/S/OwTvkemUnyi1
	WoHdPchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdGEl-0000000Dvq2-02bF;
	Tue, 06 Jan 2026 23:13:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdGEj-0000000Dvpi-14Fr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 23:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B5964079E;
	Tue,  6 Jan 2026 23:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B94C116C6;
	Tue,  6 Jan 2026 23:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767741190;
	bh=HyAPnTEGY1lFrvxzTIN72RXJrOV35G6AS3aI5GAo/60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAtRDS6ejQ6Gse9FCW6w26JcHDfzluf/B767GLKSjdnPfasYmdVuKgxZgrNaJkzUa
	 g5h5605L2T7BLcLwsrZCGVYqW9zygce9EsebLUMsZwo1wjPms4JAZtQe4uV730j7Ma
	 fi68ZH45sA7DqXWIv8dfUeHn5D3W6q9kiGak7Pi6Ke3+pWEfPSuMwOFapBk6bWbYVd
	 nfBV78fvBy/2mVFRz/JCJC++32/jp6S6Lw+V4+dzOzktrCGtqYw+UhaF64W3EoK06f
	 Zmt9badtZZsN9otvEX2WIV68mQhu9v+YSxOtgz2GIGUABk4WME36OiEHqTtVZS/u47
	 g6muMMJwlFSbQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 0/3] perf/arm_dsu: Support newer DSUs
Date: Tue,  6 Jan 2026 23:13:02 +0000
Message-ID: <176773486069.2610441.14881091386712987325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765802897.git.robin.murphy@arm.com>
References: <cover.1765802897.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_151313_315817_22B68A04 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, 15 Dec 2025 13:04:57 +0000, Robin Murphy wrote:
> DSU-110 and 120 have been out for a while, and although they continue
> to share the same basic system register interface, they have subtle
> functional changes that require a little attention to support properly.
> And while DSUs still aren't widely exposed in current systems, at least
> some folks do apparently care.
> 
> Sanity-checked on DSU-120 in FPGA, and original DSU on Rockchip RK3566
> with TF-A hacked to set ACTLR_EL3.CLUSTERPMUEN.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/3] perf/arm_dsu: Support DSU-110
      https://git.kernel.org/will/c/0113affc9101
[2/3] perf/arm_dsu: Support DSU-120
      https://git.kernel.org/will/c/85c0dbd8b6e2
[3/3] perf/arm_dsu: Allow standard cycles events
      https://git.kernel.org/will/c/79448fa1f495

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

