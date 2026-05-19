Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B8CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUeAMf6GnQh3U+SHQD1M14Mvv9/BzumrqXNxMXgB3bc=; b=CVJErb+wjWLzStrYdV9iAVmpxa
	B2A1m49qpjb38i803OOG+zH1An8pMsa+zigyPrmhLMABvtOwymW5Xl9B/6u2PBpEmYKv4rM4QsZW/
	iDTTKuaVZOxZkPadc6h2JKJg0fpeVFc27+1nba7SZu6Lx8LokvU1r9E0E9AWdA/B1JqwwzjAr5Oxt
	7Me0QvTNO2f2sqglayb7wENGKP/kT/zyg0vYGySg1tyS21IaDWRmTOzjo12YnkG2IQqK4A0YbaORh
	gbECzkd1DnAYV3xmw4sGc6FNsRUZkMw4R0CSTuUavifdzi/w8I+8ZAxARqfphhlnUbqi3cSB2GTEV
	vn6xBiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJU-000000021b5-28Ky;
	Tue, 19 May 2026 15:24:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIk-000000020z7-0wcp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8F5E60224;
	Tue, 19 May 2026 15:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD4C2BCB3;
	Tue, 19 May 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204249;
	bh=KnwGe1PHQa7+ces6Rm383lcbh4DqxvuFpwRmHyUGOIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IdPkl6J0Z0lwrY74J+6qVDWm/3tuvL1RSq9pBus1o0+aExZ9mmq0P06ogAkIf4MbS
	 SG8pJUE7d2RNyFh65wVLMXD7nFTGFw1qQKI8xcAVzmnOPXVb1c23vytstZvTClXt+z
	 m/44RL8c6mslAAf7jIKqNY0zfzmWlDxMISrokB6OpZDQ9RRcL8Osv2eGV9c8CmcKGW
	 wen/BIJ8Y3b2v9JoAelHBzkn3uQN6pL3TTWSOq8+ERqxYtF2mtYpQWaGiICF3FCGY0
	 0B7w66uxzaNwY4xZcA1Y4foOF38qTX1doanTI/ZgGF1gY9MyF3iHM5Yc0ImAAByRR0
	 rSRa3NMFzKIxA==
From: Will Deacon <will@kernel.org>
To: Leo Jiang <leo.jiang1224@foxmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Limit queue allocation retry boundary to PAGE_SIZE
Date: Tue, 19 May 2026 16:23:04 +0100
Message-ID: <177919187443.820140.8795243549242737796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_F13723B53F68DC857410D3DBE4F6C895C106@qq.com>
References: <tencent_F13723B53F68DC857410D3DBE4F6C895C106@qq.com>
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

On Sat, 09 May 2026 15:07:33 +0800, Leo Jiang wrote:
> Stop retrying queue allocation when qsz reaches PAGE_SIZE.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Limit queue allocation retry boundary to PAGE_SIZE
      https://git.kernel.org/iommu/c/2b9f593dad46

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

