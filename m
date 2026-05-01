Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2E4CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGFcK811YH2U/3ps29EeD+R15nDikNLDXoPKmQa/Kiw=; b=ZmWyNOnHokhm3WAHAE8hLaBbEO
	jXoAM77pKroTKiGZbXexy6eI5bwa0tiF/6EUTRXr+hxo7H/2FOr9o8uVfuTDVwPKrnfnAKHweJnoz
	FqGehMeEWX6mz09FfaZ37lVPOcVeGCIAmormDGUq6dLX1eqZqlHd8C00Sjzv8McKkfbKdXqLnU4x5
	BPxueUjNPR5Hsa361fBuaoqE+5smhB3IW9GUOJchhq4iVowxCOP5ASJ6EqKe3JMihHmSbGkyt1ZXj
	bIHH1APSTfpTYokd/UIZoRb8kcdVnIzi4aLLfqcSa4S9lu8g8OBAIzra3bXH7qQof5WUZ6QtvT9xQ
	AoPA85vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3U-00000007SRy-0Ol6;
	Fri, 01 May 2026 16:49:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3R-00000007SMZ-0zER
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BGFcK811YH2U/3ps29EeD+R15nDikNLDXoPKmQa/Kiw=; b=CbDKH04azCSXRS0uW+aFj/MLwt
	SPCXFZ6ZHCNQZDBijU1vfvQZtKwdgpV1kA7DS+qSj5ShoiBKhx1xaU3xPmfQVwwRdLHKFBSx1V1cL
	znu6XCf/d13kihTyRQUM0gkw1Qqg1caEPhDSqeEPoq+275o61Nu2cM9pxv3lGlihTbNRgb3H6L6zE
	n1aIb0J1sWUZXZO1GX2GTLSJ2A1v43Hs5eO65L9lRvh3J4zra68miduFC6BmGs+0LtDqxX2A6K529
	JEx93gvFw/z6x2KniFwBKIvmVPBmNX3bKySHgvzTT/VRrM7WO6je2NKhJoQw0YtYpecuFSrAUgLOR
	TDkq5jxQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3O-00000009BHA-12vp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B23EF1692;
	Fri,  1 May 2026 09:49:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26073F7B4;
	Fri,  1 May 2026 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654165; bh=/xmzaucyZa5PAP7Z/0/pXxs3x8HBDu38FKWFZLt6C8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pzmluxR/OGN+KekUhqgKWbfgj22YKu1OvVqXXC3XVlR/L6iAf6zNiydw2v6SSCvW7
	 cZxxgLYyGOFXLWM3Z62udHMLeh3wbbzPq32VG17f11+xasmweWT6CTvh/kIt+55Lzy
	 ILLzIrRRQ6MK318C/wwOxfNAT8Z/O5vQDzIePbj4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:08 +0100
Subject: [PATCH v11 27/27] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-27-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=1237;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/xmzaucyZa5PAP7Z/0/pXxs3x8HBDu38FKWFZLt6C8o=;
 b=RvVy8Cr5BRpEYxfFruF8qVd5Sb9K8VsbC7NsDxAerkOpsErgsKQpERcxfltImzF1tATSxgllN
 smnkmR7/TupBDaND0QX9r+SxuHTuo1V5W+zaqj9f+QNXIw5xx7eyVDZ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174926_456167_F30630B9 
X-CRM114-Status: GOOD (  11.80  )
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
index 42cf07b8d15a420e963650000dc32bbb38f0aa62..762d1ef91ccb49071720263c9b2a8438df7fa4a3 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -170,6 +170,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 

-- 
2.34.1


