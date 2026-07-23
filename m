Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA4C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aub2XwzjTiNskuDsIXj48sJ1Vutboetzr6qDC0R31Xw=; b=d1qJOPqDr8ZaPhNDiQ3ptKlpaT
	ZRq/5+5azuMpA+SkCDKAVghbiPjdxbpnx11vfu/odv1JGvjspOBDRLEhZdtbep0/NCs9/RYgY4Oat
	uwwYvgpoMbpnzu2p5IJH5UagNaZo3YzJoJ31jkFWiNP4/YTBobNtrxlnB8TVvqbftme1TYtahpD0T
	Dlsfqfr/fZvbDlJjRmnCBtzf/OapYne/WBBY5z6gG5N0E5j2IcG2X+FakD4lBgXiZBmGUAfNwCow5
	Twc04jh/yq3U4hTR+dBC/TQfHimp6doHRFa6o84y0X7hevgKVH9uQESu81WpCi1RZYcVMAISD8CXx
	EEFrBHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0T7-0000000AAwW-3fgC;
	Sun, 09 Aug 2026 10:09:25 +0000
Received: from mail-eastus2azolkn19010020.outbound.protection.outlook.com ([52.103.12.20] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0T4-0000000AAqt-2GkE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Osi+sZ4JCTO9q6TqvUNNZpIYV/uIpboPk/uMgHfW3AoyYqztl8hCWgxTJw2zSVpu0HNA8WGd4Df81kDZpuHSt6dAdRJ2WpTuArjneQBwFhjB7t+x8tNqd0qkm5TADnL5Fp+pJBkQLGMK8bl76mgllKnVkC7NzRuRdvCCC/HwMs9l/ZsfLykHMHVb3Mip7T2YO4p3Xa1GcVilENjGTkLYlot9PvLqxB+cq8OZh//GKh1J7zzufz50k6AyXTJp8PwP+qEvNxB/0eGkKyaRCmAp5glrx465iW307bUDbEUn4ASu/PYsXDWFQWBDTJsY725UnwBzJ0Oftw8isTZb+veGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aub2XwzjTiNskuDsIXj48sJ1Vutboetzr6qDC0R31Xw=;
 b=RDGmlTUZdo/exc3tbe0TYqd6ArfTdZaWNdXuFjA2Z8N1bxbbGYSGdMoK32DX41BOpoidGrsngs28q8bNcrtSxuK3qmVkWbmjP09pwb0mYNUoZLS9uGPrncMIjdlPJ/94wRdoMTGP+zlqkW65gT1/IB6jj/NuDU+UtPr47gBpDVafZuLbboyal9tXUpPZEbIqpyUDAEdeVmLDSEJJ+ddGLpUzX7m+iWQilaukTs2QIX5iScYz1da+J5E9tx/9TZpuSVkuBQcFbFOPSVSfGfshFJeVYmjZFp9cxX4BQopk6L2zppsNNeMvdLRyd5UkoSoKL4auXHukdmA4oA1wPqLxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aub2XwzjTiNskuDsIXj48sJ1Vutboetzr6qDC0R31Xw=;
 b=LN0E7P8OJtwyWX/o2JyCruNmneFZkfhowJuN+kL/X6iJVAZNLB2Hwlz5cbFo29WxWsrr7jIJEqw8cejJOLse2fQC9PvWJufoLUqK3wuxn7hpQcFLwZpA92tmA1c33AzBVmGQq1s4gkiTrvGS96W0kXQxEFqEj9c6A9r4wTpw6y8bAgFWz/zHz9yRopUtcBAObGdEf8bfkwBV91Z9W0AhViFKesMea+UCvh4okUD3SsMWPOQpep9+m6HIADF9i5pWNX64gB4byloc3iEByALvrV7x4CfHdfmPmYkA7K4LtZ6utDmHt12tmBG2Rmvmt345zmJAo+NHsp5Gg6d35lGbBg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:09:20 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:09:20 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:48:46 +0800
Subject: [PATCH v2 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev
Message-ID: <PH7PR19MB6088AFA7804E27BDD3F00C5FACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To PH7PR19MB6088.namprd19.prod.outlook.com (2603:10b6:510:1df::20)
X-Microsoft-Original-Message-ID: <178627018290.53236.16415746725122032087@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1cb3c5-7e35-4788-04aa-08def5fe45de
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|23021999003|8060799015|19110799012|24021099003|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: y6HXmmI3YpLG3c5upVBDStMrdIDV1MjSgCq0du86Dd9blPvrvraOYMM+eQR38JBMkD9wNOhnD2rfm/V6ZSqa+dHsCdHbkFz7SARen+sePPQMQcoTZZTxGmrs1uKPBllNGY+46XXDQT4JxvnET7d9N+lMr5LuqW4h5R+noO7U9YtvYwueJ7kI4aVLUVrnHiZ4ky2oSwR8FUuM2fYm/ylE8AEcOA8m6jGVLicca5ceL3CjHSBPe+Kx1SONc4mTgSwUMaWrxEe29AHQed8RkvQvM4aEzpKJS0D7B94QfW1PaJ7KVOq34b7neHf3uCTIcexWFTnyWdkMC3vB+MjTyx03hov1iBr+FPir+f61PYlbxwqHv/psa4N8ufwao1iUln9Ah+6EencVs78n8u/HBJF0lIIhrSrc4qoSRo3V6JOMMWKmq1YfQ48Cs6LUBN9tHV8os+15o7g/tJSE/atmeONev4KYT6UWLi7rdZS0JCTQ0d9vlclp8TM+TOpQNsG7TLCIH1cGx8NwUlHDS09n/d29lOOJGfUCJlaP0kSL5ilYSLP2ISt2pFrL2s3uPEw9Lla3DVD1IuUSHyTsiaNBkN8t7OIF3e698bwUoPSi6O1egHuLwujbMU9z7t4eN2avDGY0kAoDCbc9rWbG8ZtTobMsOG98qqR46oU3w5uw5pDxZF5KeTrZ09EULO4Ew30JFkFrnXhTN4AS/CE/LiPJT9Ts1caWMiRYv+SQ4DEhZmoZXI4N5YU9o/N6rDo4HtMuZ1R2jPMQn4BAN0hy/+5310rsvzwnnS6a4uY/p1ZSJmBGw2BIDrl/5rBNBJkY5yqXQn/nblOWWYCv8B7cyd8e8RbxolMBnN5eBdjhxZE3l2IRpz/EbuXJ3pjT/kXxBvNcHlgv+XtTuyuS99ZW9iCwI/VxU02H7DMfXXPu/mv1YgP2FLcgbe1MIgUKrqGUwMJ7Kol8
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qRH9CpM4Ak8q+6q2cnsq9F8qaiQ3Hr/8du26Fo+IrA1HCb909JPSDHbox5Y?=
 =?us-ascii?Q?HrYPHyqwx7jEbXzxLvCiiJIfyGUVtznRRZNHoLRvhGWb0dEW7TtMyLssYAqo?=
 =?us-ascii?Q?aJL1fG0yGeRQhv9WL+91c8HhL14EPr7Y2a8EswF8aEJGtS0aMvo4hnJSyPvK?=
 =?us-ascii?Q?QifdQjHlKCRnlX5aRuVm11hgTp6TvDGP9SrYMqhWyHgXrmCLrQakvYj28KGk?=
 =?us-ascii?Q?8iKnoMhEbxYl3xxp9Ckeu1mKR+6xJmiIuGwMBAMz9plBbd6P8r+Rag7vH35b?=
 =?us-ascii?Q?uRea8CU5gSTXW/FiRxN2x76MVl4rE2DtiHlg/dytdq5M5lwSMlHkZTfON2KM?=
 =?us-ascii?Q?znQM7H5AfHZO6DwJeT/QdAeLBip2thML7zoXuGBTcYQ6sPeUwjPAWcIuqv5T?=
 =?us-ascii?Q?iqDBHwUzI+QE/yD9gKMxEHaPlsWH5ZkW5vavzzHeVQYLMY41iDgrPNdXuuFX?=
 =?us-ascii?Q?mn1EN93BMhvFLd6Ki+qgoRfcP/F2r83DQft7/qWDJCXDD0A0wVh9JVpS0MWk?=
 =?us-ascii?Q?A3byoaHzPe9K9QoewZLvxdSEZMqKrH21cv+zawrf8ZDTe7pDDS3TPATusMG4?=
 =?us-ascii?Q?U+WhEljd13NuCBQoXDrX+cv8knTv39WaM5gkWDlF0o2lTxH15sGfkUMs1Pzu?=
 =?us-ascii?Q?JIgMNy+MwZAkh2TnFwLXSt/ZlYNyT5baZZazb4QN5Z5xE5khaldFD41bb3mK?=
 =?us-ascii?Q?r0MZeVi1nmDmfeehaZjSNKEqIeL9Jxu3S66fLgJ+PQFx6w1vEfdUyvQ+DR86?=
 =?us-ascii?Q?CZsT13aB7E1LdUUmL05pXhP8RDM/q574AoRdj3H+wp+9WMYXKqJTawxCTPfK?=
 =?us-ascii?Q?/P9zg+l8ICoSmLLPhsA5HUkCiMuXtzbpUl4bfQAfhh+y6stdnuoN+36MMoFW?=
 =?us-ascii?Q?RhnSw9Z60wguTae8hDRWkw5/mzFzxhZ3UgBONsV6cALrfyjExyY3tyxG4nlT?=
 =?us-ascii?Q?LdllBngA6BR+HI/kuH3L0PX/XCQVHXUisKe7UA8Js16GLu0WvE7rJLrvYNy7?=
 =?us-ascii?Q?vH8y/7om6lXbDJca2wI0G11bBvW6FD9AwNm5HnjvHGrytujw57n2UNwildnn?=
 =?us-ascii?Q?w48/yLB5IAWMSwas58Os20RXp3EPasZmwpWEE9JPjpbaKOiIkoSuJVXDAWj7?=
 =?us-ascii?Q?DC6sOi3NukVvMuzO4eS3/IHmlNDQHvRsNL0SQfYgeInuW6gwET0nkvDMzYAj?=
 =?us-ascii?Q?B9KVTgjeXzZuBd+jSYp+d2MAX+zcAL+t+jyPZWs4mlrUIQyVtxvnrOeaNa6M?=
 =?us-ascii?Q?2j3fPzI4ta9ztsHZxj2IQjPqp+wwt9Ko4pl17REmETAXSp78pgu8OCHgzkDb?=
 =?us-ascii?Q?0neAawWs6y33Eag9OoYtQAA1Gi8wO3IUfHEhSQaZLpvj+srYTy07CpPXrUiL?=
 =?us-ascii?Q?nHwyEMub5UYPZ/0LXue6uz0aZpToJusDOBdbsob5CEwDMlfEEg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1cb3c5-7e35-4788-04aa-08def5fe45de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6088.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:09:20.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030922_596667_93242178 
X-CRM114-Status: GOOD (  15.98  )
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

Extend the STM32 RCC binding for STM32H7RS and add its clock and
reset IDs. First-stage firmware configures the clock tree for
external-memory execution, so Linux consumes the active tree and
controls peripheral gates and resets.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
Changes in v2:
- Give "st,stm32h7rs-rcc" its own standalone compatible (drop the
  "st,stm32-rcc" fallback) so the RCC node is matched only by the
  STM32H7RS clock driver and not by the generic reset-simple platform
  driver; update the example accordingly.

 .../bindings/clock/st,stm32-rcc.yaml          | 73 +++++++++++++++----
 include/dt-bindings/clock/stm32h7rs-clks.h    | 32 ++++++++
 include/dt-bindings/mfd/stm32h7rs-rcc.h       | 11 +++
 3 files changed, 102 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/clock/stm32h7rs-clks.h
 create mode 100644 include/dt-bindings/mfd/stm32h7rs-rcc.h

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index f83a6120d..b512da6c2 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -23,6 +23,7 @@ properties:
               - st,stm32f746-rcc
               - st,stm32h743-rcc
           - const: st,stm32-rcc
+      - const: st,stm32h7rs-rcc
       - items:
           - enum:
               - st,stm32f469-rcc
@@ -47,6 +48,10 @@ properties:
     minItems: 2
     maxItems: 3
 
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
   st,syscfg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -79,14 +84,13 @@ required:
   - '#reset-cells'
   - '#clock-cells'
   - clocks
-  - st,syscfg
 
 allOf:
   - if:
       properties:
         compatible:
           contains:
-            const: st,stm32h743-rcc
+            const: st,stm32h7rs-rcc
     then:
       properties:
         '#clock-cells':
@@ -97,23 +101,55 @@ allOf:
           items:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
-            - description: Inter-IC sound (I2S) clock input
+        clock-names:
+          items:
+            - const: hse
+            - const: lse
+        st,syscfg: false
         st,ssc-modfreq-hz: false
         st,ssc-moddepth-permyriad: false
         st,ssc-modmethod: false
+      required:
+        - clock-names
 
     else:
-      properties:
-        '#clock-cells':
-          const: 2
-          description: |
-            - The first cell is the clock type, possible values are 0 for
-              gated clocks and 1 otherwise.
-            - The second cell is the clock index for the specified type.
-        clocks:
-          items:
-            - description: high speed external (HSE) clock input
-            - description: Inter-IC sound (I2S) clock input
+      required:
+        - st,syscfg
+      allOf:
+        - if:
+            properties:
+              compatible:
+                contains:
+                  const: st,stm32h743-rcc
+          then:
+            properties:
+              '#clock-cells':
+                const: 1
+                description: |
+                  The clock index for the specified type.
+              clocks:
+                items:
+                  - description: high speed external (HSE) clock input
+                  - description: low speed external (LSE) clock input
+                  - description: Inter-IC sound (I2S) clock input
+              clock-names: false
+              st,ssc-modfreq-hz: false
+              st,ssc-moddepth-permyriad: false
+              st,ssc-modmethod: false
+
+          else:
+            properties:
+              '#clock-cells':
+                const: 2
+                description: |
+                  - The first cell is the clock type, possible values are 0 for
+                    gated clocks and 1 otherwise.
+                  - The second cell is the clock index for the specified type.
+              clocks:
+                items:
+                  - description: high speed external (HSE) clock input
+                  - description: Inter-IC sound (I2S) clock input
+              clock-names: false
 
 additionalProperties: false
 
@@ -140,5 +176,14 @@ examples:
         clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
         st,syscfg = <&pwrcfg>;
     };
+  - |
+    reset-clock-controller@58024400 {
+        compatible = "st,stm32h7rs-rcc";
+        reg = <0x58024400 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_lse>;
+        clock-names = "hse", "lse";
+    };
 
 ...
diff --git a/include/dt-bindings/clock/stm32h7rs-clks.h b/include/dt-bindings/clock/stm32h7rs-clks.h
new file mode 100644
index 000000000..e62e5d7e4
--- /dev/null
+++ b/include/dt-bindings/clock/stm32h7rs-clks.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H
+#define _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H
+
+#define STM32H7RS_SYS_CK	0
+#define STM32H7RS_HCLK		1
+#define STM32H7RS_PCLK1		2
+#define STM32H7RS_PCLK2		3
+#define STM32H7RS_PCLK4		4
+#define STM32H7RS_PCLK5		5
+
+#define STM32H7RS_TIM5_CK	6
+#define STM32H7RS_UART4_CK	7
+
+#define STM32H7RS_GPIOA_CK	8
+#define STM32H7RS_GPIOB_CK	9
+#define STM32H7RS_GPIOC_CK	10
+#define STM32H7RS_GPIOD_CK	11
+#define STM32H7RS_GPIOE_CK	12
+#define STM32H7RS_GPIOF_CK	13
+#define STM32H7RS_GPIOG_CK	14
+#define STM32H7RS_GPIOH_CK	15
+#define STM32H7RS_GPIOM_CK	16
+#define STM32H7RS_GPION_CK	17
+#define STM32H7RS_GPIOO_CK	18
+#define STM32H7RS_GPIOP_CK	19
+
+#define STM32H7RS_SDMMC1_CK	20
+
+#define STM32H7RS_MAX_CLKS	21
+
+#endif /* _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H */
diff --git a/include/dt-bindings/mfd/stm32h7rs-rcc.h b/include/dt-bindings/mfd/stm32h7rs-rcc.h
new file mode 100644
index 000000000..2302e0df1
--- /dev/null
+++ b/include/dt-bindings/mfd/stm32h7rs-rcc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_MFD_STM32H7RS_RCC_H
+#define _DT_BINDINGS_MFD_STM32H7RS_RCC_H
+
+/* AHB5 */
+#define STM32H7RS_RCC_AHB5_SDMMC1	8
+
+#define STM32H7RS_AHB5_RESET(bit) \
+	(STM32H7RS_RCC_AHB5_##bit + (0x7c * 8))
+
+#endif /* _DT_BINDINGS_MFD_STM32H7RS_RCC_H */
-- 
2.55.0


