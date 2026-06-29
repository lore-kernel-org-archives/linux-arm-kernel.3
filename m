Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10869C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSiOcgfpOSMu8UFvhBuKKOq/uypVHsOZB3dmdjCVm0w=; b=fVnux8RWl+ZoeDxef+LnISlIhT
	pUsS7/fpRvfvRz+T85pZI2gqj8dnXzRRqzE2i5uWDc0vhZyBdUMLSKz6fHctw7/6d6Af10Pop3Pjo
	jSsV2GLMaFPmhmdbxZ06MB6tmCJbQnv/QGE/AGejFA4kQlcq5mz90evF6Ig6qqWYEczr2gH8Zz9PE
	v6mkrB+dfELoWPmYPYjYkyv0cOdcFulgDylGWYlYo1pq+3B89Vmk2KyJ6Dm0Vr9Jc+rfznbZhloZ5
	D+l/tKddU6PlFxjQNhM7YapTlrVSUjMBX9Q+KiQPC/kPlIjR8m0PDjWqIllPMUw5kjsxmWRyc0yS3
	D5HwoCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qu-0000000E4ui-45ZO;
	Mon, 29 Jun 2026 09:00:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qr-0000000E4rb-178i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C6651758;
	Mon, 29 Jun 2026 02:00:19 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC253F836;
	Mon, 29 Jun 2026 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723623; bh=2qg0ZAIRtG0i4KIe1G7FxJQFwNrU8UtT76IR9uO4b+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iy4NS85aHlB0AG/+cCEymY0SXiD4ymUnjfkth5YI3qpSsDgrLL95gTJa4SjRGXvzm
	 CKEhzYSul3pNCFweljq7Jz9NbiOZpAsiG4XKWX+taWf6bje4xpVWjpXokdksWpsCUs
	 QNIKQ+GM2F7K0Fg7VfhLQGyMuMxMmo/wsQRgbVRQ=
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
Subject: [PATCH v8 06/13] coresight: etm4x: remove redundant fields in etmv4_save_state
Date: Mon, 29 Jun 2026 09:59:59 +0100
Message-ID: <20260629090007.1718746-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020025_351042_C62D8A94 
X-CRM114-Status: UNSURE (   7.51  )
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
index 43f878dc8748..c0f7da17a186 100644
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


