Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D406DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4DJ1UzVv1sNqHHZlC35FP464xisuRTXucnXyNjmNuw=; b=YgAQPpK3/ARqZIu0GoncapPdI3
	AcHsZVRyPfIRpbyJyXmmyiIPHTy9ETLauNC5Sf3gbSpupiImNKPbRftWDAX6RWi1YCLTd/9FvvzcH
	9n3b4p0lTxOh27SBacinw/7RLNbzGjFuHLzRPvVfQdtAT7tVFt0X7yEWsJ1IM9IclIkPal2Ep5arG
	YPGPmIF18DO4fk1h3/NitamCh71L8er6YYzOC3pytIMF9ukXGYyptvkrHG42uPgrsdRshJuBxmfFb
	/wim8jRadsz4XVb0tV9W97GLYGpds3aMKBxH8ctrhp4EMyK/hW5LkEal64tzLVw2Eg4ArXPCxilt8
	8CkfBTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXM-0000000Bb5h-2Q4M;
	Thu, 17 Sep 2026 14:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXK-0000000Bb4X-3kkt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638A01476;
	Thu, 17 Sep 2026 07:56:23 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABD443F86F;
	Thu, 17 Sep 2026 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656986; bh=UlfYCYycte1SlkVFGS+bwo/YWoItPAwqibIilpenqSs=;
	h=From:To:Cc:Subject:Date:From;
	b=Yi1m0CYfX33TJp4EM+7/ZfAxcHRmYpzuZFLIlzis7vm0jKuSKFzIBGH4l+GsxArob
	 kyQmHVFgcLnXWyIYCK9L1vtlLs9lFDx89IGDU7f3dl86ByxiTJ4Rr6WKowCPgK4Kqx
	 CiZFUpyWF6QgBSIGq1XoMtHOR+yf+pWSrNBHLrtw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v2 00/12] arm_mpam: minor fixes at v7.2
Date: Thu, 17 Sep 2026 15:56:05 +0100
Message-ID: <20260917145617.2202986-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075630_971557_578D3CED 
X-CRM114-Status: UNSURE (   8.81  )
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

Despite the subject this is still relevant at v7.3.  This series
addresses a few minor issues in the driver.  Since v1 I've added an
extra patch at the end to fix a leak and reworked the mbwu save/restore
fixes to avoid races by dropping the mon_sel lock in the middle.

Changelogs in patches

Based on v7.3-rc2

Ben Horgan (12):
  arm_mpam: Move MPAMF_ECR write helpers to allow reuse
  arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
  arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth
    counters
  arm_mpam: Add missing mon_sel locking in MBWU save and restore
  arm_mpam: Ensure MBWU counters are reset on restore
  arm_mpam: Use __ris_msmon_read() for saving MBWU state
  arm_mpam: Initialize all of struct mon_read in
    mpam_restore_mbwu_state()
  arm_mpam: resctrl: Correct check that existing class is L3
  arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
  arm_mpam: Don't loop forever if there is the maximum possible amount
    of PARTIDs
  arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
  arm_mpam: resctrl: Don't stop early when tearing down a class

 drivers/resctrl/mpam_devices.c | 161 ++++++++++++++++++++-------------
 drivers/resctrl/mpam_resctrl.c |  13 +--
 2 files changed, 103 insertions(+), 71 deletions(-)

-- 
2.43.0


