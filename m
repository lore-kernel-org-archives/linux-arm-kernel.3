Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D464BE9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wjiLmpsHzhxhB1kZGDlVpoiCKzq3RmIivSnNvbjXOg=; b=tSI1apYv8Oa1h0AWU2TyuX8gqS
	02MmclCCtGnO+hHfttCbX42qsV7oEISEPFOMmLaJQS4cZ29u+L+knsp/dXPBsYrmUzrFeiXfCUuxv
	zHEVdgjORIveJyF2EtnsJh0hHk8/2cKXucrO1XcW5WXj6+3CDNm2HQAkXuhItoUi1wQ1w5F4/xLIc
	oHRN9kjjoMAvxmy5GHPrVZ4bIEYSm58C207TshcL+UyPx8BT0HFKmNLPBn1f5aEDUnno6KLV3ymmu
	BaxTcVucKbnc7Kurljc+1vTWELvj5aGDlU3eicvJ2yd2pcXxKn7emSc5KVMrh4c/6I4v0RY48qkOD
	KXLiMogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P1F-00000004IDP-1VOT;
	Sun, 05 Apr 2026 15:04:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P1E-00000004IB5-0TeZ
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 05 Apr 2026 15:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8wjiLmpsHzhxhB1kZGDlVpoiCKzq3RmIivSnNvbjXOg=; b=BQbSEDTr2MFlBHI6XRRjuQg3cY
	unush7MPtjd3A9MU8zKcrHgpz3Halu8bKaXQiwKQcFL2XZuWzeXLsRnqH5qU38NFYp8itc2Xic5Tg
	wqk7NVOs8NpTuF2i6gWvYpF8iEBEfxjjY6UYqjjvoM68TBiTFZfdWVeK9Gm61PcrhH2UgemOtJsxD
	fl1vBKhoBqXBuFdJpj/i6ak13Lk+BH5hUBJNuluzwPVjqWiyY6ENdbTInOAzmUyUWcdzNpQDQSbWG
	xFTcK3C2rP4+uN9/PpMJ9/qZdgcBluNel+TIzeXabMC7uSIbtP7A7CTU8OJR3Z3TTRcRF3mg/AwSz
	bXuRcvmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P1A-00000005uWU-1je6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:04:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20A7271B;
	Sun,  5 Apr 2026 08:03:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD9C13F62B;
	Sun,  5 Apr 2026 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401443; bh=RRSLezh9B83+WUajlPT99CB9OmgiFf92QChg30Ds/Gg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fXE9Yx4JHpIcX/abzSeyF/5PcSrJLl8xYbyEEbCLXP3ZrqdS5BIg8DC/I1GKH/Aur
	 BHBPThIZ9j001DonEkfBJD1S95gRF6KxIt1Xna3O0iRfO3MsKX9Jd6S3uKTBbYZITG
	 viIOnJHiEtlX46Eo7qMAY1mMAI+bHSfMO1NaHkWo=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:56 +0100
Subject: [PATCH v10 20/20] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-20-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=1191;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RRSLezh9B83+WUajlPT99CB9OmgiFf92QChg30Ds/Gg=;
 b=HLDTJpobfDCndoolnV0ayQ1S1j62xLxzbrkw3lg9VkcX72av0o0z4t4oMlR9j+e/ooQ0hmUpG
 WrpSCFNRZSsBXstg2oKCXCMDN5+BCHAg85MHGAY/a3F4crHfq0ilK4X
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_160404_701843_C45DE8BB 
X-CRM114-Status: GOOD (  11.52  )
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


