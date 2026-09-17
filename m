Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE62C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wnvBX07OjkCNF4OPfGNDWOjgqUpg5VE5AzX8R8Qifw=; b=Xtn9Oen4lEh8HydO4fftc05esb
	+yaiMdvA2ZpAAhxnboxIlJIYTdmvGcHPfOUuZzQZ1ZCVDJZ8zeiggVh5XvswbuUnY6OHScjo9YyOV
	6253EVUpN7zQ44K6u2SZwC/ns6D//Py8mmsT/6D5DRTBdgULOgnnGCZqw65QqXD+4br4yXUmNWiVg
	x3awMGX+RGue/cTC8XVVuAIpCPLad/DRAJ2hCubHfjuMEk5zaQjM7kmxjBwBs2V1w8/o7h+fSU7Sg
	JtIds8DEXqn0NQmn6+U+6JEcRF+bgERDyENLkfYdPdIFM1YRK8Q62pC0hGh9kslbK6Uy6PTIBCLe7
	4bTNh/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXd-0000000BbDa-0G9k;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXM-0000000Bb5F-0GYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D123E1F02;
	Thu, 17 Sep 2026 07:56:26 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06B663F86F;
	Thu, 17 Sep 2026 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656990; bh=EQBvkZtIHffAkr5/QWRSIbFbmywWBucVousASbKrX8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOkCjQnPBTnLED+Ju1Wsd5Ys3DpvforX8qQNzjUaaf+/HOyzl34vFEwDPh1tvVFmT
	 JGHngIm/imqQGLAj1jcWRbDMrIHUceHZuze7jHzq8LHA2I3uzV19KzIruXBXczz6xj
	 hgeHtuXflkeAe9klb8QfQiHRm9lNl+uX8LO7J0JA=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
Date: Thu, 17 Sep 2026 15:56:07 +0100
Message-ID: <20260917145617.2202986-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075632_160245_D055CEBB 
X-CRM114-Status: GOOD (  11.30  )
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

When all the associated CPUs to an MSC are offline, possibly caused by
PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
lost. Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
associated CPU becomes online and the power supply to the MSC is recovered.

Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
of the MSC becomes online.

Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:
Update the commit message (Gavin)
---
 drivers/resctrl/mpam_devices.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 580d7ed38569..32bde94dfbc3 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1856,8 +1856,14 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0)
+		if (atomic_fetch_inc(&msc->online_refs) == 0) {
+			mutex_lock(&msc->error_irq_lock);
+			if (msc->error_irq_hw_enabled)
+				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+			mutex_unlock(&msc->error_irq_lock);
+
 			mpam_reprogram_msc(msc);
+		}
 	}
 
 	if (mpam_resctrl_enabled)
-- 
2.43.0


