Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4456FEB7ED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDC1H0m+9mkhYatIZ7i7+LeDmjpEtDu+YDWXYIYAttg=; b=32mNrzDuFl5dvFnDJl+NpLTfC4
	W3EaxusEJj0MwE33alm2DPPsOWsTxyNONtNF5EHXmhg9bdf0VAa5D6g1w1aFjQFveUSt9A5hTTGVN
	mmRPHBtCulitNXGq0cgiNs1Q5q+ryJybYO9cW+qA8SnZz7O3bS9pjkZTEDeiqfT74MDg1NQU0Zlqw
	ZzLLEnp715ZQaaJ+PDbmOxB/9Qeo5oYCezcmUoPrPGDXQeb6nDGeC7quw8v2avHVPLUBaPExU5OXW
	H0rfkEKmsp/avcuVfzW58EE6H73qGiP7ooXaNHgz2bvN+cMe31scK9n7MYfNm9nlHX6wdlpkG+kY5
	EfoYbzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkVV-0000000H6OJ-0VOP;
	Wed, 04 Mar 2026 11:35:13 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkVR-0000000H6JB-3QmW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+YyPOehFa116k2mhmbqPDFxpZxbDhSxGJDPasH4OX/wkpzdKTh/FfolLhghSx2ihx4C3EXpXkA71FiKd6HclCcieAJXY7YiauwF5/Cg/CC4YFlBfyFskDoeYX+uxiP3VWYGqKTKq8Le163wM5mIcZbfa7UwzUHxqUlwVZ2E+A6UhRcrk3dBx7FYJXhENHd+nXjbU6Li4mKRfYgKnicLudpzb5RyHq0haJnKcJ7VN+xz7r8NqLwDvm3wID8R2K/uloSqTDi5nOIoQrjOAIF7DNBo/k/5G6nUhyIz/HkAA+56nelBwSlOH9RuzCk1J6yL7dHqibZK5WTYiJ4CF38I1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDC1H0m+9mkhYatIZ7i7+LeDmjpEtDu+YDWXYIYAttg=;
 b=u0n32+kzPzUVWwwJ5M7SQWaKDUX0pf8qON0VICjzKl3XQlZ/DCs72YAwmFsrT0fUmvzJetSqA3g6UwbHotGVWSUohc+bmOwuR0yAh/LiHNqJA/RUTF1amrWid4IuLM5cPugAvXN+vTi9LJCg7eI3+PqMQPrwd4+zzStXwc80KHG7kkxzZKcPt/1o5MWpdK/B7y7tZfjb0qKRReFUQaAtWtfBmWHSO+agogl5NjxfUtTCipxhNXe4n1jQ1tDH5glxFJw4YwhKbiuSOxDmaGrnEK2VFe4qjAUIuw0o/khVnwSjnA3FITOkeoTrDxvEL8XNeYW/gHALNSJAxiyQuEQdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDC1H0m+9mkhYatIZ7i7+LeDmjpEtDu+YDWXYIYAttg=;
 b=RodNgIWTEDxdGezl/yJBiJ0Ngcc6UVIuIVTygvEjzcv5mHLBj7zmMjCf/klQwrig+KukDOVl22bvfO2Og4dHXrxp/fVeSYbcbYZgExlgY7yBmkuZudxdlK1rbpw6At58y69qpAMZy0zYt41c4sXC+UtktrNd7FfmaoleLY9X1RIeeXgPTCT9RWnpqKqZvBAQi3m44NpGGXiDA5Bi915BCw74qqzUlEKDyn4LGUqo3K9Kq1im7/PnWB8b6CMFYiU90I3xr2Dz73MOkbUxHd1tlFQQd9b5oHmEWksH4Lad3x2xjaEoESrbwLEg4cTkuUPweWqLZYOPZeAuK+NZqL8+DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:35:03 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:35:03 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Ying Liu <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
Date: Wed,  4 Mar 2026 11:34:15 +0000
Message-ID: <20260304-dcif-upstreaming-v8-6-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::12) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: e5065cc8-cc66-4237-a463-08de79e213ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: MnZ8FgguxVipBFj7ZKk0ur6LCVPjI76EuiBX7brEv+IlEE3EoqucsaBr9EeTDSC4uhIbtyn9eULBupb8oMNXIBuGv4UcZeI5PQCcfvDfFyItoUbgeF+0Y9btDC6FotOzCTqKxGvTnDP4Vg7d5iNsEZDWp2Ci/Vm8ilU86XkOerWzXdnX27r/HdkA0x1AYKbgaoL+AfIwSsahvc+vEuQcEfWiUdW7PY+0WvFan+AIo08SauVlOhRADMD10xL3USR0haXNlt0l4V9c4X13NTIAYyRenXtDHeKPv4/rqBHnbgWR1aAijzJoA8sV1w0ENIVTVonR/u+H8bub2uQVWjMUiDxJdo5YowSlsTUub5R/gulviom4rU+KMKEc4upoQFA8yuTJvaCiylJmSayFWJlxTZCIOnIq+RVsn6VyhSjk2aSLs5m1mdiOmi8naOHysuOcXxqBV+Q/QAvYubSa+qftioaHIrGQfiOGbDyhvXZbuaLGKSOoumzcQ/jFv72vvCpnjcPjyGyapq9GVabxCzMFMOD1PbKpZtdJaHX4c520mjs5i81TszYYO2gPhScwVkOsSyL102F3C8r3aPH9KHU41aK9B/xLQ/V3aSCbPdwTaeaorUQny4wnL5M1j65tTLtp7FPFINCh+/8qRZlnW/CU2Zbea+AZ+YihesNJJ+Q7Q+OdMs3agNP49o/hpXoVHbFzlFFfAqRcWOxocFCWpdqGmXrkVAnLzWZfTzhz9/PyesWFTg+3BWyCJs33gIUYHNJbpjbNvNYBI74tBT85jMqC2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5oMkQyQWtRYktoM0JxeHNPVUx0dXlHN2NhbjF1QmFXd0YrUWhIeW5RS3lU?=
 =?utf-8?B?Z1ZDTThOY2dvMEZyMDVxZ1RqNVNUTkl5N3JCcENwY0h1bUdPNm9SRmJsZnlL?=
 =?utf-8?B?TjZxUjlCYUVFU2l1NVhTclRDRmVQSGlvM1I0eTVnVE9JbGZCV2RIbUNmbzA5?=
 =?utf-8?B?VEZaNnZBU3dOS1c1aGFBUlEvREY5c0VCQjZXNGtzUkNHVm1XQ0pBaU5YUnNn?=
 =?utf-8?B?a3lvOGdyNitFRDJhMHJaSDlvU04wN3BDNkloUEZLM3JIQkl6K1ZFMHBCMmJF?=
 =?utf-8?B?Zm0rZUNZWElzclZPMUtFK0N0MVgwV3VVOVhsVDcrVWhOeE1kU0dJSXJqZ2l1?=
 =?utf-8?B?Nk5ieloxY0tUNXFta0FGS2pWaDVmdDllbHFkYkc2ZWh5WFM5RXpmSE5mR29U?=
 =?utf-8?B?a2xUeFdITzFFSGNJTitoL2lmZ25CTzhHL3ZqaC9xY1NhdlVoK2NXK0VqS3hj?=
 =?utf-8?B?clJCWVFJOHliNDlObU93VTU0bmdidmp6VjRjYWxMVXRmUVZZNVY5OUF5anc3?=
 =?utf-8?B?aDEzMnF0Z1dub2ZLaExIWGUvQi9ycjAzRExTbUJaaG93VXhzdDdjNXpZdmor?=
 =?utf-8?B?eG10cS8ybmJkUU1yMUdzdFhKTjhQZmtzNGlCSVMyRWhiL1ExZkdJTmhBL3Ni?=
 =?utf-8?B?UWpCN3VzWDJpa3V1cm1Fc2RsWGN1U0NCNGNlbXNMSzFwcTFYd2MzRlFTR1pZ?=
 =?utf-8?B?N3pDTDBNbVNJUFRZN1BOU2c5YlI4VHgvc2w3ZVgvUHR2Y1QrUThSRDBUWlh1?=
 =?utf-8?B?ZG82SysweWtrS1lIUG9kQS9EY2x1dE5iaElGWk1FMC9zVUNFRGh6QnBUREdk?=
 =?utf-8?B?dU9VdjdNQmF2amlUTWxCYTgwcGg4c3lBOUpYTFBDUGorb1EzQ2k0NlQwVEkx?=
 =?utf-8?B?SXQ3eXFvNTRHRy9UY2VwRkVSbmY3UWJWZWVSV2pSRitucVJCRkR4NzdJZlF5?=
 =?utf-8?B?emdWSHUzSUdWa3ErTXIzZVJzZTdhSUpiaWVHeHlEOXVOZENSWUZFY2lVQzVq?=
 =?utf-8?B?Y2xaeFVJZStKWGNHR1A0QjBaaWd1Wjd4RTBkc0RGemVZSXM3YnNVRUtwOFQr?=
 =?utf-8?B?blg0blgwTlV5SnkxQ2FoSHVUdmNadE5idzYrUmd3TzA5MmlmQzNtdUswcHZN?=
 =?utf-8?B?WG1pZWxsRWFBcjFwdE1MUmVaSXkrMDhiaTV2QkhuZGx4TFhSc3dIVWFseWcr?=
 =?utf-8?B?Z2Y3WDZzRkdhWHlLWmxiU01BMWhYVzdzVEVXMXNmZENGOVhPckk2enlkeXJq?=
 =?utf-8?B?bDVPUlRsb2xOK1RYdFNDTkxLWjU1WjlzYk9iMzF0bjFJSlJEWFFKN2tFaXV0?=
 =?utf-8?B?MjRFQytMUmNPaG9WRUhQcDNNR0duWWlqeHR6WnNtcXNHOWpGVmVFc1BKNTZj?=
 =?utf-8?B?T29uYmcxdXo3MUptOG9PZ1pRc1BEaFg4U3dRcENPRlZpUDc3ekV1MTBTQ3gy?=
 =?utf-8?B?aWFBa1EyMDlPRjdtMHpyL0VnUDdYbXhKQVp5YWEvUklBNTFPWnloMHVoM3Bk?=
 =?utf-8?B?VU5JdE5Ia3FURUZYYUkzNXJ4ejRNWVJhV2p6MzhDeFgwbU1UNVZ5WWY3SmI1?=
 =?utf-8?B?YzF4VWxGcE5RT1dIN213dFNqS0grbUdnY1ZuZ0MxZUlYNFVkaUZtbHpCQ1R0?=
 =?utf-8?B?Yy8zWXcxdndQblZnQWpBQUZPbjNnY1hsbGxwK2wyOEw2VDV3U2ptYmZBUkZs?=
 =?utf-8?B?cUs0U1R4QWc1ZTRFNU9RQ3JIOFkvZWhHa3ZqZ0FKWWdpdHZHdUdhUzFudGl4?=
 =?utf-8?B?YjZUVjBSSnVjMlljUW8zMjN2V0ZydFZiRjZFMWgrSTAveXZVNjN0TGJ0ck1Z?=
 =?utf-8?B?Q0NlMHpBNi9BZGNNYnEzcmRGQUwxQzR4OXNrZlVGblZLREJVa2NPcHQwaWZj?=
 =?utf-8?B?VDNYK3hZekF2ei9iNU8xNS9WOW1peUoyRWFSWWN3NGFhOVp6YU91STQzdGRG?=
 =?utf-8?B?MlRHUXozT29nNnYzOVRTWU5qdGVHdWFxY05FQzV0M3ZpdFdjZjV5eEdNSFow?=
 =?utf-8?B?ZjhRUG5KbTUyT244dWVXeFlFYlRpWUJuQm9kSTA0Yzh1WDN0Y2hHT251cXhr?=
 =?utf-8?B?ODNmNklPMUNoMHF3QXJINWdGOThtS3lvU0taUnBsNElZS0VxbU1Ld1J2S2tN?=
 =?utf-8?B?S2lWSWpGWTh5c0RGcTAxZ1RNTGRuenRiZTh6QnFhb1NvOFVvam5nSXhGRlRF?=
 =?utf-8?B?bWJpRHJuVHVXTDkza0J0MFlIYkZZaEJwdGI3c3daR3d4WVZuNk5LSW9LbGRU?=
 =?utf-8?B?TENweC8veEhVclgrL2ZPOVd1Z1YrZWFVNE50aVNtS1ovU2xmRXBhNmgveGZk?=
 =?utf-8?B?eVhTWUFoUEtNSEZzbS9GRWQ0ek5QckFuMExhZ1drcDdlTUVPQkhiZGxGOHV3?=
 =?utf-8?Q?u82YJqx/m+4Pr77s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5065cc8-cc66-4237-a463-08de79e213ca
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:35:03.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NXNWUUR20hONyDOn8ezsYr17PUYLVtd3Y7oPjC7mtBUV9c2YCUnGeuoqKvZekq2TUGj6+ETRF3GNxnXyueZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_033509_858367_757340C3 
X-CRM114-Status: UNSURE (   9.98  )
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

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add 'ldb' child node to handle
these use cases.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d62..85d64c4daf4c9 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
   power-domains:
     maxItems: 1
 
@@ -39,6 +45,11 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+patternProperties:
+  "^ldb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
 required:
   - compatible
   - reg
@@ -46,6 +57,21 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        "^ldb@[0-9a-f]+$": false
+    else:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+
 additionalProperties: false
 
 examples:

-- 
2.51.0

