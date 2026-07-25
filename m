Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E51AC53209
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQzf8RiBgN+O3gd50facaIzP6MLPV8n/e+B6gKAL3FA=; b=lC2GJ+eidQRLQW5DYsbiVDygHi
	hoVQ7QuFceMSRL51rTUlOmt+q+HFX28t6aQJQmFVCfvOh15TocAJD5/8T4ZzGK6R1DmWNPCU75YF4
	H5KJgaHn+rCKDJmjD07b5mlL3BAr5QMaStarX84f9noTC2SvF6+SxhZ0ouLagsV75wr5J/p6oncKT
	K5J5rGnP+NnJOruEgyqlX4lqbZHs0xn/AO4I4qZ28X0l1/9LOGgpU/NDAOZjux18Jx7WiyOyti1C5
	yTj9Pyb3HS3vkO2AhhXE7PEmZOMKyawbrjuAvJM9FvIu7oCzfqO3QyZxQwF6rar77ymkPD7r3qJ1z
	bEHAJakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnahb-00000000Iqi-2K3s;
	Sat, 25 Jul 2026 11:37:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah8-00000000ITy-1O0D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED1D1477;
	Sat, 25 Jul 2026 04:37:24 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 59A573F86F;
	Sat, 25 Jul 2026 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979448; bh=YdkxqjB4sGtcddYJ+K7xs9/o1CvyPsVw/FOAq7Tmn5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Io06Vk+FegsvVhhgAeZ/NfkRCKqVwKTM3D8cKXxqnd7gMEc3/CUYTt6UlUxH9iF7t
	 CruruYBXHu8dOPzi6//T3fn/hvR939n+1qcfPBLPSzTDkZMNbPloRSrCefOBrmOv2X
	 9jeRgbFsgsj9ZEkE08Jr0rhDWnmos82p8wz7w1qk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 12/13] coresight: etm4x: remove redundant fields in etmv4_save_state
Date: Sat, 25 Jul 2026 12:36:44 +0100
Message-ID: <20260725113645.57519-13-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043730_549804_5E271372 
X-CRM114-Status: UNSURE (   6.99  )
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

Some of fields are redundant in etmv4_save_state and never used:

    ss_status => trcsscsr
    seq_state => trcseqstr
    cntr_val => trccntvr
    vinst_ctrl => trcvictlr

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 6819a6d728ac..f252da868b6d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1046,11 +1046,6 @@ struct etmv4_save_state {
 
 	u32	trcclaimset;
 
-	u32	cntr_val[ETMv4_MAX_CNTR];
-	u32	seq_state;
-	u32	vinst_ctrl;
-	u32	ss_status[ETM_MAX_SS_CMP];
-
 	u32	trcpdcr;
 };
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


