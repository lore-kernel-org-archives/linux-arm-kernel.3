Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CC8C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=; b=eaZOQ+UghgB3IkrQJ2+5t6Br4T
	N4Xv9Ngpxe18G8GW+Nmt5sar+G25wL/HmQPZLwT6WcST5UmeXi/UvkA78DVoULcUMHJp9pp2lYXkY
	pbeAc7BAj0Z1nIAlPLSU2a/Cw2V5XR7K7rkOO5H3VHHrOdL5ItPWJV/hz2JruHqOtpazzp34i6Qq9
	U0FyE3oyqc+AVYBgcBW8a7Yp+SmHpQOdxsztA94CAYJUNjI1eL8QD0xPoYDziUo2bqy6diQPbszbA
	1TtWgvzGjop0iToLKxsfGrqr4qJvr9DFW63aWUfnb5WQKf0T36UaewYlGpw5Bh+lU/uiKln0R6hPq
	ihYcGKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Q0-00000001Ko2-0Sly;
	Sun, 26 Jul 2026 16:09:36 +0000
Received: from mail-northcentralusazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d111::] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Pr-00000001Kk4-0y0o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slrT3C5TTInq2bxuUnO2jNQQ/b/e0WwoUg3+cVfYdQHJ0QxLpiV6flZfe6O2LvkemVWEu8yrC0+2ybwfKJTGv+ha/bhYZ1G49H7mTLvlH3RkRXFUn25tJjd+3dnW9S4fRKnWysxb74ZU0PvKjnMjSjw1dVJqZoZvT4oxaiqrnQ6En70ARufj/TwIquEPqvsuP31cCDrD/KaLhlfvbiyb+KHNqWiLgd9PhfVJYHdJkvNDJ1svqycyJdkBrRCC3g8Q3XVjFbUzpT3bXmAdF2bnRG8pVlJPdQlHCO3Ao6sDvLjEOwin/nwXLq3ONYC+Kp+KtqWXf7ZWTSGTUPzKLFHnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=f3ictDU4Eukjri/UaZohlwmfWrgmTtqxc+EYQ3V5l22QXzjuZGWEBBcxY81uDaubO/LD0KXJ2ERDgQDd0fK7JSnHHIwuNIRsmNEnT3+T6q9QGYC24UMLXrroZprF7hnIjea50Bph98EsBsoo1bTnlF/VtROK/eucjj1V0H2Uxnq62yCcKyNSuFeo6FthWb4aNxEWcHVwO4Oz5fUhfmQw/vqfm8XniovrqVerEdjkOqNButEP9YNsQbwGS6TqrfAYOS4V9JkZ7Q6rE6GwkDSrb0CQN9kEh5EIl3HI437gtAMkA81zBa0R7eq38lXIEntaP0kXAUemJN4cMAYXU/pd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=SKPXYOMfKZJkG0AYcLYxdobTO418ROnUy8mdEjnXn0Cs11/DWtsZcpAeAqNCR38Y1y3xBt4ApsqbxT2SAxMPpkQXyzjymL8un11AVejxJTDwZ7R4dCJaefXUcofyOTivJdZTvwCGQhgnXS6H0NIE71ORaCC5SNbY5SoZ43DozsOD2IlTDhKG4dNjakYl/tWkTJYDgj6tzlbvWuSglBVHIjffxjIB3/6fvsaic7XV7kwQowKH2RtcafOnScVfjkNuN6gjFdkm2j650Fhe3fmSfZ7J439rpOUvSPC29p6/zhQY7zAFbNfEdiJUtNB12vg82m06cFOqxOYf0fKG05f5vA==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:22 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:22 +0000
Message-ID: <MN0PR19MB60910F25E60375C5120BFF77ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:48:40 +0800
Subject: [PATCH 1/9] dt-bindings: arm: stm32: add Ruiside ART-Pi2
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <5cfa1ed5da52c217fa234afd9698c33da12ed2aa.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c078297-bb13-40bf-6b69-08deeb30417d
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|37011999003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+eOnP6jIjjMJ2LsMieSJTW6Y732ECBtHF5ozW5coCOtmSDVvdzA4o3sRDnrz?=
 =?us-ascii?Q?Z7ta6U0pR2Hxn6xb18iHOAyV7twz+NDVKfASGWZ3G1lIG55m5T0qC6A4UNg7?=
 =?us-ascii?Q?P849Lq89ROhdUHuu9gJKSrPs5o/uQkU+UFTME3YxgckdrRCdkRzIG5bQViGT?=
 =?us-ascii?Q?Qij5FfT1vHM4VT0BtFM1fk/ymRYtkSPgScgUMR1BE6Z1f0rGAY+x0WY5Kpcb?=
 =?us-ascii?Q?PMd6Sc+RPYyp48dXqrx6yfIzBP2z//n0PTb+hm7ZMtn71kMJHgIRPrX0/S27?=
 =?us-ascii?Q?Eg78oDQkG2kpGSrHiTfDWbWKQCz+SNHf8kAaFYY/1x0VRqoFvDrKVuOovAEU?=
 =?us-ascii?Q?PqJcC73utxnoGjwwztlOCgYhGjO42IvpfbkqEFwpgXlV43Ud8TfRV/M8RpNG?=
 =?us-ascii?Q?1jYuZYQBHJ6TymjiVhqgvultaZW8QU6hYGqLqlhWjlA63Y7uLJoJWP6OVzZh?=
 =?us-ascii?Q?d0ERydmjGpoqtO1HPZxTxg9AEVm0f+9FphooMnC0L89WWqxkytnAIv2YeJkH?=
 =?us-ascii?Q?/gvMSdPZXga7dMJehWn2lbvek0lcWZGDvAvAK616eteoO6irbn8y7EV0zFIn?=
 =?us-ascii?Q?ucRIkPjWBJSMiP9gWGQxnV2IrZgY1y16u5OrUJSFmzMWoZp2n4I0JjHIjChQ?=
 =?us-ascii?Q?zutFUVmw0h4qFE4fEWq1pjOQERdtTxzRRc+tJA/9UT4FshiFt/+1zmSpRvVB?=
 =?us-ascii?Q?E7SANp5n1xNoESeN6l/cWFgvK1mhSU6ysnPgcERVTe15sirdSMvhvSR8lxB9?=
 =?us-ascii?Q?hrjjKfjDh4A2rZ6s8iUzfXhbVipzd+3SYmOzJ1BmZsvq2xkcnA0NsZUE3JnM?=
 =?us-ascii?Q?kVg7dAR+goE1jYb+pxgKot38lHkIhvNLBzL72dIvOAXM2EVRm1rdbFqSGmCb?=
 =?us-ascii?Q?2M37ygWLoP7THIE+/dD3fSW5k+x1/x+YE+tReTK61CsyfwfNpZJVl7ijUCZp?=
 =?us-ascii?Q?e/WrDm0+U0w2Din/jXAAYQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?el2r3yO2p5AuOug/J0tXq1qTMUrJZA4EUUIdK1jl/Iqzv4IRngr/9xOBfv3Z?=
 =?us-ascii?Q?vScm7540eduKTSq2kaNyl2ZxjOZxaTTTBvm9JfNFfDvjmAIYKnaUa2sqLbjk?=
 =?us-ascii?Q?Y59dq0AnmBmkI2Wl2GuH5zYamwQnirFta4YAy6u/IldOFVsdzdRzlI6Z9cbY?=
 =?us-ascii?Q?VzHoC3XNz7c6YHxD21EsT6pFXqmP23nKgQaIzwjK/DrPrCkALPI+JQDBzGtI?=
 =?us-ascii?Q?wWoPenwU/BqY3OMhytkZrrKzVODK/68b6ZhSvFGMsVFX998ymBv137WpJsB5?=
 =?us-ascii?Q?qlzTRoOPXr8DeujMKsLts0u5DWcNFec0jUqGBzzKLpaNc4/1H6KGDdoXm325?=
 =?us-ascii?Q?kktv0NCttz8xbHXAN9c/3rwaUYsvyGGz/CkhQ/WxvM8MjyYXg8kToNv13k+9?=
 =?us-ascii?Q?gZ+Xzrbl1zb0UiUQgYoFvU236q1T1I0UD/Nlp7zQ94dXdMkC4QeirbKKikb1?=
 =?us-ascii?Q?NdwOY8cf8QO57PpjmLS3wD6iuoMo+cL1kTLRgFa4I88JunU6zDzBs8TtTKWq?=
 =?us-ascii?Q?vXlSOrGHCpof406lSG13p10IcBhMi09PW++1obqAZTBuAjtkZG5e5/e9g7f4?=
 =?us-ascii?Q?5KndYtQzAGIs8M83qLMJgrzpAqm+ht1qRO5sMXQ5sB6vuEmhwJVJFwLpXRek?=
 =?us-ascii?Q?gdKkzordOzYGf+jNF/xG5Mv1ix+N3A3+TvMJ6fEa63ndrUSv9WoJSpHsG1Lq?=
 =?us-ascii?Q?nNWJurvr6FgpEm9d+9/RwODS5qd23Uka45JN4oj/fJmkI76qRho5iMAR9fm8?=
 =?us-ascii?Q?0xi7taIQAtSfpHcdBu0D7HMG5CLLtLkyXKCx6L4r8HuX+5bu3eqI354CKvYP?=
 =?us-ascii?Q?9uK3EBoRjoqVlJOBhFzTtcBFHV6Qi8FUXFmwkTen8fN/Rr4Cn9z1BzTgBwXx?=
 =?us-ascii?Q?W/VonQYyR3MMRDVbOWqE3dVyQTfhBbXZOCmn0ezxoRu8PEtzNGjXLfwyrFNI?=
 =?us-ascii?Q?1kSK+wr1FoVFqH8VSHHLudKZfCcm6YWn4C83raoPETx3A2TP1JuwK6AGFeJe?=
 =?us-ascii?Q?d27FEefoKfRqqJ6SS5n5IPESWTAXvKUpBnxHVjNA8cWhuGKRk7aMzLRV+9dA?=
 =?us-ascii?Q?obv5z0fiVmnMFiEl7yC7FYxFRnp635QKuItows4uSQDjU/oRFKJ1/PvojrKF?=
 =?us-ascii?Q?+npVb7wIVq6PkNmKv5W5RE0OjBzbkS9jgWJQGo96ga7y/d+9nDfskrlzWbAf?=
 =?us-ascii?Q?vnl8nVMFYvSidFBfZin4lRvaCEK1tuTyDkgb0m1/PcVsg8qceAJ5oLRoCSVa?=
 =?us-ascii?Q?imuJSkju0RqQ1FDKu0LRmlswzDYpduMWG6NpZQJIl9eFvwsaJxi0QkAG6hSc?=
 =?us-ascii?Q?nzZX5m4r/oD3x2FQ5RTKjF/oTEyU326Q45e8hV6BYf5sC21CbLPSIQStFSbE?=
 =?us-ascii?Q?GmNhTTqMojclep/LVSqvW5hdAM+8E7WoVejzgysnQas78iiXdQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c078297-bb13-40bf-6b69-08deeb30417d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:22.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_090927_271141_7BFEEFE8 
X-CRM114-Status: UNSURE (   7.25  )
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


