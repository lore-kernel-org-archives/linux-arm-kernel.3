Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2842CCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XKST6V6AoYKvqZNg2pMASKcHCTNE4tNjTQl3SVYCMNo=; b=x/ry+YBKrkdYkykRQl/p5sVyeO
	3bul2nAcawoEu/nCCZxP2cFq4o3LfKxRcmqPOjYBGpu6Ogtl3lcr0bbAmw9CFiRwhitjCFr+vg5iP
	RJrI4Xt/K1xP9GStXNwOinZvGstlvGhZ//xSzLsGpNlg8cZgee4o2Kn3GBaUAM1eowrIYO063hsaF
	mL2jMJg4P9WOK9aWEmOStfzUv5Lt2WQ4eEHugZzbmRzaN1SSR20drWAkGiweEOHMSrgXUjEbGwVm1
	OyhHhso3FIN32nVDOLsuwM+nnF9ggEisH5WdagtAriOEt94IOaAkbCZxguAH3xQJ5CKy2Eszw0TFO
	bXTu1b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCzXM-0000000DWWW-0Y9o;
	Sat, 03 Oct 2026 13:12:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCzXI-0000000DWW6-2Dha
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 13:12:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57412143D;
	Sat,  3 Oct 2026 06:12:15 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A70EC3F86F;
	Sat,  3 Oct 2026 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791033138; bh=wbxrPLB9fCOw1n6c5eFrO4Kd6d5f++ievONKQB4qVls=;
	h=From:To:Cc:Subject:Date:From;
	b=tjgipNy9pJmz8WP0wTQ+Nj/RtPUSCVf3QAFllfWJUg+dmDQq5SEHQPAgFfjAX/rGn
	 z3Ang72K57KAtivMeSzk4OFnLTY5kVaJdTsHP/hBCOKrHKzSDEKZNGI8rQDuF9eUn5
	 DuBqoJzFU3dtrIMG9Gn6QyQURQCD6YEdI6NNZTHM=
From: Ben Horgan <ben.horgan@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ben.horgan@arm.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: [PATCH] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
Date: Sat,  3 Oct 2026 14:12:07 +0100
Message-ID: <20261003131208.2023223-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_061220_694506_5AF87A83 
X-CRM114-Status: GOOD (  10.51  )
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

In mpam_save_mbwu_state() the monitor values are read using __ris_msmon_read_locked()
which checks if the configuration provided matches that in the hardware and if
not then resets the monitor. To avoid resetting the monitor before reading the
value that needs saving only clear the configuration after the monitor is read.

Fixes: d056d29aefbe ("arm_mpam: Use __ris_msmon_read() for saving MBWU state")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
based on arm64 for-next/mpam
---
 drivers/resctrl/mpam_devices.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c32175426433..48adc49b833c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2052,9 +2052,6 @@ static int mpam_save_mbwu_state(void *arg)
 		if (ret)
 			return ret;
 		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
-		if (ret)
-			return ret;
-		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 		if (ret)
 			return ret;
 
@@ -2088,6 +2085,10 @@ static int mpam_save_mbwu_state(void *arg)
 			mbwu_state->correction = val;
 		}
 
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		if (ret)
+			return ret;
+
 		mpam_mon_sel_unlock(msc);
 	}
 
-- 
2.43.0


