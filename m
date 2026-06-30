Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVqk1KNAsU8KKHLzFMYHyiodsCTQ/eSgQNmio7ndmKg=; b=0B7MT8P7qiIepKx6VNpKZJRs4w
	d/le7wQY/ZWIV1yTat+AUZIACzBVxWJH6T0bu3h9TrSgla9joTBGp1S0iJqt9U1bHNsK/rZ2zNAGJ
	6kMCTTM5QQPo/Xj3q/o2CvHOdrymNQSLMJfa6qStyWRy1f6o5FVn8e/SoMnylTnC7R5HUU1bB+DBt
	rz3n+ZCwH4UqQQC0rhzX+E/p7l9aQnI1u/hJqrgWj9XU5t9E4HRnjJJ7cSuCIxrX/XmAftvaVK4/r
	MBGGjEWsVZlPpD7kH0q/bEVfkiRiih9VfcoogpuTi/QSq4N4RCYvF2d5Zrcyh8cmohAK4UMLhccWC
	HVDEgH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVy5-0000000GhZq-0XLG;
	Tue, 30 Jun 2026 10:45:29 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVy2-0000000GhZ3-2L4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:45:27 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65U9lHCs235830;
	Tue, 30 Jun 2026 05:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BVqk1KNAsU8KKHLzFMYHyiodsCTQ/eSgQNmio7ndm
	Kg=; b=Cdc3m9fSkLkPkRM70m3Q3e1MEdB0dz7s4qXFipYMJv8mMwpmRz7xIjycc
	zBCg86fEgErrT+3t8B35ij19NdWcsTmzdarHqkpv2ynSFFgx307BAWr89Hgd2eP4
	3CP6s3Y8BrZ34fTiMruo5R4fkzSgFqqje5Bmy6CWUPlbPn02tMs1OQaV9jiubkWy
	o+G05LTAhIH+lQtLUrRn3FgwrAM65BelqQlC+d2zCjvwemL46+FKtfiYVSE8ad9Q
	Z9bUW/PVLULr9wH+wvh6C3XWQXik34AEn4mdtQFhYAQ/H2ClL9gVpr+dD0XC3LEM
	h22CG1qyI05BX9e/nNrA1AjtWQNnA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f3yhsx4h8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 05:45:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx/vNOXk7aSo7cClsMdyayPIUc2QslhdUlNy8IqY/jkyC5vjUmj6WdQU7ph5eXB49dd5yOsBfNSb8nfkG336DzCQm4tExgolRSa/oN5m9JLZBr6wxZrOorU1f0QFlf6HF/o4Y1UHtDBJpVoAONwsFD+bJVXjcdb+hiEY6ez3VL8xUpXI2swGRW2od6zEeQ+vqAR8w+VBdLYAOBQ8wqO1QF783vJSZ2DQG3h0+69RURVo3RLuF3yB8S6w6tBIzhozCoSzU7TrKHRrS/OTQW8vJqTpwqY91AKRmwEjTILn7PdbH+0UE7KdN1EFNFosauxP/Nmfj+mOuNJvZ5LLXH28FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVqk1KNAsU8KKHLzFMYHyiodsCTQ/eSgQNmio7ndmKg=;
 b=dm8pDDfE8rNjNraqzAush+BnXBMIac5aO1ZhYGpvDPYivQDX136w+vtgquO7hTWtvJrxtnsZ2K/PmwPaSwBv+WFB6N6B3d2JMQUzjplo3hke8GyRFOUOlGoTQNrJeqTu3W89/AloNQ1ZbDlLAQqryMTs0jyQNbshNrtjLs4juRlzUli9qOstRCh1ZbxRCjK7mtwdaNDRPg//hQmsRgyypnUw2hqpT4MndYlJnaxiKeE0J1ZFXQFvyR3Rvaxv20pFKYhHzGEbRC+WQMFj2O/SGl2xHddUJfyYsXSz4d6vVQ+hx2nXN+qda+D2T70fJ4eAuLLmY1L3zAyTGVVnPnCDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVqk1KNAsU8KKHLzFMYHyiodsCTQ/eSgQNmio7ndmKg=;
 b=YJwRriETUt+9xOg4wMWCfyCRJy859VP+fFENbeZUmJBALKFYjIT2gffGLf/9kgo4UvLkhmyL/Wu+lNtTgJsxRvDsdGp74hhDhvKsB6+54DVLhWFzLGQuah/F0eS0KbsP7/okLZAiX0qpmKIBMlK662qbmWIfR2WVpI9S/WaYfgA=
Received: from BL1PR13CA0322.namprd13.prod.outlook.com (2603:10b6:208:2c1::27)
 by SA1PR10MB6320.namprd10.prod.outlook.com (2603:10b6:806:253::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 10:45:15 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::33) by BL1PR13CA0322.outlook.office365.com
 (2603:10b6:208:2c1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 10:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 10:45:14 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 05:45:12 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 05:45:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 05:45:11 -0500
Received: from [10.24.52.136] (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UAj9uY2879372;
	Tue, 30 Jun 2026 05:45:10 -0500
Message-ID: <b47cd486-5f64-41b4-9cf1-2f6bbad523c9@ti.com>
Date: Tue, 30 Jun 2026 16:15:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: ti: knav_dma: remove debugfs file on teardown
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Nishanth Menon <nm@ti.com>,
        "Santosh
 Shilimkar" <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260615091200.2373-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20260615091200.2373-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|SA1PR10MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: aba812f4-d46f-4bbe-1574-08ded694aad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2FdBHG+kphB9QvwxkLlxWTv2jD6Aa/Ji8SpTkROHH+OjbL0JbP/8Tf0XifnvgJz1AdJxK5Do58iKL13j6xotjw6K4Am0Frn9MEzWMoobiK7d4nhDz1+p/u0FqQ+yz5mHR+RRAnreH+CPJ5oA6yWR3vFPnaG8Kx4KgIDEyg+7JIM8ugG3YURpRpg6Ru0OLpJ7S9AALrvcrG5LzitsDYI1RY20sINXdLhtCrJqroc2D888DJrPhN4rhFa8kSDCASQzb6so8i1mDdhISM44SRSGpA3ImhN5z4g3LrocO0xtoFVBUYfCy4re6BrjisuxSGLm9utBXILOMCYcQWl5BuTZMmVfdnCQQPpo8zORQtNOxkQQZ49V+u7zhdJxAVNWEFXWwyqtJ9L4Qq20WCXb3R/GL9fX4nd6U6Tg7OMTggbLZfRhWuvuVCtrDQrFH3oYZbBxQfGkLA1nGgOIqvRafqSMkrUv9dlJzBmIjlbxrCF8XNgDfuiX5FxdNOGLmN8BeUI+vQijs1q9sTs4GKwwEDJBhrHZEfMmXdJ5J4bX6PvSF2BP/JmgtPtDyOCn+XoGy618afcRvSHBXOLxd89dTEPy54RKAkeZ8HMMWzbkMlyVdZgGWfQiq3oeMQt4kvGpU+ad3MGrk8fDxkalYSV8BagPgzujb3Mvgg+a7/c+THWpH3//htskITZWy3MliSJymS5C
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ysjFIdL3gkTopx32pebor1jOwnelRXdIJQDkMbLxCY+actPue8kxhYrVPO3+9NAMuHMP4ppKVa8L1uz0VKheYkwTaqh0Vgk0I67dArrtpVtgh5NUXLK6nCSgb+UKtZ4Wqljmp7ofj55RxZHSEieakky3uDbYl9ErZ9qaF23AmN1IKSUck97ySQtvlQ0UKCEe+6VUQjvJaUf+dMX+TkA1CEFeHwQIzJ5zfnX/uwYZ1t3Xgis/WCa4pkc0ApamXi4igO92CkQPJGDmsqaMu7G1eqzgiS+Uy9KJLOwSBscdvAQYeJnAbijQtIGnU8Ty0b6Vd30BC7MWhm6MsfRvDiUeZ7HV1S6akM3ph1e/46ocffhm6G9+/dEPLSNdXgKclJ3tK1ueQf10UaPyeB1cSH8b4xd8Ubz2dC9jxK0Hu7+rxD4LtfjIGAhYUYiSn0A3Xm0M
X-Exchange-RoutingPolicyChecked: PuD2cc2IUu2sW6tOZvDwvxhfEstMeFuA5xfGymmL8LujUrlWhfq2CF07k/BIEOlbVGI5TUPNLDqk4P6OiFtiu3VZTpknfFBkedZ5O4xvYQpBNavIuBJK23zGjM793MMXlm69CNGm0XhdCJActoQT+RP1FdSjhQ0pzhvQakA/FvgBb7d7vVukL1pZ7bnVD0P33qZawLguioJvHxayCPoDwJ0hfmLqFPncXmluw01ulrER6rRDf+mcLWCAGZopEGTLLcNH2PSAmN/u1kB2RG64cZWKMT9T22aJVxO/M4sngU+DEqkKwj9wv0N3q0pibGXJVxO4mljlo+1i7YYmqEBvPg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:45:14.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba812f4-d46f-4bbe-1574-08ded694aad0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6320
X-Authority-Analysis: v=2.4 cv=Q+viJY2a c=1 sm=1 tr=0 ts=6a439e3f cx=c_pps
 a=5B7wOmkMoK/13lwMvlsh9w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=ccS3oiZjvF67J92EE8UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LHNif0V-KYM9IE5iAbN4b3ox2fVUISVt
X-Proofpoint-ORIG-GUID: LHNif0V-KYM9IE5iAbN4b3ox2fVUISVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5OCBTYWx0ZWRfX5bD8L6MqYiUa
 xl65cz1WK51HgKvTys3fkcaWe3WQHj1UXwZCl1b2kGhtIQxd1JjiPgeTnvGbNYmuL2Palk72TYN
 /5tP484ds1qOVGGwnnFNBF5VjqsnGTqLxwlKoC8fDQWdTRWR1LLPWvlXvVLyHdBCoI4Pdq7iKCy
 XF5yKZzjqveY6Dq+Xtmo9qZ3yrYOaxxY80QFgk8ZUNcTFsWC0YfBw7M043Mo8dN1b5vjKPTxwN5
 ALLYyr0Ewefivu3U9UgmDlJCTR1fUT4HBUtNa1/ccU0wgJ9JtSNRIkfroCLLI9RpaPWm9Sgmt19
 1XqSs7nV46DNhE1PXCvHF6DXBtjLqjTq5pm4ToXS85Bq0GKRK1baCrLA2UDVUFj1SU81/v9YhMY
 FCLzl4iEKMhFp4jTt9SjqbkZFkpT26xnW1ufRY1nxh0pbonepBN5WvHnpUbwrZYapqfb6Zw/o2M
 NzX10fsWIJg1ePNTjIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5OCBTYWx0ZWRfX1KCdIaNjyWrH
 VHaa7b+3nKZ6QXCGIr6SmiEG0yBTtLYQBqIk5Yw+SsrwVh/9T5FCVjXWqjaelURpevbYC1/fjWg
 Gcrf7AR6fpVKAyaGCHEb2kiFNfusVjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_034526_610521_2A0F708D 
X-CRM114-Status: GOOD (  19.41  )
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

Hello,

On 15/06/26 2:42 pm, Pengpeng Hou wrote:
> knav_dma_probe() creates the global knav_dma debugfs file whose show
> callback walks the global kdev list. knav_dma_remove() tears down the DMA
> instances and runtime PM but leaves that debugfs file and global ready
> state behind.
> 
> Save the debugfs dentry, remove it before destroying the DMA state, and
> clear the global ready pointer state during remove.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/soc/ti/knav_dma.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
> index e5f5e3142fc4..9277c525ac21 100644
> --- a/drivers/soc/ti/knav_dma.c
> +++ b/drivers/soc/ti/knav_dma.c
> @@ -125,6 +125,7 @@ struct knav_dma_chan {
>   			ch->channel : ch->flow)
>   
>   static struct knav_dma_pool_device *kdev;
> +static struct dentry *knav_dma_debugfs;
>   
>   static bool device_ready;
>   bool knav_dma_device_ready(void)
> @@ -740,8 +741,9 @@ static int knav_dma_probe(struct platform_device *pdev)
>   		goto err_put_sync;
>   	}
>   
> -	debugfs_create_file("knav_dma", S_IFREG | S_IRUGO, NULL, NULL,
> -			    &knav_dma_debug_fops);
> +	knav_dma_debugfs = debugfs_create_file("knav_dma", 0444,
> +					       NULL, NULL,
> +					       &knav_dma_debug_fops);
>   
>   	device_ready = true;
>   	return ret;
> @@ -758,6 +760,10 @@ static void knav_dma_remove(struct platform_device *pdev)
>   {
>   	struct knav_dma_device *dma;
>   
> +	device_ready = false;
> +	debugfs_remove(knav_dma_debugfs);

Does this handle the case where a process already has the debugfs file 
open? A concurrent read() from the userspace could still potentially 
reach knav_dma_debug_show() and access kdev while it's being torn down
below. Pls check and add necessary protection around kdev access.

Regards,
Hari 


> +	knav_dma_debugfs = NULL;
> +
>   	list_for_each_entry(dma, &kdev->list, list) {
>   		if (atomic_dec_return(&dma->ref_count) == 0)
>   			knav_dma_hw_destroy(dma);
> @@ -765,6 +771,7 @@ static void knav_dma_remove(struct platform_device *pdev)
>   
>   	pm_runtime_put_sync(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> +	kdev = NULL;
>   }
>   
>   static struct of_device_id of_match[] = {


