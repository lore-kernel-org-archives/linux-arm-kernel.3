Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E398AD4A5E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grvrzT2y2j4t/J2ORtRUvv8rho0YAICcpsMwAHgvGaI=; b=fayrvAng1IAg6pUzsB8Dgc88W8
	DJpIw9dmKAurkFEgB79+HD+uUIdgsx0snDti5FEy9I8/NoXxKA0oaWxTmBwpgqrSRTZeiW0VbBjFd
	GZPG6pj4r+A4Vf/VrNzvl9+ybaxIAmP44pr+gToO2kVSVeJROn8oJw+Z+h290qlO42lrVYzn3l2nO
	sUaBmPvQPMS/mUMFOUhWL1FwCO2zkj4zbHuMyPSUjDN1YniPqalJKvVqfJn+aj+hKsButzUofj4KL
	MzAKacaDSrOhoimb8nBXZZWaQul+rlh9EfflmoxQRuuOv0ZT4XT2G4RJAEOFwM3lhRegv17P3/Zd2
	wk3UNElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZhl-0000000DTkE-0CmZ;
	Fri, 16 Jan 2026 02:36:53 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZhh-0000000DTjg-2O0e;
	Fri, 16 Jan 2026 02:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5/Di5Q7GM9zAN+JE/AbQBA0VsCSr1DGSrdi0pRhFYbeMY1cLk+UAW+jR0Cp5pCnoYcYHuxIob593YDh1sMq2FGcLyZ9uB1mjhYTUVuY86pinffAZUEyKOCruVcm8AEqfBDbznAagHaEO1G96GpOEj4T8g/7FKz2NAN14tmAcRoBZPbPW8zxiWOi55McsSXYWr8P/WlCZHOkTMo4dwNBoEB+ZYemSYRa0HeuNyJUGqovciEvfadVozj6yf6yoxdtTj9mhsJvOWI6UifSjtM0tCHMVym2GKc9y0DPm9lbfq4+tX31nlKo1ihymsAIh335LlxpkbY4so9gRvdsbT0Ung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grvrzT2y2j4t/J2ORtRUvv8rho0YAICcpsMwAHgvGaI=;
 b=GBdsfiwi/DW56N/lL70DY76Px/TgHtNnlfqBWfLsCNUNwSwpEgZiLT5Gxz8iJZzFiyzYDs180G3uMwLaBwVDkP2J8XdIOGouQnutmc4kA37jqTLC1mRshpNbgSrILCoMtcd68OjbwxWECavMce9JhtdTREu/hpVMYTqWT/grpPunobSK9XFVO/nehxax2QuK+pjTUoUdxDewNJXNAzvuWN1d1mfvxizRe5fcIQGyx8BQ+ftEUvjwW7R2Y/jQMzU5sm7jTk66PkCCVKDqbbuzCKbId9ukjKR4Se7/JrLePFmJedlIkWf67KFDqbEL62Ba3ZeHns9j9fV9Ol8bwGgl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by JH0PR03MB8350.apcprd03.prod.outlook.com (2603:1096:990:4c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 02:36:41 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 02:36:40 +0000
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
Subject: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
Date: Fri, 16 Jan 2026 10:36:11 +0800
Message-Id: <20260116023611.2033078-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|JH0PR03MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: abc2ca8b-b7ad-4a2f-abf8-08de54a81476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9F5LMDRvRjgVLM624CmORUK9/GfqRJcV+glRBEHnHelMPhM/DDBmukyt/Cce?=
 =?us-ascii?Q?p2dkTAHv6cOwoinKH4ZE7v4izX8KlfNkXEZ5bAVWKto9ifajpsg+ux/Ti1ky?=
 =?us-ascii?Q?lGI1c578lhXi7OryinvLLOx9ydVgAR6p5sauIZsovFOoHx43dsZF8cqpdbIc?=
 =?us-ascii?Q?MEG99FiMyW4tmT611rM4W1XReLOxGm8LRDp/k2/MA1u4yZ82txy3Vc8ZKPyn?=
 =?us-ascii?Q?FmVnE+Xv4F36DWvkVnUEcRyt7cA9JqUzdDXCTKOAw+h5kvs7ChKJNxxvMIm2?=
 =?us-ascii?Q?k3kmH5TEbpEnGpxItyqHI7FMyNICbmLdnHpLOMeLtm2IIpQgNqOlohKsoYoG?=
 =?us-ascii?Q?UVGXZEtBQZO/asUkGbT1Jz9AIESyXtsAN5Bxfo/tWJ84X02eXERoGyCjDcIu?=
 =?us-ascii?Q?huQB9VLcHS3Fj/v39q1VfoWaoE6DOX8HWe+uGJleaC8XPIPPIY/Xzpn5Q7+f?=
 =?us-ascii?Q?qDdprPs4LWf/5gTUNHCc5pVdIqO/IM3P0Qx/7dreB//cohHW63n3zl78sm82?=
 =?us-ascii?Q?WotL9d592okweriuW/pmY8cCiXmgIuh9grMnqcjDnHIoB7jkBI1TMFM2mOzF?=
 =?us-ascii?Q?071x4DHf+5m/xN5aLOynKSTD7LZSo5EuaYhlqSRujq6tRyQ5fuwWK4R1Uh9s?=
 =?us-ascii?Q?rgiUmHXC3u2fZX0JJmm33sYwfpu1p0z8/jQWjqDUAv6/l2cHpA0zKzK8B/55?=
 =?us-ascii?Q?7ynQg+By6oUdsBBNIeiGXkJuWAtnKWr6c4MLNN5YSKC07bRSvcgBLzc8p78Y?=
 =?us-ascii?Q?y+5oVup/OlUHAplvk3xSG8UhIdjV+wTst86nBayYA44bxWm7mD5GfPLqfRIn?=
 =?us-ascii?Q?RgolKB2QJAgQWx/B2/6v9vFK2YhvPSve79HEjfehqv2N8gI/AdvQbiwZd0ur?=
 =?us-ascii?Q?Z9rUjIne+zA3AfVfl+TMNyMNBUfKS1r1+DcGR+TgLQLZqXd7mscg4+x6rhBu?=
 =?us-ascii?Q?vJ/AsCRfN+kWltMKszMpiaYW31vRU0DUwAuh8TtrTx+dHHYSq1Hk86NrzpeT?=
 =?us-ascii?Q?TV7RACVDK01INJ4gpCZdt7DCkgvbbsVdjIaOoZUHBjlBHCObWwye07g1+y4t?=
 =?us-ascii?Q?CDmqTE8svF2GX3Fn9/vhN7IPIzTXGUDVU1nAWoWkqRszxxYzGwvol1S5WF1w?=
 =?us-ascii?Q?DLDCT1+fa7pxjkLXfsBHS8b+Yrz7IAPObs+UZ5HIdwjHvaB+KIECry7qhwGb?=
 =?us-ascii?Q?qTprn5hwv7aEIhFwAeyLGBYh150YjQozw6ASjL3EIh3+zkzfHgTs+FY6P/aP?=
 =?us-ascii?Q?RuXpoQyn+QEdlaxOXXvX1d9AFUBOmmSF976+dILs7c0p0kcn3gwXaOBebDYT?=
 =?us-ascii?Q?aPenwSnGPCRh8MD1DMDZzY40sPy95//GrT0v0/str90+jGoRMp4HE9HcW87c?=
 =?us-ascii?Q?YNfest8bZRnZhDPyRF9TItRze6CkR6evnOOkrKVFSg22ACpfq0hRWyVsILdy?=
 =?us-ascii?Q?vngxjPb8ByksltW9XdIcVyX5rR37jdeRI8Pdb0xXYPSCL/G5l3a6UthPRkYd?=
 =?us-ascii?Q?MxKwbm/quUU4CJVQPrO5iKwnPXEHPDw47WfIuGauGj0re9rmS3Hrcr2E1rYk?=
 =?us-ascii?Q?PDVeL7wbTckMhv9GUx1iwqgZYYVw6nDNqcSqkNg29NTfZGw2KPwXtpzYcGVw?=
 =?us-ascii?Q?9P3i4MbsC5pU+JakcaOvb3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LzwB1dY7kPiCu42Vmd6m5i/2hnn9oHpp6Ri9trLbbUCPSFiDUHFqcYtzssJ+?=
 =?us-ascii?Q?f8OXGl2HpMNzAh1zyjN4p7Pw6EVMBTL2JlQ3FptupGEmdYsSFETDI+GvrDHx?=
 =?us-ascii?Q?zN382Fr18T4HgcLuvh+RbwmEhYPP6V1srSS5Kt675OeWxzqsAIr2yyZVdAuQ?=
 =?us-ascii?Q?iXNQApN+WhZUrqUIAW0RA7zjRNVK0mU9VajilasXICwOYKCys1lOhYPpDk8c?=
 =?us-ascii?Q?g5qjE8+Nx9xkB7znanRd9TfRH9k7ZrbX1GxpmlTtHePHA4NrYtDiBHk917Oz?=
 =?us-ascii?Q?UqMxBX2V6zIfm+DC5X11sE1s5sJfCD0qWbzK0zIQFH6+beQIJtUb7OvLk1Dq?=
 =?us-ascii?Q?jINeGWMWQ551LymeYKULCk2wetEcjTe6e5QsrOw9nc3WtqR7bM1mAJkq8wOY?=
 =?us-ascii?Q?E5VlGVIOKGaf59YZ4eUZqVK2jlki8MCaiUfXk5ARniviL1mC13yi9lQYQHnS?=
 =?us-ascii?Q?2ZM2sy1j3C5jWq1yeu1h2mXYcJN5gb2mJ7uRNP/NFb3D4BCv8asY3yhMnKhG?=
 =?us-ascii?Q?kuOs3Ab/c3sWrBpmjG9uGSZAikIxF1x5Qu3IdEDafmqeLMYoK7MEG+HdrMh3?=
 =?us-ascii?Q?zzT15JJ9YfQe9AWyzV7YAgVqNRtdb8JzI8Pz7nIrmIEqYkZQ9gwKYTocmjRu?=
 =?us-ascii?Q?Pj4fnUzkO2EA5HUOYBw4IHDBPFIqILpSsBBz3qkTXQkYtsSR0q99VUECNel3?=
 =?us-ascii?Q?ZiolKywwqAT9Ulx1d0j4XRTffp99bc9FkbqzXQYOfFvYCe092+uT5q1VEzgl?=
 =?us-ascii?Q?JyGKF200ixhvwR8x13O/0CoSIDyX+0X3Ox/0c5kyKjwty/5afOAgk+4qAb8y?=
 =?us-ascii?Q?aWEBSiaR3JL1znWPIjLeoOnYFdmaGvT2Yttu7XkQNs5VvX+mjmw0qQg1T0yl?=
 =?us-ascii?Q?3+nE4uiVatF/Mg0CgE/ND2Vb3tHoJxl/3AyMHUEJRgFxWZFJKju5Mv9W9wPA?=
 =?us-ascii?Q?3u/3MtUVYgg114R20cmNWOKsbF2p7t4eMcI7Kz3TcXBj3mJis579DMVbYaNg?=
 =?us-ascii?Q?M8xJ37tful33IxLpeFg9y41Ttuyu4weBRzlSr6XuOgLgp9K0S+TMq3uyaMan?=
 =?us-ascii?Q?J2NwanxvwU7Do2Tv483fvci9nfrksNKRBk/G8WvI+k2oFABVaOgvClqY+Fh0?=
 =?us-ascii?Q?8uOMTXCPfzFziyZpIt9a/zS8O2zmnHWu1RcKSvG3IDSi579y+gaouXoqYxYa?=
 =?us-ascii?Q?CQn0Rsy/U1u0a8CpvSSkr2eEbLoX0DNMFM0PWteAQ5P8s1GyGEYWqUEzud+Y?=
 =?us-ascii?Q?B7a0zH8JYFdKJFdj75WlKHVH6YLoMft/9MesLmghbp5R1hdOJ0UutmLxg2fk?=
 =?us-ascii?Q?E3zzUpvUB9ukcZ2wJoRTgcWGUKnThqeJz5b7r11YSzEGcFp5AKU3FzEw4YJu?=
 =?us-ascii?Q?mkU9mct3P8Vtr5Nlf7DO0Kk7EcyOQSwOlYCS5PQAXjwI8OEaWEcWNreCHdFH?=
 =?us-ascii?Q?vN56QdLq4sZEt8iwlTNFk5zOnw9+TWsXpICwrbkKPpNHY/Df17WVhkEIsJIe?=
 =?us-ascii?Q?YKTHtbyqlGodWVWcovwP1U5ud5THU66eSfil5abcwzRsFnnWLyOdZxyWCqEq?=
 =?us-ascii?Q?0SP3dFtQ59a7IKb0JJaPZQuvw14dIerNGG0MJ8f9n/wE1DSdSXQCzgGniicu?=
 =?us-ascii?Q?p8PlmcGeVqxzf/HthEsAAnHFPrYL8yAze7VEE+gRJjS65+tv3++MCbEia0FG?=
 =?us-ascii?Q?EQbR+GYy3CQEJFGznlLuGR4nJiP0NdPTJlxtNVRuch/NeVKm?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc2ca8b-b7ad-4a2f-abf8-08de54a81476
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 02:36:40.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkVQ1KGoXdnbMxwKHy6nqzAia8stC7pZ/63zwFvFYFSD9C1IRjbc0Dy/DVMZBWu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_183649_612866_2314D4E3 
X-CRM114-Status: UNSURE (   8.40  )
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

Enable the on-board eMMC storage for Khadas VIM1S.

The VIM1S features a 16GB eMMC 5.1 module. This patch adds the
necessary regulators and the eMMC controller node.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 79ffc703a2e99..4a66c1bec965e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -38,6 +38,11 @@ secmon_reserved: secmon@5000000 {
 		};
 	};
 
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
+	};
+
 	sdio_32k: sdio-32k {
 		compatible = "pwm-clock";
 		#clock-cells = <0>;
@@ -80,6 +85,24 @@ vddio_sd: regulator-vddio-sd {
 				3300000 0>;
 	};
 
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_5v>;
+		regulator-always-on;
+	};
+
+	vddio_ao1v8: regulator-vddio-ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 	/* SY8120B1ABC DC/DC Regulator. */
 	vddcpu: regulator-vddcpu {
 		compatible = "pwm-regulator";
@@ -136,6 +159,25 @@ vddcpu: regulator-vddcpu {
 	};
 };
 
+&emmc {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+};
+
 &ethmac {
 	status = "okay";
 	phy-handle = <&internal_ephy>;
-- 
2.34.1


