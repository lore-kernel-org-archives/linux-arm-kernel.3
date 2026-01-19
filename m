Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EE4CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZMeDNNHMqiqlSi4KKdzEPGcU7PFbahbieYZKJ1eG9o=; b=uSLtkJlGy103dnYTomJLCsPLv4
	DPvhCJU7miWI3SR6KhoT/7GFA5ZIMgpkH3FqvRBNNcyMgZXbocjr1nZVc5btSKdaZciu8Q3zm+2lk
	MLoKpehCkoPtiNOBndk+0MnIp8Rtnxor5XgB9TC5X29gqloYxCmlQqT9817yIqmXgWK/Bffv/3tGs
	8+p8GqJmXUYHcm3MQvUOJWBXkFiYFXgHgL0y64QsC5ms748E7G/q41yw5+PmFqo/GmVuvJw6D1ZI2
	2D0Sv7qaH5DOtW9ALh9LnBm7eku5gspNC57SKkRcZ0Dozdz7PfyVps8g5fT7t86REhQMgb3verrJw
	q8W5q69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiyU-00000001QBf-3ErE;
	Mon, 19 Jan 2026 06:42:54 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiyR-00000001QAm-1bXi;
	Mon, 19 Jan 2026 06:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V90SVL500NTYvfVSd1J4a9k6JBStPdCrNEZlozdCQ0jdHsVMtJ8XQtq3pdSsdIt7nLSaEgPJoLmEVf/XUILmD8ZZX0cqgARe5PwY0hG6m3yggRIHoa3fxPyNu/UweOILAmRfBrOupyTica66ahfcQ7hIiTAe8Oc1bjrJsBoujfuXEG1Yuj1B8EJ9IGxlAd2lwZMlBbTzTqH2cDDiUJ1X9cd4XMW4MJosr5Y5ZlqzTJdZkKfhdBzDf2dGjFzjEaOkdqGj0b6mDrnXcXHbhKl/Ttu7JFjTSptvYONZAOTthBUEu84ojn0M0p46Iajpbvm2CddWCofQtwBEvjIGhhbqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZMeDNNHMqiqlSi4KKdzEPGcU7PFbahbieYZKJ1eG9o=;
 b=Lho3suae142bB4U5yrvuClFM20VPkKLeHgBQkf6iGGIfpAhmzWEGci5zJ0XLxw1NubfixTQrfk31PjW5TkknmGQOLima3MI9yxtgyCVZrjV/x9GP7Xup4yvWiTXEX4h2il2l8e2TSD9BzsgdpYm0aClw21YgKMBluImnLgZa6cRRUhnatKygZ3RKuzEYnTRZIUOcKQYdDkPwh2dZ4vQ+S8CRBcnG6CZqe0Hqpr5UlEfPp4F5uusRW6c+XRb+1b9F+Ps1GYLAcwASOlY1MbWUPp9+zldAvy8QhOSeG/GFpNDnRurnlE4nnpkuDAOgca8tpNLssHCX7EZ5YK5baaupCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZMeDNNHMqiqlSi4KKdzEPGcU7PFbahbieYZKJ1eG9o=;
 b=BdTjPgsvgooUUSszlAcimQZPB0pm+vY/q3rpykVgOIjzzZm9J9KelE0YZ/rBYnW1IRaBTPpucnkJrIpk9bno50oGRGtx0R2TW0zmHoa9emGNdQpzEREoWfylVSnZ0Rw6l501h94ReLrcB04PKMF3zoQ5MhHdHImKzxJklpbgup17cbTxN7gEoBj1Fv5/aezu2sUpQn6VUJ5qVqA1IGDjoGx35jJHbWyhqdCVuuffFBD65qPDvTLNbJ3O2Gpt5gIcd3XfacN14tWONYEvYKG44a+n8JRXOM4yl8jnIGNTEL8RZrgiCmKn3j2hDbFEzcl7adJWB9SvEVAJ4LJW8T91uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS5PR04MB9922.eurprd04.prod.outlook.com (2603:10a6:20b:67c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 06:42:47 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:42:47 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v1 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Mon, 19 Jan 2026 15:41:15 +0900
Message-Id: <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|AS5PR04MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 10db1857-ed4c-4c3a-e9aa-08de5725f525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E5Sj+8sEqUb4yX/1d9sBm7XegF8PewSBKeBOiipuj00B4W42Xr0KQLPZ/fot?=
 =?us-ascii?Q?2TnxXDfRrxa+SLGKT1bLqzJl1XmNIv2+X2LyTaMPovQ+uxndOM4AZtWbYUe8?=
 =?us-ascii?Q?bGdYcm7aoHkhHscMWT6WElvCk4J789qbQSbzxGCxvpHk2yvB6jftJYg/ugR+?=
 =?us-ascii?Q?NsDl+avMzRSKppXrK2hmVQoaAbV6Fmvu3VSfA2kD3ZBbDZEfHgGFw0BHqrKr?=
 =?us-ascii?Q?YexT8FvTC9hw0tRJETO2U++HbIJw1AEFizwSF7e6GeKW2ZchtWqC8uZbI1Pc?=
 =?us-ascii?Q?UKOy1c0KJwPTXvIRM0zbdfkqildNJmkG9p0IoSFXQgo8qR1h6LAqtL179FEs?=
 =?us-ascii?Q?DVf5ptGeCbqKGQ9KC6bassRjAmSJ08jUwWmCo2itosEHNSdiEP1s5Qp06a/K?=
 =?us-ascii?Q?Demfk0cvv5cfsrHD6KZqsLpsKMhnUlpkPaz7Q8RNQ3ne5ephCVuQN5B5Wf4j?=
 =?us-ascii?Q?Xh8gsIgBOEu4/9Hazgv3QSuaPlh1C48RUIJA7HBICMhGYiaAiehNMpPQ9VMW?=
 =?us-ascii?Q?HxUY/iYx7b8SVZvymW+I/cYuHTfMeG54c8IUkplzzb/mMFDRm8FYII087gis?=
 =?us-ascii?Q?g1sLAQafJaBoWRna48zEJ5p0o9fqG3JfCb7OHB6SPRk2OtLzU+rjmoog6/lX?=
 =?us-ascii?Q?R4TUa4d9Qf0AWi0NYNsXKV3+RbH+TRw0E6vHHsHy92WWORfD1YJ0Zkln/G7Q?=
 =?us-ascii?Q?DKmQUoh+qDRHVSWfw1bbGVdk2UDAl7QMu2ORLwz7iEgdWWzi4XUwEsK18n1J?=
 =?us-ascii?Q?gX5F3Siq4vQKenVuSGsc7/+w1WZvaNJgRX7+VVXnRVF8h/oqcsCWz7auUWR7?=
 =?us-ascii?Q?hwge7HPkhJWjg3bbQCrN5iL99NnwGqxyFqPiEcGJlSeIVQpq5yTVjemYad6N?=
 =?us-ascii?Q?/YhDZ8OJiqkjTaMhKRbu4A4RlnOzkQGkAuN97IU6CrfTfKx8dbwxejWxYOzJ?=
 =?us-ascii?Q?iqBaPPSvQFy5LCmOeZVHLJACLluy64vTT5o/yEzDRMXrzexG5dMt6uCVcWm5?=
 =?us-ascii?Q?2CrTUvUC5JsUZv09aDh7IENJysJLGBbB5h+DZ8udThQbfqxGOIt02qWDfoyy?=
 =?us-ascii?Q?lv5Sd8cVH7HBND8Ub8bjSSAuq/uKFYiytrhAwPtnkswmg9AbfGD0Nm4IcKm8?=
 =?us-ascii?Q?i2hHoTJIC18zVe3id822bvc9miLVCSb6bOZTCAS0f2mlX93l9OIlP9EGDUtL?=
 =?us-ascii?Q?vTXB69Y2yfV7JnG9EHbjl7avmQB7ILnfMMc0BWHz2bTPT4w4dM34dYMkV9T/?=
 =?us-ascii?Q?f05PKZIH1U655lxt0fP/2u8qO2XcRKB1FXpg3sMA5MQ+PC8RN6+IaqTjUAfu?=
 =?us-ascii?Q?TyEYxZ8sjFvsgHP9o/ACbeZcWwTz6Fnu1mHEetGrtQl16lZjr2QIw+uq97m+?=
 =?us-ascii?Q?jFm+YY2ombwKJv/opEpXv+w7bQyKChu3VZtbd642ZVRbvlfZw3fnTrr9Tb91?=
 =?us-ascii?Q?XVWPdJNqYaM1CnYAk4HJLo+QTAxbi0HRolzAplalGRu63qxZLY9W7aVLRR2u?=
 =?us-ascii?Q?9BcC0LK1+qeBo9lzJYrUBIvMk+7L7ZmFW/w0QZSDIROhc767EAkJYO8fi/jr?=
 =?us-ascii?Q?Rf0TjfSIMsCinXzbd943QQqkDTwmxm8EDYOTMVro86h2eg7/Pm/FOTdO1m7L?=
 =?us-ascii?Q?xw6nVzdJ6T12D5bfaE595a0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PSsNqjjmLhJHUuwyuU5rPLP4lcqNzRFoYDFvdXnSjLGG+dfkGwSXNC4OohWy?=
 =?us-ascii?Q?Bf/Sdp/VSW9BWRGQBV6OP0rXdJF2elxG3hr3QfsZESJI/cxnJYWa05UB22Li?=
 =?us-ascii?Q?3fR/+3ajTYFev6hCfbQNnSH3MDI/kWaoUgOEKmWfFPxJirGXxqSIQF41t2qL?=
 =?us-ascii?Q?u6Z4WO/c1JtCFoTfqnJTQgFhYXybgqlE4XFXRGn9Tk/7j50udzcG8lHH9xDF?=
 =?us-ascii?Q?ZNj3olm4tOwKzSjInAKEkpFv4B6OPpyYaPfWbSCGliRDz9hQghYWNU86rebM?=
 =?us-ascii?Q?tfAyrwczsBlqODNTVfMmYitjm6bS7aB9pp1PeNXYoeHZS3E58kF8R4dCtXYN?=
 =?us-ascii?Q?QbR6eGbwgJEK2vD8LL1qiKPiJzUkevfrbCz+B6WbjoV+4EH7IIa6qN+4jZ9H?=
 =?us-ascii?Q?zh+pAOIbOpyUsztdIsFIN6Cw+mVDMRA0NxSGtpPVQJuxxLiVGNqhIm/e1RV7?=
 =?us-ascii?Q?+5gxuyQvCCsmN7hOyxpFttKHYhviQvKGu/2hBEoH4PbQmbHTZzgtaWefY3y3?=
 =?us-ascii?Q?vyKqoIrTsFiZSWte9F5INJvF8+frEF2ghKfLjfjHj8UDr9y6IqHqHhdRD/52?=
 =?us-ascii?Q?ocfQIs6pewrTum8fCWmHSAwLCDs3AdfU9u1DjMxp9iWt0lJxGBCxihNtIQYM?=
 =?us-ascii?Q?nCbEtoM0zd9hIQPBLlu0Tj8Cu4cgmfwu8cqtVOFndQw6lSNjNTV32VLZjyGv?=
 =?us-ascii?Q?GODLZ2KRFYgdMOictmhVZlc18Fpu7mjmGhQ6YtPolNPltKBgLeRLAxRC52/w?=
 =?us-ascii?Q?pe3FRmHuYjEZwnMN6KEo5bwHSORGXWgRmxePSfUsJRY3qmsbWFrrk33VTFLD?=
 =?us-ascii?Q?UMjL8jEAGuC4ChEP47N4VnEXd+R/qwqKP0rD02eBDFVrk80aziW1auIg5Umb?=
 =?us-ascii?Q?vnFfGCaR9Zfp9RfwBENHbodY2WoFoK5C3dIZXl31fjmIX1d7w3Z4WswzITOx?=
 =?us-ascii?Q?KLOpEyJWGyvIOFv5R4HL82y3SsdyG5I2LdQBOVpMWT1xiGA4CtIHn9WuD0ZK?=
 =?us-ascii?Q?Iqkei1qGMWbdESRlBJIeFd/77nG7V+FAEH1K7njQniRoyT+fP7l+kpIQYdYM?=
 =?us-ascii?Q?DYOrz6gBFlOHMNvTfaRgkxrdjRhFDktCJNAtyaOK3B1N8KyH00RgHJgO7LhF?=
 =?us-ascii?Q?55R1En9wpaYBIkOo4Av4f0/7J6YVexzlaQxCzKaiN8fa6GoVOBMtddjKBTeI?=
 =?us-ascii?Q?SVc8Nh9Ybl2fZee+LboEIRDxfcG4mkfzx4EhQj/3ISf6RIzGApNRjbOnwZOt?=
 =?us-ascii?Q?h6YpLe9HseyXLKw95Fmhmnu+qzLDSwtQzc/YS+9bZru0aCpy6hV4QAY4ijzZ?=
 =?us-ascii?Q?gm0sBUyxCnckTSOAp8//s6QWt6yFbebK48a0eBEXoZwTfYApfchr4WYa+oog?=
 =?us-ascii?Q?Co3ZOFPg5OpXl9q2BTRK07f4f7htNpNIEyfIJ8y1JxiOyUzQzBe/GLVaUiV5?=
 =?us-ascii?Q?+L/GhvbZ746NfBXNMEFQCKZSocVh1GHN/oC5J5h4o2LwxAk1tBggF6B32oyq?=
 =?us-ascii?Q?RA4PPBsuiF2Mm4AY0ZsPO7Aubzn+cJEFJw70539UTOQeByoOOirbPu1ZcESc?=
 =?us-ascii?Q?bpA8q4EUNCdq0abyo8Gf45eDgczT4nMq49jOKUG8B3j7AWetMHTjnqVg+K73?=
 =?us-ascii?Q?UUsSo1/Z8qs9JInuEA6gC/3xeScxODLrRTPJ8cbvY+OQdaqaMbmcVxMwndCi?=
 =?us-ascii?Q?tJe4igynaNWlXQG6UkXEReHVWesXVHuRu9kwMbXwwsIZCAboaAFTe41z4rFT?=
 =?us-ascii?Q?SQgi9CzhZw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10db1857-ed4c-4c3a-e9aa-08de5725f525
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:42:47.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR0fJAU6zpeB5HVJlr8tplVia9dCLGU5w5OcsF0XJktYMVLf0MffIPgK16hKdK7ZRy0x4qLc/EDPoiJVILfQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_224252_307738_06098818 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index 9de751531831..95b591c8aa4a 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned int bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.34.1


