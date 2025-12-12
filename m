Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E95DD59D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8udEo6Xkh34ZxGTrmyE9iZLaVOZ9lAp48CVXU4Dgts=; b=2UIy7MW1cPQRF0mRoyj6ecE9QA
	RAHhXEhzrVA6sXHoQKPH5RixG6gpCJhmQGOWBItSqJBxjkKJ4vu+ZC/jY19DtNv9BU8htD9yYZM+i
	hb0eKb0ZWQuKn+v0VS4O/pplYXUSLYMGakf5nMORtLswfSieHkazTU0smPsG3yTF5wpFMJ95RXW4Q
	XBPu74kTu2jpvJ09U35UkE/17sUmfRGL7BWCLosjXQVjqHnGkkYp4+QDPR8pSmhCe219VgHqy1nnh
	7TBgXNOkEpc2PRZL8wz8TszSU5DypNOBnherM/rJW1lO4Pcb/zVi73zm44AvjRvjHUIqZOzPMcyQP
	OGh+Zsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU94f-000000010JI-0rLB;
	Fri, 12 Dec 2025 19:45:09 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU94c-000000010He-0rR0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfhGjwAqFQz8dNeo3Pycz3asmtRT/Max3zfQrgQWojKtj9vMrZf8IkgDsepf9nELudyXNvlS3mRegeLyeZ+rE+ZwyQNUwacQTqaVUZF53s9sXCFu/M7A45Xqx73S1ixxxv8z7LteFtv2DYaoK8sv/1HyA+UVIJ85Zdwgz8i+ijAhdKWydT2hWlcY0D+8kcHg8BnQ5nMduYnYsSTlb7+y5XtzV0IXBDY0iSApXGY1mYI29TfbHlCWj8Vt1N2PZI5Dwk50g6bJObUDm4o7jXN8Ns/EAJIkX4ZbM5S7qXAwo79vsJiO2IWGwY3oOfNrYs0XX3wz66rQ1KYa3nQEeALU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8udEo6Xkh34ZxGTrmyE9iZLaVOZ9lAp48CVXU4Dgts=;
 b=NULJCEnXmZpncUR66jeC7dG/20maXSUmEuSk53XQSBdYQEiTvYnlPwv2T73y5F1zEDEVEyGD2eVdaQVFFQc9O7VfGuY6bv602kaJ/9Em+KSDyp5gSHrDbRfmIEwO+W0+vVekqpQ6rFGhuD6jo3cxqpsnz1Io+8cmqcgLxUBy1CLNsQevNSfcCE9C/p7t7P8ncu39tToEdk68/OQJPhgabtdwIUl8Gv7zAfes9pcoDE60LUXXEYMeCd44VNi25ka13EexfWyyBKgF4iNH7s0ZJHh7SyrmTcK8uuaH0TSJ7dulqTOgYoAmxdF0q5JsVhdCWcDs6N5RS5vVpmp6G5/RUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8udEo6Xkh34ZxGTrmyE9iZLaVOZ9lAp48CVXU4Dgts=;
 b=Go+DT5SpJ6RMf7FI0pAGoeJrC3pFVgP1ALhfr8K12cva4hGXvq4g8gcHHGRnVjLU2xvyGJsNjo1H5OF5IQfzb/v5VfDCD3uFWdxUyr2XCf08SPAC0VBl0vjz0z9v/e5dX+bFrvPubj/AuBOS9+HNZnY4ZHnDpt23vrpefnpCGw71Gmg5oboRE2PBTAusvBdqYYAcartKHluWqBG8VXCiASpCRxSSjQJmqxxrI7fx0WJV4sm4O58zduzGviCdAVS7WnyLZ6zLO/WwcqvjbnPvas5A5tSFihGdXtw/fxR9JhLYAgZxSVri98QoSoGY4hokYaMWq9oOsxdQL1qaffrrow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:45:03 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:45:02 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Fri, 12 Dec 2025 13:43:38 -0600
Message-ID: <20251212194341.966387-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec9fe3d-4ed0-4b11-4428-08de39b6f0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MEdZDtU1o7sPNOVeOfVf7iHDefeVujMl6LwbncV5CtgaG6Mc6gyhUBLRbC9W?=
 =?us-ascii?Q?EfpkLqQbxOwTiTGdQ4CzGH6XFzX5gfDcFs4L8lfEco4ny8ipl+mKDseusL7e?=
 =?us-ascii?Q?G8V0UYNK8Lqwv4ssnQei5snt1Oq5C9atnK+mR8/SS8lF1XXTEtK5pJsFJWiO?=
 =?us-ascii?Q?Pu1gLXSDB/reQtj9iBirAnKe7HfvBVy5USuns7yTWtx+SBmhMJozox70id0L?=
 =?us-ascii?Q?e7FJPWD+a1/sh0ZJzL1TiIbzRNTpmZDSwK6kj7PmTB2m95DLgkYiEYUHPeAA?=
 =?us-ascii?Q?QLDmE/nNRcyDs31wdBUmUn442rh5DjYtlDoSRSYlsX/Hr4COtL6PgcDzm/EA?=
 =?us-ascii?Q?gWq8Ur/4/s6wE3gYBiX0GirAPlm+Hwgf0xSAYSLCITQVyPYY7sbqDuzrlrEt?=
 =?us-ascii?Q?naD5EyVo6Bsh8rVVWhPQvOU8Y+WdCszs3mvSM0ai0Ld+/oJEbO46oaEI6eHo?=
 =?us-ascii?Q?Uh8oHSQ0NA4avJbVMJ7w9350BCIc13X3reMAn3LuNM8Bkse7XcFWRnnwJUkw?=
 =?us-ascii?Q?tJTnGXIH9CnV12P0cfd5Hh0ELTw8/Qde1M+m73piXwnggor6uYqc5GQVXBDt?=
 =?us-ascii?Q?iOqcUTmGVj9yXmhp8sikEWfx6QGx3kdjuDy5Hq94cwsrAwHK6fZLfO+4/yvB?=
 =?us-ascii?Q?n6K19Xbc3UhKsNvACpZGZnniTNDY9dPt5EW9X1csw0jDdG2et+2XtgQ/0xAp?=
 =?us-ascii?Q?xhwjlhTB9L2VvTD9NIasRVN7X/EDcLpATa0ZtuJnrEqX9urbBJ2NX/wTG2Hh?=
 =?us-ascii?Q?5W+q1OaVW1I9DrVebM1VEHHDjnAHgURm5J5o63UYr3fd7Xj3oHKRpRf/cO9T?=
 =?us-ascii?Q?PgymnNnMgT//KVoLSuHqe94ImUCAEd6uyvMFLz7TIsNLZUFZ311YtJr0QQCW?=
 =?us-ascii?Q?h344dI8n5FdxzpaNKzB0StZBvQcYSAQ7Wn6J+BRdb2EgxojyiEhwYUCm0VZ1?=
 =?us-ascii?Q?ccvmn7G7pYbgx0MY9rjMHwYt7kSxFIXaex4bYn4ZZIqkEXnK9go7z3H9JalS?=
 =?us-ascii?Q?jHPjlCqhkPPKwB7ZZ8qnALp8MKuOdp7j+B0ehP/tUGCCifyQ2+QkyrTgh7EM?=
 =?us-ascii?Q?XJUQK4uoSVOiaWy0JYfCMauCWJsbX2rHmRgzjXcOuF2EQbNiLjpn0KDhYrgA?=
 =?us-ascii?Q?qEiRMTH16jQVUUqLY7FPuG3QDZs4y2AAZaofHweZyBsaiU4uhF8m29U+8Nq6?=
 =?us-ascii?Q?CKNEMjx1bZycfuE9x4wa5KmrBPMDTjb886ifTA5wN0CUdxhGC158aWvvR2JW?=
 =?us-ascii?Q?hr0rwMaj7QHP1S5WmLqyGL48KAeY5NPJRkqb7oPIw3Pr6hMVHYebz/2ksAiz?=
 =?us-ascii?Q?U4WNrImJblaZT803/tBX9lHE4Xdmn9rOxyw43MYQvIp7In9M77/JMKTJBhRA?=
 =?us-ascii?Q?tUI6FzuogIdOgNIMI5/NRzv+oxsxmu60kQVe0sfkN+TvDg7i15J4ukb/Ba5r?=
 =?us-ascii?Q?PBnJA3IZx46oW3rxT/cG5B9HvjPK1UXKxTRytCx9MHpAECa0rGZYHLfkCIgs?=
 =?us-ascii?Q?vQq3f9FX+gPHOzDZaucMCicUvUI8XaDY3gXqP4T7ubu0Yi2ErFRL1M8hdQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FdXLrK2xdyCwXDoLDWa92iN70j171PJv706oZrIDUEpuD6lJtnUPCcWFVQi?=
 =?us-ascii?Q?OV9IkUecy3xsdqFRlRvRQBRl5VidVlXPFeaTadXSZrB4mfxmoT4F6AZ/d1kG?=
 =?us-ascii?Q?4dgH/AbgXhAf4dW4XcddksMDLlVTjIVP36YwXnRtVnSuSRjGs6MDDvDdjifH?=
 =?us-ascii?Q?/2nAQ0Qk00TLH+nmfkeBF8MDrAZmeui2XOfO2tcTW3sl4/Kr8hhElHDg0iza?=
 =?us-ascii?Q?43Kw9nMWDuBnPzoQEfQxWGKClgw6a+T4PPm+wD+nMuugYwx4+jQGIdMFwg5d?=
 =?us-ascii?Q?HUCrN45VpQTpXYaKARNl8a5YIzsm85utqno38fiDhoBfuu2XvS5+zLaXzy6g?=
 =?us-ascii?Q?l/K/W0SztPmdlruduiOTzBzW0oXBtNj90FniNVRhFIzVd6NmNDuH6fbL/Shr?=
 =?us-ascii?Q?YImf2oux2Xa4rLOIq5cWwHmpDTl9lAMazv0YC8cRlYjELg1wP2Mj+mCccwbH?=
 =?us-ascii?Q?zcS43uHVIsxLEDy/o45yjmOklpG9jgueZqo7GDSBNsGh3kpr7/MKLQMUAwim?=
 =?us-ascii?Q?tOT3OO0TkGcagVignYTOAcWJK4Sk+pVZepN5q1D7M8yaVxxVQShzhIe2wb+7?=
 =?us-ascii?Q?WAIkFA9wfKYKcxVSpgPjomnNXq07R+0asXdzSlbLars8OUo/+zw8+XrlNeh5?=
 =?us-ascii?Q?9+6VhzYXAe512qlmvT7bla2Ukykqheyo7jpK3ZyntKgjwNOTyodO7NGygE9m?=
 =?us-ascii?Q?JjJ5JvyijwB7T9HD6LbDuzRWVWOzz/PF7f7IdX4LRPkEv72eagjzUK3yPBk2?=
 =?us-ascii?Q?KHSygswuaVP/4cZBOlU0/tN3kK3Ned7LovkjyfFM/jNbt+08dlGirO9OFqaq?=
 =?us-ascii?Q?GZLqey7xKeQWbwX0bVkudjOVHfDvwwRqn75oFmmqSnL9mQEXjAed4YGb5rGl?=
 =?us-ascii?Q?ATZ1DpJPVRkQXaHE/cDTjucYTszhkrullrzmCBAnPxx7VKQtT8vyqStOFx1P?=
 =?us-ascii?Q?8fo1rk2xlUebRq/kg30NHW+R2mtpUArfRZ9IHFoc/8E7pYe0+9wvOCMxToWV?=
 =?us-ascii?Q?XyaDAObpqsXbUas5c9MzixLtqS1niBMOBPw2F3Jo+scZftzlc63BfwXb/SxY?=
 =?us-ascii?Q?SXRStj57b7wJN7xRy5pzTz6hzOvxlX5L6+ND8R2R3OvCLIcQ/ZMBIuyYRO2H?=
 =?us-ascii?Q?EVehuIZNa5E3GkjigfbYn7x+N1YGcCYk99GLmI2A947CML8aUfdqwlDzWYBc?=
 =?us-ascii?Q?bKJp03kXG5cXPPM92YpxUvJ7i7THa8AB1rXu3cn7Su4wYgh7/Kdvm2HPGykE?=
 =?us-ascii?Q?nKw6vYf68AsMmIWv6LnZbuDfrVwQ0BEzYJDbD5vNQaPU8wez935RIfa/0hXk?=
 =?us-ascii?Q?2tJX+cqYGOdX65LsisFAqlE9JjBm5uoQbSobu+/QuTS9N4dqDfFXhKz8uXkG?=
 =?us-ascii?Q?3U/UgdE6SkBDPAW9OZJtWPzI/TSsoZwbpMHaKWSXlK8h7VpHmLklzPvwlUDI?=
 =?us-ascii?Q?tX/ojZL6LronjpFeQIHv09uEX2bfWrTSEwU1aKP53PqbqaUwpaMb+Oup91ED?=
 =?us-ascii?Q?vxR9gMHKRWpd9NJ14GUNrnh8Syz0nTrgHK3uw0+xqqsoa39Nu017d9fmwp7C?=
 =?us-ascii?Q?Bos0+d7mye12QAbz93zvSrfJ02YQTx6XgPtaMdns?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec9fe3d-4ed0-4b11-4428-08de39b6f0d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:45:02.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQSVZ7q7JohlVsTyMHkHNBUlu37epBiYQE93vugeAlYpgkHUOD+rzv8357X+sqX0meo+sLW0cnXh/mErgNimUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_114506_409833_8B21D5EA 
X-CRM114-Status: GOOD (  23.57  )
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

Register the RPMsg channel driver and populate remote devices defined
under the "rpmsg" subnode upon receiving their notification messages.

The following illustrates the expected DTS layout structure:

	cm33: remoteproc-cm33 {
		compatible = "fsl,imx8ulp-cm33";

		rpmsg {
			rpmsg-io-channel {
				gpio@0 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <0>;
				};

				gpio@1 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <1>;
				};

				...
			};

			...
		};
	};

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/remoteproc/imx_rproc.c   | 143 +++++++++++++++++++++++++++++++
 include/linux/rpmsg/rpdev_info.h |  33 +++++++
 2 files changed, 176 insertions(+)
 create mode 100644 include/linux/rpmsg/rpdev_info.h

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 33f21ab24c92..65ee16fd66d1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -15,6 +15,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -22,6 +24,8 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/rpdev_info.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -1016,6 +1020,141 @@ static void imx_rproc_destroy_workqueue(void *data)
 	destroy_workqueue(workqueue);
 }
 
+struct imx_rpmsg_driver {
+	struct rpmsg_driver rpdrv;
+	const char *compat;
+	void *driver_data;
+};
+
+static const char *channel_device_map[][2] = {
+	{"rpmsg-io-channel", "rpmsg-gpio"},
+};
+
+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
+				 int len, void *priv, u32 src)
+{
+	struct rpdev_platform_info *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && drvdata->rx_callback)
+		return drvdata->rx_callback(rpdev, data, len, priv, src);
+
+	return 0;
+}
+
+static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
+{
+	of_platform_depopulate(&rpdev->dev);
+}
+
+static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
+{
+	struct rpdev_platform_info *drvdata;
+	struct imx_rpmsg_driver *imx_rpdrv;
+	struct device *dev = &rpdev->dev;
+	struct of_dev_auxdata *auxdata;
+	struct rpmsg_driver *rpdrv;
+
+	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
+	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
+
+	if (!imx_rpdrv->driver_data)
+		return -EINVAL;
+
+	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
+	if (!auxdata)
+		return -ENOMEM;
+
+	drvdata->rpdev = rpdev;
+	auxdata[0].compatible = devm_kstrdup(dev, imx_rpdrv->compat, GFP_KERNEL);
+	auxdata[0].platform_data = drvdata;
+	dev_set_drvdata(dev, drvdata);
+
+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
+
+	return 0;
+}
+
+static const char *imx_of_rpmsg_is_in_map(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
+		if (strcmp(name, channel_device_map[i][0]) == 0)
+			return channel_device_map[i][1];
+	}
+
+	return NULL;
+}
+
+static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
+					  struct device *dev,
+					  const char *name,
+					  const char *compat)
+{
+	struct rpdev_platform_info *driver_data;
+	struct imx_rpmsg_driver *rp_driver;
+	struct rpmsg_device_id *rpdev_id;
+
+	/* rpmsg_device_id is a NULL terminated array */
+	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
+	if (!rpdev_id)
+		return -ENOMEM;
+
+	strscpy(rpdev_id[0].name, name, RPMSG_NAME_SIZE);
+
+	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
+	if (!rp_driver)
+		return -ENOMEM;
+
+	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	driver_data->rproc_name = dev->of_node->name;
+	driver_data->channel_node = channel;
+
+	rp_driver->rpdrv.drv.name = name;
+	rp_driver->rpdrv.id_table = rpdev_id;
+	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
+	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
+	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
+	rp_driver->driver_data = driver_data;
+	rp_driver->compat = compat;
+
+	register_rpmsg_driver(&rp_driver->rpdrv);
+
+	return 0;
+}
+
+static int rproc_of_rpmsg_node_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const char *compat;
+	int ret;
+
+	struct device_node *np __free(device_node) = of_get_child_by_name(dev->of_node, "rpmsg");
+	if (!np)
+		return 0;
+
+	for_each_child_of_node_scoped(np, child) {
+		compat = imx_of_rpmsg_is_in_map(child->name);
+		if (!compat)
+			ret = of_platform_default_populate(child, NULL, dev);
+		else
+			ret = imx_of_rpmsg_register_rpdriver(child, dev, child->name, compat);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1114,6 +1253,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_pm;
 	}
 
+	ret = rproc_of_rpmsg_node_init(pdev);
+	if (ret < 0)
+		dev_info(dev, "populating 'rpmsg' node failed\n");
+
 	return 0;
 
 err_put_pm:
diff --git a/include/linux/rpmsg/rpdev_info.h b/include/linux/rpmsg/rpdev_info.h
new file mode 100644
index 000000000000..13e020cd028b
--- /dev/null
+++ b/include/linux/rpmsg/rpdev_info.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025 NXP */
+
+/*
+ * @file linux/rpdev_info.h
+ *
+ * @brief Global header file for RPDEV Info
+ *
+ * @ingroup RPMSG
+ */
+#ifndef __LINUX_RPDEV_INFO_H__
+#define __LINUX_RPDEV_INFO_H__
+
+#define MAX_DEV_PER_CHANNEL    10
+
+/**
+ * rpdev_platform_info - store the platform information of rpdev
+ * @rproc_name: the name of the remote proc.
+ * @rpdev: rpmsg channel device
+ * @device_node: pointer to the device node of the rpdev.
+ * @rx_callback: rx callback handler of the rpdev.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_platform_info {
+	const char *rproc_name;
+	struct rpmsg_device *rpdev;
+	struct device_node *channel_node;
+	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
+			   int len, void *priv, u32 src);
+	void *channel_devices[MAX_DEV_PER_CHANNEL];
+};
+
+#endif /* __LINUX_RPDEV_INFO_H__ */
-- 
2.43.0


