Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCA7F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ZHJP/A60zJKe256ZUwKM2cRIuCnPxF4YWt0rzRdgE=; b=R4kJbYhU/DxHcYu1mh/qtSTlN2
	pNM8ig3XxJMj71at7YwHROubNO/MofM3/GROYzkHQTGVMvwreFto1C5oQE2NUi/Q6i0M+jdAYpnf6
	uPbRHZHLbL/FVArjDezmaLVbmfOQTLRrJfBQVq6mMLYgFqlH2KYU/YaOJ0UyM23HpoR8jTJZDI58c
	dCgID4pjGnd4p81WQE9cQXLHEJ/kovHzGcpbeH2bnvh1LfMZM/14gRJHqXLQrYzboSlHWzPoObkxI
	UcO1GOMf4C4F99LC20cn5//WCaYt+nSmX8waFOPMbBhN23XppI+Hyb2FFo+iYxnI3BfnJqPwchUQC
	5ROBcnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wl-00000001PYS-140A;
	Wed, 15 Apr 2026 16:55:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wj-00000001PTL-0k1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5F7432D1;
	Wed, 15 Apr 2026 09:55:37 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4D63F7D8;
	Wed, 15 Apr 2026 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272143; bh=NHwM0SSeOIcKoFO7iDJI3DKim2DPDP/5ZwxvxWPLe1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TmAxFcdB+P3a4uekx96c/ifwiqQWVQI2M0Zg3M0ConrrRPC9l/WzdpgLcoEqlR8IK
	 rceVji5Vf4loaVM5Q1h4MtTRo5KfFvTEU5I59GAEA/izQzfot31vAri8tTEajHCWd1
	 ZNSOZZoY/P2g2YOfbQmlH6LIvbhNxTeryTx/qpwU=
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
Subject: [PATCH v5 05/12] coresight: etm4x: remove redundant fields in etmv4_save_state
Date: Wed, 15 Apr 2026 17:55:21 +0100
Message-Id: <20260415165528.3369607-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095545_260445_22535EDC 
X-CRM114-Status: UNSURE (   7.09  )
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

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index db56c4414873..cbd8890d166a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1047,11 +1047,6 @@ struct etmv4_save_state {
 
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


