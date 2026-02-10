Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5734CEB5941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mYK5Fs2yXJjEH/F4pvghhT3wv6284alxFeNdPkj5wyY=; b=r9e6bNsjkiu/keu9RUnFx7SEWH
	kBMrf8ezN0N4IeemIuM6aDo3HX9Pay+Q3AjQkZJOpQmvgbgZZWxDosfPXCrCME78eip1AgwgO4okH
	PrukheHscLotp4Wd2D9ndqsmOD9A+f3r+PPJauVXOP2oHbMHMzAdU3DABUOsvm0o5TRDEbKuS/zMU
	jmwSdir1t4KSqLzc38NK3JUdF5kpX33bjxKpfGvK3wN0d++hl+U3C6RIg/w6lxVpnh1J9S0GfAWp2
	/B8k4xCMxtNylWQexeiSAxxFHK6U25KRxCjtf5Q86mH4GykQnD7gMTpkwrbW0oTdnPMxaA8u615eD
	pJ2ZBY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpxEf-000000001M5-0u1z;
	Tue, 10 Feb 2026 23:33:37 +0000
Received: from mail-norwayeastazon11023093.outbound.protection.outlook.com ([40.107.159.93] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpxEc-000000001LX-0t53;
	Tue, 10 Feb 2026 23:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMJERc2zclL7rVN+EE3biqoBPiJrFQcca6hCHG5UEc2ArnpCaKE8bhym2AkYR1ENd5102bkoNLY2bT3alLR3rnMypl7vo2eyHKyWWKAS6lBm5ZtLlY9/PP5lKb6cveSg6XyeCPWlxAxqFC+HmhcSdeb6OHaIiITXGH+M/NjkUZ6eiTAYm49Nfaq+dzNSKz2PPvsmL93Wb+LJGx+BJJUKbemrR6JJkBn/2BIcRLFL63fb9UptVoNGY/PuU6Xcjiy/WvjjNmWj2ulEDJuOGNwqM2eOx0U4BjLhTn4Yu7S+ebv9NQfRku5+gEzCcDjff614qhvS23gzq/rX0QTJDl+w3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYK5Fs2yXJjEH/F4pvghhT3wv6284alxFeNdPkj5wyY=;
 b=cc/q/5LVNPxM/JoqoWfCgpkMEOf45MIKMiO25OjAYxMB5wl+oVUQzwK2SMx0GJThvwDLRjJOoIDn62DEkZD+dAXztjb1Wa8fb6WZyDlRj5pyOxBYiIQZPwTmFRHOxJBqQ44c3Cah8OUuMFcu0JAL+lywMksjdZ4d06/xNKE5uCbQKxIcNQPWpkcWGubslcWuY+yGLqB/uGB0StNDnAdQkKleR2Os5Ldou/2FM935VORZIzZr96u3URVt3TC3LCTpzKcK5/Hvh1yeGl7mFq873zQokSxsJjg5nWaq+oQygE1Nw9Tu/yTycGjMsW+LZ9vt2dTo1t1EPjdD+EGrbLwXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYK5Fs2yXJjEH/F4pvghhT3wv6284alxFeNdPkj5wyY=;
 b=GZXo1c+NytkkWhreKG0PoMvKrKGf6I8DseU5JmtorFlIpowBsEBCruKS7oZYu7mYGWtqW5wa6so/PGbEEjS3nxvtnTct8dN8zfIkMKDjN0UWfVSf6Au55KMoqfIVeW/5vVsP7TT9Mq3KJSJPGgomPz1jrNb8RAbd/+GhfpDjqGlo/hfETPdoZ8YNYxTMlMqsP4vfLbbyzpCU5PUDwK7L/IQtx0lfqUzgUuPettY/CkTv8Sz9zEhMLijPVMkfB1w4N+ez/7RUoP/vvwu07qY9+Ap70bdB56cBNQizPgxJodZh6GHS2cskD66KKwbWbwg73B0zAvnSJZ5K6ieOYnpv4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 23:33:25 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 23:33:25 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v3 0/2] ARM: dts: airoha: en7523: update dts
Date: Wed, 11 Feb 2026 02:33:10 +0300
Message-ID: <20260210233312.199766-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0016.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::8)
 To DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: b783858a-64e2-400a-1ede-08de68fcc8de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UbxD4TZncfxbqWc5fG8MZYCPVIrym8UgqjtvClUb/w/MekrdM2YGZZvNrbT3?=
 =?us-ascii?Q?dBODKTkotMKtEPQarDg8thIhVw9QcOmw40MYK3SEem4FWQarVq41HbHZteM1?=
 =?us-ascii?Q?EegHkycWPGREgOu946B7cS9wzhkv6sVkO7hTlpmJwwOzOmRywvyEdwQ1kjQj?=
 =?us-ascii?Q?yKNWS1KRzPDVPq1NsvRu/EYtq2V4T3tkBu3UvIcAtpjdXVwgwRcZkX6BVxQA?=
 =?us-ascii?Q?wb+5Mwvz5V0dqRF8hnQqEjUx0bt8heMRkIYL7RyqpvkcaFze0lbmyaOFOw8p?=
 =?us-ascii?Q?4SlKsSFIlF2viT7OKSn16iVHIcKAw7QVZ81jIVJVZjGlK0UkdK7b7NAclLeD?=
 =?us-ascii?Q?PyvsYeuXwXYwgOsWaDvi2VWLRPs94lXokjeXDyQlZEQbqVWhD+a8nQZsAnHC?=
 =?us-ascii?Q?uVMp+6pQoBjUY6Ce+iJve2kp5QFfPBZMSrrh/NQY+aYVX35GivTI8d38Lhrf?=
 =?us-ascii?Q?LXBwtQDcSStpFCqDB39pASEZyI+RS6mQz8wloOsrJiUAKH0SNatPrKpNkFfA?=
 =?us-ascii?Q?IozUqcX7CN6c3ocDdz4jCwbV8rB9B00NaZMtUq3/6RLaM9kBRzIQ86tUK3GT?=
 =?us-ascii?Q?ZKxKt9GY/IyKOdKHXn5b8T4wGI3ItdTv7cWbGItJLW9ByyMgGhAlfoTjCpDs?=
 =?us-ascii?Q?pCT1Voa7NV5r2ogXx/0d6br+Vo4dpuZTLH7ahMsTXKPMHsUGs4Q+ndAPEZZ8?=
 =?us-ascii?Q?rEBUpbutmUIIkNQb+aHw9nIRjHlQKmG7MluJiz7NchqiOo+X5hj0+VRHJ9a8?=
 =?us-ascii?Q?lSZvaY+frLR1vU83k52f3sZpld/lCIyrrybsOGgd42Pzxt0baPPUZpFZGYG7?=
 =?us-ascii?Q?GV/KvUYsphPurLeHUVNwsx40+q3l55y2kZaaXXG8kfKmMMthK9MMRtXP7Rcj?=
 =?us-ascii?Q?autPnipxyY+Mn7E4EB4IJlJK7N94pdRWFxPyzNs2Mg6U9icH+kFwYiEZvLNz?=
 =?us-ascii?Q?S8z+SRszzpQRNlcql3ZKxNAxDzicb/l2adS+WLgilGo1LdidhLpEjyrorQ2/?=
 =?us-ascii?Q?sCPCN5Gwj5kzuaRZUqz8zpNHXevB/PkRCiNPTp+2T/e9xouP0FY7lpFwZHct?=
 =?us-ascii?Q?JkWsWw9dvBQWwB/9659qXs6sdppXY0+2fAJkk3zwLWOGSLgg4fgewZ6MSHiE?=
 =?us-ascii?Q?CcbBFK+/ur2VxNSSWShE7kE5K9H9zWWJEI3Fcb/1RgUgjlCfIFMIPSb6Sjt6?=
 =?us-ascii?Q?Q3m+7qiFck90MnIvkp3NkeylrnSI4DpNyJKMleKDIc9H4pYtx67jETOD4yUb?=
 =?us-ascii?Q?kjk3cgdPgEmMiTCl4YemoZjfVC2bEIMAmnrZdOL/Y0Y9CIks+dNagoOiIlwy?=
 =?us-ascii?Q?d+ArkcLVBNx2dYtNu06hFuuN+om0KTXXRSORPQ6XAKy8/PXhvzhuhLeakFcC?=
 =?us-ascii?Q?0SgDQ+QgaArABSN1O/F92i0enqfifJvJYu5/Mn2UUQsRF1OKCptQ41I4GphS?=
 =?us-ascii?Q?Sbz6uWwqwX28WWt2kPD1IBS+XmdZPEMo54LtmKlY2XyV4Xy9yaXvoMyC24cl?=
 =?us-ascii?Q?NPS5aAviFs1UN1S88S7mhaRD5vDX8CupjzkyxX01FW6porLvcBDWsjeapABU?=
 =?us-ascii?Q?njQufP4mxNLnVEnFSk2BBYA5U6fEfSSXBB2o2SGwJOJNZM15anh8SWtWvAFs?=
 =?us-ascii?Q?DyQmG13d9wOZeE42bK5BHCc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXQDk58CQf5lGuVRCqx1ETqrJH+IryjUTfr0KCeSpBAzJDiWZ7d0969Ax65p?=
 =?us-ascii?Q?pCXbgEh1XzUjfBNUxlxYDdGmWwfdTpBtWEdtl8RTnHzIpl/dbdQi4ZXvyIFp?=
 =?us-ascii?Q?R/Z3rfe4uEv83V72CBt37Hjaat6RKmEpBMiegl57/OIXxQFIh1MeOYyYNupi?=
 =?us-ascii?Q?D3ykBr93SuZSNpIrPyOrNsHVfamrDGpauc1LPT2bY24oY48RAjqEB89DlISS?=
 =?us-ascii?Q?27PKZn68PxvHKnNe36RFWNWUFYcLNVFdnzia5pcembvByOLpKl6kpa4IIaGo?=
 =?us-ascii?Q?86nKhp3jKB1C/PPYFmVR6Kgh66et8n0yfOSUxddIA8aIIKxr5or2SBKcQmMD?=
 =?us-ascii?Q?2vvRa+1AZ/0cLdPnh2yMi5cktNlGoYjzS8ydI+ko5u/2vU+36775koXtXQJz?=
 =?us-ascii?Q?KeXLVjHJwYMoIWDN59ChUKcp9gwfm+fLbhTLxvg+2nCO7+f5LvZqsvhkIklP?=
 =?us-ascii?Q?1simEohilYJLy23BwRyX9USe+HDNFxWsqTy5eTr4pQ77Qny+q31OU+uMnYWE?=
 =?us-ascii?Q?FMBd/QqA6aeVkElm8VmgYyoQp+5NWp6ZqEffHny+fPUKjGkh0TCYxbfLUaQF?=
 =?us-ascii?Q?k0o9htwkFDCvOsEIDDdOTZ5u9Rdv+OUkUl8Jn2Ht+g3Ag5HxlISG4u2SBLlw?=
 =?us-ascii?Q?PkfRjndKyIJPZQy8Baoo7Rgg7pftDQnye7Kxpr18J47H9UhSyMFXntZjrwdt?=
 =?us-ascii?Q?fm6PvcutfRDmqTIGWOAYabZyqk01kU7WSSfhyb6hOA6QjsAes7dtdbXofhui?=
 =?us-ascii?Q?piQvKfUXzKmNNxfx65+YjJ/+MHyxbmJLGMV0zYmdiFBJKoP0JfFu94rys3om?=
 =?us-ascii?Q?6ms5n3ZEWUzBpTiEzEEZv8rSVTkfknW13nk3efZFGemkGiHH6Oh0Mju3gn9u?=
 =?us-ascii?Q?WBqLknC/Y2Kq3n9J2dGfzGz78tZFVxryaA5jGYb2uHdX46V+TiSdpO55uima?=
 =?us-ascii?Q?O2wDMDVI6eo60Vyyi4JbxtTHFYcgTVB2LWZ30f/TwulxkFxo52qWCQgSvV3T?=
 =?us-ascii?Q?narULLlZXfDnHfZavh/kMQdmTFu1wdL2YYyW2l0+bm8hkA0qzDgtwwFKf8nd?=
 =?us-ascii?Q?INR20eCvBF16OTO2eCBA7Io3SzwpJoetXFJjFtxXGsVQmCsMocvqQ6m7fjbV?=
 =?us-ascii?Q?izCDsJCS0jzOa374oSd892Ljwt4qwwzF9RAloNNSq3drkmBQwC072+oonlSu?=
 =?us-ascii?Q?YTn0HHp+DmQCLK9PXAt9gkyxL2r6fakWU6WQ0pP7FIPNt/qpvnT/CWVwO8Wx?=
 =?us-ascii?Q?wBYNEqdQHiHaTNrGr9Z1TulHrgtov1VBe0ktESkuiDiOjBLKCo8BUYs1NgIY?=
 =?us-ascii?Q?iPdDk34SVHN5ashXeT8p0RovtbbHFhZqZJN69TUe1LWLFU+zWFzE172z0KJI?=
 =?us-ascii?Q?ZBr6dUCgn7XXRWf4WX8Pw2Kslazvf3nBNpAJghg1DF4Ilc3KgBUXHrebj5b0?=
 =?us-ascii?Q?Q45sbzr3Uu3RPtna/96hAI9MjNR1Zmbgcmonl9pOC6HB4VCd6dh26HiwjfRG?=
 =?us-ascii?Q?CGuT7U+b1UyoPx2KtsSFEGSVnW6H8pgHdGmGxK65GamU/MCgzn/X3ZwAB1L/?=
 =?us-ascii?Q?PdBDLDiskk7k0bw6fS7al65+XiJ2Vri6S0q97lakpYe2iMoMoazsojli8EAK?=
 =?us-ascii?Q?oz9QevxAEJrJDcMJ5/Z/P606iEPLuCN+kEUNbtKOOO/f2mHMLSE2jcDIKJFW?=
 =?us-ascii?Q?cCbkoDb43CHhoCaL2XBCY1irvvzX9b0e4eIU1d5xfOdPuml72CNEmOx5k+RM?=
 =?us-ascii?Q?eGigCGka/DbKye2/2HMEldTK2fKVZ4A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b783858a-64e2-400a-1ede-08de68fcc8de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:33:24.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntZ/aM2FrcE3RXFApai3Vg5LBhezzTbcLhPB1v9mTiIe9PusYjdg80DVDLE/JY1h73aruO7rg01qorlz1P+M/vqeWNG6HOtN4lY6lP7meAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_153335_539895_23B1039F 
X-CRM114-Status: UNSURE (   6.60  )
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

These two patches adds en7523 support for:
 * spinand flashes support
 * reset controller support

Changes v2:
 * update cover letter
 * update patches description a bit

Changes v3:
 * update cover letter

Mikhail Kshevetskiy (2):
  ARM: dts: airoha: en7523: add node to support spinand flashes
  ARM: dts: airoha: en7523: add reset-controller support

 arch/arm/boot/dts/airoha/en7523.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.51.0


