Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFEFA0C21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV4Ouw6alnbJ3USQGJVQ3Lv7hA6N+l+mWBI1AUxY9Xg=; b=FylONC1O6FofuDDuvBf6+RI1Im
	jHbCd8ZDia8oUQphIu3h4gJfyvW7eL/itajkPh8U4yTNZUltNaFCi8h29r9R0B3jxKLssAC3Hgy17
	HEUOu30OepZNRRUg9sC7N1VEOZzsrCf14VLz7/ZRXHV/DsdOR0LMfXYejlTHnAk0nKMiSt5TI2vwG
	l0bmpoXQuKt1A6Fa43KPVPX0FQoJgxiWouKFLJDErBLhPQnlzec+Lfvq/1m5cHJCJlgR3O3+VbLx4
	XLZfrSpc/VgzW8XSXSEGaLr1Az5pmDfLAmkb3Y6IjTik20WhHZ06PsD5t2b7PLc4Ae6FZq+zR/tve
	O5C58O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCrBd-00000000XGd-1939;
	Wed, 15 Apr 2026 03:45:09 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCrBY-00000000XC9-28xg;
	Wed, 15 Apr 2026 03:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbMF5tlqgC/y7SncC2WuNFEKXc35PUyzP7cdqVVl8R9wbngoatHp1HM+TNxPJwRv8Lzdbh4Y8WO9dWWPLNAPocCDZodREeLqQ2kdx5W8pgPc/1y2uq0q+G15VAd8q4iC8EontNReMfU3PN+LhIPPjQrpZ/PSY5Jq/M/0l+CmNGWynG7/g2+laCyFD6KMfjTbXF8bT0DWRqPj51QnBRy+xKZfk+ehKA6kNEWNdpp3QA/vO2g8xTJh4IVnKo2QIg8vQp1UdLfg+/Cqs4mevR8qlOB+zGWOb+Hvwbkuti7YUNbbvp2thLBjDBpB0wDTnqJ+YELEQA1HdtNo3lPwZNeT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV4Ouw6alnbJ3USQGJVQ3Lv7hA6N+l+mWBI1AUxY9Xg=;
 b=XWRdLJrDMne7Txg7rZXSUG9eqASs1cM1vtTlsPXMnYl5+rjBp0hclsReFypjtn+PwsJwVZJ6VtmSy4U3SF3lLpxLUMAE/QkgHDlOWuiyzaVFw+nivyAWLsD7T6Rl9wnmRT1BVsNRuoF+FyssvfTp50wvaJaLC11gdRwX8LUkFonNBeOei9hKhDbp5Z782Dk6qHRb2XlVrhO770a25urltG6VN3o5RwjzolwATALU5lqNFnhqAtD9omjRJ71rfHihC8cGUTOn25hHDKcj2S5CAtwk4L9pg6O7PrEZcj9t9dgh3GT2KGc0ua0oGXSvmjkXvn30vd0Q78jkZDxHSufr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV4Ouw6alnbJ3USQGJVQ3Lv7hA6N+l+mWBI1AUxY9Xg=;
 b=QY1Glyb8B+x795lrxTPL4ntwOVsnUq9P7wrui0uJqLws00xRr583MyPQomOVwd3ul7/k2W1Q0Dzkk0vCpxc3jzPoU51lPFz5a4yr7cVl4VoAHsI/V1DbZEngvBCsbg8hBn6boDqy9voT1kKDwWHMP5IULeHqOiUsledBWvZerfHINuKZ+u6Mws1AEVCvA9OQmzQYmpYjitJje5QQZJLMw0p79dLgUPnJ74KjwIuZ5dFbLlQYafFAVNr7Af/2/DsNUsL2NaV5/eGEdeQCd2j8u52kmDXnBYamBNq9uTHK939D2IJCL9vOwi/ydpYxqh78LMvXfr0kKEziJdb/HkNTxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:59 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:59 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:55 +0800
Subject: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=1233;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=PvRxGN/bOsaHmWd24MhEdHNKOF9JiMqrU6U70YOV+5k=;
 b=n5IKQb/7Ww6wKS9EwkYlLggQwiCleB0rRmhoV1MJzoaulk7MEf4BRLRqrEcl06HOeEA64ZcIf
 a037eil05/hBLqmlxv3Bmp2Q3Yq7YMsbZ4sow1uGeTiYQ+oljAmz2nr
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e20c44-1022-477c-d471-08de9aa15e3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: IbyUzk2dgXgukFzTEUVGB1fccP8M5lbN1EUdF+AHHig7YIAfzy9qJ1pSM611e1qUreSIchQQfyl7osea4p8FsMy2NWGXBjvliVJ3Aw1sncouGqIfa4HXc2ZE7qRj1se5sqd6NiYmCJwIfoKcEKvDc/vDULE7AuJ4jSfHDE1L3Idp5tS3DBvo80uhEQo/zwGhk6L+wdM4524EfsRXik1gJXXxajjzKduQzn7fTTOxDx6yTnNpUoDmOyVucNxuQUrxnsePFXivUsrp6b2goALFgJLycYKPAahIU7JwsMSD0KQOoe8Aor8q8m0OIkuXPt0JqBkdBAKGApRMqxoHwy5pdR4WhepFdeUX40CAeyB5nUiDTa+sxT1f8dYEwcEQJUj95Z2Uk+Y0HgLdINP3+E6xoxBcq50upwZ8xFe59TgmXJDcCogm0LcGPe5zIY5pBGmsjwwLnOggcyjI2M2zoPBzI6MqFHV/+L7rhK4aT9tEi/ycsHlzMM39Li52IounNahUZoCzZQEHdGheppeRmyhxJshQY743Uf05HG4TI1Y4rbkRsbcIc+6dwVaab4aayN6GFLOAPbDDnpI0ZipAwas5vq5SErgfVRCkPY948e6w5Fb9avnTcljUDG6MHQnU4jY2IvJK1EhmqsKD8xHfMkwj7HWZbUJVT+P8+en8Evi5o3BR3w5+1iBrhjn15EsSo8GunPfU+sY0qdhdNvV0rNBqyUyJ+ZKfm1ahpT6O39ZChz1ci07t/oNvZky7Kvy4avYz0tGheRKQ3ok69yQILExZpggPAYEmYQs/q2oUQ2jOYk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGF4MVEva3lpVFMrcUlmc2IwTzE4QWdzUy9hS1BESllqUUtCK0hIbGV5YTEv?=
 =?utf-8?B?bzJJWTdwVmJ2ejhzcXAzcW9aT1NETlVMSm1Qek9UN1I2b1FjSXU2ZGRyQzRG?=
 =?utf-8?B?V0Fma3k4ZHRjcncxQ2JWRjh2bmo0Q2hhYzZWVnE5b05Ea3BBdnluUjNhQlAw?=
 =?utf-8?B?WGNSdXZ3Zkc4a3VnOHlLWE9HWGROMEVkOWVRc0tJdDJ2THFPNEVjd1NYcHR1?=
 =?utf-8?B?UERmV2JXNi9yQjFZTDZybm90dWd5cVFpRGNEUGZnM1JIdTc4UGM3dFU3VWI3?=
 =?utf-8?B?UklmdGJsQmRUUnZ5eUFmOEIxVjdPamdGbEtkck5uSlpqeDB2WGZobVhpVGND?=
 =?utf-8?B?Ti9qS3cwN2ZrYkZDUlMxamkzTVBBeVJPOHY0ckFBenhmZWhKUWdnZ0F0cDJN?=
 =?utf-8?B?ZHRxV1ZRbzF6cS8wNVFGTWdOMnVpcWo5eVhlYTUwTkw1aUFXd29JZEtRV3ZR?=
 =?utf-8?B?T1R0RXJJcGRmQ3BxZ2luYXRsU0VDSDAxYm1wOW1QYlpETlQ3S0FycTJtUTNu?=
 =?utf-8?B?cldyWWYyeElkZU5kRTEzc3pOTEZ5eHkyTFNXeHNlVXFVV3FWUEVEaDFXZXNE?=
 =?utf-8?B?M1ZDS1RYTkRiZW5md1A2OGJNK25PUHhhQ0t5N3VkNldLK3VXckhvY0tqK1ls?=
 =?utf-8?B?NlRSa0RaazV6VWxOdGg5SE9ZbnVoajlNU1FzRnhqcTNDbkdqVytEc1NiaVAv?=
 =?utf-8?B?U1psRVgxSUdVYWNPazNXWHJ6MWhWZHZGQ1VtVmtSeGRLb0pyeFcyZmI4eWth?=
 =?utf-8?B?Z1JHb0xvTnFTcUF3OVhZRFgvUGFsRmMwQi9sZlY2cXFab0NQR3pSQzVDUzhH?=
 =?utf-8?B?R1hSbzdjR25ET0s3dmEyUVdjTjYvMU1qcUtJdk1qNWFsTGloeFdaTW9UUEJN?=
 =?utf-8?B?UDRibXBhZXU2YnBPQ29wOTdRcUZEaUh5WjN3Zm9PcTZmL1hyRWpmcks0bEF4?=
 =?utf-8?B?ZFdHZjV5aDJUbmlzNzdCSUNsUUVsb2tkbVBwcjlaUC9MUEpWNTVNa2hqS241?=
 =?utf-8?B?WlcweE5kU0hTV2pwTGdYcm8vWXhBQm1KZStVUG9SVmlkWlRlTmZzbkFDa2hl?=
 =?utf-8?B?QzBNSG9Td0Qybk1pSmZlN2xVSWlIY1h3TkpiWHc3cWJVSWFzeXFtMVQrbXdT?=
 =?utf-8?B?TzFHVWZOU1dldTRGUWJoSkRKM013UGRiaFlnK29SU1VLb0VVWU5YRjdGU1lH?=
 =?utf-8?B?TWkxSzEvT2pML2VNVDdBc29kYlNScjRLYzRRQ25SclhDSmgyM2pyM21WVWh0?=
 =?utf-8?B?dFo3MWlvWUgycVJzT3BrZXE5bkpiMnlPdFdjdG9BY3hQVElsdWtLY09WUStk?=
 =?utf-8?B?dmVIdXdTS2JQMVp2QkhqNWVFVm5xa0d2NktvTndOeE55Qlh4QXNpaGh1SnAr?=
 =?utf-8?B?SmthcDI2QlJoUWZLcUlSSTFOQWVIZFlQSTJFVmtQY1NPdWE0NmluZ2UrOGJG?=
 =?utf-8?B?SG04VHpqYWJhTjA0cVdhNFNqSDhwYWhPcXEwSjcxSlZVUDFkZWkzV092aHdT?=
 =?utf-8?B?dEo2OFRJSEdnTEZnRTBYT0ptUkRQQ3Baek5sR3VlVWgyMFhtYTN0bHBQUFdn?=
 =?utf-8?B?bDRxbzdNQkdHdnY4RWdiQUgwQmt6S2hFUTBDZ004WktvNWErM1RROXhxemJp?=
 =?utf-8?B?QTdObGpiN3BLREJaeGREYnNsc1B4YkJzeEtXMEM5S3dGZkxxZGVyVlY1SmRZ?=
 =?utf-8?B?Y21TTEVWM2pBaU54YmZOMUdDRUNweTY3c3UyS3hOR0hPZFdPRUNzUFduQ0Ni?=
 =?utf-8?B?RHQ2a1BHOEI2NVRkVUlHT1V2eU0yVzRFMzNYcnRqL3d0bUFZa0N5K05MZlNC?=
 =?utf-8?B?dlQrSmU0RkppNkRtYTZCdklEaW9GUEdFWUMzZTRQalpWY2pYOEU1MUE2Sysr?=
 =?utf-8?B?MW9VdlRTR2Y5MjdPSUR4SVRqMi9TZ01kYXB1SEtnMHpneDJvOUZkMklNUm94?=
 =?utf-8?B?NFRHVW5WS1k5bzUvZG9GM3Y3NE15QWgrdXdweGp6UGk0c1RCdElRajV0Zit5?=
 =?utf-8?B?WGlIU0Q4b2RNT1R4c2dkWGE1Tkx6Q1pNMGlFTEJQQU9KanRGK2tJOXA1b1pu?=
 =?utf-8?B?OWwyaU1MZ3A2S25sU1M3R2E1WnRYUHhFV0s3VTNLQVJlUG1BL0p2eVYyenhp?=
 =?utf-8?B?cmVBZk5PZWM5d2hzWWIzUm5Qd2xVdnI1aWxlMDgzYTkvMEQ4VEtrc29VREN5?=
 =?utf-8?B?bi9PekFYYXhuQkd1aFBGeDlncVNDK0l4SEpXVlRzWVEwSDN6a1cwWGpzSVo1?=
 =?utf-8?B?T25YUWk5UGxDaEZYRzdnUjFnSDRTVy9EZ2FrbUFhQkdWTFhwYUNhMkhjRUpm?=
 =?utf-8?B?OGVzN3ZwV3RDRGlPNlQ3clNnVWFwTGFTcXNWcmdQd2RLZkRZZkd6Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e20c44-1022-477c-d471-08de9aa15e3c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:59.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOcCQIeC7t3XCjMFi8tLM42yx2OgFP4OIfjmcnC0MZa+c2W+25CGa10BDJEyaGLoLH6YrMSJVAHhA84eQaTkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_204504_561243_02A19195 
X-CRM114-Status: GOOD (  10.29  )
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

The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
only difference being the use of IDI (Image Data Interface) instead
of IPI (Image Pixel Interface). The binding constraints are otherwise
the same.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..78371e039e55 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - fsl,imx93-mipi-csi2
+      - fsl,imx95-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -124,7 +125,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx93-mipi-csi2
+            enum:
+              - fsl,imx93-mipi-csi2
+              - fsl,imx95-mipi-csi2
     then:
       properties:
         interrupts:

-- 
2.34.1


