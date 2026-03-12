Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8458106ACDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=; b=Zb2xrCYiziUB4j3EZWm3PJj2Ta
	DIPcDT7dCoYZtuBDLxMqdxO/3pWrAda2vzxlWL39F6ACw7lq2cQJnEneetu6uP/fIBF43HGEvhh4E
	WfAoL7n7JpyjnXLG9dVaPAIq5q0JuKjFHbzqaP1dJP9ZnseF93q+acqJ8dFLoDJNCtMeYGJUmcIHG
	QdAr8xDOwfFMS8Anbqr5LqZpFSMfHzB/ysm4+alMOouN/2p7r1lybaPs2lG9DEmaRZKLg/gChHxxv
	U4vHhFknVE+l36FfmtHVzfFR3OzRehmCjsfAdNxycKD2FDNOKhvLagtJfIUK2gK9eZH9ttaprQGd8
	n1WZCz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkC-0000000F6ni-1EFH;
	Thu, 12 Mar 2026 19:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkA-0000000F6la-2cTK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=; b=kAnB0qv/ag3uKFOw4DSpYqeonC
	Sg79qjNnHQyzAMGfWIc27+at5m5YedHCajLm5lhPhZYuqqC6CVeKduGrAXDPI+N8CTHnfLXYZeuhE
	992xKLju7Y5VNO3BeTW/vOjiO5X7j2sov+3QyoMQQ0N4bs1TCnJP/hHNYKJHWF03t3p1EERauQSsk
	3vsVYjknNQp1dwtCEIheFjzuZ2SpuzuT272fB/vc9dRFan3MFQ+XBvt9IxRHQEBXKykabzAlEFSaw
	MPLeDffzaBvtLHhRNYd2tcbUQkE9e88lXctYe3W+d+yuQYWBOWoJlFkrGMB/3cS3UZMgTJIkhPLY1
	iEM/BxDg==;
Received: from mail-northeuropeazon11012014.outbound.protection.outlook.com ([52.101.66.14] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lk5-00000001tgw-3Aix
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TykikAoUyze/HIP09ISH2QFvI7XgP8x0BcBYyRuivHGN/GSdfy2ftPkJDdE+jsNcKkaOjM4bGnPejcz4BYEt1zc1rYZFAhFhIXRKOEy+CeOwpVfhAGJzZQlgFn8uD0c2RM9gsvkRQIYrH/d855dUWK9PTu+/PiQ4KW9aOTU55y5I21wKPz9Mn93keb70t/dpggaqlKNtFsKM7Vx2pXIpY3bRi8lK3SMpazDU+UKwjJGZitjxzJt7sConpayKJ3inmhtuNISFHWoYmJ9REXSBGWGqtxBVQJ4SFSUqXbJ6Xxz3wPE88oL7E9BQDSgEPFkOGpNTvvFRmkol+kkT8SvWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=qFHFYRrHActamMVrRO430fWf/uQnAVXAtJLGgAzmAaoND4N6hyvU+UUZ8QVa/YhO18820oD8On94L3lYRpjyyE0ryaWsQIO2R6/viPcJ+J6ua91XJ0EMfDR3bqiQA3WXUmEAUYUQqgyXe3jM5globGC6BNvyhj5rIEtbc+e8oaAzGWus6OxBUZ2L69yOJqbhdGp9vSIcIlxLCzwHtuSLmFLen4s8VnSrSQIpw8nKybbK6tIImsliDpHleyEtEZZiCKdyWIriOIwpx6hPluW1oWHnkR1znSgqhMNEBfF7aV0FHDTtVthqojIaYvnbXmZ01IvmBq4gNelpBHdMtgkD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=RfUKB0LTnD0P5nBOmil6s4MYIYxgw+Rp5kbvQNnijAtLCgcx6YQqj3vxoHonaRNZgNgRqR1DdxDVLZZiAWQxwL/bJAaNHpV+2+af1bY8FnDLBarScPUIEI+6sovp5nx+/KwJQSn9JZs9GLCC/f0z34KyB0hSzp1pqC8jm0CX9o9Nd9tbcsdZ+n6OLYqKObeQB5e46cS7WFXCVtPPOLYteHF7kj4ayQ3J7IMzZ6ALGZmwSfp8/8fEr6mCU+XXlfykFZiU9WskVLTNcR/Y7zswKX/fSL70jJyqVXWJAp2HKYChQEMRDfFfu990zITl/Bv6cjiaUIIXlePa09sDPhiKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:35 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:39 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v11 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Thu, 12 Mar 2026 14:29:56 -0500
Message-ID: <20260312192957.1978329-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:806:121::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 211a7286-81d2-421c-435c-08de806dd7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: eSUzUbzUOIl27YIfSRlTCxsoOxkEDxqTe0CefQFSBhAItinaM6LSyHrew258mCvJlpdrcxJIa/XzZVppsIxd3swHzpdRNto0o1fYAEkj8fDyTgah0MTOq2pPA4bgoxn8oGhsEAcQlMZhS2b2+PtiKQKUnA4UtCZeMyIMkFXjTwHJcYB2b0guxC44k2ZaGEEjttlwA+2KzuqHtJ9po5sIfUhpgqUj1q3Cp2JBBKsueI7PfVOC9f0BQsFApfCFKVoZGxNJIeMnMqDcbrMRrlYOz02WXsE81iivqv+twuQl6eWTRZ3ThgT+XnzVN9mNREiUJWQMzPredkeWG2a1KPUDQUovJR/DMTUENJXZEAuNmp77C7Kflm6f4/iCyqLfXQul+RcNXWVJKTcewaIdD17oJu2Xd9AVEOuPh4fPAjdNcBzbesTcPhryGYJnlmhqc+mm1Lr37QGfLcrzR+DHh7uMrYJdIqPCYrMF13EQf//d2CD6rjNGsdt0O3mFTFUklKL8TMvq5smgnd+WlKyMic9/7r2a/7ig6/JYub8k4Jj9zynLYgRGLkhJ6X6ulSn4m6CKdnJuAffck9mK1QxjocrjN502co/ObkQeJdTAKrweAYgI6cXgE8TCPGwKNEC9f3C/nyDgE/gLOJoWDc4mBBRqWelSV1Sz11OSI+tZ7x3LEjyKQv+jJyXvOwpkKZaJQWlUx1g3QNrIFJMm/B60XrGy3bdlDuL42NFYjLLSBmSE17fjqpeEmPpb56i8g+wpym9QkV+N4a9gUikEe3GYp1p5Z44ebESY2VzslShaWXlwtANhQIsgzLOECaSBH/5nIEff
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCkdoedW62jSmWomwqgzAD8khEpiGcSVQUfrDMFMxICU95MXpF7+fZA77x9l?=
 =?us-ascii?Q?Flbt51KBLY+1PSTYefo7JiK/TqupaHn7K/ky7350YGh421ZMmnGrD6Hl5Qs6?=
 =?us-ascii?Q?bCRi71Gaqi3U6wuAorvEkWgCgpWVApYdBTxm0wF9Oo9eOtWSraDwjGfOXFxe?=
 =?us-ascii?Q?7NAdZRH55EujOlhLqJ8Dy4pfNBPIdyOGOWMXiivEGxRcTulBIjlEIQncu8m2?=
 =?us-ascii?Q?nnYjdKqQUMJxih/DU72ZUflfu92265fieNqZXnYBLFIJaPHrghDxxzN44Z+T?=
 =?us-ascii?Q?WJ0BRCWNfH7TQcaEWwfWjAd2gG4Jer+wEGXQkiaaeZa5NcWhnVZGy/3E4GW1?=
 =?us-ascii?Q?u6PenjXXY7KqpxekOXcH3MNtitbvezrQo/18reLgUx1wjUgAYhX5b9aUz/Wq?=
 =?us-ascii?Q?U8zaVoCjGmHv92oTzZs5u1HGsAZkthz1og116wTKTHLWxGwQGCVkdcBfwleg?=
 =?us-ascii?Q?8GF1KVITquOGOBLkK4W5MTpJUBDHevw8npQVdVEyoAAmFfyyTb9wQ0bD9s/X?=
 =?us-ascii?Q?MDjENdyzpn+Sy1iXuQUIzTHV4JggeAd7QPjyGrVVlXpGjBIFFHnECNQJFvPU?=
 =?us-ascii?Q?jjhL07edaTKMx8mlQT0sGdJt+e4Gy2w+RNJXLV9J0jR5En//T2qQiQ7sP/rq?=
 =?us-ascii?Q?pI6njRDyrdHL0nEA7GbG8Su/Ea9VDIdmEoPZuZnrrVlp6jx+OrweD4L4jWWT?=
 =?us-ascii?Q?pc1xYac2Y0xDsxAkGDsWFHJ+29z8WpnRJWkWr3w7LmAm0Iorn4slOmOdlwHb?=
 =?us-ascii?Q?H2IhdRNuyqICzM2uTGOYSqsWsB8Gj4PUwlMnH4A1PI9EvPBU2eMVbbH2XrYc?=
 =?us-ascii?Q?hf2lyaQGA5Ouoqodh1jYUPXXF/8KEIWx1h/TDAOvbQfPdE6DU8QusaLp2+is?=
 =?us-ascii?Q?5LKGBl3E9d80PjhlNKd95YVzte3WKdPTK642u2RkkWeJq6C+dofjAEJSu9nk?=
 =?us-ascii?Q?0LYxdrfpG+nlAdm5DCipOIQXDzHJZaxlwoEx3AHvtiBd/NL65ILYE9pr4lUo?=
 =?us-ascii?Q?uZxSyiP/x9py2uZtF/i78C0gioG5eu+4aGRUMelrGpw3HgB9CXKpYQ+u/MnQ?=
 =?us-ascii?Q?ud1nQzEjagEqZUS37xgBCA2V7P3hatSIpSAdOtaR7SKKtmim5qNYwoWEvFmR?=
 =?us-ascii?Q?Me7NkzvFtmsxehVgam+dDKlYcaTigSWZaiWnMhWwkZrLPGsd044lJ5G+RYRP?=
 =?us-ascii?Q?Ykuw1V8D03Y86RLqON28SwkPQdJrkXiY993Qu6Eg/x/2nhPLkgR+3RpHOMMU?=
 =?us-ascii?Q?hmuAKToONDMpifX/SbDExzp4RxiX4lQh7BaK0uWUD+HR+2Sf88YiCZ4s69Tm?=
 =?us-ascii?Q?l//a3HKmCObsAuY8tDOhPEmA1Mlxll9u2Gd3QJmxZ4XAf/Jvph22bEI3Uk/0?=
 =?us-ascii?Q?uG0IAyoCKW0XB3XoUB2AxZi/AoX35Nfum/ht5532OlHcBWyHvwlrWIc7GNK8?=
 =?us-ascii?Q?kFnTV+zoHC7uidrXchddDrinOpEEzLQWudXu9poGRq/Reg0KrtmhCUzvEvfA?=
 =?us-ascii?Q?d6b3l8r4jrmb1wjKRR8/AbVc1M9zkxKWwjmvDC6/wNjn9sXkxAh1NJspMARt?=
 =?us-ascii?Q?jo6KQN45OzhKJQCDSNaGSfpDMi0Nf83hdC+AW6qx006vxzQZvz5zYTGnwBCC?=
 =?us-ascii?Q?TpQ+Oimoj0oeVZKgFXBBPp+frgFGJ5cP0fVuv4gnPWg1AKWy/Rz2XyMBTj3r?=
 =?us-ascii?Q?SHE/CAR3toLar0TGeAogrLUO4y145mT5Dn/zTolM2tSdpGX4pcizlyKQuR99?=
 =?us-ascii?Q?vYpm6u4TeQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211a7286-81d2-421c-435c-08de806dd7b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:39.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BERsyqUKQOzUbXjk9t9D1jiYEF3ZasOMpNi4ckFBARpB9K1wn77SO30W6B9wvlT2/bw1vvn/nb9p8MgAA1tz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193047_020015_A3854D28 
X-CRM114-Status: GOOD (  18.63  )
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

Implement fixed-up message handlers to maintain compatibility with
existing i.MX devices that rely on the NXP legacy RPMSG firmware and
its transport protocol. This ensures backward compatibility and preserves
functionality for deployed NXP systems.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  15 ++++
 drivers/gpio/gpio-rpmsg.c | 147 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index cff0fda8a283..cd0ac5bf4443 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1907,6 +1907,21 @@ config GPIO_RPMSG
 
 	  If unsure, say N.
 
+if GPIO_RPMSG
+
+config GPIO_RPMSG_NXP_LEGACY
+	bool "Support for the NXP legacy firmware"
+	depends on GPIO_RPMSG && ARCH_MXC
+	default y
+	help
+	  Enable support for the legacy NXP firmware protocol used by older
+	  i.MX products. This option provides compatibility for systems
+	  that still rely on the nxp legacy message format and allows
+	  existing deployments to continue functioning without requiring
+	  firmware changes.
+
+endif
+
 endmenu
 
 menu "SPI GPIO expanders"
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
index 9c609b55bc14..be263c09a1f0 100644
--- a/drivers/gpio/gpio-rpmsg.c
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -84,6 +84,147 @@ struct rpdev_drvdata {
 	void *channel_devices[MAX_PORT_PER_CHANNEL];
 };
 
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+/* NXP I.MX Legacy GPIO RPMSG protocol */
+#define IMX_RPMSG_CONFIG_INPUT		0
+#define IMX_RPMSG_CONFIG_OUTPUT		1
+#define IMX_RPMSG_GET_LEVEL		2
+#define IMX_RPMSG_GET_DIRECTION		3
+#define IMX_RPMSG_CMD_UNKNOWN		0x7F
+
+#define IMX_RPMSG_TRI_LOW_LEVEL		4
+#define IMX_RPMSG_TRI_HIGH_LEVEL	5
+
+#define IMX_RPMSG_ID		5
+#define IMX_RPMSG_VENDOR	1
+#define IMX_RPMSG_VERSION	0
+
+struct rpmsg_gpio_nxp_packet {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Protocol version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+	u8 line;
+	u8 port_idx;
+	u8 val1;
+	u8 val2;
+};
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_imx_recv_fixed_up(struct rpmsg_device *rpdev, void *data)
+{
+	struct rpmsg_gpio_nxp_packet *imx_msg = data;
+	struct rpmsg_gpio_packet *msg;
+	struct rpdev_drvdata *drvdata;
+
+	if (!imx_msg)
+		return NULL;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (!drvdata->recv_pkt)
+		drvdata->recv_pkt = devm_kzalloc(&rpdev->dev, sizeof(*msg), GFP_ATOMIC);
+
+	if (!drvdata->recv_pkt)
+		return NULL;
+
+	msg = drvdata->recv_pkt;
+
+	msg->type = imx_msg->type;
+	msg->cmd = imx_msg->cmd;
+	msg->port_idx = imx_msg->port_idx;
+	msg->line = imx_msg->line;
+	msg->val1 = imx_msg->val1;
+	msg->val2 = imx_msg->val2;
+
+	switch (imx_msg->cmd) {
+	case IMX_RPMSG_GET_LEVEL:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_VALUE;
+		break;
+
+	case IMX_RPMSG_GET_DIRECTION:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_DIRECTION;
+		break;
+
+	case IMX_RPMSG_CONFIG_OUTPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_OUT;
+		break;
+
+	case IMX_RPMSG_CONFIG_INPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_IN;
+		break;
+
+	default:
+		break;
+	}
+
+	return msg;
+}
+
+static const int imx_std_cmd_map[] = {
+	IMX_RPMSG_CMD_UNKNOWN,
+	IMX_RPMSG_CMD_UNKNOWN,		/* VIRTIO_GPIO_MSG_GET_NAMES */
+	IMX_RPMSG_GET_DIRECTION,	/* VIRTIO_GPIO_MSG_GET_DIRECTION */
+	IMX_RPMSG_CONFIG_INPUT,		/* VIRTIO_GPIO_MSG_SET_DIRECTION */
+	IMX_RPMSG_GET_LEVEL,		/* VIRTIO_GPIO_MSG_GET_VALUE */
+	IMX_RPMSG_CONFIG_OUTPUT,	/* VIRTIO_GPIO_MSG_SET_VALUE */
+	IMX_RPMSG_CONFIG_INPUT		/* VIRTIO_GPIO_MSG_IRQ_TYPE */
+};
+
+static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
+					struct rpmsg_gpio_packet *msg)
+{
+	struct rpmsg_gpio_nxp_packet imx_msg;
+
+	if (msg->cmd >= ARRAY_SIZE(imx_std_cmd_map))
+		return -EINVAL;
+
+	imx_msg.id = IMX_RPMSG_ID;
+	imx_msg.vendor = IMX_RPMSG_VENDOR;
+	imx_msg.version = IMX_RPMSG_VERSION;
+	imx_msg.type = msg->type;
+	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
+	imx_msg.port_idx = msg->port_idx;
+	imx_msg.line = msg->line;
+	imx_msg.val1 = msg->val1;
+	imx_msg.val2 = msg->val2;
+
+	switch (msg->cmd) {
+	case VIRTIO_GPIO_MSG_IRQ_TYPE:
+		switch (msg->val1) {
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH:
+			imx_msg.val1 = IMX_RPMSG_TRI_HIGH_LEVEL;
+			break;
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW:
+			imx_msg.val1 = IMX_RPMSG_TRI_LOW_LEVEL;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case VIRTIO_GPIO_MSG_SET_DIRECTION:
+		imx_msg.val1 = 0;
+		if (msg->val1 == VIRTIO_GPIO_DIRECTION_OUT)
+			imx_msg.cmd = IMX_RPMSG_CONFIG_OUTPUT;
+		break;
+
+	default:
+		break;
+	}
+
+	return rpmsg_send(info->rpdev->ept, &imx_msg, sizeof(imx_msg));
+}
+
+static const struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
+	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
+	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
+};
+#endif
+
 static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
 				   struct rpmsg_gpio_packet *msg,
 				   bool sync)
@@ -576,6 +717,12 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
 
 static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
 	{ .name = "rpmsg-io" },
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+	{
+		.name = "rpmsg-io-channel",
+		.driver_data = (kernel_ulong_t)&imx_fixed_up_data
+	},
+#endif
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
-- 
2.43.0


