Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D8CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNYo2LK0r9ymlHkqqNH88mFoL+fAp95YytunWlV58ig=; b=iKRYSvt00WZkY3UKqbde44MDi3
	Pq6WDPCWiKeS/i2il8k4TN+4+V9IEskZIGTxHPspAwbibCDdsUc6nmDI3JJRK0Qik9tNLlHz1NG8l
	b9wRreSD4MVreRTRR3bhBJ39j6uPST7y/kd8Dj5sv6FIfrdjuSkHfGpelD9PHu6Rw0mLBBgngRE7l
	OJorVdRG7Sb0duCHjiB9TuPbVkhMcpDzJfihKqDHCfycRTehg9VDpIXYpzSY1iabRws0wWkUNQZpS
	IrHtI9ApsQa2vET5G2hEiWVNQdZN9GPXK5eGr4SJXZXng+J78aiJimsz0CaQp/ZnyNb5E+osFeOA0
	Coqn5hdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0X-0000000A3uZ-1fEg;
	Mon, 03 Nov 2025 14:58:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0W-0000000A3tU-1LJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7414F601B3;
	Mon,  3 Nov 2025 14:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910E1C4CEE7;
	Mon,  3 Nov 2025 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181887;
	bh=VB+OJdhFko++Cc4PEpxdVhhL1Tqf3bp8WQNWSVbu7VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mdkfw/5VBc7WvLgks52fmjnPgUxH4An/R0ffGAuU8ozjeaLHfK+eZAu/FgfgvcFx5
	 iimo5wFdIP+w6X7S8c9uABeZ6Q0Zrt7Q3EnrSS3v0nhEcsSE9Ur9MaW9/ioMmpujQS
	 jb0FEa/tNNw0pmHbT+Dim+3LnO4IHMLOPb6YUTShaxH/hDADCdshdRjxaEgS1u8ckq
	 6DIh0KMPvbP9iwMjDrAX9clDVCKSY7pOdD7WwQmt4Bqtx8YU7zEjvmaMvyvCTiuTeY
	 IQBVvxEC/6u6Z1yLjP+c7Ib3k5uvBXN8TzlKNIU9Un8hfMsM8tl4fy0/kLfZbuoVO1
	 VTxiymJYgvnsQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/arm-ni: Add NoC S3 support
Date: Mon,  3 Nov 2025 14:57:49 +0000
Message-Id: <176217955803.2904482.3019050250965959797.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ddb1dbaccce2f092bbfe1029982aad3a81bded71.1760960572.git.robin.murphy@arm.com>
References: <ddb1dbaccce2f092bbfe1029982aad3a81bded71.1760960572.git.robin.murphy@arm.com>
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

On Mon, 20 Oct 2025 12:44:19 +0100, Robin Murphy wrote:
> NoC S3 and its SI L1 sibling look largely similar to their predecessors,
> but add the notion of subfeatures to the discovery process, which we now
> use to find the event muxes for each device node. Plus, as ever, more
> mildly annoying shuffling around of some of the PMU registers (this time
> it's the counters...)
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-ni: Add NoC S3 support
      https://git.kernel.org/will/c/8fa08f8835e5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

