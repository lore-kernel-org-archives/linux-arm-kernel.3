Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99675C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/llvJdXivR+23q8HS6eFhOE4qwiuHE//hYR4QPZLg0=; b=AUtlfFQNndxWpkQttGUSud9rAh
	c1xCy2x1PvfTmqWCdsnd7NhxBPLkaTEwsPWc2BzMpPXXLl6Ybx3djWgIRu6i0E9roeS9ULRbHw+KH
	Arg9ujZSqiO0mjNmrVBvGd6L86CRlSaIl/yg+yTVJmQw6aWaeeW95Vi0C2sPd5aDv7LcXVChwEQRT
	Okd1s72X/IvkrFA4yszYFbp+KS5jqs4+vgjftCw3QkC/umQBwPXQZ56/1x7eQR00niwstlOKJjbuT
	GHp/45/onaBx9cTUi9EhOfhZxeR11ZndlV6QtskXi0pWHih7G6AEQQU3rUC/0G2a5H1Kg8t5jYnwF
	66QzLBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi72e-00000004ViL-0hpi;
	Fri, 10 Jul 2026 08:57:04 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi72a-00000004Vhw-2zXN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:57:03 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A83sP73353105;
	Fri, 10 Jul 2026 03:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6/llvJdXivR+23q8HS6eFhOE4qwiuHE//hYR4QPZL
	g0=; b=IvOAUV99RppqTt7plI8VLfuZE9Dnaa81NNE94q3Ccx2nHQnd6Dgz7MuGp
	J8X4uYdnx4niTGrsLPRzFOZz3Gx32T7WZ73Vawe2JzKiRO6Gm/5K2tApiLSzz+qn
	hgLxGWdvyWtQIz4bv8kDUaQ/WL0QizyuNZDHsb12cqI0EHz5cdooTPLBrUi1aN/e
	IxrtfgLrZ7ZvGHWGsPMmki+aGiDCB60XNuR+m1ghA21W3IScm1d+bELKdkSZI14g
	xx/YtiZyHC4fXP7aMG0/Rb0kepCsmtN/RfXZc1v9NOS2LTwnRWw94bgLF9OpjKm1
	dBIjmgJCn2JdsTFjHYzWGJKeyon3w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fasjd995p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 03:56:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS88eNc0H/tbw20inToAAy33qwGTE9/LgsYPjcDbqHlxdctS2gbkHAE38CCUI53f9ut4ixf0vEPNZZh86ddWZ5v37lK1c2QToKvrTuzFHFL3LTOGDzzyPBvmYcBI2HkalUvX4DyDHsGPUoKJqlFkV1dPUsdWdfrmJrRw1PpBGb+rdAv/TF3Zf0XVFU2okPlJRFSwpS7RrX2vJrrG9k1oKD9btcAvB8CZRqKZBbslWSkf72imgZ2SHKxWy8wFh7z9gGhoVE2e06VQWLY/sFd8vNXs+layfG46JkLtxfpvidpYoW7bWnky9mNgU0b7wrVi6Nd6hw757R61gtl8m+IOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/llvJdXivR+23q8HS6eFhOE4qwiuHE//hYR4QPZLg0=;
 b=IdOc73ZtKaNTHK9WgEWuaps30wtgQLDprE1dFFcHSc0GZnlD6u0FZDj00i0gzmR6hF/0HDDG9T6mqv3Gj4c4ULzSDdJB9CYNpe9nmFzbs9itByBrRpJjidFqw/IpmUzFSDF0fgjCdJdVrJjdQD83AR69+J7wCMHjA09O+Ne72zzpjcdTBpp3obWXAYVP+uBx2a3wHkQdf/tQDUbBi8J8ty7SYR3pkDepgeqthfQBGwVUfAhOaej/7Ml54lEuFKrOqzhrdg2XrMtJr7WeKce7IwIx5jYYwPoorwLCRSchsejSxj4X8graZuJD88Q58vSWIu4lMxHUgEVwmHQyAw4A7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/llvJdXivR+23q8HS6eFhOE4qwiuHE//hYR4QPZLg0=;
 b=mHJUyp6b+SgrohxedrdJ+cZ+LLmHUTwRp8ANP9qswNk8DXiUBDFRVSEGDOXkzG5rIjr5HcHM+eIDhRGyisidothf4NFa5hZEJJHTfGeUeAeDYNwhbjnklIuwO4+PwMJB9qYIPBvp1fcFGS9+K2u1Z6qZ5LRZNU7QSa/oHGCm9mM=
Received: from BN9PR03CA0564.namprd03.prod.outlook.com (2603:10b6:408:138::29)
 by DS5PR10MB997705.namprd10.prod.outlook.com (2603:10b6:8:341::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 10 Jul
 2026 08:56:49 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::7d) by BN9PR03CA0564.outlook.office365.com
 (2603:10b6:408:138::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Fri,
 10 Jul 2026 08:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 08:56:47 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 03:56:47 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 03:56:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 03:56:47 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66A8uftp3318856;
	Fri, 10 Jul 2026 03:56:42 -0500
Message-ID: <e2dc6189-3932-4560-8721-4d4db77f3771@ti.com>
Date: Fri, 10 Jul 2026 14:26:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM625-BeaglePlay
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <r-sharma3@ti.com>,
        <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260528111319.3262698-1-s-jain1@ti.com>
 <20260529160831.cltcr6wushiozupt@freeload>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260529160831.cltcr6wushiozupt@freeload>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS5PR10MB997705:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af6df53-cad9-417b-b1de-08dede612ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|22082099003|13003099007|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: ifxdwOiEAEp/udZhPSyt1XhdYCAXblA7ZVxSEOgMJ9GoY814OK9aDnP/Osg2zu5P8ajM5w+FIAh4Z9ktfCiK24i+/NdE34CCklk6hJUGgAb0VAdrOleySVjzXmR9/vopn+SvxliadL8fZXU8wErgkO7LBso+2nUpyn+cZvFZg2IC0ZpS3uOLPd8N5k8XXEOXTp+BvXbwMlG5A5eHUPNeaNQVPdbQp2eGAFNRZe0e3SdVZsGvvn3YTH/QwrFhFtYsWkxtPittzGOwF+xPu0OcX3PZRHVW0r3VD9Mt43D+LQ9GfiEU7IE85CjvpaF86JqybvHNAvtrdHsm1Kkj48sXNc1Begbds5vMGItfg5kevvYUsSBw/Ke5a0oI24e+tG97Q73B7RwLQr6p2Dzv5UDolBoRfgCtuGlQmAT8iF4LXUPTDsNtkAvSm4Yyt2z6G9N8Z/RU3LOJt+aKl9QjIl2LjsCA/yJ31cqVq3grFJ/LstD3vAu/nL4doBomzHwMvSX097q0e0vn/9fDNzlBdNIUBREXfgTBGEUxJZP98/tHwpKeBav7b125ZpVutvxBcenp5flJ6xF1Zj6aKOuZvlhGGG0p9UO+pum4zHm/j4aLeWfDsUDKuD5apqf/nfLxTsPk5XDOsf++jF0L5P1zoly7UQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(13003099007)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iMxt6l/n6sx3SWPe0u8W+bX6BbXLiGiZvNM4AraMOBBclzGGc7n+Dlt5OargirI0ODXPLCKUyNzawIXwNAssJp4vzg+TXVpfYwL0AgxmkXyBbrG+yRj9utPyF+e7Pa28VZbjIETvh6WTDN0K+hwgDgtotQOVCGUCRY7EkmanXgeor5mV+MkTejVSzY48qaViUsB1+Q+fAbRlQHFClwGI/znVu/NipgAT+FDBq3AEpkzGZdDhzhnaRXC7/WHf8NSYyJGazE41BzW+U0wr3rzJ7AVSqQAIpGzXQ/CLTq+DEziwhTbIiuugFZM2wOcZLNWKUrVG9P/4AxMpUKaEKeaoe+cHc27V5ddyloNt/xXiwlnsT8XQSVr6qtSFKVc0a1mr9xTBUw+i66s3Hv6NF+3pVX5lMJFDXLXHdShifX9HM8Y9W15f97BFwwfxmP53DttJ
X-Exchange-RoutingPolicyChecked: hK6CEsiJNYG7zxzWXRFoNw28t15UMGFzmT4tM5O+UQCz68bYAkFMWsbpQPstl1XWd2gzuY0U333KHtdgrxjhyH6XJxC10r3dQHhHonBV5VOiBpR1ZNy3Vl1GkhXWCPh2pc6DKFremkbJCm18+itun933EaQJKjstfZz+kczBwl0WTaq0rIgLazLcItajTrb1BYR3vZ6w4QMy7t2Nc1dmpDv6Ho6LHdumVbvKY24FjwdyNmdwUBa3B1/36vBIKllqV8ZFqm9E0YfAqWnoQhbDEQnMbtLSUu46s0pVUdGf5fz0k6xF9mJ7USiUkXPWMBm954nTqQW/PR54lZHoAm+tXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:56:47.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af6df53-cad9-417b-b1de-08dede612ce6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997705
X-Authority-Analysis: v=2.4 cv=UrpT8ewB c=1 sm=1 tr=0 ts=6a50b3d5 cx=c_pps
 a=VB8Rg5rwfRosJW56o453OA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=KOmJlRZdAAAA:8 a=fGhLjsSNAAAA:8 a=sozttTNsAAAA:8
 a=mSBLlU6nZGozYopj9ZMA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=z2U-W3hJrleVIN9YIjzO:22 a=Y9KJ9d7ijktqh0zzt3yb:22 a=LYKFdyShAPKLkGq8p7WX:22
X-Proofpoint-GUID: hRHM6C6sL1bA1pHiJAWnGfWNqIapeUue
X-Proofpoint-ORIG-GUID: hRHM6C6sL1bA1pHiJAWnGfWNqIapeUue
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NiBTYWx0ZWRfX4bSfMmjHhTPt
 IbbRHRlH/FBG6UsFk5yhnm9MhVAAa5/OyrVDXqfzwUVcKU1PTEAtFuR2DVeUWkCPTPfaOnfJLAm
 2af7x5oSTWUPJLAAMXA0pr1DaOPSRAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NiBTYWx0ZWRfX8Hg9hil293g1
 xM3XbuvPXJ/2Szva7gFqiIg8Q+OxTytN6DNEuovM0BuqedQfV0f1CDWkoTKbD8b80VZIVbuRc/4
 tQTZda3ZyNVIa7ZDDIhCvCw68RlZQfx2Jgkr3AugDNB/bq/k3ANbTI4wS/qQngp6BXyI588tFbt
 Gcc1L+i3md72UiwscEdaPJ9xHNuHeo/9KynJb7HWw3GIfZ63KDZ9LTRBNIKgqv/M/Rf0DXR7ZPw
 PBfyJlIC9+1Dg9+a4BgSIWhDGUpmls9ovXkvuo6atPQAdb6VVpe+CBkDnSHJ04IKO6Zl2wicnV6
 mXmOmmupdwF/YqA/vuU/Gb6qonfOHOo+6nOFeka098bqgnCnWGxi4OJy2p6AGdMqQbfm5sf9hDw
 YZAC8dBynxqx20IxrzUKYq64+Y6WoNTJVTL/FXaRGSqqR/DnM8lY5b/QyILBo6/TcoFwYYqwJCh
 Pq3ow4QABs8iR98GjNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015701_041640_456C71AC 
X-CRM114-Status: GOOD (  12.51  )
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

Hi Nishanth,

On 5/29/26 21:38, Nishanth Menon wrote:
> Please fix $subject  - something like
> arm64: dts: ti: k3-am625-beagleplay: Add overlay for ....
> 
> On 16:43-20260528, Swamil Jain wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
>> Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
>> Furthermore, it has an i2c based touch controller: Goodix-GT928.
>>
>> Add DT overlay for the OLDI panel to connect with BeaglePlay platform.
>>
>> [0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
>>
> [...]
> 
>> + * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM625-BeaglePlay
>> + *
>> + * AM625-BeaglePlay: https://www.beagleboard.org/boards/beagleplay
> 
> Please drop this. we already have that in .dts information.
> 

Sure, will drop this.

>> + * Panel datasheet: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
> 
> https:// please!
> 

Ah, missed it, will use https and respin the patch.

Regards,
Swamil.

>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
> 
> [...]
> 


