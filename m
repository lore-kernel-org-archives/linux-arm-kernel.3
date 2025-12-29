Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2570CD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 01:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnad0PTSI3BBlV//NLw7zMvqm2xnorzLOZdNJnRBeIo=; b=d6MKz13jkb8QV9aiDtDkIzRqm9
	cHvDnR+48cdgOWTW8R4KFlhV17gG8aPefkB+b7axtC9WJx8KoSN94xv+QGkFaVH0sVpHa0fryThVG
	c9F8M8QgbVr4iDDYZq8MzgO1Uariq7vCpfiFhhb4D8CAxC2eGchwPtnK8rLsUWOzwtE2tUlQ+V8hS
	z+B294M0wrHiqVtqo9I8HiO6f5P8RWYwaLvGQwS/H4sKjyqAJ8A3OjKkiCHyOyG6omiVhhVuZ6gay
	CEEw1Lg6W3JCIJu/ReSv2VxIWFpP0e5yxaw/ciBdFdOlbqY8dti46d6OdqbbqhOx6xPkjwD/QPScS
	YGOqaN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2Ut-00000003D6s-0qut;
	Mon, 29 Dec 2025 01:56:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2Ur-00000003D6l-0Nk3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Dec 2025 01:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nnad0PTSI3BBlV//NLw7zMvqm2xnorzLOZdNJnRBeIo=; b=I1Y0546p74ZhjhQJ/zOkI72FyF
	gmNu88YgEkbWdGI3fqayZBaA5nWYyH7gt42poZN7PEyIkOOA0NtqHMB74Z/P+5P9pcyobjwoZvKep
	HtC+nLQ3uKHDARkM7q3Qt9+LdZOXgOHB6luKHhbC1oVLTl908iGfhtfsfjQZIVCt0PKSDJD2VRY5a
	XevxWDFGLqbs5iUXSZVnXSQVBsmlkGAWPopIP2AVvazs697ktTbOusKrucNiXzF9Msoo8MIp3etVu
	+en5qJX21OKKcIUNGZwK5RoknqyiHgubE7UYRWqOS11vYD2qlxSdBDD1P7jTusXVGsGS9mDlP3yGY
	pOzsxfBA==;
Received: from mail-japanwestazon11022073.outbound.protection.outlook.com ([40.107.75.73] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2Um-00000002On2-0O9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 01:56:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBbt411FHWVk7qj7jlRkVmLPSww7mQOA4kABgrfcLiX8eLDUEBj7luwitydvRAkHTB4AGxC3uPp4YKconNQFxZsrvhezxntDXeScpBwDereRMyYDmB0BaQq9tZcE68A/y7vYZJG/4qoBcLPUJbm5AGDq3wKhlY547NB5awSwqV3JHqKJ0LdMthTNxUhjsgmUwKwiAj+wkfcb0x/D6DaBTCP16MRBxmPoNoJSqJou+WDywqJC+hal1JGeQTZUpWjvWUvu+DQ1Ngb/B/3kslnvWx+iNTFzIbbxIw8lFlz6TIPKcp/DZUrAR3LTABDZcnT6Oki4TvRmafrXjkhZVuxWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnad0PTSI3BBlV//NLw7zMvqm2xnorzLOZdNJnRBeIo=;
 b=ddrSHiyAf/h3WgxTKMDPXQiSqxZ6LB68hgO+lv4UpxhAt3DA57MXOFQ1wcE/eibrslN/IizrFzRSEQFf7kgq7DHRDB4V89bD/f22a4nOfVcszoz+hFLSf09dhM5OgSssXMZpGw509+3JQOhHP6pG1VrcU+D5F9zw+cp/m2TVrgjNnvaBoajXQsFbp5yNe/RFTYP4xLbyH8DMPrH6H6z8ZT98AX7Hh3zbPpXnSGJUfrbRHA9tGRCd2pyRko8/76/RmbP8bKZsyDJXsuEJI2lbY6ppETlQjB0VxtfuiAi75pzSCVm8hTt1lpBg6ePg2m8WQwpW2RvPYhOnk7dM9DwIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) by TY0PR06MB6855.apcprd06.prod.outlook.com
 (2603:1096:405:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 29 Dec
 2025 01:56:14 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::9f) by SI2PR01CA0038.outlook.office365.com
 (2603:1096:4:193::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 01:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 01:56:13 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E8CB640A5A1E;
	Mon, 29 Dec 2025 09:56:12 +0800 (CST)
Date: Mon, 29 Dec 2025 09:56:11 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: <fugang.duan@cixtech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Message-ID: <aVHfu5mcX3ZVqQih@nchen-desktop>
References: <20251219133553.1440970-1-gary.yang@cixtech.com>
 <20251219133553.1440970-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219133553.1440970-2-gary.yang@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TY0PR06MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b28e65-15bd-4a7a-46da-08de467d725f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ApHvO7DtgRwCf3b6ZzRx+c2td2kZX6QFDLsSZDKUZa8LhHEBnqYeYi2pr+7V?=
 =?us-ascii?Q?SUTPhtq0SAC1y7Dc1DJbMol2EcB0E3YvW3BjX1lnNiN/oCelGGv8PqR1jmvf?=
 =?us-ascii?Q?GzHz3f2ZsYAd1W1YK0T6BhecVbf7E1DCJe6U6+eTUaHh8/24XGwnXxY9Rj2W?=
 =?us-ascii?Q?z0ILcpeupOJc8FD38Uwa5Tg5ncCNeR/0rCYrJgba6LkztQJSikvbIbvUHUSq?=
 =?us-ascii?Q?EqMEQrp17EBRQrgPBHTuWrl7umwJxtyZIz0XZHILXHJxksiATZDres+8NGcm?=
 =?us-ascii?Q?XIJMlU3bJd/IuUC+mprAIeq8CQgswWvenXXmCORZQZz3mVuolEnyJmkziLDS?=
 =?us-ascii?Q?wKMu2CJdSeXgk7LEGE3NVAsqi+32HHceR5eX6/5wcV7P6AQoLLuWAFZ2ziwD?=
 =?us-ascii?Q?828CPoj5MfS9fKi6D9sYjDvDQBXUX2YmrYxGXlaCTrZz8oxPmtWb06QNzn/l?=
 =?us-ascii?Q?mXk8B+ZiPQ0B4ChPpTK0DsZzEJ0oarrTnz2SZiTfc/c9/hIKVuMTGna9cPdO?=
 =?us-ascii?Q?FfsZMBJSOM/dciUvaK6N2whzwTrxOnlQdA5RblyZsmO4j7DptTAKPwVMWb5H?=
 =?us-ascii?Q?Nci/wu2rUKRU9flkR3JTEo5E30ybjE0CCGka5CBiTRGa1t2IcTm4QqiXh/LK?=
 =?us-ascii?Q?+rG5ED4g/FPXqsaTChV5BOQqxFbQlsWHADuhKobQbaFGTy6wLAKOkEI3HPKK?=
 =?us-ascii?Q?ObYxvBZEFLKl/3poh0K0ZgMK2d3IJJZIR2T2b9IfOrqV8YKEiwHTTS+hWKk+?=
 =?us-ascii?Q?bHvey7Sgisv4AOWlgoZou2cNzpRxxLdsV+UZKwHddVsR6yoYEhqB0aH6hcV1?=
 =?us-ascii?Q?zobtuoPsM+YemeEDEzPpJ6U+rBxQm7fD9CJyFby0VM6XWgVIiOG2y14IP5ot?=
 =?us-ascii?Q?jLXYYv9iV2V3Yn3ekz662+3Scw8KI5/QgV4RmKtNdYwyYd2YkfBYzFgU/HRp?=
 =?us-ascii?Q?dkXOtdR9/jcoGqwEsP1/kaVUUn29rm8MxZhAegA2kfcZqUREs45xAon6Bgsv?=
 =?us-ascii?Q?1YYVOgAVmRHW4zMeYAZ8iTiEsyA4x+kmt9MYshic1hAPH2cu4GYrirYLNsW6?=
 =?us-ascii?Q?k6Ne6gcKxsCNB6OEBoY3ARFX0BbijPrcHZLYj4h8jIPIVlryJU1Z6M1LI7dF?=
 =?us-ascii?Q?v86KSgxFArxM4Belj7ugy9Tgvjd/fOJirDcnpBzBvkQzXjmQ3bH3vFOSU+Of?=
 =?us-ascii?Q?6Otg1ePyIKPhzoI1QmcbPzw/7J8lYVf/J4HhMFzCT59bQbH0noiZJcuNMa2s?=
 =?us-ascii?Q?VnJEPMvjJCuEMqRJDvsSg6SkYbixGYWHHoIDoUsDW/XXqRbmv+RNHgJ8ncjF?=
 =?us-ascii?Q?ggoIANVsFvj9zIj4YHsOe5QOHdU6ilV00dU1AHpoMVDswIv9P9aBIpFuwOSV?=
 =?us-ascii?Q?gTVsxtJkpWUY/chD/tTOrDeLqh+4lFYfZVSvy6tTGxjCKG0Cv+ih/G4o4yDE?=
 =?us-ascii?Q?tBwa03+jTb8R339ekkRIYRYTqwbkXv0GSf1AaKQu9Jukl743Xp18DrLPPIUJ?=
 =?us-ascii?Q?uq55lOvlZImq3jWBundKTAaCrL/gPcuG7WSCo8mBcUXFrttwr2wz96JJctDz?=
 =?us-ascii?Q?nmIl1Q1Wp/7jGJ2KY7M=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 01:56:13.4416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b28e65-15bd-4a7a-46da-08de467d725f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_015628_187907_B4C97F68 
X-CRM114-Status: GOOD (  13.63  )
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

On 25-12-19 21:35:52, Gary Yang wrote:
> OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC,
> built-in 12-core 64-bit processor + NPU processor,
> integrated graphics processor, equipped with 16GB/32GB/64GB
> LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe SSD,
> as well as SPI FLASH and TF slots to meet the needs of fast
> read/write and high-capacity storage;
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  Documentation/devicetree/bindings/arm/cix.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
> index 114dab4bc4d2..e2cc0bb8b908 100644
> --- a/Documentation/devicetree/bindings/arm/cix.yaml
> +++ b/Documentation/devicetree/bindings/arm/cix.yaml
> @@ -18,7 +18,9 @@ properties:
>  
>        - description: Radxa Orion O6
>          items:
> -          - const: radxa,orion-o6
> +          - enum:
> +              - radxa,orion-o6
> +              - xunlong,orangepi-6-plus

The description is for Radxa O6, would you please add one description for
this orangepi-6-plus board?

-- 

Best regards,
Peter

