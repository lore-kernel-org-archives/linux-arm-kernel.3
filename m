Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3631E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2ncnMYAC6mhoN0EC9UnhroKv8cA+8Vno3TBdl2TDz4=; b=WK65B66WWNj7aNN9z3hOrSdGeo
	rZc5s2yCipHunw38XJwaKU3n7tlu+8+elK+cyZBNpzEUnqu4K+7zidI2nJRUp1I3/5hvkRokfTCZ6
	5niu7JUO6GQVxN64zaVzhxc0649MZ8ud1QThLoV+RJOl2fjg2RKZX1V0A+T7bgXjIs46swSjZB8vI
	hmyCeDceLoy7BehuFvIIzo1PjD2PAxaBggudLZ0ntKRa/4FqnOf7YRmsdEgBmYyauBYhKzmQXQuIo
	rLJOmjH97HPnZAlNoUrSJs9J6Uqe6R904QpISfloWPwrskDcvalBHVbB/mZ9RYf8nI67pI2oA7OSQ
	MmfiCf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKikx-00000008uvA-0UUf;
	Mon, 09 Dec 2024 18:45:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiiv-00000008ud6-0kTZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 145755C5FCC;
	Mon,  9 Dec 2024 18:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46ED7C4CED1;
	Mon,  9 Dec 2024 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769792;
	bh=LC1SJgB4T+PNAWsHATcRZDo1/LyTAyEATO2d1JySzuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1rhfG23vpajMNXOrKBYnnv1IiN2DU3WYNZAZcNibospSmEVoOzqa1ZpXEzmTeTRK
	 IW5Uh+PtXUh+Za/oXb3z4sOe8mQ2VeXvuQjfWJRqkTXiPgzsS5KlHLsnpmzIoEKP9x
	 ABXBXbOwe8NR1IWlK0U9wYpMbSxbpj38ZCOIsRMwGKpyWB6kW9nPMjiy05QyfihCJi
	 1YxdWU1wGRHpgykMhPNTpkTouVAf/9G2PnAGR7dyQ2TWq8VmgL0PjbFUjKrbm1s6Ys
	 vQGG430LQ9jEhlnJngWEiYv4JQyBSd8wrwn259BiXFhqBb1j1GMvO4yMIRyqzYKVA6
	 xmnn4qPpAgu5g==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	bbhushan2@marvell.com,
	gcherian@marvell.com,
	sgoutham@marvell.com,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v10 0/5] Marvell Odyssey uncore performance monitor support
Date: Mon,  9 Dec 2024 18:43:02 +0000
Message-Id: <173375975929.1126639.3014797293095005520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241108040619.753343-1-gthiagarajan@marvell.com>
References: <20241108040619.753343-1-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_104313_259305_722048FC 
X-CRM114-Status: UNSURE (   8.39  )
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

On Fri, 08 Nov 2024 09:36:14 +0530, Gowthami Thiagarajan wrote:
> Odyssey is a 64 bit ARM based SoC with multiple performance monitor
> units for various blocks.
> 
> This series of patches introduces support for uncore performance monitor
> units (PMUs) on the Marvell Odyssey platform. The PMUs covered in this
> series include the DDR PMU and LLC-TAD PMU.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/5] perf/marvell: Refactor to extract platform data - no functional change
      https://git.kernel.org/will/c/349f77e10952
[2/5] perf/marvell: Refactor to extract PMU operations
      https://git.kernel.org/will/c/0045de7e8713
[3/5] perf/marvell: Odyssey DDR Performance monitor support
      https://git.kernel.org/will/c/d950c381dce1
[4/5] perf/marvell : Refactor to extract platform data - no functional change
      https://git.kernel.org/will/c/59731e231c6f
[5/5] perf/marvell : Odyssey LLC-TAD performance monitor support
      https://git.kernel.org/will/c/5fcccba11833

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

