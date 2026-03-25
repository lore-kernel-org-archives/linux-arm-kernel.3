Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C8E109C024
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ujh6aIn23gcCC8Mi403gm25jM6gaXFqB6pMK6t5v34=; b=NXrPtMDpupf4Re85G58zkhPyCr
	BUSfBaVDz9Pb8H2EhIpvDfEfXu5pioA4nJ4gs7q9SoDM/WSMZFuaZA6Ayzx3tYQGE2Ax7zEIacocj
	tS5m9Yuzc0wJEnbVhfZ0gSB5UIr4QxdTq2zu3HMOFqWoLBKVEDX1yLlzZtg0Pf5sFwBcW9vN4W4CV
	9uxK8ShqsmqXhD9cxkw3Ip5oKBU/SZyYN4tzn9EQe9ellB+iqL0PbFqZjyynrbRznscf9tBatUrX/
	FqBUVYpmDcVPG+idnLwks6l/0Rz23z0NAn7spvSplrmrDMUsjiachb67UXl/4o9a620I7/7RK7NPi
	2igVIVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PDl-00000003ajz-1Gxt;
	Wed, 25 Mar 2026 14:28:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCw-00000003a5k-2eJ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3C511F91;
	Wed, 25 Mar 2026 07:27:34 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F218C3F836;
	Wed, 25 Mar 2026 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448860; bh=kIorGxJCJK+nBNAcQJ139wVZ7d6yktFsLw9iK+3dn2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rVlCguC4Hp/oBYem9docGgdQ/qDhz2SGeY3PhlKZ8zm24XSOa/m64h7zsei1bS7VR
	 IxSCp5XVT1iB62kI2eL/OFByhIw1P5weY3LnIopBzG7SPsQ7hp7h1EAU2qsETY5JFZ
	 eunAmO4MoqjuXDe0xn9vyPGS0APWRoUA2xJcD02U=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:56 +0000
Subject: [PATCH v8 19/23] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-19-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=2272;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kIorGxJCJK+nBNAcQJ139wVZ7d6yktFsLw9iK+3dn2c=;
 b=ue9w6dskn5WM6m1qimuA2PPeS3wYDhSzFqQ2vWVwkaff981YPUgqSc558l+BCp6NahpuH7kDz
 fZOW9Q9Yj6pByrjmHROPnyeyQdlOPLTBafnpX/ed9CEMuRWN//W31HM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072742_848080_C9027B6F 
X-CRM114-Status: GOOD (  12.07  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.

This commit registers save and restore callbacks for the sink via the PM
notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5060ccbc8f4c82eb14ec081ec05709391a585a11..6b18a278f44f3b45d083db15ab09f2eae1c69a0f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1816,11 +1816,17 @@ static bool coresight_pm_is_needed(struct coresight_path *path)
 
 static int coresight_pm_device_save(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
+		return 0;
+
 	return coresight_ops(csdev)->pm_save_disable(csdev);
 }
 
 static void coresight_pm_device_restore(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
+		return;
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
@@ -1840,7 +1846,17 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	ret = coresight_pm_device_save(coresight_get_sink(path));
+	if (ret)
+		goto failed_out;
+
 	return 0;
+
+failed_out:
+	coresight_enable_path_from_to(path, coresight_get_mode(source),
+				      from, to);
+	coresight_pm_device_restore(source);
+	return ret;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
@@ -1848,6 +1864,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	struct coresight_device *source;
 	struct coresight_node *from, *to;
 
+	coresight_pm_device_restore(coresight_get_sink(path));
+
 	source = coresight_get_source(path);
 	from = coresight_path_first_node(path);
 	/* Up to the node before sink to avoid latency */

-- 
2.34.1


