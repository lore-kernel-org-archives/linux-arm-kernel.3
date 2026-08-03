Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5988C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIj/nWwoRyTGja2jtO4NX6GfKpL75vuH11rwjwwHWqM=; b=LVZbFJxqc8cy9WzjdkRO1fl1IP
	N0uhHW27wjl1hQXuu5znVG2rEjJ+xb8AwzN29yBvh5CBGe7I/NhZD7AdYMBl46K1HRpyZ2WmldpeD
	5Sdx047rlTIqSz33LrG+kFdDjOoEARlidRR7z099ulILr3MPpM96mSDKzs+2ucg0Lrv+j9urfy57V
	wxfnHB0JtpDQbcsfMWDKz5f29G8ZUOohUKsp5D9z7g9bpM5uUuOtKUxyyzrNsztt5VAuevNEcvxfv
	Nqpjui6hwusBXRXSMJ94FcgFfxSGp//kgLdDfy8tfif0jBQrb/tFl0vaAGd4Ivz0f6SlmcEAXl8GB
	52IlXNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0sn-00000000Ztn-1CYJ;
	Mon, 03 Aug 2026 22:11:41 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0sl-00000000ZtS-0ILU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:11:40 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 673JjCmX565282;
	Mon, 3 Aug 2026 17:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TIj/nWwoRyTGja2jtO4NX6GfKpL75vuH11rwjwwHW
	qM=; b=hc4F3JMWxoVVZMK9tEuBjgi6uzSGSzeQzlOdeqFCmFPgDyMhcJa+tqn0L
	ohaJxXZm4SvKVAdhJ5jYiUwajBn6BNfSyBopqE/HzMBVoKL02qb1wzwLTwyZnp+m
	qe5kuHC8ED/bjjmqwYv/nLZ1FxZnX03wMTszAz0D34qEp4HoT8OJHakxbkobQYf3
	j0RX2rqGqoFmyTIs1Vd3whLe5KcCD/pHZpnzZXnoshWREpC/ocwW7XbhsQC0Ru9j
	EzCpSNGtClRP7GEunJSP5A0fgCTGMix2HNYP9by2QzHlhHw/iF1TJt3YWI9gtWef
	999EMvKAPw9Mwm7rIEtbrcOw7uZYw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpn3wy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 17:11:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEWq4rJzjSLGfnznfxSGLqtg0/ZPPJOE4DgTnnNCnmc346R0qxizyvjisJzcnX1D7QLBxYYTPorYkLtCGxXgCHCLTngclzxdELo7/0AlDwLsjUEZWmnIGEDDJfzJ9FRRXvIH5InP7r5HieOadRjzCmvmWVzk9JfJUkOgowN0bEULd86BAnXcOl1ZKfjH2BM2I0fPyPeoFsbijxpCI2n2EZ3rZhm9OFKLF0ozWssVbUXxLnuEZSwHaT7HUxJTr3dReq9bzVjcVuXuWHlcCiDIprQL4WqMEqQmwVVd9kKvOPoyWvxdvIO4cckT07JF8Bv4eSCot+tp958b0nv5g8BOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIj/nWwoRyTGja2jtO4NX6GfKpL75vuH11rwjwwHWqM=;
 b=OYX3LXpY/PhcdB7OLYzn+al9AKDumANARj19DGI93a3kQKgCfxgQwtMNvSOWBkrzlyNFrAYpEVK6SFL3J552Ccx6RJuAE+hGg6dElmP/+kgLmRAWu9hf0Oap4QLDXSdx9Nz+N9qhcs3FSt5NkVgnJWjxP7AMzmt7NUMUFhm+H4R8b+l0Pbvy15v1BEZfVbbMcOc3m00c0rPG2HgaBD8J9DF0JLbi+/fr4zKkk2Zj2NMeekfWZlD1QMgUXZMMY1LHpt2dR8dCXcCF6JTOxmXqwzZwcel6iC4tmcGYfga358lUZyCuOOsw40+RkEYjgLItWf8AhOu6bMPVV9NRxuOI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIj/nWwoRyTGja2jtO4NX6GfKpL75vuH11rwjwwHWqM=;
 b=SQB6q+jOiNmeqWBHIahqQ40b9kJ7fjV+WygmhDg2K6oRg79JUH3sn4CUTyzvgK+6XS67uCib2pmXB4R9iM0hohNzg/ZUKbMDm5r+ceKuuNJXQHoiWbzavb6Eps/+W4xgZTJKraZCXyap2KULZFF98HGf16UgwFIyF/8yyQFYaN0=
Received: from SJ0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:a03:39e::20)
 by MW4PR10MB5838.namprd10.prod.outlook.com (2603:10b6:303:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:11:31 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::62) by SJ0PR03CA0285.outlook.office365.com
 (2603:10b6:a03:39e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 22:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 22:11:29 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:11:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:11:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 17:11:21 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 673MBL7l2522692;
	Mon, 3 Aug 2026 17:11:21 -0500
Message-ID: <52813e31-65ec-4b57-a722-ddf1c2167c8d@ti.com>
Date: Mon, 3 Aug 2026 17:11:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] MMC pinmux configuration fixes
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
 <2aa271c4-7e0b-470d-addb-4aba73ba2177@ti.com>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <2aa271c4-7e0b-470d-addb-4aba73ba2177@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|MW4PR10MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: b8debe79-d4b4-469e-b946-08def1ac2b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|10067099003|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: MU0bVunwZRv6hM2fs2PGpEjf+Mfb5CI3F09C0Gs5BA9m5XloghSl/zk2HxlcGP2KvkACRJlul2JHCb6HreONc+qI91Pp7RWfm1aQdJnA1RFdqPr06pxLzC6fOmTlSF4/s3RbMtDYdB4dtjD2lHHrN7OHa48ntpvN6HSH3sopakpPnNJL39GAQU1VHgv8XcIWsQuAsK7AbRDwrRCooXFdiWU41t7XE/6LFq+ZEpQgg6HtPfsE1hpT6WdlbTtPfGw+2x5JBlGqa2Sv2m7c9csTY8XNp61bcZtXuL6W5kcAFS8HTLOjYG1J2wrdwEHYtigyvZbV5EpypRnZQ74zq/peDi//dT0ZpQYKKoJmcHCCzJXsrkaC7Zg8IQ5PHF5zfx0N6Snb6aFBDKkmr087SxaiJDdKPNQ4yvZEOAn8p8yyoeQ11fmU4+RUCP1AAdGs4/9nzN/hNKV15a+QgQf1b++FuS+8g00yYfSNx1Vl7EUapiBN4j3U0HaS1YUEUK/nL/N4Q31HLPzBEVWtqfXUiiLn9zrh/EtV8UtmjTdOLa3SLlMxyRwUozY3DCdN6tXLqIVmfctGnWzuLaVuEeZJ/9bNwOkg787v1UdEpuQLV9d1MRzsCSzEJIVBLzEizmmeTg+SyQh8+Sm+Us/P9obcsIFKl0ekkInH8hez78HCZuHTCWUe4x3ihn9AndLwe/LvJh1ec1zStuZ+HwWRLgDikj4zfg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cWkP8lgw3xLoc95ri5sfKIXNg1QaBShh3hhZ7eNuaf6sEgg7tyC4Kksc/u0y0oq+T4EDqT+aZhi2vtgdogscvDAlmbde6tnfgay0upU6IHAQSHY0GQZrMKKwP8oW5m8F5pozkV9PP8dk/NlIMGNdtJ799UI3nnYBFdxgRwCTF4+vYmUX+mqxZOofGklH8G0y8RT6+W07AzHMfT17BHEVWu1HOvuNRhNppbnOfHgRCXcvMjN9rgHRPWAYzg3wo9majEbeFAGlUYCdIzZVngbwHSUH7r5cnKSYZ0Vembak3od8wEB2Y2V1kBqd+Jgr5tHV3wWmKeO7xNufu+FfWNCVaSas1XVPiKKtaIyM9MNYXy1CbSlOQ/3qHmVbNXRveXAFyrRyp3KUDk8+wkuilZvHMAV9o9tS1pLMudNc4rr6TJfwWjVxAUejTsmIZ8oW3t3e
X-Exchange-RoutingPolicyChecked: Ic7Xh7GlWOIieoBP6Vs+2L75QY5fTdl9qCsydCDgrrpgNSVocmSIWqMThRUEPc4tM/Xz9vkGgE2VlHDx9iFfLopq/qVd0tK0H7FhVy4xn1OjwXtc3Y9pZ1/+rVBh0pqNRRStptjQZBm09lpvNhfUEfEA0AAY56uhZx5Kvk1ixcfPLT7AIT4XZtExqf81I8AM9Vo+sDMT99vifXQtuc+lXLaYuucKGUrqspdyFWXxEkujY5Bn1xMuB0ytcLU0xgaFhgcbhlsRPDi5mmjvRb8IJkzI+jOrMyto6L0SsciXcW1qcVJrSKIpIm/D7FuxPyXlNuR1JACa8cPtMdOxpqKfDA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:11:29.4827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8debe79-d4b4-469e-b946-08def1ac2b4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5838
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NCBTYWx0ZWRfX2NpKLU0UabaS
 IAUjxveV8dNFQzFXkocVzXFtFqW9zmVJa4iGOQHZtc+YI6s0iw3q12SFjU5RNw+oegOkz8iR4zg
 08Xjy8UvbiBRRBTk3IudVL9fWyF5slTweP/RPvavYOLqsQtLnWhx4yn2TZH6rqQy7yFkUjiTduu
 6CpZBAMH1/LGhPMHzYO6jl8NhZLTeTC3w2BvHXiSZ3j+6cNAkjLcubJgsN36YkhrhUokdw8SOgf
 JPg8qYm5LaQPsF9pPYYuFeMDdgPWPg+py3SHqr58Mo+CcvtH3vhUhxyH3sRHky9F0i8svV7+Cq5
 N60LKD5LY6QnfT4Oa2WSqSci2jcw5TGI+qViXM3JTNaTeChSmrtzQ88pAql3cEUgtRaAPMuoj+5
 yVx6Nxsp5NsVTHwoik9DDOZ+FPYfsaH7tUX0NKAPkZb3/c9LPs3lBysb7a9PBKVSkgDDCoT/2wI
 f79rYNdLSNZ0FfqmZOw==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a711218 cx=c_pps
 a=R7TnPQtMnhj+722GCxzAsw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Qv1BDy2MC1uXxL8EwXoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: B9Luv5g8TnMRM6aTgByiwh9VBMa9UtIz
X-Proofpoint-GUID: B9Luv5g8TnMRM6aTgByiwh9VBMa9UtIz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NCBTYWx0ZWRfX+xI2z+VbS8lw
 /9yGNNIuoQzzV0CTumzczXbmioTumu5JRvIAyxcpNIuGkm5jCJa+7Y8wW8ZVYCWWUObRzkI/U/8
 qrmBcY2DEfx0AwEi4bjraFmuGh4nZKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151139_244782_D7704794 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Vignesh,

On 7/31/2026 5:56 AM, Vignesh Raghavendra wrote:
> Hi Judith
> 
> On 30/07/26 01:29, Judith Mendez wrote:
>> This series fixes MMC pin input/output and pullup/pulldown settings
>> across AM62x, AM62AX, AM62LX and AM64x boards.
>>
>> All patches have been tested except patch 5/8, so tested-bys
>> are apreciated.
>>
>> Judith Mendez (8):
>>    arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
>>    arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
>>    arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
>>    arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
>>      MMC0
>>    arm64: dts: ti: k3-am64: Enable IO expander interrupt
>>    arm64: dts: ti: k3-am64: Let MMC1 clock loopback use hardware default
>>    arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls
>>    arm64: dts: ti: k3-am642-evm: Remove unnecessary internal pullups for
>>      MMC1
>>
> 
> Apart from 5/8, these patches seems like bug fixes. Please repost them
> with appropriate Fixes tag. Its better to separate out 5/8 as standalone
> patch.

Since they were not functional fixes and were more of documentation
fixes, I did not include the fixes tag, but sure, will go ahead and
re-spin with fixes tag.

~ Judith


> 
>>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      |  2 +-
>>   .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  2 +-
>>   .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  6 ++--
>>   .../arm64/boot/dts/ti/k3-am625-sk-common.dtsi |  2 +-
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  5 ++--
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts      |  4 +--
>>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
>>   arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 19 +++++++++---
>>   arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 29 +++++++++++++------
>>   9 files changed, 46 insertions(+), 25 deletions(-)
>>
> 


