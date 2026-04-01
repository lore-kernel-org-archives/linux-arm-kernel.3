Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43410FCAC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wjiLmpsHzhxhB1kZGDlVpoiCKzq3RmIivSnNvbjXOg=; b=e1RAt/3PNsKVC/z6bYrJ14KFjZ
	fGV9y8jU6ciGzDL2wp2gfiNkQJtihEtq2vaHCuT8nue9HrX9n03Xc4B+jBrV/Oo9z1SHDeJ6z624z
	R11c9mBWACfqlMqOt5bnX9RLjURt5EJjjJeAiUQWKMq3gDgczHsi81Xm8P/COWJuXYTMZD8TMotpx
	/fn1vrT/MJXGKrtaDjnkT3ZGbzTwWulM8k7dxHZd55cDrqYUDRTiIb9Sd8F7k9sFyynhKHBfyxgv1
	Xc0kjOuLXCf5OX7b3XTcYsXBuQV/xf+sOZXcii5tFrsrtoklMbcQ0xA+Ou+C2yGoYor5B+n4iBhMh
	FCY7luHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxc-0000000FvCO-2dLJ;
	Wed, 01 Apr 2026 18:06:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxX-0000000Fv5i-43xG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5413516F2;
	Wed,  1 Apr 2026 11:06:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30A603F7D8;
	Wed,  1 Apr 2026 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066791; bh=RRSLezh9B83+WUajlPT99CB9OmgiFf92QChg30Ds/Gg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LjQys1R2O0U9Xm5PZS4Vooe1DSUirB2J7QPGF5tfl7QJYc6NjNYXeZPxIciHliW1u
	 Yxld9c/6nWA+UXQirg0DhMYshu8KqB899wvx/1AC3sYs8ebcqOCkQeGiQtXFRqiZFZ
	 rpAs+3Xx2sBXmXLVzO18hUWcqIdc6eJS1ogLdxWc=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:49 +0100
Subject: [PATCH v9 20/20] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-20-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=1191;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RRSLezh9B83+WUajlPT99CB9OmgiFf92QChg30Ds/Gg=;
 b=SWVGvVir+sxNdnAyOVmRvzWbTS+rVe392kshHUNYXP7+v+bHIy24lqiXpHacYvWkLiShqWGR1
 6w+V5Bw/RU7BsJ12TsNqFIXxi4hrZhAagtwFeSMCGDFQP34X5yLD5kM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_110633_581673_D805747E 
X-CRM114-Status: GOOD (  11.82  )
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

The current SysFS flow first enables the links and sink, then rolls back
to disable them if the source fails to enable. This failure can occur if
the associated CPU is offline, which causes the SMP call to fail.

Validate whether the associated CPU is online for a per-CPU tracer.  If
the CPU is offline, return -ENODEV and bail out.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 75dd8c9f78174b7e604fbad6e8735656a2d643a0..b79c0abfeb77ed6f8fa299f083e0b6c656e0e6c1 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -184,6 +184,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 

-- 
2.34.1


