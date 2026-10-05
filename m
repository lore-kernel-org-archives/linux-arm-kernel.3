Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BD0CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNafjFO4Ut1TwDaTPr3P/axyEnqBWHbeDSGq9rqxadc=; b=S9tNh4vUCVWeut/Cvm0yWY6ZV5
	+gUPKhFflUugEURK32PS+qHo7p3S88VVliSYdbLpyMjv7jwcd+QOkhMsrt5ySfr3+U/za+C93Dvgk
	gPopnflBh5VsgN0XHEO8mUrOeTOCKxqQYyLdjLgqjLVKX7LuMPVDDCzW1RPbOi/Ly32ve1G7ddwvg
	c/caBGoCsLUgE9Zz5bVc+3/wKQkbhqj3eWap4SL8jS6CEL8kS26BS1yi4sn6zsW1F+JzZ8RddQKyd
	fkQWeoMuR0JylmEshD9YXofz12XS8cZkAjzsJJVEvfth6omB053tr5J+Qrz32x9WwDdD6T619ihMP
	ePdaAEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpcX-0000000H9h6-3W1l;
	Mon, 05 Oct 2026 20:49:13 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpcV-0000000H9gW-0QZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7592dF816jADNKXN/dEQobk6oLcUa/W1+PdDUsagBP+L5NZa4mYONisafqQryUhHwFWXrsltHymgTwfywl4209NgHwAmNl7CxlqNI01M48u0RwAoBiz7XXvn2o4jgQKUInWV7+Pg0hlvlv1oNXXwqz1ta4A0jxxfGCso02fJQIXW6W6l3tfKJcBX65+0jap/lCiSyhYnGeBwnanHnswuH8h2gRjLkRT335J+fWGyK3KWSbbumJhrGZYx10Kp/QGmcWFNeC/sA225ORWu2kgFwUdI1U3av5FfjkPjhiyWYUy2UvwuGX0y1AGnw94557qvzkfAWj8lQhFZxxESOwwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNafjFO4Ut1TwDaTPr3P/axyEnqBWHbeDSGq9rqxadc=;
 b=QeZL7cuQ53H9hw+D0Ze/8JsucJXhHiVD10cVBc2LvFI2EHi9iF/rkosrvn6QnIIGB63YM6Avn2LQxD1IHOfK1KBC2mpuypmg8tELHapT45cOcpi/H9pIe+HMQAoroHmmpRHyXGpxomqDXOEYcn9p9jT6HSiC+UBKYMu1A4x1kFvtHYPT/+0TikZtyOLfLZHwkTT+wLEUw29DJ3Sle2IIvdoYJhwM+QLxyoYRzTRbYy/JCRefo0/2fEEQtjSjaGjXtdSxqwEzuaYqGVj5vX9QQDOHb8OV3XZM6iyRknMK7IErjOTCKakrrjsNLSNnXd5foCocUfl5rhrVnMX6TS/klA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNafjFO4Ut1TwDaTPr3P/axyEnqBWHbeDSGq9rqxadc=;
 b=erlZjm0EQQGEmeO/XVXEENhQbg6ChnelGiscUKmxBBb+3rNdh6eP1/jUfedW9ciEHpH2RZCAFTBUBQi/eMeVTyW1XpwvC5wsqbvWtx6DYen77cdOE3ZHB+Y44UpD6uuqrY2G9sfiZdAwGiUDrTCVH4P59/TAStJRrYOMjlcEr8PNJImLEiaBNj1W62icLpT7Gj6fclXgycMJbALJUtjdc0BFx2gSWH2GfQKp88/sbLyJMwXo6539WLdAJR1MmQHT4UXlEBwAMt5IFsfLiTGeEq+63OkCWdehlbtlmFOINyXRcSZOzXaxv8LJS4IkuS2sLr8ZXyYcYZMTOrN8vfSE3Q==
Received: from CH2PR10CA0021.namprd10.prod.outlook.com (2603:10b6:610:4c::31)
 by IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 20:48:59 +0000
Received: from BN5PEPF0004698D.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::19) by CH2PR10CA0021.outlook.office365.com
 (2603:10b6:610:4c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 20:48:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN5PEPF0004698D.mail.protection.outlook.com (10.167.245.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 20:48:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 13:48:33 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 13:48:32 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 13:48:31 -0700
Date: Mon, 5 Oct 2026 13:48:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<praan@google.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 00/11] iommu/arm-smmu-v3: Adopt the crashed kernel's
 stream table for kdump
Message-ID: <asQNHT9Vk61t/vrn@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1791226953.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698D:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b753c89-ff3a-4eba-41dd-08df23221498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: +XYHK8nCWh0ul8EaEOBbwChUV8Igy1N7x+fqPu9cNGydJxhSeYIt2JKnTOrBhHUpifjEYfCeSHCOnuar072ubfcPOWeSaKDzxkGNgt/ZzRc99eCudPgMy1Je8NPupVW4HM943Y1KM5DEeolV/fB46G3eSjGwu3sBfJ9ukaIF4n9w2Qoy82Ir3LhXV5byT0e9iv5n59tbswXE7TwM3kNXzxmbaRxBINTOnN2VK/1nuUnndzKJUIuBvseRwTcngqZ4r526ZXfxZuR9WkDtRP8SypiFF0/9jdhwSwHDYvS4KADrgiR4fqyQy9dHKBj7Oq5XrAGv2FCBtMENBDVqV4pZPKeR3orLWcb+bX6FmZ1gXzb8nsDOaA6RifWr7+SkVDpXVLw0NPND7C+xZoD8Ee4vl10vBgPwrtLql+fvkr1XgAyiezKo15X5xA8LwR3LUyaS+QzXWXDoI1pYcaSWUVYCR3EoSnFPE1KlxxGTdohA7AIIf30ZSHXkjtuVkU6+RMwGGO0NsDNLKwXa+oOzK63jC8uHtYZ5tWil/C7WZzs9ARtWBv12D6EdGeqzcfJ4IAETX8VETQXxCuJu/Txp4vooUoc/RvPpTcQtEPSfOOUxSVXWoxd8jg+ZD62xPKlxerPaYpxISMGkA+vHgmX5bETOFoIYRQ3MPygXQR+uWgJ8y8S5PoHoOzLVsHwZJFXMJAnXc4Z+ZC1DyLuJujEgF2hKYg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LInX/I+2WZ9dK6+MFMN47ckOwFRwABy1U8MHPG9kcOPGldPvvxcw1dPZrk8M1tt+LdBxNgDIQMap0GSavvhwGF9delncvAp10EzAxWb+pQiJLTAQJP8KswQHBoi0BDbqwEZVqYOpysJxKYT9TKUimi7/GWmWjvA1vih1vX4NX0HF6w6387a3fCdvopAcxXt9t5wapewXyq3aRy83+OyHeW7iILVo5YgF2kmoxLOcBEezEqnVgAT4/7a5fOeBcpC0ngptm5sJ9gchxwbKhz0miQPW5o2TpfCRXghoyX4SMp7xMzWeRnM032CAkgnNyAX8Q/KmQwMXuEwKUXTasvF7r6jco1jQYsuXuDYXuMfMevtwnfLggbU05IeMF8DlQQr+jf9jZ/4ElCd0kqsEMnFvHtq6aSST4LsBZrb0fdtK4vI5AOcs5Yj1KrW9+7sKT7w3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 20:48:58.9444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b753c89-ff3a-4eba-41dd-08df23221498
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_134911_150056_398E4256 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, Oct 05, 2026 at 12:30:43PM -0700, Nicolin Chen wrote:
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/smmuv3_kdump-v11
> 
> Changelog
> v11
>  * Rebase on arm/smmu/updates branch
>  * Add Tested-by from Breno and Cristian
>  * Add Reviewed/Acked-by from Jason and Kiryl
>  * Update commit messages and Assisted-by tags
>  * New prep patch: swap EVTQ/GERROR MSI indexes
>  * Skip EVTQ's CFG0 write and vector allocation
>  * Merge arm-smmu-v3-kdump code into arm-smmu-v3-kexec
>  * Fold patches accordingly as static functions require callers

Will,

I have checked the new Sashiko finding against this v11.

To approach its claimed 35-trillion bound, every L1 descriptor,
STE and CD L1 descriptor must pass the validations, which takes
a deliberately built aliasing table but is not likely reachable
in practice: with a corrupted memory, one of the entries would
more likely either skip the iteration (V=0) or fail the test.

I tend to ignore that. But if you think it is worth addressing
and have some good idea about it, I don't mind a respin.

Thanks
Nicolin

