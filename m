Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CF9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBr3egRn51LlWwzE9fKRmXM1hxpuu0yxm0j2GwQQe8A=; b=zWYT3xnq0U16Q+4f2Gs71h99NO
	Ut1IrDkhzybDE4WrEaOMsDXydvpCMG+7XCzWtsCUfbFanwY9XA6nEfpdXpbkn5xEC/9htCToQiTI1
	whl6tzGNt1RfWdBrTxQiyhy25tqAjrpacnmf4wsaQIPTRBz/VIN8D18DLArh7gPDBiweWxbwhxi4P
	m2trhqMe4pf73khCuumB1OgZ7pW9+84R8ncTpayOjZRVWpEDovWKuk6h0e98mnTmo1Dz8i6bOUkVr
	9z/tQ2Mzp3el7GMn9LQuN9VyQ8SA582OFnspdLTRMKNBhtmkdEDezUO4cdXWov0VU/tulsLIWjrez
	SAk42aEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8vb-00000007A11-4AUa;
	Tue, 21 Jan 2025 07:44:03 +0000
Received: from mail-am0eur02on20603.outbound.protection.outlook.com ([2a01:111:f403:2606::603] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8tA-000000079Zs-2plp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:41:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMzgNbaFTblQJ2YrO+zo5aAWJ9ybCIouMysRiSP50yXjWDXEqKKjSwdFeROyWF/dE+7lvZRPYH1Hc3wWELiBIOnSbDst+HxUPzQqJFxM6QBKwmPsGO8Qa/vS55LTFCStacqy58qkuoBHqdSaS8vU7cQMt9FKpffZn5ylXBT+H4sIFzAY5Xmm+Yxq79ZwXLdwoPFzNxAr18q1Fkgd7kbw/VF0ivFx+FrsOPL187X+gOYNQiihdx7x7QYWv34dpTNrLBvNaaFyxLmJd65L77clk/1ouF3PyMyImlyS9dnQvmzwGvuQhF2HfAh/DdW73tdmo94WOkXqdxGQqRU/J+Ir4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBr3egRn51LlWwzE9fKRmXM1hxpuu0yxm0j2GwQQe8A=;
 b=WW72qPaGKa+7K/w0B/0gCKe/lWDkmbH80YLmJAGgC+kEWiKiuhfIv+qYBjtG3e4mWME1eSU6RHYRsLWW62dgEAulgfwF7MnlgyG373ck6zTBtYp3q4IAMJe39BBCJkNxTNfyixB34rYX40UNNZ/VZUsTs0l7LsTCxF5/s7KEdvcxzg2hVRVlJ1RLxhc+kijiX3rj7dKFzZEI1HPNZ9vhjJwUbwF3QW2lHawndItZdX+CFW40pvY546nmdyXX98DzaoWvJFj2aIgLwDBo6IDXL6LdpFMQBfhb6cN9fMozn+7Eplx1zEG7JEzKyHH18duVg/sz21+KFOy4T6CPUi+vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBr3egRn51LlWwzE9fKRmXM1hxpuu0yxm0j2GwQQe8A=;
 b=S5HeXGyPRzLWKVtyiqzkjXOb1GOnF3Fzw95vIzmu7suKyfEI6HD+stTtuqnpvf1GQBUKBsII552quUHVuuwWnrQSRFbs/XAVxqh21eI3PsNPJQE2Bsps8wPSt5QEuXGfbVxAF7qdqg8GWefWc0z3ZjESxaYctqWjqeoiHyKdmUxHMsQHBG1SC27cYh3STCAdOcfuFSR3sywHN0hzEUHqgKxGFcqGo3uBCrnEDtXQgyz7JX8vwzCSDB6LmFe6Qdpg3B8iL7TQt7/KAz/DSZuKk92E55YgGjVeWACYud0BZFQepA8l8MLZxJG+4qXO+tyn26MI2GJYv+C5ez/qErL+pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 07:41:29 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:41:29 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: joao.goncalves@toradex.com,
	marex@denx.de,
	hvilleneuve@dimonoff.com,
	hiago.franco@toradex.com,
	peng.fan@nxp.com,
	frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com,
	m.othacehe@gmail.com,
	mwalle@kernel.org,
	Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com,
	ye.li@nxp.com,
	aisheng.dong@nxp.com,
	frank.li@nxp.com,
	carlos.song@nxp.com
Subject: [PATCH v4 1/5] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Date: Tue, 21 Jan 2025 15:40:13 +0800
Message-Id: <20250121074017.2819285-2-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250121074017.2819285-1-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 740fda95-d43c-4479-73ae-08dd39ef04a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WnNv6eqG6iWv83lZfSPJ3iOwGGp2YjkAsO+LBDXJG49c94PI9ItJNLUKqaCy?=
 =?us-ascii?Q?6vXlN6AU2KfyFIJkT8XsQggnz+icRAuJd+7fnq3rGtxne80SEccOGxk2aHIL?=
 =?us-ascii?Q?ilOiiDByzam454T0cJU8WpDaFRI5iH/WNWGaDm/aInqyck/tSoZQJo9NhhGG?=
 =?us-ascii?Q?2Rg34mAXCgDaMp01eskTrn+c6BReUP1En1xFg0THKIj6dZSBYj/qib3H8JOV?=
 =?us-ascii?Q?qj7neCVq7ZBMOHA3ggPgYpJCEgQSdJWQMYzf3EP9MoOLcs6KHhfE4h3TQbva?=
 =?us-ascii?Q?tTLljgK0hxKuZkw/AposJ7u7iIlrWTE/EZTtUQKdilvKl/5B4h0PEL/mdTtn?=
 =?us-ascii?Q?eD6SjC/S/AqlMSWgfHeFFrz8CFKCDW7qCTQFe+uA+DTTIxcaJpp/i+gDZky8?=
 =?us-ascii?Q?4663eC3Af+QURtsr6egyDTpdVPClBHX7ZPG3IAAtQt66YRAa/Ng2pt/8K0Bv?=
 =?us-ascii?Q?wwlndNnjXX7lbhT0D7ii6E6O519t82cCsfaVQ96PB1x6vZqMJTsiZKLbxQ3r?=
 =?us-ascii?Q?xWj9XPy8DxyfAVsyqtNlj8yfMmqFcJCBsZCMJDMLYobzNyNoKfZ6GHMOs07S?=
 =?us-ascii?Q?MAZJ57beRt1vvuwIGYf4zAMqV7AMZVVqmjYItf7hZAuHkltp6LLAJzLHHLQR?=
 =?us-ascii?Q?HS9RdH5XmVi7Tw7xfgsf++mnpeKgKUd4kcIWwLLAtFFF41v/MAB5KRhzUhj4?=
 =?us-ascii?Q?UFkGgD+eHxTWjYpP7XaxrTY9EQa4n/A8xs7eGrFlWtai47G1ENYkuO6OhtNK?=
 =?us-ascii?Q?nq3we8CSfIAXYl1ZzqW59j6rJjB7ZED/uWv5O1uktd6cTKjZH7U0WqPoPaoF?=
 =?us-ascii?Q?p2yi3wlnslokKOae50ssClxvZVZPiOaDq7MzMSjs2sHxhKsUBn6rzIsvEism?=
 =?us-ascii?Q?I5qZ2CKUQDmsV/W9YHHYiYDJb/cavM6rXLIoiumxsMo2VIwDsIRME39UxA7f?=
 =?us-ascii?Q?yUx+XnFD9ElW9Z2bM38o9/xo5/maseml+ETHGiz0iSWGEFVjhNrTMCWEKILw?=
 =?us-ascii?Q?f4fWZ2V3RzfXg0eh5VwBNXxebGkwTN6MKL7dV0d6XxzuqgpImlt6bGXkPctU?=
 =?us-ascii?Q?LBWv4YwH61cKZVzHkMyrAC2/nixETvXtiL9pQwqCgsc/PqCWvIOaGtwJEGqD?=
 =?us-ascii?Q?GOkn4PC0P9udTmqgnbhIWI9fewfgAxtiG3rS5qlr21p8bDBQKnIfRHQqGdQN?=
 =?us-ascii?Q?RtS/mnyLur2kRNGeK53q0FIZmTEi1/efyML48m73Tpwjg24LulAR8OkaCKg5?=
 =?us-ascii?Q?E+UHUZUyRKW5MqtMNqNNKykee9JVYUAkI1VK3W0yq+VTXxm87lkCh1dJWV+/?=
 =?us-ascii?Q?DyBvAIZF0ikJPRvmXX+gf0BGl01KeRYabSrkqrD+7MFO2DxPIhLHZmScO+U5?=
 =?us-ascii?Q?cedBp4U7xSCQb/3m7tvc8ycnUycj9QXgZqVRvEhHv9C+26fdqETkRUQ1EB4E?=
 =?us-ascii?Q?417VtSUM/7fk1ZkvGSqmkotcD7xGtqHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmJ2tHAMso7wXNB/7s2fI0MP6ZD3FrIpY78t2pKb65bySw9MugWjp4rMXPwN?=
 =?us-ascii?Q?xc1tfPVs9BHaMN80f05xYnWmYf+IN02/N+bhS3TFodE+qGVtlTF3SZgXjVak?=
 =?us-ascii?Q?auaMn8g1cQycbilU6GXgJE5iPp/NFQKaInaOkezYIgb1JbpGN3U7yPUCMZqR?=
 =?us-ascii?Q?7J0wE2j6wMC5Wz42UZnxbWSAxG457r0lKRLh36Eu7h69C5W3QLCRhUS9ejk5?=
 =?us-ascii?Q?yguPDsDLvwK4crZ/p+xVaxFUL5obXYqS2K5U5LII4kxfCTltFceJACdtiYXo?=
 =?us-ascii?Q?0bcE54Uvcl3QiDKHwoT4TlcTRhxKLMRL5U4h+eVmcZP/DZUT6GDhZuCRxk+1?=
 =?us-ascii?Q?h4iU2E8ox2gOQkXbk9naCVzMHl9uH75fw7BzVpBWHU+1N/fH/B7WKnXohtCz?=
 =?us-ascii?Q?PyrbwjkoSeQlHHq+GoMWv4L8uocu5O/FdPWzKa0eKODoHoixlnkuHQ6YLhjY?=
 =?us-ascii?Q?NDiRRf59APgpSpWOvnrBC1Z8C9ACK9HrSuV9eqwmp9U//2ghH45s/pt/bFgU?=
 =?us-ascii?Q?O0tIqeU0bxohkbUNRUnXhJkpNLhFDWN4hpnoDEECDF02wcBXnp8LLE8PW4mj?=
 =?us-ascii?Q?1XkRUgObMuSm18Wdp7RyAF6OIeOF8yOv/4Dfhe//XhgFoyVKC+65aDoiDI8N?=
 =?us-ascii?Q?uxzOg5OZqwsyZdjGjV+ssoqLOnj+fuM2k7MaBmEuhqyyVIi5CaqVcyeh1u3x?=
 =?us-ascii?Q?wEQksaeeWVJPKmKa2AEfyxhmWFbI8gwT9WssphUWrxvdP16dv1fbImEkIyTv?=
 =?us-ascii?Q?BtnW5Xkv+cbzfTrzioGWbNTcl51TlIZ8PXilo/9rhXcmBAQpurLNHL6I47hT?=
 =?us-ascii?Q?tEN7ijgc+XqO5ANRpGm4yBMD3+K/NsBb1dzSbcXLgSA9FAXO9UPeLcGgVfyL?=
 =?us-ascii?Q?ZhrZcxFOdXUvYNk+VEM5J/QJmfl2skOhwg4HASllUJfS8+VG6J/oait+ljl0?=
 =?us-ascii?Q?O8IQYawcq/AW20U7r+vgxVq4AiWcNLluTk3Vcy5jO5HdX+BeFAqtJCCzaTrF?=
 =?us-ascii?Q?cSfclWH2U1rhFqJ+VLf350ZQJOuHXd/NIp/4yCXfh2ZwQFWB7IAaGBICxpbd?=
 =?us-ascii?Q?JuNlZkO6XZ1LqR7EzW6BIfsEoGKq/ga8ZmNiOqHn62v6BvYvQAab+0LROxkR?=
 =?us-ascii?Q?aRYXAjQODYkNLL7Q9JIj7K2d9VqtoefVb2b4hCHsg09mYnyx8HOVEGDBOQcR?=
 =?us-ascii?Q?8rt+nnsAXiiuT7UYgtDOAXrVOBX39wXxMxVNfzkIO+27rrWaXIcgI2twZIG0?=
 =?us-ascii?Q?cgCDpn1v1csyVnx7H9i7FbSWn2lC4R5TS0f7l1B6WPMZ98IQzKS22WOuBQ7G?=
 =?us-ascii?Q?V2/QsRkPb4psDPdNqEmwxx6sR1nfzR0bqGtyJQEjWVNfuQ5AjGogGNykocGX?=
 =?us-ascii?Q?nF9gph3BjcbpXSz1go7fcoQazUuMYoVrAk38Yi+FIWPXybEv/DzPFxGlHQgi?=
 =?us-ascii?Q?21BJMXa6tQATcnIACSN3RP9KioMFLX5b+y4Fub1sJQ4I10SS8Gx0qz7aaEgb?=
 =?us-ascii?Q?7mJJUjjr0fAQ7Ck4TOx7tvyAJ7UkZmXd8RiutyRdwYmqr8MRL/dS57U+uFlN?=
 =?us-ascii?Q?IhNLTsVHNtVgTxgW6O5lecC+oLScRJGoysZ3cXC5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740fda95-d43c-4479-73ae-08dd39ef04a7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:41:29.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBHCQV3bVVA3uwEKWR6Vn3CW/zEGPns+P0NCssyGHiKuFHKhUCrNPLKkjUXGBFSG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_234132_715784_F79978A3 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Pengfei Li <pengfei.li_1@nxp.com>

Add the board imx91-11x11-evk in the binding docuemnt.

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 371317554863..f0592e552ca7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1341,6 +1341,12 @@ properties:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
+      - description: i.MX91 based Boards
+        items:
+          - enum:
+              - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
-- 
2.37.1


