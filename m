Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9M1CWQQukSPHNfP8vrf+Ca5VKMho+oGuFubAh4pWVU=; b=DQBHYpwCbKD2snWjQsAfnTcGgm
	ukgFh5zf5CxW41BKhC9u1bP6VyhtTzq7Nwzk4XnhTQ3S2msa+biGL68HY2lfp4cXR68k75LBiJmhD
	vmVsB0icJFfos/S9osNqQOCxSmWEpclF8XMJhXD+zw2WxIWtmuWASGxbnhMFtrSUYBNtPfAdTQS4S
	bk7fOOyHh2H8ELWqujfkOjoD9O4jADObv/CERlLu6TroDVyw2PE9AgLYr67DPT+L0K0LotHj3bTJI
	kUqUZ3tCp6Uv4CXbO6MTXKDYdA7YZcfEmoo4o20+SyDH0zvKyu3csDGaCLPQaoxZI/dKxoT7+RdjG
	lTTYyWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPZy-000000044Z0-2Skb;
	Fri, 09 May 2025 15:24:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOCG-00000003qv3-03by
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 614D2A401CD;
	Fri,  9 May 2025 13:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753D2C4CEEF;
	Fri,  9 May 2025 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798927;
	bh=da3RkCqXANyBGgu6g4hnmz+mJdGqS579klvM2K7ikjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5p1Mi5YCMihuJE9OfUQVXe4W23KR5UspW7XhDDz4gIVp+fQhLKLlXaOlvlf49hxp
	 bK6YqSIhX+3MGRHodGeOe0x2HPZJb9x4OpMERBGopPXlJbd/MS4GgCqNvXNo94bMqK
	 iW9l4NIBaoWU+mu7HoZCHN6Ir7fOUDNr7FC4vA0mloabHlz+GIVLGDoPNLe2gs9qKU
	 DHGY8h6a3jIEVVCzXYJuvol6T0ZJaNHLR/Rv5/K2jh/JCkY5thxNvs8DGhnm3rGRrg
	 DaoO8nlRlyD7P0mBBdkhRpMnKyhpHykI9CJmXwdNlxFwSqCEW5YHhGyNgiE9wsT9Zp
	 qbGlJ2p8qP19A==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Fix REQ2/SNP2 mixup
Date: Fri,  9 May 2025 14:55:17 +0100
Message-Id: <174678933203.1772245.7314989125641687120.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <087023e9737ac93d7ec7a841da904758c254cb01.1746717400.git.robin.murphy@arm.com>
References: <087023e9737ac93d7ec7a841da904758c254cb01.1746717400.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065528_111006_04AC353A 
X-CRM114-Status: UNSURE (   6.91  )
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

On Thu, 08 May 2025 16:16:40 +0100, Robin Murphy wrote:
> Somehow the encodings for REQ2/SNP2 channels in XP events
> got mixed up... Unmix them.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Fix REQ2/SNP2 mixup
      https://git.kernel.org/will/c/11b0f576e0cb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

