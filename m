Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB34C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te1Qfg2GX4zyoXQstC2rlNs1XzqoPsWa9ZjpjPBBZ9M=; b=Wk9WKWmsF2+3IpipAIom/HhzYN
	Y8wWXn1fCD7nOKUlCA611SwaTUDzROecViq0RQBe+mO/C0ZWe1TJ+FUyQqRJht+3gTxz3us7LTuwz
	jfZwSTOPAnS+VIdDR9AljzgydlaOqUt5bInwebsVWlaKfd7BuCNygnvRGrgnR5l8k9MeqKB+BhyoC
	+cTHcNJ6fqccEHW0tBswEY8ECKRRQhmeg08IHtaoxxdevCn/sBrcvDh+Vt5X1xaCN2Q4x5TjgQcwT
	DuVfV6LYEM4cc6UnbRiYtnJ4wv/npedBw4CNwkJ8nZCPhMCYZdbMr+ts/dVVdBG/lH5Gt0oAkwSPZ
	oA43fabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyCm-0000000BAGx-1zhm;
	Thu, 20 Aug 2026 08:32:56 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyCi-0000000BADh-2O2D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 08:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzBLcg42WUK5fkxiL72+3SdJ0vJiJZhE+mAddzm2zChyhvYuMzKDkpoUX4r0YeQZam37VkEG1oUqVITReZxf9FoE2tUZQP1DCGixxeIp0Wzo7YgZS3ooEqsOk71jwCoxabJS0tjtHM4TnuPJegm2pmePmRX47gDBSXjXoj0WELvFa56hqHgrT7UuAouAyNyQocRiwWAmXtghybnouMoAFU57z44APE3pjqMEZk+9AI7KrgrjS0tk7VX+7qaxddZ6CniHJC0d4zxxtIrGXzqLMInhfvKzGKvLdLaeiLdv7UkjlIGDGO3G2yL2wtOgyGNh1JViKIh5JcUegW4cdbgzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te1Qfg2GX4zyoXQstC2rlNs1XzqoPsWa9ZjpjPBBZ9M=;
 b=l06dH2PEIqn1aLChAYRoD3Xi1eFGU4dLpwzbfJA2fs4KTD6FC6VIGBQxRA5B5JHy03JzNVCJKve836QMla1vOqbskYi0Kg457ZGF2EdtU+gdCqC6vKjbcvbYoJ9G5VLWXYgXb00HSS2XY0RltSt2AbrFUN03l/hSUY9l2m6u+xs+waIyEiOZOQxKDbObjOc/L4IR9dVXLKtQ+XoD2DIv2KiTFa1H8QLlsDDhGSbDxv6cMCOL+w1dMD20TDugvkNsnI4bKsUt9AqAEavvFp9Z9ZHJAXnNANTjqc8dafWo12+WEX6z35J9rUdslohNh0ZqKXiZqSOMNsgjXsti3IUGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te1Qfg2GX4zyoXQstC2rlNs1XzqoPsWa9ZjpjPBBZ9M=;
 b=mu502M92Rs8x0HFiHOs9gV0BeCk9SXkVY6Sz9UrIQnyra2NLJ7E49NSPfLHpAL/L9UFf6UGOiNEUkSHJlg0X1rxh4XRn4WhEsKUZKm/Wd9nOr1axbQmRuFA5fWLV7ASBqWSGLAOB4jOV9xHPYfw/adlMJ3oaHEVh4S5vyRR5+n2Mm4lwoi6uLkLydCVYgjj+MNfwRRiqndk+0XMpk/x2bdC8VXOFpeK+5QysozXbnSVgbYd784GKuxkZfmKk5AqYg10f9BWX5SQe78kGhkX5eocFr97rJBp14Vp7Ruud9z3Qu5hanQFO5QJrZO1K+MrYaxTOxjlfpQm/UkRTE6TBwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAWPR04MB10056.eurprd04.prod.outlook.com (2603:10a6:102:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:32:48 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:32:47 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap
Date: Thu, 20 Aug 2026 16:36:20 +0800
Message-Id: <20260820083620.877251-4-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAWPR04MB10056:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b649a47-0ded-4749-544c-08defe959cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 1fg8hcd1EWQouXpsEpPj5wlSMGFGNPlNQ99xkIlis/vClxcBE7+W8sQKqcnR81Prvz1hbuc8Pfq2jaIv6NKxWHAmsoGCZbrcu5IahnR1vJci/OWIKYekjvaa6wPMMjVJ8Rvpwi23tYyTnGzo7fBsq6lwaaYMZB7DDqkZNVSBVk0Zws2IxI4uR8E/0hsYPsRXPNO+e2JUM4TDbsERA20we7b1P80r8+qwE6wn3uGWIv3fAhnwETGpf1VKxgJwUtLYwaL0WLnPdy1lgdryJHWKr4Jz9ukBUYfuNeCGv4ff1qg/UYhOJdZO6qNPoe5K/CLIY/lMOvGNZMkB3I3B3rKe8nuF6vsOHsWnArdF7/V3gtwPuEBLkrrD5sK4KBIuO95SKl3ZdEMYRSiSNi5tHlt4vqOcHlT8NOXemIqX8tQIblYWiJPlm1LRPMX0EloUpoPSURXV/CPWSR/KPCyBn3gSykImkqvQokOwDJi2UaX65WRH8cfzVO4jbeaarvdSpjjXrO4Hi1ct/4oTMYTv6P1w2iTSTEV3rC3kSYPUWWo7u7SDzoH50RuWxQBfFepMo+r2ICNCPO9BYWVoJqcktogENvntPn2vZkaTS24rdy7IeNepUZ7+ahb6yMLS+W3Q0bKy7J1av287jZo91SFT4SA6VbQQCO/KDFc7QEzbm2W3K2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xtifRiXQr1aQ6mTx8hAnXD/wtAyY064LI9bVQjCPqGEB3uK+y99VJyRQJVRj?=
 =?us-ascii?Q?TR7aG1rWWv6sB0nRIYrA0KOi/X1lo6R0blvQbpuJaJgK9tW3dGt5oFWZmld0?=
 =?us-ascii?Q?GQSB4q4XN/AaKqVXVAlUV8PYn3toI0kLW5e+HKjRtVGLVOjHL5Z6/NZQGe9y?=
 =?us-ascii?Q?hlGglVXqJ8QaiIMrdEsQBuL5w0gGUXQIzUkQpAE3XogkFrfDYtwdgiqkkkjh?=
 =?us-ascii?Q?Gy30HfMfEI41MFzWB+2L5QgTjm2lSJIRfCBDCUXGnUfU4sjlOHMuyakCWeZo?=
 =?us-ascii?Q?lNcm+y3Je4JqtlQLWK50ozoJ9npASF/6cdUHhIZYPUG9bPqS+djq/L1e74W3?=
 =?us-ascii?Q?rznspd/6sOqeqBrlJXtIw0fyVGnfo3vUBYKSUAz7OulB+gna0V70kxB0Uru6?=
 =?us-ascii?Q?sGuazuYNNuaRi6Mstel+jJSV+wBeDDwQpSn0l2TBpwt3ayDBHqyEJ0uEPXiG?=
 =?us-ascii?Q?LoSowGIx62MP5w/O53FbBt9JjcNs+2h8xhejMAqexHjofe5qM1Iwdf3XX6Ie?=
 =?us-ascii?Q?vYi3E1EbxrKHjLGUwc/bsV4wjPwWsZwrMSQSdcfTHZ7D7RANwHq82YNuvfXH?=
 =?us-ascii?Q?7n6iXI6LjSiVg3HckwaTEZg5FGabMJTf1O8TYlNTWrDzARiVyq+3Ctul3C3v?=
 =?us-ascii?Q?hHJ+leiyligL9gA9v9elfdsMWCdR6x4v2X4zOUFmWK6YKRr0fLnyEu4r0z6L?=
 =?us-ascii?Q?L7MdTfsOhEr6SMyzpfB3eIL6Dxls5vZsycYQIFZ4m83CHxs4SmxtiCHjxh3I?=
 =?us-ascii?Q?46RFad8ciJuZVCJPTutF1Ed8Y3Sk3An8ENZqTekEYWEyyS3GndI+Iy0KoHM4?=
 =?us-ascii?Q?eXDDLsJOwQo9iCnxOoRjvuEKXGf+YfuIVstT6zMfE/0HWClpvuTrJpDem7S+?=
 =?us-ascii?Q?JwLAfQ/ab32xsDIh+1eVaZ06fxR5afl4ktEZ0h/L6VzLx4kd5aq5n52/eUww?=
 =?us-ascii?Q?kmgBBysHCAW+MTyrEvD90YPGU1yZQMAeZM6JbIhU4ARemd7liU1eOMTlVQYI?=
 =?us-ascii?Q?5e7S79i5SeoSfjCuxDtm16OiU5Y+pz1ps7Fpb6QTB4FLnTiLGiDJ13GE2aMU?=
 =?us-ascii?Q?WwyWEdHkqBhOQ/EFAHzUCjHgwm+5HvhsOPymsSVJyJh87TdirEuWwXfsfWqN?=
 =?us-ascii?Q?rg9o8cHr7gfbReGHSMSLcAsX8a3odZBHFXuKqVzV50SFpo21tNMD+SrzckLw?=
 =?us-ascii?Q?FTE2crGZH0mWcomZhOrQ2IMOlpF/tbX9IUFV+5NeGoQnro7qFLqZWiuoWl+5?=
 =?us-ascii?Q?eriisy9iie8/m026EXMdA83TzQ+BhAg7nKbu9hZktfQUkGxwOsuqnrfufdSU?=
 =?us-ascii?Q?ERq0+r8lXVECPzWeYUgHKnB16MqdKkmfzoFxo9I1C1lnbLdA6ch737qzFTUV?=
 =?us-ascii?Q?77RIJQC38vHAVdMB6/JbB6opEwLbKh549tUxoBWgH4Dl0vJpqeUmkQQX+32T?=
 =?us-ascii?Q?momfCsgurKXLP53gkN62WMXcXq3lJrOhgxzxsYOBOr26FW6HgbSpZReITEAD?=
 =?us-ascii?Q?a9o91/tOkhPpXoynnQAG3y4gqdXGwkn2n4qOQ5rKp85mhb1YhESEj5+LEoPr?=
 =?us-ascii?Q?sca+Revrsju2/5ZoHd6PBZtABpnm9rxhU0Ce8YYPCNMn4YznTtpcwtyBNLl4?=
 =?us-ascii?Q?8j+KQrjD1vlWmB+T5Xo93blEhHZUynNBxwXpMTXfmS0DRYR/Ri1tYiLyu1cH?=
 =?us-ascii?Q?vx15Qb2gPzCbLyGZJGXcxDIA6RlcCwGn/2N5jMoFx0/Bt6GiGvtmxBh9h5zT?=
 =?us-ascii?Q?Qn6mI7yCkY2e1mBEaxL3O0EtOYXbrYHKlPfRaHGLl3znqZ1hnRix?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b649a47-0ded-4749-544c-08defe959cdb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:32:46.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO836UUryeg/WqFGB9fvHgeq/EwPQ88ScUa2iRbLr7zD2qGfDfTJZa2/5dgl5IkM3uw4qAJujNOqrbSWYKLYffXpcyQ6wLXk+3mXqjigHIjBheULGA764OFntBie7Ftd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_013252_754729_BAC718D9 
X-CRM114-Status: GOOD (  10.32  )
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

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory CPU address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: 6de3a7d7a4f65 ("arm64: dts: imx943: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 01152fd0efa5e..a564488d9cd7d 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -219,7 +219,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.34.1


