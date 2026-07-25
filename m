Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fqDuWQkXfeW0V2FbgyERPEcrFRGaAAzDWsuJN/GjKs=; b=NjmnFYcEU90Fbr/MVA53p8Tb9l
	PFEj10iutS6ML+6GHBMmXeIzfYMsFR5Ph2B0BjiCG4YmQDi2n8WZPM3KrFqjLkLHg0yoJk9zG6t0L
	HAAwK0n3kor1DJMR3OlRUVLD4vw8WnPqt4GxTDqCOy2wZSZ+eVLhiwHseJoQ8+WPnssID4ryI1cxk
	Z8C5CveKQaIyKHAGAH37j9fotAfU9LE7NfOfchMQkJebexCge4fUOmGVupr1JzD0rFUBk2iKHidES
	WuAKbl/whTkqRLTz36VB7ovHARrR1qOEwbhjiKiNngUuQU5gr13nua0IdpupqWl0taXIPK04XymE7
	GYt9Lnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndMK-00000000RcP-1uep;
	Sat, 25 Jul 2026 14:28:12 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndMH-00000000Rbk-2b8m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 14:28:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSGp2Yz9E5oVT6RPcSgbIC+bbwnojUeREmB+4ZmIzHokvbccvDnrrwI7Y1WHqGlvz06SGvwfZpeHtcpUH4bgBcsyYFCDDL2/0Ty7itFSstVV36hFERz92O9Uzw6qmzrCuvvkfXUKjWazkU5fM5cu77i3Y2OXE/gjyJwldvUZ7LMdiD9nt97wYUefYbJpaLnnacH/0nPONSmORJRKrOeForOWliD00+cHP3H0KF8/qARUI+FlYbCqLRIKwz8D3yPsL/AfH9cFCEglYgbas9amazc5K9UeiBs4IezXE9FUrqGWptBFbe6iq1ugQtmpa4rG0RneKJM5Btr14q726vedZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fqDuWQkXfeW0V2FbgyERPEcrFRGaAAzDWsuJN/GjKs=;
 b=jykhGK2RoZO0iRX9TKZMvh4cFgt9lUZBXrA1fyFephO033BVw0+2iEQ1P0KI+/UfmfCU6l7GL/KXlLJ83YDpwSH1bWwsODdqlij8oY2kt4kheWv28liB7cKJw6QRhnBwnx83yILO24YAJvIE6ssNdNQn3qNUjFUzwA6gw/OCNGxSmSlgWJfQJGwHmM4Wj1YLsp3OfxO6drDE2Y0O1s3/EKx5pFZZOhsbt4pKZnnyA5WsIrOt3fgVAo8yRODUn77Y2mHEwhKxw41uCBen94GRdWmXCJAAjvTqITaYiF8VViE4VuyeKyPy1r4b71vbGjR2aqUT1bo03KbLUYzoLBR1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fqDuWQkXfeW0V2FbgyERPEcrFRGaAAzDWsuJN/GjKs=;
 b=mA/tMG8A/juzw1P4aVpcv+yT25rwvqTXXWMozCbyQPshWRmHbcy++RbivYcXH0z/YhwQ/aDg2yu2ZpQKk68H6JfcIkhUQpJMcKHiLMQGPSPxnIyXHqmEpLtZTDmT5CIBiTxjm/Q3fX4TWhbqlffwdrISKDMbKO3RKCGOAIBmjwFAtDXERF75AIlz89zAKJnob1JruCzMX9eJDjUg5vYLsqepApMq1JoFqqo6/6wdv+YbmZaAC0PeRVKNE2W9rH9yh6DrLcp9kKAa4S0gdtPR4yQZe0K6yzaAnj9aRRFIXaLLBd6ypFQ0Ae1YnsNwtTl8dkpOcb5eBNWYOBOPw7sT9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 14:28:03 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 14:28:02 +0000
Date: Sat, 25 Jul 2026 11:27:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, joro@8bytes.org,
	jpb@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amTH7xHBY2ol4LHw@nvidia.com>
References: <cover.1784814923.git.robin.murphy@arm.com>
 <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
X-ClientProxiedBy: YQBP288CA0014.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 361d0439-9944-475e-d3ba-08deea58ef25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 7SEicgZFUbO1O3ifTYJDHG7ayJ/flnN/6AAVnd1so2dtvJf8mbCC0cCaG/6AsK01lN54n8ltNf6Mh+iYz5neBNRHhu/hW/isaarbxIDMzRld0kDUf361vs8ct0yck42FnKwV9Ay8A3/zXEE8jpLTdrZd/mgxKfltFTW+KFE0HGvWz1PfgXV9149LgYjOTAcpdZUaP+NoO5kNgAVpV5teVKaOn7pL3EKlx/cM9PI5PsC5LNFpbV/cC7WggdCLyilqpmldNXOdpIUGmDnF/wcAJSPEbrBdVBNk+X/EJDpVcL1IqCarBuk1H/sAwvOASc8zC1vfOJLiIeNbu/L9dYLXeuU6v8DN9ZsBnuTC5jQwKXxLE2XuZkyvy7422CMB2MQJ8J4tcx7t/751FE5M0QzxYVsoWUX1zfuDtJDM/sEnVD6oRw5ie90nJ2s3FjVvRYun4PcjBPfLZF0vDTA8zLoEmhAg9a53oWSfz6ZY7EAG1NnYeBsVF7F/A54UWWPczRR51CRErqvZx8xjqj/HXxcY4ovZ/niXosmlbfbjIYQx8jW1fBJp+vCxcqHvx1F6rzT2DmrEFhc4+mE57z9/+iGLYULYBRKvVfrkJxVMA6N4MEExVpmTjSbj0Nsp0ENpvrkWjnjzgjFNU4c2vX2yuHoQGEloXNNW1WzrKaGmPuyYq+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DMjESoZjU3mZM11aqPtuH+EzYBhEn4mQ+MxRF2Zej6/2ZwQTZWa3DzS068ID?=
 =?us-ascii?Q?5lPTh3kQ7MItz4UTPRyaU57goiAhTNKDKBf/atH+J92qfLAzrAXakKaykak5?=
 =?us-ascii?Q?HKWy+pgT+ekIb54pDBe/GFtmmCDlQ8ss33iapF20BkvoGTwVNkH6Yfwpezlp?=
 =?us-ascii?Q?SVVoRdpOyC4Ud25cJSk3GWW7fye14z6iOtWl+0CzatLHvIbfqJH1AUGL4Sri?=
 =?us-ascii?Q?qT0PhMUWbwGzexqWgrqazSL5wIhysS+eZO2quex3veaJEvUkTFZf9Afzt1D7?=
 =?us-ascii?Q?n/BssZhCHgGkYD++KjH15EF8rehMymMDfreeQz6NkFBatO+0UWNvQbqkU6b6?=
 =?us-ascii?Q?r/yOp/ZZYobBIzv1iYIo7jnZEZjyVB9ZxHMyI2aLHZFDIYwkVmKLZtg1Zsp1?=
 =?us-ascii?Q?A0wrJWtmbX/phXYpUyH3EMlyWtnXxRa8r+tC+EP7/V1p9IeBq8RHbOOrKsQG?=
 =?us-ascii?Q?/heKMmfiWA6baOJZwUdDYdSgj6C3FJUm9VchFiPbcku75eJ0ahnvTxsFJ1NV?=
 =?us-ascii?Q?Gu3FJVbC5vvFiLCg0uXSeppcrEwXC1dl8Gv1ZncvQu4IwK5ECjXINqBUGzDB?=
 =?us-ascii?Q?delmLb/ivn8Z55xVEjm9G9X5JXmvu6/l8hF4IF33ZNhI9b2+YY6pZ27Fqtbm?=
 =?us-ascii?Q?oQgoIeOZvdil04+a1c7jk5WIhUxPqaQtn8nlaKH7jwhAqekWg0vGF56OyMtA?=
 =?us-ascii?Q?6pfUprPmbpVN12EHkPFkUIBfZOJxR2YpdNIomTk7s6yEcYfLczJBtLn+9BA8?=
 =?us-ascii?Q?dYS8jdufIW2GNVOAeJ6Y1+/fqnwQRLJ1UyBv0s7lHWV8iZZKegpYpYedrUPD?=
 =?us-ascii?Q?k906FYfhjXOylVEJ4b2Vc/81RAomM5x+18Ik6d8wSqmQsbmKwgOZrkDgBBDU?=
 =?us-ascii?Q?nRJhPIdyysEJHW7PrDoawfrzUQFcXmvUTxe+w6ZxqqH+pFM2oxeOwQeKMh1I?=
 =?us-ascii?Q?tYw0NbsagsPZ8CkFUPA5xSDnu7aAuKXrFmQBRbNvPy/97Y1JaZEDvnjWeWCp?=
 =?us-ascii?Q?rlDwKtZ7LulyCI52XVqN/tPMDEniWHFMa0EQoMs2JNP3CJd++2pHxTAU9cWz?=
 =?us-ascii?Q?Bk8jSwPPK5ZIR5hw/iQz1/uXTZ19lYp06MggXOK6OX7q9jGg+5f4dty0CG6p?=
 =?us-ascii?Q?c7wadqOir8lVsoBsunAEiaQzuk/GBhKJfCYN4fN6lU/JpHeTsygjVXEVdbao?=
 =?us-ascii?Q?fz7VcT0myD5cY3tqalCXGML5uRrukdLKgA+8jnkHV2cM4X7kStPbTAkHg7k+?=
 =?us-ascii?Q?yfH83zKQ1wR3s/sEoTOlzpcR4xzQgeJH7hFGaZarQmqZbuv5rrSEL1e+6N5b?=
 =?us-ascii?Q?U38Yw7yOwkVeVk6lXK4Yml7vgnDpRwJGfkjBcFtHxRCCmx0HYDbx38cYaDZL?=
 =?us-ascii?Q?WEJo7bqlUsInWOrJ0W2Mg3FeUYRhBCShHfTbZnjPXcNC0wbLV1OEIoF4s/Vw?=
 =?us-ascii?Q?nWfVsmvC8NeC/vUIweNg6rxVhvn7ovKI9jZ1BigGTKS6SIsAsPFuCoNl0zg8?=
 =?us-ascii?Q?yK85zZYyS6vnC0M+2+vmSsJXZlWFEk0JDTEVRUAvpYRI1QexB74OYS4u3We6?=
 =?us-ascii?Q?ZWUHfb4t9xkmWaeI9R3Fk47XNO5bA07JB92PSW/zsyZNACe8Yvd8R5bb7T7W?=
 =?us-ascii?Q?19h8/vGpoCdZ1QYTKT37uA7ZHaiwRD/MxSQhImdDjfSCCHWyaWdXhcU20pTG?=
 =?us-ascii?Q?/OdTe/1GRAzO+KGIXg9/UgFDmGsSCmJKPw9ISHZfkpdtHm1i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361d0439-9944-475e-d3ba-08deea58ef25
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 14:28:02.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx+AMq7n7MqZ4B5fhecjqg8T1LQD0pNDOL3Jz0osaydp2h47Y+pMbddxGRj15Xt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_072809_664190_B77D7E1E 
X-CRM114-Status: GOOD (  10.32  )
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

On Thu, Jul 23, 2026 at 03:19:44PM +0100, Robin Murphy wrote:
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -102,6 +102,8 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
>  		if (master->smmu->features & ARM_SMMU_FEAT_HD)
>  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> +		if (master->smmu->features & ARM_SMMU_FEAT_HAFT && system_supports_haft())
> +			target->data[1] |= cpu_to_le64(CTXDESC_CD_1_HAFT);
>  	} else {
>  		target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_EPD0);

Based on the Sashiko remark and your note you should lift all the
HA/HD/HAFT bits outside this if (mm) block.

AFAICT it is fine for HA/HD/HAFT to be set with EPD0, the HW won't
process any PTEs so they won't have any effect.

Since this avoids the BAD_CD inconsistency you pointed at and also avoids
changing word 1 it should avoid the problematic V=0 transition.

Jason

