Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A97CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZRHQFRokufdGrWZ4lWi8seN/B9bSL/c7ritp31RjMM=; b=QrAXaW1upOnkYVZpDF+OTfWEA0
	Cmv1Z1jADHNhSlr9TxjiA3FOZsYgiMsv8FZoyFzp+s+FGve8xSUucvhS5g43ZXtefMZjbi9jIAkN3
	zY9AdT3KurEHB+lfKgcpyCDr1HQBjoTg7knovgAtSWoKwBY2MfibJuhNfD37aweTg/EjoETtDclqy
	vic8gWIduRbjb1zoQTXgPQ5Koz/kRjubXcgrH65Ldg7okj5OrGkdwogfaBn6eY8gLGe7Hl5G4DzYP
	av/v9IYY/xmtVf3pHuWZn9gKtPlYuDzG1AuXts6XEuO69iTKzGAKVKaXD32+WG8Pu5jfO+Os41X1P
	Cg59A+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXb-0000000DEmV-3aBG;
	Mon, 11 May 2026 11:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXX-0000000DEjs-0qAz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B29F1756;
	Mon, 11 May 2026 04:11:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C1D3F85F;
	Mon, 11 May 2026 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497869; bh=1Mps6nkOloLSoMFVcCCo14xdqLQ8Jy8K9ToZPos+NWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L1i1sZL+XsHxCWAIrDVT/onnZiobjLQFCSYHfF8YAz8YuxW7DVOwZIYq1eFcS3l+/
	 6XiJvC68uwN9oAR7vSvHrDQkIZGJQcF3FtPbN/o+dkmoIRS34hYxZbZvkgK9dhXjri
	 Jwo653FstsmYtM/DrHKcmL7cxFI2nzQXf4//FwE8=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:46 +0100
Subject: [PATCH v12 02/28] coresight: Handle helper enable failure properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-2-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=1420;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=1Mps6nkOloLSoMFVcCCo14xdqLQ8Jy8K9ToZPos+NWs=;
 b=I3L11cd9T2KAwSaHVbFcT3LLVvdZ+BN93Bhf6iIhjYCx5v3oCjO9fS/Y0bZPJq/2UkSj8GMHc
 rlxa6Adbk2hDotVWFW+BxxVOdu5R5z8y/e5wTc4f8sN/V687jbpNPbX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041111_335574_C2858C08 
X-CRM114-Status: GOOD (  10.85  )
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

If a helper fails to be enabled, unwind any helpers that were already
enabled earlier in the loop. This avoids leaving partially enabled
helpers behind.

Fixes: 6148652807ba ("coresight: Enable and disable helper devices adjacent to the path")
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf64a97b9353b84ba5b76b991676f5f..ed17c36ad46ac4270abdfdf2a1a742faa6273097 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -499,10 +499,19 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 
 		ret = coresight_enable_helper(helper, mode, path);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	return 0;
+
+err:
+	while (i--) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (helper && coresight_is_helper(helper))
+			coresight_disable_helper(helper, path);
+	}
+
+	return ret;
 }
 
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)

-- 
2.34.1


