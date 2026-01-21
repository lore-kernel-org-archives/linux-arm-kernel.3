Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A44C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joWREewfpnlp1dObxxpfeaRY0yPm74sAct58CXfc0RY=; b=ZIbk23MTioJ8zC3Y9HPjPT7dq1
	9yLb/uXFqCogRxInsw/+0MD9oSs3jtfy7E8zKSicxjI6SfHc+IDZSqmj1Hh6aVZn56nFcZ0IXSlM6
	vYy3UsOaQ0QHMLnDE4z816nMEYsEMowY1lPRGOhMgmHIyJmOQk8C95LB10xsS8foyHnH9SsCRVGVJ
	Qbss/ptdYQNuiEaGjxqv54u4QMKabm+/9v5W/yFrQFFmCRDTFyK5+mNqdNNxL1kEgiD8p4Xm+Q0Q1
	J7h+KLsAxaYiCZbbNxaXBX9gygqZzsPM3usB/4Fq0PvjNaI9IEiLM3olm3ZH1LTtYVEGhCshWZheo
	OHZlF4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFp-00000005FoZ-3Scy;
	Wed, 21 Jan 2026 10:16:01 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFh-00000005FkM-2EhI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:15:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=joWREewfpnlp1dObxxpfeaRY0yPm74sAct58CXfc0RY=;
	b=P6ltT9nvrd2j1J8exCB9iVDM3LbBMxEdwS0e4afo6oXptc9V5KJaKSkl7Dvnj1zUxl+Zb7cPy
	wP2Fs8udpzQ6+QtOncveHkjF1j9CZe/AEE+rlUfN4iWomGdd2WKi7Ae2kZsF9Aizo6ldmM3m9Gb
	dWdBSg6NBLO1VZR9p+zBaFI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dx0P10K8XzRhQm;
	Wed, 21 Jan 2026 18:12:21 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E7BB4056B;
	Wed, 21 Jan 2026 18:15:45 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Jan 2026 18:15:44 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 21 Jan 2026 18:15:44 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@h-partners.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v5 1/3] coresight: tmc: Add missing doc including reading and etr_mode of struct tmc_drvdata
Date: Wed, 21 Jan 2026 18:15:41 +0800
Message-ID: <20260121101543.2017014-2-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260121101543.2017014-1-wangyushan12@huawei.com>
References: <20260121101543.2017014-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_021554_039315_42289062 
X-CRM114-Status: GOOD (  11.47  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

tmc_drvdata::reading is used to indicate whether a reading process
is performed through /dev/xyz.tmc.
tmc_drvdata::etr_mode is used to store the Coresight TMC-ETR buffer
mode selected by the user.
Document them.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Junhao He <hejunhao3@h-partners.com>
---
 drivers/hwtracing/coresight/coresight-tmc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95473d131032..319a354ede9f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,7 @@ struct tmc_resrv_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
+ * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
@@ -233,6 +234,7 @@ struct tmc_resrv_buf {
  * @trigger_cntr: amount of words to store after a trigger.
  * @etr_caps:	Bitmask of capabilities of the TMC ETR, inferred from the
  *		device configuration register (DEVID)
+ * @etr_mode:	User preferred mode of the ETR device, default auto mode.
  * @idr:	Holds etr_bufs allocated for this ETR.
  * @idr_mutex:	Access serialisation for idr.
  * @sysfs_buf:	SYSFS buffer for ETR.
-- 
2.33.0


