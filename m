Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089B8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L837Yp8nav+KEOtcZreSnaQ5/uahsB7Tg/vSa/L0EGE=; b=YTotxEoMHxhqz1cjVXpJNhQnAU
	+Ram2bVzdLIGA8rXJuRXMRc7wrBGgbAssUCZBAJ4+RBmzlPR5zC6Zj+WAL5YVjmrqytq+ByrALO4c
	e8iBuJ71eAziusmRQo6ehB4FCKedvGk0OQFqRhEaUDJXfzW0COcyNnNEuXK32WxYX2O2/ETvYEd9h
	22Qr5vZrzkBsbdTTzLskYPw/NO8CpFHp7u/WdYe3LyNjOVBVi0CGoatQmNEBZSS/Y2AKakjU+FL1z
	etvMz/W6dwrdK3u5Y7wAZiy1pHvF2oI1xEiDBmSkejcsJ90fNHQIlluK0TWcMMpQIfZjgVdKWyekU
	jaxfnUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VZ-00000008jiO-0EXu;
	Wed, 12 Nov 2025 11:59:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VO-00000008jVX-162R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:59:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB9731595;
	Wed, 12 Nov 2025 03:59:09 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA8D03F5A1;
	Wed, 12 Nov 2025 03:59:15 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 11:58:46 +0000
Subject: [PATCH v7 10/11] coresight: etm4x: Retain sequencer state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm_coresight_power_management_fix-v7-10-33e0b6f995f7@arm.com>
References: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
In-Reply-To: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762948736; l=1115;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=W6IWLdrCPoM/4ElNNYQF3l5pRtiMI4xDguVMHWDD5SI=;
 b=W+x6V0jL42DsOZJDS5F5KOHuDy0zsl8hLsGAuhmxRy4zp+3V641rX6D8Xg7O3Fnoo4u+KWyMp
 uRd/DGk5G2VDCSzkQCrhYZPPGrq+7tetBHktO6szhhPO4/VU/AmUbx9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035919_789289_EC89A677 
X-CRM114-Status: UNSURE (   8.76  )
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

Retain sequencer state in the disable flow and will be restored in the
enable flow.

As a result, the flow will be reused by CPU suspend and resume in
sequential change.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 8b85a73e29f407a8d5e26a25f4dceaadaeed05ed..afee54ac0aec0c0e521fa1885a95f48555a369de 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1034,6 +1034,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
+	/* read back the sequencer state */
+	if (drvdata->nrseqstate)
+		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
+
 	coresight_disclaim_device_unlocked(csdev);
 	etm4_cs_lock(drvdata, csa);
 

-- 
2.34.1


