Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30663C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlzNtMdCvJ8WJHB5ZzVcnbrvTEmH0E6cLnHPotc85/M=; b=grMUFWrOtE4Ag8MuUe+QxAHpFa
	nTSgZhxx3npH5gew4ko9Pcw3uhwwBg32A/C4w4B2ZzAEGPVUHGF2ig2c7OtBQt2ghwXlakC/xHgRc
	noMAYhAnWmcReDX+yTUz9rCVbu8GCQLKMG1VMCYXmlmlf0Nu4YHUazw4XO8qcJlZoqcXn7YpKSy7E
	8UqkQwx3fRVHsrujFsFpuvfbXQEq0dQgBLYltyvK5LXtc4BcyIvuAtPPXhrLwWzv7RKO+wJxgIX3y
	6CeQDSUyQwl6K/ZqreNElP+2E/kPgXbIQnCQxeNXitET2Bgmkssj0Dz2VqByY2UwdZNm1bKqF/QxV
	ma1HkFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pl8-00000001I5W-37T1;
	Mon, 07 Apr 2025 16:55:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oUo-00000000yc2-3Eum
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:34:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYffV958130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 10:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744040081;
	bh=RlzNtMdCvJ8WJHB5ZzVcnbrvTEmH0E6cLnHPotc85/M=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=dfiXjz+tZrghO9hz3vqjiJV83oUbnIJKW6KFB63+4GmstAC9cet1oniNVk1usGEfO
	 PiQ1yu/v4aiCx/L2nwY6y/e3SUzNFxPg47H9wyJ1XYrdK5+CIa/Eh03srVNZHBZuhJ
	 y+D/9lUSUIWGZJO3KdxzfdRXRB48rInl2bCxkgfs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYfZv021260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 10:34:41 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 10:34:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 10:34:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537FYexL090534;
	Mon, 7 Apr 2025 10:34:40 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Mon, 7 Apr 2025 10:34:38 -0500
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-am62lx-v4-1-ce97749b9eae@ti.com>
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
In-Reply-To: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=bb@ti.com;
 h=from:subject:message-id; bh=Is0i8JlZhucgkMMT1K03bpV/pmZ4X0gQ1S3uDKq5rqg=;
 b=owNCWmg5MUFZJlNZdR4NXwAAZn////9/17f5/ry7t9mqtd/PN2538tf+fm/fWB/f7/z//2awA
 Rq2MZE0A0DQAaAAANNNGg0AA0DTQ00BoAAAGhkAA0NGgNNBptTDSaG0mCZqekHI0A000DTIaAGQ
 NGTQZDQNDQMIA00aZGRoDIAwQaBk0MIBoMTQBphGgNBoYieoaPRNAGhoAaANHqNDJoAZBoAGgaG
 RpkaekAyBkGgA00DQDR6mTRoAA0ABBXQZ6VbrmmbXQjwuzmIKbLAEHXE3r+JfyYbNG4O4H2xyhg
 cNiXUw0VOixDQEj9FJEOrH3+km6iPD6wgMsQyQSw/pykuXbqVftfIy6BokqSqpKvOs1leCFnz5t
 bNVzQuchADw6Ls0ChfsFCBgtzq2DIIQ362/UgbA8kZKMUn3nrOLzrDCRraqC9WB4o292OOXyUdV
 4Yd8QytpsH8p/iFH3luYtEjlbEyzzEMNNg2w84xbocf6bd6g38RyidAcgOd7T+DPr+7RQmjlRpw
 C7SysQcTiyuwE2GKzckkCAEZGNlS0UBtRw1T8Nyg6cKsAfdauJnnQwZD30QdmsRCOo4lRwVtNI9
 Nbu6IjUYxKRR4kwZRoIxvXMuNFmsy6/iPMTdPtAAMdzXl6VP/ERTRkUhJnGor4XuWwAX6hAFbIV
 WYfP4AP8ITgP8XckU4UJB1Hg1fA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_083446_909639_73EE8913 
X-CRM114-Status: UNSURE (   8.48  )
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

Add the binding for TI's AM62L family of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c84..b109e854879cb 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.48.1


