Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCABCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T9UH1l1Q412e6NuHP9xbWiH9cIqvVZquUWupDIYMcs=; b=vToPh+5L8r0u2exB8JgBeIndV3
	zks1DPRbnaJMDVOGVBFhmMQXZly0glZ4T8AAeTaO3Mr5gWRxmeRx+PTmc7e5CtxK8IzJjBd6QKj1V
	n3ERLWhzwSgb16lI48UAk6XkHMm58SJp7eeFxKeeCpOm9jAzU9R2cWGwPt4lZc2TT+gVDw865XusI
	+grY/VD2VfmbIbRdxPMhPhlt8//VuPumcyg/65H/YP8vzg870e95dSN7dqo5/veW1Ztv9EruMAcfW
	6t3TdV8syjLsw3SmP+h03LYK7cf2VpHWcLMNZZu2SbUqaVqhYjiKcNBrUsyOxg/rJHB8DcA+H0mpM
	ETL0TnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgP-000000026ks-1Fzr;
	Tue, 19 May 2026 15:48:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgM-000000026iT-2AF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF042680;
	Tue, 19 May 2026 08:48:28 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 727723F632;
	Tue, 19 May 2026 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205713; bh=vX3JmO3SJIFctXhdvOOkOfW7530zyJ0jVVbzmNE22GE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MYzI0Y8b7wFm7U6/PKdXWT5FzZYEtR6KtV/XIvLFDcwHYynAkFQF8zzogMHnDLSac
	 4MGYb494d2Sot1NCSxfk7KCOU1LZeyfuBi6w2FfT5yp0qs5+AyipwqixqkkwBqKdAn
	 EGLcH72kyFsJoe4o8ixoXkXXM6at0ZCWvDC44sF4=
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
Subject: [PATCH v7 06/13] coresight: etm4x: remove redundant fields in etmv4_save_state
Date: Tue, 19 May 2026 16:48:05 +0100
Message-Id: <20260519154812.254884-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519154812.254884-1-yeoreum.yun@arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084834_598321_403113AC 
X-CRM114-Status: UNSURE (   7.31  )
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
index 43db1eb6f8cd..cdeb2140735d 100644
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


