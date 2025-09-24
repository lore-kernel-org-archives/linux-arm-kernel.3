Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE43CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH/5qH0YEA7PHXXRGWI3JBCQEKLFlz/h7A9YTwA2b6w=; b=L6Bozo8s7q3VwMPQfRum+dS9Hc
	KjfrHP0szMMJN0lyWHM557DfByEy7D9Mfz9DppX9aNDKfnICMQ2kOOLDWmejxHWofyqsPATTdeHop
	lVx0DOYwQAv4bPeY6GUOdOOiezoUNU9vohj1J4Z8GBLsY+Cor1goKVXRU7Y3k9bytfXAmWib6OOUh
	n83Sx/TnXGXky/KL8MaPYENF5EzVGOBR3s/jfkQDjatg4YI/9di093rTgVgeOunvirT6CwPnyD+cx
	Kh2XHbRUoAS0R2sfIUHFX+XyeALTOZlwv3QaY7akhotKfYQ2uVVGfmArfRt/vePy60iCgwCacAkXM
	expreslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VpS-00000003Lhf-4A9Y;
	Wed, 24 Sep 2025 20:11:06 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VpQ-00000003Lg4-2X9P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 20:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Llvsm6BOgFwLYyG2x7+cKpd9pUkP861LM35IUA1vRRwjdp3KZMAgs0YLb3jT12/Hf9JjEYMIP6QLYZl1kKx7QFr2st9WL7e0wEm3dBzmpmLPfsOge4bopmR3dFwu6FkQ9HDOiuKeB5msg91qUzgPhX23mUUgxFS2eYdpWX83N7kLEuTsfPPoxXujZccYO9UPuGjTYFPMn8XEm1FG9EcKUwesPJPeD+s24pTmYwjY5wFDLvf4S7ICyvzOGJnDnRDln5AX1ThzQjgZSyc7e7xQ3Gu+LwwDjHNLiO7oB/E5LLmfRoppmJva6qx1obztrdiL/IVMcA87vvwCr5xHVFPezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH/5qH0YEA7PHXXRGWI3JBCQEKLFlz/h7A9YTwA2b6w=;
 b=Gveb3sCbiELbGpfHaE6Cey6juK11pK94PZ1KYCW9z9uD9kzaK9LW2hwyB/hlXwz1ZKULv65moGI/h4B6OMNRFyRdo0mvp97F/Sjw3E11Q6Mm0allVI5fjEMqNBnC/dBQqXLJRkb2coAvMhKbSlH3RLwQMUbjiOi7WHvkxbuZ3F9jyO4ZeAxpXwNNLguBLgwcTArKO0lBL8dT40Tin0a3kin06rMjnJzJAzckk8kfe6vEwE2mzwpeSQm05cbjMGLKmVTh5onvR3IeCsKnKBmCFr5Mh9YEtp3HUGaPRFlRD8yE4s2oSaZtwitHArKkq2gFH2ToUPg5nST3inraS/aCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH/5qH0YEA7PHXXRGWI3JBCQEKLFlz/h7A9YTwA2b6w=;
 b=t6sS5k2EBRJpVVxvTMniaazWMBHxZ475Q7RC5G7iI1aa/yi6zVETgN8gn/kHNWaLAuMfFpzEi1IfRQByUciFtoNH8WleKg8VvAn1QRKJ63xP7W1+fH0Ipe8HPqGSuG13V/mrd/jcFrTjypXjA2nOyldzULdHyquQYOn13hCdvq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 BY1PR01MB8802.prod.exchangelabs.com (2603:10b6:a03:5b8::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 20:10:57 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 20:10:57 +0000
Date: Wed, 24 Sep 2025 13:10:55 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-tegra@vger.kernel.org, suzuki.poulose@arm.com, mark.rutland@arm.com, 
    treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
    rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
In-Reply-To: <20250923001840.1586078-6-bwicaksono@nvidia.com>
Message-ID: <ee1b3064-df46-a030-6ebf-6acaac8cf81b@os.amperecomputing.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com> <20250923001840.1586078-6-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|BY1PR01MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8080d6d4-5821-4cd7-ce84-08ddfba678fa
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zH54gFj+WRKG32B4n4nsuEOd79dIAXWDbSLjxvSARxis+exLvxgsNavYGzpL?=
 =?us-ascii?Q?iGGUPVrqDkA120iIq+zArCTNQ3Lcvq9mc25WLFUbbueiaZYBksm5hT9FaI+2?=
 =?us-ascii?Q?DiyjipWVX6cd8dnxqdoJWtkAUlmbNZKerOvCdomf8QMEo1tkg2pw7ONEKn6U?=
 =?us-ascii?Q?YLfDhJO6eaoLTCGvsEW8FyG4uZdKy8rdmPclnKOtLfSeDiE7/gUrVr/anwoV?=
 =?us-ascii?Q?z0pOyHtQQ9TJD7AsNZDkwrLgyiA+DeZGRjbIOKcS4vK8aQMF44NLPZTkNcQn?=
 =?us-ascii?Q?hy1NB11X+7AxQDjGA8L0Lu4wHA+khTC4Y3sO1n8JUMlpqa3uuuE0EM+yhjmv?=
 =?us-ascii?Q?BsdJYqEHmG0uMxg6rKISnU+TnCsoZ0KNNbliaH/wLK4199EOL6SJHga0lWKx?=
 =?us-ascii?Q?l2r9o2BgnJShaZKTZx2BcHCzJLh3nPqQzSgmMw2BP3EvJaLyNDzBLx2BlpUe?=
 =?us-ascii?Q?hK+GqRBvDHwoo4g/lPQO5jvDCCDdBZJ0mdt04tmlpAZBPeXx1g1WLpaoWqNC?=
 =?us-ascii?Q?jAHp4IhT5wAsJFsg+BlpEBSfMaL7h6wtbcZOgxbrVuCh5EisOJlK7Pu/2n/L?=
 =?us-ascii?Q?e8iOhpP1yEJYN06HTJYmKuucdJMvrTGPtngQq8f5AHx3TP50dD0NXd0mLB04?=
 =?us-ascii?Q?CGTzbotkGlmaAINgalD8kPaJithYRd/I5cNqXrVaDw2WrxCIECBteL0dEHLs?=
 =?us-ascii?Q?GmvawXXXVCVI6ys6AUeSroSIM8/zfmCFO0qiIo8bvCFacr6QMn8rbp+OUmVv?=
 =?us-ascii?Q?gMTvjR9Vs2eEd+zSeY/OV60tVzIA/pWcDlXsDRMCu8zPYMf0HzCBNgKqb8qq?=
 =?us-ascii?Q?fup8PLzxNZySMyTUQJ0LjOP7+DumGiyhC334UzO4vM22mA/10K+RgymbZ19E?=
 =?us-ascii?Q?qsIVtuo+1VvfZiZtCmODgY0gpRQyLD58YdCUM5Eer9YNe/OQzqj1lxo8CNJR?=
 =?us-ascii?Q?WAC8dyPC3HAUGdISc+IWhUWIVKwlfE335pxgAW+XBp5G4V+If8cHElLQ9OXP?=
 =?us-ascii?Q?zi1k2nm3kdhqiT+bCDSOHJHG2KqaDcpYSWjg0F/Bdfu5VOpH96G3Y1X2wrkH?=
 =?us-ascii?Q?F6eAJd0UZ6/NxSeK/a80ddepLKb0J7NYSYZBujch5e8iV/jX6F0Yu+xIvSKN?=
 =?us-ascii?Q?NXKixvR2A7Ctee70PljfUEY488IStVPZXsWXmAh122mWu8O8mqMtrlYwvf2Q?=
 =?us-ascii?Q?EFs3RNGNEWMerN0B4uW9vqYDHdNyuauke4OSISnSQysW1tPiADUAAwdki4vT?=
 =?us-ascii?Q?MvTG+JFio/awRQFUZ89g63zA4En2deNgzX3yoZ9rSKaZPTn742sAiKKT6Kvy?=
 =?us-ascii?Q?kgfBZga7OjcAzku5ji23i8hp/oyWyYsR/8Zz2qgrRnKvLGGy4VI21o+JHORc?=
 =?us-ascii?Q?INgsBsYSORUJ7tJ20ST3UCQC6jPEdxUvc8fh566IgAcTqlcFtoUesdR09zNy?=
 =?us-ascii?Q?Sx87QsFH+xxLqB/H2toKXDZVJPaRYogf5q+BRzjTpjoAgw0FkDllqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rw6sOeejxWubQlYyZceNDsK+FNCbUkhFgaWk5TvIYmGrC54d14md6F8pg98J?=
 =?us-ascii?Q?/LWzidGSb1SPZWjY4r8PURiG8+4EN7+Kzudm7NkLvWj+wYFwS9bGL2ZW9e8K?=
 =?us-ascii?Q?ANG26XjdmlCDwfWebJlUteDvhrBCXJ4XK9o7tESwJXPc7L3GjdD+GQYsGefn?=
 =?us-ascii?Q?LWiApS66LWSQO78C38co2MkGbYn1GU0se2k8O9dEJzEOUDN/rmE+ZzwMfklW?=
 =?us-ascii?Q?hZCXHYwZ+oBxBJwpwBTVsgMfCoBMkdh9XbPOQNkmFDRdLLpMP9sRCttUsBLP?=
 =?us-ascii?Q?1x8/tH8rYs/FQxiYzIHg/MHy8jn+sSxTxhR/6j8Iv9UXLqdXXmPpzaMn6Yn5?=
 =?us-ascii?Q?kQR+20HfLdcqmUv8xCoMK//G6FFOSfKDzyCowWcCrTL/wZAIfoqSFa9kUmyW?=
 =?us-ascii?Q?4IRPwOFmLezWe75G8lwv83Eg+pxgwQv9vkEB0u2aOtx5yeSFaDH9vVyWxjyp?=
 =?us-ascii?Q?C3xUSanErtRFH3+6jqrpT5Fd7ZlWYur8NNuK0I1kLex1SYbSOZ58sYshnazt?=
 =?us-ascii?Q?/rkFtIPqczIQuobgbM7hB2eLv0BpK1hTLCTMGFi0cdKFsUNjWL8ws/zZpWBW?=
 =?us-ascii?Q?w9pPSwyo11vtqg7PK0qwmR3KQ2DlOqThmMsi1UHRiwo4qjEc/OP0lpj+1XRs?=
 =?us-ascii?Q?f6Cc6xwF8VwJuLGYywu7ejVvnOWlm/goCiPBA4yFQ0jUAwt5EFIJwYdXslbj?=
 =?us-ascii?Q?WXbZ3xhp6OJlLVxFb2hLkUaFX5l8tkcBPvG5VDPZrixWmUlrxgT+LYqg/CaB?=
 =?us-ascii?Q?00+sf/WedrnBM0T2cXs+hgxZJVdiwRnm+yEw1hQeWmJ+QtPH9M90phHMf1GE?=
 =?us-ascii?Q?ZQV3/CxGh8EhIj9ikPvDmo3CeQKyHBBFnFki7mCiKyWjNl3AsX3IDjPC3w5I?=
 =?us-ascii?Q?1SC+wHG76IfsCE0aHX1nop7GSmpy6wA33SDvLvs0gYLhNQehQUciwS6ru4Ik?=
 =?us-ascii?Q?5LAJhlr5Htx4iMU/qcSkourARH4GuySupqr5FuaG603s22X8MfAhFzf4Mmuy?=
 =?us-ascii?Q?bBS5xBUHIyNBHsy79x3U9mm08QvvgFTQGLU/mPSCRxIzxDzhgEnG9J/cpPov?=
 =?us-ascii?Q?SbukHbAz7fwoFr6GzcMB7TOwM9QtHxV/M5sB0VUuyXMwo0Zzlyxz11LCzyK7?=
 =?us-ascii?Q?eGdxnPzxvUi+OJMeBh7cU7Ahi5+6vWdw8w6Bdsb1X28Slc4b9nm7MwrY6JHp?=
 =?us-ascii?Q?vZ1U1GZ1baZbCtD+SKDNCRd9qp5+qlJ8AfXv7DxXLZhp5qy4qgFHpidLINru?=
 =?us-ascii?Q?FLnvu2QB8kps7fhuQYEaJRt3W1YbT4BQETR693v0mHbE1R5TSHn9elvtpuV2?=
 =?us-ascii?Q?QwsCqftHTxHs3nboAO/FeiK5a5IEaSMr7XWCd5pJsjgguhbKxcPVmdaFxwRx?=
 =?us-ascii?Q?XOPQQL3SJzScqYSxf5EBNQMipyn7H30Txz79rQAdb8CAqUipXB+GGX80uy9n?=
 =?us-ascii?Q?9VZyfu9Skqwu4wNfi9ABh0xIpyxuD/Jvf3NUCg3HRAb4u/J2qi7kVK/a3NsM?=
 =?us-ascii?Q?qzgnSfj1SeK0DUMJE7P6fFw1qkrblEq9eTP3beTLSdft64HO6wmFt/L+CXa2?=
 =?us-ascii?Q?7q6kIbMnzfDfc0dFYpfBOjL0zqIRsRDvibXfpKf5bNcbxccck35BtRkK/zll?=
 =?us-ascii?Q?oUDopPLBVCmk53We3nuVUW0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8080d6d4-5821-4cd7-ce84-08ddfba678fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:10:57.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqd4iwoKbC5KA1HO3L9wxESHCarm0eziM9zNJWizwX9sYRmQQUkhFAFqqvNTP6wehMJliPPKXvT3n/L4jqIsQRNFSQd87auABT9kWxEOqT7l5Mj5GZIKYx/h3s+hTJBo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_131104_697668_6AC8F62E 
X-CRM114-Status: GOOD (  18.95  )
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



On Tue, 23 Sep 2025, Besar Wicaksono wrote:
> Support NVIDIA PMU that utilizes the optional event filter2 register.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>


> ---
> drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++-------
> 1 file changed, 133 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index ac91dc46501d..e06a06d3407b 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -40,10 +40,21 @@
>
> struct nv_cspmu_ctx {
> 	const char *name;
> -	u32 filter_mask;
> -	u32 filter_default_val;
> +
> 	struct attribute **event_attr;
> 	struct attribute **format_attr;
> +
> +	u32 filter_mask;
> +	u32 filter_default_val;
> +	u32 filter2_mask;
> +	u32 filter2_default_val;
> +
> +	u32 (*get_filter)(const struct perf_event *event);
> +	u32 (*get_filter2)(const struct perf_event *event);
> +
> +	void *data;
> +
> +	int (*init_data)(struct arm_cspmu *cspmu);
> };
>
> static struct attribute *scf_pmu_event_attrs[] = {
> @@ -144,6 +155,7 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
> static struct attribute *generic_pmu_format_attrs[] = {
> 	ARM_CSPMU_FORMAT_EVENT_ATTR,
> 	ARM_CSPMU_FORMAT_FILTER_ATTR,
> +	ARM_CSPMU_FORMAT_FILTER2_ATTR,
> 	NULL,
> };
>
> @@ -184,13 +196,36 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
> 	return filter_val;
> }
>
> +static u32 nv_cspmu_event_filter2(const struct perf_event *event)
> +{
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +
> +	const u32 filter_val = event->attr.config2 & ctx->filter2_mask;
> +
> +	if (filter_val == 0)
> +		return ctx->filter2_default_val;
> +
> +	return filter_val;
> +}
> +
> static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
> 				   const struct perf_event *event)
> {
> -	u32 filter = nv_cspmu_event_filter(event);
> -	u32 offset = PMEVFILTR + (4 * event->hw.idx);
> +	u32 filter, offset;
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +	offset = 4 * event->hw.idx;
>
> -	writel(filter, cspmu->base0 + offset);
> +	if (ctx->get_filter) {
> +		filter = ctx->get_filter(event);
> +		writel(filter, cspmu->base0 + PMEVFILTR + offset);
> +	}
> +
> +	if (ctx->get_filter2) {
> +		filter = ctx->get_filter2(event);
> +		writel(filter, cspmu->base0 + PMEVFILT2R + offset);
> +	}
> }
>
> static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> @@ -210,74 +245,120 @@ enum nv_cspmu_name_fmt {
> struct nv_cspmu_match {
> 	u32 prodid;
> 	u32 prodid_mask;
> -	u64 filter_mask;
> -	u32 filter_default_val;
> 	const char *name_pattern;
> 	enum nv_cspmu_name_fmt name_fmt;
> -	struct attribute **event_attr;
> -	struct attribute **format_attr;
> +	struct nv_cspmu_ctx template_ctx;
> +	struct arm_cspmu_impl_ops ops;
> };
>
> static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	{
> 	  .prodid = 0x10300000,
> 	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
> -	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
> 	  .name_pattern = "nvidia_pcie_pmu_%u",
> 	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = pcie_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = pcie_pmu_format_attrs,
> +		.filter_mask = NV_PCIE_FILTER_ID_MASK,
> +		.filter_default_val = NV_PCIE_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> 	{
> 	  .prodid = 0x10400000,
> 	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> 	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
> 	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> 	{
> 	  .prodid = 0x10500000,
> 	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> 	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
> 	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> 	{
> 	  .prodid = 0x10600000,
> 	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
> -	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
> 	  .name_pattern = "nvidia_cnvlink_pmu_%u",
> 	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = cnvlink_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = cnvlink_pmu_format_attrs,
> +		.filter_mask = NV_CNVL_FILTER_ID_MASK,
> +		.filter_default_val = NV_CNVL_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> 	{
> 	  .prodid = 0x2CF00000,
> 	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = 0x0,
> -	  .filter_default_val = 0x0,
> 	  .name_pattern = "nvidia_scf_pmu_%u",
> 	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = scf_pmu_event_attrs,
> -	  .format_attr = scf_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = scf_pmu_event_attrs,
> +		.format_attr = scf_pmu_format_attrs,
> +		.filter_mask = 0x0,
> +		.filter_default_val = 0x0,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> 	{
> 	  .prodid = 0,
> 	  .prodid_mask = 0,
> -	  .filter_mask = NV_GENERIC_FILTER_ID_MASK,
> -	  .filter_default_val = NV_GENERIC_FILTER_ID_MASK,
> 	  .name_pattern = "nvidia_uncore_pmu_%u",
> 	  .name_fmt = NAME_FMT_GENERIC,
> -	  .event_attr = generic_pmu_event_attrs,
> -	  .format_attr = generic_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = generic_pmu_event_attrs,
> +		.format_attr = generic_pmu_format_attrs,
> +		.filter_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = nv_cspmu_event_filter2,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
> 	},
> };
>
> @@ -310,6 +391,14 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
> 	return name;
> }
>
> +#define SET_OP(name, impl, match, default_op) \
> +	do { \
> +		if (match->ops.name) \
> +			impl->name = match->ops.name; \
> +		else if (default_op != NULL) \
> +			impl->name = default_op; \
> +	} while (false)
> +
> static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
> {
> 	struct nv_cspmu_ctx *ctx;
> @@ -330,20 +419,21 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
> 			break;
> 	}
>
> -	ctx->name		= nv_cspmu_format_name(cspmu, match);
> -	ctx->filter_mask	= match->filter_mask;
> -	ctx->filter_default_val = match->filter_default_val;
> -	ctx->event_attr		= match->event_attr;
> -	ctx->format_attr	= match->format_attr;
> +	/* Initialize the context with the matched template. */
> +	memcpy(ctx, &match->template_ctx, sizeof(struct nv_cspmu_ctx));
> +	ctx->name = nv_cspmu_format_name(cspmu, match);
>
> 	cspmu->impl.ctx = ctx;
>
> 	/* NVIDIA specific callbacks. */
> -	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
> -	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
> -	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
> -	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
> -	impl_ops->get_name			= nv_cspmu_get_name;
> +	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
> +	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
> +	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
> +	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
> +	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
> +
> +	if (ctx->init_data)
> +		return ctx->init_data(cspmu);
>
> 	return 0;
> }
> -- 
> 2.50.1
>
>

