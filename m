Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D018BF9EDCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mD74Ej96t2uBO2TUtEeJqPeUnCuNCsmEVoJjnuBGI0=; b=RDVRW3N1tXLfYfu5NVznkQLS3c
	/6E9z73vhwkkjnlVOlpNU7l5iXn+hVwWXQBFGnkAbe2DkAgDXRGQbE18ux0j2/MXw4pg6Hrz0q8e3
	aF3Cl+WVVtHq5LEvf92OruXv5PQr8zSDWXLJparLZoSZzDvBs0BxmQOJzdG4RIE4U9MB5DLHfzlwr
	4fxt4ISgFRDA6xxtPMvLw099Lrn//RByH5jHWydpqpG3IrQRPeykJ17VF1tszA+3d3CdJ5NvoquZv
	GSJyxMJMaEzdeYiMQJrhLSQOmDfzLGOZOb6sgVsuHnTMZvLyzOvlQiPCV3AF9G7u7155u47yM/VhO
	tEZeILQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXX9-0000000AHfV-3T54;
	Wed, 22 Apr 2026 13:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXX2-0000000AHbB-1W3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C7D22D9;
	Wed, 22 Apr 2026 06:22:13 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A5E13FD46;
	Wed, 22 Apr 2026 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864139; bh=X01ed4k3PHzDYtMJjARAAYLGMZkKCWwfxP7Tm71CLAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMQ4ur3JzlnI49kjv2VIu9lx9KUqRXII++sfhHRFb/HjhRgPQRl4aC2LO16DO6Dts
	 Y2Uba6sIJ9gYPRNts21g4rmHRR48lbyTQBNXbq4gk1VBG0crCOmpvgPjr6VK4F7be+
	 DPSWqw7NiyqKGS4e/OyzMwMYs/sjqzMhVNRnbOK4=
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
Subject: [PATCH v6 05/13] coresight: etm4x: remove redundant fields in etmv4_save_state
Date: Wed, 22 Apr 2026 14:21:55 +0100
Message-Id: <20260422132203.977549-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062220_443495_1EC7F662 
X-CRM114-Status: UNSURE (   7.44  )
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
index dcd4ca143f83..bfd5e544f68d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1045,11 +1045,6 @@ struct etmv4_save_state {
 
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


