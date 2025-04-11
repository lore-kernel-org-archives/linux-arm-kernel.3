Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9687C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrx9fTvidzMHg5rKXmJJDzm+O68SCoI7cvY18Dkdu+g=; b=cozRlJVRveBz2rQTbUCgTabgmd
	IxdNQWf/Edp/aiwApjO9TKKRL78zJRg4lRrFtazlirTi2KcLEWa1kX3lFF00BAAEjJrD6uBhbHxBA
	6gTEP9pvC+CM65ozHNiMk7qtgclHnBthw/7o88zth2ZIkpKfOrg7JTu+d9R9h9okBFgK9QGeGhxE3
	246DrN590Lp2fJGOYe+YCrgYgZdn8dNrb3D4qAlvGyirJXFIZvezEzAdZBMSqC1Hrh1hnTDsIgs6v
	XduJXonyH2aCb5GfsWkBmhiQOnI6WQYULlfsYhe/XbPOdGSDDYKZpmfi6n4jB8qWI/MT2TGqBbxAQ
	ZkwFLFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u384j-0000000Cl0h-2hmd;
	Fri, 11 Apr 2025 06:41:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37a7-0000000Cg46-2pG7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:09:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69WLW1991990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 01:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744351772;
	bh=zrx9fTvidzMHg5rKXmJJDzm+O68SCoI7cvY18Dkdu+g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f1al4XugidQdDKyXUVMIN8hWprGXmICaPfHG6IiPix0D6kcHKGFAGaVqJ6WvKtSXw
	 EbTExKZUDq1xv/wZM5vDPHKy9QWeSQDg6DNQhCPbGtsYIrxqDUz2G+LI1w4+DVoPVq
	 VXEkeEvt1ZUazdXNR9+J5ELdWXnTP1np20RuI1Ws=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69VVQ049863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 01:09:31 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 01:09:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 01:09:31 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B69IA1065579;
	Fri, 11 Apr 2025 01:09:27 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net-next 2/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: evaluate fixed-link property
Date: Fri, 11 Apr 2025 11:39:17 +0530
Message-ID: <20250411060917.633769-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060917.633769-1-s-vadapalli@ti.com>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230939_756452_6E98B47E 
X-CRM114-Status: UNSURE (   9.30  )
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

Since the fixed-link (phyless) mode of operation is supported by the
CPSW MAC, include "fixed-link" in the set of properties to be evaluated.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index b11894fbaec4..7b3d948f187d 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -143,6 +143,8 @@ properties:
           label:
             description: label associated with this port
 
+          fixed-link: true
+
           ti,mac-only:
             $ref: /schemas/types.yaml#/definitions/flag
             description:
-- 
2.34.1


