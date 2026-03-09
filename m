Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EECF417E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pesQ0Nfl+St34ySlm+jyFNt6haTmjgcoYngjwoH1BBw=; b=Yo5awXSXSQFdXOkTI+DbiMov/+
	WPj782eC1NVNObSFYgiO6fodOrmbZyawTJtcA0RxmbCRPvuIdfwA6hK5031/fNMnKNixOF7SGrTQQ
	LpMs04T2VaH4ccKDbHK7xQu824I9jz9R3nicgQRRP83hp4sSkchqj506h91PB2ZBT8SFQc+X2rT4d
	w/jrVF33Z1cZFHUykh3mjr9MCZ6pdoiqfqoVJ9UMnDY8ec/BXlBNODj9dT2mRIQYs2eizPzMI/l36
	2b+4g2XDsrSWpgGihtDo6xgeI54ZElT2hJxnZYrziqFEW51C1qcDqJ5TfCXh0kPLPMrIc1hcECBKf
	ozufEWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbgl-00000007TXb-1URt;
	Mon, 09 Mar 2026 14:34:31 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbgi-00000007TRg-2B45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDDCSggZ+fhkbpPebKtxm/3y45jutw8+6J38NT7Y5Nm2Hq1VAYrBAa01ms0H32tVM42K/+ZEVffIuGYDQoFeCvQDS4rWoMo9/SF+TBVUCT8KxOE8uOsvHEQAK2F9c4BzgPar/fJMMkN9zJ8xwlxwM8Mwl39WStJLbzxhLSh8h/0eX/2QldHNwWLbWr9lc2mlr/oalqZhg19eaWBS4FJoVLtjWdOCFNg3m9Wsf3joA9KZHvvDrwiiNG07m9HUce81urjJjcOTYaJl5km32WONkUOBKWv5u4rV7u6XpZLbzBtU0ZB7lDtNdGQKmxidTxszt84Fv8LEE+FfbYOI/spnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pesQ0Nfl+St34ySlm+jyFNt6haTmjgcoYngjwoH1BBw=;
 b=CPxguob7hXWfhTZ4yJz+MCuOY1jlhHnDwzQdHNwWBRJH3gk/l03zm19y0P7bTlA12hFnHufcp2BUUfPqxHXA8Ef1m/Q/wFRBTpUWbbyOuWT3W0mPC89WaJrM6IuaxJsDgMsDuX2PQ4wWbEElD6frI0i7tURuL1pyB17J+Yw2Ea6bEZvhnp0t0lt/sN3OR2hI3Wvc2XUiJy2pqWeA7ObbFmbs5KnoyjXEFHDoSPwhsqE3RZqGQ+Gbx/uPdu/v/ZuPn1BTNtbJ/pZgzfS+/4y9cb91qyanpQo0dlwchTJ77CoYcxx+2NrASUUSi1mbBaU+Bo1FvKVwzjEi8YXikTJkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pesQ0Nfl+St34ySlm+jyFNt6haTmjgcoYngjwoH1BBw=;
 b=LX8NOBKfg6kJ/PqRFwrJ3z+As0UKnYoBmgRMjORNv0uDFvt9Px/z0hRtkA+kEBynQLjteVANPONM++JOvRYy68DcNIIgTBhlkDvmQldeNqin5lDCxzNoK3YZTalZ9KaakRF/wuXINp2b95pNLnrfZYry0dFQXvFRfiPuSWN/cFmHMceAYvNhaInbIX/hiUkF2bfsflhawfGkwwtl77jczEze8+6kMNsrJoHfXxk+DocPwJQtG1pWo1aocawzIw30Eye50jcgTiQnUXj07boxP5U+i5eRTTfU1RPREMw6RF20CAuo72UkKmxgLphBB2HG7dUcINVvx55STtL3liRXFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9156.eurprd04.prod.outlook.com (2603:10a6:102:22f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:34:19 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 14:34:15 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v5 4/7] mmc: sdhci-esdhc-imx: add NXP S32N79 support
Date: Mon,  9 Mar 2026 15:34:08 +0100
Message-ID: <20260309143411.8231-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
References: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: adc9371e-354a-4836-b1d0-08de7de8f099
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: TTZRj6ux+z22W1zDApcjjw92QvJrZKDMVrJG3vXrNkKS5J0bE1oDAueTNqoIP3y7CzMR0ubc99T7Lt6zWQFMaYPGB6eIRwQYj0M+gB21ct02GiiNNuKESaUNECQWowukHAq9K6D9A55zathS+Bo06hbEfMKcj3Udp7XnHe4XiIIlGqIar1gpfi/iPaYBcc5WfHkCRgbZgYKUd1V0ANgOSqFqMha2rN38iWaiKagDgacmBH388c0eV3lh+zgtXYb30Y8TAbEVpvVVe2Ba9nzMwpcEtvnbo9K8zxc2mDlhu906mO7UfhcHxTLy5KsiRotDC/P7/Uy0VE/xmFtBjM2U/Hp+NDEh4y7qOgs+oUhL5sDEzHx72k598vOKj4Q7hm5tR1vYWmM+af/PTZDubjXq5NkYPXr28s7zr0wEhCZqaeQz14D9BP5sVa2BnLWT0k+Sq4wWL+1n6WDOz4RgIq4aHHC1UHeUBz+80rX6bFHrLKXANHo3S1yzIoDlKXJtDSPKcsJCHunDMdsMfHOaarVD7aaoFQMkDySZYSanB39XHLYJqInpE3lotIUTyu4vG+uXW/CaN5/R6COLr1Hr3uVNOzOOcWnQT5EAnhK6aKfMn3UJQrtKjqH6R8xaYELyYQKQFl5OppJza1uefGsC0wNG4fUJxqETh5wMMXHU0MOgyAUiWa6nzTvDt6ufQ9f8ZII5BTXlUrgOyOcR1XIgF43HWNfeenj04zwRVvGscV8MOEr5tw23GB9aIl6KNtRNbNVgDK79NSS22LxKTmgIF+0Z9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHEraTg1eFk0UHFmTEZMUW9HcllmZmMxU1lnb1d3QjB6U3kwWEw2MjJZNHcv?=
 =?utf-8?B?Zlk0TEVvbkRLc0pNL1F1QUpLRVI3SGRraldsWTlMNVd0Ync4dnZCUVN4aytM?=
 =?utf-8?B?QVp5V1F4SlQ1dGdwd2lPMjVGNFNBSHlCaWhlNGI1N1kyTjhIb3o5SGEwNzZs?=
 =?utf-8?B?NlkwUGYwT1dRQUg2VFVOMUkrMmtVRWJRU0ZsSGZwQ2QxcEQ4TG14LzR1YURX?=
 =?utf-8?B?dG1mT2lCQzFCODBQWW1WOUdXWDFRekNhQ1I3SjVSQlRtSGQxcGVjZFVTb09E?=
 =?utf-8?B?bVk0eDJ0Y0p1Q2JQMmRmeExFRThlWGNXZjFwdWVzVFpPaC82RC90QTFMZzQ0?=
 =?utf-8?B?cWdJQTZxSTYxMWNGd3BVZnRCd1Rka1o2OXdoRzhUN2RlNzhicmdwZ0J0aFlW?=
 =?utf-8?B?L21mVTh1MDZ4QVpXSEJsODNJbmlVcnB0Ym5ndWk1TU4vUVRWSmlUbGpUcWRh?=
 =?utf-8?B?UHRYNkd4ekxNMjF1ckJ6OWRWaitmbFJucHN0OHhCTHk4cU1KS29vckNCOWtO?=
 =?utf-8?B?MVFORHZCay9RNWFTSVNhd0IyL2g2bFh1RTFVRWZaWXlTZlNzQWFna2xzaWNs?=
 =?utf-8?B?eHJYZ2ltTFNqZm82SEFDazg5UDdpc0E1Q0swUGRsTWYrYmhZMWsvY040RlFv?=
 =?utf-8?B?TEU0Vk1UZDhZTWhlNzhZS3NseXVVaDc2MHlUbm5KcXFqdFJWZWt4VVRGSm9R?=
 =?utf-8?B?aGdSWUlIOVdaTkVweG9LOEJud0lsaWlabnRld0lheWtjVzh3dmdNSjBjZXhu?=
 =?utf-8?B?d3Y3MlJXc1VyTkhqYVdzTWFMYmNvcW9SdURwSGVPQ2o1NGZwb0RxSm1xT3Zr?=
 =?utf-8?B?RnovbWlDRHdxYmJORTBldUtkdzRkYVh1UWF0a3lyeUVJWjRRVitrY2FITHZ0?=
 =?utf-8?B?b0pPdTFhMEpYcEpQa1oxc2ViaERFZytaY1JWa2NVTlRSd1FrazF0NWdNbjJz?=
 =?utf-8?B?eXc5d2F2OXUwalR0QUg0WmdUeWRkTW56RUdwZWNJNmdQSHFJNURVajVqQXFU?=
 =?utf-8?B?bk45UHBONHJFQnVna2pHQUdEZ3NRVjF1amdNMit4UllmMVpSNklqZVdjdFpt?=
 =?utf-8?B?OTdISlk2R1E2UGdYR3ZucWh0VVE1My9KMVl6RmZlOVZSR2o2TVNJUEdDZGo1?=
 =?utf-8?B?ZXJ4WGUxdEhwWkFtU0xwUERZSVQvWU5PVUlCQjZYSG8yNnNRSCtkOXBEbUdL?=
 =?utf-8?B?MDZHc3ZKY1dEQXE2V2tWVDRHL2kwMmtaaHdZanFWR0JCOVRNbGJMRDJuTVc1?=
 =?utf-8?B?bmRJSHRZbVg2WGxRMVFUWE1hMDFlOHg4eHoxaUk3WlVWVFNaamxoZm1Id0xP?=
 =?utf-8?B?eGZpeHBjUHdST2IrMDNWb05LaDFYeTJja0ROOFRRYzNrT3pVa2xSbWJWVFNG?=
 =?utf-8?B?SkJvUWVQR3BXUlhuNlAvcEVpRW9Xak9NY1hXUDk1RW82NW01WElTclZidUJS?=
 =?utf-8?B?Rlc1aEtqVXBURHE5R1ZWTzhKWVBwa1dyL093ZklNbVFTTjhONlM2cjNiMnMx?=
 =?utf-8?B?NjE0QnZLNWVHYW5EZnBQRGg1NDRRek5lWjNOZUFPa3VRTzZtVzNLZ3hYc1lY?=
 =?utf-8?B?RGxJcVBTY3hkRXNjYTlpbGJzMERwQzVVOW5CT0tJcElvUUtXNTRUenQxRzZH?=
 =?utf-8?B?c1U3ZEc1MDk5ZkdaTlVhRjZES095MmtoZWM2YkhoSEhEWnRaY2pLbTM0cEpq?=
 =?utf-8?B?SDdKS1NCTVcvR0RTMS9xNVE1YjluajM1dElWdHVRYloxMXNHK2VzcjdxKzZM?=
 =?utf-8?B?WUFCR0FBSjcxSXdpL1JCL3RyUUJGUnQ4UjNIaHZpUmZTS3hrc3lWaSthdWtz?=
 =?utf-8?B?Ykpwc1ppR1J1eWRwNk1tV1ZOQkVZM0R5OEV4WFpkaVg0NU5UeC9QbElSaVh2?=
 =?utf-8?B?b2xrdjZ3T1B4b2dPcUpnZXZFa1NoeWtkTVlMVnliUzUyWE1YSDRNZTB5NjVh?=
 =?utf-8?B?RFE1VnNoc0dpRzNQeVBBNll3cVViTjVFbTA4MjVjdEtmTkFjclpsUWV0WVRE?=
 =?utf-8?B?c0Y0UzVhRUk5T2xFNnMvaXdGaGlNTko0UHlFNENlWitHeDNLRU0zekcvQWRS?=
 =?utf-8?B?QmhXb0ZRQnZ3YWhNdHNHcDRxYkdxN2wwQm13MnB6T25xOWtYSi9pMTJzQWkv?=
 =?utf-8?B?azFkY0tGeEtRRCtNRDlNeUpJMjArYWExMklnaTE5M0E4VHFBdWl1RzhyZFV2?=
 =?utf-8?B?aXZOaGRHaHlSQ2FUMkh4ZHltZFM1ZTNNc0U3dG1ORW5GWkQxOUM5MHZFSTB5?=
 =?utf-8?B?Ylc5STZaNm5XNWl1UmQ2RTQ0ZUIrWGFGeFF6WXNyaDZiRkplY3k3Qm9YVm5a?=
 =?utf-8?B?UmxiOTdRZXFoUkxWTkxMQk5PWmZxNjY0b0Y3R09RdURlaDh1eHhBSkhjbXlZ?=
 =?utf-8?Q?ynFox32w+MbHd+Os=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc9371e-354a-4836-b1d0-08de7de8f099
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:34:15.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1wPQB2cogr15IhoAIwlN8hGKJn3gJgUH/aBBgFnnXBXwgopYNIe45Y6M+vGdCVJPrSQemaZyC6sAsVGKQAZUtc8UreYbgQsTQH/Wpv4Q9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_073428_571498_CE30DFAC 
X-CRM114-Status: GOOD (  12.52  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add support for the uSDHC controller found in NXP S32N79 automotive SoCs,
which reuse the existing sdhci-esdhc-imx driver with slice difference.

Compared with s32g2/s32g3, needn't set ESDHC_FLAG_SKIP_CD_WAKE flag
because s32n79 does not have this limitation.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673b0f..28288fca87ff 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -321,6 +321,14 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
 	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
+static struct esdhc_soc_data usdhc_s32n79_data = {
+	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
+			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
+			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
+			| ESDHC_FLAG_SKIP_ERR004536,
+	.quirks = SDHCI_QUIRK_NO_LED,
+};
+
 static struct esdhc_soc_data usdhc_imx7ulp_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
@@ -408,6 +416,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
 	{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
 	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
+	{ .compatible = "nxp,s32n79-usdhc", .data = &usdhc_s32n79_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
-- 
2.43.0


