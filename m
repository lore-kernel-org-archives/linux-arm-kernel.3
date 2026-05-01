Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661DECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GOdrGvaYQpHrvy4sj7uaCIuubTb0EudLmpxx/tmN7U=; b=YkrIpoxxEEJ+jZaWvYzrnxyjd7
	czyBMQDf5FTVRMqsdFQ85ut1pxMaBSUQX004x5ZeuF4yL+YgVxHx8w2QudFWaZvMqOpo1LDksijs2
	b489wG8jiUV860lHXnIRMaFDLCXYlkgymQaRQy3riUt/nKnqUKOIs+barCQN17IFaDccX8yej4YRg
	4e7g8gRAWqXaKXPeapGJm7zl2fhBYL7a7v9H0Pho7kaMBB+fBI5nLJ/lKRn8Y8GIpdd/tx2KCwBiS
	bQFXXXWIi5Bpp/v0IdZjgW68CiWa7qx4D6I73nbma5kayIyLo5+RHpnzzX9+5Jz5kUGXdcOJYw04a
	0uTA4TGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2E-00000007QoY-40U4;
	Fri, 01 May 2026 16:48:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2C-00000007Qn2-1SNt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 285E1176A;
	Fri,  1 May 2026 09:48:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187F33F7B4;
	Fri,  1 May 2026 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654091; bh=sjQ93wBv5QF3D1busyGuR8Vm6LDuGcw42VRpRydtcSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNwsBPmXl9kyTcM4W7ESONA3JT9Y5MIj0AusvG0vnL9qREYj4Rvk9lVH2mS0IBYwp
	 M3oKCM9OX5qhBLT4wnYl9Xe5wh0x8ywd37aRU3uo31IuE1uoPNMz5HVGz/lDAefSaW
	 I+s6stoBpffRgcWdzGA/fW9B+jE0wea1vT1TYi7o=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:42 +0100
Subject: [PATCH v11 01/27] coresight: Handle helper enable failure properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-1-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=1225;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sjQ93wBv5QF3D1busyGuR8Vm6LDuGcw42VRpRydtcSE=;
 b=p5+Ybuof66Jx1g9nXMgq/PZZpE2rmPJXQgkWmrvALo0n1zVYDhW9B26zzmOPACTb8Abb75dVA
 uKPMNqQjRvTArjT6gxWRG1lVyNHFmiuOWBnaxBYMze3Kqvx7uQubhlj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094812_427243_17125B31 
X-CRM114-Status: GOOD (  11.32  )
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


