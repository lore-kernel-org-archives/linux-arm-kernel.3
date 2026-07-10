Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F90C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ILijwHRTXgJBxsm/4/xZozigan+G5K0vrA4fNOuEVkw=; b=rI2zRVtpDBGKEd3GF27wlq3PQP
	veOj/VkbnAVPC3zgLFbO4f9FvlARHmWFIkP2rcVl7DWsZQ51Esctb8gvodrrzK7aLcfBmOjJP1EzV
	HqPLqYzIrlvGzEc0Su/4w3+FXoc0QptEnlX/0xs/hNLjanhf/4dbeo3tZ4o0wTDwujmcvb6owl9xl
	uEU94T0lYsVzPir9rGf7/TWY+YG8/ERn2uQ8GJvV4XGxjkz0XD/VMm3x3HPldryXusLX3/3Zq2D/S
	pn4P/iHf2+KF6+Um35//luiaNwLCmWM495tQ4VUHZFH5klnllu0wUEoxdLskwQkNdPp3zCsYYRsUj
	7yZDn9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pr-00000004rlg-1ozV;
	Fri, 10 Jul 2026 11:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pm-00000004rjq-0ExP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100541E7D;
	Fri, 10 Jul 2026 04:55:52 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C71D3F85F;
	Fri, 10 Jul 2026 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684556; bh=I4vJiufkwm3UxjfxEwPYp8LeYjs7wS4m10Y5eB12CDg=;
	h=From:To:Cc:Subject:Date:From;
	b=SJpXHIfjjq6OYDIN+OOAQ64vIyIkzlPoqZpUkmj3Lcq+Eaegz7q4tT6flXqoES+g0
	 2zt+ngttNA0qvs1Cl8NfJSfSuOGixsgRTfFCmvvrjPZpsQVGZkbzY1aFggEa4VJPOv
	 HUwPDjMY84lgEuw8uuD5T3qB2n8jrOVseZKZnhSQ=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 00/11] arm_mpam: minor fixes at v7.2
Date: Fri, 10 Jul 2026 12:55:34 +0100
Message-ID: <20260710115546.29644-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045558_226053_6E542C50 
X-CRM114-Status: GOOD (  11.29  )
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

This is a bunch of small fixes for hypothetical problems in the driver. They
were found by a mixture of messing around with a software model, inspection and
llm review.

The first two patches ensure the error interrupt isn't accidentally disabled
when register state is lost. Patch 3 keeps the feature accounting correct but
has no functional change. Patches 4 to 7 fix mbwu save/restore but this is not
relied on as we plan to just use resctrl assigned counters and these are
unassigned when a domain goes offline. Also, MSC afffinity of a region smaller
than a resctrl domain has not been seen. Patch 8 makes read_mon_cdp_safe()
behaviour the same for cdp_enabled and not. Patch 9 fixes an infinite loop in
a system using all the PARTIDs which is much bigger than anything than anything
I've seen. Patch 10 stops some allocations failing on similiarly big systems.

Based on v7.2-rc2

Ben Horgan (11):
  arm_mpam: Move MPAMF_ECR write helpers to allow reuse
  arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
  arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth
    counters
  arm_mpam: Add missing mon_sel locking in MBWU restore
  arm_mpam: Ensure MBWU counters are reset on restore
  arm_mpam: Use __ris_msmon_read() for saving MBWU state
  arm_mpam: Initialize all of struct mon_read in
    mpam_restore_mbwu_state()
  arm_mpam: resctrl: Correct check that existing class is L3
  arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
  arm_mpam: Don't loop forever if there is the maximum possible amount
    of PARTIDs
  arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg

 drivers/resctrl/mpam_devices.c | 124 ++++++++++++++++++++-------------
 drivers/resctrl/mpam_resctrl.c |   4 +-
 2 files changed, 76 insertions(+), 52 deletions(-)

-- 
2.43.0


