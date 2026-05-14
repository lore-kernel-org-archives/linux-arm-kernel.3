Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B07CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW/OZQoqy4f/UkhCnx3pnnSjrSTqrJ/WVsrvI7KDwF0=; b=m9HCzCF6B4bW5JjSr0XA3Thtl8
	37Ow7k28BQ23J9e6om144qFhO65VI6cve2+jqnnx+2GBOCXanjjyC6RBxOUu9Rn2KsD2OalXMWBn2
	sCVHp4M5RhrdEx6Nvz3mEkEHHwFq00x7KSX/+j/nczUrBNZhA1RM1+TYGLMMXHZFs4qfQJvWNQ7NS
	/AswQKD0Z4hz0raR/MhzTQn2SbQRMmMo9N4uSmE3EgKFUnFCPQeEAcwk3VbGaYoujjFEN6RaV131m
	aO3k6o8aXCvOuUAx5oj5EpQOHnhlxN+9Xj9Mo0axDY/lXL/AYPkoUGPwFlJcKGORAh62GxqYUl+pd
	rtmVbsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKYZ-00000004EAB-34ew;
	Thu, 14 May 2026 01:08:07 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKYX-00000004E8y-1aKH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778720885; x=1810256885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cW/OZQoqy4f/UkhCnx3pnnSjrSTqrJ/WVsrvI7KDwF0=;
  b=BEK9S3IgHQ8Z/EZtC1TQeQHB0RK3lKKaFjYgW8wwCbrJWEJMJeXzbIPZ
   /DoTsgV4Yl7YDzL8QUXsOrUtoOJNNOk0+ebc9r96bNjqRtJF5muFgNbHP
   EBSbM0VvWg4IF5sO4jbB3dr+UzDPBECocNRL56jZZn84umWKALgIFyolS
   gRm+stTGCprt2SpCYXnhEbxjEyjLD3kJC2J9vNSum6ScvnR/te+lwKWUb
   /ehgGxU8ZPA9IeiQ9I5qfnViU56uHJg7Tr4IHETPvUIBSXEh9R7uL7mNT
   mtVb8PwYNFrks1RRFc6DjQke87wXMpIrgbH5asn/PityvDXp8G3Rebvbi
   Q==;
X-CSE-ConnectionGUID: MFGcm6D+QdSByVHlqNAcFg==
X-CSE-MsgGUID: ODrRSGTpQ7i8BvTXcwWNlA==
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="19469806"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:08:00 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:29459]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.21:2525] with esmtp (Farcaster)
 id ef6c1e45-134f-4e23-bfcc-be8e3fe3fcf7; Thu, 14 May 2026 01:07:59 +0000 (UTC)
X-Farcaster-Flow-ID: ef6c1e45-134f-4e23-bfcc-be8e3fe3fcf7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 14 May 2026 01:07:59 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 14 May 2026
 01:07:57 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<aghayev@amazon.com>, <juew@amazon.com>, Saurav Sachidanand
	<sauravsc@amazon.com>
Subject: [PATCH 4/4] perf: nvidia_t410_c2c: handle PERF_EF_UPDATE in stop
Date: Thu, 14 May 2026 01:06:29 +0000
Message-ID: <20260514010629.76558-4-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514010629.76558-1-sauravsc@amazon.com>
References: <20260514010629.76558-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_180805_462201_838A91A9 
X-CRM114-Status: GOOD (  10.33  )
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

nv_c2c_pmu_stop() does not read the final counter value when called
with PERF_EF_UPDATE. The last counter delta is lost when perf core
removes the event.

Add the standard PMU stop pattern: bail out if already stopped, call
nv_c2c_pmu_event_update() when PERF_EF_UPDATE is requested, then mark
the event stopped.

Fixes: 2f89b7f78c50 ("perf: add NVIDIA Tegra410 C2C PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/perf/nvidia_t410_c2c_pmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
index 662fa1bc833a5..39d0e661e4c5c 100644
--- a/drivers/perf/nvidia_t410_c2c_pmu.c
+++ b/drivers/perf/nvidia_t410_c2c_pmu.c
@@ -394,6 +394,12 @@ static void nv_c2c_pmu_start(struct perf_event *event, int pmu_flags)
 
 static void nv_c2c_pmu_stop(struct perf_event *event, int pmu_flags)
 {
+	if (event->hw.state & PERF_HES_STOPPED)
+		return;
+
+	if (pmu_flags & PERF_EF_UPDATE)
+		nv_c2c_pmu_event_update(event);
+
 	event->hw.state |= PERF_HES_STOPPED;
 }
 
-- 
2.47.3


