Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2555CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezWvkj10KoVIpBI4Cr9l25pdbvabnrq1720umn5Jk6o=; b=JeqF6gIxvPeJzQjB0r+hTbN/gU
	ClvauRN3buvYi/KMuOJLQufiUOWezbEbMq1lsaR35DBdTwXboD1taL5jsRw4CB2V+ML8NpURdmcYl
	VSBXrofyhFjHJs7Y3hnrilrQJsdAbGLuuOy6+I4Qji0auGD3Z6Y0kUd5RmZJbqfS7AD+1GS61y65z
	O5B4R6DUYH9A0QY3FONHYTIuzJfvcKKhKUB5MQVCIVEsMTSXWEJrAdr7xYuDNSTxrdFygmnRafw/z
	oeSa4HYJ2jkQv+yXZp6uhvB0P/1Jy024wqZTDQIAjliLhlScSEQsUN6svVXuccDslOMJ+P8AYuRBG
	yBQdUalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjE-00000000ewv-3YVA;
	Thu, 18 Sep 2025 16:43:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjB-00000000evp-3US8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6473D44C98;
	Thu, 18 Sep 2025 16:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C074C4CEF0;
	Thu, 18 Sep 2025 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213805;
	bh=cvU+rUTH7Fb+pH4bvUfM3aUE1C5EoH36lDNS95ZtEdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/xfk4BrUMmyH7LB4Zm7NKYDcvd8wqK74Ud6aTjWsat/0bTFzu7ms7O9Yl8mpkpY3
	 k6N/LnhSNvdzQe/jAM5usS4yjwwP8eYOO0IZrO6BKR3KYZwpYaNg4czg0hvdlZ4kaP
	 Y9XnewD/PVXGgDEXoebIAC1WTqtWJAKOc1QvA8ESLO7QoZbZPRRmA0yx7aKwRm5XZY
	 IW2JJx5gR868TfQdssmJKPXb3FEWacfaHRZeb0vq+V4yId54LFcK5uEz3ng03NrYQM
	 iOP38txIEwQQI22JZbs+UqhZeSXQgwmNdfF3mfT2nQNBAxpSo6Yx5qVXiA1InAB22h
	 5Jef6AAy9OvnQ==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/dwc_pcie: Support counting multiple lane events in parallel
Date: Thu, 18 Sep 2025 17:43:07 +0100
Message-Id: <175819993397.3464193.5312337667087987176.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828223519.2812844-1-ilkka@os.amperecomputing.com>
References: <20250828223519.2812844-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094325_893208_F40F6997 
X-CRM114-Status: GOOD (  10.28  )
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

On Thu, 28 Aug 2025 15:35:19 -0700, Ilkka Koskinen wrote:
> While Designware PCIe PMU allows to count only one time based event
> at a time, it allows to count all the lane events simultaneously.
> After the patch one is able to count a group of lane events:
> 
>   $  perf stat -e '{dwc_rootport/tx_memory_write,lane=1/,dwc_rootport/rx_memory_read,lane=0/}' dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1
> 
> Earlier the events wouldn't have been counted successfully.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/dwc_pcie: Support counting multiple lane events in parallel
      https://git.kernel.org/will/c/71396cfac97d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

