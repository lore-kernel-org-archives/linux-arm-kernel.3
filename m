Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58448CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+d/HFcINJKHIgQxr61xu+C/GXOuWP2q9kjguxD1elY=; b=PWCkq8r+3apAksuFOADi2CeQCJ
	1V4VMvcMixa2oLT3vQuiHcBLLxpqPeOpo3b4JmuPEAUULRg5USR5rmj+CqpRXzdl5kBJ5gzCXeDLM
	eSowYX6+KuJWYhiQVRHsMzjx6w29FAqXWmIk+AXHMigTPy4FdwoZZKNAXXHvk3GyKn2D6+f1BLE/O
	W0PkXdNKuDy/TE0M1P4m08utypdwa8VIIb2WU9AOoVoDKVt3IItFQbkumlRuXK24n0Yzh5yu49Yha
	65D4O0LzpfvDOumo5HhJCaAiybz54kErTItx6hJP5Tt1JOFTKwUBNOhr4rZz1xvaWZWNHufm6yBvb
	XnaG5//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvLf-00000006OGH-1iGF;
	Thu, 23 Oct 2025 13:27:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvLb-00000006OAD-1HpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:27:21 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NDNckf014549;
	Thu, 23 Oct 2025 15:27:10 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v017qfgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1Cd+9PYekExIHfbOsap9hpvId71QTqlWPQqf6UcDPv2ybcD8JDJOjv/wkMuJLiE+yG32ks1N4Ofp/OYdfj7hEUMsbsbZxKcCl2KU3wljItdzl2gfVnCEkfXWVIMBEUokH3I+fVk/MZGMmUEFIhWG3+btNyBPYB40f+G6QSp4/AYDOXIuTdNviA5ojg9M+30yeGR4C/uGtBCM5uGIq4XrsAyJ9H62Wc64X8ckfRyizUCBu2+t4a6shgzrXpfm+Dc5wFe/COdiATH4jxCC+dYfkhfkGtk1TK/NWQFafjgxoNxz7tvHEm1joBUkNwuD1sCKoMmDDIJMoblpzTJTt0HeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+d/HFcINJKHIgQxr61xu+C/GXOuWP2q9kjguxD1elY=;
 b=joL1lFpEQlsltyuk1Ws6RpbHtuLsFYu98ZGcf28GzcGuxfQL6KsHouYveZvLvDixFT8G25PGzsJGzZb8rsVBeaWE/aREtzlK6yRyyLUeKq2w4zZHNryJNQt+2a+l/Ff2Z2PsNCeeyDuCUVM0iGMzo6qFRnnyLU2CYKl/0hmYRWFk41kfuTLXPl/6m0CuWdkxes1cc5CPbt/y5GovVltdhz6o0tjoKc9+1x6AZjP7KIhydjV4NIDq1yRVEddS/05SOjC+GNVl3rlJKodSYJlN1FDeKjK0L83nRf4r/aEpqqTyD1anEqN8QWAopQOcM+lbCh7OXadVpPKOf6/t2jFoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+d/HFcINJKHIgQxr61xu+C/GXOuWP2q9kjguxD1elY=;
 b=JoSB9rlFtbn1/ZjpwlFXxj1AKksol5HlOXvIinDLTMIK3LNrHuW/ACE+UBha+xsgA+O5AisOYHGD1aGEnx2HkjFrF+xv2haPvoAVr5DDdXHcvnBM1dUAIJqJ3Y7niJCZoNBj5atsVcUb6/0cM43YjFuFGy9EkndN5gp6QnNn6y5d+5ojbNnTvMIaNLpMTi8H1mjXJmt7yhQmDhVG4LDH5QrecJMtwUYa49FTkcvXTDF+9YUlTH9CUQeMkINdJyN9ktiwzg6WO8WTzeFCortnaLdkL59DNrf4uUPspC2knzRq10DqW9myfreFW9J1c+Xc5Fq4Xup/UpF2DeaOuZUlnQ==
Received: from DB9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:1da::16)
 by DU0PR10MB7334.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:446::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:07 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::f2) by DB9PR05CA0011.outlook.office365.com
 (2603:10a6:10:1da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 13:27:07 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:24:41 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:05 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v4 03/12] pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put-ps'
Date: Thu, 23 Oct 2025 15:26:51 +0200
Message-ID: <20251023132700.1199871-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DU0PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7c6d5f-405d-4ff6-2119-08de1237dd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LroDQmuXaKIxbBOv46LScGl/o0ZVTIfAdgA+YfBsUtZ76Tvorp3nDDHzUyJH?=
 =?us-ascii?Q?Oo76ryX1S3nFLH3egxvfsYWSmmT0P6hRK0OJ5HVygszTKiiv+dRQViBds/Ax?=
 =?us-ascii?Q?ql2PiqQS0HeDcYBHBtRzL0wVkwE67/wsVX0dACXUh1Q8+ZHERqVy4MymYHgt?=
 =?us-ascii?Q?dkXX7YcJyaJp/BF/cMxFMe/DkY7/Ql43MegvWl59FRITYa6Adzoi2bZT/sie?=
 =?us-ascii?Q?8yvrQlodO6RR038ZFc7pqvHDWWzWif/JS6WL5TWrf/G0PVMnsL+Id4PdXrOB?=
 =?us-ascii?Q?lpz4VMoHD1eA9N8pvMuE+2uO9DmksceJcSv+FH1Wak6TLK0PPzawDPu6mDdQ?=
 =?us-ascii?Q?hzngC6fkarS68LemhcduIQ7sjoEK412fNbkUXsiUJkzZYaiFS3lwxfQbaSzX?=
 =?us-ascii?Q?GK82aTxiXUGGay4mTDakrYM/SsKQyCPh3FmhAecVxBhKEaPXz6duazTIyYb5?=
 =?us-ascii?Q?P9GZhgczyI41yvtppc2oLveEnCxtlTMEJbBefmJRcIIStB6GHH3HRgNq1usy?=
 =?us-ascii?Q?KibicGv960khALWeNQpZNzB6nxZDspQWUaNptbZf9p5EJLBliwu/qLa8D5qt?=
 =?us-ascii?Q?uvYtdwL+VcH4KO49jBUmDFpLgATeBjBoy9HK7YQTRP6DY525izCFK5s3n05D?=
 =?us-ascii?Q?Gs05FLwznc0tWkZsciduXPBmmevCQUgS1w20u8FzqNX/s+Y/93fxIBea6rPR?=
 =?us-ascii?Q?WDT2HMxJVEB71XpcDwy5XnGjiI46pIOHFXPSXrRJW15DxK3Kt1/F3QHiDkYo?=
 =?us-ascii?Q?KE7bKYSQqB7d7TkpwHXFGcEuel2D9uEic4giovzIL3mWLWO283M0BnnAbWmx?=
 =?us-ascii?Q?TnE12WwG0TbddqmLeS8extQs2KpdxNGmIpMq51G67kKstvGCN9iQN6yhbwhI?=
 =?us-ascii?Q?eiprPsSqL6/1h0EWqsoL0xt++jpdMi2qXWhblImLh1sJgu6go5Tn+TTdBTgl?=
 =?us-ascii?Q?ywAN1M7PHU9pwjbWWIZDx9y3crxvapRm41sO+0WWdvkcs3rng9ckyQo/W9+e?=
 =?us-ascii?Q?hptWUqz0V0agnfU/p6wZijzE8V3iWiW1ePZ0GRXAgcUzHllN/GcV+LzJib93?=
 =?us-ascii?Q?C7P2D592EPYmXDfP9d9hglx3Em5gnDW4BYy/gHq2p1eMNcbasDzvNhpvuaXF?=
 =?us-ascii?Q?4MnLHe3v0xoOOkjOrF/O8j2SjKgmGRVLtl9VvR4LtlP71m19uB5GwQW2QuA1?=
 =?us-ascii?Q?E10mp0c7kI31VqlvS4X4YB+jLpGX1Zkl7yLXCZnwsMV1QnqXU5qSJkxfqitb?=
 =?us-ascii?Q?2ZyEUVO8zGcmu2ewdif07cHvOLpNDY1oM9kHn1Hsy5Aa4WXTEqdZ0qtYWIBv?=
 =?us-ascii?Q?XgbzJu8H6NT4XcP7IE/oL1faWvRLZt7kDuP95IB8NRMeScjc03LCKwnel8R7?=
 =?us-ascii?Q?rJHLiUaxhKGYl+zTe4rBYMEvFwReTqSYN29oBelB7tG7cYLx9FcFF+L++v1B?=
 =?us-ascii?Q?5hcljRtpxnJW2e105pqwT6518AR3JArScdcCRmI4xDxb0pNe4v0AG8rOIwoF?=
 =?us-ascii?Q?ou9wCMubLXaLj6BP0eLWkdY6kVgH45wKBF3Mlv89JVFJPYhzNxHF8Oxh9d6n?=
 =?us-ascii?Q?kdUYSYkKaWCw9lmcneCeMGxqZm9FCmcYF1K1+O31?=
X-Forefront-Antispam-Report: CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:07.7726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7c6d5f-405d-4ff6-2119-08de1237dd53
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7334
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDE4NiBTYWx0ZWRfX4dzxr02oBSl8
 ndIauu3i3ZbScvGAF0YOrlMK/sFXh4eIu0f2VLcRedoHSCUc7vH66pxh42w0PWyyikZquT4Fm/u
 nYbNBgezWX+CFBw/oFVN7FfKeEVEuPKUtmNjvcPvH1sOWbypkgZizaHiw8XwB+Y9IMJROqNT5p5
 RMLFtTie3zC5Ton9VVn59pZKhfk9hs8iLQGSkETk78VALVbR4jtYdbFn85NPQClklkH2bGuJ9bK
 X6aVmLkPKHwjAbotxyEdSxzjb8TldTk+SosmFW5iaNVf6NcXrN2h3Zqz5IHpmv8ty4y3ANmooTu
 Zy0+okCHJqOwtCzzbeqqXDN7/pwiQeqU0VYGJtlOK629hS2B0FCWa6Uhhp2CH3fRwwuzyyFzV+w
 fICdimdeODP7DZq7mZ3XaXemlAQwbQ==
X-Authority-Analysis: v=2.4 cv=CYwFJbrl c=1 sm=1 tr=0 ts=68fa2d2e cx=c_pps
 a=KrdtjRokVkZpNyWqjvoQ6Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=w25x4uixzSbVIWrOvq4A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: dhzxGvcfG0-0AUQiK5Y1s0sAGUwTK9gg
X-Proofpoint-ORIG-GUID: dhzxGvcfG0-0AUQiK5Y1s0sAGUwTK9gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_062719_953364_E90B79DB 
X-CRM114-Status: GOOD (  14.38  )
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

Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
to the generic parameters used for parsing DT files. This allows to
specify the independent skew delay value for the two directions.
This enables drivers that use the generic pin configuration to get
the value passed through these new properties.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/pinconf-generic.c       | 4 ++++
 include/linux/pinctrl/pinconf-generic.h | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 72906d71ae1a2..366775841c639 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -54,6 +54,8 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
+	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT_PS, "input skew delay", "ps", true),
+	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, "output skew delay", "ps", true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -198,6 +200,8 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
+	{ "skew-delay-input-ps", PIN_CONFIG_SKEW_DELAY_INPUT_PS, 0 },
+	{ "skew-delay-output-ps", PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index f82add5d3302d..1be4032071c23 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -112,6 +112,12 @@ struct pinctrl_map;
  *	or latch delay (on outputs) this parameter (in a custom format)
  *	specifies the clock skew or latch delay. It typically controls how
  *	many double inverters are put in front of the line.
+ * @PIN_CONFIG_SKEW_DELAY_INPUT_PS: if the pin has independent values for the
+ *	programmable skew rate (on inputs) and latch delay (on outputs), then
+ *	this parameter specifies the clock skew only. The argument is in ps.
+ * @PIN_CONFIG_SKEW_DELAY_OUPUT_PS: if the pin has independent values for the
+ *	programmable skew rate (on inputs) and latch delay (on outputs), then
+ *	this parameter specifies the latch delay only. The argument is in ps.
  * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
@@ -147,6 +153,8 @@ enum pin_config_param {
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SKEW_DELAY,
+	PIN_CONFIG_SKEW_DELAY_INPUT_PS,
+	PIN_CONFIG_SKEW_DELAY_OUTPUT_PS,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7F,
-- 
2.34.1


