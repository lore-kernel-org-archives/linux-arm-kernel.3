Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F47FC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkTAOhuJ14MxP9gF2ehfEKf0Sh4Vdxi7cZeyPXUGPbM=; b=uWg0k/GIriOyaalzkuIVkNjJkc
	fDjRwuCYB6M9wn45gBewNglYAcG2VbddPyyzK4UVNS2KM/ldmlJngeZ1vsuqqP1l6e3d9TebRKUrJ
	Jgt9WXksf3WQqTQnHTnjpuUacgfqZwv+ixqxeyoRkDpgffRWOnEcBSX4UJu9KZuIlGo3Tn8hvNujx
	OjoHnhtJhhNer347my/f8EmS5zJauZgLHL4h/yqJBCDjGodAVAty6va2FjcJAB7WX+WqI8izEjWkE
	N5sQXkslOFZtHAiQLZmkGwMdiwDrQOyQpBtd7BO4Lx1uPxm4iU4Gfc4xijhkX73gGzJZioATeDmtf
	BLHlVExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNB6N-0000000FiQb-0emv;
	Thu, 05 Jun 2025 13:57:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAiy-0000000Fevw-1ETb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9992A5C6801;
	Thu,  5 Jun 2025 13:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121AFC4CEE7;
	Thu,  5 Jun 2025 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749130419;
	bh=yxqHU2sOZN27FulrAoAbvaO56DcbsQKhcY/tONUxapg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXXzABH/J2X+vsgPNiyyVobzGpKHW4ZnkuN6qgNbdAWtraINx/hRirrLgERmAI2fg
	 O3r2rSRBLCJRdcVmRHNj5RhVOqxcCoqzSGyOdkYopDU6HUbp8TqXz3xDFiOOryliDs
	 wylMSmmKV252l0db+CVj7VxuSeX7JEVkrHn8ztKfHi0UGSmdRr3G2xSZeflt0exUJG
	 dbSUDq8Ao1qFERKPsnvMxBStOqO3KSvYDjMkrDGQGC67oO1WzOt2AqvPxnUCSNWyb6
	 K75JqBZDQg01SnJv1qIyupDf4uZ8pHjB8IPOWJRYCrqxdfF0bc1CUPRgJItS+dZLwN
	 Odn3i+cZ2P0TA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNAiu-004J3E-Kj;
	Thu, 05 Jun 2025 14:33:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Sebastian Ott <sebott@redhat.com>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Thu,  5 Jun 2025 14:33:30 +0100
Message-Id: <174913039935.1215874.15467510100629405540.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, sebott@redhat.com, coltonlewis@google.com, ricarkol@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_063340_373766_380A05EE 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu, 05 Jun 2025 12:36:09 +0200, Sebastian Ott wrote:
> Some small fixes for arch_timer_edge_cases that I stumbled upon
> while debugging failures for this selftest on ampere-one.
> 
> Changes since v1:
>  * determine effective counter width based on suggestions from Marc
> Changes since v2:
>  * new patch to fix xval initialization
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
      commit: 9a9864fd09c7e52440c05e70609bf5ee8da425d0
[2/4] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
      commit: 050632ae6571d0f148fa0d4b90b6409a12645461
[3/4] KVM: arm64: selftests: arch_timer_edge_cases - fix xval init
      commit: 05ce38d489dbc96eb1dd700b287f949cb8cc0610
[4/4] KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width
      commit: fad4cf944839da7f5c3376243aa353295c88f588

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



