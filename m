Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D858E9A762
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ6MyeFk/sd/C/YFUyOfdymuezTeA0B1hR12FgiVkXI=; b=Du8W608oQnCHDco2NlT1cNEfXg
	TPiReuq3reurw2UUAXonhMnKciZkDL40lVlSSwou0Msdpq4zp8S3uujkwZtMdKUVuK0Xb1GWbQL17
	Wux2/0fOWhTicthnIvKHXakUARz5pepJvqusTEh9ZgncEHDj/+gk9l/ftDW3o5rpEsVTKsp7GAzMd
	cXBU0dvNVzFD96pV8idB1fm2zxfcNB/CjaSZKBlWLyOz6KDApjfDhw4faNS54l94v4TwsT0QvAF2h
	mf7RSlfrUkata5JY0+4LBfntdWSmKUmBuVp0dODDdg6zZce+KpldzPRQ6cNYyZeIPFFa2J6HLGBRV
	o+rxYTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zXS-00000001Fdg-2QDc;
	Tue, 24 Mar 2026 11:03:10 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zXL-00000001Fbb-1sTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c86+S82QDjYiYfT3R9QugxsA4r45sBIYFnInf2Gc6NzB6r85kkip30CukIqL2m6hqrNudSYJ3BhDIh0Xy/kFG0uGDqE2ymxLBDBl86r3SuXA9mg209rX0CThgQ9Y+u0N4lNPYvUvEwmQN4rKGdhgY4OvZuo3Y9WsVSJogQTYbdFTJYNGXDydYv2EcoFnz7n/i5H2MV7hf3HzSlIo8qMla54T2mHFOH3jTTm1TmgGzQ+xCb47wFO3JvSRSeqNKe3QJ8Od4lk7X9y41TYVC9BTdO/lhqrxxaqS2bfvL9X7OhwdZKq/ybVuzOIfphNFSIiv9so7VQ65Q1UiXJLJpd4BeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ6MyeFk/sd/C/YFUyOfdymuezTeA0B1hR12FgiVkXI=;
 b=XRFNAwBhC+mSN70A2/3LbMlQ4VAR560RH9go66uom0O77084CRjnZMT6QkKhT/Vd6cWvcclcXxXnJTLcBjfWQ3NTkqjAwh/+2OPaLjY5F4vfOh4Y1ISgSOH/TG0VPKg4MUxXXJ1zyz7/8WTFd1bqFbv8pRBldejkFJQYDZ9l8ssC85pFAwCO/qWe2UpxYRxj877lBOkYU54dKzm7LnIurPdX+P13NJw9oPu6zUTakAkX5QiJIClklHgGT9P3Qds3kKNtEaRBcJ6eVobECV6+eBu6AzrnaS+06o1yK1YKNZoKEnFmEFXEicLnRCSBCfPx/5GHhxft1uiG6vqbNdnn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ6MyeFk/sd/C/YFUyOfdymuezTeA0B1hR12FgiVkXI=;
 b=kRoQBGkYCuYSHF0d0nZKFHoZs4dl/3PLcET/Kb46WbAqyaJtaqczOV7RLr3obX+SwCbWa2MSgWc5K6pXG0uQ/1J9uQ6uNvaTuBa4C7myR8mgv8eNA4MnbsX2+zoaW7dOhIN07cb+OIaeTPCSg6XCw9oiz5dqrl04CRnpYGcG2467WfhFi13prdlLOe5I1tGoX/mXOr7sB1HmPIRLExDH7wZ5xxL0UAkXSstKgZTAOek7YpyNvkNEiG5YHLcGeyrhh9vLb4BC4zkXZ2tBp30VmDyV8T2GESwcNA5fFnExp0z8RYsZ1FgxzdBEoOspjG+Qm9reOrvzJXQ8t892PMLZ4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:02:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:02:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2 2/2] arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
Date: Tue, 24 Mar 2026 19:04:59 +0800
Message-Id: <20260324110459.2838767-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324110459.2838767-1-xu.yang_2@nxp.com>
References: <20260324110459.2838767-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9c261b-a51f-4891-d1d8-08de8994e603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: RNsY6hPjEl15oIfCyXNwYZRUgSUJpjVX1RWWZllpicrc+cB2b/shdUJy6GwC0xzCxUxuEOYaqFvFQLibKKNsiXiOXuiOn2A86hnw950wdJSMOu0nsk3oBrbxvPUXFSuzLgti1UX+fc2LHG3KERHRQBsB9mzsuq2hljRYF+vuQdPNTZa/kq3QYo6VyDm5Rsm5dYpovinfiJegL0fcXaeejDry0s9fRAIJkag7dggANgXC0+Sc+fhZyA4iB48TYLY7EdWiZyCX/h7cMSQrOp8NhL219n1AFkcLMkjBwAwACoGz/yPyAs5zCUEh0l+c3gBE+wPnf3USlNrdi0hY78RUldf6CtTvvcmTmZTrpdGX8uX9WAws2yyGYWaGPP8Ts/FOTZyY0jSoZOAcqcHc1FXuEi6uE7K8zIRYs3vubHcGDLzN9kQajtmBkoAbpFZV2dYyRREciB1pZQwDNu5k2cOULp/CBv9PtxgE6ib6LumWo4nOdysg2dwNhTyqFSV1wJCE5AYYfD5U5cITgolMrTbj3vQsgeuxUSvWoKqEdK6XapllV7FZ3w7SYfGwwtx+RPbHdj/u7GzIxr9zSZX2BNRFhaoIslVyrbFbDyydyxzk38vCGK8s22GOheG+ZJFJCYglCW1SgcUXbSOH7ZlgRzX5bfu9DsXcPO4q+WOxKuEbLMz34gD2AspKRWYXJY5uWOCYEDY4xX1LzbILQQ2hAB2+aivRtGCHa7/U7hfEf9V3V6gmPI54YxbFGo9KaOaAazjqtifAEJIHhksh4QFy629n9DnTQBumbXnNMHeoTjCz/AA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a+nekUIPPRXJEa39EFiTeN+feOcnMpZ07wRog8MCFvvyUhaH84Ewr+us1QhC?=
 =?us-ascii?Q?AXbDjmWWdGFZOSGfHH1igSCtnRONXghKVUfxWWAqRGa74H8Y1t03wc+Rgg0t?=
 =?us-ascii?Q?wi3tRown0W7YHIFNgG7WmNux6ELnICe2wILp71ib13EeTc9r9LGFpBSgPgyz?=
 =?us-ascii?Q?kybOKUyQvPvzmhKKRzemx1CLmp/wwuTYIh05CZPqdKsLKYgZn0VdX+tBLYwD?=
 =?us-ascii?Q?lkgPdlFsXtoA6GdC+wyKBf1sW0ZM2FZPTJE/gTQKLEYknZ5L+MPm1IFpQ3kz?=
 =?us-ascii?Q?jgvVZ3q7+Do10HLZY/rP+nqsgPFMEoVyn/HDOzU2elINo42eVTyz6LC9mTs3?=
 =?us-ascii?Q?ivL3G4pKyTBL/YLHuMJNV3iGM/KvDH/hUMPKKkyrA9NLgPhSiosNvbqMJD9e?=
 =?us-ascii?Q?FYum0Ub407oh6QLQqG7rTjD8olkQQgvVbG7b1ILoUWwEMAhDlE7c8olXH6kg?=
 =?us-ascii?Q?+Lp1VUK8FX9+NQ3wWC/ChGvU6W+sjKcyQ+WE6yVrPAERkjQZV2qDeP2qxtN6?=
 =?us-ascii?Q?SrjC/247/9hylqngIX2/+Ne0oqNoANa9ncCX14HRyxyVSruShAj/Lh79DUwP?=
 =?us-ascii?Q?khA7BNcFjS5LD3sxOapfgqIwKvzc5q4L1aXFK5EfNjXiZYR43f9khuV2YLtc?=
 =?us-ascii?Q?c+hX7a3/BxIwJBVGBJjvKkPVOaobKFghTVQOQCoLpo8ZbR02v68R3UJSC24p?=
 =?us-ascii?Q?1p87+k9LCcYxhht2LYKPX0DlgPzBzTxJAiNcXYqoX8sphzqZUHQSQMl1fEIH?=
 =?us-ascii?Q?LGSwOMm1ty2V/scpChJezL1BVRDMK/KPBRnt+52joFFETL8ISbKX0834E5i5?=
 =?us-ascii?Q?iAhEV+rVy1B9mDj+iShBmO9Ym+vxykdMwvCVlyrvwM/Vn/aAzBtq2CqK3Ql7?=
 =?us-ascii?Q?WLP0KTJLGvelMNnHtjYgKbhmxgh8BNMD47AMugGjMjTWkI/LePV7ZumtEzMc?=
 =?us-ascii?Q?SerJZEHUR65w8kIjbLeXCOG3nCuqzXZ5UxPfdQIoQNwqdpy2xxKaDCarMxtf?=
 =?us-ascii?Q?yqbrkN0lnSMgodCss1a/LavUEvajQAzjX7o6VJuk5tTZl3BGfSGqZkwqK2Xb?=
 =?us-ascii?Q?IU+000+e1A3LZeFyReeXvD7rt83tZcgmHTbWv4JzvIB1FpRa70agGl7wxMzz?=
 =?us-ascii?Q?RAfyJcmUMateV1cRTNpJbYc2TIPG9OcjNx12A6PtXYr/g3w+YvY2+idVozqD?=
 =?us-ascii?Q?HoElBrsqw2qA2/AaguN6fHr6bR3+v1B+QNoRc5oNEw5WqwQtVpW0SHfEH4gk?=
 =?us-ascii?Q?s5klbLjpGHR5kmEaWew7+PdDq+YzyRRAoAHlZOhUp+ALKByZkQde3M6LHT9d?=
 =?us-ascii?Q?pLPQq0bC/9Ko2HeYZsGIC9E952U5x0nAScJms6SKxpJR9jVMPx+pFfaPqDjB?=
 =?us-ascii?Q?BOp1G6FHoxrqq9dD4k4vIm5EjTbueSmf3wJQq3W61tT3wGBibxWDduOYlWay?=
 =?us-ascii?Q?IDnyJtHImw543lmUobSx2jIUXerdfuB24Bt8zsoYq8OrlkJOcEzAbjuE6JYA?=
 =?us-ascii?Q?FZx3jUzhXnlzXQHQb/J9CIMLpbovd7fT7sjBQOpxdS4vhTDcIMb3PTZpc0OR?=
 =?us-ascii?Q?zkTlIwD8hZI+4pF7U9M65nJ9P2IyHhXNyp3SHCEsIH1rwaYWbKZ3gRV94hW4?=
 =?us-ascii?Q?x4FSW0AS/z/hlC77pUtkU0gzd+300jjlmpb1bLnhOo6KSPGwNH8RPY2nrqJg?=
 =?us-ascii?Q?rZmMZUFu1kxIMU8mIF538Inr1XrVVSugc7Hg0pVYMOoQ7FIhiOW3jgoDJpDt?=
 =?us-ascii?Q?/BquPvbH9g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9c261b-a51f-4891-d1d8-08de8994e603
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:02:54.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL9G4RT1avC5iX4VrGwOm3z8e/0NLwaLuXpefQ7BI7nY+mT+WFRfDz91WNJgHulzBzet5YRmdzdHgFqCCgFdHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_040303_490698_572B2933 
X-CRM114-Status: GOOD (  15.37  )
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

When attach to PC Type-A port, the USB device controller does not function
at all. Because it is configured as source-only and a Type-A port doesn't
support PD capability, a data role swap is impossible.

Actually, PTN5110THQ is configured for Source role only at POR, but after
POR it can operate as a DRP (Dual-Role Power). By switching the power-role
to dual, the port can operate as a sink and enter device mode when attach
to Type-A port.

Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
to control the 12V VBUS output, to avoid outputting a higher VBUS when in
sink role, we set the operation current limit to 0mA so that SW will not
control EN_SNK at all.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
- improve commit message
- add comments for 0mA operational current
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 40a0bc9f4e84..623169f7ddb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -566,9 +566,17 @@ ptn5110: tcpc@50 {
 		usb_con1: connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
+			power-role = "dual";
 			data-role = "dual";
+			try-power-role = "sink";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			/*
+			 * Set operational current to 0mA as we don't want EN_SNK
+			 * enable 12V VBUS switch when it work as a sink.
+			 */
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1


