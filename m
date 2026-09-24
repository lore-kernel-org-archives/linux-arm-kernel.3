Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB279C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUSFRiTiIuOVsS4T4RSRiweNyaSGr79vKNDZel032k8=; b=rYbTXK/ZOeFECUtkLA+ayaAgPC
	l3KHIgnZzCNIlswTveohPrO30DzPpKEh8OYdP8q2zwWmJ02GdXv5kQs3dS56vjPcCGXRFzIWySafZ
	6vmjQ5wBBUls9PIEstCvAtDZnzyeiHRVCnQ7Jqm88pK66SUzkBY1jXwxgDbuPBDA37WbGvuGIeoLr
	j1s6WuV2Ng9mQIE3+c9aoMcrOQc0W4wC3j9/HivXtfPl/GQnSd290OA5GFgANH24GP+Lo6/EAQ+g+
	DElTd+hCGFpz+D3K8cwmiQdLCkeJUI357R0z46ZQ8bgxcishkIUusPm2nWzgbgPy2hZ8OpCj/Q05y
	4Fex5HvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNq-0000000BPMl-470u;
	Thu, 24 Sep 2026 15:29:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNW-0000000BP6E-3sta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A599A1D14;
	Thu, 24 Sep 2026 08:28:50 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.8.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 453173FAB1;
	Thu, 24 Sep 2026 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790263734; bh=tV3gLmdj46JrcPvGnrYdoLxgsZp2pmyHv+oxJsoBQ+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDOS9g46BRU8apeGek0JhfberlQKhWqYvaFTZwJeasB7aACnRBbRDvKfLnRdacIvS
	 FZCRZKDsHwE5e40pup3CBzUaqYqlrrPQShmUnnaWheX324e/iO5yeE9IMlOuSKfoDL
	 fxoRfVgHvKCjSBWJe/7CXh57QsGh0ZoaC41r9kdM=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 08/13] arm_mpam: propagate MSC access errors for interrupt control
Date: Thu, 24 Sep 2026 17:27:34 +0200
Message-ID: <20260924152739.2865510-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924152739.2865510-1-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082855_119614_45E9E360 
X-CRM114-Status: GOOD (  13.18  )
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

Allow the functions dealing with interrupt registration and enablement
to check for and return errors, and propagate MSC read and write errors
from the lower level up.
This does not cover the IRQ handler yet, as this needs some more
attention.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 558efab75f911..eb26c25b9f970 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1105,7 +1105,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	}
 
 	/* Clear any stale errors */
-	mpam_msc_clear_esr(msc);
+	ret = mpam_msc_clear_esr(msc);
+	if (ret)
+		return ret;
 
 	spin_lock(&partid_max_lock);
 	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
@@ -2668,9 +2670,7 @@ static int mpam_enable_msc_ecr(void *_msc)
 {
 	struct mpam_msc *msc = _msc;
 
-	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
-
-	return 0;
+	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
 }
 
 /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
@@ -2678,9 +2678,7 @@ static int mpam_disable_msc_ecr(void *_msc)
 {
 	struct mpam_msc *msc = _msc;
 
-	__mpam_write_reg(msc, MPAMF_ECR, 0);
-
-	return 0;
+	return __mpam_write_reg(msc, MPAMF_ECR, 0);
 }
 
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
@@ -2777,11 +2775,13 @@ static int mpam_register_irqs(void)
 				return err;
 		}
 
-		mutex_lock(&msc->error_irq_lock);
-		msc->error_irq_req = true;
-		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
-		msc->error_irq_hw_enabled = true;
-		mutex_unlock(&msc->error_irq_lock);
+		scoped_guard(mutex, &msc->error_irq_lock) {
+			msc->error_irq_req = true;
+			err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+			if (err)
+				return err;
+			msc->error_irq_hw_enabled = true;
+		}
 	}
 
 	return 0;
@@ -2800,10 +2800,10 @@ static void mpam_unregister_irqs(void)
 		if (irq <= 0)
 			continue;
 
-		mutex_lock(&msc->error_irq_lock);
+		guard(mutex)(&msc->error_irq_lock);
 		if (msc->error_irq_hw_enabled) {
-			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
-			msc->error_irq_hw_enabled = false;
+			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
+				msc->error_irq_hw_enabled = false;
 		}
 
 		if (msc->error_irq_req) {
@@ -2815,7 +2815,6 @@ static void mpam_unregister_irqs(void)
 			}
 			msc->error_irq_req = false;
 		}
-		mutex_unlock(&msc->error_irq_lock);
 	}
 }
 
-- 
2.43.0


