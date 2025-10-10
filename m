Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB577CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7VGJN9oBRCyTVmGag4OXr/eUP2LqP/JBr2DCv6+rrg=; b=EVXfQChi+UC75k1uSq5IP7tOP9
	7y5jg7FANtAA2qvmDlQqYq4vAbSZsOrLkg/SLwx1PW0tDsryUTKz220UNR9GX7vbrBckO9ngTSVNB
	gCuH1KbO8HLFYd8VIlHuuC3LQL1CrANYhJEDuFKs3ZXjG/p1rKKZH/j6V9eKf3R08XObxZTQaNg0b
	9Zh7BseepN+kjoQHBuvb/GwmTkPqAeZVDIeHQJvfwZeFACby1GecN6D6S+sv8Y+FPPyzPlgQt7bKM
	x+Bfn5Sntwx3iHlIebzQJ2sOMEpXnPsyQ7bz6waLUwUKV+bqeI+d04WGQ75HgXGv+tTj1lKMoDE7P
	bR20ubww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7K00-00000009LSr-2V5O;
	Fri, 10 Oct 2025 20:46:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jzg-00000009Kf4-1E7P;
	Fri, 10 Oct 2025 20:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5iajKxCtHLnxXtR3RQUHIap8VEvSlshzGG2mCZD7qCJX8oFQ276g4rMDgrzzbpoa6dG4VYhv+wGzT2RZDfh6DW8BZ+B6+7/jAvny7+8TJJxvTcVJtaSgF45AHAoe6G49JT25hgbV5eTtggPIZGwK7h8aKZI3BdSn6ETfxuQ1j6Sbm6jlsD23JqV3dunHjyqOq4fj9ohIMKrTwbFrLhASoj3AB7cIN2hlInqk6noS1BSF8O3udQmpl09OW9/hmvGdYyl0N7RLV/VDt6Nucx5dOcN8eVBy5cdUufVXoNUdM9R/0dRg8LZaOIgpMlGwrwWyUDcitQQ1PQ8tQ5QT6FYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7VGJN9oBRCyTVmGag4OXr/eUP2LqP/JBr2DCv6+rrg=;
 b=vHvi2+P8HJsScq742sw4hzAH7bVwSIWg3VVZmdt0x6pvAWFFaIBuyGlBrMq7ArL2DAaJyt4sUaWqRGwQXSrcMNecLeXFv51jOVYXD4qSqXSUm/gCDjayLBk56PpBGSXeEug2f6l53EtFD1j/GQa8nyMNwGFazDLzGqzqoeJAyVy/SpgLVgmDYaQK+rHFCmZHuEZmf0++TBFxvygC8FmbBb6NJlDYkwFtjPdYP/zPKRCC7UHG+WkMUokgcZ/QjcC8g7foSnbS05iHlRrtqvYc0gZeTER21wp7AWTvP1kS5kU9VxusA4N0EPTDw5j3ZEXISpN+U6bXabjs7waE9HIYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7VGJN9oBRCyTVmGag4OXr/eUP2LqP/JBr2DCv6+rrg=;
 b=GEMKjfRDzNj1kIoAuneGVGgZFhvpMnFWbr02CV+V/ugCCzl8shpkFcUkUGkR0hq9eaerlQBeHHXeyOrmU+Qvm7qZZEMz4VuR2M2edOoWol1NJWTy/4blAYVYOCDsWnjWSJw1sUUmPSOuR5XUSUhI2W0+d2oKGFe58vQDfwY/5Utob36qUjeJ4hOUQKNX9hfAgCm8dC+RPvbfBh1iVAQVj2TlEFnNDVSDbniwmyAQUE3wJDMB+7dG36vu1/58hoB+FZ6FwZ4FBFJG/ccuGiRZcAc+PYDjpfkci77Vvxd2FSQt3X/R9lzeoY5P1l2MsmSqEep1+ML4Jwhv8RDcupbr8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB8619.eurprd08.prod.outlook.com (2603:10a6:150:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 20:45:31 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 20:45:31 +0000
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
Subject: [PATCH v9 15/15] arm: dts: airoha: en7523: add SNAND node
Date: Fri, 10 Oct 2025 23:45:00 +0300
Message-ID: <20251010204500.1625215-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B51.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:b) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cfd9e7-ae5f-4d32-53ae-08de083df3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5roVlsex4nXDW4njMVVxn2opM76q0Nn3ZsuO1V221sZH74YSwKDEH6TuKNrK?=
 =?us-ascii?Q?tbupqAHJ7+0YpIJ1LW1A7XiNml1XelsbexYo2ByBcjIkkE98YZIZNROLikku?=
 =?us-ascii?Q?k5QXfznjuxc1sXUsRWoP1trNDGJm7RuamhYTiFaYYpmGudAWg+HHlZ7MCdW3?=
 =?us-ascii?Q?D7ove0wXYyOmN3SlbijgYGVL4i+9x7jsTM0IEIJ72XvYxbFEyMcsD49yu2BH?=
 =?us-ascii?Q?ijM2mVxFOoI0vCUQ5HY2MYgoF2m0Eak41mmFGMFUSUYheicpX6sA6ondRTI0?=
 =?us-ascii?Q?3jQXvx3FWjQAbz24W+mknFoW+m4PIkZu6Zf5Wvn7/DRI7aq5H7am+ekB8Wt+?=
 =?us-ascii?Q?GnGsy9TefUpoFEdKcveOGY8N0jiQrvcvGQnZzhu8SrxDXRsYe11EMCEO15h5?=
 =?us-ascii?Q?9reQU0PkeN/Z9WJ3HbUgDOVGriD5CvTiLupS3+pwU+3vUqeZeqXMh3yxWlAY?=
 =?us-ascii?Q?9tVw0fO3eTPZU0OQg8vH7nZ9J3UzFD/trj+gJ0BhCTIuGiZeEwi3jLIJdOkA?=
 =?us-ascii?Q?/hodSa8JaU/ydptDq4T7iIvMGa51LxJImbUZw5sqO7YS98bWpb2APoHbd2A5?=
 =?us-ascii?Q?sqEWB7OUzxDVo9dYw8NX2O984sRu8g+LYTjMYqtChGhLpgkdmT8wrUtCRQby?=
 =?us-ascii?Q?09r2oB3xFwB00KeuD5pHVPxVXvpqwwTV5cjkXu6DR0yCnjcQf/EumiDbwif6?=
 =?us-ascii?Q?4NdkAqpBUF9W5dHdoOUHL0y8P3V23OGXrOi9YZRhym8dW/7zWBem6XFdgfjZ?=
 =?us-ascii?Q?2i/TtVtgYTN6+ee3owwcfF6Dd8LTNCydCDsTEFCAtgQBxjyHpXKkQIJQ3TjT?=
 =?us-ascii?Q?GZ5u2sGs9Fcb3kQib3mW6K3QRZLwc33rUtMUS9xoz8sZ1a8xCuL72XU5Oo20?=
 =?us-ascii?Q?V6CxvDade2n+lux9SW3VvfxGHqFSjaq2vE/YjTS6eqg6gVir0ije+r3b45x0?=
 =?us-ascii?Q?arPjuIirdeUSwvtmxxlNfZnvjScnImuv9YgxaFgANh2iQwUDA48YL9KaznLv?=
 =?us-ascii?Q?z30Mb55QJ41+H6FoQkVjGrkta8nK2WK4Plmt9DAsEwiGSo4q33w8hIIkn+6S?=
 =?us-ascii?Q?A9AP1RK0+KSl6zPEUcNs8Immh2YASkVpPPhmKSvnwJbqb/MaHRyROrTnAISW?=
 =?us-ascii?Q?JxugwMrJTuWXcjOIbY0fxg1pKg+zKIx6fT/ECznDmmHgHoSM4rqd6lfjHmcK?=
 =?us-ascii?Q?WZlJAl5eX2w7GxPiox2X/eO13c7vxKjzO7kV0HG6SUqk1Ksl1Ktxu/wx6Zei?=
 =?us-ascii?Q?g5MtBRSQLXBdDtJ8vNL1mQ+VlrM5Nv+w65AM/eTaqWfLiYJNTsHH7g8Ab8sr?=
 =?us-ascii?Q?G/ZgdA6w5rKg8UXgsYaKwKXTCEso4gN7/ycIeAQLLay9dAIlAz4yAX8xIuj5?=
 =?us-ascii?Q?cxVH5TT6ED5LQUG+qW2tYLv1wQAsY0K58Iq0Q+TcQWWhnwOflF9Ly/NHiSCE?=
 =?us-ascii?Q?3JUgSX/FuqCbjCBGoPtOhjiKr9/JSxHgbkdSg9cmekM9e0qRdj0a+be2wb4Q?=
 =?us-ascii?Q?11bqhjYcEcYDyePtVAbjE920y6QzvjKWP3Wg5Wh/VAlVkplBJSM1PgWlbw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pkaI6EiNPWEMOEMZNevpIYn9e2ynWdCImuaE7f78Rjs55gA5Zn9Zac6DJHEk?=
 =?us-ascii?Q?bs0loSv24dNJBS89RiAjVd5whTTzU5cJ4oTEZ7mKlG43KDp/M813JH7GM/8C?=
 =?us-ascii?Q?nLywfL6sZC+5Cg01Wdz5q8w02RJ06AxJHuRz2bogshQk0ljGJzD2iNUx+iuz?=
 =?us-ascii?Q?OSZ1TRKTKXcduux8T3eflbYUc/Bz0AEvBe1gA+2NFF0RkTqGOvlE9tUHpmMR?=
 =?us-ascii?Q?IAhYDtwVwC/GBq8eJMuDdEQWbS3HtW+AuKFmdc7qzEBf4W3bJxmm/56m4oeY?=
 =?us-ascii?Q?7uFncTZ5dSVpkoq9v0RPdfp8+GFmONZfBghp0jIvzGxlU+fPcI5QH+FxunRL?=
 =?us-ascii?Q?LfspA4+nRHWFDq/pcYQglO0nsRc3fDHoxDjFufnupXAwhTbQcnr0mwRvM0qu?=
 =?us-ascii?Q?jdCSPaOzGu4kRLzB3DX/JjaBmWxah9jW/9Nm8C0mCOrQ66t+Rvcxeb3A/MiC?=
 =?us-ascii?Q?2SzKEZqvhXkGHfU2Z4T+dZ+9gh0wFZ5rO70MYBFiG3Y+3oezT22PoCNIRB7z?=
 =?us-ascii?Q?XAw/KcqABJ0HlqWntFJom2wKuku+maBHo5CQYeyMvWF0eCAsJlHIZwemfytW?=
 =?us-ascii?Q?pGcLTyae0LbtqfCkIQrz0IOPL4AK2G+GkjSYtx+UftAZx8h1BloCaHEiwmCU?=
 =?us-ascii?Q?D5f63NB3msosNkQAe+s0IeoX+iuiAe1rnfnqZSCI/4UdjvW+RuYiXl43I4gn?=
 =?us-ascii?Q?SJsJDufW8iodU2ypz9oVh6jV/tl9ETi5IpfgPA3X7zVcoHKGq7+sLqPlF5I8?=
 =?us-ascii?Q?/Fz7SN86W4/MsD0zPwuz38Ss71usaBEx/MVZn4cY7IOM77XkKPtvgeDRwPy6?=
 =?us-ascii?Q?zDmILAo1yVaKKV/6UEzx3mEa17KfTKgmWgw3HWJZN4BCHbmwaMxym1YBuUAt?=
 =?us-ascii?Q?YPL84/bclHG6ReUdaijCcGhwpIhgURCIpvqUrZ3A9tTzZvvjX3iKvn5IEhRF?=
 =?us-ascii?Q?jA78M2hMj6wP3KzdnKa1oAj+lyCefaDfNWBwzALcrG2UOOXQv4UY5wUjSZ/P?=
 =?us-ascii?Q?FUVHt0ttFKNhmwnq0EM/BfvHu845p5RbVs429/+RH2iQJ3ziQb5oMbavdrJg?=
 =?us-ascii?Q?/1opwGRko88Mb6jy2D2rrvqost/PXu7n7k+DpTbswQz9H2EirxlKzJrq1XZI?=
 =?us-ascii?Q?qzXhwA8m7pjoUCmZ2p8fYSWMpGqDxZz2KlE5c/Ugz2EC9DA5xlOIUzE+Oq02?=
 =?us-ascii?Q?aZhLGX0gwPNB6eHtS9shLK8nwkn1tOnajFjRJY6Zdxhnkw5cd2ig/6jEqlVU?=
 =?us-ascii?Q?hr1Soe7iuQYy2VxnJniEOhxDj2n+M92oqFjANpWi/aOidj5EUVDQWWkZexeR?=
 =?us-ascii?Q?TtUvPgCnn6aXvZ5kWsibjiNIYPbRExgxVWi5CCpJlU5tNP7n6aVQGV1I5pSe?=
 =?us-ascii?Q?R4z+bE65GXver38Nl+lRYxZ/BoYAEvnP/0AmzqS8Qtm+hY34Q/Em+5csN2qv?=
 =?us-ascii?Q?MG0JC91PqvM0gq/USWKDspesrmeSZ9YZKuVpied6eLd8hgZim5N/V3+uV1Of?=
 =?us-ascii?Q?2QJ6keXk7TGE0wocRY75cXsXiTjGmeJ6vGrCwyIB7ZtdtwwK8LRupuNlM5Ge?=
 =?us-ascii?Q?H3FvhVnyqcxO5uC9nsW0mLkh1H0RRsOIMl6zb+El+gp+4V12EyBTQ0q4xzzm?=
 =?us-ascii?Q?1n/DpxRgdvJ2k0B4RxjpRg4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cfd9e7-ae5f-4d32-53ae-08de083df3f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 20:45:31.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/FJwg28f5Y72H61fbrVYe+/kzRe+JmSKy0UxLysQ1H3LGFsXL5wpNVzihe9RoEIk2AKTOamtEJlkxPc16kyy7aL5uGSLh/8YYOauFs7H0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_134540_485392_0BB2F377 
X-CRM114-Status: UNSURE (   9.25  )
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
index b523a868c4ad..78e351eb787a 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,25 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
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


