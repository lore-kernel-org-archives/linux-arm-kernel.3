Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5891D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duitwgWPcGmfGEpEHeRWb/pZI/iMnpxW3PGuuuqZ09Y=; b=L6cr4hascSnQUPtT4wvzTN/Cw7
	bPyGnIu+hCmUT6Grf3/dSxd3W+2itb9aWJIhi96yeJagiEhTzWIVAs1b22VbNLy0WAAR4H+1YwIHZ
	3auiv5HlX0uFiO0XQfOLFMuN10izs65/vIX9ID5qtEw9MIkaBzZcCpOSkLO1rx3dGoXnxP8d7XOkm
	ESw/fCekNb2lHUqwmNWIFG2jxMOsQQB18/Fbh9qg+HWo6RJ7KNPq3uXK2iJiuvQQjWtnAc1yprt6r
	/Ipw61nlvTuoXjtk1w++V4CKTGubc+tJaazP4MJ28d71nb3P6NGgV2ylSH/bZweyYkSCZJraD3om8
	rC+0Ew5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74b-000000083D2-0feC;
	Fri, 23 Jan 2026 02:38:57 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74Y-000000083A4-2P4X;
	Fri, 23 Jan 2026 02:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpduM7HcS4uNxnajX3sLK08yzUzVLibDAuINKStrQgEVmgahcX2SF//MQPKx/ibBZHqLSza1LDsr0VCk/xiR6w9CC5XS7q12Y0/szPV3AUeTmnj2kELzj7vds8Bn+7fR7GqB6xrXQIFPJ25p7yU4WFUOcEWEHR4vYnlLWFJVIkMRSDzaITpqpySWyKSmBa3iLyZ3PBCfiIaMOK/l8ioKB9e+j3kNTnnP97rprXRYNRO2WQ3nVJvbUq4IaIJyf5eWFueb3u3rpfjjwLFY9zO87+qn/TqPSTyrpK/Fn/NHFehBpuPWlCurYdrVTrFwoxkgrqfKwiXoB1n+NEzxlrv8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duitwgWPcGmfGEpEHeRWb/pZI/iMnpxW3PGuuuqZ09Y=;
 b=Z/ZCfO7ZPQLto3TgOaiIDa+7ktPjCyus7KVlC6pXBsyY9k2/IrEpR+EU+FffbbDzXYRYifXtNMQYVtF/CSgzTUC63AtalZyMbphz6EN445Mgks4sJbFbuk/I9jCo+053OSuCCah53IingeESo2GXrqnBc4VRLIXFpNMPTVKVcdQZOXIGJIz6A2tqYaoHabZ9q51V8IAFgyaQCTNarHfkIXMahf1Gn5x5LPJ/dEJWBqTmpi4D59wt9Ipw2rezZTREp8PQv1ueM1EgB9gHj9bSrCFNVUZao2m1rUF9KWT3M8DC/tuatTDql1jF8nwhMi7kaS76DxekaX0T3TH28RWVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by JH0PR03MB7558.apcprd03.prod.outlook.com (2603:1096:990:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:20 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:20 +0000
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
Subject: [PATCH 2/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
Date: Fri, 23 Jan 2026 10:22:54 +0800
Message-Id: <20260123022258.136448-3-nick@khadas.com>
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
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|JH0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b73f25-d93c-4595-174c-08de5a266046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7aC3ChZmKfBUWd3CsT5CR+gtnWlPV0ttVdgEVfellhDO7SjVX3XNIQ61coYg?=
 =?us-ascii?Q?3cRgoe73U1/DhpHocvnze60OaJLAzikFykhsN0vbPd7jTFkZrXm+oJoNXW46?=
 =?us-ascii?Q?y5O0q0F79GE76EVucnyp4R6ldyIkVsulh85t0hVA7deUG8v9/R1ID2Jz3jDJ?=
 =?us-ascii?Q?I9jbH941QJLFuz9uLfzqwtW12OXRA2oI9iCV6W6jzrwxpnWpwMy9saR8WnRe?=
 =?us-ascii?Q?9xElfN4MXco/8CifFUbUJJ9T9qxrcmCwuLBPcFsZxfTmNZLFYI52LMHPjNaD?=
 =?us-ascii?Q?FoDVUitW4OyWSOy8fuyzeYaFOTEQRSPT1BXaA6jIGfsDFwLim/z76joU/3DD?=
 =?us-ascii?Q?l99mOGowb0jmWwW2N1CG6HMYeqN01TX+bsYDsHVoG9fkPEuf9QlcCGXb83oJ?=
 =?us-ascii?Q?q8JcQ6cVmofV6Ai6WTdjx5rur8Ze2QfOH+13hCs5EPsvkl8SnMiZfQ8Mf5LG?=
 =?us-ascii?Q?vomEdwVF83/8t0Zjpo4pHk1y2idH5jfKTwrR1K2gGwTwkKiUXVYLPnADdUR7?=
 =?us-ascii?Q?HB/dHs5dkb3QGfYTMSTbuUq9Oty5ZjhgsjSRzu4rKc8V0agHCP8wW15SXgwq?=
 =?us-ascii?Q?7lZ0naiao0i8FkVgUXu9zLssxU7UgkgAyULN8EIk+dk3S3mbbSFt+lc2pues?=
 =?us-ascii?Q?lWsUsI8aBFhS9clD+WziGhvzrMa6MLrbIQT9hsa6HcQwn4f4SfierbWLyabc?=
 =?us-ascii?Q?VHaBaf+NX3dfriRZS3IFYrGRovDXAqho0W//J+hT45SAW7dzrSOZ876RnGpd?=
 =?us-ascii?Q?g5Bd6A5tASWYZfbQhPh8qztZ5DJZoMsr8V8mTs+W1NReUy2hV7dDbiAffgFm?=
 =?us-ascii?Q?Ktqwb+nYdL3Qi3O8quD1ikFwkbj5bEy7zQ9Ehv3bmQYP+3PiOgGliMqZXU2H?=
 =?us-ascii?Q?B5GPSftGS3Le+HrfYAXWQBSyMZtrr6UhlmWq/VeOLJVqd66Uh6ShWvrS6/4L?=
 =?us-ascii?Q?JbK8Mw3pefUI41QN6EtSSMSJ/dZDdsyJWBdI/NOWp4/JimltURWgpgoi9aMu?=
 =?us-ascii?Q?/SYYzR8vi9ub0geuJNDoxt/RpVTNAgwVIM6WkxCn03ss5+FPHXMsFPPKpYZ9?=
 =?us-ascii?Q?uOYUt6WTgWcK3ZpgYDnz+9Un2QKW1W5SQZjEZljROI03Vtj+MoPLjUhuxhzw?=
 =?us-ascii?Q?RCfLELOLQ2iPZLMOA7444m5EZ9SjgkistM3GtUhDmtKkK9WIcGjFJUIheF8J?=
 =?us-ascii?Q?/OCMyxH92YDrBQyMeVLv7vhuKEpES98EwQRU3Ll7wsdcmPCdHkuHvptAtj0L?=
 =?us-ascii?Q?qhbQvD2reE6NZCjcVsMBveoNFA5ejc4G/+2me3L+fMAXCLlmMcJwbqwrteKh?=
 =?us-ascii?Q?TE0f1RkVotnyqP7VnYypnpQTz8AoQYZc50IX1jJIPNYu9wNSpPIgft4vOQhL?=
 =?us-ascii?Q?0FqO00AqxU927aY/eipuE7JLeWa972WaZasqy2WJhyXw2VuBHwLi0qZAAVTn?=
 =?us-ascii?Q?ex9SyZyrSxJapB/lUXnrxWoRisU5hIDb54Cpfgpg4MUoRU+qEMXvtIcELyPP?=
 =?us-ascii?Q?NbfpeuZaZPVQ2jt95Rppox8iR9HNt9SBA+Bc6enygn8cWNtgbmkURKdXeZ+M?=
 =?us-ascii?Q?IRXY7QwrcMrvyFLk4eFNJA7QFWKBSoiEjzd+ZuNyMDYLiaBK4QiYseMisIrq?=
 =?us-ascii?Q?FDAL3/uepi5KV1slfUkIMWM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KkySzY6RSLcdl91Cn8TQrX8UjhSjV3USeMKY6wE8iGo+KaQ3H3nibgAJJAoV?=
 =?us-ascii?Q?Lp9ilPEUMVNhJ33HCMGkYlwwsjf3tXXR4QIMREhRv/2C0XsP4ndktHIBEtz2?=
 =?us-ascii?Q?pPxeL8xNKkGERgR70ORK00NukYcztHhhsIr9ztsxvsDAX+E62XuZp0BYYTcF?=
 =?us-ascii?Q?w57XnDsVV7xxW3BfmkrFaIbXDXsp/+vthYMVPM1owuUUPWLu0wTviDdjAKj9?=
 =?us-ascii?Q?mymeo/Tlydo/2D9dGhP6CYWeoXpOJJsobSVzZw4sPJtZe+isogUNAlq6PnhP?=
 =?us-ascii?Q?TgkKAlbe/6geszZ4NN/3nSsLFgrX+JOlaYZDVeW0RYsnEa30z2iqpE250dop?=
 =?us-ascii?Q?Myx/8n8HsmHwTyeZZc3gULAKRtwYwmS8136x6WGNQli+4Yy8RVacYaYRNRNb?=
 =?us-ascii?Q?kxw4CZEDxqhNnTLu/yxQzkmFm1f2532+7mbvHQJnrJ8L8ubFiSE1hSdHGYfc?=
 =?us-ascii?Q?hpQ1LkZRVehKE+2u5HRGFII2olJW3Uldsnq98YGyGUPyIg+NC9mo2hmB91Pb?=
 =?us-ascii?Q?SxIXQJjU9Szg4gOn0RF/waK4IcYwSzMv/+LVdghCNor4gG+yP2dg4OfVRHF7?=
 =?us-ascii?Q?XHRz3MZAdeQ9Tm0qwlceH+/hFokojyMBqBMpQDuHCBubQFYJ5+t5NxrckL1G?=
 =?us-ascii?Q?CrOMvittutfWtRbNDcWeGB43eYYOyG2VxeqXZwnB5RcJgDDzLX7N0O/rXzkd?=
 =?us-ascii?Q?KitKLTHy4Z3QmGupDg/OIw/ThSyHhu4n640yvkjU1W1bhwhffieqPPUv1Ee/?=
 =?us-ascii?Q?W63hFSlW0EpxE/4E7CZ7IY2Wtt1+enIuhAKD9mjipqRWCN5d6Y+v0xmKe/iv?=
 =?us-ascii?Q?D5Yk9LA1CmePAx1rNDogR+e3kApMNnjnnDQchxUNaHP1Z07FjYNXti/aK8/e?=
 =?us-ascii?Q?Rwt9orN/RIBBqC8DCzkIYcwbMXpGmwjwlMtHwEWbkBtetX0b3/1teca0eDby?=
 =?us-ascii?Q?G/B91hMNH8bresjbklwNxkIruF5B/IZuFg9bvI1HYLjrhF/L1gyTBh45iPID?=
 =?us-ascii?Q?EYPHW0qxqgQF7Lh2kZv9U96OEuknUBrob7f3MMnFDqbwEOoYFxCPQlL0Bd19?=
 =?us-ascii?Q?5NciQvsPWfH+sv1NHIMgVPFPL8PRsOMXB0OP/wTJuDyXms614cq2Qe76Ac2M?=
 =?us-ascii?Q?u+qGTUURNAZDsWKHXTjfhJVqMY7h5ESYXsqDMjizCTBLWXQC5vi7L5Lg8vnS?=
 =?us-ascii?Q?sSbHDKA2jeJWPlRJ8shjm14GtfOJWO9EL7i7/iFhHTwl69vBLxKmbah/oAZp?=
 =?us-ascii?Q?MaIPZy649JwZPSAazEg/wzu+43aKVWnW43Yd14M6EQaseDJg97HhCNJ90npa?=
 =?us-ascii?Q?pU3ZtVBXyUMvgHDppnNXBwh8ePuohfUyxN+Yig6/j6oLA4nbMD3N1mj4cGul?=
 =?us-ascii?Q?lgYAvmZfy1D8EpXq9x+pFUmwwy8ewrPtrMGA+5WFv1kRzDi7d2QY2iyS0I/j?=
 =?us-ascii?Q?WOLAffARTQ7bJZw5IMk2Uv6Egf/NhnzsADX5H9x4wkUE83cgVggKNUq1wlSA?=
 =?us-ascii?Q?pw8K44rFtuDBUbclKKFT1HNgkXrL4nofWUxZeufU8kAJJFbkNCP6x1y5jUZ7?=
 =?us-ascii?Q?qq9K26l3iEnyuVKStrlAj9j1lhH8pBfZVxbpH9hb798Tcvxu4uq8hpxdGuY+?=
 =?us-ascii?Q?3DtTori94wRVmHoWRLvAjjKMv5+LfsPGsDjEePwQU7mA7m2brtv5wVLEnYiL?=
 =?us-ascii?Q?HcOe96CorTV/IVf96Qc/UxeeOG3d4+ApQnnX8vXYBK06i/hQ?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b73f25-d93c-4595-174c-08de5a266046
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:20.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fwd+3nZzsyuV+3jlhNUpJBqhKOnW2Js6ZNHhtvHu0xcoIfpHG1R0SyQeNyq/k2gH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_183854_633735_F476DB40 
X-CRM114-Status: UNSURE (   8.93  )
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

The Khadas VIM1S board uses the Ampak AP6256 Wi-Fi/Bluetooth module.
The Bluetooth controller is connected via UART_A and requires the
external 32k clock (LPO).

Enable the UART_A node and add the bluetooth child node to support it.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 27d0f6134ea9d..041291999bc8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -254,6 +254,19 @@ &spicc0 {
 	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
 };
 
+&uart_a {
+	status = "okay";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&sdio_32k>;
+		clock-names = "lpo";
+	};
+};
+
 &uart_b {
 	status = "okay";
 };
-- 
2.34.1


