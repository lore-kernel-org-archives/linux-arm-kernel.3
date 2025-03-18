Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AADC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL3f93PPsH8bwf9vIoZnwHY1bY1oYrgcx+weEMTI4bI=; b=HpbNRt1KEff7SQD7j2Ph05wsXv
	DavXwT46IJ9wY2ozM56uEixU18BKlZu3isNLTGpMmNpjJa8ZskXHABHe1elfZok9SciWMMaIEf3Qj
	j/+gAbdKlhCALjSnet55mxiVECjP+PKG9h+0rqEqCyaor5MnsO2Xl+qUSDxS/mz4FZYEmaNn2zN9o
	5iq11ulANeK2drTqubvGLGwro1SucggZ2x67MPvJdrzGV2S0ZJucfxv2EotD+o30xkpMZxersNmZ0
	M80v+Pc/lIPwBqzklxnt7+Zg+2JE8uMhID3MOcAc54poMC2zz5nIzqJPvKCxwhAhGglsV6EF0GKyx
	cFVr4iZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuShI-00000005Eb1-0zj3;
	Tue, 18 Mar 2025 08:53:16 +0000
Received: from mail-db8eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2614::621] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSc0-00000005DbW-1iRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnBl5VP8VPOfW8Nr9kirjN5oJUGZoG4uVn+sdAdpugXiCC17+6RPMyl0LjBHfxBJch/3MOwXAi+q6NAUcf9jlEbU2AG1NJMTEwJ0thePNN16zwqIwVqb/wW8j3672yYnT9+FYGrfSECCPOn24Lz7Tw7nMIW0clN50fjt720xZKCvqLMb9A4YqUj4V0MSte0JVkNme+9Ve9NhTLm0KFFqty8LPagZj1r/Jxn9AIeUBAPTkfwKNw8KBKiN8pSvy5egYPKJKjK83kBAkYH8jSmkM4hm3928HInsB435VOiUXT1IV1ohoq2Cn5sS9wO0int1PtBlyYMO0CsBak38jDJJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL3f93PPsH8bwf9vIoZnwHY1bY1oYrgcx+weEMTI4bI=;
 b=wTELPGo6+t26DPsYiQSgy9XS+uKjLIxGCUYgf7E6rZXk5tHuRTmgy0gBKXFxg0CKVBPgBxwi4sh7Q1yMOVLPrOa9vNUyV26swv+BRpXnMFlvK8MHVtyP80m72V6UFmdG+EqEtPYWpXjGCvoU6qCUyXoe29t9JZHT5sCtsmpEt0p01jxKVk/Ea4sOd6xcH4ebtA0W2JslrtXTUJYc2CHEPhMKBJ/C9dPlz0Dxn61/KZDEG7NULRso0cc9lUyGMwreQ/oPa+N4WApM1yjfZe8BbdWwFxPgSiosp1Lwd/cro8kDzqz8dAAW+65POXBdS6PidUOLjg81ePJCRi9j0Barpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL3f93PPsH8bwf9vIoZnwHY1bY1oYrgcx+weEMTI4bI=;
 b=tslL4rQaEX6a49AVKRMk4o0zr5KkOn8vKZhJOqNK2TlkwKRaAOIcJNKkFrv0xgySVvbCOvMzN6EvjYUAUYwLBfpIt15cs1R5nLdEJpMvOYXhf5/m/Lhfe8eFDuVMH0Ni+TnxoIV+Qp6M3YGCqU+E4h6eVVZXsnx6+41IA+05jFFznIiXZWamyreoizgLSof2OAQJgxhUjch8sXuNQA2cAUnzd9f3ng9pf4/Djt1bAxA0UjHGyHPKCZQCHPQhhiQ2tXu/qtL+D0RefhAoWlCj7pfcsXU5vTRVPo07EXUIrmKXr22NUPDDtC8p/5MzB8cKa2PhGHmGR3C2WFm2qAnKVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PA4PR04MB7742.eurprd04.prod.outlook.com (2603:10a6:102:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:47:37 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:47:37 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Date: Tue, 18 Mar 2025 10:54:42 +0200
Message-Id: <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::14) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PA4PR04MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 986a1d62-cf1d-426e-2a15-08dd65f988fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hDoSqwMWkM7Jsls3X58CtYOugBjx6VF16rKLRGdGVFQQbeGYkh8b2Jk4NU?=
 =?iso-8859-1?Q?yJWuzMb4DUnYcg5Sw65/ZYgfUJoRoQ8XYBkQ6xxO+rWwwIJ4Q5HJIGDnAK?=
 =?iso-8859-1?Q?T7jSXTBrZt6r6CGdolRjxeU72plbs4ZVQQXvthiDZlrFcQwXaxP4kBhlsL?=
 =?iso-8859-1?Q?syl+y0xSsfxqjUPvtZpVDF7XeNALjYWY1PEpgha8ZlSmp6RIRB64jKS4Bn?=
 =?iso-8859-1?Q?LmKKjEdcD1iLoR10GFW3xJteTrrN09yeayQbvl4/ltC81M1kMKJJte7xcO?=
 =?iso-8859-1?Q?oJUXzq5iJBPgd/uloH+WrV7ixVgpx6snYqnGsZtnKYghij20f9mgJExI3k?=
 =?iso-8859-1?Q?DcWD+cw+XBkJaQ2E2zS47+1tsCJP7xpdCifTK74htSf8ec7Uo0SdW+klF2?=
 =?iso-8859-1?Q?zWgIpqUPQNWAcSBZRwDzcvR8JgAGOpihk7srLQFTI9DKtAc9TqMdgUZ4z3?=
 =?iso-8859-1?Q?45ITg+63Yf4IAuSNqGJd4+Yk1Jxty3RZvH9oltYNHv6WGnquFn0UEpR7Ln?=
 =?iso-8859-1?Q?3xI6+cFtnjfMl2F7oj/KAKIBDfzvtko3jkwl2uYrhUaTURdVarS8G6UZPr?=
 =?iso-8859-1?Q?olbvqvYZdyKr26PP5bN13I0wfFI7MY/qgdQRNe438arH4eDvqoqX7udMbP?=
 =?iso-8859-1?Q?bMltxgPfWX3mcw1SVxtELaR5wSgQWRqSMIh885D7mzu7sVlU6GZHnDSTME?=
 =?iso-8859-1?Q?XUvxXM1bQE12rJsSchaKGva5RfGCN8g7p96XnPaD1IG1gM8d/Hjg7rlVS5?=
 =?iso-8859-1?Q?Bzo3oLbRxwePEgIsSjtSEapGdqvcIuOdF2KRMb8e3NSjjFE94ebUSWUkOb?=
 =?iso-8859-1?Q?pZOuavVn7uljlKY+dDQGC5djCdvAk39gAYvH7w81WPtEWeKMAtl11JloJ6?=
 =?iso-8859-1?Q?tgFIMFE/Mmm1dV2DIH/zfOjLhjaq0woHiTKWJ3tnLkZEk12ElJl9aL7NY2?=
 =?iso-8859-1?Q?yurIPNmYcjSzkLkwjxRdcTLWKDaWs2DUYhu11SAHMIJBeyVD/A+xSUW1Mu?=
 =?iso-8859-1?Q?iDHDW76v2TIMVmQ8C+oOy/6pkAfiAl18gcccFhGTuwSSpP2yDm1b0bJzXq?=
 =?iso-8859-1?Q?CyFCzISjMN2AVY8YKm+1ovrWWfq9QGWy+O6x53KGW8VhSC28qYjTPgwbXv?=
 =?iso-8859-1?Q?Oxat1evkPgqUOYU+q66vIwRxOzxalxBEYcJ6plCcb67gPF9ntlRW77k3lc?=
 =?iso-8859-1?Q?kuJakW4jhQRNkzsueEgkG/w/ivE5/m1hISTu38qvLSuVDs+2C/KqrqLW69?=
 =?iso-8859-1?Q?U6vbiAXrITyNJedr9rKKNW+2jZEKaUnx/aYmJ7dMaXV6mJuw8KA18zBojV?=
 =?iso-8859-1?Q?ks8q/ZJXzzdFFt0op0A8q2VgiHmpEGYoxKmjgdS2H7dSixYyikNnQoNpHC?=
 =?iso-8859-1?Q?qJ4pXDufgmjh4gbT2wOHxQemE7qNmC7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q4G5AQn+WIVhpza0G1ym3m+MrPLhcziXamUoEONaubzVCvpkhzLJ3xp9Eq?=
 =?iso-8859-1?Q?+QjiI9Lqd1Aphs//XQJaJFLRno2TWWfttZn+hnOgTRC/BxWeWAsvQ65btj?=
 =?iso-8859-1?Q?rrxuKhgAiR6/+fGe2F4+4+g3EiLpyyeuSVIlBpzUJT5IESGyFEIhCNLPst?=
 =?iso-8859-1?Q?ls48rUa6QNGMD1cLJ+zc0EASkxRpsLlnGKRP5uom8JJgyeWTGFjjxWOprG?=
 =?iso-8859-1?Q?3gayVxXRrwZicukKxaCyKXTrEHulzjKhTsSYhjBoivl20cV9RAaP14DAhP?=
 =?iso-8859-1?Q?/vTjKEd4SlqP9qqCM1OtKed12H5Rzwh+66eU55pqhb9Vw5+sBZtYgmk6ao?=
 =?iso-8859-1?Q?eItw0wAxhslTPFmmuvnYGXnnTlf4S4623PTtbaRJGk0noZnVl6ENCnqEbb?=
 =?iso-8859-1?Q?0KsbBuI/4CwoiCS9dXlXrHo/cfW9Dq78o6l7WtfF4PDH4DwpvqSlMQdmmY?=
 =?iso-8859-1?Q?QP8fy9InfljXrPXH65wArM5oFHZOvfo4RXfGNuDhPIsREyOHeFYTLK/oU3?=
 =?iso-8859-1?Q?IgZiS3vJRKjqu4xGw4R0dSzjDnIHBQjJ2+fyKx27bte/qSzaqb69jxUgo6?=
 =?iso-8859-1?Q?I4/MRLIq2DvLKAZHuo+CjmIl2lavancGWEwcnDKVm+k4apdeW/5zD6fEev?=
 =?iso-8859-1?Q?lWVosL386P8WRBL8T/vFLm1ZNqToL/IQwqDQR7xHykreMKLaW0NGMMNbMX?=
 =?iso-8859-1?Q?J4ax+0PoC+VaUhJ4lC40jAnen9zDi7YKdaFmEaeCY5wJ5G91+kEy2tcQDJ?=
 =?iso-8859-1?Q?EUt6VE9Hd3HA0ZOE7wYCG9Nnls6pNCMoB0AnBSL1QS0M31wgjfTg9WWloh?=
 =?iso-8859-1?Q?W7OLkl8cSuejVTq6Swwiu0rBvxBgWfbDMWriF76cEepjk34W4/IVjt7vH0?=
 =?iso-8859-1?Q?mdpGvF1F+JKXRw7FYnhmSuYGqXQMyIdjEqZERsF535BC0mqOElF6F4rYyR?=
 =?iso-8859-1?Q?V8A2+NUEtYrg32N8toqrlE2Co8qgwEv2hehXBRludscuB9ZY+NYW3ZvRSa?=
 =?iso-8859-1?Q?CGhYpIfmhwDrYaR0fmw+JyYgSf3N/QuPVznYb9TdQCgvz3e4JLvjwGrPT6?=
 =?iso-8859-1?Q?Qxu2JuWfzegcRAtnhojOWExH3gHus/A94X75wjBUIj8fe1rkslSsuFvDf/?=
 =?iso-8859-1?Q?aY4rNG6GWhii4SI3A2BX5yR2y6uB3iVkKgG6+YaRVLK7k6JsN/313l6WEz?=
 =?iso-8859-1?Q?z28tmvYl5FhMIRWlcfNfSWMgEyLyaB788IaTofNQLLuqbKIN60VF5vlOQH?=
 =?iso-8859-1?Q?PQ71Bz4CQRWWhJwm6cnOEV/sIx2vYVuutazMfCcLRER/rV9/4zoPeBi+YM?=
 =?iso-8859-1?Q?wq3augZfp5p2oJ7vuy0+3nKR5kR/DmZFWnD7hlP3IBXLZnoZ0xOLlfhSBm?=
 =?iso-8859-1?Q?eOtKmRJhcTDqF9kmE6b3WiTLx3ai2CsvnYRa7JekS7R7BCUmrWEbupOS/B?=
 =?iso-8859-1?Q?J1PldXrMpeJ1dIIlULnqoBUvcWWpUefj8ul3DX0QgzxfZnEO8SLSremUcB?=
 =?iso-8859-1?Q?lLnbHBPKbOHoN0p0FV5l0dsZpgnaRHb6ZqOAwUE8bST4ZSjTUHt+fCt0Mt?=
 =?iso-8859-1?Q?csl5rAte3si9njUuZH7ypv4qeRUaeHvPBVxO6soqQt41AyRkvQhAtLFMw7?=
 =?iso-8859-1?Q?yfmRhDVhHpCuHgaE89CVRq8aByDPsK9b5THhx+Pgr7OoExr0FIemyFtA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986a1d62-cf1d-426e-2a15-08dd65f988fc
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 08:47:37.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuo4x3jQnQlk2BDUUfuXODIQzuQ3Q2pOvqjxstS2o41TYZpPejOsEvEkwEG6/em1rLdWxJn1ucNFebKDklQsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_014748_453543_D6FB2105 
X-CRM114-Status: GOOD (  12.58  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Introduce yaml schema for Microchip emc2305 pwm fan controller.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/hwmon/microchip,emc2305.yaml     | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
new file mode 100644
index 000000000000..e61ef97e63af
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2305 SMBus compliant PWM fan controller
+
+maintainers:
+  - Michael Shych <michaelsh@nvidia.com>
+
+description:
+  Microchip EMC2301/2/3/5 pwm controller which supports
+  up to five programmable fan control circuits.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - microchip,emc2305
+      - items:
+          - enum:
+              - microchip,emc2303
+              - microchip,emc2302
+              - microchip,emc2301
+          - const: microchip,emc2305
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pwm-cells':
+    const: 3
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: The PWM frequency
+      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
+      - cell 2: The PWM output config:
+           - 0 (Open-Drain)
+           - 1 (Push-Pull)
+
+
+patternProperties:
+  '^fan@[0-4]$':
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          The fan number used to determine the associated PWM channel.
+
+    required:
+      - reg
+      - pwms
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan_controller: fan-controller@2f {
+            compatible = "microchip,emc2305";
+            reg = <0x2f>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <3>;
+
+            fan@0 {
+                reg = <0x0>;
+                pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+                #cooling-cells = <2>;
+            };
+
+            fan@1 {
+                reg = <0x1>;
+                pwms = <&fan_controller 26000 0 1>;
+                #cooling-cells = <2>;
+            };
+
+            fan@2 {
+                reg = <0x2>;
+                pwms = <&fan_controller 26000 0 1>;
+                #cooling-cells = <2>;
+            };
+
+            fan@3 {
+                reg = <0x3>;
+                pwms = <&fan_controller 26000 0 1>;
+                #cooling-cells = <2>;
+            };
+
+            fan@4 {
+                reg = <0x4>;
+                pwms = <&fan_controller 26000 0 1>;
+                #cooling-cells = <2>;
+            };
+        };
+    };
+...
-- 
2.34.1


