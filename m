Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1370C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1PPfjkTZrp/s64FCNPQUtxdWzbmzNrUHvfHXCt1OSs=; b=qFEVt5JNczNJz/Op2Vb49N4nbj
	I9foM3sD0RW7V/Hh/zN/eWNxJNIlfZxVK2hIq9nn9tNJ4wSLTGEY+cC5gVjWf9/7xF72ifyTgiDbF
	HOc01iK7AyE2pKbBFfyIyKRdq1g168TpnSMDvTbuuwwjOSLiDvbnD6rGYNyhuaAVIf3+CZiQBMCwj
	3Z3srHFpRFu/kZBx+/SNNUxp+/jr1XUYHMOJqn7rmZGldaGOe9ahmp0+WV5aJQICxjGzhPN4hfCv5
	vyj7bR7NIh83pxmuQG/RRMNljhnzJv14WD9y4TiRxHJsC/wpukayZip5eROVdW5cptfun3mgsdskZ
	Wa/edF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFv-00000000Ccc-3Kmn;
	Thu, 16 Jul 2026 16:48:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFt-00000000Cc9-3XoV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:48:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71439418F1;
	Thu, 16 Jul 2026 16:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FF81F000E9;
	Thu, 16 Jul 2026 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220493;
	bh=y1PPfjkTZrp/s64FCNPQUtxdWzbmzNrUHvfHXCt1OSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kuzg2ZxjXzvwydEEcUeWm1MQSh6i9G+3YaPFiHE2XsiH7URyHiDAo7HDkngTTLyYP
	 Jc402ebkgfZePpZww4ReGKJOOknt1FFd3lc1m3rFduz7bdAKacgVRTz692C7An7JdI
	 LACJ1GebKP1KYEvMVY7dsbDVkmnFRGTKRGcyqkalhVhKYomu0ukoUohvlsSuvRrbdL
	 uAHpAF2cWyQ8o3408+qUeYlWeqhseYmEoy8rMFTvzos4RPtCN/lZH2El7gYvp0ie8i
	 45neXIfA9J/8Qe5Y2CxtLmeoL/8XIKR86rIvFtkl/Rmql0PEM0K9ZNCJ4qM5s79wC4
	 P1rJWnPlCD+Eg==
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Jesse Chick <jessechick@os.amperecomputing.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Matt Ochs <mochs@nvidia.com>
Subject: Re: [PATCH] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
Date: Thu, 16 Jul 2026 17:47:58 +0100
Message-ID: <178420954768.37480.18364490568749911795.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607050925.252475-1-fenghuay@nvidia.com>
References: <20260607050925.252475-1-fenghuay@nvidia.com>
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

On Sat, 06 Jun 2026 22:09:25 -0700, Fenghua Yu wrote:
> MPAMCFG_MBW_PBM is written from cfg if cfg has the MBW partition feature.
> It is reset when cfg does not have the MBW partition feature.
> 
> But the register handling is reversed. This may cause an incorrect
> register setting. For example, during an MPAM reset, reset_cfg is
> empty (no MBW partition feature set), and cfg->mbw_pbm is 0. Instead of
> resetting MPAMCFG_MBW_PBM to all 1's, the current logic will set it to
> cfg->mbw_pbm, which is 0.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
      https://git.kernel.org/arm64/c/021118ce5ea9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

