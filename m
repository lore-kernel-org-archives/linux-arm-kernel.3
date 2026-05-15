Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2B3CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxCb9E6OugT3dVK/MkmB/81Cv75zRlKLBgEGT8Ge/kY=; b=oPlOLFA2aMdtGtsCpL/eq2aIMo
	tL/jeUs/jIlxA4bYAryjGBfcMBYcN1h2o8e7Dvnj4m3+SIJElFP443BOaM0bf6xksCn3IduwIm/Ou
	XllrOxDCNmntsVyF5sKkHDExWOjfgBtns7p7h3F4Z93d5huXQ/I7zsgufedlAarnKOI90NuqHr27r
	bBHf47YF+IhUV5THoQiK680A5IsQd9GdTwd4KdDV1EMKa8sCG60fF2f8jvs5+KFm5L1w5XcAv9x+P
	KJXST+sJy0OJT9itNJixdyqji/yxqwTxRfRi+CXbe0Gnl699TSJuBpQJ64agmI5QbLlLdcxc5U+w9
	4ElTHcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrL-00000009K7p-1zTS;
	Fri, 15 May 2026 20:10:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrE-00000009K0V-1muk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CxCb9E6OugT3dVK/MkmB/81Cv75zRlKLBgEGT8Ge/kY=; b=oDqCn/SdaKUEna9YRKiRKWzgKu
	7RVL75xAV/htUPSMBhgrDjlDNAQlq3uLbHPphikIplyj3u1l9KInDgj/piAXtnybW0Pb3BRRedFBl
	a5RGzSame/r3f2AwRw8lEgT8km3grmsMKT5bGyyP0npuJ3mU/QMGEf9t5wttQpincotlWr82yWbKJ
	hV9pjFycaC7I2WGS5f294f65P5H+woGjCb+oGfpZGEhbSSOcj6zi7xFZbcbVqPYKipm3GZQ59zMND
	oa+Xgx5wwB8EaKuMiMhFEM8mxSWq4ftI9BreU+tYUuY8RKtIR8fw/tfbUAvt4RYWOl3B5Slftj4kM
	+bMYF9Cg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyr3-00000006A7F-2u52
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB01335E6;
	Fri, 15 May 2026 13:09:47 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CAA13FB3E;
	Fri, 15 May 2026 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875793; bh=YR3JM3KahMsQVOLllIjMGNzIr7WuzNo8Ivx4o4gjxQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sA4Ws2zw16InV6zWRftpxilNZvqp+OTVrh3cobbdxm8/nkUyrujiYC0I5gAC3VeuU
	 NcssEIb/lKa36QEY7wiVmg7zwBYadnp+/xq9GY/QNr+IHThARqPvf6ABAGuTDlNlWX
	 QuTl5/0T4cAB9HdacBrC4FWN53uXzOX6UhDfV3gs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:35 +0100
Subject: [PATCH v14 28/28] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-28-f88c4a3ecfe9@arm.com>
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
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=1286;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=YR3JM3KahMsQVOLllIjMGNzIr7WuzNo8Ivx4o4gjxQo=;
 b=1RA86c7O/cHVlnK5Tffgut4NK/4w3KEZMSxPbt1fKq+9aj2DGxYXBx3dia+ufORQ9AceAeBIJ
 rrBqM5ekFz4AruCrUHhCn6KZcTewmtusm3S3IPP5leX0D+Z1u5lXISY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_211001_204105_599B5A5C 
X-CRM114-Status: GOOD (  11.68  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 80b6b634a70d3cec98dfa3e5fd146cd254b96d6f..4b010f8bc4c08da31b3d295be6c37b6d941629d2 100644
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


