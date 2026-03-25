Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCED6FEA818
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev6BjyMHQ+Spg8JGgQiSSbgoj6dStlvXRI8YWEH59sg=; b=pGtfFbGpcDOup5iSF2Ik3xngVi
	5nFHRsLDPLg/FCgZd5NMiHqm9wqTtTP+Wl0DY93e9JR/Z/z4xNupY1cjpouVlf6s0sm4UUfbLwW17
	A3eTXsKR4aqY+0+vhPiQtzOsprL4DE0v4H+fG1IU6S0O63gynciwKtdPnzLBmoYDbUt9VJoDAcg8j
	yTNzh4d18Y9lYD1lbLlRUCP5wQiXGuJ38K44U34VD47qhykmMPpazIWpuPozWzyse7P/bcabbkX76
	dIjn5+XnWYRUrxk4cMzw+nC8CNlO2AORxc14EXBehAyS6i/E2jf8P9pqTGDILKi4NW0hu1TlxUtwz
	IoEX74Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IKf-00000002pG7-0KT3;
	Wed, 25 Mar 2026 07:07:13 +0000
Received: from mail-koreacentralazon11023114.outbound.protection.outlook.com ([40.107.44.114] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IKK-00000002op2-1gFC;
	Wed, 25 Mar 2026 07:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkMG7Y6frC7ppbpg+sqhLzuxWGfdE2upoiXYygF+jK1VwoU3unRU4Vr0a3tX1wbVwkA0WvuBLYxEzpgINU/WTxmq0z8jQkXtey96nAEOz5rJrOKvpXKDK+4GdQbEN4p8KliNSwtULxM+BdSseJEXNhtwmuonUbQWht/pLO1MGI2KmZWpFEyYHMkPcqZd0QY/Vu4uC+j6jDdgDULmCEv74VmcZoZNqJWgT+UuIfWlepq6bhOXOiRWZepBfqyVwmmhusgobq+WA/1b7IQzpA8wNTMpoKpPHPiGPASvf08bVEZ+lzuol4tVnroHRi8cuGloSbBBDBiZj1n4Gbzf8M//Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev6BjyMHQ+Spg8JGgQiSSbgoj6dStlvXRI8YWEH59sg=;
 b=fs927mmje6O3OtBlk4RG3+kkDGGlE4Cug2Xd61BmTEQTBU+ySWLqRWBwh5o1pNyIFJoDvtEo3GwmFuNnQ/UCdeNApaNWYyOHROLvLCO8/4RmgQMjDr47r/TZRZDOR+GzXT1W83HbkcUAsH6yR4NJgS8pK2USDOgH8CI6MfozJO5ZFuc8IYCTeiYLRlv0D1Lf+cObZVbruR4vHrU3cPi1GFsQ94J9EG1NVWPgOSoPi1PEj5FrriSab5/CNm1iZCFwfAcXMZduPIF3rvIW1biUtlaXDf+j2mIrk0XdL6f55C8tSdPmYx6YouIYLF0IW9CZemWpk6EBd5uRKJAdShtHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by JH0PR03MB7343.apcprd03.prod.outlook.com (2603:1096:990:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 07:06:45 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 07:06:45 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v3 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
Date: Wed, 25 Mar 2026 15:06:18 +0800
Message-Id: <20260325070618.81955-5-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325070618.81955-1-nick@khadas.com>
References: <20260325070618.81955-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|JH0PR03MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cfe2fa-3ee5-40cc-23bf-08de8a3d12f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: +OF8zNcGH7m0g7n4/IEZcxv/pI7wWnMliunWBKD1IrdAqWldIj0QeCZuJJt2wv3AeAOHZIbRCcB71SGvJN0LTxoJg8vcm3Owc4YakuON2XL7LQUHmmeA7xnuR5HSikhfZG+A38zn6nujtNASrRP0xa7v6YtdUF/SpJYV22mZA9tn10SJFfpezu2nZEyWsu9cMgB6oKnr8u0jcb4nb3Jo9uWCfy09HiVT4D5GemG2p3G2hqJj9OZfOtGhsrblf0RVVZReHNrlqJKQ6dDHTW4elKuihfMIXN1xfDDk64r8UuUO3tFdFp+7e6YZcCEoQq6jy9itu8p6r0WONuUMT02D9C7z10FwoWEzCSXWSOluj4xQL+riFGt2gJ6Tb7n+KJoJThQvLq7SkAsOYCBRfYrENrJdIDC97HMvnTOnnY3rfZuc4O2+4BzmfZKiefJ7YP3f4aFFLmizo8BADFdrz2N0xl6oF0q4U1CO7D4pKo3wwBspHSODdRTjit9m9Ri4x0d85gCo06IncbnDclGRYE7ILYShMv4Dg2q9fiqS3qH7nqFmHvis1IgFyh7gIIIM+MYVMNBy2DB0B7sgXyBgOZla96TYOK0nPXIgIHn5UXcO5oS5kUrawO8UQ+lKzHQAKI3msNQn/yX4er9nToY4oawgcR/n53cDzrwQQttc7xESYFET8N/pn4jOZ5TJYJEffdSrNU5hNTLD/7IsRCa4v9w7vfxNE7vStbqQTqH+iCt7/J32qiA6JX4rMpJrFyh5Gp6bmp/wzSeyO3HMN9ianSu29JjOondIKjoioz6oB36pc6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BNftECGKsJ+/UQ/lqUleoMBubsWuGyShV/xEKNBdN1czA/+DUuJHLa2halxS?=
 =?us-ascii?Q?oXM3inGBo3ijoo9eDQlPZ17RgkZThpKzK95lASra7KrrbrihWYULb87Zasz/?=
 =?us-ascii?Q?YRC9zTs33HfwmzJ/rAsN9oL7t8+XmmhInYW0UXxvNkvL1nZtCu2bzHEW7fD1?=
 =?us-ascii?Q?daWWjKO1L+w31hrQrmG13bqGz4xr1NwWOD5MlMpOMkKLmw0/Ntvap0QtUT0s?=
 =?us-ascii?Q?I4n3bquvtq2x0VFBEYAH1/y088Kc2iSYQpnGp3ER+XNtCEu8vPsD+ZKkg7Wj?=
 =?us-ascii?Q?w2VxMMmGqCp80r2CvsQlVc8lGLwt0j80wgGe/rejamSVRRXKUc77NYlWS9iL?=
 =?us-ascii?Q?2ijF5eeXl67dPC6ePe977SrgkaIFwNnmiur3z70uQEl1/2e6NpfRoRjEsqqQ?=
 =?us-ascii?Q?+Fga2R2tfkzTEIKuQgqSMDy174MCQXAUUGOazMrrrtYGy+SW4b2YSx4svsAC?=
 =?us-ascii?Q?3tKqUvEHAqKTaC/8jG1bEB5FB83F/XhIFzB1T+0DEROM2iBZPjtP39RMLOSE?=
 =?us-ascii?Q?9qzTuGTIG61pftt3uqzQB1104vKtbQpRjeKhm4OaBEBlpzPIXUKfoEH80zlO?=
 =?us-ascii?Q?m9xcTeEvmD8n2N/dbhiOA2XVqW7TezP8LPflyd0Xxwg9Mv2jkD2l6Qp6Ja6Q?=
 =?us-ascii?Q?NFwDnzLX26AbP22LxeKP7XRBwiFps1CsBrmYF/gYDkhQfvl74abr1iXIsVuh?=
 =?us-ascii?Q?ssr9Jy8RI0u8C6wx1Wx5NYr4eZbfAkaoL8mmfGSyZ9cxHAhn5ryh4sy9n4h4?=
 =?us-ascii?Q?j+0Vq/25Gl3llmDYs0+fyPCt9NlcMefh5htMDSX1oA41/PjjsFw4A5pCPks0?=
 =?us-ascii?Q?W2y6Kk9ZxR1CIcUCrAJznLwD8c5nY/pgDwyqvMMAUJdTkFBgSmFnDaPudzKl?=
 =?us-ascii?Q?iCQ8RFcRt/xRuZ0vqAanTrzqnlviEfd5otPsInfd3eH+/v+sCOHQQf3v1hFS?=
 =?us-ascii?Q?ZjB7IB3PVw/emykFP/wqkhSiVkLHTAbmgKWnL9M+iutfhQyTarNSQ8Wgb7oi?=
 =?us-ascii?Q?dXAQzqQP3SCmVSKdwlY6ZjFQhUvTGsOwWJ/zKf+rkIbbpnzmu19BeBQVNbcs?=
 =?us-ascii?Q?A0m1ivJGJ9b4TU81qobFvpfJYN6xrkbjF8Bl9VuLmca22+Ih1Y8G8+7CUJwG?=
 =?us-ascii?Q?kp4AZLMBjXFTEy613LiWCTE9MsMwiLehPn3Nzl+wKyeREhxYA3uDg7oRImBD?=
 =?us-ascii?Q?x5qIQT+NObmV+ACf8lTRoSCxXwzunc2D/YQ87smA7JsnQdRtbaSlMZVuHsfR?=
 =?us-ascii?Q?QRXyI6rgAot0MqUXGbICG38QaJmqqlz0KWyesPUpx7W+d+fKCM5Cgf+lu+22?=
 =?us-ascii?Q?Q4rQF9unDTbo7Z6ocDEcQe/iEsPN4fZifCOpVe42e+OuV5wOpV/f39GTeiwr?=
 =?us-ascii?Q?ndsOqZfj+DU6g0Y9vqLNOae6K3Qi+cLsgASXwo30GuuN+2cl/xyS34MC+bDS?=
 =?us-ascii?Q?ZJuXl+MMphvVd2bjlIhu1nFYNa8CgkGEbVlTvlp0KTelMg30f/5y+nB//O/g?=
 =?us-ascii?Q?1pcZS3fqncmvxm8SZc62MsadVwZqHoHblyCocwIBH3/IyGn7SYq99oz9G4RN?=
 =?us-ascii?Q?E/hfZUmPf6it3vehhu4klD1JbooRKud8wiML+LGl1sCLVmdUFWruA2FvTMES?=
 =?us-ascii?Q?uWjZgHf94uz0N4Rt03Ny+TpEODq+1zfh8UwVyxkbatHw521WZtgjH7sM3bBi?=
 =?us-ascii?Q?AdSuitR72nEEfc5squY3ECc7VtiHLcohF4iPbbIc1TduwOx/?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cfe2fa-3ee5-40cc-23bf-08de8a3d12f7
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 07:06:45.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8TNazrT8eNQhyInozj73+VORv2hfWtYOW6BCaM5qO3LFxrJWubiY8boKj0NHfTW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_000652_434548_144170EB 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the SARADC controller and add the adc-keys node to support
the Function key found on the Khadas VIM1S board.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 664d64a267f2d..792ab45c4c944 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -40,6 +40,20 @@ secmon_reserved: secmon@5000000 {
 		};
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+		poll-interval = <100>;
+
+		button-function {
+			label = "Function";
+			linux,code = <KEY_FN>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
@@ -278,6 +292,11 @@ brcmf: wifi@1 {
 	};
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
 &spicc0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1


