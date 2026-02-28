Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325F9FEE4CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOlXQ7QnTo7fBDv9NGy+dUuAo7Uf6sLhSaMUOEiwaY0=; b=llPZeZYxWqkXe+6WIqUpg1Kv2P
	PgRPhbCJe3kCVpu/z0618SAaUu9n75McEfcR2M3re83RSFW31jtqYZc0mcwCZO23v66yCzq34/xmr
	PwmvxXJxleTQD0tmVSHjVuibJOHIAm0qXE3zxOqnMUkKCx3IaA3I256i95oXXXGcVqdEtxJJSf5M6
	oIysXqrrmpz1NCmEWnsAkzBXCd9WI7WwY9c/9kdryPzpoSAyKmZ9Z/phrbmFbVCW8Sr/1SqOz84IR
	nOzOTW+ZCrbmsw7ekikS8bgNhrkJ/NULOi1kBNAWenePFt60+/EwKYxciVMsA+m61BtvLqQdpWlbH
	tkE+UxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyK-00000009YRR-0TGh;
	Sat, 28 Feb 2026 06:38:40 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyG-00000009YNp-0SDg;
	Sat, 28 Feb 2026 06:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKnxeTPHneFH/wMh2uQDTX3jTtZEH6qPWo1HsGZriG4Qq1q80dlCgFUo6a/KfG5mo+bP96Z0zq+oQphgb/R/pdJOpbvJpG+zpmu8pHfH+j3EYDDv1CeTyhQHY5qlYtDeRvPbq+egjzTglEUkwlVhdJXa0wzMfJcoW6DqBFGGSPxcbpTXeCpwnZ7iHASHw0QzhDUpYXY9CCfHBWwRbh4mIe/IeRyuZAdZJ+11CgZ1zbpOQUivON4QTAaEMMdCnkw/ED4lNxjQgoQ0K3Zd6Qnu9SxEYIvEDhEda7GhHoQ0LUZZbiQjURGsaxQUhhBv2d+kPfemtSJUZKt1gS+i7XU77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOlXQ7QnTo7fBDv9NGy+dUuAo7Uf6sLhSaMUOEiwaY0=;
 b=cOi7iPl0rwr21BGDvokJuzygcJ0Aov4hZks2DLnABXJk2irxSjSSlvnvWG6rDSYqGJLMWxJ3PIhyx4TkEpAKdfbR6kRpc4K0QeGj3CdG8KWZoCqtYMOSwr3Xb5aCDg0BR00Mu2eixzrEjE8LUNz9eXosL14IwajyCbXQpMUxZsRukhgNi6HB6QH2EgqgNzYp+jcj7E4PSU22l7/JF+GgRvMSZX3bc1keNd235aEEXVRCniSAcerON6SLFR3n9iGLzolVkHvPne3aNLFjPWzBuCGMT6+fEobk6RvStg5QjWPKy4CEDAgdTm8XTmcuS7RyHIZQfoTpKfODH/pOGB9vPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI4PR03MB9867.apcprd03.prod.outlook.com (2603:1096:4:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 28 Feb
 2026 06:38:30 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:38:30 +0000
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
Subject: [PATCH v2 3/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
Date: Sat, 28 Feb 2026 14:37:49 +0800
Message-Id: <20260228063750.701887-4-nick@khadas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d34f0e7a-5838-4f29-dfc3-08de7693fc99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: NdUAEe+LRvv25zDYbbORUdavZPV6eETY05+ckanBiFnzqzAC83pirebulW5l4JUN+3aCkfWfQLTbohf5EfLAqg7bpzmvuOqFRx7No+4OkQyoirImDU03Y5J44vPsJdqlL0ppRoQhRqimhJX7cZfTb98GIzoxhzbCeXa89OWlz5py2jwE8/zpQLMRmd9jbzL1N+UxpK8w9JgBTHyeH4PD7dW1A4gw4eOsT02BZ1/KKeieM9gDKr5qaDaZl1peyJF7akYyV7ZYblVJuGuSfTB2eMqZSOTBcuVDTSGeJC3YFI/ldNY32YeBIcpiZjy2bLZKhyAOvt4CYynQWLRoJvFc2f5OMQynOeTZhlJUNPMEegMMm9jS9f3iH3kdhXCP84Wl31cNqRJUungdekul7CSyH31Af1qPQ/Uve72MELgKZcA+3iVzb7bl2hlAFLUArHJbLuGCNJikv2kHK5ZuOJL+oIvG4p7H55AMeJJgMCuqNqsW2n7D9IpvEhN0OeqFKYu6XJBUwLDfbraaSiooiURBuLqfZhwsTv8giHPUaR3CtPwsojwIusAEr+uGhc8Ur41WxWkCkZPOKvz6SWbGjtu5Rq6id/8R4VQtM28FAWtSYyBrmFNuGafc0D6ty+LFRPaiHQnjPOjZYbbE3L6+PoQ79ZPVWjwoSbHdi3l+/fBjFeil6uMb1xG29LPzRB5/UZPKREhMCj78pPu2AUjPXXAzqtY3aY40ueiFialDdFN5MXB0tS9flTp/XiZZUJPswfHxB+93jwDO9agiYFIAHHu8jMoufLj6dGS4dSqg/ovXRjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y/e/TpCEbMXiSAgtc5uqCSDU19tmd/bo+w8dLrjvvIfkHypEAxQZSaoDZImk?=
 =?us-ascii?Q?zAeij7fA4hFMANuP3CV04sU8qiTDqZltf3C/I9+P2e7xtl2VRJqJEfiDb6+i?=
 =?us-ascii?Q?B31ROcXQ7RqbY2r9pjbTaT70o3V2/mYp4axtYKX/xbShjG9uhs4btJHZfnNc?=
 =?us-ascii?Q?K29VZebZiTAbulLsBtX1UiwwTI9+f0hX1VT5f+rMCNxcSJimIxwxWYJT2+ee?=
 =?us-ascii?Q?vAVpdO8o1aiPP50lFit7zQyvfywe2kbuvKJ/xivinvW4hA4ahzIQczLFxOUp?=
 =?us-ascii?Q?qmKMPKZ2gsevE9o1rDI2X3gRhm3O1Cy6vZCldc+elZkRarY4hQoqjAFXw8dT?=
 =?us-ascii?Q?bm2vtqyiletMT2GWfrOSBXq5E0psz0uE+WNd5RpwZp0BHfT4+Xn8CQlV5v9z?=
 =?us-ascii?Q?GCjATAKFRETQ0jzysIBrjKWlZueylHc84w15XRZsGE5b548kA2k+pM+nrDJc?=
 =?us-ascii?Q?2RakT7iMpYUdC6CLHNOX7bi4pRODUj5NR9qUh1Bp+fmQMIH6XDb8ieWj1jv1?=
 =?us-ascii?Q?XblWWPV50gbxDhC2iYbCZHx/rNdTsddc0IKI2x41GySLBXrxPmSxkmEVgEEJ?=
 =?us-ascii?Q?0FFapNG3UduJx0J+CI+5mIrRjyurqLAwCETok3ijV1RGTtum2eNveeF/8c5H?=
 =?us-ascii?Q?sjsWnjeYRRbDcWXBa1IJ2wwgJTHMwgPu6comJYaY8KdgZyNwAsD4BYxCjHcc?=
 =?us-ascii?Q?/DiuyYvW7XwoF7l25rqUNr7BNUZHEwgYDsYO8XusQffe08bcRo2Rh+Bc6ZTi?=
 =?us-ascii?Q?M+cXTpsntCFwwkpDKbnZLdSTR+Q/QIQoJq2lXjlKakd33GIXaPpFuSuXYqRk?=
 =?us-ascii?Q?6EbeJLHhSRaunCETm6hgQkegbnCv2MFH6lahJmUPT9NHaMbKuL108EGnRrmj?=
 =?us-ascii?Q?yjRkKDVVpoWcoDav5++vT0T9Gb+bFCDAXMLBRL1HuQMv8dVkyUrwEbSDHlyE?=
 =?us-ascii?Q?+yZZzvRYpBch1/LXULc3FNkPBoFBxYLFOgrjwsBA8FLjAzJNYxEQCyYgzpPe?=
 =?us-ascii?Q?NIlJciG3SOdxEhuwLBeBy85lBls/ziKM7+3RQvx5E8fAFJRDSZFE9oni0MU+?=
 =?us-ascii?Q?EV2zHV/5q0INF1I8xer9MrqYTu0bpm13NiCAe4PSdwNM5lZwpUnRIfWewLON?=
 =?us-ascii?Q?Pez2iJNVh6xNsQQAsKK3MJsKofQr/92xnJTeCzmmAaBq6X86UFRyZUy8XXDA?=
 =?us-ascii?Q?rPezm2BZkftO246t66EAFvRvjXh0osQKg1qPTEnAj9GbIUxQS8K2g0O64JxV?=
 =?us-ascii?Q?wXag+1R6AXTp0YyJe3EAm8wWo2qgmIeJiMJH27Z/2sWlM89Qm1iorlM46BsS?=
 =?us-ascii?Q?O49vLvMZ1QjlKmZav7Z5QFJxaJ3eceqHRRFOxFgzIkXs/kODfcDyUhptYV/b?=
 =?us-ascii?Q?zoL812D8AGKvKg1GgFalFA2KJCqPTzuaGC36hk+ZTBJLCs3XIcgqO4qjBGaU?=
 =?us-ascii?Q?btrnpTiEeHNRQ9UdBIeoC3vjo92QSvPMlTxw0aLm1PN7rzIBRDXANQy/8Yyx?=
 =?us-ascii?Q?7UAY0Yf4GSDGI+tRniJ6Ow9fEgWE0IWZicFQxshzjKOSwdOA8F/gJBdRaSq6?=
 =?us-ascii?Q?nJsvz5XrBRFiGMjnHvMASjwQop5m1R3S5FTLCdu0cKcwh7fiwISWrBg4MtBi?=
 =?us-ascii?Q?hubrnIeHbuk9GJcmBva0abQ74Hh/4hpAA2CO4zYAvljrUOBQPvLkf1Di1FfX?=
 =?us-ascii?Q?SCCPT53lKOQXqSr9pkBt7KOe0HA89E1oepDB4cvUVxZu8PY5?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34f0e7a-5838-4f29-dfc3-08de7693fc99
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:38:30.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xq3wyTqF9dXaveg5hSETw6DTt1FZcEQjXlcR/MQJVJWqeX1jJed5aKoX2I5tZUo2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223836_191766_EA7AAE0B 
X-CRM114-Status: UNSURE (   8.85  )
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

The Khadas VIM1S board features a white LED connected to the PWM_G
controller (PWM channel 0).

Enable the PWM_G controller and add the pwm-leds node to support
using this LED as a heartbeat indicator.

Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index d36533f5559a8..0bd738c1e7862 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "meson-s4.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Khadas VIM1S";
@@ -43,6 +44,18 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
 	};
 
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-1 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm_gh 0 30040 0>;
+		};
+	};
+
 	sdio_32k: sdio-32k {
 		compatible = "pwm-clock";
 		#clock-cells = <0>;
@@ -196,6 +209,12 @@ &pwm_ef {
 	pinctrl-names = "default";
 };
 
+&pwm_gh {
+	status = "okay";
+	pinctrl-0 = <&pwm_g_pins1>;
+	pinctrl-names = "default";
+};
+
 &pwm_ij {
 	status = "okay";
 };
-- 
2.34.1


