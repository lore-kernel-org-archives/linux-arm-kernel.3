Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD56F4613F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=; b=gcIrRXdByNOFrvbPMejazABb1p
	Nlw3PBZpr+xlwEKb0tL/HaG1uQ5samccVrzbUp97cgFun5oMHQmrkVPR/S4GF9MuyZIwbFQdGMXTA
	npaxJAEZdn2S+2WCGToMmSpfGYYng3BhSTqgbJRJJ2BuraYEdyYks1uwcATZMTtmgdM4OGzU0LPN+
	KtgMoMG7VyF4cFgts4mD03opst9DOcqcqa9mzhlE/n3lYsNJJgJf3XGdOW/sdgWVD1y50+TN7dSxd
	ZbIdUqGBtZbNIUvrT+u7jii7/s+Or/b7OIgkY/yIUrki9CRgANcJBGc3PckO2rMV0vYhhaY8jRTt3
	JebWnbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514r-00000001Owu-34Up;
	Tue, 24 Mar 2026 12:41:45 +0000
Received: from mail-francesouthazon11021124.outbound.protection.outlook.com ([40.107.130.124] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514k-00000001Orv-25tR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xZ70+yL0iTHHh7wAKDyUuVWlJLl2XLtpmoOjDtWf7OLNjFSdxWpPOpUGzzNt+GI+kgl9awtdMIistgjJZG2M3yvzEYrabMI9jH4rzxtK9pjER1ORFf4+NY1SPfaTSVFmwSyfBIU75x3DbvhQr3KMqvdHuMSiQx0qmM15g70JHbHQkTk5mG9fCyaXcc0WayH8ssdOAPgR0+NIoS8qVdwwkzGKzNeW233tpYMU4uhirQFdjQXtKpfhKcQlQ/UqEIzYUCC2J5e54hySlAak9oZZrWk3izX8fTtqy0wwm/yVT0YFKsUEWNTJ+vYFQ5tjTRtSGhyQcw1ILL/SlsvGhF0YlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=GiCEwK4hC2B2+QgfNkgmyShal0bkWciWp0KQJ/3hm48e1/4W2/Z2Ug4xM26UiGbbGAEym/3LdUaSRGgsdgJiO0T2tYqGroOusUYVGYRu3cJtWiqt1Lxrcms/jAijBDvUwnjIRt+8rExLQP1ED7gVggUncji14TH11YN9siGNCkTF344Qm1/6zsDj30qG0Z9g8A5crfVZ7u2UF7bn3rBTf7iypb1vbOthJbLWe2mKdYfnnfcQSsDFeRdyhWb0Dk5O9Q2D+Zt28t5JNa76ST2nqtalW0oE60AXSd5Qp7P8hoNDqCPUL3zZWMMhwYXLkkk/sDHtSXSOVXFrCaqSu5JrSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=iRD8bEQIeZTJDATc/RkTq1DgM8G4Mg+GazLPxgws+hC7iDB2qwJLBQbmi5ASuoijMEEDm2XOMsUkf/gHCN5nghHPB1uUMbwmedPYITNf+CrCO7oT1ORTh3zzvpz9aY7JVEuALHJqkM1sxPdQoXXUla6EE4FjxGmHAv43teQASJs=
Received: from AS9PR06CA0553.eurprd06.prod.outlook.com (2603:10a6:20b:485::26)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:25 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:485:cafe::14) by AS9PR06CA0553.outlook.office365.com
 (2603:10a6:20b:485::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:33 +0000
Received: from emails-5745406-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 918D28070B;
	Tue, 24 Mar 2026 12:41:33 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:27 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjRRhJUmdVq5UdaHZKajU5MbZpLSUDUURbvkZU/IEOveyEzWN48frr5RH6zBF3LYoL46gDGYMOsFro9sfVDSnMbkj3FK2VlXLWbDHzW8r4diqyyyGK4f8QYTAcXY7RwylZ9UlJ7pJTQYfMgD6e0/4/WHANNXNpEB7J6KC8KIGxB/Dv0yqoNQcGRZDVqraDBoPaQykjwzDCwFspF96gXMpCqLHSO1w6DN6XCuowu4SLd6+Ke/Hf/Dv5tjjcS4PaQVvu8eFQ5aRj/Wk2fb523Smp7V9vyHHKYil+sfM3uxcrBm9uRqM8e6AmFlDWoAhnWrib5sv+oH7RkW6lik6csHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=yWENXZ6RJwu//Jvg63LeLEAtNCJ70BpbsrJScEQRtvC5FtsAKOx7k+cmZGLfiZSHh22j7vGfJyK5jVRFh5w75U5vuWFjJ1janJjeGfpMz11XHIcK+zJFTxhiFidc7noNDU9o5alZPgCEDBga4lw3IEWzSG5qcx7XirRBNolPpywsrD64XHGOtAcKNvMPnd7qqW3Li128MuP3GM2/JoxRw/F8OBakxcdOrmK7C1QBT/0utV2WdB4bmdG5Wy59zErXqKsiy/iJz9hk1O+7E1bRopbqDBE/9FUI2b+QXmnZjh4Fcd+DODs3tB4MluOS5le/CJm1QQtzqsxrD5lWzzpjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=iRD8bEQIeZTJDATc/RkTq1DgM8G4Mg+GazLPxgws+hC7iDB2qwJLBQbmi5ASuoijMEEDm2XOMsUkf/gHCN5nghHPB1uUMbwmedPYITNf+CrCO7oT1ORTh3zzvpz9aY7JVEuALHJqkM1sxPdQoXXUla6EE4FjxGmHAv43teQASJs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:16 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:40:57 +0100
Subject: [PATCH v6 03/10] arm64: dts: lx2160a: remove duplicate pinmux
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-3-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AMS1EPF0000004D:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c4724d-d9fe-48e0-6be9-08de89a2ae88
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: tYsE/BGP4gMDVukW/pwtNoy3Zz49rcE63wGYW5F2S2deXv+Cxcwy/fL1C4qjMxLSVViBBGu7niDHRh8KvckGbZsGAzWitoq9pLEsEvOj1X2RT/nIPH+B7I2/tQpPkkbf+yRUiTQl82UXp4/Zo+aNC3aGSWlSy3ciIWNr8BNbxM6evghbUnzdNBGI4/GFnW1v2wwH70fJQ+CC+d/fTZfc0Y8ScX8KaSl9l2/2oxPWGhTi3ylTOk9ISeu9ScbaPFAJiJihASU1YJD1iCjZBbsYensZR6TTvSYqhV3oZIuIR3ZAiKEL5CC3+zc+1EOuhuS1OzzW36ykPic9PTWxwMQ+ImKg9UdQi8jL98kMthMfZx1WTr/k6srMSdP/Srxp6lfMEgykwprm+PkvDAOkec0Ra+8BZWInhI2lwHOOPM+f0soOEx2kdpy133EKzbJ+8iFyfwAkgpOITbWDEo9sAdk4WqkBJx1HYNF1+xkUDLlqdW56fDWAiGz3/jFfCgiXYfVjGlu91LNhFfzTSin9fYwIzPFl33yR+GVPdJ45oPC2ESFvsEYEsrsTUzVq5V8F+0QYDhWzkMg4nkXqWgrzLs+DXhL5qTEOFN2kxjETMUD9JhiIgAaA1JNuan52Jjj2xP+aCsd9SKSi6U8SptMloOle6sVZYzJzyzsejlrW0UcFxFeHyxSBLZ7QML0KRaTU/fOzhQ3kw+SSP/on5mprAAvojL5FF+HvsK54duE7k8fqeFB7M8Mlmzgxz2NSWjRuuU5Z2KosT9R/E+184x2cD+9W9K0mBrxq7DrbyLMZIty0zaA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: LGxEzSlkz7UzQrfz1Xh24PZtB3mS+m35F+8jibhmcTFt2zdc8GvcaeBRFsQAK2YLbcdT3Bw11ucpVEIZ13rXEwo5RWAHsGVbi1mrcBdl59ECOzdDCG4a1NM/J/7wG5JGDNdts7SnmSgJvXP/ZUXE5c5OC0FJ8ZKTP4IMhDrSR0kJwBTmOa6s4o9NqKBGR3HTCFAFSuohWWdT4q3HivFI9dJQtumlAA3AYLhu1HfJgLDH8r9RzmEKSkAVODp0vmQA/lkUnD1C+5KDVmncUaqjeSq2QI3Fs6WQStnF4kFe15ezpUaoJXsGhMVM7rou1BWWU4MPGBxV5HfR5i+FAjBoPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: fe017d6b208f4bbaba42ddc65a217c4c:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a368c332-8571-45d1-524d-08de89a29a63
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|36860700016|14060799003|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: u99zTAX0kcCJAaJAgRB6bERv3rGqWwHReRaEHgX8UMygtu/R+/y4MJH4tTsY6Z7pW5L9TQhmB0is0garFgZIHgv4+ASLSysW4EK4/6VMvrSUaCiBqEcwQ7AakArzeVDsqBxQi8sqeZqYe2WJLLDNvRjlTyKm9GhunHoj6cbe+Rer6JypCsYmlWirGW/COLtvafHPeksL34j1OI1HKppS/sY99Rx8v+3kRwIEsxgm4zIPdL1A1x3QrMUDa8fR+IOxgb1IpXZwGrl/UHNRp66dNiWsUlQXs7Bhga+i2kZn2gHObn7M9COY9dNOlPpE/C+4wxOuC3i212rjK0MKTwK9YN8/gIVjwRZxecpuvwlkfUKiDLTIWB5PwrPgefoBOepdFGXEBKpZ/bLXi+3/EQG3no4VHcK2ZYMesJS39hJ5toFYUmw7eiiBhz1v+BHqIRbCIFpNW/A/BzWkaoW+mDlYbaeL6gLitYJRwIxYhUTYQ4JCq0H1f3gC35EQsjg0Bb0a6iRd9y+O6byyi0gZceKQ9boimi3Mi7YxzyQUrFuMGDsK5o5h4PgVPx8/i3CAFNcWFgwnpyNrro+CKMGq80aWJ/IRj4cMEf+y5E9hXBAWzunRuuEPspPcU8ZOhkETZBQno95Dw8WzDP13OEEboFiezTpf6a/ugcIHiiu/UGUkOo9gv6lQ5t3dePkNKOgC/9yJMH34tQpSOPRyFBsDJD2mmR5Fn4x2bI5RkTdJyKCDcnri8ulKbPnsT/VNlYeB/U438O89vnTWY5CduRfA+Qit/g==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700016)(14060799003)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hb4hKQgHEato7Mb8knegpmrWxHD9tY/hLCXcP6/43dDIvr4aUsY9sD65SD10mFhmkgXdjOERkQsImkPzaFSLUaChvdJDF4I+HY2zMV8kLYPa3Lv0nRCB8eC0N55qK9Zbg/ZA1OqYl21P8wdZE5FDUzu5oIkPqkLBzphScn+pTyLj852UlRGPh5jl1HwP036qFtpX9W+RMqxJz8BnnloMLul9KpL9s4k5SrAGgPfS32lG4KkzjXUblNSFBReIUrQEE/KYxDCCAxPC0ZWh4XCREZMcQlDRDt9QgGsESrBmtyR0dNwHdhg3ec17ANZfgZ8J5jPFXvjYPGiK6D74kRauGh4M95O3KdSQQKx/7rj3rdwDjg+Ip0fhD9N7HMHn/+13Yt6xMny87vJIK1yRgtkEDii37y3/R8LAAAy+Sz/zYXQR2OSPX/C4pys7RR2Ef5fq
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:33.8044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c4724d-d9fe-48e0-6be9-08de89a2ae88
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054138_559341_0B7A3B4E 
X-CRM114-Status: UNSURE (   9.45  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

The pinmux nodes i2c7-scl-pins and i2c7-scl-gpio-pins are duplicates of
i2c6-scl-gpio and i2c6-scl-gpio-pins, writing to the same register and
bits.

These two i2c buses i2c6/i2c7 (IIC7/IIC8) are configured together in
register RCWSR13 bits 3-0.

Drop the duplicate node name and change references to the i2c6 node.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d5bb55df03216..41c9b4253f4a5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -862,8 +862,8 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c7_scl>;
-			pinctrl-1 = <&i2c7_scl_gpio>;
+			pinctrl-0 = <&i2c6_scl>;
+			pinctrl-1 = <&i2c6_scl_gpio>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -1785,14 +1785,6 @@ i2c6_scl_gpio: i2c6-scl-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c7_scl: i2c7-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
-			};
-
-			i2c7_scl_gpio: i2c7-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
-			};
-
 			i2c0_scl: i2c0-scl-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


