Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A0C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWll8aXw8aHwO/nZCoAePnctU5zQKd6s1MSx1yOQJ/c=; b=sjHI/y3FcXKdRkQnZ5+CWq/ZaZ
	Htjbch1h5uF8sd/CqLfwI4GtotAa8UVtcYUhUrl9SIEQoJFzsdvlL5nZn3On/b4qZTmTKzBcb2iO6
	vcOXeA9rNz5ureGEIqLi04ey43TRf6R++vCA3d1bbmTPQGN5FvqzVT0bIR84pHxaL6fWQ1oGuwIS9
	BazxvZGpRdQe28iSOxMbdETB878vkParrmVqtXnUe8OUsZF2QvnaWt8JKdLTFnTwkDSptEKMPzCvh
	eptqShT/QYY0hCRlasODpHdYL7CnRGRx/H97qaSZmCac+vLsLiWTn2y1V+EWbzDIBiMeNXLOSOSnN
	OT2vcUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRSR-0000000E1Kb-0iCM;
	Tue, 05 Aug 2025 23:52:39 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRPq-0000000E11W-07p1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:49:59 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575NnpVa387998;
	Tue, 5 Aug 2025 18:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754437791;
	bh=OWll8aXw8aHwO/nZCoAePnctU5zQKd6s1MSx1yOQJ/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bIsXxALNZCxgM9MZpL8IVa3U7/riBpqlbzXjh+MAmq05d3w1mVfrqxgkhISs2Jbpr
	 3EuRvOOaRRhgFNMuSPQOFKdhxxXi8keEzUivJFii73yYtpQ0s/twmw1VkR4biyZto3
	 FIrFjpiHRWI+RcVs5FjDmHqJ8NtC/AuUjBwcsqyM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575NnpOp3149163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 18:49:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 18:49:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 18:49:50 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575Nno6n2624898;
	Tue, 5 Aug 2025 18:49:50 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: hwinfo: Add second register range for GP_SW
Date: Tue, 5 Aug 2025 18:49:47 -0500
Message-ID: <20250805234950.3781367-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805234950.3781367-1-jm@ti.com>
References: <20250805234950.3781367-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_164958_152411_F42D8AB1 
X-CRM114-Status: GOOD (  10.72  )
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

This adds a second register range in ti,k3-socinfo. This register
range can also be used to detect silicon revisions.

AM62px SR1.0, SR1.1, and SR1.2 can only be distinguished with GP_SW
registers, so increase maximum items to 2 for reg property and update
the example.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml        | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
index dada28b47ea0..3b656fc0cb5a 100644
--- a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
@@ -24,7 +24,8 @@ properties:
       - const: ti,am654-chipid
 
   reg:
-    maxItems: 1
+    maxItems: 2
+    minItems: 1
 
 required:
   - compatible
@@ -34,7 +35,9 @@ additionalProperties: false
 
 examples:
   - |
-    chipid@43000014 {
+    chipid@14 {
         compatible = "ti,am654-chipid";
-        reg = <0x43000014 0x4>;
+        reg = <0x43000014 0x4>,
+              <0x43000230 0x10>;
+        bootph-all;
     };
-- 
2.49.0


