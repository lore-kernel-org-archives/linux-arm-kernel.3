Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C94CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=; b=NHQ10rAffpbXM5QAknI0WWsb4h
	0MGw7JbEFQxuZOrCiJpTFbj+MCrz5Gy+LmDtUswg88HzMBa4HVNnGMNNG+lh2Y9jniVhWBhisENwU
	AqjksBN34Iw0Ll5TvW1J5qpiic6GZV7HM+CSfeqzNa03k1598rauT+bVNYXf8sTZCffJCAJCWwEQ9
	fwsrGigVY5nLb+63H0ukM6JAVBazSPp6EtmUPWv1t8eWqHYBBo+Kcx+g0CkaPXG7hmFUIYhpMY5Fs
	SAlmmbnow/VGf0hVMBYSml/bf9EukbdZlFkZbWIA50XKm/ElN8fO5K5Z9A+u31bZtyEbW3wvzEpa1
	2qTwzdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifp-00000009DMR-35gh;
	Fri, 10 Oct 2025 19:21:05 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifl-00000009DCF-2s6z;
	Fri, 10 Oct 2025 19:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSGNLY3Y6goISU58q/7V5uaggY9srrgWqYjv6rRgyIutysyPZPSvhzFUK9jVKSY+co+HwBHrij5iBeidnGsH2YE3xfYzBzGHhUMOCgGgsFbXHDn5QJETKBESLDLtn1EKxVm0oNi7lWIJaf8veyMiv3bfjBhE/klVOF+sG347RRVlGDcQhIe2iBcP+qQQxo6lPoE4UcjNbL2JSdMcrDyymNgaL++azJidyCsdgwGE8zYYf1hTj9Wx3d7K1Rk3YZ5yIUbl00e8yFMhxuEuQsgWL9JZ++KMHODvcl/HviN+vBF/dJ1Os9apEK5rBUHLgKgfNClbkK2UuVEdZkgCMQvRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=;
 b=aVR+WKqwTqFldMKtuOoypwBhG5Gkz3ZaVZ0PBn9IpvjBvix6tMlG7jwbaVnbLQpbfIh2dnzXv+jsRNS7hKizJP3nw5r3jPXNTiMgekHy39waw/FFEZdrmcDLGW7vAI3lsAOEQHZ0kwJEwvyqQ/52S43mxvz9noH0ZJwzxzXqsPs/bRR0IT93mYt3WFZloSahnTbZnHM7B6R3l1uN4cxJkqWWnxzrGk5S5qs5OXyu+L9hVuSs4jsymzU/2JDBNekIeWRWCWWJAqAii/KPyR/92+riwesKcPZAXZ8iHuQ3BBG2huCDERTefnfOCwYiAxfdU4QfNiADRVj8EgzlkDaMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=;
 b=qXSiipn9fugwi22bVpqtrct1vgwJ8ynTIthXIj6OnPtFtGBoqvhVCqLYU3C61nhx1/s0sgbIoMbf1sNSsJFpCSdkFhFCXtgxrAKBwlvUXm+3sC7fIWssosT+8mJtDV7GqSVbZb2iJJTfTtJkW8klWXhsNlPkaffNyb/Z6StnsJtLhjDnGPWsZ+FWwLIREb17fUN+279Fa/0cyEdg9pk4TT/qUe53hwx1+typXWzJQdfS70VkHpx9so6Iot78pCZeY4mZK9C3P45vr9gQMhR/nSaZuGEa42LWk1QHhZpaurFXuYaPKTas/JBRszGsGgv8OC6n2TxDXSe3GO+LNqBLfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GVXPR08MB11352.eurprd08.prod.outlook.com (2603:10a6:150:2c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:20:52 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:20:52 +0000
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
Subject: [PATCH v8 04/15] spi: airoha: remove unnecessary switch to non-dma mode
Date: Fri, 10 Oct 2025 22:20:27 +0300
Message-ID: <20251010192038.1592889-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GVXPR08MB11352:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcb9b28-3e9c-46ad-f222-08de08322073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UPiw/0Es/zBxrdRDXy57i/xofHZN6g3ZmYuwj1O225bQZ7inyoxzNTR9wTlN?=
 =?us-ascii?Q?wPwqb3xLxlj4R/p3r7M9DWuN3uAwUoCLi/jgZlQxi6DvCVpPrlBt93K+ghPa?=
 =?us-ascii?Q?8xZ1117LhQQPztRsdCZrpQJ7M/UoaYk61fPWIJWoUJTBJnX/vnQBh1nw6aDX?=
 =?us-ascii?Q?uANK6zb/AfJEHnHo8tskpmUCYq6ilQiWQaffdWU9zY9HM7tlo7N9C8wVR1ty?=
 =?us-ascii?Q?Q1RN6JeE7A7Pfo6l/TkKD4Tpo8gKk0qzKWk4BaFcYulvmNKlBaONw958u63I?=
 =?us-ascii?Q?gHG8qVPb/isMwLcaaq7L7hjSNcigsh3w4G+Nhan7xKILUJ8s5rlvhTFiKCIU?=
 =?us-ascii?Q?dBg/0wJyFppZmB8eI0os8z0w7AEFZRJdAPQ3L2OGatn4O4iplEblBaARbfl2?=
 =?us-ascii?Q?WhvnZzQ6YZqU0/AOES4s53D7skdtF4j/Q9UM+o/s33xOVzSOgnvpwWIk9cXW?=
 =?us-ascii?Q?mTiJvhmxawywseLQ+qzhjjDYANmxIgTsIbgmsup+g7GFKPD21tb89PzVi5i5?=
 =?us-ascii?Q?75rK7DhzLhZIHPRUAhFpruq7IeJfBhhaw9J3zzdVu32ffWeGTP6LIQyUU5k1?=
 =?us-ascii?Q?h7K0LJUpUS96FnNU58qfoFVAufjzhite3mXGU22zb/UxFcBuxT/sgbJOqfjb?=
 =?us-ascii?Q?1B8xcTFHOLxkKSJN9H+jP7Qet6aEq90tFBakZvRrvgYXDRMxWNDFyIUjHLZ7?=
 =?us-ascii?Q?7Ax0x7Cm4ZONA/0rITbyTS+pxZMMP7MQ/rzfUhKf/xiFoO65xgwi9ctvi+mA?=
 =?us-ascii?Q?XNDX/ExlTicvILcfY2huvsOzca0lh71JPT9Zp3fcCVbPnXcZfHa6cryeTuoC?=
 =?us-ascii?Q?T03le1bo9x2snAj7GvUi93Nyec3ftoyjQvZXYWvsxHWoRpyo3iGfs5TlZKXP?=
 =?us-ascii?Q?AYe++Es3/i6tvqhxjKpy7yeXMR+lWKU5Tx+1cIzrsMkS8v46y42nmh+mk44q?=
 =?us-ascii?Q?+VfyyGG/5KRoDxkchkS/r9FMKIimNPa//75AoPVJ8IIH9hF9tjfUUgZEEtQ2?=
 =?us-ascii?Q?bIM9nE4LJ6MtKTl7DzgGFEfzImk1Yrw/2kXuQy0DR5qZndHNvbHaqKGDk8Ht?=
 =?us-ascii?Q?J9r2/NIXq6HV5rBGlPHf8t8XTu+WN8LUnAhJKeRW0clqI43c2HKFaUpTD1Ce?=
 =?us-ascii?Q?8VhamCbA2Z4PQwiuHbnPCPKPRgnRudiVuBfB8CqJvsVEVVD3PJjXmjR/JPRY?=
 =?us-ascii?Q?nTvUiZw98GppSHVeq/K8Nyl9Z2Btnv5qO3W9lvUzCP/88+N8U3ss0BV4czbr?=
 =?us-ascii?Q?C8s1BqDMi7N9Su6alQcTCKGKI+O4O5YUMSybz4VLQH8pos1iiEvm/0Oil8Na?=
 =?us-ascii?Q?DnbFvdvH8nUdK5vw+k1yo+ByLnIOvY3wCRl8CdwUYq5UFb4k9HL+kSemYoP/?=
 =?us-ascii?Q?TLy6BImf2LvymG/dzXW/850NgZdFUYCjPJ52yRkdYm5ZN5STxWkePp3dJqrm?=
 =?us-ascii?Q?EDrpX4IQRexqLpK4jmdfIH6WkDmzrlH/wrTeLP4wKtpuGTglNfEbIxr+J6jB?=
 =?us-ascii?Q?tFbGbXy67iw8HXDLGYkBSXjuaRI1/MtN13NUDAm4LdXkb/knNqgHvr6UxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M+UVU6lc5YwZoBUmyCWg8kS4Cu1oRH8iimPwSrZzOQqTHQpAAzdzaVACs18g?=
 =?us-ascii?Q?R8qmUvhqE4uVJMtAqSQKYsbooEEkm1rMvhzEvk8kG3dpFG8AXoNipzCXBWJR?=
 =?us-ascii?Q?q26goHrSrxOwGqkr0nydSs0WGl7Ky66SPZQl5OSiD1M/kA9YIgf2HRPiAirK?=
 =?us-ascii?Q?nXT/ru0N6+dNg2uPKZy/wWpaw8IYmcTPoXGrfjGtnpGamzPRTQMzVU4RpbLj?=
 =?us-ascii?Q?pEGXHGCtDMvaRf1bt0ZV0o8d3HtPMWIEpWxs6/ljREYCOYFRHD2zRkolXcty?=
 =?us-ascii?Q?SQKRlhNgDVWsEydfSIe6nPjoRdElfc01MgZTEsky5I5vfK8pr5S5O9FaTTYH?=
 =?us-ascii?Q?6Monf8x76Mvqo1zk/3q11Cr1jg0+UdHDGuqZ2SjsdQl02Lp4F7OAUxXB0SeW?=
 =?us-ascii?Q?NwWlJGy+iEfLX4OJt6osZk7e+SSEflhDUqdlrmv4cs07zAZcnEQV55ejqUQd?=
 =?us-ascii?Q?hKEnvsDAAnK5DYvViJdjjtwwbxukDT1wtpzrgGSQOzfge0WpM62HgUwXgsq2?=
 =?us-ascii?Q?HwrKdM+B4ZKQ3L1tZm7c8sZXpqgrDwdxr1kf3Xm7ITZqIdKqStE6iKMOW11I?=
 =?us-ascii?Q?afX7M+YFIp4jFauj/Tlc1afNQKW5sSGNFpPUfO8IYFbtNWPJsgs3i5QJPJzR?=
 =?us-ascii?Q?8kgSA6Vlrxw+0iktDn57BRqUnBHZaiq9sjAXJzijqiqGpiLXcMVU/jicnb+g?=
 =?us-ascii?Q?Niz08DdoQw7LzOhTW19q5dPzJZkbNfDeHG3nR5E3VeLX7eKcTI68uvgjZ8Ie?=
 =?us-ascii?Q?Kaex6qOWhP0lSHHWcMczbCuurIb+BGyGHZ6NTq0H6AhLRs6AtgzgJe+BIHsC?=
 =?us-ascii?Q?Acpa8XBIzzFKfdRt0GjH13IyRE+MlRMdb41wYizfh7/mUEwtJfnDyf/9nQKh?=
 =?us-ascii?Q?V+ZLpkSG0YFoAMe5mq1w8LYyFa71agHqyU9OwwjB2T38UyXCbONguIEYMDZ9?=
 =?us-ascii?Q?kf8oJS/Tm/MnCVUA1yxCKi25HpPF5hCY0lp+2ni7jNJgWWC5xfM/ZsS+pAr7?=
 =?us-ascii?Q?/RX4TsVQLSmZGVMhsvnDkX5aRYbhZXQG36efFx+7fL7xWP40xK4F49RHid/w?=
 =?us-ascii?Q?CvY0temlxzvr6tA1EP7cLk7iziuV93WIU24WPOKmoy01neGBUPHEVfzMjFNY?=
 =?us-ascii?Q?b95GNwFp5pws+ISNJ1MFdvI/B6Gyp+mQz6a+LhOSOAe7Khgup1rvq3UGqIrz?=
 =?us-ascii?Q?RJN1MtOIJH/mdFv8xBwFdyNR0rAMZfemJWE9kcWlWuFk0J3egQk4TyrdbIy0?=
 =?us-ascii?Q?BbAucREhMh+f0y3DADwmQmKu1OINyulBwNbpMSx/QnFL8I2tc585EczauW/N?=
 =?us-ascii?Q?XjwPibDVGC/P5T7lYalIL01Fu9QvtXvft4xNzsxGjk0jc2QmfLzHh0V3mcnT?=
 =?us-ascii?Q?SsfFbP1RglyiZaPDi0CLGkVCOiPLeytAtEofR92L4vdaqoyduUWTd0F1KsXb?=
 =?us-ascii?Q?3LN5E0BGLE8qG2huS7lFjxK1BKXYCwZ0Gh/h8EAj3pB0zGrd6K7Gh5d5scFt?=
 =?us-ascii?Q?S5Qx/j2wZCqK3nvcLPTnNp+P0vfbkfp32AGGdJU+GwwTEJ3/VLbaH3iIwydc?=
 =?us-ascii?Q?piiVTvSLqDT5DTcVGJJ1bMlG1wXvy97HvRoDCBPruHBA1WcBh5RpXUO67xEy?=
 =?us-ascii?Q?az5zObHp2rm1Kp+XfApaSvs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcb9b28-3e9c-46ad-f222-08de08322073
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:20:52.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4C6e6n1BqacQzGyDkT7Bu2neFzNolWFJN9R/UiokpiYhygwyXGUu0p7eboTDep5NwOfmmuA7nM/w0sfqu8AOtZwATRjnW+441VRwVUrPls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_122101_734422_D22FC3AC 
X-CRM114-Status: UNSURE (   9.32  )
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

The code switches to dma at the start of dirmap operation and returns
to non-dma at the end of dirmap operation, so an additional switch to
non-dma at the start of dirmap write is not required.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index fffed26ff990..2d86dc62dbde 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -812,9 +812,6 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
-	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
-	if (err < 0)
-		return err;
 
 	memcpy(txrx_buf + offs, buf, len);
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-- 
2.51.0


