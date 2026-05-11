Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97292CD4843
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/AL4swsvywICjzlSBpUdlgkeNDxcxaOqJY3MitZfBU=; b=v5MutBiLZL4hc9rq/hp7SZjEVb
	fvABASaGL4uMM3Cfm6wU/ws703oUSu5f4Wt7yGp30gxUL4m8dEC0CA9FNHJ4s7j16ohZ1RtXFYg++
	Vto+D/4NCcnfWBZC+/0D6jUzeNbllWC1GVKV5ttjFh1jdsxHwjWlYx5hHXnYHjOvK3IzGwo5ABabK
	KCSeXhrT8BRSaDlqx/ZRJsnqD7du8xDNLBbAJ8WRv7zW38jxJRHUEWfy5NZj8eKdm4gQX3gpC8Rig
	K0mYD47K/NGriVHfGORIgoTdEYmxnexSahBeBcnJ28iVFrL9emLawo4hqgDlIWE4UCpnUMsCQrZ4m
	BvYz8O5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYs-0000000DGWc-1uUV;
	Mon, 11 May 2026 11:12:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYk-0000000DGJi-1601
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=A/AL4swsvywICjzlSBpUdlgkeNDxcxaOqJY3MitZfBU=; b=vO/iW5VxgNctgTtoS2y4sbDCC7
	yI/o7vC88bYxWbdMV89x74IKrf1zHXINzjlJD2RVDxaXiy/dnzVyZJmdeQx369PcUS9OFr2EDwJR1
	XuUp8MNzRvBC/kCtqnx3yb5VxKSKIsWd1lo2sGL62UmBN2P+OMsiJWMFM7466p6mxB2nreE7/hqxj
	bCpdyLkRvrKThVtbxUde+CF5QPOSknQUk0z5iDfF9AzDYFD6sZQnyNeflK37+Nf02U8gcOevPPbBZ
	uGspLqXDWnChU07z+uAGKb8S5GjinboU+fXK/mSXweSsyJ2cdFChIhDV9gK5bWlpN/AVRIaMkxrBa
	22RzagRQ==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYe-000000082r7-3GO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5BEC1756;
	Mon, 11 May 2026 04:12:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D375B3F85F;
	Mon, 11 May 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497940; bh=/TTfard75SpjSzcdXo85Hjm1XhRUG0c5qCLzMpHKjmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KgwhbTa+rzVo+y1/Tqg9bd8Y/Ma8GxXLs/ycMt8qmioiZi85p1/MLDA8/sHhsFS57
	 FlJIJcIeJ/qiufuvYGkb1qbdIl1y1gor7v57jko7YYqFghqajpb2pzefof3jnCoCCG
	 2aA9M0q0fHQd1A2NvLDqvhnm+yAi77o/7/+Ec8/A=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:12 +0100
Subject: [PATCH v12 28/28] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-28-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=1237;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/TTfard75SpjSzcdXo85Hjm1XhRUG0c5qCLzMpHKjmI=;
 b=stqBg3YfepBtVCPRYe7YPdRKAVmVVUuHdiSDOwyrVy1nLQ8cL+OiEhwGwPbCLGsj+o7an1Ek/
 ukPRKi+jIh+AFz2CgQZpdONroE5Mcseam3zjVMKS9mBXsiPzn+AavTN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121220_970395_4304D946 
X-CRM114-Status: GOOD (  13.13  )
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

Validate whether the associated CPU is online for a per-CPU tracer.
If the CPU is offline, return -ENODEV and bail out.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 6f11738b67303eb826c0577eedc418694a0bb1ca..a7735bee9e47a709642e6fa97a33c8ef4cf0b926 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -168,6 +168,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 

-- 
2.34.1


