Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B459C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=; b=scyEjUugKX/rLlfuid96sVFJri
	LhEEGj2hswsS2s1+p00vVNPS+mZn2YUjGx3y+yh5ya90Hq78tQpyDsv6xPEKkaGK2mo0vzecPOXBa
	XjZxaaUjcBQnCcGZE5tQUIhEnpQjZ31kMpHJwD80p0hOPZC1o+BVRW/HqDfsUyhlt2vHAtNRDKSAg
	200lqqYYiFRY9P2OCBwtI1lySlNGo3jbbttdZnk4PqYccmVx0GjOnd33W+IVI5AAPOKKzUWqoYU2Q
	GF5+fSYiY5csrA8cDabfQKO7ATa9U+1RG3ki0aSgNmB9MaUBeZxm8GOEemie34cOsmVAAa6TZka3Z
	opa/2LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Sx-0000000AAlB-0PQh;
	Sun, 09 Aug 2026 10:09:15 +0000
Received: from mail-eastus2azolkn19010000.outbound.protection.outlook.com ([52.103.12.0] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Su-0000000AAij-35GW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWAsEb8MP1U5NV6Lla/LqK+aGHAW9CvtZFMq9iKtZXxJq+s2/Ei2rGC0qILTCZs7rB9rvTKpSotECJCKsz7P1icCH1How+zdrCdFShuI80yPwBIFLzSx2WLC0QSJQaG2tCmfXO1mIe1SLGnFZYnrFGQtQ6UjEQDfaP1tvWZAFnDqNeo66VExP5KO0ilOPtF1LIHE271MNkfLMyoCpGnI5Od9zLV63grMcvnG3u5hB4Q8HPSg89us5FzISYjlzE50/Sruu8iyDHNWN+eUNQWkBMTFaf8zM4efyJuhYxwnRhLmG+wOz7eqchkmQJrHJ7KBCEIY84/YEHISPy4VvlUKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=BbG5Aj/73EALZD2QRzeBetF3wTCubu1yGGpdF7mNyBKwsM+WmACzPjlXmReKXdD0ztfNa5fpGeQ2ZRjWfWAlhOzJgxX1o3n6E0AYY5o60vcAxO5EVKY4ujQf2BcyCTdkomnY/W7Fws/zzqfzOPreHA0/pTo/9t2ErotNqdTTe4DTqxUdImDN/ObZm7G1SlzH/O8pm+EHYb3z70VEIfM3Xk6K/0V/xpKqHgCGd8YaIe3KHwXD+97Fo+J7P0H7Gq2/ZU9ykrlZNW2TDj4FELMIaKrbjVbh2G7LU0uaDUl/S2EqkR2MHDPqnyZKCwyHDFIcHRLc5/v5o2BU4N7w3P4mEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=lIlRs2YPRqeYiNVs48M3WOAxpZx0itU7TnefdXFqBPBnFVMr7tz1fUKgKK5Czr+6NIBrvhx9dLK0NRmkCMM38Ij1LOhxRXwqYZ49UKwjce3WZ5VU7gmtfadOpk1zlqI5Vk+C7hAVp4vyaps/dSzquj3y360r1kRTPfpGP+zs5MVEwkKdo5s1+Ij/aDMUgxmwyC//nX/m1vmxnEurj9u1UukCYlh7KoEVkczkIz82jPpfzc+goIqAATs3Uw6NkVDcRA+IJXC6G7RY85CYGNaKd6jwi/zmtsywyPm6n+oDqOPMhhQsUS6rTsoCe2SB1krfDGeIBNLq9hdQWnC+9L1lFw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:09:08 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:09:08 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:48:40 +0800
Subject: [PATCH v2 1/9] dt-bindings: arm: stm32: add Ruiside ART-Pi2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <MN0PR19MB6091AACBBDE805227D9036C0ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178627017395.53236.12818301296355580753@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: b464b211-24f4-4c8e-0425-08def5fe4006
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|37011999003|23021999003|8060799015|19110799012|24021099003|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ubiWTaWq2jQHpZ+UKoE15bChBZsO8LHstFaXZPdEyFrOlSZO8H7W0waWNy+w?=
 =?us-ascii?Q?kLDUIy5yOij2FB5G3WC61CMOFUYpaovla6h4mTRcOcRkIS2NR/I0E+mAUUbQ?=
 =?us-ascii?Q?3+DBB7OkVrPWaBpWqwjRCDssb9PT1WN+YQddM5mGXicGhMCljyNvHImmRrRY?=
 =?us-ascii?Q?sIhUjF9ky9sBz/UN16tJWhCZQYEnpSzTJafiO268o/aHuzcAxWuE3vaP4Bpb?=
 =?us-ascii?Q?M5/kvbDo7uS+TNBsquOdpkVtX/F4D4zjHuIUzOmjRpdEsYfWPCapeEo/wasa?=
 =?us-ascii?Q?RqPxwOkwY71VFK7DbiwxKbtroVSIg13bgym7VKKzAtvvNJNlAqFiVUWteamZ?=
 =?us-ascii?Q?DIr31bFx55V0IStxeXqBHYDcLo0VKUYOxo5FWCFM5PjgAushbpWdsjf2Txj8?=
 =?us-ascii?Q?+Zi6RV+RXHe7ok6GAYa4icY9oBEfMAMsPVOULviicdB5rc5ymlQG9V1ip9mo?=
 =?us-ascii?Q?VarY4+APhBPhib0lYqfDzPMSc59aIoawEG+m+fxcdiEpGBizXGbNUZkQvYjA?=
 =?us-ascii?Q?wmOrtzT0/3xmQB18RxlTC8KcNS27Z4Ne47uHfzb3OCa2RhXjtxCWr/2wpBLs?=
 =?us-ascii?Q?HN+w3zmBeZss7MmuZ7HoLCEnKeM2JtQyhScAXGuIu5pf2xZ5uw1mZGJHLzGG?=
 =?us-ascii?Q?Dcw62mJ1ruHqlyyyZdR437vsUjAhfcqI5pz9u1Yd0Yx0KaQPgUCw+Ag7YSR+?=
 =?us-ascii?Q?vIZ0oWJBTQSRUINdljzovcG2VBCT+c1Q1TycRafLRHn3evug9Zzy6ZuQgbBp?=
 =?us-ascii?Q?lwwUe0hU7Ls4O7+lGZmL6bKvapZ8Ejlj860a21fgOdcydBULTrxzcliK/I0U?=
 =?us-ascii?Q?TjbyQT8x3G7ekzZ1CALujywSmwFztJ8K+/qSZIge7w//bZeLVB4mCantx3PR?=
 =?us-ascii?Q?Os8Ni1oOxgR3shBK/uf61W2RXqNTbB9J/IBnrAYxfNBICvD4Hxa/AFCcaP8J?=
 =?us-ascii?Q?yaC0WSNHoNHjVmsgtc5FkA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulcVU+ZZHcOJafWqfJCbe8JD9EjVsy08bilIQxbqdYex9GHpYx2rQMxZ25Mh?=
 =?us-ascii?Q?A22dmYqLv4FCbYaXVC4MsNrwcxqcjmUXwRjctSg5YZuriQkhRD2rUhkmPmo2?=
 =?us-ascii?Q?RMVHkIXWoTkA5XjQ4AgH0DJ+yyhH1vaFG23a2dCQuMJPgaOiACv3GUPKysLB?=
 =?us-ascii?Q?S6Y6XJZgr/ZJYeMztB9aD967I/Lo9e44kltzZ+9MKr1M04n/wEII/d59AoMU?=
 =?us-ascii?Q?MhYRkQhd25YYwhset68cRMZl2nZon5KuccEWbNb4TDkenqb+ZX5AJ9xuyhYC?=
 =?us-ascii?Q?JA7yTgEemDNWFI8s9CxSNXxsl34WGNMywPT5DR6AyxMa9M6UEMnDwMbqd5aQ?=
 =?us-ascii?Q?nutv5meqgK+Z//ueDENJpRk6zcYhSWBZum346ud6cnoVI6pGB2wMKKTRt27W?=
 =?us-ascii?Q?DT/b/iJf7x4PuOXNbuaEsatx9QMfd9b+1D4CEkLd5LFZ1yN/csodIn1ruLnY?=
 =?us-ascii?Q?hi2QK+RS/cd7x7e0+9lwA/iQ1xBeZVprTuBgvzHPsuUPWmVp+gNoRwRgz/UX?=
 =?us-ascii?Q?s3rB8+mtHpwn7Zu/4SRZfy6SR9FShX75B/awcjNMjeE1smcUQGekcq+cNPJt?=
 =?us-ascii?Q?cUVXIryMkBKMtC5mxHax+FpH53hfLpxxh2ak7hk5PCB/m5Y95j8v6NAMnngI?=
 =?us-ascii?Q?5yiClqgUvRyy19wbhCYzPOdkKqOMtreZQfgB5Ot8Z+Xza3f8pIYiW7PBm1CL?=
 =?us-ascii?Q?8zC4oM9w2TA/wrcfXVXcb90EedLFJkDrOS7saFSok0njLOQYDRX0IdQIMKKp?=
 =?us-ascii?Q?w+lF12enx6SI1zpuZzlcbKDLoQcRvXjya7q1PgLqEC9A4bPrK4EVwO6GADE2?=
 =?us-ascii?Q?npVfYdIGNypzhoYbmgf6EtDNAsQgjvKHJNduYzWXk3pO5zrw7jAWD1s7aZNp?=
 =?us-ascii?Q?L3vPDQprxVmv5cGDRqho9FEIUV2imwZ4tDv0uTORL71HRxXTTPJsYKXmgrfq?=
 =?us-ascii?Q?qrwU5Y7Egg3MTL8GdDdQ4Zs5+X43T5T8YpAIhIExUtrE3abRCxdpEVxXUnpo?=
 =?us-ascii?Q?O7MN6mmqXFs6bV8pjKFN7w81Bf4ALlIL1nr1ghbmLyqsXAB924ufVrGqWvIs?=
 =?us-ascii?Q?on0sLh+iZKbY4Sxd2ZB/yd5qr74QfDW8Dd+VX5SPAZd68YvFEv0rQCZ91cYQ?=
 =?us-ascii?Q?qOpgeNxe6l7IO1cp5xNwesMt2q3LYmzoHDAcINDzWx2PLRMBPwkptCIIO9ss?=
 =?us-ascii?Q?i4OSzvvvodEEPZ5O9Q0tM2ZqU7KEHNJuHDtVW5timT449jaZ2iUEsyMen9Jk?=
 =?us-ascii?Q?P/PoNVXwNQpapHWV2EO2Pgk5Y/IdIV6Hcv6UY+wUwiUkO0eNhioYv5L/IkPk?=
 =?us-ascii?Q?JWSoi4eCBGDdZNKgAMSeAVXxKW8b4kqHUU9qjNgjos0Gjh7vkMTSC6k6jt+8?=
 =?us-ascii?Q?otz7eLzf0Mp5X1z+ityQAsKsDJIIUQmCWuDGp3DR8BEb1+hl4g=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b464b211-24f4-4c8e-0425-08def5fe4006
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:09:07.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030912_778178_DA2E300B 
X-CRM114-Status: UNSURE (   7.58  )
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

Document the Ruiside vendor prefix and the ART-Pi2 board compatible.
The board is built around the STM32H7R7 microcontroller.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 +++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a463..337448dc4 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -50,6 +50,9 @@ properties:
           - enum:
               - st,stm32h750i-art-pi
           - const: st,stm32h750
+      - items:
+          - const: ruiside,art-pi2
+          - const: st,stm32h7r7
       - items:
           - enum:
               - st,stm32mp135f-dk
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..401971b7f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1425,6 +1425,8 @@ patternProperties:
     description: Shenzhen Roofull Technology Co, Ltd
   "^roseapplepi,.*":
     description: RoseapplePi.org
+  "^ruiside,.*":
+    description: Shanghai Ruiside Electronic Technology Co., Ltd.
   "^rve,.*":
     description: Recharge Véhicule Électrique (RVE) inc.
   "^saef,.*":
-- 
2.55.0


