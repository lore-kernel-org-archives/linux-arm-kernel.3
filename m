Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10AEE66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1/JLZs0ffSrDShwVDN3whg+RJGCRiRBEqKpqiGYeiQ=; b=cuNDgnhAux8wLEI9LNk27SZVi0
	s4TE5TMmKFd53YKE2NDTKGvAtgcVEKdroVLh5BMx5BLBb0K5ssY2q2dms+lySWixI4i2qca+QTeT4
	Iln24DZuW6/MJ4Py7cCbGi/u8jpLeuKD1pInmlUMWbIHnMslFbzg+OxI89jVhJnRcAwVMMD7Dfvv0
	MIG5CDS1+loVErr6SKIGL5fGe9cbOet8Jmnv4LFiMF+M31Mua/YCDvavNSuOWzPa4X71onvyy4SCY
	sW3ZuLlgTC9Sd3dGzorFFxhZgaBUiq4lw13mTBiM+2IM5hbWLQw9pgGp85bAmHbRMwb3dOCmyg7j/
	A1Okv4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexW-0000000Akr2-09ux;
	Fri, 19 Dec 2025 18:12:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexT-0000000AkpX-1P9T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:12:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 484FA106F;
	Fri, 19 Dec 2025 10:11:59 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFCF63F5CA;
	Fri, 19 Dec 2025 10:12:01 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 01/45] arm_mpam: Stop using uninitialized variables in __ris_msmon_read()
Date: Fri, 19 Dec 2025 18:11:03 +0000
Message-ID: <20251219181147.3404071-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101207_416000_63B64EA3 
X-CRM114-Status: GOOD (  10.77  )
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

Dan has reported two uses of uninitialized variables in __ris_msmon_read().
If an unknown monitor type is encountered then the local variable, now, is
used uninitialized. Fix this by returning early on error. If a non-mbwu
monitor is being read then the local variable, overflow, is not initialized
but still read. Initialize it to false as overflow is not relevant for csu
monitors.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202512091519.RBwiJcSq-lkp@intel.com/
Closes: https://lore.kernel.org/r/202512100547.N7QPYgfb-lkp@intel.com/
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0b5b158e1aaf..b495d5291868 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1072,7 +1072,7 @@ static void __ris_msmon_read(void *arg)
 	u64 now;
 	bool nrdy = false;
 	bool config_mismatch;
-	bool overflow;
+	bool overflow = false;
 	struct mon_read *m = arg;
 	struct mon_cfg *ctx = m->ctx;
 	bool reset_on_next_read = false;
@@ -1176,10 +1176,11 @@ static void __ris_msmon_read(void *arg)
 	}
 	mpam_mon_sel_unlock(msc);
 
-	if (nrdy) {
+	if (nrdy)
 		m->err = -EBUSY;
+
+	if (m->err)
 		return;
-	}
 
 	*m->val += now;
 }
-- 
2.43.0


