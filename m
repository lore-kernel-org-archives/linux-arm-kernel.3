Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B8C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOZm8LuJ9j8wv1ex5ZmVij+gKWRSKaw75Pqo3DQ2ob0=; b=xS1yKX+f8Jk5LSDhJ/UaF0XULx
	NphniHvPciwf9vHEnf6yIHOLYE1d2Hm9J5JhQC4FqjwJBITw621Uuhukk9+KLRM7SW/upqJOrMoi9
	yao/cBmmI6slB9KFwaSQJQKjxSvT59zuAj5GXhKWV+WXlv6XYGCobcXxanyVjy3QmSeX0xFNndcs+
	r7wkE+yNumLSESmhzJjUMhZBB4PSD6kgmE3397WWrXs1Tfn8fWNEuHxC+WFpVjJbcWhCmoCa1ykwk
	QHbI1i4PuPuBnvswD/VJ3d13GNUeyu1BKrSUwf9Zp2gB2GIoZD85VBMxN5LqTOGK7u5w/QQGG6WWX
	8NQ6gpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QhL-0000000DPIk-1cwp;
	Thu, 17 Apr 2025 14:58:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDR-0000000DJID-0PpM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3CEF4A1C3;
	Thu, 17 Apr 2025 14:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7991C4CEEB;
	Thu, 17 Apr 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900064;
	bh=nu5w+lI6jf2LoOP/AZC8IFj/m0okyWNkNm6LHYmTWbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRZsqjoNt7FUSi7OB/LX0T0PhgWMozBEV+mdFBszNlYUE7tCZDLO0XpU9r8LoBlBc
	 jPEQqoOxuwbutl4BRzaulT/csCqprOlgOEocxIKEX3QOJUUSdmDKtAJvMYx+C9CTJ6
	 ANadM/2Y0QtyaYEYmXhgAabpmfJmYPBuj8xr0UC/TRruALpCkdOYAOea327Shjvfhl
	 SkUWcnbnnaE5nV8/5LlnsX56Hultn5K6KGkf12b4z97WTwGGf/9EICTJVxkUP2qol7
	 rladiWdLrHyDcKLl2mf7Gu0to6awHMTJr0quhMMp+N1l0kk10VUB3suh1oi0pca9N6
	 yrxKE6AGVATzA==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Hongbo Yao <andy.xu@hj-micro.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH v3] perf: arm-ni: Unregister PMUs on probe failure
Date: Thu, 17 Apr 2025 15:27:24 +0100
Message-Id: <174489608350.2694212.5228130661148329110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250403070918.4153839-1-andy.xu@hj-micro.com>
References: <20250403070918.4153839-1-andy.xu@hj-micro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072745_154680_7027097F 
X-CRM114-Status: UNSURE (   9.10  )
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

On Thu, 03 Apr 2025 15:09:18 +0800, Hongbo Yao wrote:
> When a resource allocation fails in one clock domain of an NI device,
> we need to properly roll back all previously registered perf PMUs in
> other clock domains of the same device.
> 
> Otherwise, it can lead to kernel panics.
> 
> Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
> arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
> arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
> list_add corruption: next->prev should be prev (fffffd01e9698a18),
> but was 0000000000000000. (next=ffff10001a0decc8).
> pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : list_add_valid_or_report+0x7c/0xb8
> lr : list_add_valid_or_report+0x7c/0xb8
> Call trace:
>  __list_add_valid_or_report+0x7c/0xb8
>  perf_pmu_register+0x22c/0x3a0
>  arm_ni_probe+0x554/0x70c [arm_ni]
>  platform_probe+0x70/0xe8
>  really_probe+0xc6/0x4d8
>  driver_probe_device+0x48/0x170
>  __driver_attach+0x8e/0x1c0
>  bus_for_each_dev+0x64/0xf0
>  driver_add+0x138/0x260
>  bus_add_driver+0x68/0x138
>  __platform_driver_register+0x2c/0x40
>  arm_ni_init+0x14/0x2a [arm_ni]
>  do_init_module+0x36/0x298
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> SMP: stopping secondary CPUs
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: arm-ni: Unregister PMUs on probe failure
      https://git.kernel.org/will/c/7f57afde6a44

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

