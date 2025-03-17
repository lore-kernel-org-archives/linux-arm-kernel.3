Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692A0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82+eYPemWyPsTotoelNoKhtaPcALE2iKpuSv1QOFZcw=; b=JG2Htae8hqF1Pfs2b8Y6Awpc3Z
	stDArRAo/DE1zDVuKGScH/x3OpFdDvGQNjv3osx4/ZzqTxV1n5D/ca0SdMQ8wmELhNWWmjn47ZHGm
	sZCcGzNIscOup3onTH0VNzrzcRxMrfjj1WBI6b1aJkcYbjTGRBjpy5xGEt1hFPq3A6c8pQ0PPDRN2
	WHFw+pctCn+sPo8jPDaJx6tk9oaW0lnpNbbrmyYFc5cxRybDOLd9wRbHo0xMmTL1ZQpjLHIEbZ94M
	A7jqnio0mQEtvGvU4J6HCrgG4Z+IDJA+him2fATTflhD4IqOUFwlPpGCgCMoOmZDp6nQgtJXapQ5Y
	1SUdzosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCH6-000000037lW-0L9Q;
	Mon, 17 Mar 2025 15:21:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuC69-000000035tv-2SLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2C48A44968;
	Mon, 17 Mar 2025 15:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEFBC4CEE3;
	Mon, 17 Mar 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742224188;
	bh=uPsdpb/twNuZT+zxQ3MOjZ3KiU3snHeB6pUVozD/84w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CBtmd5VPEO2XKEfTj89IDr671UjDx0zHvVD1wADeTiLc//vhfrb4xFLPJU1+rtUct
	 ZhfE9fv4W/Dsk5a5KLJBQ1rgOiOhbF8UCV9haXPurs7EwP7S+CaBqcXXaGjiQV2h6I
	 nAypbZwDeVKEzj7UtoG42kFWvKlHU+wd5ZX9zMQwrNCHenROKw1mZqZHLAau3OYwM8
	 eTZ1hhCBR0t4V5zZODkNrgV0kfXjv+hP6uB50XnNywWBuZuiUIBzeQqLPkC38g2mwV
	 KiMYxeBbCmOJK8H3He2hO397xzO5a9j9Xuv/5TuC1Hl2ZandtryJhJ+GbgInIQJ2zL
	 dtgBn4gXkEUFg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] perf/arm_cspmu: Fix missing io.h include
Date: Mon, 17 Mar 2025 15:09:41 +0000
Message-Id: <174222318360.167046.12264124011753277546.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <657935ca177024ad08d5ec6f85e8faf75f82cf65.1742212833.git.robin.murphy@arm.com>
References: <657935ca177024ad08d5ec6f85e8faf75f82cf65.1742212833.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_080949_686562_1269CE57 
X-CRM114-Status: UNSURE (   5.99  )
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

On Mon, 17 Mar 2025 12:00:33 +0000, Robin Murphy wrote:
> Adding the writel() calls needs io.h, which apparently gets
> transiently included somewhere on arm64, but not elsewhere.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm_cspmu: Fix missing io.h include
      https://git.kernel.org/will/c/9651f7899cc5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

