Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A21EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQGewoDbPUGsiBn5VC9hK3pMAQ6HYBHXts7lWj1krGs=; b=aCBP5bXz6nMJmEvWAVFEybbQZ5
	6qLF6H1zGrRMc3uhHsfx+9mpb9bjYPLjyx/Bp0hTD76DknDJ/Ymm3NJjCzPJx6zKiuU4P3SIVhQcw
	1YusVA6RXRGUvDsmgwLgZ2Q++fRw60uHGc4ThVHS8ktUwm+pUVVwg6psIr0qM97VuaqGWy+U8pQtl
	yenhQ4YjauPFRiw6T3HPUp1Bw9TE2xKV51oYQh8hLvGO+nGtupDAClLFDK8e3bsTaC9ip0BbOUaD5
	ejSPey7J9rIvWaSxkXIFFo7LzIehq8oqfabU4DAiooUKmAunTdrE/QH7qDTEPxUKwMhcXA6AeIc8a
	r/qkkvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVi-00000004cqC-3N41;
	Wed, 05 Aug 2026 22:54:54 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVd-00000004cp8-3ekl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:54:52 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVRTw1786724;
	Wed, 5 Aug 2026 17:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WQGewoDbPUGsiBn5VC9hK3pMAQ6HYBHXts7lWj1kr
	Gs=; b=UNStekjgmYWCuUA7KPekYUYHtTYBRtfY4o8Z/HHcA2DJlc+tqhJzs/Hil
	9wUnJl3Khyo5Bc+qGP6kKsjt/Xd4oMyc3nTO3i5488wgZxQWQIORddmEYLslQADX
	9voAsx4rfrMMWWXLWF2dOyrI3QUwYYaft03RKWCcy2YroAVtYhT5xVV+HY72MyIl
	56wH5ER/z5kC1kKiXatJRrk4EE9dowJC4VsiDVbYH7hU5oEDOEthnyGEOmroWyEZ
	EJeEHFapJaGw4mmcEV35O1hjmGur6z9biI2KfboNTYiHD2Zt6H9f88DSoZGhe3oL
	Rb9U9SiZlo0mLYuS84sPQPKw5QSiQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fuuyqytfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 17:54:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDdGKIG6UdSOmp1pRFqNJIj/Povl3uXEwDQjnc/Ry/l4XauOfcm+RzYRsOm5CJVLZB6Ykhxl4ASIOsvWjLINCVdBwsPetutfo9+6RliuWYQa3EZcxmNIGNfMADKyzkWpqiH8l33wVbnUho6g/WTQ06GG4b3sxZrJHo7pjA2KHdJYWPUGlFH+dqL1Si9V/yVeTPeUG/0gpib0fo3WfHsQ0SnKf3SjhLxdp6c7i/f7/qFW6PVX6EB5D4ClZzgdBacYWprHUVn7syIEZH9XNeQA2IPGuBt9iWeyCO5uuGZXvLSap1e57VA2knXEoexu/lihh2ZwL2N6H61ZpY0koO+23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQGewoDbPUGsiBn5VC9hK3pMAQ6HYBHXts7lWj1krGs=;
 b=KLbxXmbWMUzwXuoA27qZgGwssrVai5p/1F9XVwNl3VKiw7TCCUCq9iQ9Bi8HiV+l1lYN87lH4c5na6KRXRi1qG+rrg5M5RNOHnsNgTgHMXG15ThSf3WeUSzYfOr+zMLW52uu0FLecgKCoZNbfENpCnOjCnGrBIXC269tEODkgkw2ds+WcnL/V/g9/2yQcWqUxlxEAvzQDf1cjwW1tAt+RF1PgatRMhxgLTI8XVrwREwEpac4ElyAC12NQwT2Uu0g+xUwpromCCWuPgZ/KvIgbGYHJtbekfxMVvL09xFEtALcwYGl8h3Q3KfKWQmemrdAnm34LRoNOtm0hfZJPKS7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQGewoDbPUGsiBn5VC9hK3pMAQ6HYBHXts7lWj1krGs=;
 b=TDqojLDo/RgbsRmfyxDwHAg9sO5tyvuRdzie+tedxU6EDRbcUGvdC1Wis46GfdmYJy25JoF23jKGnN8QW1deVas3jQWrORdOitz/PDa6omJJVQryBUJhHXSBTywnjbSt74IORsAK/QvuD8VHHM26e3hNG1Glt3xZj77sOEAHRwY=
Received: from BL1PR13CA0393.namprd13.prod.outlook.com (2603:10b6:208:2c2::8)
 by PH0PR10MB997592.namprd10.prod.outlook.com (2603:10b6:510:37e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:54:42 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::76) by BL1PR13CA0393.outlook.office365.com
 (2603:10b6:208:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.14 via Frontend Transport; Wed, 5
 Aug 2026 22:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 22:54:42 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:39 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 17:54:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675Mscti2968446;
	Wed, 5 Aug 2026 17:54:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v3 3/4] arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
Date: Wed, 5 Aug 2026 17:54:37 -0500
Message-ID: <20260805225438.464184-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805225438.464184-1-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH0PR10MB997592:EE_
X-MS-Office365-Filtering-Correlation-Id: d0862de7-26b6-4609-f765-08def3448981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|13003099007|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: W0/3xxQbUcYv7WDgHgq1NQyWmIhsH3YncjGSEiki/Dnn01eW4sODfFZqAK+8i0db7xH2bvCFlsdZ7/bz5jnTXicN913S2ipvruapnMRXDeIJV9fZhDn8rMO8/NgD+fixow8sstRLNQqbh4FPkzhzRkyAkx85EW083m7dSqCpvA/19ozWUqABzdXOWVoLOkN9QQYD2QrJdMNXOu9pzjWNDnubN3I4nyC4J7AKDdwBrnB8KL3PuTTOPe+t0JPQTl560CF12SaYEKWMeCdFzU737NkTI2lrV6JwiPtCEndBmVjYy69RPQdQWRfJQZsnrqpoWEW+WHYZyHkqV1ooDesdDa3hfjO/5LJeeSQRh3jwf3o1kPpRqbb8knP5swomkAR9qrsWEAnEupPmEqbN02jhDkQ6j09FE5e3sJDfJUZJ+JBFNRv5ORyDcwxE8TB0QsDUQmC9ECy0Tg5fClvBRwKGBA2kbF4tbTedwJBNukECOWH9TMAzrihy3ZKkwLjZLYctbCr18nad+/sKg6e4cE2B9daf6152y3V31B6B+rUPTwU+BtkPLSPP7l9Os6HICXe9Xb6fhqh+L12KX7F8z0xUehLrWS6ekoLsslHE773u5nOGUDsM/tUQLISeriv8+7tFcGgMhhfE0j/bdrNP+8B882zkOT/JCVkEJFJ2IyRFyYi100cPe6o67oMOXyQ8esChERpcLzAoKcriOrtIj1/R7g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fTX6YG+pSKAsoc8JpiHM6OI8VlkisNrtQv7RcgvsaKfZo2yfPcwce0Asn80dpH2sOyuTIze+hlYQAAHzCsrGsWj7HnR3cSXld0swX56l6Elxfl+eMWSxYTFGPDtFbTWvCCGNAtLVHigUYwxVZB+4RbL3ZNO9GNS1NfhZIX4Obe5qajYrF2bKrvUQ+DARUu4iWMcSWyPuJKmDxIhr8FFHwEywoejCNjfhXcdp0flWEaFXiUzjOQdmitH9on2jGcVzp5ukBJrquapnBRPYdJvBfUuMIu8qW0AX2Jfk5/ekw6N4qKM/H0/IK96wCIjeP3r99fVaUeh/we19hjNW4mVIXykvVkAUlq7MfStX1LL4CfuIOBokh82xOXrift4f1c7q33s9ukG0zEDgHpRJKeNXf5Fzqmt8GIEt7gPQf70Zs7vyD/Il4xkALp3xTREvYclr
X-Exchange-RoutingPolicyChecked: Bz1SdmolFQj3UgyNby53GZwNVbaws1++My+RTpfSIlIoM7h+8KAcqLvy/wZM4g45UNyS/HwCJzUacLfE2wYfqbWj13bzDE1A3YwEnBsr0z4uwtasRbfBPlKeEisSmYHoDWXza9bW2imA4n0y+4PXcJNw4D80JRJaebANqgsxZnxRZG2DgfR00DnnFdPIZS03G6s8Is+e5IlPjrQMrDp6lzYPS4CBo7mGrgoCG6AuZ3KEw9Ooazg2IKvjmW8v4blpR0MFFVTYN3T/2qQag8p3lwcO5VK1quyxxb+s715R6G1Daft7fry0U+lti4azmIX+w4Wnhv4E5lCG2LjjN63urA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:54:42.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0862de7-26b6-4609-f765-08def3448981
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997592
X-Authority-Analysis: v=2.4 cv=B/yJFutM c=1 sm=1 tr=0 ts=6a73bf36 cx=c_pps
 a=PurIBXv9FE+FLdDnXy66Mg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=TwivlONBs3RWrX3qqisA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX67Ql4huNFnU7
 u62fx70BpKyujJySixDDfEflc/oRRYIrSFSirNnjndk32lwxVrtzaZyh+MsnA0gYdsfF01j/UK1
 OAQQxf65FxgSTyzNyKpb6xRd8ILkGB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfXxzx7OBhy4+xU
 oXQeWjdF4sW/ro5h3IciDVF/ETq2YryHcrvkjR5shKY/8E/+XuYweMOYfsq7ug1R/iJjWo2HBSM
 UK6wN/aT2zfPQnF7yqQVM0pwLuuZUBcNeF+O7Rjjhj/7r+49cfM9f6GsqL/AxJFzOE92LLETBIj
 2HNxaWh1nRZB5ZmFfSPDj7AsH3ja6Lu+oNr0J4ff/o2gmcB/P406AvRtIZwJw8w5To9IlhljLuT
 iKYSoKI+HIUhw1WVheeH0XBm4wTREOoC+iMQTOGvQM9P4F4Wfiz1cQSgvSnMTLIvyimTtlHAbLp
 eQiC+KVILAJ0hnGs0TjRSTvZGeuL7d6YCF75mcd/ol5BahjjKeomnDYtKVs21/X1TuDXSXNT7YA
 ZJs+nWp4JnUQvxfHecBzVbJsy0ArU5LznwKQxHfX2kP9pLDPQ/mVGST8cJ0oKGih2c8PZ4OkbLM
 qRuCI45HPsRKz3xzSNQ==
X-Proofpoint-GUID: Ohp35LqVCuUy8EDW8z3_WVRGLfYXBER3
X-Proofpoint-ORIG-GUID: Ohp35LqVCuUy8EDW8z3_WVRGLfYXBER3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_155450_019752_AE7DA2CE 
X-CRM114-Status: GOOD (  12.05  )
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

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: a0b8da04153e ("arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file")
Fixes: 92d8c028aa92 ("arm64: dts: ti: Add k3-am62-pocketbeagle2")
Fixes: f5a731f0787f ("arm64: dts: ti: Add k3-am625-beagleplay")
Fixes: 2517e476b819 ("arm64: dts: ti: Add support for AM6254atl SiP SK")
Fixes: a841581451af ("arm64: dts: ti: Refractor AM625 SK dts")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
Changes since v2:
- Add Moteen's Review tag
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts   | 6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index dfd65c00f5b95..7fd508f4eddf1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 7a4cffc27bda3..1c691629d4ad0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -235,7 +235,7 @@ AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09a..898e4ca3fd87e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -323,7 +323,7 @@ emmc_pins_default: emmc-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x0218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x0214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x0210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x020c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
@@ -346,7 +346,7 @@ sd_pins_default: sd-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x023c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x0234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x0234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x0230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x022c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x0228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
@@ -358,7 +358,7 @@ AM62X_IOPAD(0x0240, PIN_INPUT, 7) /* (D17) MMC1_SDCD.GPIO1_48 */
 	wifi_pins_default: wifi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0120, PIN_INPUT, 0) /* (C24) MMC2_CMD */
-			AM62X_IOPAD(0x0118, PIN_INPUT, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x0118, PIN_OUTPUT, 0) /* (D25) MMC2_CLK */
 			AM62X_IOPAD(0x0114, PIN_INPUT, 0) /* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x0110, PIN_INPUT, 0) /* (C25) MMC2_DAT1 */
 			AM62X_IOPAD(0x010c, PIN_INPUT, 0) /* (E23) MMC2_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 9c83626826453..085b067d96fbb 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -98,7 +98,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ab9e58c2d225e..d2f41e2ed6239 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -194,7 +194,7 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
-- 
2.54.0


