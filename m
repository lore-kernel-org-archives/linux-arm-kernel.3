Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DFDCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WSKMZ6pbPJH1DIZ+mtEEVPgrpweJMBlY9xPQY3jiKE=; b=CC+UTryJxjpXYeXp8DxoETNhx+
	YikCssPvNg3oHj14ZsLDdl/wbQHNBZ9qJcUCssfm8cadVVW9hI9Ou276lLSeri63i+ZNoCks6FEof
	AYl5xNsGIM5t9KU5FgaoBV5TYBSfRqNNn77srfYYTJc3oKTMVfZM/GCluOH5UmaLwoSNC5hN743s3
	sJJae2s4xRdeAbR9uvZQvYplfRv4rV38Hn/K3FpoDlAw1xGrXGJiS28HGAgQAYHsqNn96sX3HsC5K
	GQbuyvdCDikjjglfwk3+d/tFMXqbdNZ2lzq+4Qp3HMtEwGsqwmUG/jpeCh2U0L+NKGv5t4Is7G4O6
	iR5GdT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKXK-00000004Dp9-15Bw;
	Thu, 14 May 2026 01:06:50 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKXH-00000004Dnn-20Ok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778720807; x=1810256807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3WSKMZ6pbPJH1DIZ+mtEEVPgrpweJMBlY9xPQY3jiKE=;
  b=C4hIfkkrkWfub4vLlYpNkWULXmiGmH5Fi3QKtX2ynUuH3xHA8xWMB28F
   fzMPDwX4h+Vn3inr09UrYwhBMTyNQCWLzw5RXI64PhXwd34ifbIV6zH9s
   w1ANhgeI+6co6MoVD+uIj3lTL9a2iTo783S2M7F6RiMWK03t+Ww5CsUnR
   T8xcmcFN9WECJleq9BqkMKv1Jo5HazsqMqwZBGTjnopEvIurV3UL4TMYw
   2iF340junkw1hpqegq+qDiUqgq7xL4qkGqEqiAOK2xTX7/ZMoLzorSQrY
   VbGcnDKhuwZu3tdOfiAvcDkIroLgaTeJs24p5uNCYxgOarXGEjMzzKTVe
   w==;
X-CSE-ConnectionGUID: s32lekjVSKuk6Aviy4jPMg==
X-CSE-MsgGUID: xrCNtYbzSHG96HDzj86/rQ==
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="19613318"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:06:39 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:11666]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.30:2525] with esmtp (Farcaster)
 id 1fb0d0e1-11e2-41a5-822f-cf704c043d46; Thu, 14 May 2026 01:06:39 +0000 (UTC)
X-Farcaster-Flow-ID: 1fb0d0e1-11e2-41a5-822f-cf704c043d46
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 14 May 2026 01:06:39 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 14 May 2026
 01:06:37 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<aghayev@amazon.com>, <juew@amazon.com>, Saurav Sachidanand
	<sauravsc@amazon.com>
Subject: [PATCH 1/4] perf: nvidia_t410_cmem_latency: fix cpuhp state leak on init failure
Date: Thu, 14 May 2026 01:06:26 +0000
Message-ID: <20260514010629.76558-1-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D038UWC004.ant.amazon.com (10.13.139.229) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_180647_582236_E1661DA2 
X-CRM114-Status: GOOD (  10.61  )
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

If platform_driver_register() fails, the cpuhp multi-state registered
by cpuhp_setup_state_multi() is never cleaned up. Add
cpuhp_remove_multi_state() on the error path, mirroring the cleanup
in cmem_lat_pmu_exit().

Fixes: 429b7638b2df ("perf: add NVIDIA Tegra410 CPU Memory Latency PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
index acb8f5571522c..e27bf31b2b366 100644
--- a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
+++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
@@ -719,7 +719,11 @@ static int __init cmem_lat_pmu_init(void)
 
 	cmem_lat_pmu_cpuhp_state = ret;
 
-	return platform_driver_register(&cmem_lat_pmu_driver);
+	ret = platform_driver_register(&cmem_lat_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(cmem_lat_pmu_cpuhp_state);
+
+	return ret;
 }
 
 static void __exit cmem_lat_pmu_exit(void)
-- 
2.47.3


