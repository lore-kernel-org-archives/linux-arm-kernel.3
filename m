Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E6C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsfvPe3VZW33TbQDwrtBE1kdZUvzUA88lRqr9T9UNvg=; b=HLErsOgDi0/FhiIBw9qC8k3Njf
	PmdxsO5PrM/kqhfiWftZSwBTnYxotb/kuIK1lKzR117srvCcIMR1hQieZH5MqWSJvDc51k4PxOIiG
	eLnidmyZdDewzLAcqlbv0ZKtoyKKItNfe3fqG8YFTNCYkXjDAdUBYrPBkmQhhgqq4NIQaxJKJ8a3W
	SjBYrdPR2Akvt/gcyvgsodNXy3yyc/co3w7avO2kW6uhf8D3gP1mW4ei6NLq/+EPtna9IrSpaoyUj
	KdUIAlx8QfFLzjcxV7nmEt1UCOwtWyK+Xpf7iaGSNkhFnVi+pIBejeZErQ1bDDZMNVWSlOucfhGCP
	SlH/W80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbOx-00000002L2l-1YGU;
	Mon, 24 Mar 2025 06:35:11 +0000
Received: from mail-sg2apc01on2071b.outbound.protection.outlook.com ([2a01:111:f403:200f::71b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbEe-00000002JOS-2tWS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDPigH9+b9b+hApBt27OYwMuJpdAoOdsLuuIhsVB6ZLS/f3eyHKkchM1bYIn4o+t8EsOOOp4DycXKlIlh2UjZVz/t/we/OO8M4OguO5KFBgvDDv+ziU+hlcI5Ye28JQMjjeL4HHh9R9qIuv7CQgzkiMPxlcqKKosNfLXTQxxU8oK+iSwrd9RFxtkISW0OrXtRLSrakKA/wB2/4Z0epQ/XhF2cGWKPGjgo+3wNBNs8LDO+9AVQpiA6TewKIiBUZk0UjaNiaYvZhk7Zf6ZDI2182fnYBhPWv76BgaC662R8/ZbAygY9uPGLCdnSChLHuhD/letj/s+oYjLNToYzUl5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsfvPe3VZW33TbQDwrtBE1kdZUvzUA88lRqr9T9UNvg=;
 b=OM7RpisWdxbbjYpk8F4Y4E3FIdYDf7jirTlvUTRzyAtiqzUGI+iQmRI9pzzMPEZChsz72eNYmitXxOfCgS+ECrPmPQJtPtffpS6d7ffZSGyKZFEPmNxpwpE62P423eliVP81pawVgFem2Q7dkclrfS98Nv1+fEbcFJAGVCJfogg6UbO7ULJy1Vdu+kAXia2OXLo8BVADd6Sk32XPjBA2b1aSxr6Gn626ZIcF/Lg5Jw0TBglXVsLcsjJNH7Ar4CuCgX8VKyC4SBP/8yE/Bf09yAiKMkyLQKy/B+SRkhBGeUKSD3ZQqkP9dMxPsB1btD25xU52STaqfm2BptlvO/Blcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::14) by
 TYZPR06MB6282.apcprd06.prod.outlook.com (2603:1096:400:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:24:24 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::77) by SI2P153CA0011.outlook.office365.com
 (2603:1096:4:140::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.7 via Frontend Transport; Mon,
 24 Mar 2025 06:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 06:24:23 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 02AE24160CA8;
	Mon, 24 Mar 2025 14:24:21 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v5 6/6] MAINTAINERS: Add CIX SoC maintainer entry
Date: Mon, 24 Mar 2025 14:24:20 +0800
Message-Id: <20250324062420.360289-7-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324062420.360289-1-peter.chen@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYZPR06MB6282:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db6cf92a-ed8b-42fa-2241-08dd6a9c852f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A/zKM1vDDgxeMXfz3z5DGzaKj5oHMcx3Lx0PGIDi/7sJzqRa/YfyfSKA1sik?=
 =?us-ascii?Q?I0Kz/b9yfl5WweAVUgvZHSVtlZbcMnU6cRdo8JSkq1pV+m3d0kQj1++hUMI7?=
 =?us-ascii?Q?GHkKjunWzRrg6OQAdRJ/aHNytHo/J9cZBzvRwhntMwkaBdcEkv8IwPQSx03Y?=
 =?us-ascii?Q?87Z26ENyNysRMP5kfHt6plD0haghbHbi7UE7pvlQA5L/FUOFtANzlPDTmfFp?=
 =?us-ascii?Q?R8JmwogzbqdWYo9hk5aXlT1+bEB4tujYvSnRCDFGs0ayFyWx1Phfi3ZLXO+G?=
 =?us-ascii?Q?v9nA8n/aUsVhr6DBS3mvFKltLjwIV9zJsrgKFjfy4WEVSu/31MrMb7QQDtaD?=
 =?us-ascii?Q?7ABVCMnatHAT6ajOlqKgDnTjsjR/5kcEwjdUK3sAV8lOuZdUAwluuMvXK1zg?=
 =?us-ascii?Q?svPpjW6/16u50ajvkrySowHUYydyUEYjCAJrsrUQE2b6vY5+ta3C3biYvSId?=
 =?us-ascii?Q?1n72UkSK5sJ5M3UDbvNiyyutZXhSzi75PcAxLFG3fmDJI89uhzAcjXGqlHzL?=
 =?us-ascii?Q?BqkH0bdC9UCfnN7Yv048JgUaTVRzev51UATX08B1136prO9OlhjGLC1FlN0O?=
 =?us-ascii?Q?dtIm/T5AYgxZ82FUFqizdiXBR7AriRVarrPzeltPJNpybCBokJY2sdbH5Ht9?=
 =?us-ascii?Q?JjW9BUjIyoUiavfNz5qusvBYY1wqjumMJYwctJZ+NWcq8o9QSKjoSJOsQ2Bc?=
 =?us-ascii?Q?++bAce4gMtqplduQXqLqgJ6J7JLQOniou6ffIifu0iW93SRoWcbtVSeyZZsC?=
 =?us-ascii?Q?tBrcaEZqcnJRNppYuB4WVoHIwpWbRIpYdd6JtPIbPNmgobMH5FQ8ooZKa9LM?=
 =?us-ascii?Q?xjALuhKvL68h6pi9G3i4/nJ/cXT9DbNqcgFak4hSoHzn9D4V+avmpM5wqWIM?=
 =?us-ascii?Q?hofL7/2s+vNg4efuFGe4FE4/OWix1oZWXMUml99bS4Qdqq3y1GSPdkHsgdK/?=
 =?us-ascii?Q?niGPk6q+XVqdejVLtUg4rex3lwWcpfwJK6ZQ5rtQjstlx5phLhdQkryoYBX/?=
 =?us-ascii?Q?7QpuI+dw7r3fuftumQ+ujxROD5WTWG9CVo1MFO+g4cSS9ZcRBcWTeltv0Fwy?=
 =?us-ascii?Q?WvNUgaRRoOD8PRZ9+4lvhlOA7Ea0rCzBjE9y+IRFNqUbXzNX1K72veP8oXGU?=
 =?us-ascii?Q?D1xaqMjY6XitjA71oxdBhxyvQvJGylhkLaPGDrsrlWf8VD/2Vz3g5QHY7dOi?=
 =?us-ascii?Q?8UccON5pCtb7VhZlL4tjw8rPLPsPI6GB1u3Zqmo9Vc4NXufuyIwaM5xexc5g?=
 =?us-ascii?Q?MnWIIStNL/sIFB9hSOh0nFg2QbowQB988p0ZmqBWgQReXLCQRcBte9XV0hFJ?=
 =?us-ascii?Q?AhbdasQPPlk/2ptuF45I/xNygFsiNx3L3ePO76pFQpKi7BXM4wpmZTJZa4aZ?=
 =?us-ascii?Q?tOpkuyF9nqZwDQ4Z4aByDjj59Hodb0gT34F1b7NbHpCwmvj3A9XxrOMgJiiP?=
 =?us-ascii?Q?MOoKL6W+H4L+QGsd3f3W00qyApyJWTU5Yb8o4oki8NctrXqEO/PKernQX6Vy?=
 =?us-ascii?Q?8mXuxZvwvZqd0kY=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:24:23.6348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6cf92a-ed8b-42fa-2241-08dd6a9c852f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232432_948118_3C7D3E82 
X-CRM114-Status: UNSURE (   9.13  )
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

Using this entry as the maintainers information for CIX SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v5:
- Refine MAINTAINERS for all CIX SoC
- Add T for code tree location
- Add K for Content regex

Changes for v4:
- Add two dts files as maintained files

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..f400e2de573b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2354,6 +2354,17 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SOC SUPPORT
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+F:	arch/arm64/boot/dts/cix/
+K:	\bcix\b
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


