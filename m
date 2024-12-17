Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F459E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxCovdfE5jCpFekbbhbq0EQ77/r7AZ8VUAY0zTecDhM=; b=Xo/0IJJ+Lu52jlM9CzOwZxFky7
	y4juwRyVOx/QfJQ9S4tii+S8DxzecMRbha4hlNosJDfBcMg2StU6YL5qvTgoKHEhp4sv5k8gRysMg
	gPvwBcdU23o9tIm+X3IYfq6comGQv+D+efmgXbI67kS14TOh+4DBZz2TbJowyvVxxA1QZXJwRZlVf
	EWrUWiRl+cxxoNnsfr/yWw909C0GISQEto3JfdYZepSJLsIzP2LYCs+7oJEyDuEGsJVzb+RANJ9ly
	b3qL39hc2UiI9g1QfU2QDxxTDNLhDzbzg1cesOEYqZmUsSspK9SOTG936gxJ4uAibn4Kr5aJKGnBu
	PizovvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaTF-0000000EBdb-31w3;
	Tue, 17 Dec 2024 16:30:53 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZv5-0000000E2po-4BAC;
	Tue, 17 Dec 2024 15:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfs1g4iQADVuwI5SmhTM86jsR57sq4Eh/jDAoAt9hdDCrzCCyTmmzhlZRHoHJ1Esq4AxnUBQfOI6cTJkFdML72bqb6Uszp8aqvfAsml7BPIblKVftYmsVbBmzdeJYj95txEcKK3iMmzBAp1uxadVR3A1YV2msLxnJ+itFTsdV9g/ndxFgwlH0840nJVFjjg/8Yj6LJeaHBIOTZRepamItlfVZTlRbefmtxzPSZolKcwys2JFrm0XsqWA+H++LpZEu7rdt6wwYr+o5TmBePEub+mpvG9butJU6EcBgmL69arav/IZKgAJAk+fhyZBOzxsDb6juEsGYZua5vJtVum8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxCovdfE5jCpFekbbhbq0EQ77/r7AZ8VUAY0zTecDhM=;
 b=PYpf1aMznFp/Iw/WEUtEqu6sKpMV0vKCAGirEzbEE+99WzfrDmLL7kd9dW3eyFcjjQHMMxx9bU7ig9KGRT1fLDhAxbfkwnapMJ3Z2JWaJxX21wKNPRLg5zeXdbEqTdTy8Gnsi2PFsyX8LtaKhU9KnvOMB37w/+/Mzru9CT+WgfWGEyX47gNR0RibNHXLa/KQr+JxdLCiI7pjhUIsLHGG9FxBfDERDyrbIBf5ZQ9SDawztpwqAMoJQlKoOm/gmZe3Chg47Z2pfCrwzU96Q/8gykelttEVPSd/QOa30sJf0uWOkhZy+XVV4/6aq+xynhRTmM5ONNU8vArpg/R2j700NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxCovdfE5jCpFekbbhbq0EQ77/r7AZ8VUAY0zTecDhM=;
 b=fuBamtNrH/jIlr8sC5Kdj1wZXc/8NNV4nlU2SPBz3Cny+7sIcseVtpeFxoqpoFrxIGqTiFskvkgl0j+g6L37VkoFGNXNwldVcNumCp3gcTB5aA4c+ivIIyc3OVueCS/ULCpTG7OFLDQ1RGS0GkSlXl/0DpPy4ElWcSwTnt2dl4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:28 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:28 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 17 Dec 2024 16:55:17 +0100
Subject: [PATCH v2 5/6] arm64: dts: rockchip: add the vip node to px30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-5-b1d488fcc0d3@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=1210;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=kAZYbwRFBoEiWczEVuI40JvVeuv2U6fJh9wOW1+JivE=;
 b=NGq8R0LXNFKu+k/eTfnjT+M1pyBEozLczhFkwuqcWUqn5d5EJVFU1IymNULw5xJYtu68Hbt7g
 6/o0boxCsJXBqj/SfAuokgy+kdfDRCLeXcGk0Q/F8aZp+YAHkA8ceub
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: a0dcd861-986c-4329-fbdc-08dd1eb33a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVFBa0FNWmNwc1JNRzc3alVCNnQyWEIzSS9ORUdQSHVDalZNSWZNSjQyTC9X?=
 =?utf-8?B?Q29SNkl4ZDc3WHFNVkpxVTdxR05OQ0V6QmdUb0lxNkdGL3FmMlNXSGJDSnhJ?=
 =?utf-8?B?ZjdTNXdUM2wwVVlSMEMyNS9OK0tublpWai9Rd1ZrV0gzUWQvUUZXUHZnM1lQ?=
 =?utf-8?B?ZE9Fc2p3M3FkTlhMRTNPWGY5TDRZVWFtVFJTZGpTNFRsazRtOU9TcXI0dmoz?=
 =?utf-8?B?UFNMUnA2ZTNJcWFwTFFubk82enZlLzh2M24xV0hBY2FhOU9CNnVKeEtVWi8x?=
 =?utf-8?B?QXhYSWR1Tm9EY2djMEo2KzhOWC85ZitXQk5MWmVoUEp3NEg1RnZtdjU4M1Nq?=
 =?utf-8?B?ckc3ZFR0SzNPQ0RTeGVxaXFaVGxjWGk0T2tNYTZBbVByUXlMTVBHeFVDRWtR?=
 =?utf-8?B?VSt1OFcreUlDUGh3czJEVE9SM3ptVGFOa3hOUWVXeDZaSU9INGJ4MlFVQWpp?=
 =?utf-8?B?NHk2SUtLQ3FkVjkwYVZxV2FDNEpzNThzaWRiaWZpVzRzd0pIM0tZVkllaTJx?=
 =?utf-8?B?ajhJQTVYdy84aGF3Ky8zQ1UvZ0ozblVxT2F1VWRMRnM0YVdEcEl3SUhkSW9E?=
 =?utf-8?B?VHhON0RhL3BtakhOb05uR0ZGY0FCbDlMd1hqaEo2TTdPeEl0QXJSWGFSaGp6?=
 =?utf-8?B?QXBnOVZmRnMvV2UxS1owelVSQVRRb2J4NGl3cWh3OWlVaTJ6MjRlUVBjellN?=
 =?utf-8?B?Yncwb0x4Z1JEeTNvTWRxc2h3dnFKaXBHOGhub0tPUWxzeWNzN3VJd0h2Ti9m?=
 =?utf-8?B?QXRyeHhiSnA3UTJ1SFJwVWExem84SWduSVVCMzRjTlZyU25qM3ZxK1ozL3BE?=
 =?utf-8?B?SXQ5bzJDT1luVmFEaWU2MnJmZGdXUmFjZ2tuazNFMjRkY3RGek5ENTdwd1NZ?=
 =?utf-8?B?d2tMd0pNVWlHMHJ4WFRVN3NYN0pNcG9OdW0vQUsrQXpnSWIxU2NIcXRXN0d1?=
 =?utf-8?B?SmtWNnZlVFZ4M25aSXRmV3hLQkdIM0wzeXpZYjFkSC9TMExCcEVtaHQzMUFC?=
 =?utf-8?B?OU1jdWJaWnMxTmV0MHhjTDI3bEkrbmNrZlptU2d4b0R1UkxIUWhhUmZLc1Vp?=
 =?utf-8?B?Y25seml6dGc2MnBteFlZZHVKZU9VbG5id2d5WG0vWG9DZ3lJNUoxcHJHdndh?=
 =?utf-8?B?Rks4NzVJRCs1SHN5OTkrUzNuTy84UU90N25GT1J6UlV5aHJjQU1WMUhjTHNn?=
 =?utf-8?B?R2cxUndzK1dNd2tZVWpYamo2cFU2d1lnZDFlYUI3YTgzWnlBM3R0MWFwNk9k?=
 =?utf-8?B?YkdkekFtZ2NZT0tzYjMzZUplWk1YSHA0SmVuMVdkQnRrVldvb3RpYW9rcHlO?=
 =?utf-8?B?Y3dGQkdQWlc2S3NUalh4R1Q0VlRtcUxUcjRSMDZNWHNoU0xXR1JTRTlJSEda?=
 =?utf-8?B?eW9tQ0NzRGttS2pCM0RYWTYrZEs4M3FvZHAwNEsrWXRGaDNaTXkwanVkSUU0?=
 =?utf-8?B?OHZtNE0zT0JhYnlsY0w2b0UzQ0MrTWMwK3h6Tzh1ZDBDajBYQUE5TXFGVS93?=
 =?utf-8?B?d0loWUhNODdtVmJxbTlQbk9HYStZUjBaMHZFc0RCZzBLeWhYUGllVEZWVmN0?=
 =?utf-8?B?S2kwMzBPYjlmVXU4N2lsdnlZTzdpQ091Nkw5dWttdFZVQUkrb1ZXZjVkRFl4?=
 =?utf-8?B?cVRaSlFGRlVUZERUc3g3YlhnMGcxSFNscFVrTnJweUtKSjlXbExUbEwwS3pv?=
 =?utf-8?B?TzhzYkpXa0JlbnhVeDJidnRDbHlsMUcvbEFZVHltQXFBRzRSeW12QjRLeVc3?=
 =?utf-8?B?ZEkyaS96S2hUVHhpYXpmaVdYSlVpOGYwY01HSHFKUm9EYjVDTUozWmorYnY3?=
 =?utf-8?B?VE1RQUF4ZTdCRUIvM0huOXpxZm1mbXZkWkc0V2N2YXRxRnQ1T1VRMXBmTGsx?=
 =?utf-8?B?MG93VHhPQUVJbGRvUW5SNlEwMG1CSWR6UlVWOUErVml1S1Q1Nk5pUVVsbWY5?=
 =?utf-8?B?d3YrY2RsNG9sUGlyT2l0bkw0Y0d0QzQvSFMwYXBUZDQ2TEluN1duYUFPLzhl?=
 =?utf-8?B?N0pibFN4a3RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRuRk93QTcxeEFvcFlCalBUUXg4UU52aEYvNU9ZTG5LZUZCS0lxa3RhMmNu?=
 =?utf-8?B?ZldPRVBQck44eXdNYllidHpNUmgrSzNybTBka2NRSVRUdU1kUkhTNDQxUFMr?=
 =?utf-8?B?TGtzZUV0a3NYcVF1bDJ3c1NOY24ySXdkck9zRUNsY2JPVitaamE4alhLUEdM?=
 =?utf-8?B?b09iSVdIQ1Zpb1FtbDNLUnUxM0VHMWhIWTZsMTg1Mjhkdmt0RzhCcjVuR1hu?=
 =?utf-8?B?UUZLMEgvY0VMeVFBZHcxNzdYR29tNE5OalN4bzhJWThySmxNTExKY05VOVAx?=
 =?utf-8?B?aHBxUm5OL0xsaWorK0RYKzNBVytnbkZKMlJNSFFWQmlGNjdJN2M3MDkvRGJv?=
 =?utf-8?B?OFNlUkxqMG1BRTFqZnYrWUViZGU0S3NHenppNFJoMnFmYWZUMFpDVmozeVBr?=
 =?utf-8?B?WjB5UEV2MUdlUmhKdG5YY1FjaWFGLzc4MlVlU3pEUnduTmUvWXJwV2pvOXZt?=
 =?utf-8?B?WTRTTis2QmdLMVZjYkVIRmk2Tmo2Y3VVMVp4ZXVWMzc3YTEzeEZQREZ1Zlgz?=
 =?utf-8?B?MEFGWHFMZzBZYkFpNmJ1S1FBTG4zSWIreEVTNTdWN1hwTnhJSUVVS3JVMmt3?=
 =?utf-8?B?eWZ0VTc5REJTdVYxZHhNZGZxcDNLNzIrQ1R6Z1I0bEVCZmw5M25senRUdnJX?=
 =?utf-8?B?UldWREpOdVN5ajgyMk85cGM4N2NtWjUzM3dDdXViU0tiWHQzTmpBR0ZGWmxU?=
 =?utf-8?B?cTJsOWJHa29XbVAzWnA4SUNHWkNRcnk4OVE2ZnFsUHVLVm9DbzhKZFFFL3di?=
 =?utf-8?B?V2h6djFoN3RvdFFUTERiL015cDZERExvL25qNnhYRWdDbkRJZlBmZDJycGpx?=
 =?utf-8?B?Wnp4WlBXNjBWdkFMTkQrdFZwazRwWmE5Tm1PeW5sdGNydm1EYzBKOU5GUWtJ?=
 =?utf-8?B?S2pVK0xXaHgxZ2tiMnlkSXF6a0xnbG9yZEhrVTA5QXFDSkRXa3piTG81dFNv?=
 =?utf-8?B?YXB3c25nNFJ4bEtHSWJGc1JrMXZMMThqZlkvSFhRbXpUWFJhMGtwZnBrM3h2?=
 =?utf-8?B?S1RBYnVFY3c1QVlHT3Y0RkE3bmFmeFJFYnV4NXhLZVJ6VEVqdzF3S3dONzVO?=
 =?utf-8?B?Q09ybGRyb2ZLaU5mVHVuWllJZ251T2dvTk5GRjZqa3N2aTZqY2liU1lEMkl6?=
 =?utf-8?B?MEQ3L2tTVWc1VHVGSGdrbWtmK0VvSlhrQ2htWTFOd0N0TmorQ3NJVUdZU1pw?=
 =?utf-8?B?RkdUWGh3STVTL0NXVWtNZlBiZkRsaThpaFVaZUpaY3JVeml1dDQ2azduYjVy?=
 =?utf-8?B?ODBPUktZZTV3U0FLYThPenRYUnZrb3ZvT0J1SlVkbTc1T1pnMTJGc2t6SFlO?=
 =?utf-8?B?dXpiSVlERk1KWGFKV2pTTUJuSitiLzdNTTZxbW5EV1RPeSs4UWNTbmJ3WDZh?=
 =?utf-8?B?cW5GajRvckdtZWs1QkMrU0VzVlgxYUhwV1lFSjNCR1J5ejMzemxZZ1A5NmZa?=
 =?utf-8?B?MU1nd1VKMDA2UU5WbFFnYlM3QkRaMUpSVWk2b3ZmeFBJSzFWazRDNEorelkr?=
 =?utf-8?B?Sm40dHhUem1pU2wzZVc1YWhvRjltQ3ZBMWtZTndqTW1PdjdVSzNpMzFuYmVV?=
 =?utf-8?B?RHlXTEpobjZTMXVGdEVHUDB6a1VSVlo0b1BNZHBEK3FkV003bHpCT2pQeTlR?=
 =?utf-8?B?cmlDZHBreXlIVkh1OUwyR2RkcVpSeUxXRE9OYW5UeTJRcDNGL1pBSWY0OWM5?=
 =?utf-8?B?Q0xXZWpNVFA4MUFyUHM0K2tnQ3NqTkNjckxzYzZ1dkNEQmtQdVBGTnJXME9m?=
 =?utf-8?B?U0l6WGYvUDgwRDduTzVPOUxPbERFTnNCdkVvUm5oWEFzSFpuemY2dE83YVpO?=
 =?utf-8?B?UHY4T0dJNnhXSzA3RzRrdWJiZEN2dG5jdVpMTUtkY21qK0tJRkF3elI4a1BM?=
 =?utf-8?B?MTRaajcwelVyR0VnTTdzSXFnSWNBUlNENjJmRVlqTitSSWEyVDdFNE5UdnMz?=
 =?utf-8?B?RStFTy9tMVVOb25yMGRkSlNEMllVMDJyZmh6RWxyeCt3UmwyZCtxTjFOcHMy?=
 =?utf-8?B?TmRLS0dWUTN4MFdoTThGdmdaZXZDYWtsVWpsTjgvWEQ0c3VlVjFHaXlxbTZt?=
 =?utf-8?B?cnRWUTJuazRqcHNMOStnKzdzbGJRcFpPVTFTOVhiOW5wSFNFVzNtQllOSi9J?=
 =?utf-8?B?aTJuU3RQV2kvMVRuV0Rod29NbTNHSnZDOXgzTEo3Sjlrc3Q2aCtGbVZ4VEVw?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dcd861-986c-4329-fbdc-08dd1eb33a26
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:28.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LACTWp2yzfIBwTRS9/xdG2TGc15yWsrvGxjoa7ov6edDiQ7ipIjbNvVBTFyH5W5raI5w0f0mpygiONjfINFGt8M+K7M7SplCnsYf8cZzQfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_075536_044441_BB9FDBBC 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..c2acf5952d08 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1282,6 +1282,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.34.1


