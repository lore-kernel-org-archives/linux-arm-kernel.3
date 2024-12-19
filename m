Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97856E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSsUsziGK81k1yTW75CnH5+sdovk94GxRNxIWozf1vc=; b=txlYckt1o4xavpJdKfmIDOJmXn
	6Fysx0JeIqxopiay5Udod0lF1FWCF0K9JYUFTbaLW8mKuQhZksrEmtjby0hIvJFA4N4/qurnxoTub
	YoS3jceCJV2zC2turSoCcWBFOziPHkLGmSMLQqhXNSFt7smIBxfbcPXmmjCSo6Dlt2cc+jG4sgXd3
	//MEkiysatZPpgcv4q1HdbS8NkZ5N94llr3StWpRVrItwCJ5IMJMqJQ6j5kvWqrf5x0GXyakwc6X/
	7Y6xtNPjw/hDiuORAmiYUYoCZFmfQqoCsH0BAfp+zImSJpSUbg00WhM188Yk5ba0Q5LfjkEIpiKQA
	nv9yggZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMZw-00000002uFl-0DGK;
	Thu, 19 Dec 2024 19:53:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUl-00000002tTm-3u5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE4D8A428A9;
	Thu, 19 Dec 2024 19:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10A5C4CED0;
	Thu, 19 Dec 2024 19:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637658;
	bh=5t0vrlKWqM+WvY2kQcPO5vA5TZpypogXwio0H5peQRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rs7AST/6sZLFxdbORIt4OjZHQmUxnQ2GXinwfg2nm9MMKSZ6KXN6D1P8UHEQZEpSZ
	 jeqdtp7lIYmqrTaOw5gyXXN6spMy+DDdABvF8B05IdsmXS7XGiil01NSJFtBCPb0Fc
	 K+OlMAgnBoLRHt/bCDfWPvX5lKuVZPi07jk03b748nADM6YAJRY7M1rv/582MLrMXn
	 QYykUhEsrNLZ2crn3WvOcLxqZloZKfASVaQnLu4e9NVPNHoPnKGIKBEvYfCZdpcgkO
	 KK/eTGo3+XB1byMzKlpd0m9GaFPaViPqRsJ4RiSvN5dnEVxFrbYanG9uRNk9BMH0Ik
	 Ndm7EQPZCGj0A==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-cmn: Permit more exhaustive groups
Date: Thu, 19 Dec 2024 19:47:12 +0000
Message-Id: <173462242272.3910338.7654467298369824108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com>
References: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114740_029267_3EBEF5CE 
X-CRM114-Status: UNSURE (   8.89  )
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

On Wed, 11 Dec 2024 19:04:58 +0000, Robin Murphy wrote:
> The group validation logic still somewhat assumes the original CMN-600
> case of events counting globally, such that if one tries to group 9
> events where the first 8 target a single DTC domain, the 9th will be
> rejected because *a* DTC domain is full, even though it might only
> target other non-overlapping domains and thus still be schedulable.
> Improve matters by only counting the DTCs that the new event actually
> needs (as arm_cmn_val_add_event() was already clever enough to do).
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Permit more exhaustive groups
      https://git.kernel.org/will/c/e49ecdf79a60

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

