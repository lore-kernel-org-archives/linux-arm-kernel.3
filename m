Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748DFC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrHKK2/cR9fLLcmsFnPjQPXILJLv2lNN3wTxiUPRS4g=; b=GuK1Rrfdce3kroMu6O/xyEc5uQ
	AhGkSvtgbVuQa8mvQyZTmB/ptBxNoXGZwNJk9dQxC9XzLkOUTXR/a8qcsWw3tAMJZbmZVBT3d0l5k
	gYzcVfrpFGK9bMTcOvL+OyYVU5gqPb56pNsdtK1SQeThhjCGoxq6KI90MaJtcBwiSpsPQbrkHIfsR
	NPUJCwdI2c66B6lMzAlDAa/G9zdt0ubj1dUMd5T1LlLQZrmdHGqxc/tqBfWBaWYIIhvKxQwvJmHMd
	jAEDoonxlWHzv6Weow3FE0v5glv+I2R4plFRxgnSTPXoiUL/5fjksSLdopEQ+kLi+h1Tyij9mwnJO
	P+oWf8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwh-0000000CGeR-38oi;
	Thu, 20 Aug 2026 22:09:11 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwf-0000000CGdR-1lIp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:09:10 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KK6dPa1414534;
	Thu, 20 Aug 2026 17:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DrHKK2/cR9fLLcmsFnPjQPXILJLv2lNN3wTxiUPRS
	4g=; b=BsW3D7EZKsQMaeVm1bOl+PSd/h1QPGTgrNEpoqYSqwifk6obsbOjvjEwu
	0Z9cEKQVukEXVLY+0NpG72AcOm08wL8JYW2UgTZX8aCbxIQ4o6s4TIaWwHqzh3nV
	RDaJTVBF5E+DKPdH3hg+z4PQ/AuwHNK1tCBiya/CvXuetHt3NOowdleyq2c5OLQV
	x7jma1IZmtPAuilPCoaRlizY9ATIfvP7r9+YdF3AkUw3DfDmuuJo8LQuz6s9Smkt
	VKz/7gaPX9sv7iKzgnVUurhvMCASrHPckyFJBYPPTNGkKTljJtNHbJUQ7hIZAJJT
	suWprVx9NePX5kLOc1jJMu9H4S67A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrxbrh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 17:09:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtsznmOhBzD4Ddaxy/CjOupt3Vje/HMGiqgOJrrZ+Zc4EJIuqWGUX3CHge6xJGwT/Lk6E+I7l5bt/VexSlwemvj5N4rDIUtlBYqt77QdQy9zburp2hP7KkHtM/10Yv60iHJS7NSeDbjuOjRrCDBLyRd7kP2aaL1HgRQl+LHphJWmaTDUxlY5WBm/g/vzMddrVsJln77+40MTtfLwHueJBucfaWUIRBoRcfgSh4tQWXtxM9ll5sYgEnJMhv0fY92f4oJ+1m8/HTrUWOj8kZk99DK2fihaRzbRZeWGL+XJQ/EMvhrkfcEIP9ZdKx1WMoigTevkF0kIH9TvbniiUQdLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrHKK2/cR9fLLcmsFnPjQPXILJLv2lNN3wTxiUPRS4g=;
 b=jeqeZooD1qOVmRsy5z5di53QTHoNpP2aHgh32snV9t35T6Bh28eCasZ97LzQHNxobrRm4gd1KyC/1/Wv3zoyhuxFQGFmX6VCvP+fGx/91RkcCn3H/rktn/9ub+V/LdjjTIUvN0aB3JCAIiZdmjHpzzi69FI2aoXbK6aNKIRgLjm2Td5R4ybx1Jyus+QCzvb4E5Kh4HxJMAA+1wmRsE7Y1oYtXvT2dnhId3DHAtmka6fLU535DT+3O2+TtHHJQVXR0AojTU26uUgjwiXb+8lAEe+c7T/l6COxNMRT572UYLxHwD6/64U/qIFR+AdzUbf+BQnyJq9eKZtpn5c9it8aAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrHKK2/cR9fLLcmsFnPjQPXILJLv2lNN3wTxiUPRS4g=;
 b=NrQ31NYQ0tmpmoS0eHCrzWrCswV4DBdgV6GfP+x+P7JX2bu5FgjusKDHwy6Y8OWpSMC294pj50oqVZt0cqpkxuoNLQyGretkBUy7yS1bXl9bbJx2Biacex2vBgmjlMcUT/cExdB4T2h52umWJOh4bzkyFNP/b4npb3uLFs9BAbE=
Received: from MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) by
 CYXPR10MB7921.namprd10.prod.outlook.com (2603:10b6:930:e2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 22:09:04 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::9d) by MN2PR01CA0066.outlook.office365.com
 (2603:10b6:208:23f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 22:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 22:09:02 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 17:08:52 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KM8pf3933246;
	Thu, 20 Aug 2026 17:08:52 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 17:08:53 -0500
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62p5-sk: add out-band-wakeup
 property to m_can devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-smth-v1-3-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
In-Reply-To: <20260820-smth-v1-0-e1738a38d58e@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787263731; l=1238;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=JpwMtpDJ4mH5cTocCVyuz9udG5tolZCl6clwIpy4+N8=;
 b=tpQ9//we9p+Zzjn2AbvD/ZpjdgbtxgbqMCM3onVHUPTNF3NLrAwkls848QGxM4lfJYDzr7ueq
 FLYrhBQAt3VDq7yU3Q9yLCu7EEcFnBlz2X8K85EXq9N5cA2aQBPvsGN
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CYXPR10MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: add551a2-59da-43e6-be8d-08deff07a4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: UcY4cBEbaANQlZQKLCO+Plk8mek/BHjBx+Q5hHC1xH8vWnm1bvNxTbIbNVLC50tE9LuQPyz6UE/JfN8UYYw5BnWNzEgUXm8Rji5nRcyJCDm6lVdemMXw28lXRH7RuuXWK8xUSh2Y1BwL+E3M0f7Cyg4E85BoSShuYURDWMF3+lnDkuCQ4KzQ5v7vjDNC3V3/7t524EU268qGmwnj3++LxRrB4hdNFZri+R41hbh+yQj8LV4gYjmCZYX9x0lMqUwC0Y8FFWqRegGgy7zeBhDdGIORSgGDB7EnnM1iWRRA50BpH1lnbtjVSyojOM4xoY96Y2Swa+NoIxIPkOwLgEk8hEQW2ju/vQOYTh+Pr0c64lhZ8VPVnxcT0FzdlX5n1m6r/35w7Q4d50KdirL9rr3Cse2JBYr+QMR44hAlsxEZNR2qMDXDfdjV2dxLF1RznJxGaV1XjZRu4BZtk676CUDC6Em50pUViBDERMDRJWA01tO6Q1G8KEqKknzjntATndD+GvspX0vy2aSDyqfVY8raAsAn4sO8J/vBjKzJcTkwWv9T1Y76KLQu7avwiG5kh7x/Od4FsUW9JGWO51qJVN1U94cxZVVybymioJc0ApfTYdYQX7SA9JUlofLc6PnigIjKj6vSXTcbOGSCj5CyfANUIuPYu9TDrwaRZRWL12VUbuVRFq7GYS+dKWrtzdyZ7U73jCZzvKmCjrp5G9SZqztVAw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ThJvT+vitchE/hSzmQi1Y9J4pgZ8+blLwMUmmWzpJj+YUtwupMHdSiHwYewoC4tNxw0Pa0SxH9nTtU20OtbZe+QY2pekZsqU2XuXiNTxcmA5Ii4Mh6NXNq7k4x1M2JP7SVns8qowjWLd1n+g+jzui2ZkMTxKZbk3b/p1eOQafMVij08TjgNghqz5BH900f9k/T0d9kjf94ivydoINiFuRgddPoOk2ff3zgcw/xMtIK5gBm9DUmHzkDCv696WiNJq9iFw2nnWrq3k+MFz1vr1IJB9laalBQuuxhB4v2P4tU4uj1oob8po9PqQ0NcBjMAIe17fnsior4k8540NKDoUo+y7QQlWRkNJWF2FKlufvn0b4TFmeBpY/OSEDvg2dos8wx2AI6A+SJVga6phfkMC83LXSnRKxHB8ipOWaTcxjOYo0rzkLo88p9THJhDQ7Sox
X-Exchange-RoutingPolicyChecked: HwTlKaQtB6PkkpNEJioE9mQVri4rgFPn4ATyQobk5Yz/JtuFC3mjwAXEsE2x715yVyaGuYVpXz9txwuLBNezxyqshu7MTCJhxsBXQ+L5Tb7WdgkaHnMt4fyrAtzTuLF4dpWigr9OVRGltjhDDxIcMwjf+TRMfKVRJL8oHL1lzLbq7aPQebk+k6eQfJso46Ku8xqgJRUenJ/sEsMCB39stG4NV9zvTvOnGy25UrQUMh+JfVRa7Sb/BnQqiSHfU4VS4boSAlGB47uJTt0zuIxQoQy+H3xrcAPROGjqsYVPtH0tk1LIRIHnmsRPbC2n0C38+GaA4SUk8DRjG4lNBIrU5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:09:02.9025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: add551a2-59da-43e6-be8d-08deff07a4ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7921
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX3CVPgaQnPxq1
 cPiCbCCxpMFbvK83hw0SoFVdp92jOMMwAybkrA++a+GCZXdJRQ2G5Y53pq9myme6NiW9piyOrOn
 uaKtyF9KqJRxCxrL7+GxFUaKMCewF6I=
X-Proofpoint-GUID: jwe2LjwThWxzzpb8VSnLuHvJgxynTqG3
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a877b03 cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=EYfs_Opt0kYZZa2T1hQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX8Mzs59v78nno
 Lpusl3YtEcALwUPFvH01JZ+ADhff7CPs1OLeWOKot+ZDjMD/78mr8AnAP/a8NNWT11fochHcaE6
 10BgUvD528YfhQVHkF+ovnrpKy1WDyBbluAzLida8MA/n//LhVODhICLi04Irrmq9G2qvjpXp3c
 0QrpTp8/d5znRbq/VegXdEcq5HyWwPszcLe1A/aWa9s/J+HWyuhBhJu+aQmvPiBc+0f5pzBMZsp
 dNDBlQIoj8bQJG3MKb3UEHKiT5tBtCrAfrW0S+gBlI7Euh+SkD6VIpun7KVZmzslQMa7Tpw7Wpd
 cw+sQe2HGGxgI+Iy4cAEGJsUgh3FlAugvoEEjx9i57rg4YX0gFCMABK2xaXQ6l4mSAq1dkjwKkt
 MPMgCL4oQU6ZTe1SUR7qWUEl5LJShm/u1EbtWnSWT0K7QZAdVjCaAi3eP/Vl79RYSjpvmvHeM47
 hT5mDoRDj6aI7gbF6bw==
X-Proofpoint-ORIG-GUID: jwe2LjwThWxzzpb8VSnLuHvJgxynTqG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_150909_473300_6660BDD4 
X-CRM114-Status: GOOD (  11.80  )
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

The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power
states. Add the out-band-wakeup property to allow the out_band_wakeup flag
to be enabled during suspend for m_can devices.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..aa7314e8310830eb2281de7224b996ac2e638a69 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -815,6 +815,7 @@ &epwm1 {
 };
 
 &mcu_mcan0 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
@@ -826,6 +827,7 @@ &mcu_mcan0 {
 };
 
 &mcu_mcan1 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

-- 
2.34.1


