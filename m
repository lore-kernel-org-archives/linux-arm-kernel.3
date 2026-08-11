Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D966C5B569
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETPFU0f1KkNmrI2f4M/it+AieEy6ri4Ufzx18V2D/ok=; b=Fog0K/ssZGfvmHI47r4Lfotj6F
	CAcpG9qn7MLPz4GSzkOE/LZDvTd2WdLJsSNfAUEFVY5I6Orkrw4q0H+Gzk+QGq8NcLiNMaRk9dO0U
	PFj5zghe6+5W0bW5qNygd8RF8Lbw+3d5D5xNOQQdK17smOrUjvAbNWb65yFKiod+/P+tgegULQhOj
	tYTIKW0LZMkmMt5T5Bw3dJgbwnSo5ObRltcgLig20TPyeV8W5wZNoA5+5BTzrPk742big0JaZ2qai
	Iz9v8T8Tl/LDIVVjjtpvJ8bRl49hbAbtJYC0KPoGq285GMshkj+z96LyQ90g2DPPOHMC+l8581v5n
	pV0U8lRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfhC-0000000DO77-3pcp;
	Tue, 11 Aug 2026 06:10:44 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfh4-0000000DO4K-43MX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:10:36 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67B5UXhB378808;
	Tue, 11 Aug 2026 01:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ETPFU0f1KkNmrI2f4M/it+AieEy6ri4Ufzx18V2D/
	ok=; b=K5ZRI977VSe6HLOUmxNPZSLDprQ2f2xLuYsCMuI2cQ2tAG9nrRt14qx8E
	4DZ1ls0GGWVMHQXB6OPd0kw27HXkPTVYjX15POepH04JSLltNYy9JhMtkeBjKPaD
	+ADiiXiGGmO9CZ6hvvNxPUVUNW/sZia4x/7G2Ql+95tDmIlFKyd5bhaYaReI0dIR
	1xEXk1gN1+bLxQw//9ICUmbYM8CH06TmcOXnw3xGwWdztD5sNwkvLnVyMTtQ0kWZ
	BF3TOc5ds4hSIWi0KZ/ILIwoFOBjlRipyyNQqG9/790seOvTvurZPDTB/qlBrVru
	kjbFUahS9u+6t5yI5ho25cxqYgZjg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7eq6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 01:10:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uH4vtz8m56Y0To4ejdCoIGjxqk7DeEW2+lD2s5dU4BFko6vXu/byOY4oBTok9y0U99x361fUTt693W1vBL8v6r+i4cpiq+l+YqUHb+CBBWeqiP6EjAvKt4wpAL6ZH3GE/eCWvKpMoEiIQThdaeaF0gGFAZUoS9Ywys48dSdA/tbig98z61tUjG/Al8+5ncT+Ke5xDuJgDa2ZWjpdkgHWDVmuNcAVaATazKoS4HV6ZD+j3lKcdG82vqt+g2rEs/VwQeIAXTb7DTnF8rlPEOJbYjySR2vjRyFk/JsqxxhwtmzuNRo0aLHp8OzxGOKj+1FfA//VIcpcM2Zs6OLR3Io19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETPFU0f1KkNmrI2f4M/it+AieEy6ri4Ufzx18V2D/ok=;
 b=X9mN8PYuSCoOoXyQei9qoStYtCDuMmTVvvNkNsJgthWFz6wks6bf1XC+C4x80Ucggk4ABr+7s5wG6r+Y/piJoxSGwzKzKAl8vzqHyf1fztHtWBGFJuMQON59QkSVEGaakkEqhuMy5f2qyWVjLwqQWkU1mirGhWLW5dqHU4gPT8sKph9GfdP+9jNTn17JIjDEU9UrOTa73DyH9rom3z9mdJOCacsnIZAxczf2v6dB0eHpqyUj6PKYtuZ/yLFkSZdZeMJ9bLMWRRl2CzLAnnKzoU+ON30OT+dzYngdnok8BuFMEqQZfz9Z+6f9nUGda3AETxLo4MvNedowDyBP9SDcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETPFU0f1KkNmrI2f4M/it+AieEy6ri4Ufzx18V2D/ok=;
 b=LweEsyOWH5e+7RO+JT7KaEprIpum8niH0W21RB22CsBucrw+tAGeiTF0YQwa5xC8Ko1N2vffnI+aSFaL1O+VG7JKsIo7tHKshZc+xs8wd6a8qMeHykPhzRSwuGs2+YW4cZ2ln/2tq5z375DmofF3C201QmEP41VW9LFawph6ox8=
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by BN0PR10MB4824.namprd10.prod.outlook.com (2603:10b6:408:12f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:10:30 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e5:cafe::59) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 06:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Tue, 11 Aug 2026 06:10:29 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:28 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 01:10:28 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B6AHI5580944;
	Tue, 11 Aug 2026 01:10:25 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add ethernet alias
Date: Tue, 11 Aug 2026 11:43:41 +0530
Message-ID: <20260811061351.2538688-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260811061351.2538688-1-s-vadapalli@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|BN0PR10MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 793b66ae-4197-4fa9-772d-08def76f3e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: sYrlooDqiYC/wdEdKNnOck3ig6slZodnWyCe5duL1AcDHlS8pbt6U/yzVmb+uxeDk4+wGhz+e6cwwgQohQuYP72v1WsHUtVMIa5CYqu51m9KOyQwaTo1vNa2EFX6WO8HNFjTDbyPgcfC2VItNMJ7CEHbUB9ioSNIvo6WKrV3LKbrmldZcPFVTYxVfOp8+hR1h7zJuHeR5OJsAHLEuKA3kkO5NcXCv2BxVBLuwEuLJdPXXILDiFN+ocoddUNGUb9cfTN85Y6jNMMRhHwdrrjlgcA90J25RCZl/WHOOgurKMlG4MXnArTFEGzYMpObIgimHmi3+aktdQEKu+Ol4PErT4EpYS0Zs4adLEWnJM5tUa4rbiACuVKZEbw2RZJclH3BfNOKDfiVk2Qi4DiGHK4qWLryK/myTtPrAufMIvtOBJVXzXe3+9+wwhUASQ2R4lusWens9eiNqqBfXAY38fvVv2od1wEiyQDIjISZymIMXv42Fv0hEC1FkKmycj5gpAyFQ1NKWNvS86SoAl8jj6tpIZTEKE1Lgx+jKq8mEcPqIo45pl3j8pW8DLHASh5IcIzmTg+6MZ4sIo5oB/+2yCG2e7akwiBs30h6TRn3Lwsgb+rqPame6nED1XW+SZclmFuPK+o7unegISlBxtQlU6mQl3IYsNxz2YxL8gGiFCgXL4ZW+QfeVY/pFyVmZXTLxigwZXIfTogyvpjWGFoVoZqQ2Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eHEfEpjwo5pGixuj1SC87EBgaCQVSPKbhfD1mfxAWtxZ0seEv0zbgrTFFUsK1/a1QyftV3cXTuIAGMNBqcIgTV04sEPXEwoEvRFwdArZvliTyOlQMQy90tN4YIASrBZXc8YuxxbDYJ/RIPdIrN4V7+zwLumJqmstq6TCqwXlsWIG6vaRexhmSiiCvIzEp3R+IAgWCtRuERt2L99LUeQJO+fzApOJOdvG0hWWUlH/nwgVtcixZh0FjT+HOzudjLQw8TNgdsbsvThZssfVN5TAX9cPkYQoHS/xtToww1xJrDWYxJ3d01MyiNMoMjiRt4wo9sKXa7QSwzoIoJBhO5IGSXZeuj3CqjXcyKgG1bkK1a7wB4GaOgcwbaHSR35gfBXrgekwDZ+l2TpN0WehWA9+V+7u61eL8GStr22LAsPip/K+qf3BHxJA3+DKOC/JnsXL
X-Exchange-RoutingPolicyChecked: F+LzpzAFk90a2z4OTgK0eZMuA35AqZreP9OwPUHpQrOIX6/0nY6JkfJL5/kG8ujvYaiDJGafTwReHI4eCvigNzvZpG6vAxQEgtUAQxXbk1G9A5IQRXgcrtEYii32BhfZjNMv+EfNOqIAlg60qXMDmHzl2wWeAf9FD1FJz4JzvVd5ibV8UVRhcYZfLpXi7X7SEjado4NIcSVNdwygZK9VtW7OjsmyKFoesUD/V1PYMXYlNWP3LhokE0DXvyl31ZsanqpeFzn5D/sn/DBdpjiP+qOWJTvUkAy3G8IBV/L0axDWjXZfCXEquzChiHsZM+gsNUWkjR1Y7OeOcwhWaXHP5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:10:29.1526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793b66ae-4197-4fa9-772d-08def76f3e58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4824
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX/heiyhRjmCrn
 wrCexxIwWFQs9/q36o3CdzuqpqmTIk4qNUVBr3Ibhg9yJ+r272qGWBLdRcSPO2bOozqP6YiYgtU
 PFc/57yyswjkO1p14DFEUKMEQKGIQJ5cTITxyG6OosUwhT4aS6jcis+mitJBWAB6RG06Njzsxuv
 ePDrlYAwz7UqRhpf5uzakuliX/XJUvIDhj5NMRmCiecwHoOkDN51ZlSP4vg5m3XnDt4fmqpmqCO
 htnOW/a+dCy4GmPvBikBwA5GNck+FBo75vW8xM4b0b7RTG2lMbwOv5D2oCjH2LuIfu8uREYYw2m
 OPdaBFKtfhlNEnMDtw3B+ApxgViulLqCdnTmTigdktOjOdy3hXDveBe0O+Im4KagSsf5LV+NyLk
 rVqTJ0uw7W6LRi3OyV1ydwlPU7y+17UYUs4xRsZR6+ZT6C5lmPS6eCLfE3lgjQqFOU/xMY97yDt
 WPIMlUtdW1EXLmf/wqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX6Ph10wYEBX4W
 sijyAVKDxlyzhAQHXFbfSEany6BWdUPo61VBsI2ObS9sTLF7tfU5IIvJFh8KoL3sMZqeeYrTqjt
 4cDx+PE3NTszrsrL/oAYs7WfHnMhX+Q=
X-Proofpoint-GUID: n61ouklxtEMKjQY8ItTOIwzeip_Bsuc6
X-Proofpoint-ORIG-GUID: n61ouklxtEMKjQY8ItTOIwzeip_Bsuc6
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7abcd9 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=A3FP4H1XbVXvBausaqIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231035_012788_95BCC124 
X-CRM114-Status: GOOD (  10.68  )
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

Add the 'ethernet0' alias for the Ethernet interface corresponding to the
MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
Processor Board.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index 54dea36b153b..ac1c1ffe40b7 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -24,6 +24,7 @@ aliases {
 		serial5 = &main_uart3;
 		mmc0 = &main_sdhci0;
 		mmc1 = &main_sdhci1;
+		ethernet0 = &cpsw_port1;
 	};
 
 	chosen {
-- 
2.51.1


