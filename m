Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E403AC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPuQrxrwZLvEK72mxFdX85TUG/DP0eJaecEmUdcAdiw=; b=D9Raent9/rTq/V+mE5LWavX7cz
	UfY9qCOCcnO7MPmkWu9FTA2XptSCCePQuO7ByhTiyZRDxjRgeecc6swYoToQqKsfBbBSYFwWwtlGj
	9rAKCIL3VeagKuuSCreCZVsveHkmhtPFRVmbSUyk/P9Q7lyAXTgDNzndRc5yFHOcyLQ0XRttNj4qh
	5N9WHSCNPlf2stsTGO0Ru8PU2Nke0C+HIGHbjNalzghEsBoQ57+wNoX83M9xVnEdieWtsSuA8R6EN
	UJRcJNNbw0G9795bpi4kW7C03Mvs7xTtaz5czN1/30pVhErP+yRuttsEYrVstqumLuBIX3FvXU6oc
	49OQPMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BUN-0000000DMbw-3igG;
	Fri, 11 Apr 2025 10:19:59 +0000
Received: from mail-db5eur02on20703.outbound.protection.outlook.com ([2a01:111:f403:2608::703] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BL8-0000000DKI6-1VkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xc04ftqLLli1Bmqcto6U5Xx1MskmVp5Q8v9uxUdS7HcdiNQ0g0ns5VXz+kcqXalccwJbIFLGOJnXM3/ysTEHQaSBe1y/Lir0Wuq261Ovj6AbRuaEpJ54HFWl2Ulv4BmPw5OhKcT4c4U9zN3LR3cI52UqbFtjZwL/8I/X4IVcwROH4hJ9EcJe2Ke0PtDV5IKqrxJa2V5DLV26tJ2CXnxoaKysGCMuItCcuNZscmg13XAvha/ExOAKLn1vWiECjB14FK/3V4qsrtWCU0/lpMBADBDA7d1vQZZk74VhsfqANZVNhDJ/W5/9cTlXOGTaZTVMVZImDdQU0tECZJaAJmFrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPuQrxrwZLvEK72mxFdX85TUG/DP0eJaecEmUdcAdiw=;
 b=xkRXMBcwJzGLRen3e6aY+E70DOqkJcla91IyTmX6UqiMKVWHOQEXF3O/VeSktjkj+5/Kba/ZT1kCz5StnPnZt4uTuSDBoQQ6fHj9fT7E6iuCUFS7VVViStiVoDuJvxgXJutAPXB5p115OTZRJfp66aG3bOuS95hVa7dnpQWWRPgULMv1dR2S1KT4GkmC33RY099pRBSQzg5obhyhQ/7AjPHeDeXKqi0K1kz9CGvvDnyEW+ebts0iMclTgXo6mdGPDq3sbxOsuzx2sFqAOCvc6Vi74++O4M9Zrqc+gDDu7JXoAEVX8ylOtanyudZV1EywmIArGFLq5hWLYXv7sG2KzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPuQrxrwZLvEK72mxFdX85TUG/DP0eJaecEmUdcAdiw=;
 b=BiSoJTIbCirDGjnbVNb/ydBSSFvkpfqoG1VQqSyYL/3iWSgo0MdB7eXn/yNDSPdloFOmNal2ASrjEVCCBFIY0KUWmlECupjlUzylnwp1QZaqthgJ4lVxi12Tj/5TdcBaBWfnQOsXtH5D5/Fx4O1CwzxHQujmGBOIaBQjwM+vynRQFqdacA9rwFvAhL9UBis8eNBVbfsTezlnHU3a7BNcpBM2pO+x0Joh6Ei81VfeZi90/njR86E3cqGCEYVxkOrxIPRrryV5FRQW1Onlo/x/q74d8GEdAnLPLb5pIbXSijCbv3VA9yeIR+UV9j6OQ5b6eHnBaffVzf/pTyr1arW9Zw==
Received: from DU7P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::31)
 by DU0P195MB1819.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 10:10:16 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::d6) by DU7P191CA0002.outlook.office365.com
 (2603:10a6:10:54e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 10:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 10:10:15 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 11 Apr
 2025 12:10:14 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 11 Apr
 2025 12:10:14 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
Date: Fri, 11 Apr 2025 12:10:03 +0200
Message-ID: <20250411101004.13276-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|DU0P195MB1819:EE_
X-MS-Office365-Filtering-Correlation-Id: d09099ad-529b-41af-53d0-08dd78e10e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BYPAiLiUXlcgpCNhXv24MFvuVwzdXS8+AqkXV+5Az502hkese+5Gqhn/0lUr?=
 =?us-ascii?Q?U/hS1YEcB3NDEW059wanwUZOfvPmp7BH87HdnN31Hnsb4IYv4+zDcNhQkYW0?=
 =?us-ascii?Q?FibPtTnN+HAHoWJ5BxzanMmoYTPhYbd4I+cjQjyyMI9lnL4d26y13I430juY?=
 =?us-ascii?Q?F0aXA1NKlBkguIlkGhD1hsM8+SxAZDMfUWXbxYbKffg2zFVVGAPeQ5nykyck?=
 =?us-ascii?Q?Uvtj/5wQjlBhJZpILnAIPO2G5V0Wdo+mZT0jl0Q+BCcn2IrOE35P5GTH0Fok?=
 =?us-ascii?Q?dVLJhCggwQjL9udWXS8BIpVIXAEcrHoK9Wz9XV4vlq682Oz+tgRBBrfc/M4J?=
 =?us-ascii?Q?srpOFoCaNzj3Pdt1mbr17tF0tQwOShLlg21VZMizlT9fXD8zGp3/wqD0D87T?=
 =?us-ascii?Q?TH4g6vf4lYwnRDpkOXCsTn1HA8x+txe7DgZ6HrlDhNbZXKmTJRgdT4YruvDd?=
 =?us-ascii?Q?54mA5wUl6b+lN9IRDErbzW/Dir5ihcjtfxSY1khxQs38Vv6bGZJY7jHebDix?=
 =?us-ascii?Q?sZ/y6fxarsUNe295z4Aq0HsLiLIVCEP3X29VaPFrboriR3ulzG9ccDY1oniO?=
 =?us-ascii?Q?1GDGFyGRl7fKmzOZ90x3Gf+tTKVQ0hp6MoBQ7E/R0kvDfqTFMR/tg2jC6TGI?=
 =?us-ascii?Q?3xiL2P9xcZRI8LQ/TOtgxybVHh5i7g6DZ3GfvrQsiwI1SOaqaqyaLhtj/c3Z?=
 =?us-ascii?Q?VVfB5Cv/YGTPHfy653M49NB0BePh1uSYtxFAk0rCIf440I5lRc6v/nO0MirR?=
 =?us-ascii?Q?xeCerzHjn725NureWPpPAZtCZegETuyTkIHd14kuvjQC08eVxG6/Ja/Z9Eid?=
 =?us-ascii?Q?xOwDFCPq3PRpRR+0xAfXeJFscvgvHSWrJ9G0lNsyIiWCg7ph7LZ2+FYFu4IT?=
 =?us-ascii?Q?QBR+9QG2V0qlNMgZBIVpaPo94zPutfNQQ9C8ELz2o8zhtTde3JakuYByhAUP?=
 =?us-ascii?Q?akZPyyzbz7N67c1NNxYp/688bCAveCU5k23Tk9FMoCTr8KmiK5vAOqH/R8bO?=
 =?us-ascii?Q?30JKZNJ+lTmgijDrcSgWmyBFxpsmoJbkgmBv5SBDwNKdkMjU1OGTlbLIT4F/?=
 =?us-ascii?Q?5+AT1xRUQghc/YSMXEAmGSVLQO9TxXO1R9ahwUuqOIkaom2JJXK17EqL64bX?=
 =?us-ascii?Q?2QTGYCoLeBi6lMPY52LLG85lGiy1djxY4RB1XoKA5Y5lZeJF6fW92dr65BwU?=
 =?us-ascii?Q?z7cl6ySvGICizN1Pg+SUFWe1Z1SNaXJVQXMp+GL8mQb/KaxMMwU7xalw5prh?=
 =?us-ascii?Q?Me3CVKNNE9uxF308DjUTSxviAbv+uynXOy+rqYzfzcduJCW0m97Hfv4tlJMV?=
 =?us-ascii?Q?WB8LokWyat1msB/bYvrxLK6X/uuMgGbbYPud2ohzBCxLLz3OVy0igJ/ahvXs?=
 =?us-ascii?Q?tWPy9YkKTBQNaphpUKjZUsbef29liuEXIOtVtVLd276zXgOCLSqx8pd2vrOD?=
 =?us-ascii?Q?XYT0sSm/baeSuVD0xp3RQ8/s5nX+1IgqWfa1tDs35DLHEWP34Sk0VDXBcqs2?=
 =?us-ascii?Q?iCoVkrGD0BdgQPtZs3/gRepJOHVsG6ulK9MP?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:10:15.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d09099ad-529b-41af-53d0-08dd78e10e55
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_031026_754127_C7E525E4 
X-CRM114-Status: UNSURE (   7.95  )
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

Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
and the phyBOARD-Izar carrier board.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..a03fdb9c0482 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -135,6 +135,8 @@ properties:
       - description: K3 J721s2 SoC
         items:
           - enum:
+              - phytec,am68-phyboard-izar
+              - phytec,am68-phycore-som
               - ti,am68-sk
               - ti,j721s2-evm
           - const: ti,j721s2
-- 
2.43.0


