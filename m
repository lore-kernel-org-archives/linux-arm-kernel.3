Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEpsd3NY71emI/OU49o6DxhBuREbDH43G5MVLueQf1M=; b=ukXVHQUYewc/nssgHH54Mffnjh
	rW+AU91mH08RwZmHmNasv8TjTFRtotkqUE3jGo1VRaTDkufFkQYRIajpNN6k3bSGygqC3rasF755T
	0nC2XdkXiGMzepN+UYGpPc3KAHVly1kD9sIOJsWqRBB3e/MexK4Cv6Bn8sZdVW+9h5QUPMgOGOJ1P
	YgphWtcfoKIuaJPGcesKMhCbwOR0GJtmizplOQwT0WoaUFMsmSXsA0UJHyMula5a4scJ/5bWZ6CXv
	DFhMzvbT0XsKGM2Bi0acdbCtPYaawwxu68uUJp1zzzmgUI5py4jj3YcDyxJNS6AxG3gKn3uf0eyxn
	gc73ImeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOw-0000000FPBZ-127B;
	Sun, 04 Oct 2026 22:09:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOu-0000000FPAy-2iuE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6839C444F8;
	Sun,  4 Oct 2026 22:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153FC1F000FF;
	Sun,  4 Oct 2026 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151784;
	bh=GEpsd3NY71emI/OU49o6DxhBuREbDH43G5MVLueQf1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fA7FZlfh2W9/hpnctq9tr1o0yQnOFCnkaOTqTSrBgMzFcNLPjxul2caadNj73wipx
	 dFPny8lZMhs/03/zoLz+mCFJecd6Z7aYLz18RNj2t+9ZLnj6i/QZQHsvAcBW+SP0AX
	 DQdnISC1IIPcW3clt/nPLSzU+B6sePHL3I2jrZbDXw0Hbg8vSyx3H1PORLdpunqvdx
	 tUCwt+dLL2VoD3duJW4n/I4wP1nBQspFDi81xPFtXKW7s4Gs4+VYOZrmpxhC67sjEd
	 7AsKZ1jIVhAMnNMjYmIG0tknP9MPVVXw4XJ6ZjgEiHPELZkSAT2Q2Ipm4aNcmQdqMH
	 7Hw/SrDagQxhA==
From: Will Deacon <will@kernel.org>
To: Khuong Dinh <khuong@os.amperecomputing.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] perf: xgene: initialize lock before requesting IRQ
Date: Sun,  4 Oct 2026 23:09:18 +0100
Message-ID: <179114855064.1630764.1277374161771369343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902072241.3489222-1-runyu.xiao@seu.edu.cn>
References: <20260902072241.3489222-1-runyu.xiao@seu.edu.cn>
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

On Wed, 02 Sep 2026 15:22:41 +0800, Runyu Xiao wrote:
> xgene_pmu_probe() requests the PMU IRQ before initializing
> xgene_pmu->lock. request_irq() enables IRQ handling before it returns,
> so xgene_pmu_isr() can run in this window and acquire the uninitialized
> raw spinlock.
> 
> Initialize the lock before requesting the IRQ so the handler always sees a
> valid lock.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf: xgene: initialize lock before requesting IRQ
      https://git.kernel.org/arm64/c/d4b7b0c77142

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

