Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D60C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/taFharZqtGqfqsX6k/IeAfjlhpJ1S0bC3wc7nU968=; b=QqaPXi969YPrg7Umiy4sWMlVAr
	kwFe0/+ianQtEO1V9RPYaEAUte2lGMvz8jZFmg2mWsJqGlOm0XQwVbUHfBvKB7vyD5AA1e7HSS1gs
	Basos42IC/HgwYqHT2brUEqUv6xDESRY750sBdnF0+ISUCmGs2YdGiqtcwS0gRjS+BqEKbhhUY17D
	IORe+8MhRpRyF7/hGgTrnbUHJjzdS8eFUXNIuUNOGx3FE08JqUSFO+0Lbeg1Qp7ceqJ4mUlm8E72R
	sZACJDVn06cDKpwWBkIIOlUeOBw+ZNtcIltlhZFnTBKtKNALKBaseLEdbQbEVVm4kDYAb6C9js87M
	7H6V/m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElGq-0000000BndK-34lO;
	Tue, 13 May 2025 08:45:52 +0000
Received: from mail-francecentralazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c20a::2] helo=PAUP264CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEl8i-0000000BmMW-1bfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 08:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzu9jM49F2Z7OiUBaxaDjDnsh/WYEuEsUY5xMR3dVVQyZW3ft6HLpeFX/fIcDJaA0En+Bf1oNBLu9lvEdlXdzsdJ1/9NMji19UbVJkFgZ0aK4ztSOF2djDOlW3m0O1XXpGo2E7N5wiE3TgYJZv/occ2CNDNOVi48kpd5IuaZAbmInICznJlsdIjWll3m6fZaG0aueQ/kRTtN+Q41p32biaOaIFOgJ6XytGc+YV6NSW5kGAj2GzJ1aOhc4ivg2xTChmqI8Ta9eHnLprv32Mz8jO3O8GzySXcz5lpS9mB9MT7tJ1IhMomrNoH1FVjKViDbEs3upQ9ig0GXEJ6RiOeJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/taFharZqtGqfqsX6k/IeAfjlhpJ1S0bC3wc7nU968=;
 b=sqP+UVpNaJ/UBUDsNfXOBc+Or6mYsnllOaWWzzcE7iwuB2JhsSa4+IMAbcG/y4jRUgesjElRpL5rHJoreVLf9/qdoSstDfjcrHZLHoIk3j4Cb+kvTeXtg/AK086ur4MLrJpKxq9Z9AzNeAXlePCx87YFQst+FfJKvtux5n5+3njdVpOxgS3x2GreDEI4Z9O+n+A0ho/jPTlNuwRttbO45ts5NvGoUrOACr+qbho22/A+60iCNnuUU6/EwIgzrAcK3NxLao9pIBdA2Q+BrzotL2QD3/McgshoVOz2A5/kEBpu1NX2hwrCkvpTw5URKL9hpg4us4u+Liwm25lHHz8XVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/taFharZqtGqfqsX6k/IeAfjlhpJ1S0bC3wc7nU968=;
 b=baUACbbZxKDZN22pemiMsRX7LACc1R794GDYfpjH8/DHeG6gl7qC1brDwJaRvFjhTcXTmu7iOdo7/n89H3hRJHaoaPiq2QzBD+EZHrlhdhVwV43LqdIiG23+1xNoSgqcqdmVgpHaMWd0Qr43kGTSEn9yvUEROTjZqRD3BfBBuLTuC3rCwnjE8pjIUR9cYiGiTdR5RXQrXVAmUcp6Z2g9KLEzaLX1HcWsC9pTcZaLqKSwM+9hhjGTXUGLYb9qPFlTBpJ7taTGk0whFwjOzD901RUkUFRJvH5swIP9qVYHbjH5qvP4z+YCfcJqeyGMG0MxTtfmc9AeZ3SDb5HMo63bwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 08:37:24 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:37:24 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 3/5] dt-bindings: media: allegrodvt: add decoder dt-bindings for Gen3 IP
Date: Tue, 13 May 2025 10:35:48 +0200
Message-Id: <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 970d9070-e716-4598-7cb1-08dd91f96280
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IrJ6/HmSYF1IQv69tJ45VrkweDUHoO2HOJlr2pvjmQ3XtY09R8nv14Ur7aKs?=
 =?us-ascii?Q?yQVKLUAG22POV62Etnkvg0hPcNpryyhGBXtmbywIKGKAVYXugk+WKf+GR2Xl?=
 =?us-ascii?Q?MPou5cV5QDwHHfsPi8T5TjYW4NML8c6l6i0bEdLV1fB34U7brBDDH+XFnbH0?=
 =?us-ascii?Q?7+zVNbUOIyHG+QF23lMRHfpt6+TRVQ8+mVZLfKMOXUs2jo9sKRRx+U9VXiLH?=
 =?us-ascii?Q?Rmk+hMtqcoDX34xmYkCbQkxQ5SQvKNX6CEp3eSiFE7YRVvegoictvXqvCRMv?=
 =?us-ascii?Q?a9aUmmNtHJqHqYzayZUrRLvirGje60f3trbAovP0AOIrUbC/qmOwUVbSJ9vy?=
 =?us-ascii?Q?N7Jho75HD0gGHnt9oyOlfik9I6MWjHoQSo3DGd+k86eXPKYqb8huD1+k4pvU?=
 =?us-ascii?Q?R++F0bXXiC/X5WXtm8/xCEln+UgX2l2+9gP4c53JFi/0Ue8RoK52VeVIUTvB?=
 =?us-ascii?Q?p066Z+E/tG+9i15gwzJoAsbwlaC2xIk1ervefgP6WkRLHMKlRn6BKjifZgLY?=
 =?us-ascii?Q?1Ay+IDdB+JShPNGv/7iVebUCQDrdD7bguWVeOQDeozBXBbehF+FasjWplzNK?=
 =?us-ascii?Q?1Y8S2TwDtxh3DLEmJv/khwRYr6+JPWHPhRenW4vTtEkrIeLcYw9dzqUaNaAQ?=
 =?us-ascii?Q?VlmVZpu7lPyRlpCqYBna4e2NJs9CE0OBoMmvUSMsKJaXF3LkjarFd1NeNjnY?=
 =?us-ascii?Q?vjiehtCK87UqV51JX0EOUtElgqQ40gYmiLiy3FfIWnLAGrv+fJPzIIx/bOdV?=
 =?us-ascii?Q?u1cCC7rQ75xS5TEl4E6ZrsR9InF+24Wcxw3pn667sGqcVoaolhUGSvu8LitO?=
 =?us-ascii?Q?gXnJ0caafOW6mVcxOTQJLA1+wwbdyIYxfp4HR3O7cdFim3A1AlnqXh+jEdkQ?=
 =?us-ascii?Q?pX2uCbv1pXX995a81yCHWJMQKgARksvVM6nxD1H4simGRdtGSZJVKcZNzRH8?=
 =?us-ascii?Q?Fa03PbsIsXnVLLpocwPYDoR2p4FlhjfUjvbNl/MyAJLBY+Uld3fKL3RaRJDh?=
 =?us-ascii?Q?j1/wZ0IgLUGvv2zkH7iZZ1w3+d3wf+QXqy2GHGjmQrj7eXlQirqc8JWncTiq?=
 =?us-ascii?Q?2R3CRe/PY5cAb+MCBWRepSFaRHB2fp9EpqnqVVeF8LD8EKeQQycJSD6bYyRB?=
 =?us-ascii?Q?D8MhfOn74bsl4pkRlc1ljM4EzsBsPQ0B+IdAY3mpQcJX7hmcEWi7OqH5F2Y9?=
 =?us-ascii?Q?Prp8BnMyk6DQYIq0TiBwnib/JuiUQ8Hi+NHTmA1pGxjRVzasHgjxAXhvrrJF?=
 =?us-ascii?Q?lGQlnY7+zQLbkWDTSaKWKRXRAD67NH3rQWcKim/HhB454EQ6HAuCeRijebLt?=
 =?us-ascii?Q?71a8dB9IOGFq14tnwxqR505uOaKkmHytasGzcnlMhkXTck/js53eo23RbuBk?=
 =?us-ascii?Q?j04jANvLiT8z8UXIsa1zWMdh2+YEhSstObAoGAYQhkC3gAOmlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHrLxV+KHUu6eJCndrysI58O4UMGYYl7WwLaU71sxpoSPrbHT0T90VX68+ra?=
 =?us-ascii?Q?m6F6NYUFU1ungtZ7MuzBKI7ETAgerBSScODhwZf6wWtTqyUh8VK1fPsvL4V9?=
 =?us-ascii?Q?bF8aEYaQB+ctVgJ5o7Ngj7RN4j2kwGqpWVFGmWS5QYMZEN0C/qhKGTnCSyuK?=
 =?us-ascii?Q?3IbXL/v+Q/qMxFCtnwJLbVOilUrhIcb3LhcV3AYJk7u6sCxAJPxoyuRGj/P4?=
 =?us-ascii?Q?GNHsJrgQNyo6DYbxtZfenXKvkOnArEKOiI+V/Jsk7MKZl7Zl5P0SzJavjJCm?=
 =?us-ascii?Q?XbFk9d+GbbXrsoJEAxbxKGpqBMsiEAjgZBUVg2J2HoL0LgjOCqwDZx8b4iqB?=
 =?us-ascii?Q?uY1sx4j8u3ylh6QGnSNJxhLUhiZxFfLvnzWwPKsI8Bn9sACPl7EbtbfSJ/vd?=
 =?us-ascii?Q?y+5IAE7E4vHCo20kC/+9yOxFAv/F3U0lTk4jrwjsMkcXYyi5jnmFlgdEk4aQ?=
 =?us-ascii?Q?MUBAoA5rE0Ds+GX7QSjvDQS0mDqxAA+qIWsp5PqnmLaW2Gfs+zZMroJBMd3f?=
 =?us-ascii?Q?XKKZ7uEteuxU5qjKw7R/nvkKXJ1OrVWPBg/nEvNS1oqOCm5aMUPKa17mHeyU?=
 =?us-ascii?Q?mZtgVnZCV4tasb19gflGtlxn1xpVeAPgeGXHMc2Ep4z/3YvK+WE9xY/UuJMr?=
 =?us-ascii?Q?WydlJozPsrZOoJ4c1YYAwQUuo/j4oRCSOZOJeg8YYThT+tiRogZL46oK3N96?=
 =?us-ascii?Q?ZdJ9EniB2Ekd9HQjOTWIp01SoR5MicU1EyFTKc9JcS0QqmWN9HGjJQ1SvgIz?=
 =?us-ascii?Q?ekhEpc/oLKkk174g7NBhdX9P24bwjdoly0W98p/9D2rsGnzRcCLciiCvNmbF?=
 =?us-ascii?Q?mqQsQgPlI4wSyqRLKQeto6DwwrCxuXs0CSU7sbuCP2MmIn31+b2g/ozsRQWU?=
 =?us-ascii?Q?6TDW2l086wHGjvbVhQ9tA9rW1hKXCEucNsEHArIsWEtz8hB4g35Z21Xqjmfw?=
 =?us-ascii?Q?PY7BxuvFqOX9gMGpeKC6nO5OrEpiqMxQ+G10xYdcQpgwZJhZhG5ggYwDWoQQ?=
 =?us-ascii?Q?HI17+2zgZz1q6EDopvI9oRMjX4OONoSMlOpdHoJL91yHLk+c+GzDpVmkH9kT?=
 =?us-ascii?Q?enXKlBXTHfcl9aPZQV5+cLXUcx4iTgvpKhwKd64aTtx5F3bQcgTtvBxURmwO?=
 =?us-ascii?Q?9UCdyMs2tYUJfzw+i7JzibLOQx9OnfYd5KrwN9RiPIXezQnwJs4ZXOg8ozGj?=
 =?us-ascii?Q?jdU38qUO2ZIGr9rKtpx1j7GIdd+FMccF6BgeGda6R91sRfg/DyhB623ZBOay?=
 =?us-ascii?Q?u+oNRjOYOo5DSdctzLZhYP/gPn6klS1/Cw4E8IudA+Ha4d7GX6vgPnwEWBmQ?=
 =?us-ascii?Q?d37W/1YfJ9t2haJDjGlAr2FdanBNbS1GUuHUk3VVLAPzJUv73r0FENM1MB78?=
 =?us-ascii?Q?kwcfot1BgPG5b9pFOSCzCivMG1I82egtlUHYuynuLPyIehm+cCU3h0BtkBlZ?=
 =?us-ascii?Q?mvcNQTXhthVESwd++v5RsFihEp+8btyhAlwLHF14X8eTfgLtwOEz5a0JPljS?=
 =?us-ascii?Q?ym8TogRDvRc7XzwOmOCHmdn+c3OSSeyOkvHvvbavFu9AF8x7mwWAf8Lcsoj5?=
 =?us-ascii?Q?RQRCyFj+BG0CQ2oPQNQQWAmnLGgkb7trnyZlSEus6MCm7EamsJM7vxJ2JgrA?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970d9070-e716-4598-7cb1-08dd91f96280
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:37:24.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5mnBF5x60p2slbTBgIk++Cm1oGAgAik5K4CCjk7UUqQI3XzbT/ZPzB+lF+QJr/i4PcjhnIPh5QXDFhOqEuo39fSYJlB3F2T+DLHpiaehjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_013728_421588_72C4F29F 
X-CRM114-Status: GOOD (  14.34  )
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

Add compatible for video decoder on allegrodvt Gen 3 IP.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegrodvt,al300-vdec.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
new file mode 100644
index 000000000000..4218892d6950
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the latest generation of Allegro DVT IP decoding
+  technology, offering significant advancements over its predecessors.
+  This new decoder features enhanced processing capabilities with improved
+  throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegrodvt,al300-vdec
+
+  reg:
+    items:
+      - description: The registers
+      - description: the MCU APB register
+
+  reg-names:
+    items:
+      - const: regs
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MCU clock
+
+  clock-names:
+    items:
+      - const: mcu_clk
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: False
+
+examples:
+  - |
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ald300@a0120000 {
+            compatible = "allegrodvt,al300-vdec";
+            reg = <0 0xa0120000 0 0x10000>,
+                  <1 0x80000000 0 0x80000>;
+            reg-names = "regs", "apb";
+            interrupts = <0 96 4>;
+            clocks = <&mcu_clock_dec>;
+            clock-names = "mcu_clk";
+            firmware-name = "al300_vdec.fw";
+        };
+    };
+
+...
-- 
2.30.2


