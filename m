Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF610FCAC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4WQAE1c1riT+9ulTyk8E2om0cx1ghgV6hPaM/aqHsQ=; b=IlAaaNCQ0Gchenkk1GVKrtZjAe
	yk4macztFlhd/IXNDMKb/P+Nco25o5Y2D0l8Vgb4etYG0wBo2V/Gd/CT7uCMV65G9pym2EyFwbixr
	397NOeuP56Q1x/osCpp2zw9GzVgjla11AzC3e/UcpTTtTNoupVArO9wkjvH01txqk5ZEhKrYB5WLT
	mF1c2aMaWb356Axp/FQeCZfYtuT9t/JRk7rf4axwNCyVQEtWjuv7cs4NX4ZR5wI5wi6A3OTIiqCU6
	wwrM3ZJ3YEv2cQ+nCQaPAw/XZkYKtdSezUWDpQxUgNYw4Z4AxUflLvCX1n6rEUo8OTbsOXxqme3cS
	PBWiCOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxX-0000000Fv5g-08hZ;
	Wed, 01 Apr 2026 18:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxS-0000000Fuz4-00Kp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h4WQAE1c1riT+9ulTyk8E2om0cx1ghgV6hPaM/aqHsQ=; b=M5bBbe3m92mxLdeeTAnebuL2PT
	+OF/x4URkGvPJ7gzergwOpdV2/NosFvhEUDpOOkuPuekohgrgQ1H9OYmEcPZIoQ8eiIDWXwp5bGNj
	fP+5GsjK4beu4I4cBjxY8w+j/TP31lfb9CudjqWK1moJ6utaKrzI2+cnPx+e03tufLuD7FGlB9x59
	FfvTZVzcfbr/ThDAjvSSyJayK/GDhzyDZvrmLn+uifJTmjzCS86otSedszad3CAVRQCnp/lrF1n2B
	lXe4jIzmVtCIt/v4agt9vO6yJ5hpBKRX9hX6Ex/E8yVR/G1cDjvW2x5bDPyvmCM8ajdkEP1yp9gAU
	uE/ndnqA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxO-000000014ZU-44LR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1855D1A25;
	Wed,  1 Apr 2026 11:06:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E646B3F7D8;
	Wed,  1 Apr 2026 11:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066781; bh=nVQ5p3Ywufan2LLBZ2bEF814MZBQ3F39UPIbscMci74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qnMDbxsfSr4Q/+2eaKtgdcqwvZS+g1VFzxz0NTGVKSoP8PQXQUiRD9Yu5NIgh9F6Y
	 WGq+eTN1A9V2502wET7l2QgSdpuTAqHpN79NC0rMjcItCakKbJwnwlRsMISy12sRN6
	 Z8Wa+i1yuexSdI73OyYpRfAkK53YqrG4VGqoUnxc=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:45 +0100
Subject: [PATCH v9 16/20] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-16-091d73e44072@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=2515;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=nVQ5p3Ywufan2LLBZ2bEF814MZBQ3F39UPIbscMci74=;
 b=PpEWd4MJw1Gp87lmq5aw0P7Bv1XGICqgqqfIGyFISGpr5O65ZNFDDd1YcHpEsi1NKUI+3l8ZW
 7LBj8/6IYV8B7FZK35dLag1/nRrznHXstvuAQdqS324uwkHTj6keNat
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190623_297057_183432DA 
X-CRM114-Status: GOOD (  13.41  )
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

This commit invokes save and restore callbacks for the sink in the PM
notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7fafec04de3e8262b7ca66671c6de635b671ceba..a41e77da4f083d4b5d162e7b70905f22bddf7ca2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1757,11 +1757,17 @@ static bool coresight_pm_is_needed(struct coresight_path *path)
 
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
 
@@ -1780,20 +1786,35 @@ static int coresight_pm_save(struct coresight_path *path)
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
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *from, *to;
 
+	coresight_pm_device_restore(sink);
+
 	from = coresight_path_first_node(path);
 	/* Up to the node before sink to avoid latency */
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	if (coresight_enable_path_from_to(path, coresight_get_mode(source),
-					  from, to))
+					  from, to)) {
+		coresight_pm_device_save(sink);
 		return;
+	}
 
 	coresight_pm_device_restore(source);
 }

-- 
2.34.1


