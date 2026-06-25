Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8A4CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2bd08AtIgkUm/Mk9LWGUz7CCxct3jbbB2dUSxhJjf9A=; b=JG89yqlBbKWwwq5goA3HGBtXIz
	h/bCrE5KeKkV+uWDeqGgj7MAp5g7L1MLTS+cD067K+dbvSZVNsOLzo2EayZvoo0narLltzcvScbd/
	0x99pn8iWrOH40euUlVdkGXdqMEs5ncQg7IXo3UWb2D/dfzZoBiNszxzaOkdtLyvZg1cyERoZ/ijb
	gGV2yLm682JHNS0Y50aj3LE4/91ga7XPhGTuOClp3gSl3hRtSHiNfAIXaLEHRgu8y49Hg4eSeCmd1
	WsfKOq5usAoF7rznjMLke4S6J012o09nGleld06OSobn90InGm9kRLZkGsuXMCpwkwmJjiqC+FUNC
	ySQ++oHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXJ-00000009RXo-3WZM;
	Thu, 25 Jun 2026 16:02:41 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXH-00000009RWC-2ozX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNz+YsIFyznw8nJGibymu44GI5hawdrCKoBJx19aCIuuhC9sE9ll8dMfMOmt+DvgpXj0krvrcdZTwzDJ+5qdArdGCPTDOhpI/SD0/6eij1xxI2kjF6kBlfAtwTL+YgW/z956/vHPsC8tu2R98G/j/GqVVMmuRNIBISaIVGbn/TfNZi3drtkmnw1eUyvDqyiX8RymimhRKCwOmyBhUiBJixru7fAZVGedfZb5j23M2OwdCeCZF2zoHgSbeaYhzxai3uZsQa267v1s0CMLndTsQDqkiBRnAPovxeA7Pc1CVH66nXG4UTm727DKE8hjVzcj3jyd6HElAdK/WJWYfZrE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bd08AtIgkUm/Mk9LWGUz7CCxct3jbbB2dUSxhJjf9A=;
 b=eti1lc3snrhIDSyNkFpGrX6BkTw16bslirOfUF0dsTndwmhVkA6nGE1FpRgwnWEDajqqlDSTYN+ovHomnE1NC/aaFNPOiw4rLqgrizZhNVKIPr8KsmVXkAuC/AGdDPaVPlrGVwFZwELAuCM67pa6X8sxZQO3WbmrdzA5mjsVtNheLiGT7g3KdIfJsSVpk2oYnb0GkHAsWvxrIbexcwTp7tsLtYX0rr+0nN77jdf6n+firynWmcs/EHGt0TblFWwzuEcOGVDB+d07w1OGMTFBnS1+cEI+ak8b/LS0Xh1uQ1AjOQeDMV98xWOMw+Rg5j+ldf46Sg77YCLqXX70Rjzj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bd08AtIgkUm/Mk9LWGUz7CCxct3jbbB2dUSxhJjf9A=;
 b=EV2r+1vNlYZttUjOOYJX9kuhv2ri7+Qw8f+UekT2GF+rv/N7KCZbgqAuS4TFavCk5dGzlw0T8qhAl7zQL7935H1rBlWFS4Gswurnql31g7tU9q69tAs2ogMIl+xAMJ6CbKyKqasL+FRS7XtYhqC+eDBd6RdlXdzIyWnKCdx4jXMIoC0MCY6ujmh0AhymQYl7g5lMU+62XpLhIjb/qhBdbD/8bBhScg6JKvuObbEOWxMEiL1lKUT+zJLvfIDoFV66G89b15rvry56SZSzxEyhjzohO0XlqWLcg9Y/WB+lV7lhpLdkYptEbqsVZDzA7yYAGZVZTzTDaIwiDbfxBWR6jQ==
Received: from CWLP123CA0200.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::11)
 by VI0P195MB3250.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 16:02:32 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::3a) by CWLP123CA0200.outlook.office365.com
 (2603:10a6:400:19c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 16:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:02:30 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 18:02:28 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Thu, 25 Jun 2026 09:02:13 -0700
Message-ID: <20260625160214.4001298-1-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|VI0P195MB3250:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c82820-c8b7-429e-41c0-08ded2d32974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: cWCGT99rR0uAByS1QUvijz2UbkW8Twz+1lK/71ZjBOg1ebap703cssQPwwXjgvjlK62ZvTHfYF4X76o0vMrGxGKHmPW4e9BhGzwHwVGphVvysHOj4hEmEsedaXazUx5laGIZ8pz6K6kR7PACyRcVUGFgB7LmwkRYm7bwuyKosYbqRg7MPO1ITV8ovyiNREkOo/aXbVqv6Kqtt5ZcOefjQRl4qt/veZlZYSyliaELcoMOVwRIPC6K6zDbWVvb6EMeDUi+8toTzLsAV+gC+THYnGs1hYyR4ldYGdCeF1c9BNiytUi35DUMkD6KhEbyQ0kv+r8Y1rSUPaBMt5ARdmhEFhZILHw++EhFdIDyDBIjh4+PA9B1nSOxZoDuZbAmXtm1QFS4XlLL3Ohy3o078uB2q6Ntdtr7dvU3ScntJr4B7/QHDX289r2KZH7GvMakE4MFAsYO6N9Sz0QvXY7IE+N0lbb5bx0QG7OlKb4fZhnJpbg/YhdEhOqyZKDwtOxFY9ItvPj7S0aRjhouE6XiPt7Sn6RNo1+D3pDj+hdWN0YCOaKfL/SOuhFvVNZ+j1aYshj+sc8jp2hN+hQ5WPZCDylr11pElhmyjKN/4j00iP0inB3QGNHItC8nBBzZHralaKq8Cq5v7moTjt+9qN2Ch/rXZUmdfNO3qm9uAdcpDa5lhLycMw1vpIfkfnHzWps1tXofCW26rMgN9jPE3SoRNG5mvQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TjNl4frUFBqW7g2/CYNgCvWtTRrlm2476Toxum2AbsIQszTJeHlBVVL/GoFEzbWEmY8vZJs+OqZQrUhwZNzAktEdhnRAcOE1vXqEMX8VI+CbcdgniScP1qnPnkK0qR54Oy09Fq5JLtxyPAqihgReny7UiyEPoEv+TjbR+V1g3TKqYTX/wYGyKbnwgm9q36XWdltgI87sjQYtSfCdI0bwrmr/SlrTpwPhAZt7qBPN2ZJRgCzS7xtTfFxIh4XNkzdaK9nDOvrHTVUBUqpY5dHXGGoqmRrpDnHf5qWdopKhHlrNbDUfkEjI5dLjgyyIBX3a3e7CjIdm4NbyDG3RYxjV2amXQzXD+K0swQRrlAL1fQOrcvOtqD06pUKmczu+lA+lRmJItZsjufWacW6LPjJdD+diZs83/wqIoIx6Xz//DOrhhyEXI7tq4IdAYts+Z9qT
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:02:30.8156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c82820-c8b7-429e-41c0-08ded2d32974
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_090239_959338_36D58F70 
X-CRM114-Status: UNSURE (   8.06  )
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

Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
phyBOARD-Rigel.

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..2dbe461f4520 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -222,6 +222,13 @@ properties:
               - ti,j722s-evm
           - const: ti,j722s
 
+      - description: K3 AM67 SoC PHYTEC phyBOARD-Rigel
+        items:
+          - enum:
+	      - phytec,am6754-phyboard-rigel
+          - const: phytec,am67-phycore-som
+          - const: ti,j722s
+
       - description: K3 J742S2 SoC
         items:
           - enum:
-- 
2.43.0


