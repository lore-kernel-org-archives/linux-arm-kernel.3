Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91B0C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=; b=uPtC1Kl7lX/b13jlcX1Eg8UWgr
	RXZtR/jOzaRYAVDeqyysz6NnI2SmbzQhQbAa1eO1HoquBmnrSRVpcs9rax4jTsIvJAr7m8eO4jB69
	aOyATnqzylkB6Z/LopP0Mp72Y9CU51u7t7qArqnDt4SdUYeHbzvU1PgwqwBDCmYp25DluQt1+jj0S
	rs6ENh40YrjrryeGFUxw63CbFktFSdrpDevgFUAuIYxb+eIq0LG/AVGGS3ckS9bsD2REi3+W9OS9/
	Hze973mFm7vWZD9fuSfc1HmmpvJ7BqfmbIUdiZDg2LlPJT5M3qt5PP1LDWw3h8JMHhKc9AYTUZUKk
	stZMURXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QD-00000001Kuu-1yjM;
	Sun, 26 Jul 2026 16:09:49 +0000
Received: from mail-eastus2azolkn19010016.outbound.protection.outlook.com ([52.103.12.16] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Q6-00000001Kqo-3Xju
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGzpgrdrHL9ibIAsjaoMqww9frZtn68BvxwlHlVLGYsB16BVsJ5FybAirpMECUzZcTZy90zsss+QkmFd0oVEs4p9CotsxpJb3E4UT6+z0ciLN+ymBXQqXkAnDrm/yBSaflO5JnGAYEzP8TFw9zR844xSyumIwl4/FqI8+SpjhGfPkOv0Ff8d8/Oqrjs0aUjKkwEwZYO2Q8LD+EErav2qDX0J45L5spXQHm9b3QHLXrKKqDB8VUelDH4/dwJCua4S9xC4QFq/dcf6FKZn54rsEPcsTiSHZS7AUk1LAs4/qo89DPCqLsaglv0n1we1CoIjNt4VTA4hePwKtA1y6Pl7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=e05SKgbhCdnkzERlZO6kMYuV5Ic0Jn8fXQWBTKW03jtyn8kGzF+BQisA4iRgOkdWPLuSfxynJHlVqJ+8SJh9rle7b1EJ+fg7lbGplWxsfQrL8MMwJnNFFP0aTHMKo5Ugw/a6F9Q0YyGHbHKfkx9HXs+iOu2msTAsV5yBJuZ1I7cYRB3ftyfywEN+Q7pu/WVaVcJWC9fdJBmKRgbxXys4RMtsK2wM5sQLuqUeArLGf09iLXGyuoKTff5L4AQYlp4whPWnULMDYbt6OMS4+BfyccaM8Q0UhKelmcn9UsQx5UHtAfyc30im3u8vQyop6uK5hrKAellVnpdrtJP+GvqTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=n9ptUxEIQvDRrmXO+k9/BqJ6ZiKRBFjpOVRnBdl/+mmFUQE3fP49OPeuEpcwCOOKXs80/70SGBbcNuQGx3agZa2v2sjhAV7WZX4TVgeq8xo9mrWvGPJZmcngNU5PxgkOP1tWQ4AVLT5wCl4YDaXYgwE/uYR9dbIRavjUOWcWuInALi+Ishhrrcw3NDix1e2sPeq4ZhWPoKx1gJFXiPKC623VP86renPUkvcUvCn9umjPcYcs9f1Cr2IYSbOYHeQuTYOFOiQOd6hDRJlT+eW5tdEdmO15KzzM+tEaG3QJtC40FQmLGfj8lrOhahTDCgCx58M+rVw1a9UVsqBQME8tdg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:37 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:37 +0000
Message-ID: <MN0PR19MB6091710C09C0EDA94AF12DFEACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:49:03 +0800
Subject: [PATCH 4/9] dt-bindings: pinctrl: stm32: add STM32H7RS
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <6bc28a9cd0af90872868bd420d9974ef63e2c1d0.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be120bb-d696-427b-e7cc-08deeb304a84
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|37011999003|19110799012|8060799015|12121999013|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lOESJUn7kT7o/qLzB8xC5aXEi9kFwgCkaaFLwR+LOhJh93Hg81xUE+ipknzq?=
 =?us-ascii?Q?0anrWjvsor6piQ8YciXBsuWKhHXzIZXNZPI54xpAyffFs+1nLu0X3diV7J4U?=
 =?us-ascii?Q?OyxTk8ufKoj6D/n6Nz21Y1YkO5HnJ2Q7q76QshWxjulzre+TszLKKZPOsSAD?=
 =?us-ascii?Q?j+rgLTOtFNc8BsniMCDma4S/nyxsux+gRj3E4VlIHLbjRqfG0j95iGu3XPmF?=
 =?us-ascii?Q?S1ZXWv8E7xt1S69vXZLP/4ZBLGU9dppdfJhGuy/9zeW00Vp5q8y4EG1xX0HW?=
 =?us-ascii?Q?F5GIEKSc1GBvDgIQBNYrsmhwy9z1lz7EXadJLk/oFsPv4WYelME8AoYoI1JR?=
 =?us-ascii?Q?DGRi5Eal4ycmOJSPigXR62DJ4Pe9gOPcQAVPy5rauegPvACx/PjpEvMpNpYi?=
 =?us-ascii?Q?7BAn2FPvWDIPrwyqNDIAcKoolJelPrQfunaUsDOL5g6muo63NNCPKLynURJ+?=
 =?us-ascii?Q?3XZtXamSDjdnmk2yvhutudp2hmLl0vt/VgNO/u29AtzAY0/q4FH3HHlePw9k?=
 =?us-ascii?Q?GrPZPbZIYeOy0+Sm1sUfZ3nJ/cBE6sZM5lDA+RM395o/4CP6zITYgTbOYCeT?=
 =?us-ascii?Q?E/VrM+++mlAQKjbAdWoKdDlXMjSVXCbVswOLBhN2shn+/5y5vjqdh99wrCE4?=
 =?us-ascii?Q?EcvFE06fvLRAl+cyD5FBLWBg9C0SuoAsGDhEedZxMgLRkU+qYXTmHF3jNeOO?=
 =?us-ascii?Q?5gU1ePNEGKzMtJJVZlr7fId4gfGR9pAKgGAT/MYd83+SrwwWRp/hipMvZdd2?=
 =?us-ascii?Q?0+FliA+RAHsESOyCd8moT7Tx7t3eJQL0bHVEaO966VHUJPCZOVTXlKTAkioV?=
 =?us-ascii?Q?Tyac5ShZlw8KApN7zeLwDJSfilDVy/LxHa5BmEp0ktojEznywBS1ZtsGsxXw?=
 =?us-ascii?Q?31Td10NJZt32/Fet7/ttQG93QBHXc9ZBN7m14nXy7eqqpxdRaaloL8Qwavgn?=
 =?us-ascii?Q?afjS2OiYPErioQU9sCNTbYAcPgBM4xkeRndTpRysGtkY9i7V8CmA70dQn7Au?=
 =?us-ascii?Q?v1v2udT9U3w9OByM6wtru217iA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tsWYizciTQNTdAij5P7zjHTu7MKpi58yAY4Fgbu03eeRtmgezpOVGC0kYqkE?=
 =?us-ascii?Q?EOlRDi/NQNZTVEyibwJvquYxk2lc8edc08NqR6dxYQvBw/pX2RxFlz7lo/Bi?=
 =?us-ascii?Q?a6BvXa1x7dF/sD1bVUEpn1Od86TqncHIFRaxl07/DXCpKnfZVIjwYLWWX32v?=
 =?us-ascii?Q?34qOj3kthn7IiTTxmHvEhuKoKgxBB1hyVIbJg9RyDoeecKaO3FM1qpCAv2X0?=
 =?us-ascii?Q?QKH3DlfUPD7Zg++leqvudoGpxsGRDSAJC5GP2o8O2GP7f7lfjHrLxYK6aH2r?=
 =?us-ascii?Q?bUswG3Ud/lRua5/+YAA5zGCXahO9urSlPs7U+TsN4SVg4HLXHBtrCkHeeVJO?=
 =?us-ascii?Q?0JtknBq9B7q6zDUEtZdgcqzQvFTy1S77m+eec6TfswjMkMo4jGxb4dmK+IhV?=
 =?us-ascii?Q?SEiVhG717+kev7eCTUnwppzCFBgYJXOrkEFGaQRSne0jOxg4i02BlkC0GJR+?=
 =?us-ascii?Q?Stkh0zEBI1xBzz5e1kznmCTEHajSz18+aHAyfQ9UVXfD1yAdYWnwH+PwgaUI?=
 =?us-ascii?Q?RoqX03SKjp1suojRMyY76wJsOZNTIoIIMlIPmAal9nHIAhlmOi3gD+Bn1JF9?=
 =?us-ascii?Q?iRFKWATlz5bIs9YayUs5B7m1eQ8vEORuwm6TSP/GD421PMPj8QWU+LAxOTXc?=
 =?us-ascii?Q?2m72DZ4x9O1a7+y6/4BcjEf0sxvviyRWYOTuKeDKCGVl6HMoRtdZeCjh6PXe?=
 =?us-ascii?Q?CwvprlSMjRutzKMr3aaI7aCqrT9nw5TDewFfVL3iZ8qxH8/mHsUUPHjLeKfs?=
 =?us-ascii?Q?2bzeYaxNk+bxgBzpqbF/CzU9QcH1K/vY7aMgX0KmoymsSxvqbAvsM7t1VrKI?=
 =?us-ascii?Q?JAoRkCKT65GjpSPsLgU7qWFiUrCpeflfbYYmbGpjfpKHzbw8oLbOTBPtGNqF?=
 =?us-ascii?Q?cXEdSEHGU681bt+ckWIOuzFtxkXkTrNU9Ix/dkr58E7V+aWliI3MJDBQdYG7?=
 =?us-ascii?Q?VsUWlC/+hkFWUT7x30cxgM9hFXeNxAnOPr0IPGxTjYmCZT7ynmU+vgdWecTQ?=
 =?us-ascii?Q?z3Dij2Pw91cxHZkC1ahr1M1BFbtAO7i8f8AitYNHRb/tBUAP1drezHB1sNr0?=
 =?us-ascii?Q?zkE1XwHwviLZ7a6+NoFhGUSgaOY1dmXrLrCUa9UJ5A2P4BfBmoYktPw0fuOr?=
 =?us-ascii?Q?zioAXVnTa7kpR/CgW/W6VFjHSYOEkvXY5XCWStoagu0L1v5zcmf6M8KVrzEp?=
 =?us-ascii?Q?EH72jLyNi30Uu/Soxyj5XCw4k/Wz4T5QxUYSTHp2WkR3t3KOTLxmpC1A1qwP?=
 =?us-ascii?Q?a0pQSFk0tabcm11mca7e2HAU9hPaPgwgjCVkZkGXC578ql1xRNECG95v1GHo?=
 =?us-ascii?Q?8O/VxfCbDvkHDJJQVgN0GPSRN7L0w3EhLSNxVjpUJ0x9IGHZwMOpeWhg8gou?=
 =?us-ascii?Q?jXCnTdCiR37ByNaSSQGVGesiXyeucHGvEih1MWRa9hpoW0CQ0g=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be120bb-d696-427b-e7cc-08deeb304a84
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:37.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_090942_889434_CC80A5FB 
X-CRM114-Status: UNSURE (   7.09  )
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


