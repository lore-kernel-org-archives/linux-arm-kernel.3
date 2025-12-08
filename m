Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A465D3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1MCukoiss2G1dgG1qRKQtdLybvEJbz6D58WhwOw0gZI=; b=jUSofxmFv3rIhk5hls/uzNQ7cT
	ul3F36CC7LxGoU5Te0Wt1igrJv1aoGS3dwo8V4KZPEiZ/7EOMv9bFFK4gERbYpz4J0HNks9AP4PnB
	mnctGl5DxW2CS0O1ME7fri81JAZB6woQt20V0MsF/mNfPkp4Kobc71GZYAEwpol71nBOnsxWX4hZU
	/7PPXMKzL6Vs3Kyl5XLI7zZVBBHfy/Sk8qJJCbJct6Cc4ZAXJBwWNzqJkB9ee7ny/+NPnoDMy/uIO
	rcxwoJnGjSE/SeJj4wjb//E813Kxs1ymyGJk9gY+X29jxDzuM2NGOUkjc3+FQlW0lFU6KECNiNv6T
	EFDEraVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUrg-0000000Chk3-1lmj;
	Mon, 08 Dec 2025 06:36:56 +0000
Received: from mail-westeuropeazon11020094.outbound.protection.outlook.com ([52.101.69.94] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUrd-0000000Chiv-0Gz3;
	Mon, 08 Dec 2025 06:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyG5fckAFfDqiFQwiccx++XXU5yTexcEOi06pgB10p6BiUgMip0TI76FKoIn0mkcNFMFB3tEeQp7u9DArUhFZZQxr+Fa/cpohvn2iruOP4nKP9whkiBOnCabSbqMkRAoH3xkvc3EMZk1Yw3j2xpp3rP5jrM+eKXoQXHmAE9+P2vtmZOdYEItFHN69Rvi4LXyj02NHNPhrm1F52wmpgC0loe/Hhl5GYeaCTpTNMVqX8FOaZcH+68f3qYppEB2WbH86ABvOxhA9VXhrJ6xglyeIpJ2IfbPMq1kVG7xJeLsJfZuo92W3wI9VocmGbmC23NlYVmX1VUWme9+quuALHkmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MCukoiss2G1dgG1qRKQtdLybvEJbz6D58WhwOw0gZI=;
 b=oz0NkSKvewsVXkJm5xcYIEvbep2CoXZof7zmfQR8HcLje1d0ZjITTQ7qenjmgW0KwpFfsX4h22ug3UJAm2anH6tquDJLkrSZedTj4fO0AFihssqWR59Jw6KQ+l62Ejii+1HrCrIduRG+m43NPhp7RYXb7uN3dYj2+O9nCyKsjXliBowAe208X5zP/ps9ai7CuNdT8oqBChW+Ej2Lh7yJQB7d9zrGVKXqMxweoz8DI/pUb+KvbAgGD94zhmXGE2kltJhck1W8lHcy8wyzY5bonzYpsDYxJ++DxF/ZOIZo//OliOZSBbMt1D+hiZg/zMbLY+b3zQqlSIYfx6RV1SiKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MCukoiss2G1dgG1qRKQtdLybvEJbz6D58WhwOw0gZI=;
 b=p7BeHNpX0P9MrXlNVVbjSvxDJ549UfyZGSBrQC+10PvTILpZOP4iSzhJAbfrS8dyo8Au+dLLOINGp1hGXWmgNwJ7kYbqyGnxB3cWrUPJMR0Kv7Ge52zrYIKD9mNeTdHzqKHK00dsbMqw0K/fRQ3LHZgo/OhJ3HFDDta52UqdoaMx/4B7umptZc9nLVxVXyQS305cWwDWBVaNgQ2DJgKtyG4Pro5MZ+HaC8IqYiR8W9sjJJ+XwDdmJELAZX5Jw3bvZD8YkJXNHVxNq8x5rjzoEDh/03h3zqN3hC3xRnjHL6rjNubgYsaDuMab1k3HXyIWbm54AScbc39srpdTEVYAdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM0PR08MB11704.eurprd08.prod.outlook.com (2603:10a6:20b:745::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:36:47 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:36:47 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v2 0/2] ARM: dts: airoha: en7523: update dts
Date: Mon,  8 Dec 2025 09:36:36 +0300
Message-ID: <20251208063638.3009460-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM0PR08MB11704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffebda8-c787-48aa-a643-08de362428ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dB0SWW9yZ9VWA4e0F/BrvLJfbJhIgUvGH45k5brXCyq68fb54jsgJXGETUkp?=
 =?us-ascii?Q?QPqweHCWLUYXTdAZf7TSDYhNV/lowzzpTbZuTqqtgW0/aZ9GufJrEvxb3Bw0?=
 =?us-ascii?Q?qFBJeOs+xHedGUBnaOmmtTz/YMv9fN1Q+3LWd7UQ8lWGwFQWtdxoyqy1AIGM?=
 =?us-ascii?Q?qlA+NOg8q3vqBG3XE1vOoj4uqstAlF15VUQiMLshI6TQ4qJskz1vRmKOC/hk?=
 =?us-ascii?Q?1vNhVkbf9vBIZYtNSkkrZdOuzRo0NWrnPANXeiL6Q5vOC82Gi4arCt+N5qoa?=
 =?us-ascii?Q?jA0Lv3JwB7kMsEOuOvkmTJj2XNtsQl7QFHfeqnH+1WkPylb5MLrHBlAusdRV?=
 =?us-ascii?Q?TPgxo+7B3C/K5/BWv5JTva4/4Jnc/MUkAKLirOplgaju+xO38TLytVh0+psj?=
 =?us-ascii?Q?7lKUd53J/9hn73H9gr89+cU9e/tKYHjRjxLIWXGEqVX25CZpK7pcEhqhgLor?=
 =?us-ascii?Q?gwlmSE70vZscOfJe8fb4hyuOEkixbB44k7FumDRETpjvkVlKKt5Rj2wa5HQM?=
 =?us-ascii?Q?5WL+pBMRSlOJCVTI/CsMrY20+zBgLkRXGApT1F8cp8RCAZLw0v9ceHqZ9/1S?=
 =?us-ascii?Q?pp2oUZ9LpBVqz6BQqLUmDiD5tUVSbu1hudBpknwCrcmVJOHDYteR1J/1NRO8?=
 =?us-ascii?Q?0YhSh48mMt88styH+fjTDgyMm2NVjMzCOUC4Ca9y+iAISA5PeoBfDQeB0ezq?=
 =?us-ascii?Q?vPTXEY30vdFIrIJ0LkuGJNeIQwwUv9eXs0XAoQ/7UxwP3Te/aP5yjwtz+M4l?=
 =?us-ascii?Q?ctRtEk3Mqv3uATTmnVGjKK58ySS4p+BKlMPa8kfmPeOxLJuJdg9pCSNy/Jcm?=
 =?us-ascii?Q?RbkgdrNq0OB5xo5G74PG7HX9KdBiWVHwgdIUbiO2MyXjaMWMX0S/N2/QwVRy?=
 =?us-ascii?Q?p/EQfD0FtTQT5iFteBRvfoZS/UgbUC2L11Hw/qjNoY74X2Ons71JGdf9ikCs?=
 =?us-ascii?Q?FrzGk5NtHq1xkcRY+aQUfPKz56Vtjd4PRakA7B3Ur0ikjGXNgxqIgmAlKk0Q?=
 =?us-ascii?Q?3LNeuQ0tdv8OJ1GlLWS55ChlvCbktiz2tQAGr8o5M2ucJ3yrMyghFPeiLh6t?=
 =?us-ascii?Q?fSpdLUI0TDOT39DHG14KWVcjL0J8cLV1BdzuhATwbPktQWfG5VY9x5l1c4hn?=
 =?us-ascii?Q?9NeDot0Amccge88d72uYp4ir01IveQB35oFv7jsCstqpDq3V67u06rA2lkwL?=
 =?us-ascii?Q?zTj9IPMHuacPifkxXb58Fan+yv7F/tcwRaopqV64q1tZWBKer5rN4di1vqxL?=
 =?us-ascii?Q?o6DZAxTKaH3UFeZ3iZ5/ewizjBqZHfOe0HWR0wiblrSPXvPNcCqaWSHWoToD?=
 =?us-ascii?Q?MfRxGSZJMA1fgveaWY3u9zTTDWOLEB2oanLSOjw+tA6WAxgMD5XwyX9GbCb4?=
 =?us-ascii?Q?9chOLkbBKiUGxULHthbNSNRsh9z9a6ZuJ2OV1GX2Ytsv5RylVDrxcdvokka+?=
 =?us-ascii?Q?89v0bmbyuQrqx+E3+GOhMaBnbVpUVhNSvUNX0IF9kLMw9OM77z3JzDqxYw2z?=
 =?us-ascii?Q?4LKx3cKrd+bl9PShz00T+G5ZVs28s4Mg7Qz/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L6yWhzkO0aGdNKTn5tt+h4km3B1BZiaLct9gdHHtTFSgrX2mMt8H1Qs9CHeq?=
 =?us-ascii?Q?SjDLdc+2zBrRg39gz685KrNm1ExiuiofaOcoivVejl/Ygy3adqMvMu472Y5a?=
 =?us-ascii?Q?7NWeZjUx7jrpETSW2qhm8xFlIRuAOeD/nJ3BWnLdUfAK2QGNoetTg+UG+XfP?=
 =?us-ascii?Q?XuFbj4m75I27tAC97LGq5CUneedhdSmryJ3ghMh3gLVJPo7qzAaerXEZoDmt?=
 =?us-ascii?Q?S8H1fEpVy+eFITdUiG2lborOsju3486dHKOicBLezqVyZmS3Itkf1YFvGprh?=
 =?us-ascii?Q?i5zxGWY9nbH95gJQBLIbcx+vTmD/X0idZxO32Nel38xG9uL/0Ldy3/C4GtIL?=
 =?us-ascii?Q?HgUC7LGxmU14uRkrWjBKhdqv739rT6j00UOS+6kArQ4tnHVXX7TDRKqigRb2?=
 =?us-ascii?Q?a610Z9h3CdQD4OtgmzYW/Ccxy4z2k/zCDK/MtUFEHBKDsePVKSd2dS4/o7fs?=
 =?us-ascii?Q?LERg1dxFQZWAmaCkLV0N1aIjOMlzKPMhooCkA+fVMrmTtiWjvwIg5sop2MBK?=
 =?us-ascii?Q?0DT+Se4Q2cUJMT+sLTMIcCbHNmvTMIQs0wvOpL933IfsRvqEQNAU4NjonOFY?=
 =?us-ascii?Q?8UFYrf8sQFLSYA2Jli5jJ+4NF3OMFLeW4DwG8OnINe97RGHa0xpceAdtWiWO?=
 =?us-ascii?Q?HBYy+xoyQ1B6GST6J0guCzwZVffh3gDS3MvoOkAkF7f1ssPDmbRSeL2Ik/Ty?=
 =?us-ascii?Q?iDGHJNZFGdzpnthoEMKTIjdshJH/ja/eHdxp2jEmT0JAaEwtLqHJTwW6sV0z?=
 =?us-ascii?Q?hHf9+HnOn50+V4q4vIwioObBvBTucEC83QQvK0tVvK6bpuRP83k9catyNhqL?=
 =?us-ascii?Q?cgE8fP7pceadv0W2UtmsBpbS7YetHn6Rhacvhm3q7YnpMJ1eOokvpSIblTi3?=
 =?us-ascii?Q?B1LgWov6ybLjhah3EhiHGCOQat/JoWWmkH1M34/ESXnJrzwvCHeHTZflmiSy?=
 =?us-ascii?Q?bk1Pm5NQC9Ld75QuEjOkUjjwDl7RbXdLZhnJcjhVNwF/tejGUUPsUdW7Z4mo?=
 =?us-ascii?Q?nTZukL8PI6jeQrMSErlSomTd5XbKGoW7ZmFS3dcG1hiZr7y+yVKm7/9gbqbA?=
 =?us-ascii?Q?UuV0SBcrghGg114ewjyzbB/j9CIRYYOY+LpwPVLoe4zX4Hghv/j06dxOSITR?=
 =?us-ascii?Q?PRPixhWiHJcbQ+O61SNUT6DGFExGiRSmcrprYywqfgEqweEzXy9u/2aZoUL3?=
 =?us-ascii?Q?z4yaUCAHczdwMwMnrFA2Y96lsoGNFWr/+M9DuJJgxaZ4bPEElVAjpiS7BvF3?=
 =?us-ascii?Q?e73YUJfUj/SUJN78pIjjecprxJGIu8irhwZObw8HqZnPca9wEhVutuYN3lkb?=
 =?us-ascii?Q?E225ADbkJ7rBHqu3n6kxWMyHH76OpFvSRU07nyCzuId4pzhOM+Y9FhWRcDZx?=
 =?us-ascii?Q?0ehDDB7JJ5J2tO8QVTEHWSp3JogHEb3a80JTWa633J6j0ZjNN+yhwnJsFfGq?=
 =?us-ascii?Q?br0KZ2N9b49xPZWBG7ZhNvl4NgS1lT+WFxDYo5F3mp2PqgzYVZQAOBqrRES4?=
 =?us-ascii?Q?j1tDKfHderBoA8kQkEDjBmnZo48FDA0Z/c4jomb5AH+kakz9wNp9cjdDvcrF?=
 =?us-ascii?Q?iMRzDF1uQ69f4g2OMr35pYojSEzYG2TN19dt1KG1sIBoasy8XW+v8ymVTdlL?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffebda8-c787-48aa-a643-08de362428ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:36:47.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfPKrEWBWsZdiRM4JM/WkmMtPT0i2XA8cUqoONXEpvAPtkWGNIFhemEKjXPu4PiTORSZZGumuawsibIw9saoPsIJeX7/4hXZ7WKJyuaxYB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_223653_561162_56D60054 
X-CRM114-Status: UNSURE (   7.97  )
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

These two patches updates dts for en7523 SoC with the recently
added features:
 * reset controller support
 * spinand flashes support

Initially these patches were parts of the following series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/
  https://lore.kernel.org/lkml/20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu/

All other patches (except patches from this series) were already merged
to upsrtream linux. This series just groups remaining patches together.

The series was resend because of no any activity for more than a week.

Changes v2:
 * update cover letter
 * update patches description a bit

Mikhail Kshevetskiy (2):
  ARM: dts: airoha: en7523: add node to support spinand flashes
  ARM: dts: airoha: en7523: add reset-controller support

 arch/arm/boot/dts/airoha/en7523.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.51.0


