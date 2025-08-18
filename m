Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87380CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=; b=d6oLPqTZcgf1Qvt5E/1hFlhYxg
	eCxxNzlwXqxyce91kWj3shQ493Va6DvMLrG6fJt9dvc9dlQtnTTFBtYMAxLcAu09zwikLOy5WTXUd
	/S8W2udZpA7iHEsPdNgB3/16rxG5NblnWSRfkd0d18EVyfB3bgBwaoZ91jA9V1t/ap/gGdbLdUHF7
	sL104DL0OKRrY017jXHdua4OoVJIaCqpRn4txpzz/TDr3FsyQSfVfMbskFVcUm0M0j/3/Y06ERyKp
	JZ0XAeNzO1NsqJABozzdWhKnMma+j0tJUN2+cBECZJSXCtG26cUrJ8Sk0Cx0Y53WJ/WzO4QNx0qIP
	Yl/IZFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo010-00000007T1u-1n7E;
	Mon, 18 Aug 2025 13:35:10 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuMO-00000006n7v-2U9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 07:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzchNfG7wuE3LtBkoiFK6mYvch4tbTL13JdAVxCSSTRlPvKICI4DAZNiHETNbeR+kfAjQmYhzGtkyLbzAWK9bKBKcX8l+Qtpn39/2siAjJphSoQ1fiSKiRtwOb/yWadzc+f9iH1k0VKXeJzQORPDbfcxfcxnwr/1TQVj8hCJe+ulfsRwkK3yU4bj53ZuWTOaGykZt5dL9Raf6vErVSmuPKcJorQ0xwRgep6QgsJ8mua2Wv1Dh1oC3ZjGiolQI/2LbUXWp073glzBPMmIvpfR2cISwY4hm25AF3X2n9ljhwfQmg2RG/VeBvuoXBTDWtZpBU7TkDHSbeRG/+37q+KdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=;
 b=ZX9L3P23dPyHo4kyw9OI5YpRp4dp0z8VgAa92zYhL0jIQSPTd1DBrHP4Ab1KBfdulK4kFrD9C1yRE/HVBzbzK8wLEPYFFfu9YRuVCKNQFAxDdjc2YPa5TMfVLOaeyW9hfsZvDl3f/X1/oM3pDh4VRdeQKK13WGehIbMHP4KQrkrxxGC3ZOkorEF5wJBETfKqQCO+dMwJMwiee9PMUFlLQhhXRx6IjstAxzh7pem+t5q//WfaNwNRleLTN6Zao4ay4eEkBfUHW6S5VEbFdPeTNLhKtQg6wl6qLlPf/A5DwWRlm8hbRspzhJdO8hUR1cENLv0SPHWngNg237N9hHsLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=;
 b=hfzOrXu1/6RZGazRexhxRd1LSPUSA1mfd/mAG9BF7O95nRO5AR/V7BKo2WvBx5W2c+AhU+OQI4QHY7G+evGwI8nxCROENIgVufgLx0EtlOlxvKlcllVzR5prA8tUQt4UH2eDJw9yX8ORvfLXwxJoUSfAfXyu43DM8s6E8LMe0dlzhwZXuVq3GNvzw3y4uljYv31HuObqI7TOJLxrwEFnUnuMa/mGfsa+CIh7d5/q31MZlHn/4rMVNB2j0JxQQz80VxALhrt1Mh7GilnLu4q1rmMHDiTAghc3dGFppknFYrXUJBqB6z8dRrNBdaVRK2XdxbN3eHHDKBfJgH8RndMSBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 07:32:47 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 07:32:47 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [RESEND v3 3/5] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in PM operations
Date: Mon, 18 Aug 2025 15:32:03 +0800
Message-Id: <20250818073205.1412507-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250818073205.1412507-1-hongxing.zhu@nxp.com>
References: <20250818073205.1412507-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e304e7-fbb6-4b9d-4b98-08ddde296d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VqgZXNh/3zIXGrKgCMXKw/65UCQNqCGEt5rrkB7EiXslWvVHFpsnyfsixcku?=
 =?us-ascii?Q?59v8vzOPLwJxyE0R9Fdm/jaWtXABbvJwWdoe8+1melHBj0F1Kc895eExnhc8?=
 =?us-ascii?Q?tKr5CFJyjAcjlQ5K3il+NxPp9ju6lrdbz72yEjtoBMfw8nGQLMcLbu7kikGw?=
 =?us-ascii?Q?t7DmMDSBRlN9C80wvdFNAryPBzeTSlNug88ey7pHH6o7xqIttku4cjXmWAIX?=
 =?us-ascii?Q?btogOXX6xZ6L/SLkNkPV8dgNwoiYWgJWGTSmqDYNOKTh0X5yE2dYV4IE3Pyc?=
 =?us-ascii?Q?0qMaKNIaEHmc/eHMOj+ggtdvYywhZm9vIY/gxJtCkHVrcFdLYnstQhlLJ37e?=
 =?us-ascii?Q?epaLn3knd7IC6m+dAKYNY0oOGXFm25p2Tfh0N/JHUoxk/LboPIjSLlPMU4ZD?=
 =?us-ascii?Q?Jv4JAEznTPg5yrbacK2oeWnaG+1jGqmNqbZSeVURamJXJUkUzGvOeS3tqyX/?=
 =?us-ascii?Q?hRgEemt+mGigCvhI7v1Fwh+aiG4IkXaaML2BwTcp4bkvZ1MLWp9ONiWL3gvq?=
 =?us-ascii?Q?CUHravOEW8srSNZp0/8nLTv7uf9Aqolh+wPztj2cXxtVQrswMOBKM6wiJTL+?=
 =?us-ascii?Q?zdH2hZOfcJKNKfYm1RoH9vmbmKA/BFRMoWxZMHU5LXur+2f0AXAxB6iGhEEz?=
 =?us-ascii?Q?1k5DKnbEks2UHl5B+zxYmBghoLTKaew/qJi5yApcs+HNI4TURARIVwEEqLTB?=
 =?us-ascii?Q?a8GpX3jLc19MyL6Grmrz7zyAgojiuP/NKETj0lUd1X/BwNOwEEICNRE/om1I?=
 =?us-ascii?Q?uhMgBuM8hAxt5WTOIiv/6OjorgXWd2odRpOoKE3xPf5kz81hH2UG+f63j9A0?=
 =?us-ascii?Q?WgPnnZAX+x3goEaL3q7ZUPhb0aHfxggpeVFjWyorgjO/WyVjJXR/BBhj03FJ?=
 =?us-ascii?Q?ARaeUtP59cW+GimWkmNIUOxPdvwtolJqyS/v70Tl8al7nI/dKPszZe4c6wvR?=
 =?us-ascii?Q?O5aLrG4zrRzMyERRkwzfhQKfKVvQ4H9Zs7uYgTf/XTo97B06Baw676rbhWj6?=
 =?us-ascii?Q?1bQo9RfnYAqspN1gT5vhFUeX1SbtVAtkb1ls05eoBq/GWL1y2y7BdippaI3Q?=
 =?us-ascii?Q?nBVN9hfWA5qJlAkMkk2JiYb2+ppputIVWL5yBnnkJonPun9NKURTFtAoKBXl?=
 =?us-ascii?Q?+TEVCeMJrmWEuuLDMGU/711XJl5awGDzvgSaz/ztOYN5FbdqSm088abT7dW4?=
 =?us-ascii?Q?I7ko5xXrNWwIxydFbxRXiDMW1lW48AwobrDeuoY1Jy1SKQObyl0NnKYYFEM8?=
 =?us-ascii?Q?RU0I7l9H4S7oPFqEX6yy9J1S5OIj0lOvKwJSuWUFHxVn/btfHrlssmIxcfIJ?=
 =?us-ascii?Q?XokNhlaLswr15IiG+jM8Toy08C25i9M8K+q04alic2nfjMj34iP6BpiTlIYn?=
 =?us-ascii?Q?LtnecrQrpTRmK4Qsd8eWW4Y7rcAGEIhz+babLUePwxNwWxRJdsF6YB7Gj6jq?=
 =?us-ascii?Q?LT5jkBEg29KUqevf5GvIuX8/9HEthuRCTzFAFTuQt+OPM2DKvZS6O87509JP?=
 =?us-ascii?Q?sAnF4nAcVowgULs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvdwEYE06O2EzmV2dn91dQ5UEn2hrefiPpruZ5rmrmPTVhmuaJ1gbyd0RPya?=
 =?us-ascii?Q?K7DHLyy0ifydk8mJKpECrATiBqCHIkmGlKUTZ1Y2Nw/HkFxNc5Pghx7siFlh?=
 =?us-ascii?Q?gN+hRI9nGgR+7P2P4BTyz5UG7mRfbwfOu1RSrWUhqA51EoW24mznuR67e6D6?=
 =?us-ascii?Q?kg2aALapHWbaD84H+uQ/jtZ59HwdJN7I+nGPVE+VZ6rgd5oepVJk7d/8Kxb2?=
 =?us-ascii?Q?pPVeFNU+am9gBVIeGtjrBmWJ4VsoHkxa84Q2KsFiUAF5/zPMwxxPtR9jdpYV?=
 =?us-ascii?Q?27tK+F67GcRUkluFc56YZ1/JU12ApMG5UWw6l51yxI9BAUQOTkwSX0H1OVqC?=
 =?us-ascii?Q?wr0ZglyTHRUwtDr31tDXNxfRRkhnTpUMAvRVcvKLT/7xNx6JJrpPTitbfBxp?=
 =?us-ascii?Q?RGYGw5nyJ2BWMaC/I8tGzXF5qyUwI+vWyYYVMaA4l7fbTjQh9igtYYsuojf2?=
 =?us-ascii?Q?VgItEKJ8qsD99NO2gilMlsYv6rFDFPJwQiaodEh1GkuGNVYf1N9kGcxAJHjf?=
 =?us-ascii?Q?CKEEqAeTUHR6t0UEG6hYRr7bij0jMVtDXoMaCIfQI3VUFRcYO3EHHa5aTUJo?=
 =?us-ascii?Q?5pMxJ3pWpcEJPFQMtHz1+fGKzXVbkmxs5P6I/JfoiBGg/qchx7xqMUyJyiRH?=
 =?us-ascii?Q?laI2kRkbQMeN2YO7e6wSWCdXotDVVbtlSl94WyQkg8r+cilNU5zN521wLhG7?=
 =?us-ascii?Q?CXHsBa/5ZTO9M0ULh7fUu/alhSg5T6jxpaaQYbfHn6HIKJ8AHgOKDFrw8Vvg?=
 =?us-ascii?Q?r8yGDqeI0WqyGDPh2ZOwezTnPKh5qVpIMnoG10bpdTrqfxVp6aBDrAA/J0IT?=
 =?us-ascii?Q?SQ1pdXLCKAL18JmRTfSAo7MPR+hXEY0J+E2f6L1OIPTd6Maxuvhr24svReDv?=
 =?us-ascii?Q?s7TraaH8YHSEC9U2ulS+8cJjPP3DdM7jxEQIE+mU2rMJOWlo2N9Px43jAkF/?=
 =?us-ascii?Q?Rq1nIGROz10cjd8L2T2FghE7RhonzUUumQcPi7u8ZkuUh0CB7DK2ftpVxJSK?=
 =?us-ascii?Q?sh8wM4JDiqBicAoyffSOGUH1w1gIOnnYXwO3BgwaFcAMZJigi2UX4G1UiSrg?=
 =?us-ascii?Q?M6MVl9JV68D3zc+hmodBguKMUHjQKYpwgQvR7Vca6JVs5ifXh811+8ZPmwVH?=
 =?us-ascii?Q?CE6GrUH5ZexwS43L3sdvEgAlZ266ES+HiIUQ99nNZ7PZLxQxAApp70ds3Py9?=
 =?us-ascii?Q?rL4ukVXmPRWERKYUKI+epnt5ckpZCfL2W7znayZZLJ60cYgeI5n0lOOgz/iN?=
 =?us-ascii?Q?ADE0job0y+e0YOUTzdiTeHQ97ITo7FCIkKDsCxK6rQPzF1/80ugQEOVs8MdF?=
 =?us-ascii?Q?8BBCdP2HP/LfKNVR90p6W0IvH1K8Rq/ziZ/xUFU/swNIVjhlqWEv1ryArBMR?=
 =?us-ascii?Q?0xBpuh5oefhwpr9B/OJE9or0xGsySd6RMtkM0qtNh4nJ40VJcPls1LR6rZex?=
 =?us-ascii?Q?oH9OAgagdh9IJV9MUVP0bHSP5cfqeddoxsfwY+o7HjgYf+2mI4ZLEU/uSsZ4?=
 =?us-ascii?Q?vjN8hVCZ2RNhh+QlIsEx1ytah9LKwrECAt7E/+GKsUDr7HDThQl6dux7Zdko?=
 =?us-ascii?Q?wU70vgyZ51fss8TWygXc5cKgtSQ2bFeTUhESr1Zq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e304e7-fbb6-4b9d-4b98-08ddde296d9d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 07:32:47.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kYByVpPkfa6G+WCZevfRaF2+qKS/8BhIQ6rKrvvzEpE+JJ2DQy6d3pykb8Wi9h2kKEE9xkK+1JXrYDKIc/BWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_003252_629308_E4E236B7 
X-CRM114-Status: UNSURE (   9.30  )
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

Add a quirk flag(QUIRK_NOL2POLL_IN_PM) for i.MX7D PCIe. Don't poll the
LTSSM states after issue the PME_Turn_Off message.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 18b97bd0462bb..a59b5282c3cca 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1863,6 +1863,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
 		.core_reset = imx7d_pcie_core_reset,
+		.quirk = QUIRK_NOL2POLL_IN_PM,
 	},
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
-- 
2.37.1


