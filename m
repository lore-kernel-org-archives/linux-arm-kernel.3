Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D886CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=; b=xTIMG6/HuNhlVYd/7ZP6sfpW4k
	W6inwqcDSqusLCY8E7fJdNq80sru/EBA8OziuQvIvVZ4EIPG9lESPoSmeXE5rXB26J1yZxkdBdTNW
	6jWViJdw0d7VrAl47tUTZfzvj+7EOCEKBrWkN/dmraPqVaJp7fHg9Y8I2x8GReNH5mRW2D348Fchc
	SaWsfQrR2c2u73sG/65SPz5EuLaItenBtvbWCVS3gwQW3/2snPq0GWgDYGIf7doMjrRlZ8EtV6mE7
	fXNLlzQnnJlw/7pKZUK1VnuUPLguednkosbWHh+1f8ZotDllMjbyu/h7upx+9ruZ2nte8n8je/+3Q
	845J5PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cd-00000001ub4-09dD;
	Sun, 07 Jun 2026 00:17:23 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1CZ-00000001uQd-3Tni;
	Sun, 07 Jun 2026 00:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmsXUwNpJXG8Ypeiv9NKZHvFXmH2hjTiSTnYX0VCjZ8J8312tAJ9n3i1kS6VNCspNEF+0MJCFSbKu7PqV0oj9/qPm/Wr2kxVeUgiyVeIiuLOjrhT2hbk0mezy99g0f9U3mYYJ0aVhLyUTAZr8X1JwaaywQ8pGp08VVpSAtSVo99yZbfH6ZYoR0KiD7uy/WQpx1mJm3pV7Sujk1Lj8QbB1tZWE6tBdGAKU3yHEgJet8oz6EFu7MEEspPZzjunvteHfZNqswGmZSkEa/kr/neq+kDY+0aOypzTNxtIsT4AlVTcDqyOGQP163Ijhjq6I2k6zpWqN/rrR6tcY519azOSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=h61uSEISHOk1ekGk91/JxuGE8lCklTz/Z569CdEMUVNKam/SHUvu9dqsdrW9+AB2DU2Ok5+HH5waKEhStU+NcCIAHoGtI9OljsmQyETTJegmACm8mgwF+zscO8NmURVlcv/Nz5og5ar/36ht9aVPAl72nYAqdIGWggfufUzy6Q4zJ5XHi360bUidV72iMzMY3RVfJYdGqwgvZVtF385yJ0sdmdMsquElEFu4pIVsy3E/DhHiEw/eqyBoX6T9xu5lUsbg6g6ZZ6+/S+3xS4vJEAcSb9jTLz/M/ka8b0HBmnuwrtdf1k1xcVjYtyYEZamSSG9J0bmeEsWx1OgaiSXvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=zsPMUI/YzoDq9RtvuGjcoA+j+NFXDewuknBDTaN69eNXX7iZlT1yNpEzBxijQJCVMB7Jv2+3J3JLFaxuQKekp6Gel8S8yFEjoopfDS/HatHgQ3IxOuwd6ZqHKM83VoaGS2ia+S5TVgmMmtz41l9FTEchSKTCJam/3WswFXmCIF45IFHquAs1Jl3dG0nqPY2Kycnba039awohCVc3X9DASiD+1Ikdowiokua4ierhtzhafVqjSrm9vAXZ+rLY8jjxzo+a++3vrgu3pvSffxceE/9AUJRzLcsIa8GcDS/39gYOleEVzVhNlVzui4SI58Hq2EaJwkaGGTlOP2M1Tf4nqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:11 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:11 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 06/18] pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin function
Date: Sun,  7 Jun 2026 03:16:42 +0300
Message-ID: <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: ac338b7e-08dc-4655-23fa-08dec42a1e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: GaSzfdL/a5mrCC6cepGYc1qN/PzbRziGfzxMk/kOJ6gWNZaePtJ9X+wCiyD3mx+rjWcNBypL6AAeOldf4wjJkq4lJp+2FOs1ddyZMEWeNJ30Q3xeLULr4KnYdONhr3Xo3z1hmnlY2A/alfTtNimzh8eHeTq52IZx2MZrdRylkK3TYDwKtOX0jSqb0PrONe9K8OOHtxKAGnOTA+365Ra5Rc2VpulMlSPMV78oeYwAy4Zukv9ncVXf07JANuzhhjk/3eV4wpwyf1Q3oSyn8RcGMs+T79Z4soH1HlkixbBQ7aLin3GOGoMrK+yUW8IOAL011i9CQCvQ5CMjQdGtyme0BEVhYy8a7EiLWXp4qiv6j/SdgS7CDiMqj/etyLgqVaC37PmwqKg+IbaqKySZEi66RkPVDWomntPkpQ7g2xv2RMjAGKOT7GiHyMOYN3vI9GZqNDEhDOCGcWWmCjmPG1Ug9LVA5C43dlv89fzVVUtZBmRQ9LQKVJ4NJkfqGMYMFOmFnwM6x+/cmu+0ze5a8Bu34rhcoy1IxrifaffFoakDMyNyoHLPi3nZBblIr9Jm1N0Le8f3rePK9gdUFb/MMPZ7ZarEgUJ8thPv3Uwaf4zJ5w8Dv7FWxAKqhTIBe0tL3EcHF+78PnIqkP8QT40SqR1XokvHBEDVYispAwENfY36/J6O0DFqmtW8A+Zw/0ZyxeX8OVnvSZ/aBKdTx5qnAcptOXEaFyZvO5cLMfJNWBXOpr2yfeEEmdcFLMgu6sCf7c/nnBPq4/OnHidTYb44olAyvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H11NBRfBNeozG3uFnmTstc0paNs8JEJaG6ycRv7c41GQt/sN5ccxVT2hZulJ?=
 =?us-ascii?Q?s0A8GMSKnfSMDwsxBZpfAB9gDm7pzFz0OyAkHxAr94H0lsBrqmLTcCZyrL5V?=
 =?us-ascii?Q?hVFhG4Fw99UxOnMVFVuYz59Wl36Yw92WbCW3ISIV8p1t1mgHlsobUpaYO2BF?=
 =?us-ascii?Q?KZahGYO0lMQuEt2eKBRUOswb65jQtgf5CDzVYUjjGMEc66A5he0WJDjVxO/t?=
 =?us-ascii?Q?ATjoZ1dGo/ygM/dFpPGtfUvVUsqG16rnsuspZ9l85cj/1vzEiFLF3mCCTMvm?=
 =?us-ascii?Q?6IlCiJP9Vk42FRhCyEjWrBcyR+wzyLOxXO8OBYLCsB2IJenNdkPKY1hax9lT?=
 =?us-ascii?Q?MYa8/7LTHIHOFZ5Lv1fhveIVEnpIAHAZ+s5lk+xkoyDr6SxfsuKompHJ6FUa?=
 =?us-ascii?Q?cTG1YmK9XgMgtwT2oHGiptEFW9cHRWFjWk/39W6cqfBwwOw5F6yNeG0gy6uV?=
 =?us-ascii?Q?sb14K588+JTBpFXRDcslsYikFt2++YV4HUI99LPPvnwAoMNoDQDlVg+xfITn?=
 =?us-ascii?Q?xY4ugDh5c7z1e5XtQzN6QT519mn+L+pYeI/DIUYc3BV8ER9Ae/Q5jQMGPzN4?=
 =?us-ascii?Q?l8WTolfBaiYTraGCIsVNAqs8ZxBYAL9PZOdX1XVllhQsHgco/o3pnrTfWEeT?=
 =?us-ascii?Q?i7UYhkkQWuhtz2sKppooujqFHEdGWVkJPIIxy1De931kSVzQf8L10QFtgkOo?=
 =?us-ascii?Q?i/v547tidRu93514WaG3NX0D4F62dNeUah/U/pu80+PSza8yL3O43+3IKTOv?=
 =?us-ascii?Q?CFD8GchAYm+HuWWoj99wSkj5GSLNUABC9Us9CXTh3g+0CpZZ7y82V9kb5Cnl?=
 =?us-ascii?Q?2DGykJoUi28mxI71LHpSfvev/uK3hQTSsuxZPS8PY3xw+0poapzOJCFHqrrt?=
 =?us-ascii?Q?yDdZlOL3YWwe0F0oIuxbe/GO3VbZr3g7aFTiG4Ke2JGmOj0KQscykzkr6z4k?=
 =?us-ascii?Q?C+1njvwI7ZVF7qwflcIGvHs6gf0cl3Z9a1Lff5rtivhohEA2OddK0iIbnCQs?=
 =?us-ascii?Q?LENvwsCc6zUJJLbb4LfrYV+gtL9uiF8tIuec++t1+/sZLzsCmq5+xiR0Pq9/?=
 =?us-ascii?Q?TdlnrT9YsFpxx10dJ8G4ZEkpeDC4kGj8WjlpGzGzfq91Uyfb8t1R3eHxNcLx?=
 =?us-ascii?Q?l8qSfQlsjHLv4hVmTpFDpYg0rRSIrlzJprLc4PGm1+/E8b1IBwwF4bjphtCi?=
 =?us-ascii?Q?UDvl38FiV8kw7PULVwI8f2AeJA5FfwL8l+1i024JZ+gl649a0vXWBYuwV3in?=
 =?us-ascii?Q?qYd41a16rQ2YhK1jK9TlyoKzvzS8aKtCYzhKnyt29WxQsYOYupWCJ7mN4qD+?=
 =?us-ascii?Q?fEz+nKPhIPljI8/iviIpjCPGTV9bEOungVx/W+uBGn6mWLdYx7X4lOiLN+Ke?=
 =?us-ascii?Q?NfrG3BAYykt0Nu8VwAeJt1Kh2FWZqxMUGhSJsFb/+q56Xwkjm5cKxG98Ep9t?=
 =?us-ascii?Q?6q1w/I/Mek3zcnFbhpIHOn4G8N2piDgNoHrMJApFs6JEiE1nji9U5puWxEFd?=
 =?us-ascii?Q?vxMn+aDSK94qjo9DIqNrVBw+VW0BYuJuacQACctzckh20tyFn4SEUajIt5/R?=
 =?us-ascii?Q?120HsKRr2VqszJhtwj8rl+9WIZpycuKq68cglNpkmbmjRgGaOZqddAOcXeuX?=
 =?us-ascii?Q?Q+JGvNCo3AY6UBxnf5jKeFD9Cd6SS80wvLV3R+Z+BMQByuyNJF3GdUskEGSd?=
 =?us-ascii?Q?K/eTU7NCIY6vA5SoffOYfiT7iQGc8qQBDAnLeMOaFw5lclgFwKBHQBvdGBpf?=
 =?us-ascii?Q?rL89tRalxNlMUjodobjoh1BCjAOBOI4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ac338b7e-08dc-4655-23fa-08dec42a1e61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:11.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iaV7v4LzTf29viX74gxRTLUsotV2NTRSR7BwjccnmLHui+Uj6dCSqGulJdyBrHVOdGy6frlX/KOmEJpPPpDLmd59XbZZ5N00Si30aNVB/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171719_867347_2D877D94 
X-CRM114-Status: UNSURE (   9.47  )
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

phy4_led1 pin function maps led incorrectly. It uses the same map as
phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9497f5110f61..9be759f08b18 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1710,13 +1710,13 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.53.0


