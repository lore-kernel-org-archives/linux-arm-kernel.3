Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69FCC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD6QvX/TJs/gTkOzt94yZpAwvEI4H3xNkUjXTwPGL9o=; b=pfn3p+jZSfMp6XUXSIb/ZwHX/w
	w80r5m4gPxSyWdSmX9hVIIDppEc+orLiikX/844zZ3p9gxkkdySqRmkGMQW1JXo+/GpXw5+2s1vY8
	vsFAeKohWX547xMdgiKH9k8/0SVfByUHKlZLgburz118IXba/pv7zYyx7F+8n4u+fy3bzPOeWpclW
	sPpHYSzLuYGA7BgmpG1rdABrGvU2m1f6mZ5FFRrWwU4FnmMrdGXlGFlBkK3DXtav0dCPfwvWSsMsq
	B4HsWMr+bLtvNwLcv/gGMRDu4gsUvDdyPXrLdgYxA1ORHkyBFl5tETg16yLH9cVpF1vxpeA5I6zV+
	baxmJWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcWA-000000044fG-2rRH;
	Wed, 05 Aug 2026 14:22:50 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcW8-000000044eV-1i55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:22:49 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 675D6um02363975;
	Wed, 5 Aug 2026 09:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LD6QvX/TJs/gTkOzt94yZpAwvEI4H3xNkUjXTwPGL
	9o=; b=bxIi9N6kcabR5sQynAUhMjRTFUUUZd1UMTie9C91IHgyYVOryIfyGAfoK
	xkEdlMtkNDSpTesSU/3Bs7uEoaezcNhCkadNwTej+p5SybQaHxzSyckpuO/sRim4
	zSp1zEXHcJXtcIHPOUkzpsvSa0YGQ4dwRTXGiE76dkMvbhtNrKrv3r2dNpNcfjO6
	32OysCLehDHm67bqJDgPEOlUIaGI60e/mTvwkLpXS+kelCgtmk6+fjK5M1lCtykd
	r/Dg5ayaMQrGMxmcolg6bX4rzs4NzWcaobIZ7I7jO3QvOABOQx1pW8Yga13kwxyo
	QlyVtyyWmIfVnEpUw35OnplrLDc+Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fv5sa8kyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:22:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcQYPdgstxsAl8NhUHixQCkb8qH8xmoj3YDbSEUI55uDDYkf+3jydVIbWeqkrcBXK27YK8U7jW3ZGG7NhvpFuk4yCncILI+/+paSSTH24o4I/FDadmk+wk781EDLJ1uYCefXFly9N59bvnLtz3Oqtq2A9gehNeAh2gU9GWwsF3GsJTrOX7MVe1HSEDm91MSazmqAP6J8lJm7MP0TgyaOKjsGUyaQJsgERe7AdSz0QiqIsSPVj3PlSEOHjNqgQVxqJLU5bRh8gqmsxqaAhohU4BX/O+fuC9MksX1xvF77VJrcsjsQwJvFkuVDYYjTZ9C5112V8+YpozORxFDtvJcWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD6QvX/TJs/gTkOzt94yZpAwvEI4H3xNkUjXTwPGL9o=;
 b=Aok2rG1hnADT2EETglith0r35RPo6e2R5LqCeDAzekx4x7Ls4XHKMferPYP4fXKtzqnkIup4HT7bI0Yrx/Jm9OsSyHqkdsq33hx12IBR9n3prtvNXW62Cth1Z9FbLyKItz/B7BxkueVpRuvegFqDaRqecnPSFYT0Ch25fLhbBudCo2T8BJ4ZWxZam34WtktL2RFdkdCWml7mQvLtr6RSurVOiBABO3N29foTyajnRO6riOnVrPg4GmB2iAtCMb7RFgn9D36hM2T93ZpRz1+6iv6mWNidYzEAJB2H31aCfAVwpu96ZF52UqPjn3Qf8RsrnhUHI0P+QIMaQBBk/rma9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD6QvX/TJs/gTkOzt94yZpAwvEI4H3xNkUjXTwPGL9o=;
 b=e1D/OLoBtEboemLVPuMmnGgnPciFJ4tM73oCQFrABuoQNmstcZE9BLvqbT/+6mJ34sjDPBDGGNylMWaMm5F/A38nDT5qrWkWMlq+83/+mQgtTXgE4wFNgK3lHpN+zVsWlSGekdVK9iNFRIpm5xvtBahVVELA1vQDGBllQOeEAMA=
Received: from DM6PR01CA0029.prod.exchangelabs.com (2603:10b6:5:296::34) by
 IA1PR10MB5971.namprd10.prod.outlook.com (2603:10b6:208:3ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 14:22:43 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::5c) by DM6PR01CA0029.outlook.office365.com
 (2603:10b6:5:296::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 14:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 14:22:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:22:10 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:22:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 09:22:10 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675EM9ZX1546505;
	Wed, 5 Aug 2026 09:22:10 -0500
Message-ID: <d753c2ee-7f5a-40c2-80f7-85bee09151ca@ti.com>
Date: Wed, 5 Aug 2026 09:22:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] MMC pinmux configuration fixes
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260805004821.416613-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA1PR10MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 404743d8-1d23-471e-ab59-08def2fd032f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 92vn6wPcUM8zljf0TwauQYMPw2J/syq/pVMTMFiffWRtUW7tKx8VEt+Onj5CYusAdNiqbISUZ2HvAa7aXyMOdxt/L1ITO0pv6TNSfbQFikmact4Bnu8pLXaamxRmxvOgnktFmu+1Tkbq27piyqp29hfkOoorvumJ+pWirGPyxaNANMUjBMaGvjhwEw0eKw9rUMSHRZ+4PSOieI6AbOAxFXabMr912jye+xSvqqNCU5ZnH0HYUCTQUzUEkm+NqpEDM+7GiZ/wcacbgoPbOWrDAIoX96vOOYSc7uSAWRRwX+RlzFlhxUDgrHx2WNpfrm3uFFB5DXZ9M935Lm1v7fLYDKspPBzVnQbpvJAK+rFCpbP04pvNPygkqQ56oj63zjTI091T+XJh4znOyJegUhRiHpzcZldIZGB+h1jdfNg6twnff9+ikeK2AP7qYphIYdM7d+my4MlHiNG3sDqfOx1e690CCvZbuGpYUXbgBMn3kwMRim0fZ0vLfPpzKsYulYbiHaZWkDf74Z08rF9IPNbLnTHDVXtWQSuUUwzjUN+FsQ2qGx7R+EKmKdqCVfAzonF1+C9MK0W1qqOF3glY/jgksafAPNSkyug0aVkzy0ieiChxs4zTYMcQKrGDZ7L2UFAb6gMFqz/iG/temxiLl+n1w2M4eMLfvnVmG4r1YxZkeoCaPJ33l+mzNQlPkFGxDIpF9gh3dzW1JS48VYQt0jTBBA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M+w6KJXfBs4CwSz+gF8s2OHr64sJQVo2JFtS9+QqJQPpBTbKDXAf0sae1GgrGdTVWaPq3bsFrSausWQbE+scfTJpc3KWEXucnf4RGAr63oTzpIxdX3hk0yf5ov/5CGUwAW95BBWyerTTwLyQScudmHiox+e6wepXJ344tCdW1PAWpz3D9q/IPzAVARDuSh+RKZZ089+pWAlMPo0+zg8S48AHUdTwUhWgTkFkr3Gq4WonxI5hQMcaBxk71FQs0sOVinP2Mfbt1tPKmDb7FSxctUZNMkcfDVMlrfbRmeyuFFxZaoRfplNv+YqBCAsum1prSnlaT5a0a8T0SIoD9y9SivARxK+SjAWOAneboNEOxfvnbVieVc9vtnuaUa+dFED4/vXwG3CKOEfjLoT0Mhy3a/qW5Gz88iAVECJSKOr7WjzU1xUDCgZ/3rDyHb3er9SH
X-Exchange-RoutingPolicyChecked: DkqSzsy+zfCCFHpS8wfxR+BQIYOtfEa/B5Lg4vtn+7E5Ut6glyDfZ8voypRUYy1uUQUFfPdM11/UmvOeunoS/UdlT+g3tkCOJgRskz38zI/uLNSCRtldTCh+7xldaXe8oToBeK93IkxFLsmayzE2kkDpQ9dar++5wON7Wqse+Lp0MWcrS17ZSdVfWSorQPZhoaUzE0jm2GUnJjcxnQGdFtym6WXr7cl/pwVGNy+Noxwmhf6271mwPVP8/+aSm/zLgSIE+9FtyFQnMp+puq8vPnh8BNPcfphoeyno+qo+TgjBzDjvfQORJnwKyIMqJWE6MyZ+GgQeZBsRDk/ZMjW9iA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:22:42.6222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404743d8-1d23-471e-ab59-08def2fd032f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5971
X-Proofpoint-ORIG-GUID: iNlmiQUsJn3FsU58DWoZ597mrRjmf5Kp
X-Authority-Analysis: v=2.4 cv=UbFhjqSN c=1 sm=1 tr=0 ts=6a734736 cx=c_pps
 a=MCVANC9+7Y5oazsiooDUXw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=b28oZElVo55NlUP1CwYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExNiBTYWx0ZWRfX0foi4UbjagC3
 1RbDwqTvsSUKrqp5l6IzWuu9/Idkdo7u/8aE4AuB1iCNyEXxyjqcvbkYXI9uieM0g6IITz+d6HJ
 V7fttUay8N49Hfi/O+EGaSAfPDOrL1L2dudGzA2AhBcmz6D8tbpYSQQ90eSTm/6/TCGwleBMk0G
 7i7ZTFOZgs/2BhTGXh/S1V74Oo4RC8E+fJOO+I9y+hTKJReke8QXBqtRUrqXEqpGe2cXDE5Gwh1
 k36yGv33Eyq9q2Lh6gdQ7vuK9N3FDRdcpHPJSqZ2Oh3ievQ0OGq2RpG2WbKNxihYbldar+rzcgI
 66Vzx0ssvd5kurZSJlx28zmN2lCdSs+yKxWCjqdzEtst1I2juauDeGL1pogQMkGSEwMElc7M3vY
 Y+7139fqDWrXN5lnJXIPg6zz/ZdTcWt/+OW8kYetuKjtjQWlhwsY7dLT+9gNIy+CAMw+vL6vfwv
 i47r/iHCFwE05PCFp2g==
X-Proofpoint-GUID: iNlmiQUsJn3FsU58DWoZ597mrRjmf5Kp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExNiBTYWx0ZWRfX7EkWm9/gRWyO
 8QYi4mumkA7jMy99Y+LXFtLX9zpJLauzCJkg99hUHzBs51t/IE2dRYUK35nKTt6jkVKZpG15tPw
 6zoAl10S3qkpAsCpfHK4ca5914AUn2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_072248_525292_667326A2 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi all,

On 8/4/2026 7:48 PM, Judith Mendez wrote:
> This series fixes MMC pin input/output and pullup/pulldown settings
> across AM62x, AM62AX, and AM62LX boards.
> 
> All patches have been tested in a downstream vendor kernel.
> 
> Changes since v1:
> - drop patches 4-8 since they will be send out in a separate series
Please ignore this version of the series. I am sending
out v3 with fixes tags.

~ Judith

