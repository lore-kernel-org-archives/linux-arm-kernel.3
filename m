Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W5pH2V1gyiEOmWsKa66R87bP2YeuD/Oj8gx8MCibcM=; b=r54QpviADyOUW7iwBnFBtL+Z5E
	B6xDLduyXYQ3as/97fjrW0Dbjc05mgzw2l7Q3dwv+SZj2ygWhMTlBc4Sxvc3k21ilAyvYTm6pnvYV
	a7F3j3k71TzNGD4jMQNLF1LiKlQL4YDiIMAd2Ka2irsMsfld97P3fKsourOXIgYS3blMEdZhEO7nX
	IQkdMWCtj+EXkrnHP55y9YNlc3xEhOp3QQhdrUvFwXheoezFjU1bfkoiAoVlMQwM4U0RutQETs6Tv
	xMUyV28lYCOB+WE4XGgDCiPOasB8odzzTu7Uj3xnEYhtpIoTwp+9orDBK/zhlECqwc7+JLGsIeGDp
	wuJ5V0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KVe-00000008UcA-0DXe;
	Tue, 22 Apr 2025 20:46:26 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KTk-00000008UDm-2Xwq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 20:44:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MKiEZT2103137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 15:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745354654;
	bh=3W5pH2V1gyiEOmWsKa66R87bP2YeuD/Oj8gx8MCibcM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=szM4/4v/j1ZIuOu0+5pY7dAyAuMOeYqlCp5Ou5bJpAe6KV8UdaljyrKEXgfpoBHYk
	 aElZDnVJ8ihdYrBqjIkk7QisPIowEXYUlFtUju+p7d6OwaOs8thzxvui8+IuOAgV1p
	 M8WF275JXApYJBqOad697h+Gokl9F4OTxpFcPVj0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MKiEra064584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 15:44:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 15:44:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 15:44:13 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MKiDWi061619;
	Tue, 22 Apr 2025 15:44:13 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        Nishanth
 Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Josua Mayer <josua@solid-run.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hiago De Franco
	<hialgofranco@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: mmc: sdhci-am654: Add ti,suppress-v1p8-ena
Date: Tue, 22 Apr 2025 15:44:11 -0500
Message-ID: <20250422204413.272679-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422204413.272679-1-jm@ti.com>
References: <20250422204413.272679-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_134428_738033_81460436 
X-CRM114-Status: GOOD (  11.05  )
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

Some Microcenter/Patriot SD cards and Kingston eMMC are failing init
across Sitara K3 boards. Init failure is due to the sequence when
V1P8_SIGNAL_ENA is set. The V1P8_SIGNAL_ENA has a timing component tied
to it where if set, switch to full-cycle timing happens. The failing
cards do not like change to full-cycle timing before changing bus
width, so add flag to sdhci-am654 binding to suppress V1P8_SIGNAL_ENA
before changing bus width. The switch to full-cycle timing should happen
with HIGH_SPEED_ENA after change of bus width.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
index 676a74695389..0f92bbf8e13b 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
@@ -201,6 +201,11 @@ properties:
       and the controller is required to be forced into Test mode
       to set the TESTCD bit.
 
+  ti,suppress-v1p8-ena:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When present, V1P8_SIGNAL_ENA shall be suppressed.
+
 required:
   - compatible
   - reg
-- 
2.49.0


