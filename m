Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE30C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q59HgdDBxXW3RUEMQuXbm4IX7T1E0mDEkoYnlFm6hPY=; b=QnxGAdmvrV8BvsCSwEJPuL3r0G
	QMfK+/0LyQqoM75woGmDOO1jNaj25ivLbTl5R+jP969h0/hYR6t4k2w+mVeW3S+jrFjN3aGYH1d50
	d17uaFmsKNdwS8LoXxabFJWQgszxWFc/ojCWZmEBaRDmulgXty07JOR+H7qAGcdRX6F8sdhHFE9Wl
	5Jf2x0TNECyNr2r4vyZWXiJH5cl3UVuJGwmlaFYk6TZ2u6ySQV/cAXEA+5rLpP0QvlyULn+Sp3mDA
	cBpgHcfn8xzEwBU2MjZtRRH3LUsrV7LYSquvbOIlW6LEfXHtUNezPnqwmKT07CvMuX12egUy/11/3
	aNZp33DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u381A-0000000Ck7C-1woa;
	Fri, 11 Apr 2025 06:37:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Oj-0000000Cdqo-1WuH;
	Fri, 11 Apr 2025 05:58:02 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B5vmqo2020329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 00:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744351068;
	bh=Q59HgdDBxXW3RUEMQuXbm4IX7T1E0mDEkoYnlFm6hPY=;
	h=From:To:CC:Subject:Date;
	b=c/pdu57IciznWH55f1JIfsADzOf0w6WvOn3QV1U9b1eLKe5BmAqFfZ/nouFrbXoSS
	 Zr5CuDwaDWkxtsHGaTe7rHxApdwzjKnZtVOmUy2BwMTog3jHuJ+tCgivD6Trz/kQ5p
	 woTtlXxZ3GZoPhc+9/DZKu1hrdNZT+wXEl5rzpF8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B5vmZi023840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 00:57:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 00:57:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 00:57:48 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B5vhgr048099;
	Fri, 11 Apr 2025 00:57:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
        <yamonkar@cadence.com>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] dt-bindings: phy: cadence-torrent: enable PHY_TYPE_USXGMII
Date: Fri, 11 Apr 2025 11:27:43 +0530
Message-ID: <20250411055743.623135-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_225754_214921_9BD8D1B6 
X-CRM114-Status: UNSURE (   9.27  )
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

The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
using "enum" property in the bindings to account for this discontinuity.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250411.

Regards,
Siddharth.

 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 15dc8efe6ffe..9af39b33646a 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -99,8 +99,7 @@ patternProperties:
           Specifies the type of PHY for which the group of PHY lanes is used.
           Refer include/dt-bindings/phy/phy.h. Constants from the header should be used.
         $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 1
-        maximum: 9
+        enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12]
 
       cdns,num-lanes:
         description:
-- 
2.34.1


