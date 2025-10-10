Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F03CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pclgjJzBglq3k+jypS5WX1FJzUfIAk/XvZFXUcm8vfw=; b=WdOdLZWcqrI7QpU5auU+UTvPRQ
	LZE+Skt3gQnhKT17vRnY8EnxjMbdW8ZFVF5BOlNDT2VSjKYqx+c+vR762iMXyzNxEv5K1ki/zLl1P
	zC9gOk/BpXceyiR2/bNkkZNzvrmuTLy7uoeDZjwpSjKHoLPsRss5VnMdk2jiaocRPn9A2kxcaps8h
	GeZFHOo8r2E8GD8X5eeBVffek/FvXTBHxRQaJ+CmkWIsBtguc6cVddWMAZkmdzOinQW3VB5HUY2lR
	OVqmTAuRcHA1dfuH/4PaYFsWlwXOjw8aejA01jZAmbyiBcRZkZte8JZ3pMmATVn3zPJW4vqauhAZG
	8/q35HRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IgK-00000009E96-1eqh;
	Fri, 10 Oct 2025 19:21:36 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ig6-00000009DFF-2XHW;
	Fri, 10 Oct 2025 19:21:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWIIrVKjfeZ7OGAX5iswRpIhHGf6Fg+0lzxCrs3GuuRbN6aRqyHlntuv2a1tVDVXUw6Ofe5Ysjh/I7gu8rI8E9QSojOYFzx+NpAg9T1YREUKFoTZnK6n0teIV7LHHqb0yc+4O9hpWijMc4JXfyhuyaje5NZiSRAQPJ0+DPinG/+7/zGWv7Z35ozDYjRUS4u8WM7KDbVFWl8KolzuWawCyXu6TdgRmigRY5DQ42/tNsWCFJJWNMl+cF0d15kv7yuvWX0PEwtngQFMPHMZIKYOjW99t7+nm+vA1VeoG76VKq+wrsRANr2vXquM0NH2IyU8miHlXZ07/tq0bLpStB7xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pclgjJzBglq3k+jypS5WX1FJzUfIAk/XvZFXUcm8vfw=;
 b=QvMTRG4ixjcici0laj0T337isxsN0rdppS1VkYj0OmUlTPNnT0bABTk2eF62/gznH8XWN29ZnICQVdhQOshcJdXzJuGWLh7kVJGOsMTAamCAxKPYedgKpEYu5c6vq9GE7wObodAiyhl1Y7+UAVbmeWPB/3YQKlba2VmsMVD0ru5NIfuvwx0d1UqCQUnCMxZuTvjepgJ8WZE9V2B3dzPHk91lwDh2paOA5IxRgYrpDLAOq/6eSXzszr1mamaRswH/huPH/E7sB1YDTCys/UjPwl8ACk+pgkNBYgO+QCTjoQF3Q0YbAx2fjM4RIMkSd0mULyFrW8ZQdUsUqMb86+e2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pclgjJzBglq3k+jypS5WX1FJzUfIAk/XvZFXUcm8vfw=;
 b=eWoq5QFe29loHqovbQJvZavYSmzOz5+iF5uHFapT73IVPNVMzD3Xmn0p/RiWXglfouzHA74zlgD3WNDyjKBmFm/bqBuBVlsarp7gXbF+9BVWJobOzR2KtcE/dpGA0+ijY/YX9/358M/GO5Y9WNpYVG5POukgmo8EOCVzEDPOuCWX/4oyZvV7KkxAhy5agITowrAV6ej/JJ5O8bYyvcg4bh4igPGXBoKoiuFBetWfkRoIbPGsclRUb+D0Cz50k4yP7/RBfGxH7z438dfCP38ogvQHwZOdlAd9OJKM/YRlLVUCoEtaNc98lOZh4qDlWdvBI74b7uQRZrOaZyzV3MxAJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBAPR08MB5784.eurprd08.prod.outlook.com (2603:10a6:10:1a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:21:08 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:21:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v8 15/15] arm: dts: airoha: en7523: add SNAND node
Date: Fri, 10 Oct 2025 22:20:38 +0300
Message-ID: <20251010192038.1592889-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010185940.GA715991-robh@kernel.org>
 <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBAPR08MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fddc97-b3fc-4383-a13a-08de083229ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ddAmn0sfOPEb6mW0uBgDWl7DD9AKR4burkDWdMSujOXZRHG6gSkty3lNziq6?=
 =?us-ascii?Q?my7UPnOBmQBPhF4iRZANEu7ArXMBo/CL8K7jiDKNCGNvMNitMlLm8OMMZUDz?=
 =?us-ascii?Q?1wmR8J7p42gIHgdIzZs+dY4RF1WUqdlrGqps41BVDJw8cvN8w1SqLuuaFwxb?=
 =?us-ascii?Q?+8yPzl9U0nwSrwSd4FvT6vT/72jr9WL4Qn0isGxVl1pgoqCyUMuFKxg4EX4f?=
 =?us-ascii?Q?PmYFbwLiKHLsG6L0tTE0fJyIFVKX+gMH+6+cMCBBAw1FC3erGADQ9Jcalons?=
 =?us-ascii?Q?dp5E05+3uadU5m5DtTi4yt1pSsAOyVPCNUfnsVKxWgBj8ZOi/2A17kMVDIN1?=
 =?us-ascii?Q?swWA6fChePwclVvKPH1lB2927sm/gHSM/ylyVfiHN54cN2gJaHWaw5jM6Gqn?=
 =?us-ascii?Q?6WUfgwiTuVuwLm0s9Lo87pmhMZL3eA3gNsZtNooDxPspdB7gpCSYfwNeD+kM?=
 =?us-ascii?Q?WkXSqXeEEbtt2shyPP49pwsYB7aBCtfQr1u4MQG4ob0oyTvC+ms15lCcrl4W?=
 =?us-ascii?Q?BHrrdfkbBLlbbvK5aKQGuWqEVeOk7/NpqIIjMya47igPFt6uRmPtZdqB6nCH?=
 =?us-ascii?Q?GB4eI5gMcf/oes6kpAhSXxW2QCRukDr8A9hjhJn4o+2zOjC2uSjXuu9ePFk/?=
 =?us-ascii?Q?Q+aIuqOkmoXstrldE6dZAGNTl0DZZiOaIBjDrrJ/mrgnLH5RW97jah9nt5O3?=
 =?us-ascii?Q?JwtmH1VwfYoFgmZ9mLY04k5PKDeOL+gP0cH5N5j5peEu0DdbNNh1fdfwrzLT?=
 =?us-ascii?Q?iYgCrM5qjhrAhF1C8zTCGhD3fbZxG3QRMGnjpgKK7AGqRoqmqla9sPfVpAXI?=
 =?us-ascii?Q?D2B377MZgcZHnklLkCzboM04dVKxpOkSTxvaCYdyfiqxsHHiHPxgzTtzYnBj?=
 =?us-ascii?Q?iIwWI4eW1KdCTJY39v2G8j6K0I/5svKeoNIUg4JxEn+u0O1Axdc4ZsnCNhxp?=
 =?us-ascii?Q?FWPyWSTE3evDGrphNKC5hHrb/FCQd/jiOhE0KX103D+jJgInPfDyiCJ7Etzv?=
 =?us-ascii?Q?i+mUunD1pqareWby+vM3aAojl8r1BW09AKjEap4xxOjh7+u/xjRZmLVAWCJY?=
 =?us-ascii?Q?lSNUkn7uYMjJOTm5s+Tq8Jz+p5DTabVAIdm+EldFiHvKfhyPnyCOk0rMqZhp?=
 =?us-ascii?Q?pd7ldff1fjeSvojPoCXxUHcxK0Ey8G26EyQrpviYSlfBAwQ1MYDjngSaDB9U?=
 =?us-ascii?Q?xT+X5+2OGjV8m2+1ojTR0Syv3vfOh2xyqcZMduqfCH2/IMLdE+kYZgRZ4c0i?=
 =?us-ascii?Q?hfFvTZ10fW/7hjScGMx5slfjtW1FrB9VwXi4f3WKClXFtUcpc7fxtfe4NHpD?=
 =?us-ascii?Q?ZQBI2n31HJ1jDpTwvXHoH6G0FmQGH4gzRFg580i7bHfp9HCfLQ8XCKPpqQfk?=
 =?us-ascii?Q?dHvA3Wv5d8ectCcfZcI/Vp1ri/KzquCXrolYA2Rmj+HucGtX2hpF+pj3ZS6Y?=
 =?us-ascii?Q?nP92uK/eW0lV141+2KTk1450QN92JcNbm8AUIm+mzOvGD8zi0qj4Lqf0Nblq?=
 =?us-ascii?Q?PBRGmfaKPhCKCFWuDNrkH8x8jE/mIjqJpq4JvvA7+lVdXw/F4Mw4JVDK8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3D50giYrxdn3B57U4okjoQVyEH80jPgLy+pZW1EUINqFDVkRn2mfGRai7FaK?=
 =?us-ascii?Q?QjNQ7Vtk2iBtcIyY2e5boGJaUO4twaQBEDqv3FjsiB10VHKIAWuouguyiYTi?=
 =?us-ascii?Q?PlTGAmCYgdZZ1c25CFAUwZ+cdvnLsvV7zS5Pm6Aiz5r49Xc0RD3eOi+EABu9?=
 =?us-ascii?Q?BP6oSXYcYs3c7gA03OYE+60oJjVQf/sOPiibg3B0CKgzZFFD661hl0V2N6A0?=
 =?us-ascii?Q?EwEr1Yna02at9oUQH+CO1M8yQ4Kn//B4y8uEqzEiDMu+dRSqSqMF9A74D+bX?=
 =?us-ascii?Q?1eQ5drVEPy0GLcDCZ1jDazCxXq5Y8Lwi+/evZXEKkKgBgPT0fVF6xHQYWHIt?=
 =?us-ascii?Q?lLMyMr6SyUKMyjapy1RKql9jkv8+vFQX6ON4EBVwTQS5MSnCEmcUROR0Cywd?=
 =?us-ascii?Q?gaowTXVbld4876zNNl/NXoIDfHe10pmDTf+xhV16IQaC77FOWHWIM8zPg/BH?=
 =?us-ascii?Q?xQ9UULSGwptN4Cm54ZDxPW+IuchcPaqsbTwRIpr1A27/3R9AEkn/fc2LNH7K?=
 =?us-ascii?Q?lq36bH7irBHcxEVhrOGkkk8Bf0uUEXul4RfrIPdmlNlHuPcZwgfTno49ye7u?=
 =?us-ascii?Q?f773wmp2foPRJgh9M3LS5NIlFm0aeeTsxdKi4xsM9lwQarK7LYHGeR+33iwB?=
 =?us-ascii?Q?KDnzymQzpfw/t2z8UGqBbNn9T8nhuJf5WVp1ORYfEG37Gnu7fEi8QxPEw9Ep?=
 =?us-ascii?Q?y3YKItI0hFF8vO5p6FDJysidnNOqDHWoHEgmohJLNUTfnqL1xzsQCRNVj3Q7?=
 =?us-ascii?Q?5rluYaJdI7BZSfXM+GnRJb0X6SOJ1CiJKFNMo3EBk7pwVbnEhzTOxL0atQII?=
 =?us-ascii?Q?1aM9UiTi44OA0UZhGH0tkLPQosAYsP2/Azikay4bIYoG1kImvjTuhZkvvyIH?=
 =?us-ascii?Q?v4eRWf6BS6avUd0SXl8A69Cx13lXosBYR17LtnzKkL195++v6YtG0p0ET3q2?=
 =?us-ascii?Q?DBTnB+C+XQswfGeu/IdhUWjPTkBFDMp2UcRgbP3VRpfjPvOg6etbj0W83/sl?=
 =?us-ascii?Q?UYVIfaN7KW8mUTbewtwIKtwKjM5SvoYLf7vMrbw8hmpggdrU0vg5QsHMe8sP?=
 =?us-ascii?Q?AddEysimP/DJrpFd7dMgK+BG4JeqYNjVrU7WAtx/scxNZ2biU/a9D6mrsM5c?=
 =?us-ascii?Q?eZijob5hko8zaa1Nf8ULmjnLEq1utniTxXDGgvIUbmQdwFZVNxxD0vQNbBOC?=
 =?us-ascii?Q?GSWqCPz8h7bZGU0dNNwrpLyiNmQAYRTdbhoRWHD13gjuBdNoqB0LKzjAPUS/?=
 =?us-ascii?Q?LJwhAYGjMd5J1pFD9dGQdP2Er1yI6n8XIqno4YPgUdUDALA6Id9rNYTRCOhr?=
 =?us-ascii?Q?IY90gS1lPDCod97CsYmx07H+vn6I3wZVkoFkmaywsJyU//tuHzJRyzAmUYCm?=
 =?us-ascii?Q?fKZQ56Z9dIQc13q67pOqMrTrOkho5wRcJaKSto2l1W+K2cYoLfRQcJGdC541?=
 =?us-ascii?Q?xHNKHF3aUV0cSpQHkb5/EX19yxhnkVZy0Whxk01MoDJZ4uFC1HKPmT7oqXeW?=
 =?us-ascii?Q?pmEXrfk123SKsSVUgknuY4WLyMVfy4jFWenpw9ZOlbQn0cDJu7pT8w7pRUNJ?=
 =?us-ascii?Q?QZa0jQDZ/hHBV2R3qCfXX8oDfcmj49nTy/27D6dwMbWi3dItAgeUtfFsbD9u?=
 =?us-ascii?Q?vNpgevYJMNVxnThA6LOMpO4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fddc97-b3fc-4383-a13a-08de083229ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:21:07.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hopDEX3cKHPNpp/5n6GeS7sQcow7lH9woVFRvQ9AW1qDYoQcG7iEjxV8UjvMuNsAbXurT5nNUpCYrPpLGxC/w/LdIjx19+NHkpNOleIbyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_122122_728654_2C733357 
X-CRM114-Status: UNSURE (   9.17  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..a13dc6e77d08 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,25 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi_controller@1fa10000 {
+		compatible = "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
+
 };
-- 
2.51.0


