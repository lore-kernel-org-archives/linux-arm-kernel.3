Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A9FEE4CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWz4TaMGkb39+r0Rxj52QVnZ9T/Xwm7dp6zyjarHMsc=; b=FlyQk/QMOwYLfcWo/aXd+iI0nU
	+WYbF+SIZTW4Vv0DRS9Cq8RRCekCLi6RCFy0RiwJ8q/+OTl1LBseT1944O8EhaRQpQSDDWm3Ky26V
	rOkXixGp/FSPRD7Keermxxx3Y9Si2TauAqLQKtCVbwB4hy1/CrsWdnZq2NeefsE7+eiNcregUF9Wc
	8CV0kAdXWJleQB/h29nK5CGP4Dz9p4YUkckZQloFcVkbRrpzzBTmJxOTUZHBuSuKBAZejdmbveN+o
	PRZGoS15xo8ZwSpKLMelHTbxJGc/0haFhEEspm1yetKeIV1Sg1n5vlyYdYFhLoUaxAdtNyT6dpV5N
	Fpc4sYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyN-00000009YUl-0xpH;
	Sat, 28 Feb 2026 06:38:43 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyI-00000009YNp-015H;
	Sat, 28 Feb 2026 06:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7Zd+2OSuXWyytPyRLwYT+R+0iaSQFcZGMRNILlzrJJF7x2w+wlxfVxYE5bn4HI/n7CNeyHPKm6uM8n/Ug/DfED/FX6BIBO3tuTnX7JCXRBfyVROPwdmSbwRJNTp5WjtoamO0fytZiGW4DYgoNC6D928lOLA1UKsHeF+WzojfHh3DHvArq6IP4yb9m0anqt767UNHsFf4e0hyiUWiFWIU5tf8c3JjCObT9AXM3hil5Wcrm8jWBTARt1g23XfP1++yl8W2ojZPZpOFF4hucSs/DGzm7H/sk+4IfIyHxid2my4rEoyacpOMYQxtrtAYtzus+4ajscrdIxlmmj5Jvxs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWz4TaMGkb39+r0Rxj52QVnZ9T/Xwm7dp6zyjarHMsc=;
 b=m9a0XT/MHq+IZZwXNgN/zUantvNURNSOcFjZsT17KISrxP/nMCsoe5e6XEP00vVKeCGT2W0X8eoZFnW44p52z7gfUKHsM82Et8Tu0fiSjTMPK6LBG7SrETvhphbqd2wfR5KIKavvkA/AdQ7AHeiftWvN8riQJqVAGHD7vW0GaJWJdECl8/QzG+853Uxp48oLB+I75Rlbs5C/xbraU6QjMstGgw43esfB9YAHhIrjNs6TNxVAPc4VnBJmTVa8PmWItAHWsLl3e4JY51A6omBzi6iXyvnwBkaMuvbAjImBOH19aFdXRidKNQnoh9HWSJYoLN1NSMaPgxu2iW/1yuTf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI4PR03MB9867.apcprd03.prod.outlook.com (2603:1096:4:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 28 Feb
 2026 06:38:33 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:38:33 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
Date: Sat, 28 Feb 2026 14:37:50 +0800
Message-Id: <20260228063750.701887-5-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228063750.701887-1-nick@khadas.com>
References: <20260228063750.701887-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SI4PR03MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b9c7ea-13a0-40f8-3e4f-08de7693fe0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: Wnd/Lswt2KtKBpt8siR7AhiT23+yWB291EFR3LLKBiSNYAaSlnPKZeSduaIPRadD3oRPJhXF/doE8rIjePIpFiEa00T0U02zdTnEpZSQ/o8vOAyg0MXRls6yT24M4YU5wXU+CUJ6adMRR+VRpNvihQ1xsWp2d4miYvry3HMof4xj/P+Gb7fCOId/tSrFvWQQ6yZgcbwfl7N9DADC1NVsh8ezz9Fy3jbnkf+2FQKfSm3fz3RGspGy2FqMmCky6ZwS/esIgPVJzPgCw/n6tHIz5r4lpN2JVzp1eylK/e4MOXpAZLuGbrPQ+1CZgKwKbyWTldKnFbKznxjCv5gNSZfEV4ad63WsrHzbEjc1+n9U0EYTwYpVkBfHK7m80MQ5sGWqO0IabqCCNMLNEJyxMGjkgIhNplo/LwDC+qQzyNUWhANTFWv8p1CdpHcPOAq7ox/AW77hgD+/j1mgOr6P2JauRWqVb+sko0KFG0hDV5YyKwBJ/gBRoD1IerWQLJiOxXxjio5G+SnUgAO/TDy1+T4K67sMFDS78shKAgqyYlsgZS72q+kDKf4LMgbNHfHaeepr42PFqrPtno9c1z0diHUcUxpE4un948gihgbrsqmUVv8yzSUobWYhro1UwYP23zu7bLyt9hKm210kG84mvhNukMnmHsUqlbp5+beGfuj7ymNZPCNQuLLXOqTItvQ9tVlAWvp+NS/U8vEUjsBZYhlKroSCNg8G7l0RBb9o52cI2dcSCazKZZu1atP99EPs3KJyKDGUHBrHoJy8OMy3rOrZB8MuxwHwRv5MAubTX0uhlmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp7Atz6A1rdFP7Out1TEBtTLAcYFlex1cANrBHymf9qcOjYGw/ORB8PRFVgK?=
 =?us-ascii?Q?qbyhdqjqKCLq6O2poZ5Ut/4WjX/c0LNGQNNXKyAX4iWphZ21SSXTXGffJxcf?=
 =?us-ascii?Q?IpmX9r6HFYdkueo40OVX1buSB6hGx3y/evz9Oe3CjILMdxvklRRTbL7mGCXT?=
 =?us-ascii?Q?ISYIjmYU2ZjkIJzsWQHs8S9shHVfGUs2cXCEgaarVs7Hxvo8jPMhJ1pgRova?=
 =?us-ascii?Q?SgdfBLjWED4+UbCDd0Brhtn8/8D7ByMu0VQbS2u3FvemlvJvViiaVZ/KqSsc?=
 =?us-ascii?Q?SQO6r590Yxv1GE6OqVZF39T4RWhB2oY5QGdZl3vFVXCqwYIfNzbvL51N8C6L?=
 =?us-ascii?Q?EpofwrECwHuD2LSVgQ09L43VRrVFYRfqNov7tcqiIqPCtvgpDsXzxS0fwLgr?=
 =?us-ascii?Q?gAsbce85ITeX2uOvJ93evpiJz2Pi3NbxtPEPnn0+zNBg7MWUK2chVvfGyAyK?=
 =?us-ascii?Q?qeRHWoPag+W1BAmiiCc4QNyMsf/yGqBeLSObWzPc3XFQ7RJLSKvLlSrui16O?=
 =?us-ascii?Q?yCu+JU6dW8/zZPuWl9+TGSEgCvQ6J5y16l+BZahVI+cEmArOi3w7vQ1LuoaT?=
 =?us-ascii?Q?55PONlQITbya5sl00YW879tZuUdLPz+D1a4A6zniVXm8SqTfCs1+aDETZ8aC?=
 =?us-ascii?Q?LxtUmuiIZdmXPkOBxeqIBB8VJgXpeA7V9Rat0CZupbQ2uHONOkt5GrJGO9vx?=
 =?us-ascii?Q?Ngac7qzYhfdF+zOXG0e4E+drsD63T1iYqi3HgG27xuPwwL0NUhqEElqYmGcF?=
 =?us-ascii?Q?LjaZt427tkX458k9PQi8vxte1iaS4wMZAZ68zsZzxTX+NBQA8z4B9U0wpW1Y?=
 =?us-ascii?Q?eu/n8Dc+Njio1T339hgqKxkmG/Lm/nCctE3jFgHrE3wkIXy7Zj4zJov19RyJ?=
 =?us-ascii?Q?sVgAL4zSY28wIAtpmPsiIaOI5kjLVylchf+Ntg/72HfG/ZMMw0c4wojbCN5a?=
 =?us-ascii?Q?kH4x6f7MnxNXZRMilMR3dQm+7iGuPrOMJD+dmQV0EJLVu/6xdFadJA/OR8Qh?=
 =?us-ascii?Q?sE3PzD00vGEfpIrScFdQ6eJyQa0zuFZ4ZRGTcKjOQJGP/fz+yBYPUR5iGc89?=
 =?us-ascii?Q?dPoX4xGdEUEtudb4Ei4kIPTJDp2qys6LFHtF+sBvDubS9fuDmXOEjuJeMm1x?=
 =?us-ascii?Q?G0y/lY0C++pJaNzvxAtOX/LAty+Auubpaujo2VWYx999NPnU5msBiFm+7afK?=
 =?us-ascii?Q?QmzFzmsvwY7POnMFfM5Ol5S1hbC47E3sZcgLbqz+OKvypJ43UB/N3F1Xq2Ff?=
 =?us-ascii?Q?1YMTpyC0Fao1NNwG6VgWjHH4SjLIzPTZwUeL1favMcP1No0dJG0g14THXUz2?=
 =?us-ascii?Q?k/tcYp/B5jXZ4yamdP7z3ZU55ne3uIne6OtAoTO74YI4F73nY2ORR/jmGZU3?=
 =?us-ascii?Q?nldd3+8KANSkgjhxkzBR0J23A3ssdYOTb+CHq6GP2o5FfeYsrSU1wu/lSKp0?=
 =?us-ascii?Q?K53LNpBBrX1mnWC2/vt2zP59igpNPN1dxoT9pnZAP07hLZU43LXo7xaOssSO?=
 =?us-ascii?Q?eS6ls41RgLzW1KaoDLtS+8AoHRY2PGEJcf6M2R63o/twRLIy1gICusLmrW9e?=
 =?us-ascii?Q?ArP52bIaN9s/O3qlUJOQJD0FQhjE/1mg3f29fWDOz/czkpme1CmaeE9UpQQD?=
 =?us-ascii?Q?cRDiRDq2T2FQlFTS4mSSRW5jPGrGQNcWoNEiaMQq7/DInvQrQNlttmPYS9in?=
 =?us-ascii?Q?qMBgF9beKpIrkSakxi7tQfodcFbzlwqxwC7MzImrBM4AZKEI?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b9c7ea-13a0-40f8-3e4f-08de7693fe0a
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:38:32.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcZ0EI9MlYW/SCAxYuDccFp8DmTl2HiNcLxglBhN+Dp1E0uyE+b52uWyEKs9aISf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223838_050718_6DD53D79 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the gpio-keys-polled node to support the Power button found on the
Khadas VIM1S board. The button is connected to the GPIOD_8 pin.

Use polled mode instead of gpio-keys because the GPIO interrupt
controller support for Meson S4 SoC is not yet available upstream.

Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 0bd738c1e7862..664d64a267f2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "meson-s4.dtsi"
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -44,6 +45,17 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
 	};
 
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		power-button {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio GPIOD_8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	pwm-leds {
 		compatible = "pwm-leds";
 
-- 
2.34.1


