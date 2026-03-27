Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B2910BA45F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEQt0JYXkKWPBkfceFzvuMGGjlzUh2wiRyPBxrQntFw=; b=dCKdImoOiT3eM9B4kLTfxFqdab
	1rni5bYjYcpy8p2jKjJTGDJy2Gss94IRtDu//DH6sKhr5wlk99hlYTJLL9iphWAEXWwOC+lHg3MI8
	pCotng2/yxzvjKxfcfPGGnwxmazWSJMStxTGAAD8deAA3jAFIoTSaE4xCblnV2PRWAw/X0MVBYSA+
	jj8L3mLVkLfBLY0JAOLDUBE2q+C9O6TZ8hkk0y2zhy1T0Q+LNqdjyL/1AWuz1dswLOYfPkRF/Se9T
	ko4mi2W4kS6bh+/aC3t2g0kvSOF5PZksN5YR7K9Vx9MCoB9T2KalaFudxGK94WXbN3LGyHxuHOJkU
	yqbaI5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wk-000000074ih-3lnC;
	Fri, 27 Mar 2026 09:30:50 +0000
Received: from mail-japaneastazon11023129.outbound.protection.outlook.com ([52.101.127.129] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wd-000000074dZ-0V7f;
	Fri, 27 Mar 2026 09:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZqdLPtuOxWGRTiFaBN/GrJi2AnGatkBWJ1KKo/2QQfP/d8MPpMeF3Ov2GxN/QQiW8PzKesQZbbHuzOVn6tDgae3BYqPR56ZpYGEL95Bq/Lv2m91acgRFuHmn9D7HddkNRgenCv17Xi4WTLOoLeA9gRLVOS8FaiupGPlECp1agIRT9fyVmKGzSp97t9J/7QPU2cKlifr+mJ9k5EAWt+0VbgjJ2CbrHJ62ZebFNm2i15r2KBczRKyFiKc8oCUc9lsdrtc2dST9oLJfQ2tWxCFpQibISjJ5Mx7kV8gXdUqIGlvDwyp3AHI6Qd7c8aDJp/8BgUruMlPyEdGZf+NRGftVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEQt0JYXkKWPBkfceFzvuMGGjlzUh2wiRyPBxrQntFw=;
 b=WFMAEYBykwxpUU8xkRePdFbqCAjGRu5R0ln/IleB19FovUhT8A/25Lvo4+qjr7jKV99jkdi/68n2pb2ga5lVMSMkCW2OEmeKXCdjUJFwTJ+sQdJGW9nqqU2THrq7LrT6QUpoYbDAXXoxXzrzs6lFdcrR4SmkH9wzRuqynU7VYnwRWkueeRNDIn4EB1JYLMJuqhTaGa4vXXLyU2TgIS9t08Tle81uSZOb7wtyrCqDcqoeqOXetogVpz5PsRs9NTOY92r010Hy/Bm1v1VOQtUSeLfhgwF8U4Qijlu5jfdhmg3rabSquSNBZTwqXpa5FLMYKMMicDHhaQN5W0bOnVQwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:34 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:34 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
Date: Fri, 27 Mar 2026 17:30:15 +0800
Message-Id: <20260327093016.722095-3-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf7b5e7-40ae-47ff-be72-08de8be37f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: SfC9qfDHfjbGclOlayCLDjnIoUEWxGvufbxxrWkRh4g0PoV0X/vwou/ktsEHT+OjMYkI1rhRE/TbCfGXujL5IuBPdIjNjDhpXxpiO01fuDaq8jQVHpD+JZ6uv5QXYmBmQJxK64FD0CuvWi4E7IbW4cowy2px4FPDgX7uGEygOvluz9fZEtzIi2VrBpaY300EANfpkFf4FHd0IqCEPTELVM5uI8x0/P5z+rCXHCyTiRbdmIMNtFg/tEpB5QflP0Wf3wKVJua8/MlRf4YCLEbOZHFPSd2XZYklPOBOme76iosDX14EI+oI0ZUskWtu6DJP8tao7G1d5AVjbJ966FjizZRBIoKFxD1RjbE5YJZBn4OCNEVX8sg9iA2XapgACG+CsgxINni6OfuBboC7L7oU6/0+ahnHY1Nz0Xkv0LFubQDLKtHBNjcwCwxTi5GJxFUyi/zDu7XEFAQo2d9CgyVrEA5fD+tAXgLMxWfeVVh1MR6jhsKjVQbrli8u1MnvOVMYNDLM50YmqHEalqLtNcaNZgzkp2uX49FEAJusUlhYeYdcpG2ex7XtGvfX39O8Sp2e1LCnTw3RcLnOoOAuMDAz8Ar9XnzxBQuNp1kWn7HrQax955czi4kwoKcQYdAWIG0dq5TVd+F6+EYNbi7IW8rftirF0yk48ArwPAhnW37WwzvzlV0rAsOUTrVTsxj9ieHeHsTwWm4oe1GyY/1HpWUgYXCb2xo5Z0JLyaHNjpVwC/dxn4vrKj/1c5OPkIcIH3w9cy7UUC3X2CNOQgXqh7TVtwAjfyPFsweW1MS/i8ZY8eY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mBYqR/3im5npAvsB/D8ORAbUhLpxVtijEYy83BPLSCnTAhtTsueXQHzpLooh?=
 =?us-ascii?Q?eOPZFBOwnNZcO3aqkK8JkqLBdeYPlVOmwP1PqVcPETP5MUdAEM+K35uYOIAw?=
 =?us-ascii?Q?iZLaMRwCYfwlhGlJNOwuYiLj0WJ54SyrKssX8Vdu+z0JgylKwQ3UVjD8iZ8j?=
 =?us-ascii?Q?VIYzo2ESuuGAIsAcN+yHmOrBsl9C6reudpdLX8Ikz2Yh5A1HQXEpDhx+UXNO?=
 =?us-ascii?Q?V4KZZ9BCDLJLnkwyr8ywCV6EId3F/BdMowWa1C+bLwmq56fCUfC1+MpubS7N?=
 =?us-ascii?Q?Vv7Vv5lrAujTMpF/sw6OjyStaPUQnqSxk1mcnlxpP4zDfqSfWZ9A/JLZp/ct?=
 =?us-ascii?Q?y7TXOCymGQybQ0IqFHBdIRDRHNCI8iL9w+DKXgndZDO/iNPB0k7+saft+m/s?=
 =?us-ascii?Q?h10UR3IF0QLlYRN8/lI99hEinDpUsdbfe6754/Ay8htceZNj0XPAgBYjXCTQ?=
 =?us-ascii?Q?u9zkiRylYfrKXzAMn3jZ/IwKigsIbBox5VIWXmENiqnijQU/7x9b5nYyoIlH?=
 =?us-ascii?Q?yByCh4gLTRLGs3SZbXvxDG4lMseAHByMsKqDepTU34PWaFB5fcr0CIX6bzSy?=
 =?us-ascii?Q?lW8dYwlUDI3aOLupPrO9uUAEXehRnPbs+iMT8jogDUziXn77l6Die8zebO4Q?=
 =?us-ascii?Q?FBmY6r6CbCwogSBXrbEuoTDt8tIWAMhy7Ow+3Ez7MGBzIFy5j6wUMXnuI3uw?=
 =?us-ascii?Q?/SlCQhBhhovxt4PqtSUAPnJNuXA1br3ktyb2vBkDnrBvsx3V2SZirQLYYWFz?=
 =?us-ascii?Q?5qBnKxfsvFcqHBCNloUULH3EIQfYkfGXXnNWqVFktOO8C74WE1sbup282qD6?=
 =?us-ascii?Q?Z8I+mhlioGvGRuo9dGZNmO9vRBogKbcGhR+a0ndd4rxFCgKlMcOeXTc6+8bt?=
 =?us-ascii?Q?93MCq22UDSneg1hMB6FY3JLAt/yMwfj8hZwU+MBqAxdqtbkWf0YMxKSZ5vD0?=
 =?us-ascii?Q?EVtPublWKeZjWBvrE5aZXN2tMsQfCG/MJdjDvDTDH2ZlwC1B8wu7ChKKCe5e?=
 =?us-ascii?Q?atZj5EV50HNiN6qd+bC0jCFbnxYjXyv/be++xIy8r+T35XxBe1uc4tuN2Y8i?=
 =?us-ascii?Q?U2XNJP7cXlrhzuP1BUujJwvqBoEg3IrHyD2F8wOz5QBorcXUl/L353hkW5Fe?=
 =?us-ascii?Q?+8RwpFlWaJn8NpCFxxWqXGX4xGycXdp84jqEXSJ68ubkBWb1UyFQ+rT639c3?=
 =?us-ascii?Q?oz48ZO9fzlKWxj805NKubsUA+9SbRMVV2CPAO1dgJGrBPEhHRgySa3DYIkmf?=
 =?us-ascii?Q?G18Q+rWXRiCxxEiWriIjYEO0ooPtQ3vZALSQSfp8R6kLnQFDv87z2jxS0gbB?=
 =?us-ascii?Q?lx83327wNMjEnugdS2AYAamHokL8wl6qcah12fZZ0+OJXUh4YigDycSakDJz?=
 =?us-ascii?Q?8SY8WEsrxw5l8qO/3e5EMJYkm5Zuvm9/eVInUl1dT8e5vVyeUdvz2eB1adLW?=
 =?us-ascii?Q?tYFDPT7Om7V0G+xXarZfjlv/6sazaj5GOqUqJlhpvMVjLMz4ycNCplbXDFmg?=
 =?us-ascii?Q?5HcpmzKRgluF2iPdC71+0mt0B0TnhJxJ3mHdP3zawi3FNW/P/Tk8drKyeqbi?=
 =?us-ascii?Q?APmLDBRFEHmx6a0hzSFLODFoswLQcxre7h6dkCCO9wWGf6JJTEjGJOOJ1G+e?=
 =?us-ascii?Q?K5xE4+9MmRbvC3V0DeOseooWbAyRix/hsj18UibNhHbmmpj2n7+qX/fPQQl9?=
 =?us-ascii?Q?RyyEyjZVnCTF07ftNpYLx+Z8uwwQjKReocoqmuOfVCaozPXj?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf7b5e7-40ae-47ff-be72-08de8be37f17
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:34.1617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuyIiIYk3cvuTDPhZiOI39SesK8Ns72E8clJv4+zBehIsz2xi4LLhLMtz+BUB4Bo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023043_161433_8B580D90 
X-CRM114-Status: UNSURE (   8.56  )
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

The Khadas VIM1S board has an on-board Haoyu Micro HYM8563 Real Time
Clock (RTC) connected to the I2C1 bus.

Enable the I2C1 controller and add the RTC child node to support
hardware clock persistence.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 792ab45c4c944..7314e0ab81da3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -20,6 +20,8 @@ aliases {
 		mmc0 = &emmc; /* eMMC */
 		mmc1 = &sd; /* SD card */
 		mmc2 = &sdio; /* SDIO */
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
 		serial0 = &uart_b;
 	};
 
@@ -223,6 +225,19 @@ &ethmac {
 	phy-mode = "rmii";
 };
 
+&i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins2>;
+	clock-frequency = <100000>;
+
+	rtc: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
-- 
2.34.1


