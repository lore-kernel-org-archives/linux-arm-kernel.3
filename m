Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4820BE9A762
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PN7DUqrRxtBjIo5THdCZsmygbBhBI+CVwIVyKNrI++s=; b=FVEry+pVdTKYNlp7Jw4AbWkX/Q
	NqsioKeSqcpEnqnP5fBs/gOste/rIUkFFbM+X5wCOehqTst3mRZ1GlodPBtvfHX7ZzI2uvT+VnXl3
	IV6/92G7spaZHTus49cQ0xQm/zHUW+HVDuGRQYVYVx77N8KSjjFY9E7cL2+0fRtP5tjZgGdievF3y
	sZ9Zlbpv4prB5e09jYEpCFcYRogu8keS2dvz+ofEIx4YkNfnQMNwga/NkPoa1pt9C6AZYeBtke6Qu
	ChF7MZqYMWzpZ+jvbCHHZgN8OOqbgH2QBG6nZnatb8H0fV2819gIZu9SReIiP0usi1g6ysc9US6Z6
	LTKRYr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zXM-00000001FcG-3An0;
	Tue, 24 Mar 2026 11:03:04 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zXJ-00000001Fbb-3tz3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9hP7zq1tYp0eFNV4ielqxpz0WpFD0XYfdUZjwBUSIb5uadshyT0JQhmCU/qgSN3vk2aRin12tIO23wFs6NWnM8nRnw5HpcgETMS9kDSrtwB5JL9kVDnnShQ3I16r0noZE8vAymJblLacf+tdcO+cZdcjAEXybJD5BbRtheeIAONr7UDo0hI39YCYmKPu8f2t7BVw7aR94r4uqIPM9ID3HBBSDbSzJyEQbjvUD7g5FCLqnfmcJAue06gS0/GujloqZaBMt7gnASKuyR0TZPoWx5v9vTnUqGJnmjuzh0XOZrk5trapWVxwKm2EzgJHksrf4Cuik9kVDeVxrJqrrcpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN7DUqrRxtBjIo5THdCZsmygbBhBI+CVwIVyKNrI++s=;
 b=EyObR28KIQ0UlvPwdR535YjOehDu0yPJnsxqUz2irO11xNt5WD19tsxkeJHHMGtXgLW28onie1GqFnXaQOwCr5YVwNM/ekOcLdeiexZKjuxKouKx7O3IbgkOxuM9L5nrVqPOL8dMR+Al1Zz8hZ7GKmlFeZ4bIMHvdZzosu1BJBfX0HTGZyzfmR7NzURkC7xRunwiocBzR/zzav0r7qw/mGW2w5OgqRiA+Vp81Saq2CQ8jvhLF+rnozppP3m5GmrRn3xDggGijYsKnmFolTM88CuCXvlHUfg0kUucL8f3FqzeCEQPr40ztg0EMoedNkQ32g9Ju9txae0RqvxjrMxL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN7DUqrRxtBjIo5THdCZsmygbBhBI+CVwIVyKNrI++s=;
 b=MpH7JMPDVn0N7WFxN3o9lxGOMizdEIFuf12caxyDqmdrA83z/hkQqHx84ImaxZeCkUPCHftVG5WKZRh6r738D2LCoAmZRe3XKXVjMlZd9IEE3L4cz4N8Y3k9C/cqTtjDh44AkEB3l6vW4OgyRsLj/PQAg09b/xF+dT/YySmY3oR8mVVkZcnc8hA31ndRUWFzkMAE8/kRvOZwBWyuyd5cqt0Qj/L5VA7gRRkPt7taxJ2vKzzW0nbP6ml95YZn6k5MZfp3Ote+CPK86YWEAw/qQ5d8IY93VId5QUM6F143exX0EByyVXaRsnfcsGxUrp2WBplONUV0HBFG7GZ4cL/N9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:02:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:02:50 +0000
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
Subject: [PATCH v2 1/2] arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
Date: Tue, 24 Mar 2026 19:04:58 +0800
Message-Id: <20260324110459.2838767-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac85cc3-36f1-4394-748b-08de8994e379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1llaWU6aI0UubuMgCthphpL1nrgL/xfY0P/AXt2/28Bsvma5E+ZQcqpqbRXSy1g7ZqAJK2VVy7CqDCiz7+C0qfMYIVqC9XpPKQuPbYJORcuovmuEwZ9kYN35P+fccK+KWcw+lxKt4KAFCC2j3FdJRzesNqA6aYgnZtGSvIwg4HlIQtWoH55VxL6kv4fvI067TfZOYM9Q1RfJQqZ9P/kcSrmIvxs8L51pydgByNRtmiYKMZt901U+etQjhFQ7F5+mYhWPzG8gO4K/o8jCvOjC+uejad4YCUNO+gePLOCI/vmMfWgEV0KWNjKVlgaMhj0lQXJSZnUfXvbL72MqB0vfrWKQHCC/4tQHXxwgS1luM4dd9Ko0+fXp9N7JYqOyugC0RZpKkvsh+FC+kYRbvpO68U4GW2jgcNl4zqdWOPhk5i+Z30fkPNvJPdD8GdcjUeeviuMuiIJ3z/Q1xeKRfwFsmyFo3FlwbH/A9kVKDyH9yv16iYwc9pcBPAWlQyeaoz5M4mM8/n7h/r0AXyYd+qjCBvDS6nvHBTZjFW2x6tIGEfe4whTqb5PI8J6MxU+igqQbIH3oAwOtjOXrZmuDD9Kj2FFsV++59/if1CYDWKlrDTs47AVudOOnxYm2P593bbYVoNaSxev8Y3MOYBZnRBH20/flrfifIuLvqJvZ7IvQYiyXSP3tqHX3IHE/mybE2gPKz+tNkBeDSYhWSUqmxIlqj8s/BHiizLUuXQaqV04LZv5MyZ4wW/JPdiAwLixIFzYqEW5yUWjYHk/KmDvNgZQMW0lY+mbgMf5L7OsFjTbksns=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OuOZIx3YKtSSOxF5dnosjHrpLgq6g6GbeybdF3ik4J7hb98IugfGBgvK5NnK?=
 =?us-ascii?Q?k4CtaeReccM1NVPZjQWTOvs7ONJcs25EGNjhyVa+FtjPxJPQgy9wVaLb2Z8+?=
 =?us-ascii?Q?9Th4d/HwB72iyi+rGr1nEksq3rU8ii3cqKE5qeD3KqLDSxxyFkXg8n0yOOfA?=
 =?us-ascii?Q?NlnLOh2k+DOOBp+MMHN861bgL+UWHEUkzopMwLnVcy2cJgBUccod6vjYkZtu?=
 =?us-ascii?Q?BTouoc1U7HLHeTJw3e6ed3EmGYc27CUSIfH1roAVzqklFzhH5FLZg6uGFuWv?=
 =?us-ascii?Q?pYTSUuJM8JB3/pfqwvsjWtQhqUszquMQKyyJ0EvFJ/TKbAumjMy5j8r73oKo?=
 =?us-ascii?Q?2Anz4hcwUFFBcZ3I8qfKN8ImteVumk9VXJAe5R8xrvjzpFNaUSFPSKXKZzjf?=
 =?us-ascii?Q?a8kYw17bOV4BPSm5qkwj0fryO0W00OWdleOoahYtj5irZxZB5mUt0oWLXA00?=
 =?us-ascii?Q?qEmLMHhF2fbs9j5VnUfRocYpfljj3d/3g8bDH6Ks7Dlhrmfh7GKVChDacccj?=
 =?us-ascii?Q?a40ROVkARj6YVq/XTMk1nnpdu9I6/LRU/j4jEoo0oO5GglOj4hLlvwcJgu1c?=
 =?us-ascii?Q?b/CFrfifzsut50HUn8bKIZchdLbD20oHEh1/AisXEzl1sy/PXXuilJU+NReY?=
 =?us-ascii?Q?VLMtFP0CLLVNIc1NF5B+PiIDZ4mRfKzaXqwtv1P8rROGVy1gXsBoEis5047m?=
 =?us-ascii?Q?DUhLFVS+ww33GEzy9JqdWoy2NwNpkTK9s82tOoUr/fVOT7dazTesy8i+A7vV?=
 =?us-ascii?Q?rmgIcEVm9aypcMswxDW+J87zKBOFkf1nMauZVF99ZcP6cFT1KddNeF2J3Kv4?=
 =?us-ascii?Q?UJ5y+uCCJ6GdR2D29grU7gLQrOKl/kkKFioeauRyEoeS5CmKmr0GHkyvooeW?=
 =?us-ascii?Q?nCSmM1Ytoik+sQ1GOrgr2YQ70ESngtEuzYRpPIbFjDtTwPQZzqu0cnS1idOA?=
 =?us-ascii?Q?/qmIR3zDdov9qtdtooR7yhpfj7xLDPkEs8AS9b0q0kddXcvT/VTkYpHg+Vcp?=
 =?us-ascii?Q?5W/BzG7r1f8V/tE2MrFd6Nxt5ZzV89Fsqpv2XGordAbWbt93HPFgpZIsDPo1?=
 =?us-ascii?Q?9mvuaMVMJeyZfUgnfObEwoKLub50Fleg0R5W5g24YeY2cgMTSMnOFJRHr2HX?=
 =?us-ascii?Q?cvCdajPJnh0WRVxrlYzKwlwaseCNeAh2gzR67pNGVNlaYDN+TtTt1O6Ygqdt?=
 =?us-ascii?Q?vv2PYH8UfN/fiB2h1U1AbVH+lc9IjFuwDeRbfV8JCE/JZIzbZm3iXzMgSDBc?=
 =?us-ascii?Q?HP42EoI0+YH2S22X07pCxjeJvOSSnZlAusiKF/8EEW8BEJay1lWoeExUoYVw?=
 =?us-ascii?Q?1YT6FnGLYxvW+Q0RrHlW3ht7/sletOT9y/0eMmOtzS3OU+uh1iLWNAXyzOVU?=
 =?us-ascii?Q?5ljj8QNj8rrp2plc1qVYpbeydWdL5elvuc/LzlrHcbbCSWB2pE6oKwi00N9E?=
 =?us-ascii?Q?GWavvdoVWlRDZWa5OtNcAz7XwSkGeY1JlFall/wxqE2l7pR+dxopmfq1/dHS?=
 =?us-ascii?Q?aHoitWW0uNTw98e6A2TMYnu7IqCh85al18mmoyamAywIit1CnkGIQDt5EMrb?=
 =?us-ascii?Q?8Oldu4dOPkpdIYQ0CQCjywhMU/DiaI9dmE4N7McujFOaWe4mcaYksbmbz3Q2?=
 =?us-ascii?Q?nTyPHmOG9aVPYf3h5cWKvAcRnJqnPlNmjJmvJE2vr03RqUEIgmFB0qvw/ydT?=
 =?us-ascii?Q?2Oj5bOst9pYr/Jzwu80UiLs/Rl19GCNiMLHSCU73lVh+ihNu2zqfwE8+sQuA?=
 =?us-ascii?Q?nrAATZV+Ow=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac85cc3-36f1-4394-748b-08de8994e379
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:02:50.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiUTyzZDv/YC/Qn2KAlDuG3xh/PUXystI3AYfljjWJqU7Q4lnaHbq3+D4utoWYnrY2r1LJNbuQBZ/8+iLkTp8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_040301_982603_4555B3BA 
X-CRM114-Status: GOOD (  15.09  )
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
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index dadc136aec6e..011a89d85961 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -611,9 +611,17 @@ ptn5110: tcpc@51 {
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


