Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B185C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83WyQUz/op8BKRV+5wJIcGbDyCF/U30uawdI1mABjs0=; b=FSwPYbSbpBN3Fbp+M+7CNdLknR
	MY5MsclSmxXqjV5vc9UrNG2VGFIKruh9wIiY6I9ATzTW4u63By9sx780Y/QH9cD5oApn1Xt07dcby
	tXQklwZ0+fsq65IdAYzHr8ofdbrFNNbWWELUrYvGrM1FtTP94TzF4k3SrCFCS0C/7H1/v4I8hfb1L
	3kSRk2z/66F0SJ5GulQmb3G6F+Bjfzp9ZQ7Muf3wNCsw8RCgpHU+7zFG7n1f1ltMMomD7KpHnvzaU
	BecKQuwbwo/YBAb0cV/OOM3AzYNZS6/dbFf/F5n0j+tm89mQ5pgLVrOOJWsyhZLqS9t7FmunI+xP+
	QmeeMZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtegp-0000000DIny-0SUA;
	Tue, 11 Aug 2026 05:06:15 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtegm-0000000DInY-07Gr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 05:06:14 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AMpggq378793;
	Tue, 11 Aug 2026 00:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=83WyQUz/op8BKRV+5wJIcGbDyCF/U30uawdI1mABj
	s0=; b=QdisLsZthPQdumo+/2AOhHg3oVN6g+eovGj2e+PpXpJ4tMXcPnvXV9VIs
	Wpio5i87ftuOKT4UMxQWauOoyowMmXmQxAAhhnXGfYUvw1XayIoA8EORVp7En2ih
	0sjmOohv5qsMh06DNMLGLw8MJpx3UmJ5Las7apg9IjK6SEjEYrxVClXt9THyhmAm
	iucARFY+z+PyypI9T3Tnz+sQlNA3aw30Hn1mm86FHukffYh/06p4tRZeBbVAOI+9
	lhCTCLAST/Xl7cBQq3pjtEEQGt9F/25GDENUyLB+A/ArCDsKnrlm6QF/RS7eesRS
	xc+Bb+fA3+RDlmYSWHILDigHjuzsQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013015.outbound.protection.outlook.com [40.93.201.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7edyd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 00:05:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPzbJ6sjVCPOadueFnlkwTZonAynClh2EARd6qyWASL5y/LqeC2lJ4iHoVVE89MnGOIwwx+qL3jUQwfthBALQgvhZMdMJ0xfleY1d5JsPEP73/HlSm1i4qYAYwonudQMT9ILjjrcXPoG/8NoFFWxrfuw1VQf2onG9141kYHhG5lwQIWie3VL4lhzcKAAy9xq2mvVvwOI3oI8m6yEr9jdT5zzKQTqDTVAz2FhPcUZlDojL5fcOXqOOiqialXiMyqb/A12cVdhnehSjqIZyS4PGexPjQcIhAWDNC3mDhA5nmFf58UrtvSiNw1fF7bznMxoaqs37puWiE0aclZamaG0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83WyQUz/op8BKRV+5wJIcGbDyCF/U30uawdI1mABjs0=;
 b=dq42YSBNNrEEZ2RLSMGNlesvW9kZT89ofIsXnkDnc7d0vGO7yyH4mAXrfNRLsO/eDlPj2bovqWY64tud1t9bq5y+B+r/JRhCubq4vKB/bl5jc2Ab/ZY6FsI6yrhNxSaXUnmKXWtOls5SExpIqKh8XDfWqo7ziKbXtXzSUqJoZymgXR8DRLqJqqTJoZqtdSLp7xKSq5Kx+qVKPuYD29yCen8y/h+vX31GWJMMKZ0koZORkMwSPK4ZmQYMDc02mnmDGQz4u952y34/IJzZozHqReUGheQsia6dLJoglKPkmBPqnuhLB84W9XbomOQ2nX9Eitr5o+ySKE7ZbkgtfqPYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83WyQUz/op8BKRV+5wJIcGbDyCF/U30uawdI1mABjs0=;
 b=W5kyEV0ldSGu5Q/9G40VHWeuGqBUbUBWE71jKBaVUpuUvAKZRs0Xi0K1CzojhujFg/7Ft0NEJcbLD7Ah6s1mLj/0RzDpAGKR/S562PpeLtDz5g29/s4LgfSrqzZjSqPMG3Q+d8rA2DS5jyhNwMfJV/VQGhLoDOVjTW83P/mbbFk=
Received: from BN9P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::25)
 by IA0PR10MB6723.namprd10.prod.outlook.com (2603:10b6:208:43f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 05:05:37 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::45) by BN9P221CA0003.outlook.office365.com
 (2603:10b6:408:10a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 05:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 05:05:37 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 00:05:27 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 00:05:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 00:05:27 -0500
Received: from [10.24.68.110] (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B55MDC485502;
	Tue, 11 Aug 2026 00:05:22 -0500
Message-ID: <d7841492-7e2a-4f4e-ae82-8058c7f4c6a5@ti.com>
Date: Tue, 11 Aug 2026 10:38:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <c-vankar@ti.com>,
        <vadim.fedorenko@linux.dev>, <v-singh1@ti.com>, <nm@ti.com>,
        <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
        <oss@vassilevski.com>, <grygorii.strashko@ti.com>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id
 extraction from SRC TAG
To: Simon Horman <horms@kernel.org>
References: <20260807111738.2055900-1-s-vadapalli@ti.com>
 <20260810165629.788002-1-horms@kernel.org>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260810165629.788002-1-horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|IA0PR10MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 63950af6-76b0-4a15-9dbd-08def7662e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|13003099007|4143699003|6133799003|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JqnoQlOoGeeE6jdTWLjubjbQlfIDP6nR4eZAqTevbuXanFOud9TuP61Eq/pNXViYlVRbAPRuB+QcIq/KdzlLksgB4sqaBuS9xRvmCJ1L6eYlNT6k5LKhWtA5Ilb7AhC9wYcusITONVeoi0R/SIvRUlaO8VzOG2VBYCrBZXEYs4gEmwneK6DXD1f/z+nbUAxPAs1Pr41ZCgM0+Gc6ZL5MH2IZEsRFeQPybQ+FF+PVwsnSV/u2ZfmKY/KIvZtA9fLYl9LxjWhUMmAYNDglvNfbBq0w11vq5ulGKxOlYv98kJXdjW8XOiS3nTDsxU6W1gGZUDu1eBYG3YEGDZENO/UREUE83Q3YW5us74iR/T0RqDXRWC8Mb/Gaq3gavlbqR25Zs/6k7xOtz4oIvyhHikQgx3kvH11RguMHCc3nFGw9hF7Cqv94GbU1Q1Cgo6Vl0D3ZPJJICJmvLAg0jVrNUjyCDI4JLZzW7TxZtl8G2ub0cIrE6Q5VwznM6ABDIYS5eeWgmfnXDkikhfRLSFWnmS3zgg5LO8A87hjxa+2YqYjc23tm89MWhOUxdBU3v7cS3WXzXV2fKxqWWuuRC1zRR6xy4ps2af+pZ59v6tkXora3tGUI1nPRyuepPrypv8BOu9yCO/VHlV4mIqZLJcQcLZuOuQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(13003099007)(4143699003)(6133799003)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AnFPDpRF7xormi0TgES4YsrphIL3adLR5OBWXPcr8rSdMS6Bjt09YBW6jpJkTRG+hzzZtosWqwoTHgJz/8QeNE+Vr97O1R1Mc1/V1J2PnKPD8jPsuWwiGq6QfQb4Oaz3hDWclQ708aTObO4ACLzBbXti6AUlyH0gJ6Ru3Uy2aF8jcViVMeBypXhqUCVtZFvizflxY9TVCfQSZi8MuQUVdjS+faz5NXlKJXGNP8EmgIuoCjxwhPqmM9GJCniLwyn9d8Bp0/AkbnUX26ftrrW9baEdzG4XgJDf3Dd+KDdpAGipeNrcSFiW2vTS6OzoGW0g61dyLBlNz8x5QB7SndjB+m17s/nIamJddAMHdjoa6tZlHYxJpp5yPWy6VsOMNNxAkLOBIMxCrxfsFBfKqEnrCEUw4rtjEnXiaGXkSeTOWzGABLyVCUJpeXC25J0VZgek
X-Exchange-RoutingPolicyChecked: TKbqLbrDZUFh5V8z05x5+wdMeS2KjnQ0/ap38H3LKkZ1KNJNj2//7QOGVN6w4YFCbUPPRocB5yOhLvLpHTDvsm7OW39SCe2/VeM4BrxVmRm/haaGgfGRJ5TtSzJ/EnJ2OcuIr8kPpSn5YOFkiq/r9A9J6zLc/aUl/ABTcmtGPlz+nxg668ENnN1Rraiu12R/H6conOAkwdC31K2E859GYlmdRwKWR0C0GAj7dhDgmoSE8dBNCb0QXzE+oFYomE7qLYGn+QXHSInrUZEn1Y5WCl4Ognw7zRzedzBUBfYw3QnII7KIhej2CLW0hfcWWyB5QO5vvyA0z2mLmY5y22dQUg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 05:05:37.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63950af6-76b0-4a15-9dbd-08def7662e93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0MCBTYWx0ZWRfX5kFmmZtKHqSn
 sHzRFgxFupBDVP1MdR1Nyg2P4ZRpESAsVITO9f65IHGwtWH4Vo0imIyy3lSzk7DuW3V0Rsgf5dX
 oWRs1/TZ3OrnSgHu0NmsmtnB8GG23Qw6DnVDnL8eAKDSTqD8+0kllkHq68UX+cHXOgxr8N1w4od
 FRB178nY2nFwxQ9MXYMe1leebm75+RIdm8jDGI4MB8FQ/m7M3MUUiVStkKc5CveWUCqzMIKoimR
 4zngXuPVGA/LBjBuT+fYFVDTPXaLA8ygp6bTRwgaNMgmSp1USpogtqiDMaKp57YprWiHNq1pThs
 ZHIH4o92tNJYcrubZIbfOM2KbgbRCdpXObL1E3uxA2JqeHNpFbLZ36G8kKDtDdIBXRxr0+BvESE
 ib71mFx1kTy0eqNLb/4BJ6jV7OV4HBatPJpwtJUHNyDMoIZ9uQ10qmAcvT+sAxB8YAJxpIPxYI4
 FwOASzqPxmocRko023A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0MCBTYWx0ZWRfX7o/DjJPRqFDI
 yBXjgB2zXnBVZ1oLdCFaY9CzVQQgWcihR4kM/wP+iWCPRE2xrVgEi7i6DzMHNa5thRV4juxA3fq
 TFfScRH5NClUpFxZjzKiGelX/ILt6Us=
X-Proofpoint-GUID: LuGwTrJP2AWaxfgcHhrLL_KevF-9oMel
X-Proofpoint-ORIG-GUID: LuGwTrJP2AWaxfgcHhrLL_KevF-9oMel
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7aada4 cx=c_pps
 a=vvCUPcqovLgrcFR9lHNvxw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=9R54UkLUAAAA:8
 a=sozttTNsAAAA:8 a=KuVrGXGn2YKwv8fyX_AA:9 a=QEXdDO2ut3YA:10
 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_220612_227178_35B0094E 
X-CRM114-Status: GOOD (  28.34  )
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

On 10/08/26 22:26, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260807111738.2055900-1-s-vadapalli@ti.com?part=1
> ---
> --- Patch [1]: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG ---
> commit b0ed959d350c90d8b49f6f81eba7461fbc86dcf4
> Author: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
> 
> The RX path extracts the ingress MAC port ID from the CPPI5 descriptor's
> 16-bit Source Tag. Only the lower 8 bits carry the port ID, so the patch
> masks the value with 0xFF before it is used as an index into
> common->ports[].
> 
>> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> index 434a31080855..6330540979d7 100644
>> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> @@ -1310,6 +1310,8 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
>>   	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
>>   	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
>>   	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
>> +	/* Port ID is contained in the lower 8-bits of the 16-bit Source Tag */
>> +	port_id &= 0xFF;
>>   	dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
>>   	port = am65_common_get_port(common, port_id);
>>   	ndev = port->ndev;
> 
> [Severity: High]
> [Finding: main-1-0]
> [Sources: opus-5]
> 
> The missing range check on port_id is pre-existing and not introduced by
> this patch, but since the change is specifically about avoiding the
> out-of-bounds access, would it be worth validating the value instead of
> relying only on the mask?

Hardware guarantees a valid Port ID in the lower 8-bits. A Software check 
is an unnecessary overhead and will impact performance since this is on the 
data-path and is not a one-time check during initialization.

> 
> After the mask, port_id is still an unvalidated hardware-supplied value in
> the range 0..255, and am65_common_get_port() does raw pointer arithmetic
> with no bounds check:
> 
> drivers/net/ethernet/ti/am65-cpsw-nuss.h:
>      #define am65_common_get_port(common, id) (&(common)->ports[(id) - 1])
> 
> common->ports is a devm_kcalloc() array of exactly common->port_num
> entries (1..AM65_CPSW_MAX_PORTS, checked in am65_cpsw_nuss_probe()), which
> is typically 1 or 2 on shipping parts. So port_id == 0 gives ports[-1] and

port_id will NOT be zero since port ID is a Hardware provided identifier of 
the Physical MAC Ports starting from '1'.

> any port_id above common->port_num reads past the end of the allocation.
> The resulting pointer is dereferenced right away in
> am65_cpsw_nuss_rx_packets():
> 
>      port = am65_common_get_port(common, port_id);
>      ndev = port->ndev;
>      ...
>      if (port->xdp_prog) {
> 
> and ndev then flows into am65_cpsw_build_skb(), netdev_priv(),
> netif_dormant() and ndev->stats.*. Can a stray low byte still produce the
> same class of crash the commit message describes?

Since Hardware guarantees that the lower 8-bits will always be the Port ID, 
the way Software expects it to be, additional checks aren't required.

> 
> The driver already enforces the required index domain for this accessor on
> the device tree path in am65_cpsw_nuss_init_slave_ports():
> 
>      if (!port_id || port_id > common->port_num) {
>          dev_err(dev, "%pOF has invalid port_id %u %s\n",
>              port_np, port_id, port_np->name);
>          ret = -EINVAL;
>          goto of_node_put;
>      }
> 
>      port = am65_common_get_port(common, port_id);
> 
> Would the same !port_id || port_id > common->port_num test in the RX path,
> dropping the packet and requeueing the page (bumping rx_errors, perhaps
> with a WARN_ON_ONCE), be a more robust fix than the mask alone?

Unlike am65_cpsw_init_slave_ports() function which is executed only once 
during initialization, am65_cpsw_nuss_rx_packets is executed for every 
packet that is received from the wire. More importantly, the sanity check 
for port_id in am65_cpsw_nuss_init_slave_ports() is performed on the 
device-tree provided MAC Port ID rather than a Hardware provided MAC Port 
ID. The comparison therefore isn't apt.

> 
> There is a second case even when the index is in range: ports disabled in
> the device tree never get an ndev allocated, and every other iteration site
> guards for that, for example in am65_cpsw_nuss_set_offload_fwd_mark():
> 
>      if (!port->ndev)
>          continue;
> 
> The RX path uses port->ndev unconditionally, so an in-range port_id
> belonging to a disabled port would hand a NULL net_device to
> am65_cpsw_build_skb() and netdev_priv(). Should that case be rejected too?

All MAC Ports that are disabled in the device-tree are kept disabled by the 
driver, so it is not possible to end up in a situation where the MAC Port 
ID in the RX DMA Descriptor contains a disabled MAC Port.

> 
> As a small nit, would a named mask defined alongside the other CPPI5/AM65
> definitions read better here than the bare 0xFF literal?

I don't see a real need for a macro given that a comment has been added 
just above, and there aren't other places where this is used at the moment. 
However, if reviewers believe that it should be replaced by a macro, I am 
open to doing so.

Regards,
Siddharth.


