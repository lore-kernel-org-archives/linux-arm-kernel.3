Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77465C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR1mueN4Sb5eMGMQotsNX/aik7J6gF2BN69mEHvW1yM=; b=aY+rQoUVA2JU7z7g7enfQNxeEP
	idV8oLgRPjfirt9JyqK/GOk47zb6H2W1EVvhaVT39o6HhJRpVyV4Sz9eo4DInN0F+lrhmT+87cwuE
	50SsSo3bcKB8nyAo+PFkMVI184xip17UiqxlcWkSJrxNWkL23lTcRy5vF9iCvUWKqkxNHMfsQQbEg
	F9Xo8PntggHU6zv/XhOzTzlLGHo757j7NQTTFk44ottyu+MFImNSy3cn1r+VYgirQdLbxSEDUA2xW
	YSD7+Py0EUVnpLFRZC12623FiRNuwArw9G8GoGw5az14TZpl12telbMd5sacWshb25xq+knEwhLoJ
	aIPg/5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnji9-00000008Vik-3ZeH;
	Thu, 27 Feb 2025 19:38:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC0-00000007xuB-3wTk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671577; x=1772207577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ltWK4tfaKloJ/71XyhqS7K+XklvI1Y9czoX+8HZ6dWU=;
  b=OtSEH0CLleo4QNuO2zQX0QlKVA6yJGYq0jTVAGqTmCIE6nnnjSz84wdc
   lc9r9//x0cg/CmzWhfkaoLA4ri93bnvUwvbV8vnSAQBEZc7CMEGybyzk2
   8yo/VlabNcrueAecZxLO66Ooi/ltxeRpTp5BQezlHOwtRW7eaMWt/Na+k
   3fncfFp1jB4yk5MPKS59shAy3904FGfvq9JjL4NNRiGBFQDGMMvcCm41S
   NbH4e+DubnQLiAKbtdpfaZyn7jgabnjAr1Gvnq4rJcSCD073d5W1S2O3/
   w0HWwD3t1UJjTx5LeLMeaO4AK+9qur2tWTrLNfvxg3HmXWO/Z44fRvKZM
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: rFXEYSqMS26G7/bAwEki/Q==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:44 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:44 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 02/21] dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
Date: Thu, 27 Feb 2025 08:51:49 -0700
Message-ID: <92543fcff4ab35e770b01d4c15d45cc5d55833f4.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075257_193214_A9EDEEDA 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 SFRBU compatible string to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 769dcb096186..05ef01f24ac4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -91,6 +91,7 @@ select:
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
+          - microchip,sama7d65-sfrbu
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
@@ -191,6 +192,7 @@ properties:
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
+          - microchip,sama7d65-sfrbu
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
-- 
2.43.0


