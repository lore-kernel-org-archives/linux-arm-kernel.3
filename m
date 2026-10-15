Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87311CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRV2XZ0zeUiK0Ptz2klazF3pOPLvqvRSfdq3BsKctwU=; b=VN13S8pxR4h+TuYZoVA+Z/ypVa
	SBy7EmMhQS8/Kd851p6ZfqJaCZAjizQ3oaHCpjHlQAHp+KtIlqilqFT2jd90+XCU8qoQlId6dQ/sy
	130r54h3QB+J7Ey7kENyWwHFg04LOuNsCvgfawbpDyJjPr0qjLnUlxAYqdVhuUNNMV6vvZU5nIb2V
	TSqFTmf4jZPTBsdVzgNZwCRRMhecskUd79csb0QTnrq7GB5AOCdn85AN+K5twgCkrBH8Gpswr2Yb4
	Sue3Wql0CXt+4ulE3Nw0aR9YlxHZEf6JEsd20MZcXDKjsCVY+IuETwIyzMNVbThbxQnKyUNf1TmTO
	TKQ4lHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOW8-00000000sTT-1kSP;
	Thu, 15 Oct 2026 16:41:20 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOVz-00000000sRq-0u8S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPBpsuYveSsqsYsleKafdHPCJL/48wgkEojo51MCrGPF4iHdvfOu5XLTA1wkze4kXnEo398ZA858yCl5QXgmF16pAlurT1L5Md2DxTgZmd0nyN0AIFsEKZYWLrVSz+FUpFbfCdE/rfKV/vrSwbirsZeL1eNpqhMJddv9fw6EJIHdIwgNnTFEe2dGWN5Lgdl6Z7PjWJMED+Ob+Fu9rnDAbeNuErFds1MwgSj1rhpP2od1qXb8ld/OE8uOlWKDv3eV5eUgcazCDVuwtar+kSJt3wWWeKaeJNF2Jzdev15Hk8duv0M4Pe4R1rhmIddJTEz3yNBpJ+wFkZb4VeQIQVKZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRV2XZ0zeUiK0Ptz2klazF3pOPLvqvRSfdq3BsKctwU=;
 b=nH8qVnapwJJCpVRMYOLzpmHveCTxP4fOZyIXyb+3kUwr2CPOSwa2KUyWA2ogZzlEizyq9t+vXDZkdN5/w5EpPKEBbDoOrCgyjn4XGSyPn4fM4SpQ0YSm6KlmtA+OcUYPxJyWWAI7da1tVBMXxF9rizhS8PXLLM69X1iwZqc8X5QWQiGXUqOIisK8Pg/5bKSl0Hf4SF+OD6OX06D+N3qG15VQtzS50J9JNKbUmtlyzE7y2tNJ0zHui/nnR9BTih+Aw7j7PRTYOsAcQCVkKpQ7rvM2z9F2gThUey1pfMrsjrCKVJwC2l6Rn2dOAtwS1u4t9pRbSArkR/tvNqR/qY5KyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRV2XZ0zeUiK0Ptz2klazF3pOPLvqvRSfdq3BsKctwU=;
 b=nKgb9m9V6/v0cCwr66N9jdhKLZqM813HtmNlrQghBmEYbYmxh0/p0sE+7kTG92B+4PJzhFedGqq7kjYYOLEovQqhDr4VAOYJhKWKcOvZEBjjnLoUJwUJbMFnP0vUibpjehYMfid6+TXr8TFcaYFhQZMJFYKAqvqEOpHOudB+mGHrc1aZzn4G9LVPTWweUJqLEdqCw8aMamWOTRTKYd9xXTXM8AF5ZY8bjGPxsmJPV/cbncYEgWfiwQKO3eI9zaDMz3Ys3pfqJ3FtLyVQYyJdZ56WVNpZmcDNTankc9gBzNDQ9GKe/0D5c9G27JA3L+/gjm2nmGuhuBi92sN9b0eEQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MW6PR12MB8867.namprd12.prod.outlook.com
 (2603:10b6:303:249::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.25; Thu, 15 Oct
 2026 16:41:04 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 16:41:03 +0000
Date: Thu, 15 Oct 2026 13:41:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 15/15] misc/arm-cla: Add vfio-mdev user interface
Message-ID: <20261015164102.GC13920@nvidia.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-16-ryan.roberts@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015142552.4128028-16-ryan.roberts@arm.com>
X-ClientProxiedBy: BN0PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:408:e8::12) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: bf152b00-ddce-426f-2a70-08df2adb1a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|5023799004|11063799006|56012099006|261009223027099003|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dbBXbg8yiRbOM50q6Hvprr/No+BSkPImmIqcKt+lfl2bS6TBCvPPkZ6fWlC6KszRX7GHVgfC0MZjsBxiaCOsSjgDideM4NPL9SzJ1KBCgbkM1hbzYb9FzOEalS5sRluV2IFugb/QK5tAQCu9AKXZykPN9Wqd7SA0DQrHCGxTm6HtFktBSkI2DYIvL23Dut+ykAq84FPB1PJrSCDMzsBXXRY1Id22M9jLBNTEnvaB1eQLL1AVKEbhXgWJB50jUuFT8HhlhaS/vEwljplOb8uemZElktR8LZu+k83P2oYhNiReWPYyEc3kz13xQI45HBpiksYSAQL3uyVzHClRp2ZSXmypStbd063NAQ+xdBTUxuC0OMSg2gZUnf0Di8ZrlndPiY4eusjFygr/Hi+b+k0LpXv/O6Z6TaITfpq1rnggjBXDSZVDlUrhS8Eug01j97Jygdawejcpc27PhU3aAYImc4xC70cD3yoPcQHAr3BmIhJk/zRpma+D6AgGrVaSByAWDVdVHzk6kpvwDqT9vddkqTNi0H7xXA10uB3PmwCleYPSu//SAXQptnEbxhKRTZcf2RTPdNrPHbXLiBxp7yCoRC0HLVWbpR4jC1IxJxSPMnXWrwJvgkN7OpzOPTDfvfc4NLNppSOBwcUT6HvA//r8qgBe8DDsGSLPSZF5ugWeAYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(261009223027099003)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWwB/aoT/QA2v/3IvivKz3e89hRyvU5HFwCYE7B5Ck4zfiX91z97q6jYAMtD?=
 =?us-ascii?Q?D9RuhUEJ4PMrVeXJl0de0hQFuObVwRkaE/7bAlkYFmh0z+9vMsagDfr/RmM4?=
 =?us-ascii?Q?UqRF9tmeLofbDz9AcTYSuzUx7NzV7jnXewNePC7IT7+H0Oqbks72HnGzbhsV?=
 =?us-ascii?Q?58pXeKnBdXXHZa4mpwTjJc1E9piT96PUlApLWHJb6McDUom5J9/K0eNU+wAK?=
 =?us-ascii?Q?RLOuEthCz6s6PqjcBaFrNOFGr4HmfLwfKmvEOtdUrWIq3sYezrMg16CfeXPP?=
 =?us-ascii?Q?6FKb4LcQU4PGYyql+MN3SYJdtYmc6LS+OQbT6r3qRPmUcK29l23/q2NpRIWS?=
 =?us-ascii?Q?8DP4sargMp1vyJX6ZG7CNvk+Eb8ym2y2iEi2VmlH4fMP44l2V8l//JmpwTo1?=
 =?us-ascii?Q?0C/KeWt2BVWpvhlL5md3mgfYdtQm2zgOxqXoz3qLjm6G9PKkOMSYoIXmBFak?=
 =?us-ascii?Q?wmuIuw+5JvcaLqXuELVVxD+1JHxKH2G4Qh80YJP271nSQQr825wOXr4kOeif?=
 =?us-ascii?Q?95Wb1G02BNPxToVfvelmr5qXHWNK6aVEGyrNGnw1iOfJu6FUNK4jufETQyk1?=
 =?us-ascii?Q?O9TdJ1/KsYiubRNDah6D3LdvfZVE7RiT8rQLVCvwy27793Vk3ClfhTery2pv?=
 =?us-ascii?Q?OK6Ar22a1VGnX2j9YYdGdP2taScad4kTLiQp6vFa4k6AxTL0jleOvxPpKlE0?=
 =?us-ascii?Q?jhxFRAghZwS1+J6Xrdbwo5aRBMv14LPtvwjK9C4TsfgasH33yi7g2LzTN/N3?=
 =?us-ascii?Q?maJByX4bS6VmcLyvXe/MjtonyOALHD5pPAD9DxDio1qEnO2ezV/TGM7bNvvS?=
 =?us-ascii?Q?wKzDiK+hXHFhxCvq386EuFJPLBmLIcyioMLBab9TZD61FbH0Vk51OfXz4z0z?=
 =?us-ascii?Q?pK4SIirzj6GjY/dIWpj5YVqra/rQdJ1GC5Zjiu4+XSsz95Tc22FtRfxMpx7k?=
 =?us-ascii?Q?aZRe/kfXgFYf+V7e3X6zk77E0w/ZSwyHlgNLZIqxFoTq7HiC/9WK9asagDui?=
 =?us-ascii?Q?5AzrsqrI0O3EcIDthPg+xaOcOh6uSD9Rq8najmu79D7pc8fTNNKIHfRykVwM?=
 =?us-ascii?Q?WAoonmOJ7BGPC9JUAI2sr4pKcbJM6W/CIgihAhAysc52MuEOgtFyk+L9UkFV?=
 =?us-ascii?Q?80sqmQVqIyS5flzOk3Fu57oesF5blqd2AqAQLrO8qzP6kXdaj7wEW2NpHHZa?=
 =?us-ascii?Q?tTzw9ySo0tXX2BTx09Zn70AcyvEJdKPpKRJkSUltARVBlrthNlzWhFE5UIzX?=
 =?us-ascii?Q?EKB8CZS0SY5xQjcpHI9Riw57sU0v6mA++AygALa6TV0TTixP9SoKXcqlNvy5?=
 =?us-ascii?Q?msOe8Kc/4c+8dCMlXKiAftLN2LYUUk1VsQMiG1Dzs8v29Q8BkVIyVGMyW8XG?=
 =?us-ascii?Q?U30f4lPOuW4gET5vQZNGnnWyIz4lRIwSdG6Svtx6UoL1UqkOEWEZaikIDMtg?=
 =?us-ascii?Q?zQHjaqaBToc6yWoJRlYJb+fxh9jk3uZ/ikJYYDJ5wgZtQwQJYA+erhzKhM52?=
 =?us-ascii?Q?waUsije968ccwIx8+cg7i+edqk9xPTCMZ6rObfxcPHJbwPNuzFYcWxOwYKeB?=
 =?us-ascii?Q?f9C4gNxriEfSHirK4IBGf++ajHqjg/US9pxIY9MrCFh9jodaSiXO/be3EwDC?=
 =?us-ascii?Q?yrOgtK2lll2JPHLjU6R4rchkmPDa29rsKtAOXPByWCehWTHrkO29kslmtYHT?=
 =?us-ascii?Q?SrXHen9PA17kPrAnxpErnUqL+rrFiLkOwkrvcG5U9Ng9/k2n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf152b00-ddce-426f-2a70-08df2adb1a59
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:41:03.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juBIA7kho5I2VsC8QPCwyEDGS1BNrASyfRfAlCBop3UWSKvnq1Q7KbKeT949sG5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_094111_282243_C6915974 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, Oct 15, 2026 at 03:25:49PM +0100, Ryan Roberts wrote:
> From: Jean-Philippe Brucker <jpb@kernel.org>
> 
> Implement an interface to assign CLA devices to KVM guests. To creates a
> CLA instance:
> 
>     uuid=$(uuidgen)
>     echo $uuid > /sys/class/mdev_bus/<pdev>/mdev_supported_types/arm-cla-pl1/create
>     cla_cpu=$(< /sys/bus/mdev/devices/$uuid/cpu)

I think I said this last time, please don't use vfio mdev for
anything. There is nothing mediated about this.

Jason

