Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58A7CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+mK8/6ipbQeWy92MO7zB2Q3VTy73XFWLLsSDeyQjfk=; b=pxflp4VTOqXFO9h2Hru7cJqKpi
	VqmxRTWWE4epLGa0jfQ+ue3ZoQAhQ95tGxUzNVLlZ6Zr+FuPtmHFa7QlMcJNgh29nRenraoDGzIKw
	+6I14Xd+cGtvNeNPWiqjHGl3PheeTQ9kr3HU5trIWHqLwPUvwWSgLYRf3sp1o+RFwfS/Jf4y0e5I3
	qJiuaSL/4wY3GEKehWkFMBNVRjEzrRhUNpIATXAcshlv37S7kTW11cWxwhKjiSf3q5lx6HX/RHgxD
	LZIdJHqDLGadjZBUQcamQX8KjvTJ+p+jCwt8y7uztC8eiL5lgZd+xiQfh+8rb6+Y7KbH8hJfs32y6
	q5cVHdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypo-00000009Ibk-3Hix;
	Fri, 15 May 2026 20:08:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypi-00000009IZd-49sF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:08:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23C9C35E2;
	Fri, 15 May 2026 13:08:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D6653F836;
	Fri, 15 May 2026 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875710; bh=aOsH1YCn+EwL0qAEi8vE3nZ4UoXCREiMhOSX0+t9ZU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EI1ytdKUfYkuDt0XafV5qmTScOrxL+kPdp3drBQ8wjkZjBaRMptnzl1+yS8bwZoZh
	 Str3b5+5kD/hK9QNvV8FEKln6tR0JzTJ1jEdGltU96/XRg9+unfguOqiY/ht+tkQlO
	 9L1fEXAXJOzWmAh+NPTnN8DdisMp2rCf/Hk8CXyo=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:09 +0100
Subject: [PATCH v14 02/28] coresight: Handle helper enable failure properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-2-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=1420;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=aOsH1YCn+EwL0qAEi8vE3nZ4UoXCREiMhOSX0+t9ZU0=;
 b=tgwxW2zLt4q0gTulElLzl+ZxwwHh0Qeuc7OpUO3aHXYKYc04ujFDgQYsQa8muuoKIPMdZY+YB
 IPCiH5AaWJVApKXqEzrySOlMCRYbgo1TrAr8o6Ac5Dgrvo30+JHNpBW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130831_096400_1C5D75A7 
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


