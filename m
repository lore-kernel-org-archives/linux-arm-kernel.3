Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F1EC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=; b=lGycA28oJwNygAhxVNZcd2OIvl
	9dR6YJVo57yk1gXqLo0XbqM52rxG7XytgUS8gAV6pl3AlY4ELLmn0V115YNshtMHgN0JEaUEhHJ+2
	bm6ZYRwDhJZEvn1HC6gIMvfIE7LENMr+Bz2Sb5p2uMA0jXf7zhXGtmLig5p8lHqM59abPJhzLVm1A
	Tm6tEb+pbxL1ZMWOUv0Pm9CzgqlNjlXYAywkDdztFCVrg2xuA9xgO6mNNeHT6qsGmsBZa/A8On9Qb
	U41E3jvEAnZgYvEEiuQoq6k0SD61hxhPykzX4JDc6hBdEZCqRr74C/TyNw2ZkyiYzQVrUI1TdH8YO
	yWobU8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0TV-0000000ABJp-3j4g;
	Sun, 09 Aug 2026 10:09:49 +0000
Received: from mail-centralusazolkn19010018.outbound.protection.outlook.com ([52.103.13.18] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0TP-0000000ABFW-3Zhj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH7iJuYszM1e6xBhABTyznzDIpbljORCJ7rLXAuIdCuodSbGBfnUyC6dr1e7qgI7GiC29+ZaW3cLIWq/f3f9aHlqiNhDU/MhjFgjZfo6vzMf5LO0c51QyzZq2cAovnqKdaLrJ1W+SPJqskgSZNQFpv7GW9WYSWInl8OIObWC92cGgezIszeWPtPwXFa9F2Bg2uDAHqjaGM93h8FJaY9sz3LZXYqUGCqI8wX5DWaQPBmIwLy1PG7qg7mD8aBjCuedZsaA8Ic3UJHJSKrZe5GmFbpf5yGeLGBoS0ENWgV2K/biGw5+JCiuEgFA1KmPUGzvanP9oBfVpMlcI881eDSsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=Iv3bvSWQXeeKjmQTzKb//aXJ7YboLgMYD+pYIO9Eft2JW+BZuodLBm94/68m4z0m25pgWNPL9EP3HLaf1JZx3PnOJ0hyOsv5AzLCPucgTPeZsS0RjW61uZQEg3DqBNDDuZXfyE/EgaEQ6e6v93l+SXAq5oy4SREFR5PUFeBc/270nsWPxl45tdhOCIaVngGvHcMCIzPg0zXeVf0IrnKEBzLH5PVpiONT9uf4NSJs76wMwZH9hhyrru3dfa+DBsmU1Gfl8fVp4hSPFhHrIMD34hA71bxWSLhqH92/QNDklsdGhWmpkA5G87YqGIwn0bypK3eJL5IFNRHlhdO66t9oyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=gLZMPJsFWIi/ZZG5dpOYO3f79BpAlt5wP32JPD+o8DaenxbSoSr0e4lKLCpV9DGlIsyfnQXsdFAR+8yNkIIP26BYHb4m5wtxdJNa4+16kRfx83sEpXTToMlLhjzPQvUhuhXJNi/gi+a7R8MO1MqeyYcaYXDtinycZDB47Oj+PyskCWhysqgnr+iXfw2b7yw4aX6TrMu6F29GKw1hwc0Ovu3+06fBNnI84jGZMvjcg2iWj3Jz5lU7Ocrfoi4+0PExJIUkyVN6UkU2Qw6Q1bdEIQaHGi2YqerDt2M6OJm5FZiSAqbvRpxYpi0k1aje8XvZ051/iHRrkVZEQl+56xa1CQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:09:39 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:09:39 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:49:03 +0800
Subject: [PATCH v2 4/9] dt-bindings: pinctrl: stm32: add STM32H7RS
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <MN0PR19MB6091D8D00C93174C6DDD020AACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::14) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178627020495.53236.17813350487839471873@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b0fd60-77a5-407d-471c-08def5fe52da
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|37011999003|23021999003|12121999013|16051099003|8060799015|19110799012|24021099003|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5VWWOIZViEZmqM8VizgVvrimE9jy05kWm6Sexo1+i05O9JASsYoiHPsSwwSE?=
 =?us-ascii?Q?gTsWDtTwZVeS1QBnkgIBQwlg3NTGIk/qQ1Du0UGhgkJO5D8QkTKp9xb0D6xj?=
 =?us-ascii?Q?PqCaJlvh48CkZQT0OsFVNS8KX3nJr1ECqBOBcvXgurxJ+uCbMPEC3GFkdVnT?=
 =?us-ascii?Q?2Wdej1KYcd+OjgwK22HhRycYUUfhH8h56Vm36WoPJmDUqmHjSgiNjE8XoZ/n?=
 =?us-ascii?Q?2UltvJVRWiUoASesCPzocTF0TF+reQIl5ULtobG4cgpVY+emzv2Tg+zsNd3f?=
 =?us-ascii?Q?7GAWK67R7z5XWU0dgav0e/icRAvwOOoFLAJDeJIMBp2anNe2hqO/GtoqvUMh?=
 =?us-ascii?Q?btkIF4UWVadfDYUFcLOShs5MwhYNGaD5TGzv0M+Aa1Cw9zW24PFVPr/1Ru4R?=
 =?us-ascii?Q?aSCCGOV85TuS6ULexKIxryZwF0dnFpDNZ6y71ZalGtLBmQhlipYuB+y9Nnpm?=
 =?us-ascii?Q?ZfM/fH8ulgG3yUh6Jn2QbO2NEgFHFoT7CAXxdbWbpfrkU55Z3/RXN+EflmMZ?=
 =?us-ascii?Q?YG6SOYTEqGsIqrFDT8r3Sobut59mPLM2IalaKb+TAlHpQcqdV+/dqYwdlIwa?=
 =?us-ascii?Q?zBU9N5E0TiHHrnnl77zaGl1hV/YUgXTS6/kqbTlhXRUtgLzu5TjQxnao39x/?=
 =?us-ascii?Q?Pq1y+qugDdA+ZppqgeD5aQHffzCcNyw+jQv5fU/LfYFZCt1VZbGEmDdZOV/x?=
 =?us-ascii?Q?ovI9p5Dm4IGUFG9MRabeh6fq7x68KOLlyWpQg2y12CZ9zqvx6oM/KLsUY/dx?=
 =?us-ascii?Q?PKgvlYvT6BDutWjA/p99Js4XaZsu3rvpTQr5zXGhB2pEkCvRVS8jCvnCFTtu?=
 =?us-ascii?Q?4q6zVfyVXwuSm+xyHJYo2Hde2WzN6bIuMwn65lrSbD56Km3KvaAIu2mSQffm?=
 =?us-ascii?Q?VZEZlqgCNPT2suIcyPRqSPj3gMgr/uNG9CuKmp++anrp0UcZDxTr8H9FFKob?=
 =?us-ascii?Q?7lsc16Vjy9rk/gyu3IpcpQb8mT0LB933dSf0h0TJOs3fVIj6uzfi1uEBzuN0?=
 =?us-ascii?Q?1qCYgMaBkA3ewpTYX8wzM4WH1A=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyZW89f3j/0p4MYKq6aTWuGQR5l2PAWI1c1kiofypAOud49cDeBPUmeBfkkE?=
 =?us-ascii?Q?6Zhx1qBrBxGHjbh95/v9D3BEmpZeC7sbPb8CHEcnqqsEiw3s/yS8rmJhevOb?=
 =?us-ascii?Q?riyPiTgQ85mU9xGzhScw+TfwsDTglugpWR31kP5ateolr88N148eUNnSv/EA?=
 =?us-ascii?Q?4FL4qzGWMu5cgYn5ssCVGfBnN29FkzgSSit9Pi9z+L10K0UhmjX0bgxX1rZX?=
 =?us-ascii?Q?3aKC/VdRhEEw+BIAFKTzysz6L2zVhVdhbrmpb0cZgAsRTiAFiPnWkp6r+O6n?=
 =?us-ascii?Q?H2N0nT0vu2wazqHHUyJRUdbd6L+kukbRPImh2IPip34YDxLyjQExhHYd8Gh/?=
 =?us-ascii?Q?sl/KSeF1mWUVuRnM8e4aVE+P9ZUaQ+I3Rqm97hSxAo6tuYjyzWbH3jbIw34y?=
 =?us-ascii?Q?Q+O5pX1vTWuFpEYlo4dehVOyTX0i90EVLx/slP8+eJQbUj8ZLfOIIEw8JAKA?=
 =?us-ascii?Q?oF/V6npw9HeGi6+4iE1AxHYqCdGkJcbU/xbqwkkhJTuXG7SEBwRDbrd8EOsE?=
 =?us-ascii?Q?uiRNGaYq7DgikzmnRPUL12ORmyJLqtnaj4Ed1+NDZP8RV7cQE70I0Asg/MLP?=
 =?us-ascii?Q?UvlJvP1fhSE9Mg7GM1YGNuSr7FVTGGxgLfTV/CVMFnjwnxNgebIpENGOPe0q?=
 =?us-ascii?Q?SEzEyRzQuErGz/b78RIhvvI5QA+TxkJYDYrTETxQ1OOZirLrgVfY4mu+1OfC?=
 =?us-ascii?Q?qYIrY4rDJBnHlUZSDcqKAxc+f9vC27AE1oVficAxlQqXFyP8Jb4KBWduaCBG?=
 =?us-ascii?Q?XQxsVbS401dRkIWYCwv0VztaGqmwmhmrt5QjQpJPgQZLdhMJsPcpm4e+vYCj?=
 =?us-ascii?Q?Ot2MBvmStLvxX0iHrnn5sL6P7Dekcz5aMEg5Y2bGbxdpFmKg9vSXxCCKwFZJ?=
 =?us-ascii?Q?aHZ6oT8QMnzhGA5G6nYY7Uu4KznNO4tI8eDIk1l+stuIUX7LPMppVoLiSBV/?=
 =?us-ascii?Q?NNutMMgT7/hNBvgiYAivtdN2/pX/EfDnOrH1OsvsSfP9KjaCb9CU9yN+UdjL?=
 =?us-ascii?Q?jEjVzhN2cVNt3nb44Qne6zWdxyvMO2OzY2FzCLZBK5SEBoNeFiHrd6W5lS3X?=
 =?us-ascii?Q?6MxMCBVuGyd+WajDCGm9i6MeDV4wLjXer7T/y+k/TBQSGAD891MbY9XMwx6D?=
 =?us-ascii?Q?baAJQP/OrizFN0tSqvwIK5PPB/kkJKtzvwGLjT1PNNMrkBdcyD4D+P/TO/Xh?=
 =?us-ascii?Q?If7ag/Ddv2FuEHNT8jTqoQV8Kw9e/9/v9lnLny0bKEebsxCIRbdHwKquIIbJ?=
 =?us-ascii?Q?wV60kmMz7hqt8iQJch0mKLFV14pTHsqpD5AYS4XPbP1jzNAk2WQdFMTrVkbB?=
 =?us-ascii?Q?gKzLaTQyY7bqaKnVfW0nf2vuNTwZiRl/Kg9fGhR0pbOE5gher+gFOTYUA1c2?=
 =?us-ascii?Q?XRfSiuEijr1v+zx7nlOiZWT53b6uXejK+GremqZfnPPqigkOkg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b0fd60-77a5-407d-471c-08def5fe52da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:09:39.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030943_902361_02E25D15 
X-CRM114-Status: UNSURE (   7.72  )
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

Add the STM32H7RS pin controller compatible. The H7RS family exposes
GPIO banks M through P, so extend the bank names and EXTI I/O port
selector range accordingly.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 76d956b4a..6e74485b1 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32h7rs-pinctrl
       - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
@@ -115,6 +116,10 @@ patternProperties:
           - GPIOI
           - GPIOJ
           - GPIOK
+          - GPIOM
+          - GPION
+          - GPIOO
+          - GPIOP
           - GPIOZ
 
       st,bank-ioport:
@@ -123,7 +128,7 @@ patternProperties:
           to select GPIOs as interrupts).
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
-        maximum: 11
+        maximum: 15
 
     patternProperties:
       "^(.+-hog(-[0-9]+)?)$":
-- 
2.55.0


