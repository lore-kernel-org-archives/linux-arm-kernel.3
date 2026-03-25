Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AA7109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZJRXnbLCVz6dJzFXkgDi11FOdfHGa2jZYJyvYQwUgk=; b=Id7DhTXn2tKJGunhaWndHMk3Ak
	yO+xZ8aZOXMdZuEZviKecjhE7Arm17qGKk3EgaQxthkSK8StXpBrVkKZGvB2OBZEB6ml/yjNz8a0/
	JDoJUHZVBqnzZW6Cwu+RjCHL0uyVuENPjETK7/0fS7BKb63JKzmynOPe+9VRcFkK5lpAqmxihHE06
	NsGnpqxY+TY7DmCsYoSh/zQZgV/Mt440Rt4IUxypVnMDtm1VC0fx1Ge21j6CmHHR2lJjZunvqXd5v
	ompG9t+Y1BE82Bg38ilaPULdSvd6X2cJ4qKtA10yg4+/fG1ehIvp+wwpzD2UKSi3zDQMoN2U1V9IA
	O/BY5Fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCn-00000003ZtD-3RHt;
	Wed, 25 Mar 2026 14:27:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCP-00000003Zb7-0em7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04BA1F02;
	Wed, 25 Mar 2026 07:27:01 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DF263F836;
	Wed, 25 Mar 2026 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448827; bh=mqBihA7IPH4veMo5kAJUdAS/pKAetfzFh2Pk4QTqefY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q2eYAnYRxflPiY/XkTnAtl+Y5qHQjfOj7tffoxcpGkC2/Rd7lLGLjVUiBa/9knacg
	 WfmQB5SmGXZFbsFY6e41+TtgNKuLcbxAgy9xz5YswkHGSd0hOB2QecSah+vjfMqYkV
	 L+9fRCxDdVifrQGQr3XVU/sfQz1k80Z6ArFCaGyo=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:41 +0000
Subject: [PATCH v8 04/23] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-4-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=1191;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mqBihA7IPH4veMo5kAJUdAS/pKAetfzFh2Pk4QTqefY=;
 b=hLVb3fGX1bTsevwwPgZXaJobpk+UFjDw5D/gAXqrEEotFlQ+RBeJRz9my9DFaZzHRu2mUI+4R
 SWoym6ZDdG3DDi/5gXHUNJuYhRiB/TOqDVCQRb2U8xZRS2TT/62G3Y5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072710_940371_A3601F50 
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
index 3b1e7152dd108408d837c404ce607ba511ca14a6..2546f3ef82f810fd04a119cecd2093b8150112b6 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -162,6 +162,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 

-- 
2.34.1


