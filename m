Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07B9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cLJL3Y4EWxuDSI7kGglfp6I2goRDVatFreA596uBmCE=; b=WnQ/nAS8ZBM0veLXXOz1OBrWor
	P3JUrOjkhREzMdLbS3mZR+j0UbDVPj9osf2PTBl/6S95ijhdf/yYsqPlDG12FmLZ2IRE3JL0cPSRn
	CunT5bGHYeABT+SR4ncIZZ8VYIK79aktvjRCoa+B1sLitZjppKvXBRs2b1H2sJ0lc/YuHZCwQfVV1
	oXCT3IMFu6nply6qIFsgQJWf1lvf2jt5K+lQjipQ7Kz57vuxElAQRH/84dCL8YMP9HrA3CCK7qLax
	MIxTHHgMEoPgpHb+lAMEex6vAUIe0w+3oaj228ICNSNZwFagQQ1BBphnMjF15czxJRr7AGFVy7EkB
	L6BrnICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirSR-0000000EC4T-429d;
	Fri, 14 Feb 2025 08:53:59 +0000
Received: from mail-am6eur05on20622.outbound.protection.outlook.com ([2a01:111:f403:2612::622] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirO1-0000000EBJV-2nqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwpScpMJlfEfwhZt0kSHB++zqghNxgwW/x9eO1OFUIii01qy194CTr9fx2GpQRXme1BPbPe8QsVMv3eSAVcMEhRLL4hx2FdCaHl6KUj3RwnYoJWx4+eaPMBKLr08pYzauSiZaNOjyHGE/iZBpE+Fr5Kkg63u4HE0KcB1jWnZUiJbBaf3Jw8edMk9LZzrG7eojIVLcdKq5i0STUYiPJMuMEhjUTn3y/F1aWcuwUsWav4N7m/UE14cXBYYtyrn+aXOkGTdU4Z4ddc8wJ06rzuLdH2Pclk5QmAsvDuMv3NqwYq5Nr8zl5PMX0LBJJfIIysUhZqobfJCx7OAuDDBz3VXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLJL3Y4EWxuDSI7kGglfp6I2goRDVatFreA596uBmCE=;
 b=W15+6i6u7dq4jm15zPpjIuvWvzHcdBVRwt2jJxXvtbqgcG2ajlIif7w3HmDDA5m5ZjlM4ECAU6/Ha4xbQes/H7PqjTRj17h40ItgnlGbgDM1Ytao54y+egmoyG6zHb60vPX7H/CfuivPylxmAF+Udatvu55VBowUZ1HVMznul2JS6JMgVp9CXBpmnnnlaJ1hDqBiT3/EVWrvRDa2uzotXyr+UA1J06GBqaz8BQOI/Es/MzrTeTYg5wBtaExoSaIA2/kXoCQVK2WmhUH0KNpsrl5WCAvNn7ySXi/amioJedejpGk4KLAPgh1SR8BcCBdw9bRLuERMhhX6lfb6X8IWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLJL3Y4EWxuDSI7kGglfp6I2goRDVatFreA596uBmCE=;
 b=vOgE51Lp+/lgfzBqZq/0MV9K0I4e8SNg4gN4+tnL9HczR1rt4gcC5HMufEqlhH4olhQjXn9QhCefu1/rwBlyUs7L3ApyZmEd/89gpDEiWIgMUiQu4R5sRA8+RTLSRUdDdthugzGnJkglNF05FsnH78CTjkGt6ehDzqwEWGT6g9LBvjGzrvCGktjQD/nWOhh7Uyh6v/Fvya4Qfi1iEh5R2nkcojIJ+cGBwf/4X9cuDmaBWEG8b96aF5W5t6tO2Lr95lfMr56JGplomXwPDUNd1JACPopEsVFrUkYQvd4Dtf+x8CoX8INVx8DfCBIdGpIxY+C5zbAZCrz/WNQmh6Dtxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7368.eurprd04.prod.outlook.com (2603:10a6:10:1ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Fri, 14 Feb
 2025 08:49:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 08:49:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marex@denx.de,
	Peng Fan <peng.fan@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH V4] soc: imx8m: Unregister cpufreq and soc dev in cleanup path
Date: Fri, 14 Feb 2025 16:47:51 +0800
Message-Id: <20250214084751.2975503-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 4490cf5c-aadd-4678-6fc6-08dd4cd47293
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JtTGCh132cPuvOhdM78RuNgbdQNOVRNzkHw2Hi5JM5t5wIZ4ZoIg70M2ceOT?=
 =?us-ascii?Q?pSDZgzV6I84SUjxo8u5tjXhtSudYqLZ69noPQoV0okkwus9Y5pm8C22yLThZ?=
 =?us-ascii?Q?gvri99nfM3SxUd58UkRRZC+spz5jHhm357wtnCaIq4d/1mvO+Z7ro9uFZVq7?=
 =?us-ascii?Q?vqdWKEtVDYWxvd5FWPRhlHzSVJ0SO698DS55e1aWcwvfVZ/Y12XcS1Dph1Mw?=
 =?us-ascii?Q?CMYlH5va2fB6gzIaT2N84V2G6q7dOOITKDEun9gW/xea+cKsT+YGXSqho7Ri?=
 =?us-ascii?Q?zdv3gns6AYBpStDWqHyHmu8bOHXgYhrvU/Djntk7d720fqRfgnEwEn627BkK?=
 =?us-ascii?Q?IEVlyXC8Ez1bcV6mEHMXLSEnoYCBCQWdOUB10T6PYbMTVGxxgcqdXBVAg1lY?=
 =?us-ascii?Q?zzSVcQnwGx0inK4S+yewCvOv36pLRTKq4PH33z3b2mmv55y389kPH0xZBlQI?=
 =?us-ascii?Q?v75dTVqPcqRjrN4zOaHmwF06yUW+AcerHdBqcpT8Fo8xUcq0qV/C8zmxRWvA?=
 =?us-ascii?Q?D9MhQCpcq95eXbdW6So11qL+H5Ua1RNHRhdDiXZ6ZaG3dzm4zO6TaHdX994+?=
 =?us-ascii?Q?iXt/Db7LO1xnKkgLbs4/+7a3mMIWnIRdcukLrXjrYjoe1f4EXrp5fLHdKJul?=
 =?us-ascii?Q?b8GHS84l25jYDFK15qQT/l2x2R4bUtfA+R/fdBtReX6LF6SDXOaemb/nHekU?=
 =?us-ascii?Q?h6vgzi88LbeGdKRbFr+vI6NRTx5CfyBBKdA7DrVYYZwzeOaN8aBkVyy3K23I?=
 =?us-ascii?Q?vCrPqiF97rD9RkV1aJUNkA4Yk78onija2C09Yh6WZ56b+oehVqtHLBg4DWZj?=
 =?us-ascii?Q?ylak4J6NI/POWPN4NJdqdNyieLwDIBVAoE+IEbzbzsx3rKGbuGRTKCc7KsOR?=
 =?us-ascii?Q?5TL+HTkGdUCHdnCRs2RgaNyzNQHLIQD6FDzuBrPo2ILzjohCKTEa65C+x+MX?=
 =?us-ascii?Q?wcm+KwP1ChZ4OHGk2Fx4U3lA2tXZQAHiVgnQ3box+dnG2/W78V7JYTmuF957?=
 =?us-ascii?Q?oZ7PUzS3l/YyoIkxyA8a/IhnACRLcOLMlOjL9yietqkDhvrBC3A5zav5GknF?=
 =?us-ascii?Q?1WHARfWe/r5FcMdeuEoFvd/pAW3jausHip2RbuYXCVrmymd2U4yBvGKCS1L9?=
 =?us-ascii?Q?XQlzVwCqNAerY3Wi7T/BliJ/0aSXItmzRVbDH2npHDacofYap6SwiNh8sJT8?=
 =?us-ascii?Q?Q9UBK52bwl1M9zEr9FKLkDiwchKHzKGnTu1n5nuMcT2kCDKTTHmfZFmpIv0g?=
 =?us-ascii?Q?pWVq3PoAExzGP3zmci8ruDOpR38yKX6EwpOihicuBrUED5MsO/AdzOhl6UO5?=
 =?us-ascii?Q?N/3o8PJMA3sU9ZMly0ZiX/E2DEXC6cjpqhQPw4rH66cwkTnAvM7jGDYDtEl7?=
 =?us-ascii?Q?YhHDcYrJwysloE4oewanbcr822W3EN7stZiA7Dj4y5BhnqBLG1rFiCypIWoD?=
 =?us-ascii?Q?kra+2Oekj+n1eu2ZE1Ij/gDTbefDBgQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMrM1Dtv1c25D7cKANgXtYUdvCwAWjhzf6VG486ul/o/GQs2nr8md40cYL5Z?=
 =?us-ascii?Q?SVeA5YO9m/+yQ2K4UvVTjs5/RYIWj8J0Zsft57l0VAYE6oYE0ma5JsIGjzyI?=
 =?us-ascii?Q?KmaZU5tJT4IHgZAwTnf/NUX+ZjkOYlIf5S+b2lpbc0gHpiNCKCpyhpFwTH0Y?=
 =?us-ascii?Q?KMLEtf2ts11DWjd1XG5Xc39LcKUF7MtSfgVfvCrlUv+DcyZmpjpNai9UFYRM?=
 =?us-ascii?Q?GJNDY3PHK04IjIB1U8RDzOaFIjBrpsu9MRSdC+bSaIsghtx4QG4PX5+hY1mm?=
 =?us-ascii?Q?P3ZEaSi8XC3AG/T2RRXoYpvlE8MHWRrMKPhHqk/KF8nE3ututpeIuaauR5Ft?=
 =?us-ascii?Q?NfrtgwKgSxD+Re85CEtriFjnlMhFBam8dUBAm73qE43mzSxFySYXZ/JBT2CP?=
 =?us-ascii?Q?FBi+Jrf4nOaijcwCI4GG1N+wEXiGM6DCZq3oqHAKotNTzYvkTI8Mea48Q+z5?=
 =?us-ascii?Q?RO1yOptKpdkTZ12JSl0ucN7mfFH8OvdMz97Yyo6hdUt71QV1i1vB15RBJxl7?=
 =?us-ascii?Q?MNtZbbfL3Uh2pxGoASRTXoa1UWED/oBsO26i4ik4xdmkticyBcwxxadbCg9b?=
 =?us-ascii?Q?d7bqcWYEA4jlz7YBxaVZbbXP061hdltLGL6+PrfAVbj4PLbUj4yNhUMpAvtU?=
 =?us-ascii?Q?l+z4ILSugZy6nJkBtxcxjvRCLEKk5bHHeJO/JLH7h+WM6lVjGNUaHNTw2psE?=
 =?us-ascii?Q?aHJXBa5PSx+kZ/UMO6m+GHFvz0aZHRnEZEHLMM2DtDqIOwYQdXZS67A2hsLR?=
 =?us-ascii?Q?2wlJKmQKAFGwdQUNWPfMKJwx1ZrJbAyNl7i/qMfXe62646nJ0H1q3MkSlfdU?=
 =?us-ascii?Q?He5LAvGdZvnymuBh71BvzK6mHvSrHW8t7vwqrvg9Nn5a4I1OgiwIPaEU9OE5?=
 =?us-ascii?Q?PiBtWyerz3DcavnFZPBAc4Riw/iqvza91D2xdoSSIH/IWtlmnSLSkUmCZ1dZ?=
 =?us-ascii?Q?5dkpXCxeyNNbToyI9OBeFvVC3C801Dys6xPqwp9WtpMq3QMaZNZ4t5AEi+yU?=
 =?us-ascii?Q?0WfqxWZGCzgrMx3peZUfeuv6njqNaahIr7b44ajolX5QebT3vHIDf9zFyqBQ?=
 =?us-ascii?Q?Gv2suSYUKjbAp1WTxZ+QLXSFPpzrEN1mBgcTkEp/nGn+hY5v9s2TaxnrkQ7Y?=
 =?us-ascii?Q?jfdssEyghhE3YT2HC9Ae6WQc4oGm5Uy8SGmyUsULsINSySqObV6JBbRSt1br?=
 =?us-ascii?Q?hzLMDDz+wLTHUQ1o1j5YoeC89TS6Bys862bqEzw6kb4smgEXNqnjDhaBgkKP?=
 =?us-ascii?Q?eZtx67H2gVGBTrbf7AjVqG/Co9/fS2NURN5KOLgUUupR8fDMkTwOwmoq5CKz?=
 =?us-ascii?Q?4kvdNOvyTzuHviwoAYCoPptAu/g4Sja/lPZrvwDAWUVGOXUkcTXhEmRH44sO?=
 =?us-ascii?Q?UmGai/hLlPosbNEYUSUQ1JQSpKzPC7z9l54/Dd1u9K0UTIYEvzGXQlW4UQMd?=
 =?us-ascii?Q?8JgC4R4E4/d4injZxn0dyRwX8BqQ0uVoBNSSsrGcOe+1fxHDEjbvSt4JgtuT?=
 =?us-ascii?Q?OfgKtrQZZwfaze2sIuSlZugIAVo9LkPj24Du895h965wZyetO8ErUiLu30uJ?=
 =?us-ascii?Q?7ZXwXbXX1esxLGrAQjDQH/vDPTLeHqjAABIE8IUX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4490cf5c-aadd-4678-6fc6-08dd4cd47293
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:49:09.8271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvjcg/9RrBruMvjEIsO0KJWD2KU6HVGdin7b5jJ9gmhlkG4llYzBOFIEsVG00vwNsSu+XOiRWO2q8M29odwoKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004925_718941_AD881602 
X-CRM114-Status: GOOD (  13.40  )
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

From: Peng Fan <peng.fan@nxp.com>

Unregister the cpufreq device and soc device when resource unwinding,
otherwise there will be warning when do removing test:
sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
Hardware name: NXP i.MX8MPlus EVK board (DT)

Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
Cc: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 Check return value of cpufreq_dev

V3:
 Per Marco, drop remove function, use devm_add_action and update the patch
 title accordingly.

V2:
 Add err check when create the cpufreq platform device
 https://lore.kernel.org/all/20241217015826.1374497-1-peng.fan@oss.nxp.com/

 drivers/soc/imx/soc-imx8m.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 8ac7658e3d52..c65bcc6a1266 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -192,9 +192,20 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
 	devm_kasprintf((dev), GFP_KERNEL, "%d.%d", ((soc_rev) >> 4) & 0xf, (soc_rev) & 0xf) : \
 	"unknown"
 
+static void imx8m_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
+static void imx8m_unregister_cpufreq(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int imx8m_soc_probe(struct platform_device *pdev)
 {
 	struct soc_device_attribute *soc_dev_attr;
+	struct platform_device *cpufreq_dev;
 	const struct imx8_soc_data *data;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *id;
@@ -239,11 +250,22 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
+	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
+	if (ret)
+		return ret;
+
 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
 		soc_dev_attr->revision);
 
-	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
-		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
+		cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+		if (IS_ERR(cpufreq_dev))
+			return dev_err_probe(dev, PTR_ERR(cpufreq_dev),
+					     "Failed to register imx-cpufreq-dev device\n");
+		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.1


