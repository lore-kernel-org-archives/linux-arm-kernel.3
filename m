Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE32C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Cc:To:References:In-Reply-To:Message-ID:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mla8B6oSt96x7WVbbsc2z45SVArOZIbinL9oHqT7E6M=; b=d+1bd6/pN6zINrhI1pV0SGc0bw
	DAUBrnPMh6nlJmnskO3v5clKbiF03CSU+j4gShaKON7DzWM5KE0/sF9qliROBm6xCNefcZDJPhtKV
	xSkUMzKbhqoTXjfcQlk7NrnhxkqE018lLN34rnKJCeG38HDId8zOi/dLCCNAL7rFLLveH90X4npgJ
	eOVczzCnKYm9JYnMyYdpVtz7X9zw316xxA//ZU59leojkre21Lt3YxSQ7RZVbCBlRYBUuFEMEaPaC
	8WY0oQHTwtDAdCUHkjHbUgNN77bFmw6TyWcuNHVgEt3R8/lqs5pPtWcteZwyOK+uHIsRqpEB16lWu
	LGMcejsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX2d-0000000B61Y-0Th8;
	Tue, 14 Jul 2026 06:54:55 +0000
Received: from mail-westus3azolkn19010025.outbound.protection.outlook.com ([52.103.23.25] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX2Y-0000000B5zq-1tYL;
	Tue, 14 Jul 2026 06:54:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GY56A/eq+35lmtnD5UFR/0nUvm8CZIB8YytLgy/HYKJ0iJekGiYHJJi7WMNVJLsDkT+d0kS3erN7L69B1wDvAwZSMQhiivPOxy+bPE0zUSpNv4SmOdVvPkJETzLjS5aTeZzKI4woWzVklMQrOfSy7mxn66PSJ4u+4Ueh7S9B2pizH9DyBIVFECvdsNLEwNz3SSgRFVJePvs5epIsLnE3dJMwVZUaZlCWknXSSy3JKUzC7xuTXfOvlUm9Re20Q0nZ6KYOwipzSPngoM7TgRBBfezckuR+8JrfYMtHrT9N4F5nU8zjY0v/Mh5JZwP50aAhWZ/Rij6uYX1M9CpcGLIHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mla8B6oSt96x7WVbbsc2z45SVArOZIbinL9oHqT7E6M=;
 b=Gm6xdJwak2qIZiRazUeFFXGFxqEaoLWKXIacyYuGJFGD8nZIPu+Yoi8vFvi/0MNWbc+koSVohe34mce78O0pb/jYKq+Ja3sNdDYVNoCcOrwCCWMhSnZIgeAggkluN7v9/SnG1IY50ALgk9tpc4QDOtnqlq+Z0LRu00dEToC+whuLuXFr01mChTXiBokp6rCCfHe5xdI8uoL0uzYb6EW/6WAenWRauK5J1uovtj9+zsdoZE9gsLpY3h5r4r4lUN2xI2DrGOS4MApeDIC8mP1W4RZLfNHZ7avkbBJFG6l7UDKNZCHlY8EPh87bdCsBksrthBWLwOHany0MNFXltY7kGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mla8B6oSt96x7WVbbsc2z45SVArOZIbinL9oHqT7E6M=;
 b=jEse791dQ/KfAFcwVs9d/EWmycuhrlTIH0qNrtWXBfZ/B3SCo9SmszdncOe4Twf/x6NeVGwknYQOGGylLxbg68CM0wJvSQ6+sspevRv4lY/cpFZ6Oin41isbahEuAdDAcaGdzuEo+AFjhyzG9ATyfGvXp/+iuT1Oc301NQgNNDBWXBKMhUBSlpJyeYkxQyrXistfCvM6iZ+iPqTSr2vJlzJjCw3v7jfXN6DOW7OM5/Om6F9nk2my8hJWHI4YviEHtqNnYg3CkWiX6sdXJZ8NZ2WEH7Mku7a8/1znvMQSjlC8qJSr6gqAMaaGN4/Qo1yU0gdXYaQoQBT8X/n3kLTx2g==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by DM6PR19MB4106.namprd19.prod.outlook.com (2603:10b6:5:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:54:45 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 06:54:45 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Tue, 14 Jul 2026 14:54:59 +0800
Message-ID: <MN0PR19MB6091201B6DAEE197762F6468ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
	<MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0053.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::8)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <859279188806494f90bc339968bc375f.1784012099006253.tspi3m-rockchip-v2-1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|DM6PR19MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b2498c-5da3-4955-9b46-08dee174c9e7
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|5040399003|5072599009|37011999003|23021999003|8060799015|15080799012|19110799012|24021099003|51005399006|3412199025|440099028|26104999009|40105399003|3430499035;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dpC0A8MOT+wlj08ZShvd3blvNDbCxvvFslo14iMXgiHqjzQIKJfiiq4oOih5?=
 =?us-ascii?Q?+lhYgwmqqB5Pt6h70elvRm3AyoEEM7NNCVbJcsxAYgo5fUKrbCjT4taaqt8Z?=
 =?us-ascii?Q?ZPAeOGk9mtLMoTnrNek3cYOvek8LI8UmZeDWZypOJPU6JggIYVkZo4nLlpzx?=
 =?us-ascii?Q?hu4nhGpWK2Cdw16Tb/czLYu4jvdtruh3TxHUEZUJsonYm7SqGbdtarcgkPXK?=
 =?us-ascii?Q?ZOfRsddVECe65a293XGJxBTfVUJcTJOKrNDrcJKz2CBbbZksbkVL0YiiDWdr?=
 =?us-ascii?Q?/VR8VaZwQGpLOrBI59sY7wzTMkg4UvjwXhc8/KVpVrxP0vVJIy4R0rHeiCBK?=
 =?us-ascii?Q?CcPjAIAntKSN9ZWr6L21lI/W41a5M4FZi64yLWE8xmdlj/n50LkdQJuPA2Ce?=
 =?us-ascii?Q?hFC2pv2otLsiuCOFkRIFgGJEyMDDts4B3fGQVAtjO5Gg5l1o8nnDJ9uB0wnm?=
 =?us-ascii?Q?1gd9aZmCbMEPXDADiaxwQRMY4bssh5y0CFGyKm2CnICacOoF89CxZzlrWROm?=
 =?us-ascii?Q?WbHuCsYfjL+1KWRtxcCgY0shZltMh6SNoiQ8H1yefGd10+l5wE8K/p57J7rw?=
 =?us-ascii?Q?xDq9pfVQvlvcAQJVR6yJ3qZCcQi2FLmkl+1C9ez1qe7g2DEKHW8Fn/mKJrrt?=
 =?us-ascii?Q?XjrJHDbGsU1yCpXYT/EHPW3GqMTCZUuzphBuNP+TSFaEeoPlX5VR18aO49uy?=
 =?us-ascii?Q?9a3Xv4khDsSpH91uG9L0wqHtdHrLaTqPDjg32jJv+RhyyGR5sQgQrqt46MYV?=
 =?us-ascii?Q?kE+vZWE0Dq8dytxWhzVrjnvCntlqe1tNA/XXLuMHoPXUPzboc0r0ABwdzJ4+?=
 =?us-ascii?Q?RKG2qHL9mfsfasR9qOH0Aud1DN3iDiqqIT5aev/j7C2jnplSCSv64bpQ77mi?=
 =?us-ascii?Q?owxfLkVcqYmzr5eD6jCA4kYp//8Y+uX1zRhXrte40zRFFCTCEqxsm2hbcuF0?=
 =?us-ascii?Q?0jfTYvi5KyCSV8Qn1xnYPZorCt3MSdPg9EFd7M87sFaoEuFRy8I8xaqgWAZT?=
 =?us-ascii?Q?90aH?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9H7NEcjxekHUVojnB1hUPbYkk7KIYhPoVGsykl8Ij6hkLhl6KUTV6YsXkyWf?=
 =?us-ascii?Q?ebozW2oIUX/CIT0gSGsZG/800uG7DyAR20+jF8lAmH9CNgtTuayfq3PbjWh+?=
 =?us-ascii?Q?zu/FCjKLOF5+xADRwZdDTmjtOqyZnVgfZzCavBx7hm1qwSoxZ+EQDxuZ6iWw?=
 =?us-ascii?Q?b9hMhPVTjcPKnfISBiHmyDyDMrOSvY5SRI8izHEpApoQ/+IztXNSOtPRLKtn?=
 =?us-ascii?Q?0hL0Pdr2+Roit8z65IlbWB0lftvGicR18K2C0Gw8iUxPgUYECBB5O33Xi57O?=
 =?us-ascii?Q?mjLMGmWNgNoZ+29KvaHWyHPVB8MBeHtOHouGLGtKpAR3j8SQRxIlUzziEQXL?=
 =?us-ascii?Q?Zg7AjddKHx+1HxhW6ECEfz8VFbgrLts1MO41pBhHXHnLF1YWGESx0ma8qgf+?=
 =?us-ascii?Q?zUxkp+cf9DZBzyal6ZbZF+pBfnX0oLs98wS/zqT988a7xb/S1lhfPO+TjypK?=
 =?us-ascii?Q?UrVDbVtG0mqdk+23KvzAVy7K/kIjgYkSrctrdA23JWdJPewBMcvIkU53Mcqa?=
 =?us-ascii?Q?o3OmMM+npw7WL63rq0duSo83lPEFA6tRdaBA1mGHbiU1kSBc1cHOTTTb8zE6?=
 =?us-ascii?Q?3JZ5yt1E7ULWGLlOGH4/oPQpEb353lyT9+C+0kwKEXDAZpLLpIRZG2hn4NjC?=
 =?us-ascii?Q?SYvXe3bN3Sj+L7pnOgIwlugiGwVMi+WF7zmgegrgXXpROOOjmNZ2UqG51Z1W?=
 =?us-ascii?Q?mp6Pa4ehZQCcXEUxzc6bEe+PHCXiXI/vjZX2yKpm0TgP54Gy95SuS+L+ocVz?=
 =?us-ascii?Q?Utmm4XZSIv1B5ref9vokWWtO2m3BDgzmWKYFRL3Rba8OxuWBgxFlRNSxAgsq?=
 =?us-ascii?Q?ubqLmBfbrnrmLo6RhE4MfG86XsEjP4lCuilZjnxyObdrurkJ3ce3Yrgkvkj2?=
 =?us-ascii?Q?DBBBCTdoPUimJ9Eec2bFZxpXWthlxHUhcp/yEkjwEQRRpvVZCk+ZmV+zxkX4?=
 =?us-ascii?Q?zO5su1Nz9NGc897rNDMfnx417PwSWSP+M0qdlQ+c/he804Iz49GVp7Nj6TgX?=
 =?us-ascii?Q?Aob4OhYjmfpbQ5/PgOrhmNM4R65E+B+4xibxr3tszP7LzaotlEgqTBuaJ1ip?=
 =?us-ascii?Q?Uu7udgXc5UeeMPAd93j54IN4lZf6M0meWjyfnWuU+pFfwSlL28k14lx7R2d1?=
 =?us-ascii?Q?5F9mybLOkFXpsbNkfel5u27C7pY0M/JCqiDdSAF1UQbeV7cSHNHZpxye6Nf2?=
 =?us-ascii?Q?HbHRHllGTLtWTL5A+3eg346fzouwiEt7XXIaEpqeXmsXAgXH4HSbmN7WI6J0?=
 =?us-ascii?Q?HNm+3y1DUo5X5oj9nngRL6wCMNNB/n7KfS2USw7C5KVEL5Lnb9LPPptS3tx4?=
 =?us-ascii?Q?EVGzoZXXLut9ZrGTFVBF/CUmbVjPXuwXj8k/m0bAs5ltcHrwHMw+NkNRliOX?=
 =?us-ascii?Q?JXgQ+ildbYFw1DY/uJLmy+q6b2TggmUTPRdVnw0+H1Z9yDTHpw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b2498c-5da3-4955-9b46-08dee174c9e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:54:45.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_235450_499702_4AE65DBD 
X-CRM114-Status: UNSURE (   7.30  )
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

Add the compatible string for LCKFB Taishan Pi 3M, a board based on
the Rockchip RK3576 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index cff4f4f67..27f9e36e3 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -797,6 +797,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LCKFB Taishan Pi 3M RK3576
+        items:
+          - const: lckfb,tspi-3m-rk3576
+          - const: rockchip,rk3576
+
       - description: LinkEase EasePi R1
         items:
           - const: linkease,easepi-r1

base-commit: 8017cf28e756cd0f6988706b5d33bdf4eccf4844
-- 
2.55.0

