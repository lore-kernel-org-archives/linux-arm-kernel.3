Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3755CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUWDFaCri7Zs4uVCYEBPnV78vtBPTzLh2LroZtn2w4w=; b=3ZV8QT2NoTM/Mv64TWvlfgPLRg
	TDexdT+L71cOXZbLXEw5Wc9FVgIsG7s3nDlo3jR13Rd9iSC8GwNRwdSenknDA0GKICTnOKS2FiIv9
	JeHVLVQTWjfp8PBcXhwcVf6cafqJXQO2jhzMe6vQEgPtQ2hqpB7jb9DGf625nH1fukznWbEr5o713
	3vQwxnm1a3LEvVRPUyYyQU4TSXHAFBvYKCKeqYA8MZjNn0DRv4LEFYflwWpccW2kdrQOaBavNMzo4
	yc6yAOGit/q56SyiBqUhdlmSrUOs5aclTQfcQBuSKh2tqkw0PfA0j8qqOIndLOEGLzzhJRLmVyQN0
	BUmndkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxki-0000000AImf-2OIO;
	Mon, 03 Nov 2025 16:49:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkf-0000000AIih-2xdy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:49:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C6A2BCC;
	Mon,  3 Nov 2025 08:49:45 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9391C3F694;
	Mon,  3 Nov 2025 08:49:51 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 03 Nov 2025 16:49:31 +0000
Subject: [PATCH v5 10/11] coresight: etm4x: Retain sequencer state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-arm_coresight_power_management_fix-v5-10-f803c19aa153@arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762188572; l=1066;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HhMtP4kH6TYEBX8B36lg8W38w0DH8uFclrERmuegzYs=;
 b=F++8vmvstPex3pmwm7XjNJ5Phpn7ymsq1Y4eyzkma+qvVP7CHpuJg9qYvdO0oL+WF1D6IY/id
 ozJDTV+U6lBA4/7SeyfRSD6rz0wDasIoxCFe8a7/ew3gC+4HKEhF6wo
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084953_784449_6FC7E7FA 
X-CRM114-Status: UNSURE (   8.74  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5101ac3885c7dec6aed397668a866b7cfe907d10..662492ddd296d9974406ddffad14e7ccb92edbae 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1027,6 +1027,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
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


