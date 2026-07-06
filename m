Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ywj/R598DHvTK5R2nBVRB/G7elq9O/Ae5ypwi9az0Q=; b=2Yl5FazQkWuuKy2q9AuQuWVLcl
	0/JyuXn6H77sQt1rsJ0fCjQWSvqKPY3JMAtbs2v59/fJVsi+TJ0GFJlDWGs4c9rDxr3LuXqs1YhmJ
	az9LOSoD3XXPacaLhsfA+E9HFaoCPnUZbfvmsWJ428qNgmhxt5PGlKn3G4unu7hQeS9jofQhoO2Lp
	z4vte3GYgqTj7u9lcCySzxDYIFJe5jxTCyEDu/Cw6dW3Pbsaon6yLNciSDZBqI6fZiYEtrhAcKJO5
	IqJ/DByQzp6lQTYuhy5v2hJnsI2iBuZoHg5PCDzObHxRih9T8UUt1S+gwZ/Vqcyb3E8Vu9ZU0PX7j
	24tzT0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgczG-0000000Bdkm-4152;
	Mon, 06 Jul 2026 06:39:26 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgczE-0000000Bdjt-0c34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDHZ0DKOzgvY2MfK2jMwMP4W1Ap0X/+D2ywr03pGwYs24EVcnOMDTK3fzEMY4fsUZaBKxV/GJ8xvKMYkEiWFIxRPoDgozr78nfe51sifipWQQL//L4p/Y4GJQjGtP+goju2eFBdbddBfnSIZa8CRUIi4aozpimHgc88GTmOgKe6lmkkQtfU3IGsZgfel0up+msWYDAWkgift+EJwhKHKBwsBELzIUQeLtKupIkrTWXf+dqJ/8yZOWe5xZJu45IDHc/5yn7kThsAf2AWSOqJLve4GZeNT0dD2hm1Q1G18J/MNWnE/Vx8VUlAxWI31SdomtXpi1JI1MP+pjpaJxKbStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ywj/R598DHvTK5R2nBVRB/G7elq9O/Ae5ypwi9az0Q=;
 b=T0XM0fINz4aoR1jLzbuU2N5k+GSDPtaboWSRadnX+wZrgxl7Ob98+vpxhy//tOSq0XQj352vOFl5sRUnj5k0aUFI8oXBUdxF46zTlGTM71eioPvCz7eAIy/aZdUlyJFY7ekDuyqglkmPTSl0s6eWji/t3v2eA+e2ExbVPbUX31ZljCRaH0HkQMLrhTOIBIAhRYN9FA8eOwe+NIByr0sH8a2sHWuB2tfy1upk30T3/fA6fSFrJ2zdFfOuDfThbLctobWRgG7CGzsNzXB66skBh6MDHOwtRBR41H9ubEBQRiiP8Cbo3BCTQ4SlnLLuMy1d+VMIonwobolrY+yUyTJ+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ywj/R598DHvTK5R2nBVRB/G7elq9O/Ae5ypwi9az0Q=;
 b=W5+MuV0vkE5VskfQVYZ/SQkQWyWFh8XDvi0ilfd8kSvsFB0+/9ecbnQm2/MxgKU/Nkz6lTFeqEXoB4qOTbGPphR0Heup+c2Xe2N1SgOl/1l0oEc10Q2ok1XZQmZjES9YiXLpAvfIov673+p772VZFaEp55wOugKxXF1B+0YLpIbXUT3vn53uQadEW1bbk8eNSUXbODMku1h7nAokME8iVjHwtZMpYHX4AtZ9xEtgViuBT2SzddUWdH0AkrEKWj2FV5k8jgzbtPHkKMHQEKaCc9eGCJfLjP6xz6dfMFol4rbrZXdllMQvvy/SXUIQ8nwEfnOoGrxWZU2qm/MWOs73sQ==
Received: from PH7PR17CA0072.namprd17.prod.outlook.com (2603:10b6:510:325::20)
 by CH3PR18MB5404.namprd18.prod.outlook.com (2603:10b6:610:156::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 06:39:16 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::5e) by PH7PR17CA0072.outlook.office365.com
 (2603:10b6:510:325::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 06:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 06:39:15 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 5E9384186B5B;
	Sun,  5 Jul 2026 23:36:14 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Sun, 05 Jul 2026 23:39:05 -0700
Subject: [PATCH v2 1/2] dt-bindings: arm: axiado: add AX3005 EVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-upstream-axiado-ax3005-upstream-v2-1-2dfbd1448f81@axiado.com>
References: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
In-Reply-To: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=syang@axiado.com;
 h=from:subject:message-id; bh=lRd5fEURFEd7L6FVtJkfNOmGCkYyQJoZtmef8h3/52s=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhixv34nRQRu81Lf1Lpfw9T+uPSvhjoqM1+elu9T4V/jqr
 Fu399/hjlIWBjEOBlkxRZavOt/yT+Zq3+vcu7IUZg4rE8gQBi5OAZhInBcjQ9NEcVcmG2/+q60f
 mxovKvCYx5d0sNrueeT3NpdPn6u2kZHhb30kgy5PzO3g5ZwxmR72y5JnPLkjYSvM0LGOL8FUS50
 PAA==
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CH3PR18MB5404:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db4278f-6116-48fc-fc95-08dedb294c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|3023799007|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: nQb/mBIPFKXTprkJU668Reb6h6E1fZhWoih57SpyCpLSDMER/t+7NoYI6sw9hZqqFWAP19SWu5omFF/B2CWkleTwxi7P/NNjAvaDcsE5Gwvz11ZRsUU4ISIeNvfHr7dcuwtwdJX1i7Dh/gz0oNUTVNGclcJgvU3ncZ3W4GjIQ2jsc6mTZmPICrcYGJtuE4wTnQapHafaWDZANNg+S2QjsiNwkSe4DiFktthWeeZyivolXmRxMTSeTlZXRAbPfqxB7WMbj0c/bobAlCKmKTgf+J/A75lnTfwYrVr+aCRkdvVHZCfdeajSjIuvtHIZWa8I4pwfPJksMILZp4N3JwO88u4B+2GoS1VMaQBcjwSxh773hf8UGG2KGPqHZ3GDaD092TAIKajo69i0X1uvOpjY+Ikj0PejkhWyS1I6KjCV/ZxyXmYoZhquitNs7sIkgGP6ri32YDJghIQPOBuNP9xctbohjF/5+7EW8a3zkr/o28WkrrvsM9/h5fYTmaNx6DO3aGBiyF3ddN60jiTytDrS/azEutgP+89XUm7ffQOZyIe4VPdmdmWJI5bJMVdbE6+a2h7ocCoJl3UVmlyW+yepcCerBhG37Kti1SKwi7LQ+wzeNFqQjVpKR9UDNbx3hsdjPxJXBiGK8HkkehJOQFZIDrYtr1qz16Ma96NbQMGeqyebRcqJ6jsATm1zH+0TSovHgTe2tCEkEjTxTPEVGCmYfQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(3023799007)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VW/T5yOj73rwUZg/u4Ny+WvIERRuGdsnqX7HzkK9sxSCQuK1q8gqg1WdtjGTHiXCd2+CLu0ZVD/KAlaOJhuydbBu2WKlop6cESA1i8KAZwASaTks/jA+1aB/NM0ShvlEVrY35IkxWQ7QDCloDVqGKHtfiZDy9S65oXIKVdBjqhnkyCWNcfbGXEhOFhnAv0N7D8p0tuXH63yT+xIUu2v8m+RymI4JUopRqWengC54lEqMxrMwJRwceC3ZxYmgm+hc+wxflJHdyWFmC4Ebmoowq90FebCS5uEQk4853wF5VISR/yYfjzf7gvlTceEaQ9e+7hOnO70sQF0Z5SBZXvmqBw7qP77Hf8N0m67dt2FuYfatNXNz7+zSDbLFAbaNeYq8d5iF6YIETXfMqA2N2Bty3eNZoOiECeIlucFFQhPWYDh8sZEMDplM3Sqbx1UUQtIK
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:39:15.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db4278f-6116-48fc-fc95-08dedb294c4c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_233924_223815_B6994ED4 
X-CRM114-Status: UNSURE (   8.10  )
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

Add device tree binding schema for the Axiado AX3005 SoC and its
associated evaluation board. This binding will be used for the
board-level DTS files that support the AX3005 platforms.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
index bfabe7b32e65..008d2b1d4e62 100644
--- a/Documentation/devicetree/bindings/arm/axiado.yaml
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -20,4 +20,10 @@ properties:
               - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
           - const: axiado,ax3000       # Axiado AX3000 SoC
 
+      - description: AX3005 based boards
+        items:
+          - enum:
+              - axiado,ax3005-evk       # Axiado AX3005 Evaluation Board
+          - const: axiado,ax3005       # Axiado AX3005 SoC
+
 additionalProperties: true

-- 
2.34.1


