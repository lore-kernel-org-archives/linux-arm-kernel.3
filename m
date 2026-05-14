Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF42CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jXs4EkT9DeyOXXdzgslt3x0NXkaMOG8V9VCmcm4hms=; b=w9j7rH5VVppv5dKI4WNw+xAzQK
	uoNBtL28RWCiZ2MMKRX/BPmHwhRkzg3BhVoPP08SQZZpF76ONUV7b4+QpHa9I4z8P63jan9laq10N
	vDKfvCri5WiSAqAzSvqqpxFTOYfjwfHKCFfPjcmEAUxVzGXbjlpUV9H2uqDfUPNMRPHCP1NMR9LKx
	ghNEk29OD/VSlRpHxYzvZqbZh33VeEg+ouC2jdkDnHMuuzphiKSNxJFAK6keBDvYR9h7ypiY17Mvz
	G5XVQm9CkoUdSwS5MhN4LVVFj0ajjfP6+7TbYWRGrlqvQp1QCiYWcCYdHKT0TuwjyTTxW1+aA0gZf
	YVmIxwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKY6-00000004E26-23K3;
	Thu, 14 May 2026 01:07:38 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKY2-00000004E0I-0g9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778720854; x=1810256854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2jXs4EkT9DeyOXXdzgslt3x0NXkaMOG8V9VCmcm4hms=;
  b=GvvJe2QvUSczNdbp31vhkrrhKoOLcxTIqWe5bhgHhHiGrSuTByJR5LzK
   3dz5rs2I+cKXVKRujISwIh72LYSKz1A4bNFFf6rUVTJ2n5MJ+xpbnrU2X
   JSoZR+mF7sRzM4L7LshXCKTPSMHgg+Yd6jNdotq6LWJZDwBfEJXDu/b73
   zuAe43VwhmV8pyem7J5/+syuX3K/3J8QWTuo08QF2Iprj2Ot2FgmRklaU
   FB2XJPGiSFb0PiD9bZ9p+7khcU14XaCBfIu3XpvmdK1O9AYV7EVuKCkzU
   xD9Df3XSMlZPGs47S1thEPI+lwxUMFyvq/B+1xkMuye2GTbHdzAjeocQk
   A==;
X-CSE-ConnectionGUID: KdUAb0WjR1SvVxBa01IgOg==
X-CSE-MsgGUID: wQR12aYuQg6MxCxpTCdJog==
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="19394225"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:07:29 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:8265]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.33.132:2525] with esmtp (Farcaster)
 id efe55baa-545f-48f3-bc17-0317dc041ac3; Thu, 14 May 2026 01:07:29 +0000 (UTC)
X-Farcaster-Flow-ID: efe55baa-545f-48f3-bc17-0317dc041ac3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 14 May 2026 01:07:29 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 14 May 2026
 01:07:27 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<aghayev@amazon.com>, <juew@amazon.com>, Saurav Sachidanand
	<sauravsc@amazon.com>
Subject: [PATCH 3/4] perf: nvidia_t410_c2c: fix cpuhp state leak on init failure
Date: Thu, 14 May 2026 01:06:28 +0000
Message-ID: <20260514010629.76558-3-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514010629.76558-1-sauravsc@amazon.com>
References: <20260514010629.76558-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D044UWB004.ant.amazon.com (10.13.139.134) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_180734_241134_238E4EFB 
X-CRM114-Status: GOOD (  11.26  )
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
in nv_c2c_pmu_exit().

Fixes: 2f89b7f78c50 ("perf: add NVIDIA Tegra410 C2C PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/perf/nvidia_t410_c2c_pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
index 411987153ff3f..662fa1bc833a5 100644
--- a/drivers/perf/nvidia_t410_c2c_pmu.c
+++ b/drivers/perf/nvidia_t410_c2c_pmu.c
@@ -1034,7 +1034,12 @@ static int __init nv_c2c_pmu_init(void)
 		return ret;
 
 	nv_c2c_pmu_cpuhp_state = ret;
-	return platform_driver_register(&nv_c2c_pmu_driver);
+
+	ret = platform_driver_register(&nv_c2c_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(nv_c2c_pmu_cpuhp_state);
+
+	return ret;
 }
 
 static void __exit nv_c2c_pmu_exit(void)
-- 
2.47.3


