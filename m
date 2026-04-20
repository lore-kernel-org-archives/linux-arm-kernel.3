Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F4F588DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrAaN1Ltmcyme4bghDrN1Lez3EqwpsO2Yu5xAnLL/Ko=; b=fdKXqgja5Xc4Bjb89eyvnP5Qkv
	XNgGr/1AIQbzA0onOYOjBH/5GrSTDZCznA6gj16AtKM9//KPGS6hkNCYiES8LWTC0/zYHhQjxcqyO
	cuMmFYwVNeeNC/XIb81zXiz8w1m+ArVhNWvL7tCbJs8R+AoIe4b3m7QcOW9jOjNm2hMEduIuhMHW3
	fZfp9uKy0pc5Mah3ZkIomvEevV2C3K8RIKDQSROElbSshl9E78oU2p6mDIZ7iAYMoHtqemm2SdHV8
	6dB9g77t2WFPf4LMaW+osLswfLkk8GPfgh5MpaNhTCl6EMBNaNMiTnNjQc9sjuyN+HYvjjpX3zGGs
	5Dg2c30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFg-000000078FT-42vJ;
	Mon, 20 Apr 2026 14:05:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFe-000000078EZ-2tV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 095D21516;
	Mon, 20 Apr 2026 07:05:18 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92A923F7B4;
	Mon, 20 Apr 2026 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776693923; bh=P3Lgs0mCnFSarx4XwTFAAtIGUjOcla6pmBxEiEDxJaw=;
	h=From:To:Cc:Subject:Date:From;
	b=sNso/qDEwo61qFMCSZyd7jPtlUZivVUhBKj2dpajhXspbvjxoaKTdYoUjCZdTj4sq
	 PeFDZFblLM1QMvnnlgv+FiOiRd9RC3YXov8sR2Lr6FV5g+QAhofWtUY0c/s0A3/Wz6
	 V8LDsx6mVDt9FWM/8kudPLGWzifrkhvpuvMhiOyM=
From: James Morse <james.morse@arm.com>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	will@kernel.org,
	Ben Horgan <ben.horgan@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [RESEND PATCH 0/3] arm_mpam: resctrl: Fixes for v7.1-rc1
Date: Mon, 20 Apr 2026 15:05:13 +0100
Message-ID: <20260420140516.3892820-1-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070526_877516_EE6951E8 
X-CRM114-Status: UNSURE (   7.54  )
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

Hi Catalin,

This series is the collected fixes for MPAM series in arm64/for-next/core.

These fix a unmount->remount problem with the CDP emulation,
an uninitialised variable and a checker warning.

If its easier, there is a branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/v7.0-rc3

Thanks,

James


Ben Horgan (2):
  arm_mpam: resctrl: Fix the check for no monitor components found
  arm_mpam: resctrl: Make resctrl_mon_ctx_waiters static

Zeng Heng (1):
  arm_mpam: resctrl: Fix MBA CDP alloc_capable handling on unmount

 drivers/resctrl/mpam_resctrl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.53.0


