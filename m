Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045ABC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy/J3FgWfPLcrfRa08xsgqxGiCT0z0sQ+JQPAAOc4/Q=; b=M9zwiodBMz2+w9OHCvyae83UIP
	JxveJq7XeTjtz6TuB0UL/0dKnEfxWjBJwgucVPCUn36nfuIiY3FJGQCxJNVa0Qe/zxT3KYDt8R7vC
	imbmjjRNlVgESBhxgORkvLRgC/pLx/n5AGPUVMydfqhstWrUzGpVsIpUHtBdLpxt9aZbm3T0FBSWD
	gEEcm15lf1YevaoDpsgiP0WMBb+knrXnD1yDTyj23zQxUVMTYeuaMTrRNRmrS0d0mOLugwJ4mpt7i
	8jsii8lyveR0Nez+3ozpQjwRrUYOhVZpGR0+MuSa+US+lvtkvpuwL+cULYBg4+xKqWTUCjC8Rww3D
	QhT4ikNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEf5-0000000Bcd3-1ZzS;
	Thu, 06 Mar 2025 17:05:31 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEWD-0000000BafT-3tvB;
	Thu, 06 Mar 2025 16:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLOqS/YdPX6WxCX3zE6SHpXQiqeB+cu6oA1rKlE+BBxsdTlqEt+9BLXnIAg2JlC80m6mtVxz8P7aBobBfacDKr1B4aQ2Vm0i+mPflEPVHo/zEGCltVBsLrdiK58tfNKK1+6DqjuwqhayuWje1MGJ7ec5UCLV93Im7+x/O7oGGkpQwuesQbh6nZgZ9zTywcnQ2adhnZdd1VqazpKaCn4x9YkP7cD6Eh4Fn7ZrCfPOj7XUiqtMo/As7HMxiAwDyO/V6IMV6DtDNz5HfE9WSirK/wKbg2FZ8tbEj43hc42ljyelTwB8LnNNqbsyeLykHMZzkVhxoaVBMAPaBBDUQ4k6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy/J3FgWfPLcrfRa08xsgqxGiCT0z0sQ+JQPAAOc4/Q=;
 b=CldwR0sOp7Dljar9CV87j6TtOBT3UHakJPX6WBTRtc947MmJjm0k5GPEDTXmBBHoseeH2C69XojvIesnZC+8fTNqnJOzkdY2yPauD8WQuSbMaPgptVtCSuJs7n4fj7j+VcQsdOUhBOsKdeAigskMiDY0sfnoYBg0uhjEnRAlqJYVtdYUUkIYE+AKAteYXYDTYlyU3tM0bdgoDf4LD4o0YLPG6XW1awDQPELce3mibN1/4c+nhJcYO4KPrrzQm8hp7yLCi7peoNp3KghT84WHcZfR4ts+0nY4qKL66k/NXLjS8F4w5LSpqyrI1lS2chlKBizS66gUmA1AkiXQwugldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hy/J3FgWfPLcrfRa08xsgqxGiCT0z0sQ+JQPAAOc4/Q=;
 b=0sftxhYIrFfb75D+BoFZ1ftN2R3mcZDINnjNVO3IsHWGDpZE7V7uyEImpjMxk0OkYoPVf0knZe4FlMfzY6zwDO3g3tGQxPAPw3CVLvd8WDMAa4uwHMMI+HD1Elh4XgWTcAlj6c0dY7URUOQeJAFnN5bT5/Cm31dBJwZI17hq4WM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:15 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:15 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:05 +0100
Subject: [PATCH v5 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-4-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=3933;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=O7q0DghBF8t5TRQzbT427N3gOQpeEIQ++v9y6gnNvtY=;
 b=OYOscgsCpGT3Yf7q+MkQp1fiVvJ8hO7RG5MbEOFVGJ7XURNyriEn5McgHBY7WZmFmmRTgrr+H
 mu59mtJW/SlA+medj1OeJSYrtfGu5ha3aV1mGEMgw+2pNEjBrCkQHfp
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8e5496-a15e-4102-2b8c-08dd5ccfcea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmY5a3FHa3BVODF6NldENEZWcXhhVHpNQVcxUHI3cmlMNFRSaWVoMmJ1ZWE1?=
 =?utf-8?B?b0V1U2l4MFJEaUM4Vk1ETTFwUVBtNmNNVjNXZTM0dzlhTDNWenN1TUJZQUwr?=
 =?utf-8?B?ZlVJeFFCUXN6QnZSTXpaMXEvNzVNamMzMlgvWklGcjV1M0pGcmg0U2xiaDg3?=
 =?utf-8?B?Yy96QjA5d2pEM1ljbm5mMk5oY2hsTzlJTjg0K2d2YmU0ODNxVy8wMzFabHla?=
 =?utf-8?B?aFBWUGs2VTR3Y3l6WnlRdHJqQ29QMzdxWW9vY2wzOHJRdm9LWjRNVGZMTllm?=
 =?utf-8?B?aGtGaTNhNHVZakgzclUyYkdsMEszbGRYV3dPenJjZXdTUzlQcllOSUlrOEJk?=
 =?utf-8?B?Qkg0VURNWUZNT2VoME0vR3ZrQTczS0lyeDZXS1JES1NNS2x4QTJpNnhvR2V4?=
 =?utf-8?B?V2YwaXJta2x4NVdnMENDWXpFOWRMTDN6Vi9vUjZGMU56VGNJMTA1ZUROUTlW?=
 =?utf-8?B?R1JyanFxQ0FKRnl5TWllRGhld2ZMOHhCelRaQVBXWDJVMkp6ZzZlTStyNGll?=
 =?utf-8?B?b1lCMEV2VU9MRjU0aVltVmYrQ01TQjgxaUEwS1IyTzBTeTlZemordVkwUUE1?=
 =?utf-8?B?bFFtdUlncXJEVzJwVXJJU2VqWitiVndrdFR5SjBVY20yZFN4WEVsTERNWUNG?=
 =?utf-8?B?V3NiRzVaSWNFcFFpM2lLNGRJcy9QbWZLSmtuQ0hYRjFWY1g5bFlBOUlFeEVa?=
 =?utf-8?B?dExlY1pxZ1RZYTVyUml2N3BTN1J4WmplTHl2SlZ1V1ZwREdoMTlpZ0U2MGtN?=
 =?utf-8?B?ZUdiaW90ZlJwN1dKaVlSci8zTmdsdjk3RGI0WkFJOXdmZEwzZ2tnMXl5Y2tN?=
 =?utf-8?B?Y2FzejhyK2VzblpqK1dtemx3NGpNWXMyWVp4THRrdWhRQytJZGFYL2w5SWdK?=
 =?utf-8?B?c0w1S25nMUhJMmlIY3hndThNbDR2SVdhbEs4d1ZCNWtRM3MyV3QwZ0FObFJN?=
 =?utf-8?B?YnllM29uYXFFeGJ5Z0ZiS3ZoSDBmanFnSXlWNGFxRXY3ZGRUSW1rUjVCWjBo?=
 =?utf-8?B?MzU4azE4MmJINVpZcWkyMmtFTXFqUUwyUDVEM1NFcVNXOEgybUJESm5hR0Ux?=
 =?utf-8?B?VkNzc3hTd09Lb3MxTjdoaEFlZ1A0YTVuQUVlSXNndE93UG5iTTNtdXpnck1Z?=
 =?utf-8?B?ZGhVMnN3NXVpWmY3SUQ5VHRhbkE3Nk92WTFIblJCaVJZVUttckczVVNoYmlX?=
 =?utf-8?B?SUlXOWpaQWRXQ2J2MytXd210MjJtMUxFU01SaTFhVHZvTVkzT0Q4c3Y5WXlD?=
 =?utf-8?B?M1dCRWhKVTh3UCtLN3hQU3FxZHBWNFd3TUd1b01DRjBhanI2aVdEUURYODU5?=
 =?utf-8?B?WXlzSW81ZXdPNHIrQTJFeFB0YUUrc0hsR2VoV1FJWng2d0gvU3UxL1U3clFQ?=
 =?utf-8?B?TVRxM1M5OHJOL1U1dXVrdk51TUNGdXBQZHFld0hDaXpKaU5HMmxxVmY4YTdr?=
 =?utf-8?B?UlhlK2h3ZGg5TTZjOVh4dzFRNFlnTjArbkdtUll2UHg1RnpqNExMb3d5cENs?=
 =?utf-8?B?Y0dHUzlnUndKcWs2NVZEOHJJTUZ6VVZoQWlORFUxYk5wV3owckl5MUY1eWhU?=
 =?utf-8?B?RXJsMER1UkN3TUhjYXN1TCtzU3Y4ZktxMWRIWm9pYTBpSXRxdTFVbHdCMWVO?=
 =?utf-8?B?cFg0ckNBZEFneG5yL3BQMUUvMmtqSWR6Mys3VEt2TERaVHpsKzh3MFc1dTNx?=
 =?utf-8?B?azVpQXJHSFlucWZlck52emlsQ0Z0SzUxODh3SkFidVpRakxJUy9YbUF1a0JS?=
 =?utf-8?B?b0M2L3dVdHBjYW5CVVdqR3d0VnBHVnFxUHdoaE9lQW1CK1dkY1FhZ1JkcHZi?=
 =?utf-8?B?anprSHBId1JaZjFBcElZM2ZDRFE4aTZ4TnA1TVRyYURQYmZOM3BJZ252SDMy?=
 =?utf-8?B?M09DR1RjR3MwMXFoek9kc3d0cFF0MFN4ckNzM2daSUYrZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlpL3BTbzU4WFUxSzVRR1BBYy9mN3Jzai9uWDdIMDBhY3FRR04zRHZFd2FR?=
 =?utf-8?B?K3AycUZqdkNjZzFjOC83VnRRMVdXZlpmS0owSDQxZWdZbGhoNDBWTldmTkdu?=
 =?utf-8?B?cWtRd25QbDhKVHdwalZSMUlNNHlucVh1RHptbWNsd0xRSkhKRXVOb2Y0Ryth?=
 =?utf-8?B?aWErTkIrM0U3ZTRaTXJTaitvV0RTMGJSbzYyNyt6dGRSNUpvWmJERVcvYlFL?=
 =?utf-8?B?SlEyblp0cUxaSFNFSVFQenFtYTd3YWZuS0IvbU85U3JwYjFLRjA0NUtzK0NP?=
 =?utf-8?B?bU1LMSsvR2o5czZYbUJJN0drRktkbURxQVlPQVhsY0h3Qm0yM2RRZ1lPK2du?=
 =?utf-8?B?RzZtaTZJa09KYVRzd1ArYkNoK0l1ckVoeFFPODM0U0pYVWt2ZkpINWVKOW1I?=
 =?utf-8?B?emFUNE41UytvY1grVG11Z1ZuaDBDREZYbFI1ZkRpRFNib1VxK21WNFdmN3dt?=
 =?utf-8?B?UGowblJteEtxM29TRW1EbUdSSUgxTy9sVktOQm5lWnQxZnVJV29CWkd2dEJF?=
 =?utf-8?B?V1BJeUttL3VKRzQrN0JJTDRIcWpRT3ZBV2J4bTY4SXFTemZhNTZoMVZnOHR4?=
 =?utf-8?B?SzRhOFF0bDVtdmhnclkvdGdTMlZEaVVxY2gyV0NHaUR2QzlZbGgrWDV5dGpB?=
 =?utf-8?B?VlNBYUhYaUhXMk5zM3BPbzRWNm13Qng4RUdMN2RVV1NiYWR4dzZ3TmxLTUhU?=
 =?utf-8?B?NndTUUV2N3hiZ01kdVJzNjRXbHpXYnp0ZHlvZlpBYnppQ05pSnhlRkloMmRJ?=
 =?utf-8?B?SzFTc2MrSlJyblFXMys0cklVOG5rWU9yN1g1VkU2VHc4K3NaK1JhYkxzR0wr?=
 =?utf-8?B?VWZTSENKOGQvMHdFSVlSTThvR3JxM1hOc0NmcUhBaXBVQ28yN29aUmNLQnAw?=
 =?utf-8?B?SFdlOFlFaVcxQ2ZtdVFzTnBYSDBEVW8wRjczYU1YZnlmZE05K245QUNreVhj?=
 =?utf-8?B?YzU2TnY0UzRza0ZRSE9yZEFXUk9ZVmpkMCtkL2psOHhlOVFmVlpwSlVUdWlQ?=
 =?utf-8?B?czl5T1plRlZPVmFhODlhTkJ1MU9BM21lUGZwakhMdHBKRldlVFlDNWZKTE12?=
 =?utf-8?B?bWpLbm1YUDhsb0ExcytrNjBOV2haclRwbUtKY1dsRm1HdDdOMkFUbDdTRDZH?=
 =?utf-8?B?alVET2dhbFRIYVJoalBKZE56QTBJZnUyb1JZZkkrWXlIbG4vUkY0azAwTlE0?=
 =?utf-8?B?ZUkvMmg3bWc1K1NkMjRZczdIYUpMWkRWbnYvTXFiVktvRnhmRzd3MHNldjRG?=
 =?utf-8?B?dG1uMFZsUlI3WmVRNUtMd04vclAzM1Q2KzFRdmVuOHZCR0pJa1N0VnFXY2ZQ?=
 =?utf-8?B?c0t5T09nSEIzaE03TFhVS2ZjNkp0NlVKUlZUVmNjOFk3T2tuTGFYSEZqS3dl?=
 =?utf-8?B?QnNNQkd5QnVBUU9wVVBidDVkS1NXNE82cTZYYVJtVy80dHJCMisxM01MUUUv?=
 =?utf-8?B?clNHc3RWWVB6Rm1MVTBYNmlNZkRXU2JabjdLY0c4LzlqdlRtdUJGNUJFOFQ0?=
 =?utf-8?B?bzFESXByNTRIbnZkRlQveHRiVFZmQ0NMOFh1VmlPY3FGaUFrMTBWK3Q4c1Zp?=
 =?utf-8?B?eGZBZHRTVUtJOHBCdld3ZnNoNFl1b0dvTHFOckV1UjdRTzRMWExYVVc1SEly?=
 =?utf-8?B?dVA0dHlML2VENkk3TnVHQTRPVnQ4WG84N2VVSGdMNi9tclRIcG9tT0RMZGVL?=
 =?utf-8?B?bk94dG1iTnN6Sy9CQTNEVFdOOXpBbDVETjZqQkZXMllhQTQ0OURaVU9PNnpH?=
 =?utf-8?B?RzZmNTF3bjQvb1RhR01QSENXUkJhMTMrR1MwTjN1dFBpN0VtZjBydkt3OU9E?=
 =?utf-8?B?NGVrZG1aYVNBeE5pL3JRelYzdXJadWJlNUErMXhuNDY1bysrQ2RFM1o2QStC?=
 =?utf-8?B?cHY1aDNSendBNExvVitTcTU0NG9va1djZ1RtR3RyTERUWDNiT2IvLzlLSFZs?=
 =?utf-8?B?UWRnNUxHdys1ZGNVbStLQjNuSitic2NZOWkrV1pBK2VEdmVIMkwyYWU0QS9w?=
 =?utf-8?B?NUxEQTIybzJwMzk4U2xXelNRWnZCNXZCd2l5UUVFbDVkTGxyTGEwNHJqTFN5?=
 =?utf-8?B?OFhiMW9pWWV3SjJLQUdjMlIxZUhYQ2JEaEFjWkwybWwyV3IwSWlXK1BpMkIy?=
 =?utf-8?B?aXoxNVptaGZzUFZxSm1Ca3UwMkxOd3pjTlcxaGhrelZEOHhEWXkxQjJleE9G?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8e5496-a15e-4102-2b8c-08dd5ccfcea0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:15.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD0u8J25e3EPPNgrJccvkYnPFrOgeRDNtySmi12PTPFqqPgj5gxm+/0l7+3WXVng24EciNle3VRTLBR8MIovB281M8A6sBDmWjtjhJEPQ+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085621_978305_265D9C09 
X-CRM114-Status: GOOD (  13.67  )
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

Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 114 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..900f5a32dab9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 MIPI CSI-2 Host
+
+maintainers:
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
+  and one output port. It receives the data with the help of an external
+  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
+  (VICAP) block.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-mipi-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: MIPI C-PHY or D-PHY.
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [1, 4]
+
+            required:
+              - bus-type
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Internal port connected to a RK3568 VICAP port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - phys
+  - phy-names
+  - ports
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@fdfb0000 {
+            compatible = "rockchip,rk3568-mipi-csi";
+            reg = <0x0 0xfdfb0000 0x0 0x10000>;
+            clocks = <&cru PCLK_CSI2HOST1>;
+            phys = <&csi_dphy>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_P_CSI2HOST1>;
+            status = "disabled";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in: port@0 {
+                    reg = <0>;
+                };
+
+                csi_out: port@1 {
+                    reg = <1>;
+
+                    csi_output: endpoint {
+                        remote-endpoint = <&vicap_mipi_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cd8fa1afe5eb..d83a7762dbe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS

-- 
2.34.1


