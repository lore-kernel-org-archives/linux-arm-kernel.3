Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D83FEC0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ncgPICka/hsIzvDlFphj2U07gKf2fO15DNOFdXnkCQk=; b=ADTjyXYO0T0cM1lZiBl539BOF2
	tqxLzpL49ZkRmMKXZtMxyW+QRVQUYVDSCzd+3YVD93XMSC9CRxFyMMZH1UVvvk7/6TMO1fzkt57Hc
	AeaXvslmgAJRbTq52zc+3oMNYkLC2Zey0jxz1Oiw75ei6wHLf2nXZq1OLYlwQstUy+pxxS7LOmN+P
	qqedownZYQe1HfPVQl5wIrk/dyHSOVms+yzSDwt61zER+L43iDt30p2x8VE2V2p8Pf0yuZhCtJhBj
	vehJhbu+/SH88WZhG/Z2RtjNwnmuazvze08fUJDTT2B78daaEDatdFf0GEvYA5adZTlQsXnkHH8m+
	vxrq0IMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57K9-000000028b6-312B;
	Tue, 24 Mar 2026 19:21:57 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57K6-000000028aa-18ju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5wgZYxbJIQCfCxub/xDvfaW/34Z4xv5E5XFX3GFpOul6PfxUYcdA4/+LIvPF/Mmxf/82EDspXebT7sdioBBh/VkvzT+Xcua5NllytsNCTRU8EtJrUUPWH6Ne2Oa2xjhRg569/BAU9+tCjbjCRlt1twDUvyDSLaVzjLHBMosropmqbIFN8DmNVHEn6lt06wKwkdcdxq0BBrpZ8uqUfONPzK6V6brGn5s5Lmk/v3W0KcazVpCzzyiTAGw4yIJ2MSG2ixR9jel4Mhua1FVyuYewR4nd39okgqaylglD3nv/eUTKjKWXa7WEsEbugQz4n4OyfdxnlD4siJi5aK358F3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncgPICka/hsIzvDlFphj2U07gKf2fO15DNOFdXnkCQk=;
 b=H4HCglR/ibGQ7dGmWtGec31Fykt7REn1yxXmqmHF11HNOFBRRoUfPcKNj5AfPVjIhRsaVxepXH+Hxfo7lWR+ZfpTLjHuF2dpY1SpZ4+yV/BUjiZZBqUCFZvGs238dZEzULELQDBr9afGhD0dLOnhtEoWyDYGanLuSS89KuBnyuxqqF7febyIwW4vm1viOs+hR2oI/D+g+t7nsZmC7zUUluhledaCeftJVxsxxUf/lbhfBJ+vysOG9O7yxBs7bJ+YJyl2htckRh66c7ofbSBQQvG93c/G9LcQ8FLyacsUapbtxi5S252GdvnbfrGzYj3sUPPI8rLUTj4bYJHTcpWWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncgPICka/hsIzvDlFphj2U07gKf2fO15DNOFdXnkCQk=;
 b=NVSu/sj52AJV8VDExQ9ye0p/O1u75Dcf1/ebRmjVAFSTT7NBcYho/ylaeu8byubq9IdFfS5UNFH0IoBRWRNLuCup6Jm+On+I0vat/XkzhTywzvRxCUvMIKyQgmDlhJgp5Wx20rKWOxyHpby8/4PLuUZFyhwsUsDlinnE2t7mvbXqrt6YNUSHQewIoZvjGS9mWTnVA//WExyZSlcj+bUOI34q8HaoK+EovkYzQPJUgB/i+OCMCU9sAgTY6D00GLO0IZNPFojuVejTqxyQMcDhOY3tcm9FXGqIziHGvKyqfCVsyKD+YqRE64p6naVjMr9LBvRyAAlUTCgwiPf0enaB0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:21:25 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 19:21:49 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Tue, 24 Mar 2026 14:21:29 -0500
Message-ID: <20260324192129.2797237-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0087.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: cc286008-e2c3-48bc-a122-08de89da98b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: re+hW3roJbRXdKecy/VCoZnrOdy4O2KPBU5K1PI9GL8BhhMLzIUS3n/tU0aEnBuH76MD3ZaFiW/ivVIkksR+MUUz9Uzx9bPGz8CNZ1TCbouROE57Cs9fntODCT8+Y4I1Go0++Ceof3LnBDtMwf/aN+Ohb/bMGYjiJ2ofmCzai7yPpNzzCCQNYFw7Ptu1SZEhF1njOJ0UfKjgHGgZye+Ajx90Lt0brai1ZBxPS0zCEcECt98qrErgBNCbB+s3lWPtQTWgqjTxaMvP5+dW049BsaIpFnnnPb/4DFSgsATpvuvYvF7DxX56blUnJOUaGUEacrEXTLhlRfD206re8h/pM+rBGOs+oqXyHzFqBppR4kPIE2a0rPRGrTcGzd9hKgIa14MGIpzJ+INQdYwUrKzeltBor3Tt9M4IjGnvasUah1N3xm6V9GS/3Y0U4zxaFNRJcJm94KIa8Ous9jllDAv3I0YGIG2nFTvQLq8GNrM3K0dCRl5a4I4Ae22eBWuRWBoBnZOg1wSXPEQow0vSIeFiOasmmtaMSAffso5izo4lgELY8oexL6qb1PrxRQjImRaUnRys1BeMlymTNuuAnu+dKM+F4Fw8Rj9pJJovu8hQ2KFiCSS4NYGqKqodtd8jMH1f7L9oSMlpnIuVkAkoC9VyDMZP/DyoGDqMBb61whyaf7dZD3poDSUtmkFSlg5v/WH92EI5b1optT9taMlazs7tZVq5KXFN0v8q7ZD6jmKYgDSYuO/hJJU4sKHT72A1Oo5inLw2MgpozgGB99yF9ZTsXBJoCL/dcjgu4m9kG8eibGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QMW+RN01qX98JrkxG7ZyQpbI6+7lgbI7N6VRiUgJIqQ9TB5dGN5yizM03XD5?=
 =?us-ascii?Q?+fiGBdiHaazhgmx39CDrAbbl6l2RVTE6abMDup8+jqEva2REUCSjojGv0HP0?=
 =?us-ascii?Q?rkrRJpcOy4ReflkVNjibUX5+vALciGGY1QAXmu8WLJ7zD/WhazhjFnTYWMYw?=
 =?us-ascii?Q?IFsG3wY93NkmODqdmz5Mnkss98vjqQ82WJRJ5wN39Dc1x4eJrHBNVS6DdSN9?=
 =?us-ascii?Q?GGKoe7yizlm07h8vfb/+MmWq9MebBjksQAP7xLFp6nqDVLtCl5q4Lw3IBbL/?=
 =?us-ascii?Q?TlwpyUsg37jZYmoQOzPrdrjxluHwbKz59LjbWXiIucA4WX6twpG5ZI98vFZN?=
 =?us-ascii?Q?rIV+srcGb75m6nea9DH7oYQo2UD6fIFR8tj830BPXxT8rYx4blnnkaKKUHwq?=
 =?us-ascii?Q?31SpQ/tcfjMKPQOxCv9DtKnoM/UgbrfXrWmbE5HR2nxQD0SvLZjSxydhpl0V?=
 =?us-ascii?Q?OWdM8NgWNTNF3Q9Ht8yEhtonAx0HHhTISrycO3cwDXml+IfDo0fzOa/uTWYq?=
 =?us-ascii?Q?+NSK40ljWURSQgVB8c8EoRm2TSOEKBZCx47i6pJvsNSK3muPHbDxQ0dT60Ir?=
 =?us-ascii?Q?CRQfkHC22CQ3oj680JpHigprw74ibbza9pnWWHzoaZJlRBsW7FqBIWYSihig?=
 =?us-ascii?Q?a1Fuz3CB8o1HCpyqs3YrWB0btWWFYDqPM0HwzFNlXG6XvqDr1uf1Fuh8mDVa?=
 =?us-ascii?Q?WmiHOfD4WNZHq6mVlQazNFc/VwZLP9tnHXnR3FqRTyyoeMDRNJV+6vDkKTz3?=
 =?us-ascii?Q?J9cAejiboyA4YBgPbYhduHvrjZMckhNR4wkZTgH32VtEsSHq6cTxkJPgs/wu?=
 =?us-ascii?Q?3tvbsHlevGQ1CnLQazMZRkdeOK6zHKcRgin8ktuPyFTGAuBEQAwHSjZEwH0m?=
 =?us-ascii?Q?u+HDagQmVLWrFQ1P/ZV+duz5XF6Kz7MWCKly+WoCkwMNKbX/bz/tGG+kIZcp?=
 =?us-ascii?Q?QtQMnHguzl/5fHvKVxX02+mF+34WyFU/632+4WlCa9jREVpNzs+I9EamVJ3o?=
 =?us-ascii?Q?4bpzwz2Gj1XXkSNscLLFj0fE7ab2/JlFLGqku5I0ZZpbLmVTOwOP+jAkMqxF?=
 =?us-ascii?Q?1faN/w08RUYXBAERgz2AQ8IalMQPFT1G5JhaMk/+KQfcWNdmfT1x7/1qqWXt?=
 =?us-ascii?Q?VKyhgZ4adrUpdBOGzbwvM+vAQM9/bVik5u7Y5s9w3g9ghhPIlc67qJG4spYA?=
 =?us-ascii?Q?X9BOWN4yfT4142M8cLg9VETP+FTVKUWvjZ2aIJjQzX3fXRWnqihT16H6oWil?=
 =?us-ascii?Q?ECKMDB6TT69YpgnDquQIKwpxVkO/cMutl6kab6TYqx3j3D0xMGon10LASqFr?=
 =?us-ascii?Q?MU/KT2tcCOsCr3+UKLTYlkAjcYLF3ACwr+ym96jkxfBQQSbc1VE3XsjCGrKA?=
 =?us-ascii?Q?Hp7DfKXU57QmLhgrVXQVfNBPe9Cm+kZUmxS8dADXxlTEjTzuKy0ObUg30Jyd?=
 =?us-ascii?Q?Fd0u9CYLLKu7iOKWwXSA+8IE6KIdbM11soWlMIEDUzg+SoQt5Vs3xw8WGNC9?=
 =?us-ascii?Q?UuxgRFJirJkmXlnzYPXV+NvLdp5i/JP63xI5SqJsmNfMy+h331Ru+qA/XjRC?=
 =?us-ascii?Q?uqLjbT/Rsz6+ozbImiCTP8BFH212RV6GvjZ43QO6FJRQe1w7yAqUebB1XjJM?=
 =?us-ascii?Q?QmdtgU/ljW8hUUjJOkWT28K+smPvPXucbVpat3TCALz8DcwAjh2rfjsNRXZY?=
 =?us-ascii?Q?9qlDnCzOO7HtkyOfWJzSi0NGfs/qSwCjAyEwbBkUz9cv3nRR3cQRBz0tG38X?=
 =?us-ascii?Q?HLOZrTjqTg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc286008-e2c3-48bc-a122-08de89da98b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:21:49.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMX2U/voD9AinS13BgHiYAGE4BqrjVbVgTqeObRzvDeSpBi0fnslg+2s4VuCZhn4tRf35PhqYwmCp/GC3zStLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122154_335444_0A6E2329 
X-CRM114-Status: GOOD (  15.67  )
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

Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
trigger due to a hardware bug in the detection logic. Since the hardware
does not support Both Edge wakeup, remap requests for Both Edge to Rising
Edge by default to avoid hitting this issue.

A warning is emitted when Falling Edge is selected on i.MX8QM.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
cc: stable@vger.kernel.org
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Changes in V3:
  - improve the warning message per Alexander's feedback.

 Changes in V2:
  - add a check for i.mx8qm and emit a warning when Falling Edge is
    selected.

 drivers/gpio/gpio-mxc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d7666fe9dbf8..647b6f4861b7 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -584,12 +584,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
+	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");

 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
 		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
 		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
-		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
+		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
 		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
 		IMX_SCU_WAKEUP_OFF,		/* 5 */
 		IMX_SCU_WAKEUP_OFF,		/* 6 */
@@ -604,6 +605,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 				config = pad_type_map[type];
 			else
 				config = IMX_SCU_WAKEUP_OFF;
+
+			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+				dev_warn_once(port->dev,
+					      "No falling-edge support for wakeup on i.MX8QM\n");
+				config = IMX_SCU_WAKEUP_OFF;
+			}
+
 			ret |= mxc_gpio_generic_config(port, i, config);
 		}
 	}
--
2.43.0


