Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7901C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXsjY4ufCquIow6fx1lJzUWX4cQQwvlQ0g8uTNMCGZQ=; b=oN3qkvVC3RWeiakwjo4EDZf0Dt
	Kr1elS5k5fiB4Nkp44o1OzB/n+QLHXKIPyl6iQuZXrmtwVCkWJoAkN9flmvTBm5aS0blk9jBwNZZt
	ORl3SX91bDAvCUWc2k2DzkiBHpZ6B1/Ov5l5T2q2y4FKA4KJ3lXXZ6d/V67Jyyl6UECZcvUE7tr7D
	mBjdriJEZr/I8eqJQ9Oyt027xD7BEajiHrWLZFtUrWiu1wlkmoiqJoGt+x8tRiPW+eX2R50TOuMsI
	5nGnOPPhpZ8jc2TjD7i6YPfNh1NYdjOj4228KGPstFs8GPf5ldFvMGN1gYJOzQZ8KaUm4PgVJV0x1
	0WAfR5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdx6-0000000CM8g-2Ur2;
	Tue, 14 Jul 2026 14:17:40 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdx2-0000000CM7m-4BXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:17:38 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBPr4M695628;
	Tue, 14 Jul 2026 09:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dXsjY4ufCquIow6fx1lJzUWX4cQQwvlQ0g8uTNMCG
	ZQ=; b=cfQTqCtCJBXIMNyQDiFDifBBurOMYT+2pfcXUOCcaQlbBt4DOpX1J1vQ5
	hmV3vytK+aws04cb+cyKkE18nsg31UKM1ms5zaZt1gsrElqchBe9l5Ov1yDFfW/5
	44tlWz277g6jmZOoq6uGSHDRHupFlBFNqwagRaV1fB/fnX0BHed8sHx+4ND8/3Zs
	5nv/jfUxE8NQAMrXy2UucyewHH+kmvnD1GUFQ5nYShBQFiIn3DTaF2+E4udhHIzP
	mUFVf+NeFpTXZauNKeBr5UA+6LCXQyDhJVy4xKQAmV6n6qPYnwGcUjYJ/mgne6od
	lNOmuAkN9mqlKulQP0sfX2WwxtYFA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dgxv6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:17:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acpnH+zWVUciPs1yzHuFeMHJfBlViXRq5Db3vpNecQonYcvzbAlFRW8nCs9FsGl5cBJHyWPCbKt2EzXfrWH5V6uzbPSlvzOVN4lkRLw2Frdj+P+pND2pSP5AOxMNz9u68S5ok+GHBM3n/Zzj5ZOWLRfis6qnRfmetdcCW4gbGG0KzQZVCIEYQIA8DHO8mvcna7EAgJpstyVxbsd4VmCgApQx3Wl0QrqpIRq/LCXYVpoZTfRaz8en88Fbq7IHKegPfvTZ0GxCTOCrOUfcOWTGkFUo+lM/7qF2SoJ7K/tOhpdhi1D/gfi/Z6krQLNoXk5RyknEkl+1hpQxyIQPARfoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXsjY4ufCquIow6fx1lJzUWX4cQQwvlQ0g8uTNMCGZQ=;
 b=hUpEYDuSgM34BUjeNhlaoeWZbZx8XkcalmmZsa6TzHpiTRfnd4FY4Sk7Z8dnWZMAidSw3cUaEZiTDMmYTiySz9hPrNv2rmSWibJ5yJImI9lmPTOaIPu8CeJaK4zASHm03WYfDDqCm+7VPVE93xR4r9tbmm/HwHaT0ztWcCbILBXyV4fooZ6xiazP0RDOIpHOQsEGMr+fFgVa0nVbD18Jwp2Z8AC+iAvRy3UTO1PfxIL2Aciij6DOmxK/60jG0qZsDF+I0AK+WEHlzGQIHv+kGxs07QYqvVmzFFkpnozr9RErhw3sRrzNG4zoO14Gxm94RmzaUIYCVea3QiekPLBfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXsjY4ufCquIow6fx1lJzUWX4cQQwvlQ0g8uTNMCGZQ=;
 b=e7G2zEpcZhJMycILMSUprz0zPqIrnP+5S0RwifOqbkfBmMEcTATTxRYYkRenH+5UI6YsQ9NJmk9acw9V8FoyOXVAdtOJxNE2ydVdJiMo6qfTg0G6sUdVCihVk2G5Sl4IPZI0PDcUTfJR7a2nUCHkCJiid9T+8TCiWX+Q9YHP7XY=
Received: from DS1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::7) by
 SA2PR10MB4730.namprd10.prod.outlook.com (2603:10b6:806:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 14:17:28 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::2a) by DS1P223CA0010.outlook.office365.com
 (2603:10b6:8:453::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend
 Transport; Tue, 14 Jul 2026 14:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 14:17:27 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 09:17:00 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 09:17:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 09:17:00 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EEGxN2112972;
	Tue, 14 Jul 2026 09:16:59 -0500
Message-ID: <b05cc113-11a0-4d89-a45c-ed611b58167c@ti.com>
Date: Tue, 14 Jul 2026 09:16:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in
 cpsw_mac_syscon node
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, "Tero Kristo" <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260625113223.1711052-1-c-vankar@ti.com>
 <6eeecfb3-6d88-469c-b087-a4c87ade65a3@ti.com>
 <0abbdb79-bb80-4f9e-aaab-0292043472a3@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <0abbdb79-bb80-4f9e-aaab-0292043472a3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|SA2PR10MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: faa71832-9986-4000-15e5-08dee1b2a20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|18002099003|4143699003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: iH4fMnzS65G9GTfSQRhWsctiuv+p6LyY/zsBnUNYPe7rnmg+nfnVTkQAf13bfEdoz4g+sjn2XZO4+QWE9u6nRcZmPePLai/iN1QXeZZ8c8sda17LwXSm2wgIt6Rk8AWMwIuJw5jY5bb05U/4sWCV/9/p45QeKx4PFOdVkTrVvpFCa5fFOSlT2buYNpQiuMabn9NDLoOYB1MmR7DKDLGBO+3N2I6BokIefpJpHZbwBebguZ9bBMumu8JI1wZW2eHKQuCChEv2jsfQHi+SUsWcsFD49wbYKvZhVK/2YoDFFJyuLHnYpbpdfLqEI+AMjIMQw6Vf2OPBknq7gpHbEb8esgRzRcSsCoWkOPy3XRKpaBdCtvAGhfWs2/vYS8lSbU986/z44Weaq1FGuduknfJ+FDvdNynWBJOLS2PVFXG6tzcj9+0ojB8c630YcsW5VJKr12858LmeJzou42MHMOoYD8i6x8T2NITzJeuCgc5SLjaJdeorhz8RaJKgD/5CgyA327I4+qg0EdKn7z9E9S1q1QjdfeLI0PxQOohmc8n2Us/hYY0B/xL6M56eRCLK4hrKEj+mtBMhmV1pq3fsFOzbXN+PeMPd7ZSVcTuLf6jJc3NEpf9OYSZtuhfzBnljQiETtFRYK+yDAMlSPPIKe+/89tGn4HbCAWe/kB25rC9A7x1/rgyZCDERLn3UIiUt53y8g7t1rqt1pxYawPbPA3tyJw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(18002099003)(4143699003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ikOVnEO6wIkLedmnkmrulLCNLLWg5UtaZcb0AB2IKUpJ7xznqDUS9NCBGOzkviwUacf9EUdDmT9wZvbkH0mqBYUr/Or6VoncQLIIWAr34hmgObfe2wm3r/WLP4kqj62I3CP9QVK6V4OD4Vy+QQ0AWMiFHdZ4X2a2/Mbb7mJ6KqYq7i3ZOjyWvlMJmQdvcv7cBWyj5ZcHMCfqGkB5Hkw661Z1z7uB2G1f2uFfB6d1X0EYN5mPKtVuHAoF09l0o7THFVKueV0YfpBaWxwvHzu76d1xjzNHCN24UHYeEtyOAnY5KbVN2TFCC/EKcieK4UMa/aWr7jDyOjWhHk94yrTUVwGvCek0bdk4oSIYa116cFhmZNptz1jE+kyD5K2Pls+EHbMj0+9reUStpNzBx7pH7qSW5OVTPSIY3T/kLiOH6DjybWBcmXGYGDyB/MlsArCN
X-Exchange-RoutingPolicyChecked: W4gVkoDrrGtVtp/MLGszBKFDi89XIWlyKQv0xrwAUMh+PmZ+1Szrx6askfzlLvEsiv7CkYILmwLyeraDHQyN7Zz3ynOLVompqcDQP3cyPTHHf0LF0tcDf3BSAcbRRN66uJGV0jB5+nE62dSjG9xuH+hZ1f4wkjGMp19Y4I88mN6E7ctkziro0kUPllNBP/nCaU5mLICyeGpbdGzucyraGT4v9yNMjS35MYkYHInxQohoVOSGGuANwO1+whWWVlLJzezoQHSn7yNJ7b893nWpTfnr4yBR7Ks4djssea95OeIAd6dL1RyZd00aT2y3e/i6l2qKDBG/77gaXqSOCLpOBQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:17:27.1276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa71832-9986-4000-15e5-08dee1b2a20c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4730
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0OCBTYWx0ZWRfX2GOKMheaI+Gy
 IAtO6iUuxoxKhLZv1XVc88cOme8VOPzUIbbGcSsP6xxG1rvhlhAQ+3weaLTui/kb3ARwXlf6eGZ
 tGhgg78+IgNDNVjzGfl0IrYMGdbO6H0=
X-Proofpoint-ORIG-GUID: ZrjwMerI5c88EKj07ZD7UOymsZ55a1hZ
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a5644fd cx=c_pps
 a=Ji2ygefkweamrNJ/4LFw0Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=apn0q0EWAAAA:20 a=sozttTNsAAAA:8
 a=UFh5uEqocThAmMhuJQgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: ZrjwMerI5c88EKj07ZD7UOymsZ55a1hZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0OCBTYWx0ZWRfX79sHpva4SiXg
 N4gNxyV33ukflieJBo01y/69QeGlYrFlojEkDCuxm1jjWHgxF4jFSqXWkC29hpeDYoC2dahkLhQ
 vkQoDuiEd6ksiJmjF3ehCEYi3gy0jY1k1z/k9xWYABaoFaNwGraeSNQD7aXF2Z+xBopBjgwvR7p
 ZTbmf9HQKl5gURouZW7lNceAVwhyDANujIpmcCEZWKOl1teMaX4o2MH7Sv8YLwgBpymNplbAWCU
 5h0G/mECacvdmvXw8ixBGMtZNs2VZZh4GTpSRG6sTulFnbyVvayjZiIOK0mP4WvK/Oy0uBBRoCq
 4CYSSb5ADfbvMKqHadZghlHyoCk4kQD1WEq0q1WFX6Iz5A+7vE+EJd6TDim1zABhudxBp/zGRGV
 TrJXplGMyc1kis5g90rvapGRpET3KyTljSUP87t33o8sbvfnp/KEDJepKC2iE9X0mFaauFlh994
 WmSF2gbqbCY+6kLChiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_071737_150980_67C44CA4 
X-CRM114-Status: GOOD (  20.96  )
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

On 6/30/26 1:54 PM, Chintan Vankar wrote:
> Hello Andrew,
> 
> On 26/06/26 02:18, Andrew Davis wrote:
>> On 6/25/26 6:32 AM, Chintan Vankar wrote:
>>> Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
>>> Add "bootph-all" property in CPSW MAC's eFuse node "cpsw_mac_syscon" to
>>> enable this node during SPL stage along with later boot stage so that CPSW
>>> port will get static MAC address.
>>>
>>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>>> ---
>>>
>>> Hello All,
>>>
>>> This patch is based on linux-next tagged next-20260623.
>>>
>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/ boot/dts/ti/k3-am62a7-sk.dts
>>> index 821a9705bb7d..d3b3675e7a8f 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>>>       };
>>>   };
>>> +&cpsw_mac_syscon {
>>> +    bootph-all;
>>
>> Seems you need this because cpsw_port1 uses it though a phandle reference.
>> cpsw_port1 has bootph-all, why is this property not transitive though
>> phandles? Would not having that cause missing references when the phandles
>> are resolved to nodes that get dropped for some given boot stage?
>>
> 
> Yes, the bootph-all property is not automatically transitive through phandle references in the U-Boot SPL DT. Nodes that are only referenced by phandle from a bootph-annotated node are not themselves retained
> unless they also carry a bootph-* property. This is because the way
> fdtgrep works[1], it only keeps node with the tags present and implies
> that property to the parent nodes and not the nodes referenced by
> "phandle".
> 

Okay then, sounds like something worth investigating to see if this
can be handled automatically in the future, for now given the current
state of fdtgrep scripting, this patch LGTM,

Acked-by: Andrew Davis <afd@ti.com>

> Without bootph-all in cpsw_mac_syscon, the SPL device tree will drop
> that node, leaving the phandle in cpsw_port1 unresolved. And the above
> claim can be validated with the current conifguration where "bootph-all"
> tag is not present in cpsw_mac_syscon, causing CPSW to fail retrieve MAC
> address.
> 
> [1]: https://github.com/u-boot/u-boot/blob/master/scripts/Makefile.lib#L688
> 
> Regards,
> Chintan.
> 
>> Andrew
>>
>>> +};
>>> +
>>>   /* WKUP UART0 is used for DM firmware logs */
>>>   &wkup_uart0 {
>>>       pinctrl-names = "default";
>>
> 


