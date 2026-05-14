Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA1CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX9QoEpvNrJh3pICcnXV5Cre6fGb3z528F+I+RL9AAw=; b=evy8S1iIgX9zL0yQKmav3rZU4E
	KLVvFY3bQ6PCsGFfjideaNT9kU5oi9MB0pSX0dYqmMvo6q0rJYYbemm3Q1o7FmSV4udIvHVibHz+q
	tEKEWRIDvfy2yz0xRCjz8rAHPhxkwJor7Bm03xuW0DHAvOAN8e3nK+VhNJRFA3uNi3SYlMjEcRY/F
	Rjx7Iq6izuXnlFF2tc+N4dUtkyiXSvv5MigICFNlgzt+usrejdoQ+DwY1F548dWgbGThiQU0Giz7O
	BD0HcjyxJvZ0+Ml88E503u8i9ny4Ms6J1SZvZWuNXBUthCpuhRQI5TWR4UJUNQEckgjY/+/v8+lHQ
	SYm6s8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKXh-00000004DvE-1Y5V;
	Thu, 14 May 2026 01:07:13 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKXf-00000004DuH-0XzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778720831; x=1810256831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IX9QoEpvNrJh3pICcnXV5Cre6fGb3z528F+I+RL9AAw=;
  b=VeyC6DL+W8lhOsRMHeCCClLMkwSEQqrxUloq0nU0+W1y/xYhCUmorEzZ
   /39HusgcaQuSsRzRMXF21aBZ5LwrK6pVj9k4MSoZlBE9gswiZFeAnfs7w
   Vj2eaPLIqd1Pa76aCo+VFzj8qW5ht/wggDCEww2kjLcyf5hV0k8vcRKBR
   HRp2GRrPs2C9iaeuotuyMkpFbNSGsO+F6EBju0FYXDQV5NAKJMwjCTQC2
   LPDCXyKfTbXSd/uKnUcWLumJ/3/4l2LwnksUjLmDareIhNlFnxza5eGCw
   5QhGXOEcPwQm7aNC6SPpZf/ISifPRRjmt539GdH3bwtRZTQLT7svTkCMv
   g==;
X-CSE-ConnectionGUID: Q+vuMa4lQkenMuqKP10BBw==
X-CSE-MsgGUID: wT/z70YOSDe7pCEb6o/Ppw==
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="19601021"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:07:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:29624]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.33.132:2525] with esmtp (Farcaster)
 id b0abbfae-dd58-4306-a7ca-a01338682a74; Thu, 14 May 2026 01:07:05 +0000 (UTC)
X-Farcaster-Flow-ID: b0abbfae-dd58-4306-a7ca-a01338682a74
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 14 May 2026 01:07:04 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 14 May 2026
 01:07:02 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<aghayev@amazon.com>, <juew@amazon.com>, Saurav Sachidanand
	<sauravsc@amazon.com>
Subject: [PATCH 2/4] perf: nvidia_t410_cmem_latency: handle PERF_EF_UPDATE in stop
Date: Thu, 14 May 2026 01:06:27 +0000
Message-ID: <20260514010629.76558-2-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514010629.76558-1-sauravsc@amazon.com>
References: <20260514010629.76558-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_180711_217534_AA2726A5 
X-CRM114-Status: GOOD (  10.82  )
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

cmem_lat_pmu_stop() does not read the final counter value when called
with PERF_EF_UPDATE. When perf core calls pmu->del() -> pmu->stop()
with PERF_EF_UPDATE, the last counter delta is lost because the event
is marked stopped without reading hardware.

Add the standard PMU stop pattern: bail out if already stopped, call
the event update function when PERF_EF_UPDATE is requested, then mark
the event stopped.

Fixes: 429b7638b2df ("perf: add NVIDIA Tegra410 CPU Memory Latency PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
index e27bf31b2b366..c7fa54c7a7c9e 100644
--- a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
+++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
@@ -303,6 +303,12 @@ static void cmem_lat_pmu_start(struct perf_event *event, int pmu_flags)
 
 static void cmem_lat_pmu_stop(struct perf_event *event, int pmu_flags)
 {
+	if (event->hw.state & PERF_HES_STOPPED)
+		return;
+
+	if (pmu_flags & PERF_EF_UPDATE)
+		cmem_lat_pmu_event_update(event);
+
 	event->hw.state |= PERF_HES_STOPPED;
 }
 
-- 
2.47.3


