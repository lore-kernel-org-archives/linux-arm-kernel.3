Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32663D637B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=; b=tT1+8zVPLASYtbOvJwwh1bNvjm
	XbChHbJdXZnbdG/9UBFZQQis37XEuYize7MAkESXhP4l5XNCDB4cptZ22xJWCKHE26N+1dWdS+gHH
	Hl3Zt2CU84jDV+UZ/z3tfHymo38zwsJZ54b2OfLXypeZChzB3w9ddaOKqLaLz03y5yu2ujuMd0qY6
	fUzlEbf08s7RjCMp/9EnhtloL+MTHDRSifwCfWIY53nDeDPJPABGum6lDsKvqSVbvWsGSI3/VDJ5g
	UgR4XFXXvyQB9GEgDwcmknwVcL6eCU7Eg2qk0JUFpFN681t/49jd6RUkmQQxju6miXwpKahKouJPF
	mMDYhRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcH-0000000BKG4-2H4K;
	Sat, 20 Dec 2025 05:34:57 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcD-0000000BKCm-00OZ;
	Sat, 20 Dec 2025 05:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt91v0ryuA8P8+l9/cDTDtTCTP89fMqfNJxEu1h44SvNKCNjaL5s5wvwU4MdW6KLKnWBH0IVtvqjrHXloTf9yHPEoOQIF+rloJLjCcFzPVca/LhyVSnAS+LBsGzvCDZQfQUPDhSErpjoKdgsOiykyUGGXKeBw6aPbUbK8/DEwYxl7jn1g6CEGRIV1PPLOvsiMr84UxKuribgtnIU4TxHs52Sps0LQise5YFB2q2hVb5FVZtkEYCrcvTgUEeUEPHCMAC51b/yPWeveh3SZheQsK9zK7aCv3nFqfRcA39TGECJdKree9FBsfvvc76RZVFhTLky/jt2JukwO/B0JUYZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=;
 b=xipkYQkwRJCPjpLh2hHfGADA+xlnowhcZPAZdwgk5b4xnCToQmCv9dOIFiqbYfy1fZViPph1NJw026ehB+mdRgNGCDtZG8r6/JR+eRssbopH4k7JjknHxWSH5RYw7vWzZJFlsucA9BqbFPEhBjjzGNyGzWYN5e4Ne8K4yZcfY1ZVBb7dS0UBCUHNIR8gmXg4JuL77WAouKlgIqt1n+Qnk9PkmvEkE4KWvwX2ZP94MwU+O49+oLcgENp0Tle0kKYd+WHbUTjAERt6vAYwCJbvouLwHVD0ZAyw4+7eDLveBH0ef50vtJLcq6vyUeM3+xIShVL2DPDQ4KDs3POtAzTACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=;
 b=wms+aGNLq1znazSoo/1aWXQlscJNEsZGP7BQvduGW4eHDt5qvhICdhOnjvXPE5bzodeRGobaKqnjUgSaX4/XLXFuz0u8pwvxS8avZdarHYuKRuWs3eMr8mXI4wGbta5YJ+EHsWlBLOxtBN848iyZ85vdc4JspTTTGo4e4nHmkOsF0NEMx0FHBuNbEHLAxLV2tX1LOb0f37f4QMOqWskAH53aqcK1PcN9+aaAIY8cpXr2bx4osbKVgTd29Vlm9GsycAckpyiqWCOS65ffYXCxp0eUaUR9vUMwNEdi2xgAweyyoDEyZqNan3jl2ollrplzuGodZH2xy+q7dQ4G16tXOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB11795.eurprd08.prod.outlook.com (2603:10a6:150:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 05:34:42 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 05:34:41 +0000
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
Subject: [PATCH RESEND v2 0/2] ARM: dts: airoha: en7523: update dts
Date: Sat, 20 Dec 2025 08:34:28 +0300
Message-ID: <20251220053431.288158-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::10) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB11795:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be68514-6cb8-4465-b685-08de3f897956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WK+Fo8Uq3CJwyyn7LVsECou+E0Ot2F25Gj9l9AFmWtdJpMy17H8vtQNC5pdK?=
 =?us-ascii?Q?P0jetgvOOfLsM7Tajk9lgcCr15RMGzyU+xrvT2wozR2R4SEDFtNoyczzIDyY?=
 =?us-ascii?Q?zuqkBcv8/Kfq1A2hHjLwB/0PEXZner/BcK2Dw0wKaqr5ojL6358y5yl9Mg8M?=
 =?us-ascii?Q?KPEf95GgBPB/H4OzxZ3l7Y4OwTfjLdsrjqLM2kRWnJW5wA0uZGyHIKaL6kg/?=
 =?us-ascii?Q?dwQKnXDj7IZs5uS4Qyek9KNx6lKI1miiPjashK3v70TYlYt7WPxD8njDd6cZ?=
 =?us-ascii?Q?/OoP7/ZzqSwEnpIKTD1XBEfb2eGjROi7B5aCNgxYcvZDRImTC38NtswX+bbd?=
 =?us-ascii?Q?ayupI87iR+BG/rLf0FdQ9jZvMpm9qDukSmVHmlNRGleuGhaVtcQG4Xr3aRd7?=
 =?us-ascii?Q?enOFi31WAS8mXVdqemQD2WYx2+2yRlgFlKVQLTyFwvg3x5aPPCT62tkAjLwv?=
 =?us-ascii?Q?waVi1+teaEflcNRdeyXgyl9l84TYbcZqib9B4xQfGgBqB9G5HuqqaBDZtNbf?=
 =?us-ascii?Q?cBHoidIs25f6KKznwpwmB0papFxotniVVhaNS5GFtCNi9bPkA31flA0jTjN9?=
 =?us-ascii?Q?/omiuGyQHQb6QA9Apfhgwl3Oj7vnwALthi25hTiKB8hu1+84ZUNdcIxbXG/S?=
 =?us-ascii?Q?slLQgrufYtIpr8dsNC3PhNlVqeW28sicFNwrKVfK2cZScNkg1YlrZjob1+g3?=
 =?us-ascii?Q?GzYT9Q0mk5rQ1/n98PSW5G5lGpAjGkL7hbxO5HFpCfkqmHb+BYI9qeZjzSTw?=
 =?us-ascii?Q?eFeraPSDvZzcJCk7GSVYIT2VOhBsUWV4tUh3gz0qesFLIpcMa5kRgoiN+fVo?=
 =?us-ascii?Q?NboYpCL4niCMX2zqM86kq9Swz6eWsm6yWK/AZyQ2tKENxmEErZ/Cj3cLBy5F?=
 =?us-ascii?Q?3JlaJUuG+1n15qRHdtufIiFPK13zPn6vxO+NjHJQzHRlTmDacSD4IYy4da+Y?=
 =?us-ascii?Q?LprUHKKPGdxECJzjELz6lPnew6iOcMRkjY08O32YIgX6w+73Cb+6uME+qXth?=
 =?us-ascii?Q?cJhFBm7qcz9gHlPp1XIJ1uGYjwJPZ8AeYm9kQv85CemD6APztOrNBOz8n1Jk?=
 =?us-ascii?Q?zpYj7XtnO/0oGSFZMDu2TTKXdwqhIhNaPCLSJ6XF40gHzwG06U6HvIX3qY5L?=
 =?us-ascii?Q?N3Lmnmmc49WsJfqrGb+WYWJjeUECWwOdSwj4TTkGbn4l2tXcjZ6TfJscAp6e?=
 =?us-ascii?Q?1bxH3812TVwxkYGd8Cuq/qJYLrlLqTTCow/jsyTp+dNaHNi+WyVH4EeEYs/4?=
 =?us-ascii?Q?1bNn57EmiuQLR/2x0x6Stf+4a8hikrR3pqkv7G5sjgFs0yo9WDfi7Sfd4ciQ?=
 =?us-ascii?Q?ZNeWk6y8gWtwC5lJQv9podXQaUaK2+wBNCZH9hKjJjREgv+SIFxVKAI0ndTx?=
 =?us-ascii?Q?gz//lix5INnKFhXNONXzGXiXE9tWqEFu6xXXvzrR/ebBzvcWBJomzJloeahb?=
 =?us-ascii?Q?oya6u/j4RcEz3hu6f5xGe13ruAwbSQ8LCO54StpFMTHGB2tbl1JPL8jUcKrv?=
 =?us-ascii?Q?V016tJmS88yuvmvIaPUyrDW9U7IUTlfFYy3X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bv3ZDTI/9keaWTWAUDXtqa6bC/yd5deE0kqas4FjL07p5FuFicR9nhVuQ39x?=
 =?us-ascii?Q?rL1250ZF0fU86oyBzf8yQPaaSbDuFkvpxXtkjxae4fLXTdf/lFCS3ImtHHO1?=
 =?us-ascii?Q?FTX4+w143ijpEsdgnWBaQIFD6vLCIEUMxUH+TUSj6RE/fWjfphW5cFFMD1qR?=
 =?us-ascii?Q?QWPqh2b+C2Y/j1EvUcmn3mrnRWouHjCvzdLKYjTzqrtbhe5DSnbm3QfAAO7o?=
 =?us-ascii?Q?GH5VjCJ47NWAN9grb9H64XSFk4G9p0pF8QpE+PnuHdTfHsyyYNngLKMLu9ei?=
 =?us-ascii?Q?UemQ9L5/Ps1BcU+it1M9A2q35RSUMRx4I87/FaqbfrHErMDp2DWwFojhwaeR?=
 =?us-ascii?Q?iK7zsJ/0M8GyilOLltdGblT6QFUBEYN28721lJOjURtmcQOujcXKSLMMwna5?=
 =?us-ascii?Q?4fHm9WVWvegu7NXzxGzG3KfFGSY6Lt4Ut2LmQVl2OKcEZ3SqLBpDqpyZ8bww?=
 =?us-ascii?Q?hYWj2S3A5gGEyJpPt9zJfMv+lxFl3Bu62Qiic16V+QzxKf23DISpCDBaz6UH?=
 =?us-ascii?Q?e9gia1tv6scoi3Z+KoNqA3GYzNHoRndmXmQh49kCcJrQ5h+3VI1AVS7Qoldy?=
 =?us-ascii?Q?duxuWHquiaq6tomZUBgPsl+P1GtpxFkVe/iwYdIs6SYiQs3JMiQuZA4VLq6+?=
 =?us-ascii?Q?PLr6/Yq8/1ipy1342Dw4h+Uje8m4meCXuHmIzfRBlD4xt8QBtt3tfqSsahXp?=
 =?us-ascii?Q?K5D2uXdpCAFOO3b/7T5rcHm2sq5ME+harBzABrCODMhzgXO+79cTkn/CPPZg?=
 =?us-ascii?Q?G9RbMixTgCE14Yqh5QjtHIPiyFwlOeGG/AbjCzckfWVIgXqqcAEtIhEcBdxb?=
 =?us-ascii?Q?ODUfTSbST9aDXK7Dae085vBq5Oa5pppznh9Hx7g83YSk0AtAQfWT+x1B9UjT?=
 =?us-ascii?Q?Lgmp2RGYbNlL/Q5Ux7yAFd/4KE8trFgkRskRhlg5tFxIc9SC2IOlhnFYjOw9?=
 =?us-ascii?Q?5nJfLVfBEIYm5JGsz0oKggbn2EqAIR53JoSyvkL00rLklW/+8uEi5h2uaFR5?=
 =?us-ascii?Q?QFX2WQqfSerkPlVbyc7oZVU6z8amKcxcn3mB+H+qvg2ZENsMbFSYp6Jfjoyx?=
 =?us-ascii?Q?lkV8c53w2kokSAiqKhjHxAqrCNzGwhDOAYw6X5Ql5ZnRk5PI6RA2qPspVDmf?=
 =?us-ascii?Q?7VhmfA2bAp2+XpBQHu7HHNn1IhhMDourivVUu+j/3EAbEluTX5+AVIkkPeM8?=
 =?us-ascii?Q?5ZGz+xpxybn+myHhPIX7gaSL1P/hrBGS88Hm82nZJmV6vBoeJuaA3v4kUUDS?=
 =?us-ascii?Q?kFjBXs0iAqd88JrkVIubBl34pMwS8HgWRCFcSJiC68ZUFX4jIeQWgUwNuMi7?=
 =?us-ascii?Q?w5NuXbK3rcrQEOedoAPveqIouM32XbAzBsOrOa30S+pfIt0WbIDuAFpN5AM/?=
 =?us-ascii?Q?uXo7xcJggkAuzTXR7d0ibrYZ/TmXXhOSITobmbT5FQjy6rHl6wv6Aocu5uJS?=
 =?us-ascii?Q?0Kdu6oDPAqd3nPrSLcm3a6kkqAnVoLgBoglPRvhoJQr/xn2+FWODG5HL8o6v?=
 =?us-ascii?Q?7nwEiO45dwHsPN5RaffIVsYnp7lxhiZvM3+BF3BRqRMFZhnkOU6cv1js0dp0?=
 =?us-ascii?Q?3LOAD6wYZHP2/67fEqVg3XWZl5QHSc+aeUbtittoQDTFE6vZXH6FUmXwVbRJ?=
 =?us-ascii?Q?cbE51QEn5i1iRYEoMZAKOJaIq7RN6GAPxX1fTjw3b5bjPQxiTNaYOnWi+002?=
 =?us-ascii?Q?PKUH5ankVojhyBQtSBzvjOlq+xQAKsjQz7VOW+X81mHNk8WyRC8kzPpf2gFb?=
 =?us-ascii?Q?hC8jxFYIfExGnRNXkdE+DtCLJ1NVLuM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be68514-6cb8-4465-b685-08de3f897956
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 05:34:41.7166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vAUoJxNphVYk5TQDnDSwL7pcgWIgKJsUZO7DJUhgTU+8PZbFpQsd1n8UfZQmD8f4pwDQFjpkatsj7do8e8jCG9QVho11XIVi38MAPU6R6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_213453_044033_D7D6C413 
X-CRM114-Status: UNSURE (   8.67  )
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

These two patches updates dts for en7523 SoC with the recently (linux-6.19)
added features:
 * reset controller support
 * spinand flashes support

Unfortunately none of these changes will be activated without dts change.

Initially these patches were parts of the following series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/
  https://lore.kernel.org/lkml/20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu/

All other patches (except patches from this series) were already merged
to upsrtream linux. This series just groups remaining patches together.

The series was resend because of no any activity for almost 2 weeks.
If it's possible, I'd like to see these changes being merged to linux-6.19
before its final release.

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


