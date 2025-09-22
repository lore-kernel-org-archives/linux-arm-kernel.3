Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970ACAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6OpUepoVuhb8kEHI6o+Vp9O4ieuYYpB2+MyQBz+ceM=; b=oGnfrf47RbaOCMPvzsC3Xys7dq
	G4EIKcyJz+ylKqoPhsiml901eDYe1ATH0DdhEqbcAIPNYa+532j7PH4J8l+sQ8vUsW46+PYl0Z+YP
	bWE23kKjaas4FICKd+9L0DCLo2rr85NaMED3/oW+Xpz0uvoh+5m9Et3dSCJeaTR59UPZs+mqphBD6
	+0BtizH6mCxMGhcM7Lw7Fpc85LtSKIBd9XI9htir2QIbPv0m9LpO62B4FmyERV+hX7zCOCANWwPbW
	+kJtAM8L8fkH5bY6j/AHnWjAmfewb0bDK3wNwK6i2Su2R9ffiK4/R1p5D3iTCKC89nr0NSoQRmNm1
	R3eFHIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gO8-0000000ASMU-1Iug;
	Mon, 22 Sep 2025 13:15:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gO1-0000000ASH5-016d
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T6OpUepoVuhb8kEHI6o+Vp9O4ieuYYpB2+MyQBz+ceM=; b=TgA8r6ZaCgHAPxbmyROg1iYI9q
	8VEU5OuBu2xFLuDejH5G2GFcOYIYjZ6IJIG3rWzZJgwD1v3QYeoIg+idxPep9CPgclvJ8fc89/7Xc
	wrxumt1F538DYgvGb5RYuluDMF2w4CTeQGTyL2yB05Vm2GsXK8AWYo/mONG0MvXrlTNMGQJxZsOdS
	u5S5FRSUygv+waT9AAB7ai3F16HynX/hlkux+gqW6UWMqonQrrzr1MrTHI/7Zur6UOq91CeeW7QwR
	phS8P5f2xFB3Z0A1lFcMfVcrUzjO0CAxPwyaRjCB00zcs9dLVWDOZZv+wjeQCiEkEkc0w9y43pX3V
	CA2bqp4A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNx-00000008IEZ-2w66
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A5B8403FC;
	Mon, 22 Sep 2025 13:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39652C4CEF0;
	Mon, 22 Sep 2025 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546916;
	bh=LiqDKW6ln9kt2Zw8dlUpGxSN/0CLn3XcrFMQrC+5Rws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwUQQPcOkH1aPz6j/UFapAp0qwd6wDdo7Rz4l2YxigQacqsAbNQ47biaipWCrhfwy
	 ZqvJJ6zpurl+jsvmJyjKYlLnMklNg1Yt0lByNYqL3OA6HgrNq/+103Zi3l7WcNklDI
	 r5ntE2SR094aJxUtOciZBe7PXyOCW+sqNsJQInzROwTTipdvWnx6NAqVlUrd1r2FHm
	 LrpuTbKoqQ0D5ejuNfORv6NFq/rURfIKcEds0sNHX5oeoKq5qYGz2Uu8mvOSKuVfcn
	 xyW3aBFLsiGNu/ozxyzdxw4r/ohLt+E0x4U+8vAkzPdM5D/gJGIKaScK5KCnYt2QZa
	 GLNvFgEK2Jpbw==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yushan Wang <wangyushan12@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	yangyicong@huawei.com,
	Jonathan.Cameron@huawei.com,
	liuyonglong@huawei.com,
	wanghuiqiang@huawei.com,
	prime.zeng@hisilicon.com,
	hejunhao3@h-partners.com,
	linuxarm@huawei.com,
	fanghao11@huawei.com
Subject: Re: [PATCH v3 0/9] Updates of HiSilicon Uncore L3C PMU
Date: Mon, 22 Sep 2025 14:14:51 +0100
Message-Id: <175854328084.3142502.15045454616796206368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829101427.2557899-1-wangyushan12@huawei.com>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_141518_093512_93342175 
X-CRM114-Status: GOOD (  13.35  )
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

On Fri, 29 Aug 2025 18:14:18 +0800, Yushan Wang wrote:
> Support new version of L3C PMU, which supports extended events space
> which can be controlled in up to 2 extra address spaces with separate
> overflow interrupts.  The layout of the control/event registers are kept
> the same.  The extended events with original ones together cover the
> monitoring job of all transactions on L3C.
> 
> That's said, the driver supports finer granual statistics of L3 cache
> with separated and dedicated PMUs, and a new option `ext` to give a
> hint of to which part should perf counting command be delivered.
> 
> [...]

Applied to will (for-next/perf), thanks!

But please see my comment on patch 5 regarding the user ABI.

[1/9] drivers/perf: hisi: Relax the event ID check in the framework
      https://git.kernel.org/will/c/43de0ac332b8
[2/9] drivers/perf: hisi: Export hisi_uncore_pmu_isr()
      https://git.kernel.org/will/c/4550244b53b7
[3/9] drivers/perf: hisi: Simplify the probe process of each L3C PMU version
      https://git.kernel.org/will/c/0960e535be54
[4/9] drivers/perf: hisi: Extract the event filter check of L3C PMU
      https://git.kernel.org/will/c/2271f1634243
[5/9] drivers/perf: hisi: Extend the field of tt_core
      https://git.kernel.org/will/c/ede339ff61c6
[6/9] drivers/perf: hisi: Refactor the event configuration of L3C PMU
      https://git.kernel.org/will/c/b3abb08d6f62
[7/9] drivers/perf: hisi: Add support for L3C PMU v3
      https://git.kernel.org/will/c/475d94dfe7c6
[8/9] Documentation: hisi-pmu: Fix of minor format error
      https://git.kernel.org/will/c/272dd0e5e58d
[9/9] Documentation: hisi-pmu: Add introduction to HiSilicon V3 PMU
      https://git.kernel.org/will/c/6d2f913fda56

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

