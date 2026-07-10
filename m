Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A750FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrRk8ixcS2uB08UZC18Yy1mPJIaEGGMd+zavTq66JRE=; b=ISS+itgdWfpjtKagiLE7C1Ea/4
	lTa8bK/ef+zUGcPx8AXFmROpc7tIdp5sI6I0KZShubAOVmN/T4UedE1y63XtxBrwgHq8l46xREHNl
	8uQoYiI+3yLnCsutCm2Be0frfrq3L/JidXImQiObJ9vjLtsgfwXvf3Iwp/E96UDJMAApz2mdYbC7z
	7JNTpmEznW4fxmMT6apWfcDQ83PQpusxFR0nsi0+bCN3fb63wSG7gkaJyv6izYt7WkO8ynNMFIAB1
	HnRsLd5Va/1HO1EyBWfCns5nbFRuSMdqWUz5udKa1f7Wp+nqgFsn1jr8rRnrnvL1d3zLZS3lIQASW
	/rm74eag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pr-00000004rm6-2KqF;
	Fri, 10 Jul 2026 11:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9po-00000004rkY-1SrH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300B41EDB;
	Fri, 10 Jul 2026 04:55:55 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37A303F85F;
	Fri, 10 Jul 2026 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684559; bh=SlCJb0uWu0DEr3QM93tT1sdbU1p/RwbZ5S8JPpGqyHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cw0yDahNS7oeq2YpWsmK3uNqEQwPr3AobLCARV7JGEWc78oUNn0XdPo6PgbFopoej
	 P8ZoEx2s859a2jYCRJysaqKDC/LUHt5BIBqK59qL010tl/3EqbqAP20zO4fouIMztc
	 OQLiZE/XKJiLdKG6zMFq0MjevMuxmSmK1mlfFkNE=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 02/11] arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
Date: Fri, 10 Jul 2026 12:55:36 +0100
Message-ID: <20260710115546.29644-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045600_433747_6FC47464 
X-CRM114-Status: GOOD (  11.11  )
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

When all CPUs affine to an MSC are offline the MSC may lose register state
which the driver then restores when an affine CPU comes back online. The
error interrupt enable, MPAMF_ECR.INTEN, is missed.

Restore MPAMF_ECR at CPU online.

Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 82966ca2a631..acfa9a4dc2fc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1852,8 +1852,14 @@ static int mpam_cpu_online(unsigned int cpu)
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


