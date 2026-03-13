Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF51107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=; b=l8l04CVUq8oSHQKj5hQWEBdHNe
	sT9JoRbFMPcVQjr9o12SbwRpEt7c867+Fp1/svLGau7AYMQK8iAoLhi7eWKOwlPzJMZ+/qnvh5nrZ
	P6l0A01u6vC586NVtLck02V5duO+wTQoIvKM0k5Dx/lPshtgAFJrHarob2qBjZtwSsjhIOfKRpZMb
	kChlZI6tdsOgCdlS9exi+Rk0cilmYlC19WBUTdowpvw3noJpQnT+L4JA+zRwC2pq81aNN1iAMIHwx
	sRbmTY3O+9ooFQZVuZIwdc0VjqIP46Cz4mvrAIIjzYJKnxI2Pgnq+N3iR2TxS6RukJ3yc0H/fEpDu
	zv06usHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18f1-000000018jf-2pCT;
	Fri, 13 Mar 2026 19:59:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18ey-000000018g2-0VGd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ccw9rV5PZxIiimPCunrwN3qgx2xtiU2+Wu1ISDVPL+iCHjUUSYDnPsrGCheO8xbjUebYGg35Y3TKhMbY0bq9V0himbOIY5IPBGc/1uWKNXc0Na9QoLQFNf1z1c9N8JBxzQjd8Dr9ep/6jsykQKI3v/R5CSkUYF6EeilpFP1vgOU2j9yNBYLJSk8BBb/8u/Pl2HQRlYHtrnuCS3XPFG7hRkfO5XdUnKiEo/jWClTALIOr1lTSYGSyUaQJHVoQR0ViAiMMAWzJUx8qD4b4Tqrsd9LO4lMa4T4aFyCWXBPvoG69QL8BOfIqvVcgPYr34IB0cOnHDJbAQ9JSDAdzFanCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=tCtCO/xo7QqXjGVTdot+VnLbLVJ+r8N3GnrtU7J392E1UO+ZbE6wv4HC2RDnNQaXK/iAp1cmJNh6CGreceLBV8Dy896hnBnXUA5yBucJ7joVMZvrVG16iRcsD/cZvCq+xvrLN/gxiFsOrMQwzy4ExTTIaPI2wUtGIrSnqqoY1y3sKPflUSBA5QOMJiz667y9uR0rmg9JMklnMUBxXik+RkWX7W6GNrU6pjl2pP9IUhuio/YZDe8y9b7zjemtMznX3dudQW5ar8V0ZenyTUAQ8dLxTPz/tB9ut0TytZh7BW5pkJcllHIMzSjSTrKnG8j8nok3CQkuPV7FE445KDmm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=j83vFbIZEB+jPrMiG41qWvEB7CtdcCCMjwvBj6/wU4awOCsSO5c4cnsiSY1pV/dPCy6hnvMoaQNNN7kNsFfVjX5gJ9rvZ2NsYV3ZpEb0nCFqxEgkb55spBCEkseIa9qK+Pc+ZwyXLUPQCHX1czmSYx6c4BT/M75UMF+whChcsuFjX8a/KIqyj+xQMZrQ1Z92APMZNrk4Xt+EnJwfGgxleJekioy7sS/NZiFxlTUowszdMKh0np8KiZ8HR3F4eLs7gWIpEPM7TZQVefJkCUo+VHlJqMPgu7ctuLyX9I4haJOkxIMsRTzKabVpxkdSvloEHEoBRnwNYvaON0uLFyUEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:53 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:51 +0000
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
Subject: [PATCH v12 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Fri, 13 Mar 2026 14:58:00 -0500
Message-ID: <20260313195801.2043306-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c95fbe-4cd9-44ed-1083-08de813af2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Pf3PIjdOoemD1hxulW4irgWftAbgC1f6vnHcrNOlKVy6PdZgt5Q/x38YzHWJm6Hg8K7sGjR9uD+ZLFjwIGyzKOg1iTpJDOllgoGF/SgHAy6660SxelLhiN1bciF8TY2LqHPMI6Q/Wu4hIbudNH5O4vbfHKR3T0FA4aN9Ay1qJ17wjLW8U+ScTUJNf4wu2rcm47PFB+WDDZri0gRWwNSzQuvyeopabWeFdaydPSgEQWlWOqvxVaJjlHUBrIuU6uwbswuUajRCAUU41nBrBIF/BRnIX8QNFynBDgZd4NasnAwjW+u4bIw5+SjOTjAxh4Yv3LMsGrsC1ITszlRb9iLJVFMxrc7oRcpfrwxlpjpaJNESqPxLyG3dcPNqpytICggBufMBVQLGHMnzkbDhGaQXbrUol4+rUtI1GJcyYyeDB6oqprFRM4nRCIYaPXT9ycXlbbrvu23nSGyHF5cM82+LImnHxG0C24js94FWZYh+fwu6X9AmUj8LnG3VDiiHmR+LBi3syRH2C3MvfP3cvbzXyzujuHusyuSKBy/EkN854rSZ6tIrFCak8z9VKSiQLrZaVdrPFy4sgzUU/5DDwdtLO5dEaU74UssCe07eze6tfabvh05eSvg51ZIkovymyZYrvDnPyItONuhG91hECHnNJHvYouHU83bxbMXB3k/bNQsqwCh5Zzav670qHIM5E9K3dOSjubrSaV7Z4Tpa3OVp9mwyH2OvBeJOV2qFDA5j+B3mX6r+44xvHPN81rxTFQbA79zJHyP2ZFccaaVqxdw+PVeFjbxxeZM7hJEhShQgsfvDod7oOfqEfhBDUTxQ/l0/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOouojANTAJCN0/TqYnLrdLjfPQMIPyMWtDsYdSwg6r5vHPHxuA60o7hD2ir?=
 =?us-ascii?Q?g2BqUtGOW7oKa3UcF2YTCwBMkZWtYxT4DZZkXYr2anQPdmovvvDQxN6Q+Ls6?=
 =?us-ascii?Q?N8wY0CtFdR4QXa1q6bHoAhtvj/IvrSLMKka953rfFxE0QIhSYXs/+4PTzqVP?=
 =?us-ascii?Q?kW5Y7tar+a1I5pfq6NIgELZNXiv8j62fj1cRIdzlP1AQWWhBcapuuPDg9wN0?=
 =?us-ascii?Q?bFrXyuComJpeQ+V2R63rfZsrWYJLtF8LEoWJ+T7rX/2CO/xT67XBSE07Crh7?=
 =?us-ascii?Q?jpRrxRnZOyPzfvtZQUS63xsZW5CNarxFCmjEz53Tl+wx3HvOuiqyC+0DFCkv?=
 =?us-ascii?Q?EYJo7px5tBw0Xpy1G4wMs5T5UPX0jFaIYA1h9QRmtU/lsWkdNFFBKrsqmYzR?=
 =?us-ascii?Q?lfwxWJg1F+AkZkScQMGWLkfwSIqBtlkMw351oOFvLdDl7VvUomCxlCZGUjh7?=
 =?us-ascii?Q?BzzhFwiOQcR7OLupMout9HYVipO+LmIVTevqGdvYJP/D/TMKUIolrh2BX4i7?=
 =?us-ascii?Q?bMY1hvdkfgN5EPVo3uIFPBd4rwF3Cro6dyLOsPwTmGN+mL9e97Wt/Ec59ne1?=
 =?us-ascii?Q?v7mslyG1zlA/EmcW9mt1csgujlPJ36PJLOAVaNoYFYaM/dOMudzmlai55Uwk?=
 =?us-ascii?Q?Cx8+h7zFlby2Zrcx44T7cLZ66kg5zpP/bzLewc6iQKqCJuhDitIWxWaaFAeF?=
 =?us-ascii?Q?4t1y5ckZuTRdVYONNwRlbqfoC4kh2PIm6gZcYvsDbZPFyS2tShxH89MNfvUj?=
 =?us-ascii?Q?shiPeMA7edv/LtH8CFCEZ5H7nwY2jBDeZ7UdZNU8JAID9HRciTTGaxzpf/Vv?=
 =?us-ascii?Q?bUIVUpwTtb2tv9M0VQiTkzSmpGVynM9mE4SDW5b4+g7XAuHmGIWOwgCH/ALf?=
 =?us-ascii?Q?nJNNaXhw1JBZ3LRaHWFeXXOS5ZMRBFO9ZKkywIDO2vle3eUrtyHKpxkCMd9G?=
 =?us-ascii?Q?gM5NMhylD7nZ5zNTlJzYH/YGVNECANl5ROyx+HToGqcnDsFrX4aKCY+IRZJt?=
 =?us-ascii?Q?9IYbBQV7/NZjmm5I7cZxpNKJXSFA8Fl/iWxa7mP2xie6z4iU5tqMQloOp3BK?=
 =?us-ascii?Q?uLeg2Q3lr1sVIGdngk2cNiodpkgy+pRX1wCKssRQGDCvwigBe3354Gc0vzpa?=
 =?us-ascii?Q?0Z9fo83iOaANcijdkz0mLJZPxnMrFgYKYtb8XSx6o4BzBv+jug0SrQZT9EUH?=
 =?us-ascii?Q?n/Wyxp2AKCGPf4pGmOeaYGL8o74Y5VTTvVPQb9nVmREMnlfdbtkdP6tdzkTB?=
 =?us-ascii?Q?WHwbG0oR1FQ4tiDZCOLOWCKUdRIWZAroqwg15mUsuHnRm6axcs4pTt63yi9v?=
 =?us-ascii?Q?SSLTqQ4qZK9zhomvohWi0EOwraz+TjPExXr+iRKipiey9EEwmvjRUFSq7L0l?=
 =?us-ascii?Q?p8hZognxe4frodvHeB7och5O8yUgwJJjuTJ/uI7G3a+bR7nsrvpI01kbwcl8?=
 =?us-ascii?Q?l7EQWKNx+FG4XpHTuKgaGwI3souQIgOEqujfIlEcwk0EOfeRckQygKMU3x5w?=
 =?us-ascii?Q?eqpp1IP48fTZwGX6W1StRfqwFCTsIVh9sVxxNIM2Ee0WKwSCaqoxKtHOAAyW?=
 =?us-ascii?Q?pCqWaeVO/MdzKd4HixysFfMNx4aUo+kJ6TH1IaDeSeJq35rFmKm63C0cE65y?=
 =?us-ascii?Q?WkzAN+wBzGoJNS8Amrm6pHSfyF6GAswh/LkfhteYmFncquJYbH2Bszadn43H?=
 =?us-ascii?Q?k/zarlPB2NVzNIZ2PWudh8A0dskzGaTe/u/87Rf3xP56OlKU4VVOYD5Oq6q/?=
 =?us-ascii?Q?Ov7bvSRPjw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c95fbe-4cd9-44ed-1083-08de813af2c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:51.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTBTmOaz5isPyd+mpThsPKL/sh3oTwwhlviDL9X+q3vGW6KAxU4g5VRol/BDT/n8HK6NnjQM+5USx5TDcNbquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_125900_166141_6A1D1878 
X-CRM114-Status: GOOD (  18.10  )
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


