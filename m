Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BBEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRvGfKSFc26gn3U79Tf8lTQbpz+AP289WEzdhpyq/dc=; b=UVyplHnJfPSHCWL7jvrA6vrCGq
	vy5xw2clmps8z+VXeDwuxyZ8gS1pAvd0HSZGacX9NE8rrKWd/kiutXE/gNoNULr87+hsuIfBpeVfK
	fcpxXyyzHQxmLBAcdjR9HubvmfWz5RkDNsx7f4KmCaokQuJOxyKPU6UIcVZJkltOGDjAq2DPsr5+C
	+8JLsXudxshaoYE0u3I+amc2ToCQfMT2flP9HE3eq8M6zp3R6DEUli6e3fyYTJ9KBxiuDPyl/2uY8
	yOy3v5yICs6GOD0u56pPu5gEY+SOjaKk+L7usdEPlCLKfGPLM1xQ88HR2zx2zZX8TJQjPkKmRZ7vV
	eTSY/tVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGjc-0000000BzJJ-3NOv;
	Thu, 06 Mar 2025 19:18:20 +0000
Received: from mail-westcentralusazolkn190130000.outbound.protection.outlook.com ([2a01:111:f403:d121::] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGi1-0000000BzDZ-23Kl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biljEOPOxS114FeYCZIIdKjSkwcynsW8hTzoyWj2vjtiX57/FoNC9wqcvgugYvLbQKbnWG9mFdL482gg1bHE45k3l0wlzl+RALVg7Gm0jhfhVFBZa507ls827Tve539ECw3dShWkeInltvGHqme8Wb5DRzL2827dzdaJGgIh+CtAPeB9cWS4XAzUpdy1DFTO4O0iX2g7eKSQTen8aKU9Ty6+CbRE/laRvrzG5R+CGe1F5VU1ect0uKgjOATV3kaVN90+3iDeGZFRKx2jnLcXDWTkgQNa8duSDLDs1AVdzukmWgHEYNNF7bTsxyMWw1Qem8txn4pvqRaekao1bBJD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRvGfKSFc26gn3U79Tf8lTQbpz+AP289WEzdhpyq/dc=;
 b=hL8SHxIQNqe5mAmS+6leuBV+KAhZIlzYWhrks29X+3bvHPtXlS1PXGrdnKfquQ9KkTxqe8HiwnJCKNuCdIzgl3DRJ+yCt7/3k3LoK5ejPgArHjur/2cmnvTtjpKUrfbt8nwmizRndOoHIp52gXS8eT3PxDe6fRoAB2NfKA3sLfs6O6PM1cvraWGgZnASTHko4nhQRV9dKue61hNPGiV3b1LVKu9CTE5E53CysKZGmNlRyYx47ckBEPuV/6a1dru1z5tGvg1Vk9eCtIGKgq5Q6QhPuxJD04u3Eg6hLp4QIlarrMtNhtgazjSxHljl40JfEsELHqBWYzaHMdkixaIEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRvGfKSFc26gn3U79Tf8lTQbpz+AP289WEzdhpyq/dc=;
 b=nTtmQhFYZ3DDE07O2sWT+fBLQ2fhWGm6TY0tVVb+vkZWrgnGWR/lzu4rBo5FvYezpDSsTB0br/KTT1wJRCP3mq+eN4wFutQKB//KeI1Yuh1DgOic/4OcwHUbpRdi/6dvmnZq8BEBATpci6l2kmtbOGnsCLKM4GKwatSfY1N95BZq1Zz7ra77fktm2D9cTeaMW9Egec6PnJynwtj393MxYlvfsmtOL0H9Ds7pyPWhWDhoFcyYUtln/+R7d6R6ZAdGKzCxh50QfjeYl7HFFCBhZehHa/ZgaVS1lXqSvT1V4i1K8Vz8eu0aBhb61NY4DQbBtxpdQhQ7seJmlFFT/syC8g==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY5PR02MB6770.namprd02.prod.outlook.com (2603:10b6:a03:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 19:16:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 19:16:34 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"joro@8bytes.org" <joro@8bytes.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
	"muminulrussell@gmail.com" <muminulrussell@gmail.com>,
	"skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
	"mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"apais@linux.microsoft.com" <apais@linux.microsoft.com>,
	"Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
	"stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "prapal@linux.microsoft.com"
	<prapal@linux.microsoft.com>, "muislam@microsoft.com"
	<muislam@microsoft.com>, "anrayabh@linux.microsoft.com"
	<anrayabh@linux.microsoft.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v5 05/10] acpi: numa: Export node_to_pxm()
Thread-Topic: [PATCH v5 05/10] acpi: numa: Export node_to_pxm()
Thread-Index: AQHbiKNsqz+LQIdXI0i/neAZcxnbO7Nmhwaw
Date: Thu, 6 Mar 2025 19:16:33 +0000
Message-ID: <SN6PR02MB41571D453D4835871A98023DD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY5PR02MB6770:EE_
x-ms-office365-filtering-correlation-id: 58dc61dd-8112-4467-b93d-08dd5ce368a5
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|8060799006|8062599003|19110799003|15080799006|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?/vG2bqadssqlBdi54osZjYOCAcufe1mxX200sI6Xe+C9bAO5cWr0N2z0Jiab?=
 =?us-ascii?Q?OtmHvbg4VtBWRVHY4NVeFS0napoxhRArowyS0MPyZJpio5Rr49TQGZO+/tlG?=
 =?us-ascii?Q?CUgRjA6h01H2Jbq3NKXViQGUcrD/4ge4kDQM6SeqenDlBaEab7wdU/8ntZ2C?=
 =?us-ascii?Q?bi7c46KTSw3rcbKbHULFZHDwgeFnZFDaWHHktWAgLsczSleFSXSvMk7p5M0v?=
 =?us-ascii?Q?PDYgw8eEd8GNKGCiYTQqXtHBHuq/TlC7hJA8yO0JYl2BWiSTJpIMSD9C7Jfw?=
 =?us-ascii?Q?MVFv4Ut499TXhv4CACRGll3SMGAa8tdq8K8NSYNYL9dIfgQXPe6qTetZXP5P?=
 =?us-ascii?Q?QtcF+hPTAxZj5LdWglppxRWPg7sJDzfcOLSyThRYGO0pN/LjaLxh8KYbbOna?=
 =?us-ascii?Q?U5XRrGg+6eK6xnF4aURGXX9aLU9HKcTZcVOqsC3OElRzLLApvrcWMpgg4bbL?=
 =?us-ascii?Q?YE4iolDWVSNa8cD2sbJ1f7Nh3KHa53EEN/6MJl/kBUqRo6fvDJznLkzRhRaw?=
 =?us-ascii?Q?K8BftKNxg0xrQyIjHZHYbZnLlsWYwZUKHCEq1a9zuEZhqyfxdbieJ2YNJ6nn?=
 =?us-ascii?Q?VH4d1C7g5tj5IAjhsSlN6AXIweLP64CAaEo07Dpj5laIhQDWCFWiwBeqaThg?=
 =?us-ascii?Q?2uPuDCAvlKE4mFWmGmqB2CYm7uKfg0tW0skLmEGUfuFAJk65g+f2HKrcjiI6?=
 =?us-ascii?Q?ti8HvwL+pe/+2Xlo++P6eDhIdl7LThLz3tDhOeWWIwLQBrQh9tEUrV6mlZ7f?=
 =?us-ascii?Q?2ijRsKrXfTpfBelGn+/8zjjAtQ8V6mbi4TFB1tD3Cai356s+Fow4gZlswGZH?=
 =?us-ascii?Q?FDkYNEycf8SMnVaFuof7+pF48Wmy47331e3Xz9/tmqe4IGwVRrCWzyPrIe6l?=
 =?us-ascii?Q?ibuyNpq+GTpW6e/28qtgm9xKZLYkbt1FxZZWdF6vjsxM+GBhuZV5GD7S/+gf?=
 =?us-ascii?Q?1UIqf7Nuwqoo+122WVbJZI/Uk/68Vc9x14Hv7hmhMP1lVPN4gGPnhVItvG2E?=
 =?us-ascii?Q?BZELspnVMSAtRVTu4X/ahdOHaATrFyy4G54v5JcGhW/t2MZjpHmuoq4FggHI?=
 =?us-ascii?Q?PY+wgjJGBjKHevnph0oXBlxbPPLnYg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dpnam9vReIshHXSYW8IRmQHNhuZfgq/S2ChR0obXFgfn4YmDnBXxDuOe76dT?=
 =?us-ascii?Q?QNNezG0YMHm13srjsVegdStj2TDnASah4LysOTT37MYjxswAT5jbW0+wjkOO?=
 =?us-ascii?Q?xBU0w/X3w+xwkuPMNLpdFPcuJQS6XN7obBavwKToe1w05njQS6BA1WWZczBY?=
 =?us-ascii?Q?o29bMOGbN7SJG9n9VnTH7dUPz5PMgtS7HNFp6d42GcOdXD2pI5n4HdyDGwZS?=
 =?us-ascii?Q?op6cVp/63AzwexbpilAJHcUXLdDL5C9SttIhEzk2QOfae98KjpFag4txnq6M?=
 =?us-ascii?Q?lcIp+dahxBQcnQy0enD/HT3cLUzCrRf2m7AnVlM+epKBIWhDBm7Lob4AYrtG?=
 =?us-ascii?Q?kOz9mRVT0RR8Ey8Yu5WjyF/cDnbIWOGoCd2TGgSos8UrdRAJhn2/D5ml9/XL?=
 =?us-ascii?Q?rJfXvEfhDphtvG+3tXGYnrXrPx0X43aNf3hH7u7O+EeUwgfNgvj8hQxWLQcJ?=
 =?us-ascii?Q?HmAvk+88rm4gLT9VVT0a4WL7mAn0b91ywK2E6nU7L64qWoOlmoAcTTwKMaRy?=
 =?us-ascii?Q?gFKdDDkHcV7OVjHZ7gsly7a8U9A6uVrzzjSqIFvAA24D7GCEFYTCv+rC70if?=
 =?us-ascii?Q?UQOVe6p6WZKhTQJjaMAWkljm7sSJ1H63qoZtz/820ZVZv+cxDTwEpaGftjgL?=
 =?us-ascii?Q?rNdt0y5hhDEiT9JrL5YiNOR9EKIy3oxgVcybO0ELVhSGL0H/k3DxnsEwbkcT?=
 =?us-ascii?Q?OumXPXeOr3neu+2cwC094jpDsrclAiTBEU25ProhYpUf7wo6m3JNFNPmcDxf?=
 =?us-ascii?Q?d4YvBwrLQgdzr+zoEhL48rzmGp2wkCPZibSUfoCuZRFpJUGLvS9PKpjHNO9T?=
 =?us-ascii?Q?DYoJXe0ULkbIgVEue+7WtmytKh8gq4T9kax58RgT4vdzW/5A9ih8DnDsAoeQ?=
 =?us-ascii?Q?FaOU6PLo2N/P6OGYZzY37rZxYfrk9xu+eEj1hnhOHr4mLzGk0ApcPlbk77M9?=
 =?us-ascii?Q?vfa6PFllsZFUV5Y6N0M88YC0Tk8lyMJAAX8tQ15J3+tPcN9B2wMdAcvGrKeX?=
 =?us-ascii?Q?v6F9/4+klZW3Va2MZUry1X9VTTyZGS0qLpjo0jg5LXtmouRWfTjfUvpYYPJa?=
 =?us-ascii?Q?BdB96h8flrmJPRoDNueCCSk+A+bHUU82PHGPaXw1W8oK9HJTXF51T9B9wk1s?=
 =?us-ascii?Q?0aPiU/liLiMo1dmQ/2+NKkSgIDsRBYtHEODwfH3h/2bFy6t5ytM4vZp6+8VJ?=
 =?us-ascii?Q?9W9qz4kCk4rJNTTrcbTDMzBrZZ1p6cN+1syFJvu5BppxWWmFnIL0aYLTKn8?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58dc61dd-8112-4467-b93d-08dd5ce368a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 19:16:33.8987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_111641_520604_F3FF1268 
X-CRM114-Status: GOOD (  11.61  )
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

From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>=20
> node_to_pxm() is used by hv_numa_node_to_pxm_info().
> That helper will be used by Hyper-V root partition module code
> when CONFIG_MSHV_ROOT=3Dm.
>=20
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

> ---
>  drivers/acpi/numa/srat.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 00ac0d7bb8c9..ce815d7cb8f6 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -51,6 +51,7 @@ int node_to_pxm(int node)
>  		return PXM_INVAL;
>  	return node_to_pxm_map[node];
>  }
> +EXPORT_SYMBOL_GPL(node_to_pxm);
>=20
>  static void __acpi_map_pxm_to_node(int pxm, int node)
>  {
> --
> 2.34.1


