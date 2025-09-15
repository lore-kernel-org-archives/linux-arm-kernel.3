Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD9CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEXwQPF2sp+gruN2d3ooT8Av0Z9vbVjvETwyGrddegU=; b=Js4i2uF5woiBcQ43Oh6g72C0F7
	oyTJVBtEPJ6D43druixqyPSSDIu5xZApJz0T/b/Q3Fdx9/PPtedRzYUCWlSOLbDaUHwWY8FF/sZ+A
	N6P8vNz8IUyCyMrJlAlugbDOzh8OLW/EFsBJ3ipl3fF/YB8QKq7RJdr+QPrPLeaum4HeGrHi3Saz4
	Ri+cJCBW95hKN+qikmjHGOJIJUX1Ki516LaE3FdA3C0sq/Ajw8yZYBIllcekbsSsHPsfmKMxTsHL3
	JC039IzC8n8PbTKvv+3qq6LxftoN4tiTWebOlCKlWSfwfQmJQBsYaeU6YjnZy/kIiYkXqbLkhglCA
	bTmlVmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6YP-00000003hLL-3vx3;
	Mon, 15 Sep 2025 10:35:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xl-00000003gQX-2AeJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LEXwQPF2sp+gruN2d3ooT8Av0Z9vbVjvETwyGrddegU=; b=W7Fwa8eu4pAE9asyI/8ibQmi6P
	gkvJelXHN3AoJqrbOXKL09CkzhdllXPT3JGeeVxVTwV/SMWcued+YMIxIXAjtSve9pCtjohay3qNp
	RFg38DnfevOJnvP+mQ7EZcTWQ13+fnJGrPcFhgKnFqbdUSSvgla8DcgHIFMWh+lN0H91y+eVPCFle
	8OsATQ5479/ozjqjnKTCBmwcDwQG++A8H0OnfLERAyb1hDizJg/9cEiFhh+8WYBsQ5AoQetqVokc2
	q6Asi0rYU3RlaQ5wQsf8/rsRWz8DQY57uQF6EaDVTLbr3fZVRogHCUI0uZQuYCEtVRz1fLvl6TrWK
	w/5kAqPQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xh-00000006vf1-49vz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA891BF7;
	Mon, 15 Sep 2025 03:34:32 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5013F66E;
	Mon, 15 Sep 2025 03:34:39 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:54 +0100
Subject: [PATCH v3 31/31] coresight: Manage activated path during CPU
 hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-31-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=1398;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6JzhWBc462uClAegBGGb7X7XlDcz+J4rkj1oGc91ARg=;
 b=V89ZoIwQWNG0t3I6Tos9/Bg0jgELG3uacGesAlz3U/lQohW0WkkOqzgHS/5Ga0LeV4oR5YSpv
 qZgOwLsLP/8D83Z3dMwTSCHKWyvlwmJ27/o9viQxzq44WU1w9YgIGZm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113442_427975_90BA1980 
X-CRM114-Status: GOOD (  11.81  )
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

This commit handles activated path during the CPU hotplug process.

When a CPU is hotplug off or hotplug in, and if an activated path is
associated with it, the CPU PM notifier disables and enables the path,
including the sink and helpers.

When disabling a path, the sink's disable() callback updates its buffer
in SysFS mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e39d1f835d77c302d475f93e125dd4f19d313864..bbad58335129968f7d0f5f22084a93c3cb114ae7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1720,6 +1720,7 @@ static int coresight_starting_cpu(unsigned int cpu)
 	if (path->saved_mode != CS_MODE_SYSFS)
 		return 0;
 
+	_coresight_enable_path(path, path->saved_mode, NULL, false);
 	source_ops(source)->enable(source, NULL, path->saved_mode, path);
 	return 0;
 }
@@ -1746,7 +1747,8 @@ static int coresight_dying_cpu(unsigned int cpu)
 	if (WARN_ON(path->saved_mode != CS_MODE_SYSFS))
 		return 0;
 
-	source_ops(source)->disable(source, NULL);
+	coresight_disable_source(source, NULL);
+	coresight_disable_path_from(path, NULL, false);
 	return 0;
 }
 

-- 
2.34.1


