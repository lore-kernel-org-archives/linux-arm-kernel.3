Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6242BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+mK8/6ipbQeWy92MO7zB2Q3VTy73XFWLLsSDeyQjfk=; b=HYR3v/wQlGuAEkixkYlM9kG2SP
	/U7pzTpiHLxahr55BFhSI1fKlSBosZagInbrWFuNLViNrR7k6KJnI0xHuDYey1yAPMXBVYRLou0cK
	fEw4gO6RnmvtfAlIw2x80MYiIerzWns1LYpdLfGIyH35kll0x/EI+BGpoJiW5mDN1Hh2bbaKniO27
	WwOOwD7g1HNhu8zSUwaUTMmDnm/Ho1PgIUFAhLm8CS+YasN5PfmzESnmq2wjwuzEanxqJ/0bS4N/n
	4/1QzPvAXKmZ6X+88kzrBmOKBXDbJeCmFjmSkoClZB+iMBByXi49NxCyaDnGGPbDWszPIeG4EmTpI
	6HukV2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdZ-000000097jK-2jkn;
	Fri, 15 May 2026 18:51:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdV-000000097hP-0FQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:51:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A4027D3;
	Fri, 15 May 2026 11:51:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 350353F836;
	Fri, 15 May 2026 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871107; bh=aOsH1YCn+EwL0qAEi8vE3nZ4UoXCREiMhOSX0+t9ZU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MsD2+jDwVDEpoTLJyj2K5jRfFfjGrzvmcRVv8W6BDcVYHsZRJwFmKdvcAX4DeayTf
	 L1ZY5obYtJCLQ20QGXNn2Xljy6LfuUoDyvjS0SuhlgUUrE5j1Gja/7a27iOJ3cIxhz
	 +oIW3/5Z9OkO2XXxuLYrvzYey5L1lETUwdGghvBA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:25 +0100
Subject: [PATCH v13 02/28] coresight: Handle helper enable failure properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-2-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=1420;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=aOsH1YCn+EwL0qAEi8vE3nZ4UoXCREiMhOSX0+t9ZU0=;
 b=tzjX3L0k3CaYScTR4x460YTz3+vQvd83sZBtlftSgID37KsicNg6DIuHxrMRNEdgzTwF1HLO5
 JZSBXAHCkxIAgv5Kt9cfb0kXbC87n7WJDYkJpHuT5abmFGEMfysnSci
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115149_168516_C29BDE09 
X-CRM114-Status: GOOD (  11.00  )
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
index 2105bb8139407bb579ed2517c1eecccda0a9c2d7..256f6a32621b8e086d02427317e5d35d0f29a3c9 100644
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


