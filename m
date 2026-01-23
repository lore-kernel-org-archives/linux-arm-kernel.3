Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A898D6CFB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nyUCQ+oZWnMfjmugvFrjPRiXd9IUcCD612Vl90c7uk=; b=tKgvZXN/pLIRCVNl64kFMuhFkl
	eKveHmu/DQqpufiZNKRk+TcnVLQvOoLksASz32UAp82JC2HS5P9BjAuuM/zv59nhuV6UdvNRZGvF8
	QBgI62Bfc3YD4Tp2d0LE1w+6vIVUxTRtHXc61Lm9bTI3xEQiZ1gj2KhrXwj8IfFQOrPeENrRcabkQ
	7/BfvyqPz+hJw731AVlP4Nn7sc148DMHsMXLbEhyB3PLR3pC59umBuADkBwJrODJmWStxb/yPorFd
	yLRAt8dxIee634bqV6YLJS21Q0v1YcZ1VwdNwyqfBqcW6j8uaf/oCWEcjyVboSritycNKkUZQsbhT
	HAppoHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6pr-000000081lV-16zR;
	Fri, 23 Jan 2026 02:23:43 +0000
Received: from mail-japanwestazon11022078.outbound.protection.outlook.com ([40.107.75.78] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6pn-000000081jC-2UbH;
	Fri, 23 Jan 2026 02:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7/ly9LSn0eWsqKx92xe48Qwg9h/jcdzmMQqUvsgOzjn+aYWyTP4dSNgQVoOIGqAWxdC/0HpjnA3eWug06OkNMytouvNkVoyceoij9hJb/KDi5084Ibbzw33qnRsIar3+TJddLmggVlbj9C/gJPMthl/hCP8d4YgsRyrVGDwXzUqy1rL2rzKK+F8vvaeyPN+lYz9lD8bciP6Y1uJ3oavEAWF8qu+Dk47TpMRXUjCvD8/YJcivzS6pscNJ8jUNoFS5/hp1bawxVl3igN+je+183Rda2VeNsdRNQf+5utEp1kgyXwQ7Shv5l4bHE2CywsDLwmTtYShvnxSeel6IJnfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nyUCQ+oZWnMfjmugvFrjPRiXd9IUcCD612Vl90c7uk=;
 b=OaGF/stPKm0I4anuGTiMMf4zNq0J6gcKpf4SThzhqr23Kn3lq+WPuGURHLBIkeOgx9cKCn9UDQRbSyfvfuznWSrGi83UP/aV1rsA6ajYgunXfkdickF4nwX6YX0/U7yqgkr1Bi239hDnGIcFWA+ZN4JUlAaJ4yq5fuj6KyLuQig7wSm5aL4imtZp2ydQrxy5NmHXqBcFee87nlisR8zvHWoQ8HtuvNjJ+XbxOrLJppzYq11anbRQdO4icOTlP8Om0YeEmYK667n8Rm5rU+YNtIp0oiimYRkucZemkjvhNfQutOHT3rthSgJpCQluzmnEFxF7XIF8GOveSA0vnBJ/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI2PR03MB6590.apcprd03.prod.outlook.com (2603:1096:4:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:26 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:26 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH 4/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
Date: Fri, 23 Jan 2026 10:22:56 +0800
Message-Id: <20260123022258.136448-5-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123022258.136448-1-nick@khadas.com>
References: <20260123022258.136448-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SI2PR03MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 117445b1-09f1-433f-2f30-08de5a2663b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hR3Xd+iejVoUxGnrSto3DAwUeiiaaW1TWMc1zhuEi92HHZdLWVAlGdwyyF5G?=
 =?us-ascii?Q?ion2jWMDxWEhd4XzI0DipT1HBlso6z9tbD7qfrE/GcD49wK1FjpZsr+2auXU?=
 =?us-ascii?Q?Mbq9HfST2xrp+9ONKZiHGofWgn2WLHmsrBVKQrvYh6fURWGRd/bkfg5dW5B8?=
 =?us-ascii?Q?Mk9fOZiu7wC0PVuiuDdE7WVYcE93wE8WUM0Y5K1tk7Lwg1sFQSYOjCCj2J9k?=
 =?us-ascii?Q?tqrp2A09dDbOqpZvSqmNqGx5sbl6haKR6rS+qXwhfeinpbPaq1+uw+gnDIE5?=
 =?us-ascii?Q?f6wTOa37MFb7rMmCJUz+m0ONYuyj2nfrmyep9RnCLNcMrf7stH8xL1e6jr4q?=
 =?us-ascii?Q?bJC+KDsodaXVDRbH6bl+0ppsUuWx7jZgvh9Kj4wii2cxfQ/o3NmvE60lNgrE?=
 =?us-ascii?Q?1HIscQQrSPpJdW0+pMxT2FWMlePihWA8si8nczM1hhg/dkbvJTn6KQzUg4Ea?=
 =?us-ascii?Q?vCuSjD6x5VMKfwrZs2txChJVJ0W8bK8KIxDGic6BjjJRzOJffURxDoEHxph3?=
 =?us-ascii?Q?zstKvxSehAleIj+tI248kEuvGnplj7Dtm3pfrj3W2fwryH6OQqw6rBowE/H+?=
 =?us-ascii?Q?xIVBDe0OKFZ4qs6PMeSN9jnh/FK5zEV2Deo84C82xwali2nZcv38Jg8u8ZnK?=
 =?us-ascii?Q?hrYzJDvvvN5EFSfjzzf2yQfIT7YC3v+z6uZokBYgmKsO1yNUcsLmBaSqPB6r?=
 =?us-ascii?Q?TNYZipLCgeZL2EfBPGFrLrww5bD9V2DTe+7X/bsl3ZgQl6ZJtnq3vxnIdnZ5?=
 =?us-ascii?Q?FRsxpBYoqX50fmBceWZ1/eVRbs1wxTcEcTSBYYuOwU1mEVDG/uLZyxyvj5RW?=
 =?us-ascii?Q?OHcmZbZx7dIlJFARJ5Trx3Wpg/CU1V1qobdZJfVKjLTQpcpCTskr1l/fJ3PE?=
 =?us-ascii?Q?UqfZYvj6i7oV5cqRaJg5tuN6GVmtJfAQc6x3+uBDdUzhf2mKZF/fEoDC8wzu?=
 =?us-ascii?Q?RWIDx39EU6FiuixLH3JnMX4al86z0rzPL2zqcGKcV2Q4NvvLQ8/lvSSYcJpf?=
 =?us-ascii?Q?yuhFbEij2sWwhYJ4b1tr+GJeD2krS8WfvzqMoMMTirPRqTCMAOqAVKaqKZFw?=
 =?us-ascii?Q?RDh15eaRSQEg311YH6znSHHwwMI6cEHuIZE6rVZ1pCOYKbgWvXg/vxgZcQ+e?=
 =?us-ascii?Q?AXVFGfY7imJAEk1Oe/6IyvTi/ODZliVKdg2V3NFejAS8BphKeyw6SwSOOEn/?=
 =?us-ascii?Q?DQc1slvH8av282BiQwvva4CWmRz71bdWm69FEKH/GUFGl0UA+onp5RO62u9B?=
 =?us-ascii?Q?UT+JFGDMBzBwqgmDRLTa741XGsWyVOsuNb+QbMFGKqhPfE11dVqyDgxk8krB?=
 =?us-ascii?Q?ULX0DVT8XxFavviqxLHtwFG3P0U67JljN1eaZOgOYgiytFZGmQHJT4Pvmspb?=
 =?us-ascii?Q?/KaR7u4alR76VgzCuj0/8PH1Tj1QXZSsvArh0MrywF0Y5ZJwrumdNuTeHPsS?=
 =?us-ascii?Q?bKNkc8Gb7UM0PUHaeB9Kj5HFoznV3VYrp3xgXHpTTslxP5uVNrtKakoaIQoQ?=
 =?us-ascii?Q?GfRSrXizqj14J9f8K8nqNwxW2fUZ3jejePcAZvgdzWxf8WxyplbhzyVGz8Yp?=
 =?us-ascii?Q?97FpCRUMUe/vluO8/uCqFCP1Re/VKFS0u+VuOXiD5Up2UQAzLGpAXKxl3FBz?=
 =?us-ascii?Q?HldOzXqjOg/hA3kbyd5s5Fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AXQuUNYL5PLjBXzc3gBvQG9+bZhT8canPlPdp734bbno5P+qydcioFzGK9H0?=
 =?us-ascii?Q?5590IErLVqi3ytbEbeyIP/5zgt7R4xdLNKSbxCGrga+vHvnGPc1UJyd7GKKs?=
 =?us-ascii?Q?AjBbcwxA3v82kdzbPlbej9cCffflcFtGDc8XGsrSjX3DdLNELyr5rSdlTMUt?=
 =?us-ascii?Q?ffm38aIW6YXixoM20rqca0MwQSfAFO+RiIhUK1PANVfDBtpq1id5BodSt0EQ?=
 =?us-ascii?Q?2QM9ixLyiTF4mEanapILznA3Z2iYdbD9P21B8yOGWyBO35ivqFqLWL5rSZ4h?=
 =?us-ascii?Q?mH9m1zC2Dlph2WB+FsqsdFsQ0NMkeN0qksgwikoLdwT5T52n/iaRcJ4Q0gPE?=
 =?us-ascii?Q?5CF4e26owIWmoYR3QrIpjngn43xvka9J0WTq3xPVmCI/zTz+bB1c8aWlf3oP?=
 =?us-ascii?Q?tmjKRSjGvsh3PAzOfdu7r8+Y6iCTWKGUyIUyc9c/COD7gnMvXMscYWL+aukN?=
 =?us-ascii?Q?qUdigzZMdhV266Bbfs9VApW6yEL4hBiAA2RjjW1z2OVvDFW+1XIjdxjs4h83?=
 =?us-ascii?Q?ozdqBQz3mdsi+eJsMTpWDKopUDRg6q8Cnsts4hBn5aNC3PaE1mPDCl8CMt+F?=
 =?us-ascii?Q?13dy+/wv47CAc791dogl+uWoVtOGrVK45n4r55ICsLDvRSuWo9QGR4f0/FJf?=
 =?us-ascii?Q?U78zStu+jvEcN+MS7cesOXW/c3Z57/eorxEWJvv6lp/5MmTOPDZoPcc2OrQY?=
 =?us-ascii?Q?+DFads/K7dt4CaT0eVHdZTKn1kPFsXFRy2FcusnNBhWPLgPgqRox1savhClU?=
 =?us-ascii?Q?zdE8vRmCWXsJttI+3VTprvlimYurxDLIanNW0eXmrzXmRJFjGaaxZs+JM4am?=
 =?us-ascii?Q?yUpPVaQvapcFg5raIgE5MZKneo3uFp6B9d8dp+2O5A6niQ5JeHl+oufFHYN9?=
 =?us-ascii?Q?qlHFn4GitQDbGmgwuAnS9xdotSod5E5eDyNIEBzBH5Seq8FZBfropNLQxUhc?=
 =?us-ascii?Q?+RP2MVvSK+lLyYh+iKZCQgjgvMSXgh7/yjz5LJqYzFxnJHkJlipKpK5lXQLQ?=
 =?us-ascii?Q?f/xp18qmEeAWsplA5iCm0oevdFmDqZTXOkrIrXHeNbnQERqfHAL5EO+jgvNl?=
 =?us-ascii?Q?BMMcD2xt9iZNmkpKSbykdROkEnJoANQ43CBE4UaH4f4YWfXQGcEyafUk02DC?=
 =?us-ascii?Q?rCxSw76n52cBcO3sgB+IG4phu7bm2w/BquwQzCnbpwyjpZhNrUjb8jpolLnx?=
 =?us-ascii?Q?lQoAlw7C4Ujg/vGqIv3yUn2Yk/gzmipJXjgI3P9WxgIrWAPP1qAGvlrr1G9r?=
 =?us-ascii?Q?x0ttjMUUwSbJLoSyipbKqOP215HV4J42IwTPd2XnI1S9Mzf0gMhz78HE/yxR?=
 =?us-ascii?Q?zJlc1UV+Uiu50FMOXd31bMVo33G9X3b2RAog722rjwFPMN9fMcZFkUd/QvL5?=
 =?us-ascii?Q?tOYPGwiVUdbiOLrJWrfd/YBCh+xdVQNqyUH4D0LaEZa9zAsXQN3of/BDlLGm?=
 =?us-ascii?Q?IXCKzCEtPluPObVNGv239vmkxPBjAHbBlsmLYiWze215WE5UmIyH1qq7FaMj?=
 =?us-ascii?Q?Ap8Cgw1rGTzwayW6H9FgNVXT1KtntqUm49nsmRTdlvKqnsF0RXU7muwYzufb?=
 =?us-ascii?Q?Y/8l0ByNZwpTu9B8qm8PunqcQIB973Ed8jb9xdGHs25g1hv5KFGgOV7KCc8D?=
 =?us-ascii?Q?C6r1CMPd9N09tCz8Wha9rS/gDKNZNR78EwF3BJ7uxR/l0C/z/+LUycOKrZpI?=
 =?us-ascii?Q?9fY7+/wvynqtJ0OUY1p4GbQlIbQCT1+qMBL0w1sPg8owdIFp?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117445b1-09f1-433f-2f30-08de5a2663b3
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:26.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCDpTsy0UYVmHv7qkIUj2jbtRwjFBH+nN0PlU05q+bLTVcIuiu7Cgevph3kvvOQk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_182339_633202_2E9FA95E 
X-CRM114-Status: GOOD (  10.08  )
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
---
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 4bae6d46defb5..cf65c079e675a 100644
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


