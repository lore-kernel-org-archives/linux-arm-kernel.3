Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13243CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZEkpYaV8znQ3xP6RcqHMvzTHuEHWppo4gEe37Xawpw=; b=05uc0tOBtXVuxtDiLeL9T7appz
	9kGOpYqmBMVqEqRiMsbn/0MkEPThyRXuv5k3P4pf64NPhwsfamtgtBZXSQPQyBWrOxBGQHZcZY3Mw
	4QOuCeR985PaSFTlP+VnFrp1czMZTx7CNA6UFJmezKQUUu0C4Vk8XDkcgpvZTLdWS/JLe6S/tcA1T
	7DcMll1sw+0RvyoEiueZBEI4L0ZZfwuaLsmXxhKhDw77+zTyQ4o2OR8N1o4pnqp9jUv+OTzyLDoaN
	wLAbtqmWAfq2ZLkuNXr7Mi4lGkzvvbG4PJ9Ba0WlsjL4vaS0AodhfMmKHy7BFWCyBNJiKCsAI8jmj
	xJ7HhhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXsw-0000000EmR9-473s;
	Mon, 11 May 2026 21:09:54 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXsv-0000000EmQT-1OHF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778533793; x=1810069793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZEkpYaV8znQ3xP6RcqHMvzTHuEHWppo4gEe37Xawpw=;
  b=ZwbjM7kzvLZOWk+cfd1KttErh9aXS1oTN4uBX10RLA/ml425q5oJZmGU
   JKtFzQhhQuTbkU96V1RT2Rkrn7NI9M+l55LgoXpQnaruK813NbLCgMUoK
   mG0e+cGNhriqAKXKd6ff0c8cLycC2N8Kpc4xHVWlYa+XVNSiFaGaDnODX
   VKGgDDDnvLicHEVD+nnVj7wp/c+zvz+ZhWXM8Zb5Yzy4rZ3GTofmehXz9
   VMd5bYMD3W4slvj868gcI6snIyuxYAD3/xOmZsbkgQZWS65VZ0Rk8k19e
   TgvT521mskb+2dxyICrP73FtbX9gnnMmHLYgigJNaSb1uCEVcW+hCOCRc
   A==;
X-CSE-ConnectionGUID: /cVL3ocdQ+eex6TpEqtjuA==
X-CSE-MsgGUID: 04R2l2iSQj+ycRlsaE6V1w==
X-IronPort-AV: E=Sophos;i="6.23,229,1770595200"; 
   d="scan'208";a="19192945"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 21:09:46 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:26317]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.38:2525] with esmtp (Farcaster)
 id 615b8aea-6f92-4272-a246-4731c55e68e5; Mon, 11 May 2026 21:09:46 +0000 (UTC)
X-Farcaster-Flow-ID: 615b8aea-6f92-4272-a246-4731c55e68e5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 11 May 2026 21:09:46 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 11 May 2026
 21:09:44 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <aghayev@amazon.com>, <juew@amazon.com>,
	Saurav Sachidanand <sauravsc@amazon.com>
Subject: [PATCH 3/3] perf/arm_cspmu: nvidia: fix BDF calculation examples in PCIE PMU docs
Date: Mon, 11 May 2026 21:09:05 +0000
Message-ID: <20260511210905.91917-2-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511210905.91917-1-sauravsc@amazon.com>
References: <20260511210905.91917-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D043UWC001.ant.amazon.com (10.13.139.202) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_140953_417831_DAD4A767 
X-CRM114-Status: GOOD (  12.08  )
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

The BDF hex values in the documentation examples are inconsistent with
the stated formula (bus << 8) + (device << 3) + (function):

  - BDF 27:01.1: documented as 0x2781, correct value is 0x2709
    (0x27 << 8) + (0x01 << 3) + 0x1 = 0x2709
  - BDF 01:01.0: documented as 0x0180, correct value is 0x0108
    (0x01 << 8) + (0x01 << 3) + 0x0 = 0x0108

It appears (device << 7) was used instead of (device << 3) when
computing the example values.

Fixes: bf585ba14726 ("perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
index 0656223b61d47..24f0e801d7b80 100644
--- a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
@@ -170,7 +170,7 @@ The list of event filters:
     devices in root port 0 to 3.
   * src_bdf: the BDF that will be monitored. This is a 16-bit value that
     follows formula: (bus << 8) + (device << 3) + (function). For example, the
-    value of BDF 27:01.1 is 0x2781.
+    value of BDF 27:01.1 is 0x2709.
   * src_bdf_en: enable the BDF filter. If this is set, the BDF filter value in
     "src_bdf" is used to filter the traffic.
 
@@ -215,7 +215,7 @@ Example usage:
 * Count event id 0x4 from BDF 01:01.0 of PCIE RC-4 on socket 0 targeting all
   destinations::
 
-    perf stat -a -e nvidia_pcie_pmu_0_rc_4/event=0x4,src_bdf=0x0180,src_bdf_en=0x1/
+    perf stat -a -e nvidia_pcie_pmu_0_rc_4/event=0x4,src_bdf=0x0108,src_bdf_en=0x1/
 
 .. _NVIDIA_T410_PCIE_PMU_RC_Mapping_Section:
 
-- 
2.47.3


