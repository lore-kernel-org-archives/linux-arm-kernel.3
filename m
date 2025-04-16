Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F03C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRuNs6o4pbJSm7saA6PqUWaSA6t8cuGOSodWyWa0pHA=; b=VTO8Ao9bqdOihCw/kSVaok7T78
	qFlFR1mUT4GrgvWPVUpzpTBQQDI2PCyhrxxFhrrWPRafFfZssPAkg+5mpMXIwppmqwISbivJj5amA
	Km8g7iEjmjiMblXmWNAvxGdxh2WxXNU1f1urg9KEAjze1tMRDcXsi+QiKXcuMWvw5mBT0C1zCTqR0
	aieJSfsMqr7C/Vso0IDDaxDrSh5E2h+Bwym9YuNhdT22mUv6SjHTLv0cWTOxzKguOIAcmTgmWuTsM
	ewYgpGxkXlyHQu37RvuMjtVYK54y83YszbrSpdrvN5eLjpbkKt5CkmshmAC5EWLza8zi96YICJR2S
	viOJsNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503G-000000099Yi-1um6;
	Wed, 16 Apr 2025 10:31:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yZn-00000008tSe-17iH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrt9/bbCJO3GP8nFSWI6ATAnEoutkWg8GeXEoou3eEzeAdTZJ6XyB5GGK8UsMrdowTSBaIvR2q6k29sZYpd3kQ/tJtkS1zKvbizy/6XA62AiS0fV8uL8CBC9TsyocSG7dEO7iRzkRCx5jTPGB3kuGMVsaswIqqQ0OAzAYOxWZm10DVH8CZgwm61YTiV1ZoecQjkeHSCpaRvn3p4bj0LTI6JmUQyOS//DntFYUcf3ajd7DZnSFss28d1UiYA6OpDLV24cPKGQA/MxHFg2DB8R0j4WiWv3dTGsWzyTzvqnwx7UHUlu9opUJuUKQXLM97Z5NuBWIvlCI7scuU6kF1hb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRuNs6o4pbJSm7saA6PqUWaSA6t8cuGOSodWyWa0pHA=;
 b=oHXSOx3ysK+fQNUIFAAkVpJGGOvVIxVLYQQOUNKna7p+MApofTMJdVUQAFhTlZ2jJy3VXGzbvSAgzu1KupdzQyrcLS8NaRMNGjPV/O9gpIVbF28jL3ynariY76QE8LNb8/rSef9HmmsnIVX166KL7m66hrqEi2NojDEDIADgJwsW6g8NtjLU39N26NRuRSVBnNwVr5HNkPlpQLu2Vina0QMJJ2QIejOHD3m/tYIBm5M+5zbJt2bnv0tZ+eSwVRHC8U8wIi/Fp/u2EhJ9XZsUG/+WMNd06qhGyaQSHnWd/46ks0+PsnYLl9E1pHzl0DtE2N/w7jEJj+YAn7q/LqOTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:7c::8) by
 SEYPR06MB6373.apcprd06.prod.outlook.com (2603:1096:101:145::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.38; Wed, 16 Apr 2025 08:56:51 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:405:7c:cafe::79) by TYCP286CA0356.outlook.office365.com
 (2603:1096:405:7c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.29 via Frontend Transport; Wed,
 16 Apr 2025 08:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 08:56:50 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E11E340A5A01;
	Wed, 16 Apr 2025 16:56:49 +0800 (CST)
Date: Wed, 16 Apr 2025 16:56:48 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com
Subject: Re: [PATCH v6 07/10] arm64: defconfig: enable CIX mailbox
Message-ID: <Z_9w0MlUlOUy9kHE@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-8-peter.chen@cixtech.com>
 <954d6efb-b660-450e-974f-dc89d777bb45@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954d6efb-b660-450e-974f-dc89d777bb45@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEYPR06MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe64607-dd42-4f95-c3ff-08dd7cc4a0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZ/xIkod/DXRUEvbVqKjmaNV5l+P4qXuJZeW/qlo4RP4ZpQ35p8rAg0iVU39?=
 =?us-ascii?Q?dBC+HbyrpuaJMzowT5kXfvMGmO45vaWgM5o432/ONVcw4ovgLQSWWtQ2Q0A5?=
 =?us-ascii?Q?IPqghs3b9Z4sqYYC06UazFSRh8cE1KyoEW3fW5h9zTGJKpCn5k+9PsSthSI6?=
 =?us-ascii?Q?n1B6+9lHcJdjem1fARr/zn8l7vv6/7UzctZXgVleTEWwaem/j+k+1sJF5JbY?=
 =?us-ascii?Q?nZPm1qFuiniJZB8/HJ2f2eqJcLeCD7UP3gyHTZU+uM3bGyNJNY+n7WJX+H68?=
 =?us-ascii?Q?9+lzQ+LG8SzP9H/QO3lzO/xAklHWYT1/SygOUkhUdwM836emPYamH/A6EYyc?=
 =?us-ascii?Q?8N5JHw7temGSk91vlsJR3bBV8sHux1tMYpy6lZvB/MJhr1uGRlWrr08Tiz2F?=
 =?us-ascii?Q?CEWHyo4gcxGS0nob25Xvxf/dam+cyhsF+396XaGbsco+8I7GjBSfEFdZg7iB?=
 =?us-ascii?Q?B5XSJXvY7f5YuKMSvI8wZQ/RIGwBq9ii5Xjp6qtT+tTsyS/tMCaN/DVs1AA+?=
 =?us-ascii?Q?NYW5lDoQsGy/xAyKDNy9DrdtmzcpJBEyhnFagIR42uSKl8xChuM+T8tTwpkx?=
 =?us-ascii?Q?4CLhb5myseGlJ0WuInUnb+rqIf6dMRE25RrIClK7n+Ji26AExguSBwVuVeTp?=
 =?us-ascii?Q?RNrEC5W+7NPJQS9irSvIK9vIIZ9hIxh/+MDMIAheQU01a/+MgGQ3eaTD9p/B?=
 =?us-ascii?Q?kEjPW0cKlS4OSmMj/rJOjnID8JXmuw7QNYFTW19SiqwG+QfCB/TI312c/9I9?=
 =?us-ascii?Q?3q94oPlfatswitv7ACjz/iEoOLaaBakbafkgt6JxflswaQeK0mQDeAkEWQgQ?=
 =?us-ascii?Q?aY/jA6T/6KS/fwfG2RhzN6TE5NEa+8ohLEnFhSr7PPWwBzs1eKuY6TUMwh0m?=
 =?us-ascii?Q?QUXqb8e5z8VeJQahivnV0QDRe7Tv9uYqxdgv5Nuj6OpCdfdP9Sdxl6k4QDZ1?=
 =?us-ascii?Q?tjF1X19OJROxEhulvdigtzgRpX3qF56T4wwMqhhmLZ6cZBIlpPmwZ7v8BjsN?=
 =?us-ascii?Q?xty4da21Tn9XL63dO0HCUhPchcyhvHouDi6ZugT39cVp8eGLZQg6zMAdoN6Z?=
 =?us-ascii?Q?gtYfwS9Mzt+bsavGqdw9HEz5/iWbXnJ0KLAMv+D4ACa3OWN3/9xTgUtZLeMb?=
 =?us-ascii?Q?IxMbEqFKN4FinY0VTD+MATHg/0ZdocVfjrw3OeQ0E6rq7BROTnM73eL2xYiN?=
 =?us-ascii?Q?J/P13FReOgL1EW4uXg5ECNbJlds+8i78gas6iat1xg4dsE6Fk64rFrh2ect8?=
 =?us-ascii?Q?o591nm59lXzIyVzQZJnLO4OaGbamwC5HQ60Lc3sQ2m7XRxxmM9V3nLNvtfCK?=
 =?us-ascii?Q?nJ6AfHy8t5cdb8QOXV7WX8v4VU2r6I4jwSM6tCHtipcslHg3BrfRcqVHzit8?=
 =?us-ascii?Q?mkU2mMGk2oAoVKSTPeh4yMfFo5h1oBNPCNL0XuKOhWRip6YwAPXlsEyUb+Q7?=
 =?us-ascii?Q?vFkQ0rPz+JI6gBmd+s5+j9ztupalYXvFvwcIBOTqx9xM96LxdOGb2BK2u5rM?=
 =?us-ascii?Q?UojsTaKDbHAjqK+0d+HrkugLJI2yl39RYceT?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:56:50.7825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe64607-dd42-4f95-c3ff-08dd7cc4a0d1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_015659_304823_4809CE61 
X-CRM114-Status: GOOD (  14.93  )
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

On 25-04-16 08:35:03, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 15/04/2025 09:27, Peter Chen wrote:
> > At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
> > the physical clock access is at sub processor, so it needs to enable
> > mailbox by default.
> >
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index c8a8fdb0bedb..4e9805c5bcc3 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1424,6 +1424,7 @@ CONFIG_BCM2835_MBOX=y
> >  CONFIG_QCOM_APCS_IPC=y
> >  CONFIG_MTK_ADSP_MBOX=m
> >  CONFIG_QCOM_IPCC=y
> > +CONFIG_CIX_MBOX=y
> Squash the patch. Don't create one patch per one config change.
> 

Even for two different configurations?
One for SoC, and the another is for device driver.

-- 

Best regards,
Peter

