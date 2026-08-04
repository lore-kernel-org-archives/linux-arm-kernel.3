Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81BAC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjy990M4bf8kYc8auoyPQnXoKKMnWx+0BMI0Omq6IN4=; b=aUWT+8Gs6Rh/50i9uLER1qfyN6
	SspZf4wzhYhU5SK25FlTfWZw+ac6IqM4mEgREldcUtZF3wZFieg20+5zbTle4TbHV4vk0i1O6VvgN
	o4G3IyG/A7hb/VVM8gN97OBWJ7sTEZtUaQ5vdWd/VSPFw+ETjp2Xl4HuZpUSRWSazztgxd8nKqijj
	MybMzYDNDKXxJCSYPtEy4SYHpdR1P0jMFpi8u3YXJZA9y/s0etIPwdfEvOMlDeKQXGvm01SfEkGmV
	z0R2wjMFrdALz1/+hEs84QCpGUeYla+fwBUQuWCfd+Otl5AYp7veu9DbrpVJp54+PY7FzPIIcXcAF
	1/MStkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzZ-000000023FP-1WD5;
	Tue, 04 Aug 2026 14:19:41 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzW-0000000239S-18eN;
	Tue, 04 Aug 2026 14:19:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh+PpQlVoDU03qCm5roV27Sjxs6t9eoppTY/V+PNpCUATUltP437RGsEIGa7merUqvHNE/ooTWnxoLe5BhhnbOxD0AR+bkZ3dCvMgQrZMhoBaVZVz1mQmSNF3LhqXCCBTbom/8rPtirwMSk1KF6a3H7nnDROvwFtFj+sZVbc/MYwWCcWgGcWkdusqQQtDvhuEeL7c4tUYnDA/syYyOarPx4kDe6i5sb+wBQpdF3K0Lm2r5DQv7fsQNsXqCYexNypJIBCNU2/R9HTX+ZENqDAYgRCYq/hnQFFGkEGC+I0x+zSOvKA3Si3SHv6+sIvX5Q5ZU/V++ivUhOn6zrDMUHxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjy990M4bf8kYc8auoyPQnXoKKMnWx+0BMI0Omq6IN4=;
 b=SaitFs3/PArYWBh4H9PEbtMBR3cLVQQey9BeWBZl2lrePGetNkfhtrYoaxUSxYV6LKfy4zKmnZ5CGAL9em3pTgoLfCixAteAX+zIM24aHO6NWakbP0Uxn/W+wbqbtEzu5Eg4BUHWLbhjHuWZd5mBG3/hL39LocBfFG9+Ff2FoiznVgeaZuDNYgwvxpQIx664QdC1583AaMClNQ085rC1WHghu6OS/Upp+VIhopSjwr1Z3dMUF/Yfi/o29bjNStVq1Wp3Lbd7sgfGJ4lUDMP5j4sMSrsQltnhAu7z2NzwDlPK6s187BOQb8x5NOAUY7yvQHzQB1hGrbx5mel40VLdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjy990M4bf8kYc8auoyPQnXoKKMnWx+0BMI0Omq6IN4=;
 b=aE9fsKj5s/JZOJUcm6ODSn/y3EkVv89km6Ipvp+Gb1MwSc1zOcqUGWd0nGGhFgC7xDiZco1wT9XEiMoqLHHav4Q0NG6HwIBftE0RSuY1lnUdk5W/7Yo2fj1jrZWgi+1uHZUQP+QwWmku8JHGD4hKiyOFlBzNQV3rBoZmcy7mnL3Dv7au6kEm6k6j2ei1qg5iw/gDHTDIwfZVhn7diLCj7zsoG72zt50HBquip6awslYi5i+9kB8UY3d2id+gLS4prIGreWCOP5pn9qxLNwYpSMZUz1XRXeTSIECxq6UKEGnbcp18s+dUSSdWPYRmKut9wVnsQg/FF0DF5tAJ764xFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:19:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:43 +0800
Subject: [PATCH 08/10] dt-bindings: mfd: rohm,bd71828-pmic: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
In-Reply-To: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
 Zhang Qing <zhangqing@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Julien Panis <jpanis@baylibre.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:297::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: bca5e6b3-93a0-4720-f2cb-08def2336674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|7416014|376014|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: eNRt97FqKWr0MhKsR4jAq5Yr5+C2LWpjiOmYLzyJuxgqEyLO/MhK9vOg9xM2vQQLkwxDq8VjXlg78yEoBmoitN6lyNLgj8KXA4oAiGcUGxVZJ+Tkf3TsC+TbBBaJOsCP/YXK7/Ua0deQZZP789Yy+KOfAODdRIXWtOX/NzA8isrRXm1byfFRciJkyDwjdfhAtgL1fwlzAV7PB98oGBCO53sgX9oYkUlLJPD4T+cpC1jRRMnjjcgHUFI0W+93lDQ7JECFI8SERTcTURtNjTXA6tXFbUzPV8rrv/lU4h11Ag0VgvHO8D1JKybOXP3F2S9/QIXOhreyif8vO4iSodReJLMwIJdeW7m2d62hMPtuu0C0fqWwPoDy+CZYVByaPN9BslaQff+NEG4/SzOJ1OkVuHi4uAPWILwisZetGiRYPShnXjDyQ0wBFGQJO8hFDv0UZONUlDClbrMRr1knNt8spmZpinP/FdNcOgM+DBGijf69Jn79QbYA6GFKcqfcyJZxKuNvkDvh+iEzLHJ00OklRM9yZ8wMZBmLTuBkLfkc7JBnVU+AIDrT7ooTxzPeTjTd0IlOisE99fA5GR++oCxytJxCxvszm/ApcWIUWSvAYc/k7ZQ5ZYN5lnY05AGf5ADn06vdifWqbpyPAhtNPREFxY4qMz4T2quYQ1jnmSbCC146fXinMy1Njy6LKkDysci+W3+Y1Wrt7LrSzuJ3bcCgCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(7416014)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxPRnFwb3NqQnFEaGswVldueUh4MVQ2c3pnRzBsZU1iOWpJU0NHM2dYU0lW?=
 =?utf-8?B?c2FFUmdGRHFzSFVFaXBCUkF5VWF5cWhnNm5yMWhRNDJLN0JPSVVmUm5FaWNU?=
 =?utf-8?B?ODFEeHMzYklQU2R1bFdXd3p6WXpCVGgyREFGbG5UcXpTdVhsMzJNdUhIaXVI?=
 =?utf-8?B?NjZyZVhYYmpHWjl1R0pVUFluN00wc1NSVVlVaEhjNU1ZYjhRcjlyTmJ4MmE1?=
 =?utf-8?B?OUtJaXQyb2lTT3hETVgvdFdoU1NzNXZjZG4rMkVMMVkyWXRBcS9oNTAwanNU?=
 =?utf-8?B?QWpUMy9UUnlvS2s1MVZuUTNjZi9rSVl6NmdwT2lzOHV6YW13Nys1cXdBdmVI?=
 =?utf-8?B?MlhlbXhGa0paYTBsRHlMMkg4QjF2a0VXL1ZKL3hiSVZBOWptMVQ5V2s4L00v?=
 =?utf-8?B?Ui9nMEFCbHJpbWE4RkhDZkNhWGhVaFJHb0wxeklYdUo2QTNZQnZaazlHbDhx?=
 =?utf-8?B?alpBMTczeVFZYUFhbUgzeWVyaGJWdU0rSi9JVS9jMURyV2hLb2R2Sm9RbFhU?=
 =?utf-8?B?aUV1ZUJ2bUh0b296TU5mMXAyVDh5ZkVHU2k0alJnQW1GZEdtYzBPcVVYUzB0?=
 =?utf-8?B?dWd0VzRLVDR1MVBURmlUSWF5WTBoaEFlZjRiTmtlSVl2RnZhN2JXUThRYkZM?=
 =?utf-8?B?NmJOcERCblJYNmJSQnpCZEdrMHgwVGtjSnpuM1REUTEzVWowSlJid2NITDQ2?=
 =?utf-8?B?dVh0czViMExDeFNOQmJEMUR5WGlhQVJSUTdWQ2RIN04rN20yeWJ2dXBINi83?=
 =?utf-8?B?NGtEQTVtRDJCTWcvcUw1SnhwWU14YTVyTEQwVVg2NTZUZHNtczNiS24ra0RJ?=
 =?utf-8?B?bjJid1krR1BmSUI0MjIxYklON0dlc2YxVFpiZE5mNTgxaUFCK3lKVStFckZ5?=
 =?utf-8?B?VmZuM3VicWhiOFB3QXd6a29IS1h5ZEFzRFpWanBzU3ZoMXorNktUeUNUTmNW?=
 =?utf-8?B?Sno3aDJ3U3JoVkpGeHNMOG5tekJrbzQ1UmhJaytWSUV3WlZLMjlTMFA0M3Rw?=
 =?utf-8?B?Z1lEWG9JUDBTeFNicE9PL2NKRmlKYVkyc1ZaV3R5cVNpQmkvc0J4TFBmUHpR?=
 =?utf-8?B?V3czcGJEdk8vQlJRQXY3dGMrWnpVaE5wOElwT0wvL3A4akorOFcxSkxUZklB?=
 =?utf-8?B?dklnZ2psZ1pSdEYyekZZZWxMQURCVmYvb0pWUm4yZ1pZY0N4a3RpNlZoUXhT?=
 =?utf-8?B?azZqNHZpK056VHRDQU8yUDlRVkNWZ25RMzFjUVJ5K0QvVVVWRmRHVDBEUXlz?=
 =?utf-8?B?Z09XSXB4eHV3eXdDUmhRYmFDTkRTUVBKTnpRRE1jNUtvb3J6cGtya25tK29Q?=
 =?utf-8?B?eWh0YkdRQkRRVU9nOVRHWFR1elhMNFFha2YzaHJHS1I4SnMxc2ZXbXQ4aVZG?=
 =?utf-8?B?Y3o3aTZqVkc0R1ZhRFFFcXE3SG1JTUxPVEM4V2xiQ01EQzNoZmtUaXJ5aTRV?=
 =?utf-8?B?MDRPUHBlZW1xWm9ZclZkZElRRVJUNy9XbjZacnFNcUhDcW92WXpFTE9sQkxy?=
 =?utf-8?B?MlhiUmZ2T3djTzAvbjFPcGh5WUhHWVphTUQ3ZVhQVjlWOGYyRTBBMDI4T2Rr?=
 =?utf-8?B?WDlRZm1JUW1xWitxRk8zVnRjNktSOWRXaXUvcnJ3N0Y3cEJZQy9rZGNrZ3dF?=
 =?utf-8?B?ZHMwekx3eWxXREhTczJSbS9kSlVucHF3RGlCblVHQlZKZWhoaFhkQUpuWEVO?=
 =?utf-8?B?WFdyRlViNXFTRm9RMi9kRDAxK3hEaytVYUVmQUw3VzhRS21FdzJkQ2JhT3NM?=
 =?utf-8?B?SkZJa2NDdFR2YVdMbXQwa1l3VzlkL09scFJqYVlpTExSNUtmUCt5azNZRGxG?=
 =?utf-8?B?QXNTbStNRWVJNFBrZWJZbDVVaW1ESWlaMUprN0hKbnBZVUI0TktVcTE4Rks4?=
 =?utf-8?B?cEZmOVJZN0ZtN2NxUC83VDdLb3FUU1RzaW5DNGM1aUUyWmhWQ2JpRDZhS0Fq?=
 =?utf-8?B?S1B3V2lNMTMwM0NzdWdUREhBWWo1WldUYnlWMDk1U1VVU3B1MCtvSzdrbnBT?=
 =?utf-8?B?ekVic0p0UnZac0h6KzdnMEdMUkhmelQrNnpZbU1WYTk2Zm1XUm9PRnRyWVgv?=
 =?utf-8?B?UjkrQUlGWFpveDF1MHB1cjFkR1M1V3BqVlNTQm9MY25uejJIZkpQZVV4OUUx?=
 =?utf-8?B?SEtMOVo5eGVKM0Zzd3pwR3VCZjR1ZXg2aDhQN2NEbkZoZWdrdTU2ek8rZUpw?=
 =?utf-8?B?dXhvZ3FYMVQ1SHFMa3ZIYkE3SnRkU0pWVnJYWmNIemYxY2M2a2JJdWpZNjI0?=
 =?utf-8?B?K2wvTVVwYlhTZE9mTkdQMHZlbFNPTUU2K0g0SUhjeXBHYUVhajlWQlBvWTBi?=
 =?utf-8?B?bXNWUVJJMW9KdnJJSUJydEFEV1JuNlpiMGN0eVBHMmNGZ05VeUpKUkhTcUln?=
 =?utf-8?Q?9Z+oGeNI5ZawrT4tUuIp7qhF31ZvYeu3sBZZw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca5e6b3-93a0-4720-f2cb-08def2336674
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:31.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdpion35vc9x/JZ9wsexStN44DVEf42p/Ukx1SFw1mFBG1l4WtNBUE17lIemX70vwgC7a5q3e1B7H2WlySUnvVXVnj02Kzx60ERs0OUxu1kSHIFoDOZgNqJErAQmS/bV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_071938_322761_69DB99CC 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 09e7d68e92bf..9818102e02c7 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -15,6 +15,9 @@ description: |
   single-cell linear charger. Also included is a Coulomb counter, a real-time
   clock (RTC), and a 32.768 kHz clock gate.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -79,8 +82,6 @@ properties:
       used to mark the pins which should not be configured for GPIO. Please see
       the ../gpio/gpio.txt for more information.
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg
@@ -91,7 +92,7 @@ required:
   - gpio-controller
   - "#gpio-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.51.0


