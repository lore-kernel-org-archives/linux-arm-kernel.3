Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5F6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W5pH2V1gyiEOmWsKa66R87bP2YeuD/Oj8gx8MCibcM=; b=oBaSkRZT4hqm0GgZKRzxql9OIW
	BtICIDfGISH5Y96rrMi6aPjrphfDt1lICJMM85EC+3JidNUJJxqDJDFaJTuMOVVLIZF5zd20oRzOq
	a894q1S1AV1Eqr4MHQgaCOrNDH0seK0c/pVBQ/zp4eALNgJKBnFh6hDvTWXiF+g+HCYEEg247T1lH
	nk3hvwGT/19/HXx/4eXBrEjn7OnX99Xwlbsdo0PRfVHo0tn15ntFv/GlefE3at/erl0FRhh152dar
	csIFMo73y2JjLqt8PZOYBJk7ld9m9x3HjhGoIdPE32a8VM6XkbIyl0mtK+4dYAx9nQKxiibDj3QD2
	NnqurlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lnm-00000008ft9-0jwD;
	Tue, 22 Apr 2025 22:09:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lk3-00000008fCy-2YVh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:05:25 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5DdF1337961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 17:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745359513;
	bh=3W5pH2V1gyiEOmWsKa66R87bP2YeuD/Oj8gx8MCibcM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DyI8XAi1phnkKYoqwloERIFC1u+isT1WfT8OvtCBOAF1eEXeq2ZgoB7kfjjDeADiY
	 zb1ZDk++JcsLdyYcxKeX+QyH5wLPV5RvAjzD32CmZNw/ZyGDz93SCT4wUvLzf4e7zz
	 NuxwUgs5jNHim2bVOO5TEVF01/tygQ+kDVYVE2ws=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5CGQ117245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 17:05:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 17:05:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 17:05:12 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MM5Crd012605;
	Tue, 22 Apr 2025 17:05:12 -0500
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
	<hiagofranco@gmail.com>, Moteen Shah <m-shah@ti.com>,
        <stable@vger.kernel.org>
Subject: [PATCH RESEND v3 1/3] dt-bindings: mmc: sdhci-am654: Add ti,suppress-v1p8-ena
Date: Tue, 22 Apr 2025 17:05:10 -0500
Message-ID: <20250422220512.297396-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422220512.297396-1-jm@ti.com>
References: <20250422220512.297396-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150523_837255_5A6C320A 
X-CRM114-Status: GOOD (  10.94  )
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


