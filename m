Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0561C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5pojPfDyVvs559M2XGm2RMLEnoqbUiEl1g7qIbo/Wo=; b=gsE6807msGY3XljpjUszJTb2v8
	vTtIl5OnNp2RiMjevISs6bg3PIXhTaETobdDEBtiTbH4lSSDoptVxh/kYOEmVkG2Ds6NfJqGKAI50
	veiajWjhpyi6gMuQAb77CV5fkg7+L6GlIOAdYBs6yUxmF+R/G3R8fFHrb2II3VRWasilP0/ulXyP8
	o1XIp4teOGxjDSMAdJYno671M8n5DoLcCDKFMOOPisT1zF/pSaLz3RWd2U/0gUGkMAXgeiQQIBu9O
	lZrVs46GE3/owYW4peMbgDvbPH7+ijdMNiUe741NYr0L5/m5u8ccG9R0olNwc9S9hsL9k7fo8Pt5A
	dXpPyv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul3Nk-00000005X6l-0Y9l;
	Sun, 10 Aug 2025 10:34:28 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul3LE-00000005WzP-1Sza;
	Sun, 10 Aug 2025 10:31:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2YtXt0IpxjeEub8ZapLrOZQ/kStbuy0j0VqrIzg6GxSor9kVvZduLrLb8UToQYS6CDqcGRMt4HrxN2bUV2B6RduwN+RiqsVkd2Ju8gOD6qvdnrEey+O+fc31ciftXxsmYcFHlvxthx2/iH9J0VvDfYtb/jdS14wrySIudXq0s3KDcqIxabW2kemjDkh4I0+iw17i9SJtgs4YmDMLeiLHPiMqr4IKJ9zj3pNnrMVe2acQOhY79Qawr4g3O3cnwFVz6NHX4E8VyUVyN1QERQAjMU/lleZtFD5Nbw1qq1hnlPDH9TaYuraf0m7Xfc2GRXMsEzaLPP1DVCz57/eZdKgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5pojPfDyVvs559M2XGm2RMLEnoqbUiEl1g7qIbo/Wo=;
 b=Dm+ugUx3zhGGkxez0kZmerYFLYVYIvvgTMUYW7QxXTgPGD0gBGcHlnML9chxDP5KsuUTSji0+EUreCad0vnLXyfH0aes9keezp5hOQk0i1HlFpobtCRh7Sudg6nlpGBOUvfx7Y0k1F2++F68PxmKgPSwcf3vNYC9hl0s1EMcTgw7KKla8zuUXXb6LqbIP0K8awaGdQnma/YBuPP8p3KxUoUjn12IZQ4mQ5FEZ9SWQirCYDpyB/w7KUgc4O4PnHIeE8pcoWvq5RtG35MBfTifdKMl9kJtNAxKMnHCgIODlqn3RAW72soCBohwTqgwfubZxFVhTlStKzfPTI4j3JZhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5pojPfDyVvs559M2XGm2RMLEnoqbUiEl1g7qIbo/Wo=;
 b=AUvjfIUiNsbRTj/gpYnwaUsyng11saGvPoyAt2HlXrARb99E0fK7ZHakZ2FAWlUfxx/R3GU8e/KQ6cc68D1N8LL6Jh24HfM2Yn1s9DA7fzbagA4LXFUZ6kEMq7yaOSqvceuIlWCTXLJvCXApShQcWgARpKQmSh+d87xJPuGFVOazONCH3Zo2nwbT2nJiAOVoNClTNYv2cS4gO5eM/jxm99WBlg0ecEW3ODmjsAUkGN6Gi1W2zUJ3IwtFgoTAS1wwBSqUz0zYouUA2YwvuAQQXPFXvb1fNFpBbpFlASI12EpLGnYC2mWIMAOmI83AwcI5xAYhCFRAVh7pfmxORjrTrQ==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by TYYPR01MB14263.jpnprd01.prod.outlook.com (2603:1096:405:19f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Sun, 10 Aug
 2025 10:31:33 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%3]) with mapi id 15.20.9009.018; Sun, 10 Aug 2025
 10:31:33 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] arm64: dts: mediatek: mt7986: increase ATF reserved memory to 256 kiB
Date: Sun, 10 Aug 2025 18:30:49 +0800
Message-ID: <OSBPR01MB16701BDF64C43EF07390C830BC29A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID: <20250810103049.28342-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|TYYPR01MB14263:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c05b281-6bd8-4668-17bc-08ddd7f91274
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|15080799012|5072599009|461199028|8022599003|5062599005|19110799012|8060799015|1602099012|10035399007|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P8OMXtagrpzQ5rtS8OgAv2XTr+8XWgpqMMEg1sJ0hBMVR9mrLQvgmRtWRlIt?=
 =?us-ascii?Q?Y1Yc11aUXKlzsF+N+Oi1Ys/ubXRX2gyvWYVnr0lABFSNIuSBRLwmv61Eij18?=
 =?us-ascii?Q?ZwSaWhQgrVAIoCwIkr10thHzaJNdlmcG7SLZQvHdBtog6NN4uM9EkeMcAGom?=
 =?us-ascii?Q?pwMcBy7FEHxlZkiWMhTEEHCEdV+ZXC2pSzy9n4JiJj7Xf8Y5xmr6hi4T6tBe?=
 =?us-ascii?Q?kXDb+aNZkqJPFi5YIqByRLWdB9CiHpw/yI1NQfDn2yMZaKEpkLfO6xdy2xI0?=
 =?us-ascii?Q?8gvtN/IakyJMdZ6+9YphMWFntg9kxnnvToRHGGsXOzu6fMud4CULZOFlgNSU?=
 =?us-ascii?Q?EXCXOYBeV70CiooFRNhJpQkxdVfbQXJdVkJcfFBdqhTdplu9tIsokFmBCeQ1?=
 =?us-ascii?Q?oHbfoPMPZUv7TY/kcZAnhvVjvPxHpLdL1WXUI3DMV0IFEdqji6a+VvJ6hIoW?=
 =?us-ascii?Q?UyIxPoBKVh3tZeRYT4SqdU2RCOT+x9vjbfpEtFDlEUPT9SX4sCkVm9TyIscd?=
 =?us-ascii?Q?78y8GguM3oA1VF+rdLp/c9MRQ+V9Be7e4sff/fWP15BOaPs0DdTQJTEjdSHF?=
 =?us-ascii?Q?g/LqxTVc0cQB9aG1GstS5XUQewPy4d+ZRYgJ7fh/WcOPh8Cuvqf/IyFpWjKO?=
 =?us-ascii?Q?m1AlsHaTlybeqoeX9lUqhcMV838y5rTTgmteVQchMFPxP95N4WmaeApMp322?=
 =?us-ascii?Q?qtLQ47n5WtP+5lKyRicHwr2MI4A/BfSLZD/WpXyDIKinBIRr1FKbOkMvnP3C?=
 =?us-ascii?Q?9uYvDq/TwHeZJcW8ht/OOMRf/ae1lnGIQY+h4BcZnhQXepAWyimyMh7G9Fdo?=
 =?us-ascii?Q?DD+tsjkyqhPpEgQQhgloPCyNDQ/pSy+LCjThC/EK1mPZv1+dAs6NFW7zhg4I?=
 =?us-ascii?Q?W/kdtn4Yvcse7gBQM0PrVp2/BueMYj4r3xhE9oWiQ15m/ZJKBrD+/kVW/ukj?=
 =?us-ascii?Q?4dvsEP9eKtmjC8PnTfuVXGckzJuCKLxqo6NVz1uluU4h7dnl/dm6N66PnHwE?=
 =?us-ascii?Q?mGtdM+2a317i0B+wTju0ZyTja/HzKGBuzj2e/Z+LrjyZZ2QvDA1VGqdDLq9E?=
 =?us-ascii?Q?1EgwjUSsYOqZA/sh9csJdRoZkPhKmO0zontPT5tcdvWBu2WckE+PW1d7/hMY?=
 =?us-ascii?Q?C1mtEseDmVpYt0E3EeZnYuo+x8vxpo0JLxw9KDBju0buDa98Ev7siV9P6TwU?=
 =?us-ascii?Q?5m4DR496MtzsQ86RSniZ7uCmU2hZTbsih9RKhBU0w8FGSPc0LH2AeAwvWsHH?=
 =?us-ascii?Q?CLvcgnUUD7TXljnOjobQrv766np9oGWyH/Yeqdom4w=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NC5+Ylv+MRvXa5Q7rdPJ0CDetb/lRJbFytwGxP4yG7n7iJNIHZvofIGyLLby?=
 =?us-ascii?Q?UwS/hbVkKtoYj0qM3+vATPJu5I8TFP6Be5LQ9vi8RgQxGoUtuBvkyVW7Ll5w?=
 =?us-ascii?Q?vfA7qv0pJmPVRhpK8MUVb0D5V5j+Yuasd902DoyC3L/bRE/xKfIqAplS/5xX?=
 =?us-ascii?Q?lX4z2zu2VK+aZSTVECJSEq9VXh9LFSlF8OLbav5C3TxYq+xJM735VS+Ml8cw?=
 =?us-ascii?Q?be3Ea1hZaXRf5N002S2EZuBhD56lZyxgYZBdeFVb97M8qy9XaH8wsYhQEMhz?=
 =?us-ascii?Q?omECDYkS4Yd5VvG/tcNqEfvMvR/zaY9AX7f+3vFuiKq9cyqTASEo07IoqLbc?=
 =?us-ascii?Q?p+2id6ZbyvFXeipVPE6FLJNVpXRnYOm2esSoYf6bGdOqhPzgNzXZ5Wfsrc9X?=
 =?us-ascii?Q?xyGeVgGLWjQKVx1BImsn6UGhjNL3/UzWlVDLjpIA/aE7mOZrAlqiFRZhY4D4?=
 =?us-ascii?Q?bCC7qRtvjlMOpDr0gnqysdJtUdJlZE+ok0AMR4c+Nq+okqiN3R5UILoWCJHD?=
 =?us-ascii?Q?hDFyVHtE2GAppaN5VR39+3eEgD7avQpBy85ovZArKBFVXOvDcM2K+2m6oOc1?=
 =?us-ascii?Q?G7dq15g8i0DCNJmc9cy69BRnZ+XVXTSlPLDPIWxdc9cBT4Sg5JzUalnBe407?=
 =?us-ascii?Q?W00UGqQ/yGKrZ1dWOc4GwE1mv2rfShoegsREUSbMP8Qu5PCa6XDBrxggiqZ9?=
 =?us-ascii?Q?TMXbndC066hIQ6Sc8rX47pjYyjVwjjfRy96zQiLLRaItYgz16GlaJTFJ5fRT?=
 =?us-ascii?Q?d6pNRjMYAqTMWELUDtKIiXfDDZJNMigpHFQak2QG3/U0qM1cr9+2VMfShBCb?=
 =?us-ascii?Q?IVrYjwSXKPQrFB+104SWDQlmTFZwKejUWj9KIA5QDBzZx7d1EBXDZv5w+pP+?=
 =?us-ascii?Q?y1LFl6ohvnGr4mwJiBh2i/pd5fLL/cITGMISbXDaT88Ari1IRJW109NGqy1C?=
 =?us-ascii?Q?z0gmP5SwpeWGV9TUNI+losAwU81rgWmpNvv+cYStY3zBA6A2FOhuTVikngwQ?=
 =?us-ascii?Q?NjW2Vq2DZXud3IwsPm01OVq0ikiBUVbq3ngGqO9bIoLzGubEqL0+iFhTBKu3?=
 =?us-ascii?Q?EAwl357jrE8WHq+5nULcO/CXDqpW38glw+k8Je1+i33WHUNGsL7bPXXOZWRw?=
 =?us-ascii?Q?pu4qDAGgHQHrsuDW14ZT2U6qnIvGXOuzTufbz8XiqzeDw2h2jJWKlSa6HbeR?=
 =?us-ascii?Q?BsvhFXd2bjKZT5dhK/IeCUzFzBhaenJtSlqaA/Eonb1abzLw9Lqz6RGx85JX?=
 =?us-ascii?Q?f0n8fhht8YbPqllZW2/n?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c05b281-6bd8-4668-17bc-08ddd7f91274
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2025 10:31:33.7777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_033152_381474_E1C1416A 
X-CRM114-Status: GOOD (  10.13  )
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

The latest Mediatek open-source Trusted Firmware-A project has
reserved 256 KiB for BL2 and BL31. It is better to increase the
reserved memory region in the Linux kernel to protect the data.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---

Ref:
https://github.com/mtk-openwrt/arm-trusted-firmware/blob/78a0dfd927bb00ce973a1f8eb4079df0f755887a/plat/mediatek/mt7986/include/platform_def.h#L61-L71

 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 559990dcd..d21e0d13f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -68,9 +68,9 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 256 KiB reserved for ARM Trusted Firmware (BL31 + BL32) */
 		secmon_reserved: secmon@43000000 {
-			reg = <0 0x43000000 0 0x30000>;
+			reg = <0 0x43000000 0 0x40000>;
 			no-map;
 		};
 
-- 
2.50.0


