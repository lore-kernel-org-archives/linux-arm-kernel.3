Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E21C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=; b=ToSJagGnYc0Ls3JCVQJ1gLS5se
	FoZpfdTEot2RZMimFb0fQZK+v6S/4ocrLJZHguA2eHT77EWe350ExG7FibSjiu+ebuGn5ugfjdCWJ
	i3XBrAegcnjffH1ddGKoE/RfiYrBS3ngLLcaEhyko0pkSvnMICVviKr/VNR2HtZQP3NalVio1CdbZ
	wxZqrlaMBPc9au5H+XwxQnIeGNlHlj8JDTwpngJhsLmjlB/fgMeTNAuJxSm3EfQ3t862Uga4F3K2k
	rFcmqgY2feBmhYdOdHupki1dOt4QnT3f8hIos2HONQpIDeIE5KUM1unMpvHSR+53iPCHSu5tMHxDV
	/mbmlEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Tu-00000001Lwi-42t0;
	Sun, 26 Jul 2026 16:13:38 +0000
Received: from mail-southcentralusazolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d114::] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Tt-00000001LwK-0etS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG4VVKFlOsnKO97elt2gxmcquxpYXCdPHCWsVzTKpZ+sq2VUK5LIFkh1RNjC34akzSycgk87LOs1fj+hoPWy4jDRvQDnaqQxNQftNMxf+crX0jy5TsgCU25y4NeVzVkxXcV6VORMDTdg3d8VEyyQVlXz8hJjhx7f3ayxhyHvVizCbHE0yeiHmOrHInnpda4A29VaCtOtMsCXk8K8yXxmxC+qCVPdqN8oHPCEzluWzfM3ouPcN6UTuTp9qJdFN4C/JqQQ9WsscNMMFhTW7QYYTpxspe3PMTR6IVlizgpoFz50d/WcSL47e7i1UB5gUHm0/ukEnMsNuA29DXOO1ueHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=HHt9nYFPCP6R1Ga3l2gSqwIG4yvId4Fw/kVMnID2U+2ga+DchsIQN0lAXcC3bANDMa1YhoJSn8h0XEUsYS4yREVTcCqE/9k6qLkf5zRfBTjGyySaSZbd634ef+XzuCTUeCUvlhCZ1Nm4ulIUyBVpSwhPxUis3fT2vwjCzyu/dKdgZAdHV++aqoKf+fqvDuikuF2/WCfwey6KhiWBvwxhKr/5sQlLG8kFdROdCzJYxGCzmDk8pd/QaOxW+Jt9b7/yoAQZg47RMwugd811CIdmJyvtzz4cvIpx3tvOhpyq8g6bWcU751lixVy9P5pEneq2bctocN/Z/2omNaDgRqFYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Fm1kqSCKvm+TaHPgD+rPCNq4jvZBRaR7iySah3JN0=;
 b=JzSqMrYKD+ILIDqrb6FEMKM4MdxnetkejhtBFPhvB/b1NeExpXFRXwrPL4ETbru1jlC+nLsCNHOtHqjbPD0YvncFw0p8uNqwaOsFBEfWLV+ifLxBZS+WVTpkg5EnFJnr6AcLBChtwzlDjlRBwa8BpC2lsYClvkTxv5Inv+55bupxpoD4NfYfC9sJjzZ0S6vFKqLhpbG5y/cd0OwmdGIikK1WbYXsSy+eb0Xwz84Ite9VZJ25UC8CX7VW0kvnU09jm6TmQfId8NE1nAaljpeUWvOI1cQjBRw4ZCeYSegUZl456baXKZe5ZTpr4jPYFJAZyoQZk/Ss+1tq5xZJ8wUmGQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:32 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:32 +0000
Message-ID: <MN0PR19MB609180A12427D3AA67177D14ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:48:40 +0800
Subject: [PATCH RESEND 1/9] dt-bindings: arm: stm32: add Ruiside ART-Pi2
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178508243480.28466.434379008392120467.artpi2-resend-1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b9c98b-51db-4ff8-a505-08deeb30d660
X-Microsoft-Antispam: BCL:0;ARA:14566002|2604032031799003|704163111799003|8060799015|19110799012|37011999003|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WSlVJ/4A/73F+za6ftGXAoYcxwno6371a3JatMFefj2GyZOkAAJFId61YH+?=
 =?us-ascii?Q?0VG9H4Er68JpTBLlQUs1ZfEhNhHu2TdQSu47xDzt1NaVPUcrVye7cr6txyxd?=
 =?us-ascii?Q?ywpUFICVQyX++/ANlmINrUwJC4cxieGWYDNtYUkINan1O2sI0S5JQR7D9qHA?=
 =?us-ascii?Q?fXn939iGPdyQdRoDPtNcY+GLfyf0yH1CNHd/ITrL1Jf6bsQo84IkWUhZt2Xa?=
 =?us-ascii?Q?cm5pWL/CUW2uo++3e/OfT48ck4W8xFbdbEzwDW/s9aUrd/BddBl1OgFiohwh?=
 =?us-ascii?Q?R/nITTRKtEJfgIiwHuWrVJwOuptmQGfKk1hjgv7IqBNDjxiC6ZpEIYeUrOUe?=
 =?us-ascii?Q?fsE/RJRN7rxKv3csOGAeMP8Gt4g8VLUCt8p4GC/6C4e6I6B2vA1XqL193qyG?=
 =?us-ascii?Q?fLQKy9NDMVmfJLX5AArHWeOFY+2Vy+/fPoH0dIHILcwdX+sLsdUIEh8jN8tE?=
 =?us-ascii?Q?J+oCBC3nKe/urrBTjR12LUJEanOY6uKD3Gsjs79fqoUXWVfMoJkK1Iuy/+mx?=
 =?us-ascii?Q?Few+WXvA7MSNjjzQkSud050m3+MX9GaanDpx64gXIZ0d4g9OZH51hE8XY5eS?=
 =?us-ascii?Q?tNuCODKCxPWBcrf/hQ4cbsmdlLQ2b3/Dafpk+LpOO/lEU8NY5O4WC3GZYkXF?=
 =?us-ascii?Q?GPutImUEX42BVaWfSfYDwAemz9jw2v9rkEON656MkVJP2mdjBSl+MFP2FR7g?=
 =?us-ascii?Q?5KX4CQG/3maOurEsNh9BkBknpFUlY+X+693NYzMsKgWZ7j+3MJUXUjav/SPX?=
 =?us-ascii?Q?86dNxy9Va2q6akjCdBoRTwS3SjS9LXl4455v8xxpEdN3eJYIxm1q5Tgny5pf?=
 =?us-ascii?Q?dBEzEuFSaAmD+Vccz79PHTtOt3Fb/DbcfjJ+5ekXUUxRJRnK5UML7vm0vi/r?=
 =?us-ascii?Q?NKMHUKALeN8HgCo79qqVb+YRX09hppmL9cNBPnjaliF7DazUXZuVJjDnhDCb?=
 =?us-ascii?Q?Otf3nh3YpxBj2Srp5VWsAPoInKryLrDAjymtqWvCWwyGJO8sSY+Iwd4BFUzP?=
 =?us-ascii?Q?AA4O6j4dYt3zMPjDNgC+z0Z7tooNrDly4mJoiHi9izvyiAKeRviLUhg4fGVa?=
 =?us-ascii?Q?8CZv0IGvsy2J23P9EMdj4a4CSS4/Sw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0cqh4XcvnNuLynTm0WEbraeCn1A+dZxQ08+WfU9Y1BM9cm0sKxph2IkntBQ?=
 =?us-ascii?Q?oDkzD37TStVTIr3QM6EchuizrGbi/rbbahBKbAgNh0Bd3qKI7T4SykR5eRT9?=
 =?us-ascii?Q?t2b3b75PtB0gUQn7GfgYMWrUaVayWJ9GExAny/Zbb16wAaGCMLvMwIDqs23b?=
 =?us-ascii?Q?B7Y4bGYPvB3hpATcwl9AHFfIkoyFD/1I5HJ9n7X+A14VQu+bPZnSOV94eBYg?=
 =?us-ascii?Q?GfFhooQUJ9D7tvNopTJ2Kg9lFwCGyv2qi+aBh8ruMuUyWHQV96tXeU5Iug/+?=
 =?us-ascii?Q?CrqBZsfM6TI7568VG9CXVMPeby3t5OM6m5TCNqPTU5W7neTtbGNeX3eyZnVB?=
 =?us-ascii?Q?lA6NlXdhJajhmY5+LATpqu1NicnmZVpG58HXz9L3SE5Jf7g4Pfm0+9kVjIG3?=
 =?us-ascii?Q?AOdqql5o8JTPqE4xaB8lh+2HddGoBjbAuMGsJvqwq/UNqM6yTcuATEqv2faU?=
 =?us-ascii?Q?AVQbeul4b2qEM+JwNYhvdAlDM6NBT8MsVAlzMLUY189a4aCMKEs26Yo606FR?=
 =?us-ascii?Q?5mrrKcYY9v4rLVyuf7Y+z029qrOl62poqua4+koPBiE2SdPuxDTAYKTua7Ux?=
 =?us-ascii?Q?Ayb9E2yVJUJ2IWiGehoKIUtRywSwEMTTxJOZHNL21ww2iaZ73gbUHEdQurqe?=
 =?us-ascii?Q?yZTks9UyV52JSHUf3HFn81i/HjUZO+cesTpJxQwapOmsusMCsybcSpjOnIOG?=
 =?us-ascii?Q?XO1OyCPsknPyheFLiOFcxWQVjbhMku7UQ0dmAtbagJyjM2leLF1TGampipmi?=
 =?us-ascii?Q?4yipsYzhlfOscWXR6DRvtajakDoTac8Mlvhrp+Q9BB9B2UtS9gVUHr0e5Hia?=
 =?us-ascii?Q?854MO0e8bTdLOdlajNMiE1WG5OvwKdQ900KLH8UPqXBIlLt4Gx3wyyP+HDnz?=
 =?us-ascii?Q?OOHb+S1mm+lXdxNrILhHz5UzXKySmLA5YuqYS/qpRLemt5VE4GIun1Bmr76e?=
 =?us-ascii?Q?cHuXaC+5fRBF5j6CSKW9AR517KPT5MZ9lP7Q/OZAEDAlEdEDiKkvJqYHE5nF?=
 =?us-ascii?Q?eC8fPBKYxgoHOHKKw1WGnJoTX+D9amMuvU54HnMD7GfjbymnC5jgNdRBTilC?=
 =?us-ascii?Q?9K0oFblAuDQ6/VeOJVz8IstcvwSKnWUIjGkAj5lmMRU/LzLZSXGdnhq6PKbn?=
 =?us-ascii?Q?rqtl+/u113yjaDxGVudpUPPOobL8mwFmSWMQP/XVkM9vrd8ZPVz3Elh3c6ni?=
 =?us-ascii?Q?wHlY6ALgIqHByvtz4PwI+pO2izY8eQ4GPofbUMqyRLfyrzllbNvKScFUoe9a?=
 =?us-ascii?Q?zH+qp4dh+OYTzdiHkrSjEGdKfi2LRf28uVrqAA66onVsoJeYEhNtxqvXlkvy?=
 =?us-ascii?Q?JLzk51ljLbldmX6wSC9M2e3Klp7cETIaijtxLooR9KL5fFHRDgS14mh94cIk?=
 =?us-ascii?Q?281cWbfwO45+67ZxAzFMy0iKyMng3cFngcFevfzCJGK1mt3asw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b9c98b-51db-4ff8-a505-08deeb30d660
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:32.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091337_195420_6FD1A9C0 
X-CRM114-Status: UNSURE (   6.98  )
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


