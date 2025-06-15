Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 01:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfxkZoY26vU9GHAd7YSTqAF0jQHBBUGiD99U16TXWaM=; b=UURNXKfPbJew8xmvdQ7mnWdcAN
	HBADUIy+jfC3RFgLY8Hf1w7QHUpYCRSZzf+Db0WqY/eWxxPkG1HbdO+yI9HQQjgdvxJrX0VyOa5dZ
	NdZ5YOXWRQg0G67HGXTK9m5CeDoMWafnix39poOVhD/SMhkfAXDP9vTISVlGKA7zsznVK01dGPHRj
	uRSzXJaZt3NL4PCi3Az57N22dBp4wHkRfnx9XrJSXyjJp24GsibJnpuwS5CVQ2FUofxx/fZ1gFm7h
	BnBADVqCc6w8oxz2XHLjflJU23GZPamlXAZGqb1QZFvcbIZQtR5VfESIoFvyzdGO/gabIVUJ9E5LR
	eo+H2iVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQc9B-000000026Js-2asd;
	Sun, 15 Jun 2025 01:26:57 +0000
Received: from mail-mw2nam10on20701.outbound.protection.outlook.com ([2a01:111:f403:2412::701] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQbw8-000000025XU-45OV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 01:13:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mClvFFVzz/6nSAnsmXF2Q4EX7NRaxsir6pwJ7U1SCtGkSPRZm2VVlDATj3rfCkrL7MoSD/cFiNKdlRhM+QNj9cA+F9dPfSQ0KiohxyUB2kmj9Wvs2ZihsHKX65dbakCY7DThvNf/u9MGfTqQeVqX6iFms5a2hNwxwRPeFgvHwZh1Ew3bL/Xw8ik75+51HAWCEdLAUBbjGw5rH3klDzBbSn42IPYqvJD2Bq9jKh8ZUV8UsoTBdLPhP0h5OTeXtKo6spqknesLXC/FwTMCIoh5draPRFMBOY7pnT7ZJy56IFmyajrlABIMPa4eE+TNkI06zVPN196ocmlHP8q8hTkqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfxkZoY26vU9GHAd7YSTqAF0jQHBBUGiD99U16TXWaM=;
 b=nPXD/EyTMRaqKsk9BRna2lrX6JTNzPar7rkZo59iS4RWOZ1TAZEVzvzMP8e0FITNvPHW9EZ5I8pFaIW7LocY3sKQLpkegg2Qzb3aCDba0G8v4v//x5Ako3s1emLmbYupRQjaqInnkCyPnG4UlhPLHNKqfRz4uHs8or21x5H1uVJF2Z3Kuwkz5Gj/Es9GOHhpy95WiXInV5bnaqihhc8TZd5oTMGCKFArUmPB3WcBKh3eDp7hZqpmu/OqWgyk2n8H3u1zPgeb6+C94umKJr+aKLzBD/59Dtmfa9j9QEwXQ/XKLkBcLtLrOHFo/eBRNgkkjqt+8euwqMVYjcuSyIo/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfxkZoY26vU9GHAd7YSTqAF0jQHBBUGiD99U16TXWaM=;
 b=mvDMonD5M8ztu4MzfCNoCbSP0D/z6eIp8p0dsL/2jxRc2ziu1Q0Zp98f+xR5HScVCdAoIqi4dhgBvSXbygRu5zlZSGvt0Nnng/cGe9kchGgbspAgbkSJBGPD1ZUokv+swIK7atjx5yAvy7u1vzaqPFesJaPNlt05qebVvL+5cawOZph6I9Ow0lCnWipfaQ9RGmcwRk5cnj6b1qa9QCYAlGS/mFFe8UbJSp+Lzb3Q3p5lfhWAUt6+k6qRmHgKFGBzNPdbm3iTr3FdVvCQSV04VEZqarRuc+Ck0IrETeMEIWVpo9NQXwtrQM5S0JMzziTheIB7+r2CnprZX2DVNYaWyw==
Received: from BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18)
 by IA2PR18MB5852.namprd18.prod.outlook.com (2603:10b6:208:4ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 01:13:23 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::52) by BY3PR05CA0013.outlook.office365.com
 (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:22 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:52 -0700
Subject: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=829; i=hshah@axiado.com;
 h=from:subject:message-id; bh=JOkd26ohorQzcrPaxxyzvDtc5pwYOMXzC3NL/4OTIvQ=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4p+vd6v0djqj7LSpa/ZuN4u8NENxXE27Ics
 KB19tx4OSaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eKQAKCRDxWHMRoTLV
 +6c5DACcH54fAytm/63wDOS1dDu8KXNn75X/ytF7zvTti8lQe0BCIcAQg2cj96GBDAh4ooDXVJr
 +vkv8YKAC+LT3hmagcZTG5wkavHHNzmOkGE0sHfsRHSubKEjE9MED5FZJYjFqWH4pO251itUuME
 14yEJBlKyZN8VKHgqauKTxLYRwyL9INqPdIcQ3tQ8tO+rRVxtmyXTlo5oJnwHSqrnaqbB74KlY4
 cslwKy/AGSaND9JGLDfYO0Qkf3RSSsBVI7tLIBy3jWyZhAOxCv+SD2v8/5J3m4kBFyrE8cst3y9
 dHmO26d+x9zYSner9QSKw9cVzRl0QqT0iPr/DDZuENIxAh5UvDixjfeTxj7HjCJrATnWELCb5Sx
 7oXhhegXmRpQ2QSSzSNJod8KvjYdcWYVEEaZedrIw09Wlp18g84e0N1DrLDWRG38dOctpscboco
 1lwb2BfOtZ4SiqFyn+9u1bIHVxrJFoibsUaHr2oYokDHiZOWR858tHOWCW5EKHYaMWPh0=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|IA2PR18MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 462ffb24-a7cb-4fba-3a74-08ddaba9d2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y28rRWI1Nmw5L1l6OVBCN1JIbktheE5JVDQ4NkFFVllHNXcyRm9kSHJOMStQ?=
 =?utf-8?B?UXY5a0RTM2p4V25uTjlYdzhaK0lpRDl0NS9NdE9vZ2FJOXJ5enFWOXgxOFR0?=
 =?utf-8?B?WDVXQUdsRE9kajJsbkxPNG9oZnRYN3NydDFLamJIWENndmZiWlRJSjQweUR5?=
 =?utf-8?B?ZlJoc3FFUXFPQ2RpVm5CMTVzNGNNdWRJWnBDeUtDVjllRUN2WlRzOUVzS3FV?=
 =?utf-8?B?b2hOUE1GN1Zxb2VBMXRZcjhiQ00rZEQyNHBVQmZ0YnNZQmVpU3d2Tm1CdlhG?=
 =?utf-8?B?aUhFWXBEWkRBTllDOU1Ia2MxM3dvbjNoV1hybTMvSldCNnEydER0UWNLVHgy?=
 =?utf-8?B?b0d5QWo0eGlPVG5WYzRNRUJJTmNJWjd3MTVwcU56cWhabG5oUy9NNG11UTk1?=
 =?utf-8?B?YXFiNUp6QlQ1bGxDclFnUjNUWDFYaTRkUE10bFYrWnpZN3dNRG5DbGZEVGRT?=
 =?utf-8?B?WHFtTzNiVE1Zc3BUVXZuUHNkUUlYMGRvZE55SmkyNDJJUVE1cU91UUhGZVVX?=
 =?utf-8?B?cllxT0dWQW9DUG5pRTBSMVJ4UW5OUFM4NGpoVDRVYzBkNU1PcksvV0lHVVN4?=
 =?utf-8?B?KzFJNEttODRCRWxxY3RkcVRiUnRHM1B4Rk1iSGphNTUxYlVxN3JTei9ETThN?=
 =?utf-8?B?dTVpQzNPSE9wTTNWMks1bjBLV0JWNWt1czlIZWVYWDBOWWZSQ3MwTURHY0Z3?=
 =?utf-8?B?YVFwUndVVU1pOTNjM2lKYWZTNENYQk9pZHY3TTc2Nmo0cXVVQkpOcXpRZzZH?=
 =?utf-8?B?di9vODNXSWdaa2VHaG1FMVFvNHJxTkphMC9zbitob2Y5VU1TUzRvRGwrL2Nw?=
 =?utf-8?B?Z3lwNngxMHpoVEZ2cWc0Y1lFQ1JyUWEyOWV4WmNhSHNaUnNnSG0xWTV1VDh6?=
 =?utf-8?B?bWU0L1JJZk5EaEhWVWVRRFJZd3dzTE5KbUdLd3pMVmRweXFWb253NitaQzBq?=
 =?utf-8?B?WTd6eGxHMC9iVkQybDVYQTRFejVMSnVVeklxSHhaS3EvdGRwai94VlhkejZ5?=
 =?utf-8?B?RXNZVUpudVVVU2o5RjRJa0JuTXBFbjNGeEY5Ui9RdGhoSlZmTnV4OE9PV3JT?=
 =?utf-8?B?bURDdlhmWWVhd2NRbi80WGY1OHREdkFWTWNRcXQ3cnYwcmlPM2hlNnFuZkpD?=
 =?utf-8?B?THdrQmlWUjN3NUFueVBWK1pZS1RkUDBkMHZYakhaUUtnekJyMnVxa2JFTWtU?=
 =?utf-8?B?MThKbFJIN2pMWHp6Q1djMEZBZmNSNW5UY3ZGaStkR0FhSnVDVjdxa2E2QzBJ?=
 =?utf-8?B?VXUxS0RvSE9pdEpBVDV5VzJZY2RiMzVsajJ5R0JtTVFiTHI2WTB6a0lCd2Ru?=
 =?utf-8?B?VDFCci84MDIzb01HR1hEeE5wdXNWanRSQzNaNTdZZ3k3UUcrV1Jpek1zcGxE?=
 =?utf-8?B?ZlBWclIyblhTVFVJN3dlbGdCeVJjOVVMZElhOWRjSkVvVndzMVZtMzBEVHd0?=
 =?utf-8?B?SUZlMHk1NzJpYnhaRDNQQkU3NjRYQmgrZHhPTnpWZFIzODQxZnFiQlFQNkxR?=
 =?utf-8?B?OHUwSWdxODd1WnVpZ0Q4bW5UREdyeXhIalZ0NEd6V0ptc2ovbEN2RU01VTdU?=
 =?utf-8?B?QlBMeHo3MjNhLzZpYVN3eGtqR2ZRbW41L1lGOHA2MVhiYVRTYW1BSVhNd2FO?=
 =?utf-8?B?YThGWHpDY0VHOGRkQ2hxL1B3SGVwaXFGZ2x3SElxNkM0czNVMWlmQUxTNk1i?=
 =?utf-8?B?Q2t6TUhEdmY4Y25YYmxHZlN3dnd4Qzc4UTl4a2dncCtlcmZ1MWNjeFhIYTlD?=
 =?utf-8?B?aUdGaitUKzZmVVhtOEtWdmNRTlhyRW53YzNDLzNBZkRQT042VWNiNzdtUDVa?=
 =?utf-8?B?NWN0S2todEM3YStjM0wwcW9raGZ5MmNwdlN3Ni9HcVNLZHdPQlZGU1huSHM5?=
 =?utf-8?B?c0p3dUptZUx4TGhQMWQ3UFoyS1hzeTZJZXVnMG1ZTGhmOTJQNE1yQ0N4eWlL?=
 =?utf-8?B?c0xDNE1CRmxPTXluSHp3Uk5vamtVTkN3NzJlZDNKdmRXOTE3d29RUEJrUVg4?=
 =?utf-8?B?WTBZTWxtZWUwejdpUERqU0UxU0ZodlBjQ24vUkpramVtZmpnT0lzN29YRWNl?=
 =?utf-8?Q?ztcFXJ?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:22.5804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462ffb24-a7cb-4fba-3a74-08ddaba9d2b7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB5852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_181329_015817_41E66DE6 
X-CRM114-Status: UNSURE (   8.53  )
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

Add entry for AXIADO maintainer and files

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..7fc5bf2c45dc2c864947c935ec580cfedb6a10ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/axiado/
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


