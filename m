Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5B4PrpcSzsBZ4AE5+fL4wIH8yPt59F8ASAZ7KDlIbU=; b=HnBxsXcWeMlKtO3IbnSlA26oWI
	hLv0+T2gIfxpTXc4OZ663IYI37OJOynAMTKxBUZ43BOvAln3fFfZM8ixP8sxrYdyTo3833R7e79yE
	KbGvb8zo11Yh6Ua+jlGWUalW2l/kfIP0OUOxjnL9nHRe3Z05peXcywfLPSHiGtjj8g1RsE11gZ+7K
	Vuo8hv88Ejr7UcA313N0suSGwVLCzKlKJl7OnRJKKcLbcFSyZ4YFiYbz6gZ2VodUY9KiF6rtfn0RP
	9LJ3BhmBCjUnmMM6jLkqnoYVO1qU50H2UUv63MtrtgiGUIbCZ1ZNH6Gd73gQY/TA4PAI/rWOyMPj7
	jvCHeGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiae7-00000008pTR-2Dve;
	Sun, 03 Aug 2025 15:29:11 +0000
Received: from mail-germanywestcentralazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c20c::1] helo=FR6P281CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiaVc-00000008odo-1QoO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 15:20:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLBDdbXgfj6rdQl5PN8hmiSb0ynzmfzoritxqdZOqfelIzmaw1zMGq9kpV+7CeN0az/6LO/qK3+jJmXtxv8aq2P6InqvyEqb9ANjhPfCTRgT7qjspU4gc4xwJvCNp47nWvTm7KyOouP2H6Cn55LjcwxSMnVn2fW9KNGPH/fVMOEYlNItv2GZGLP9UHWHhXqJnWqPTIs48k0WKI2zCe68CryJ5ZOHvSF3lu4gA3ib72BadwdRqces0Ck9JjvdzI9MoOdGc5oK9bUVpS1J/FHvWHXySSWz0OgHD7zQ1oWdnrw5b4SiH5hDmDtvg+CFun8GdThp4Ib3ZJOryeyhskDxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5B4PrpcSzsBZ4AE5+fL4wIH8yPt59F8ASAZ7KDlIbU=;
 b=hW7zzV87aaSSE+k6ui4V90YCLj1UtJEsHOsG5DrQIJRujZncStsdpN0DfHLoCuW6JAZ0sZvBDTZ+L2JwwLmN4tBQ8Z/qovlsDTKr2ve/dqnIQu81CVqXWbkCb3yvfJlnZrM/L7IH9wIqhh0OtrJy7gVcU4ELjL2blltIjn/vnz4qaMCfmgNOe78HiIAAy8t3Z8IfLX+BVvhpbYVfcB49yzmOr6avAt/upbCJ1HQ7SGnV3j69nn6e7jf2IZZ3YAc7jPWBDR71P/jqZR0BOmkE83IHWh5cnftL0OHNWim3cVzKX0UDwnQ/zoe4VWQDpGdLhtdJb7WgBJdXf+UKDioKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FRYP281MB1898.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 15:20:22 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5%7]) with mapi id 15.20.8989.017; Sun, 3 Aug 2025
 15:20:22 +0000
From: Tan Siewert <tan@siewert.io>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan@siewert.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: aspeed: romed8hm3: convert NVMEM content to layout syntax
Date: Sun,  3 Aug 2025 17:19:39 +0200
Message-ID: <20250803151949.68618-3-tan@siewert.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250803151822.68080-1-tan@siewert.io>
References: <20250803151822.68080-1-tan@siewert.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FRYP281MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1e6a51-6585-4140-c3e1-08ddd2a1437a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|52116014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z9v3/n+/KbJtHOaawBX93tFZoZfcylwoESfwxofedzUIovFLUF1wX1TxdYWc?=
 =?us-ascii?Q?3FkzuJpv3xaDxjA6Lnl/opNKNJyXSnZ4xFaH8luQ+V/fwJBNTCNHLnYOk21d?=
 =?us-ascii?Q?KUa+ANOeZVeFInbGHugry6Gd8UamZboVqfpd8daryKbCX0trJDpGJ5X00Y/z?=
 =?us-ascii?Q?V2acfE8iyMoI8BW9zxtWyL4/FkuGkzQ4WfolpReLnMP+KuaJr/4aZdIMLjWz?=
 =?us-ascii?Q?UfYn5PmIuGOkRyPSthJbMQ2jD1MroOBwZ90dY0Q35P7Hn4hdNg/zOY8meXAi?=
 =?us-ascii?Q?QDzJs6rRM+PEVWEMNzEd4O3uxVwziX/FzGVRlkS8YDY4fI/+9TWF3W3bYQYi?=
 =?us-ascii?Q?z9xNM2WhJcSgwAI1bwgZaIDBVvDfp6jI76fG2w/iNNA5gjtPtRlw/xfHX6Cl?=
 =?us-ascii?Q?5kTJeYNs3C7MfUCzP2yW3HnA2XUcmZmpSUT/I13QLl3lp3wPN11BT9VBvrFN?=
 =?us-ascii?Q?sRtO9APxnUN9Y983S2UoGakOgFqJRqEZhFonpkr8LCvR2DEHkgzeJ+wEhKxI?=
 =?us-ascii?Q?iV5yr2q9fxTh1wysPult6+gMMFBuyJTuRQsVnMh7U21IIyGSVPr/RkebEADV?=
 =?us-ascii?Q?cfk6IsLnjUR+miXsmIfen6PGtuqsKeW8OyZ4YW/X70O+d985fx37G6WWWJ4E?=
 =?us-ascii?Q?scuQlfbTzglCeqMEC5Ti6K020WcEc0WkDFn/lrU+2p7+brW67qQXPNng5w6I?=
 =?us-ascii?Q?Xu4r0lywIIRQFAwnCH9TxNIEUI2tkNLJwqPZL74daFZmj8QaY77Hpxqrzbi8?=
 =?us-ascii?Q?o4JXiZsgQ93qAvrn850BgEMAtmqohK95leoYYPzssn2tbjVNNRlT7KYxBMWn?=
 =?us-ascii?Q?Lm/BplSTUHXMGyF8m6CuwNx0cLFqyV5zQ+d+h2srj1bdfzQuB+ix+vqkawiU?=
 =?us-ascii?Q?UJgd8INtTNAWJVzRdsm0jzC/u2iqhDnABkLYKvU4giS48OZaA9EvxfZ9hw7c?=
 =?us-ascii?Q?OZhQMl3vUGwPuSwFHUIKnnIpR0gTQyDadz65r8iTnsuKv3aRk04Se7lEFFQ0?=
 =?us-ascii?Q?/5Jo5JAx2NtJAfxJNAVtfSpxcAWJaeFmoTHkKxvLRbEqhuQFHZYCIAem1gtI?=
 =?us-ascii?Q?pQZbBLTgNoy5uV01lDvxKuOnjDnVKMMR98v8KM7cZHcztS0oO/0T4wIxQVT3?=
 =?us-ascii?Q?ikuPRUtFgIqK0boBo/hdxVb0+CIcdc4jj6kcDijbnYM8/uw5iH52Squv4eZs?=
 =?us-ascii?Q?9c5rSAfgubgDtvgrMJp48Ph4QS2anGlV7JzoPwHxVVbZXneXGA6B9M365XQE?=
 =?us-ascii?Q?yczkBqb131lGZBlCcxcVAMv8dtkZpG80nvf2gqd8enPF/YYg3EBRnuzgYpg2?=
 =?us-ascii?Q?iYV7fdKIEbhqsC/Gs5sbjmizn8gJdZOza6pW4SlsJxZNllpj/rEr7ZAtiBhJ?=
 =?us-ascii?Q?hDvPHyEc88YuhyjCkocZw1A1rQbcGPU6Fe9VMixXjZHXJDEStmSpTthRFXQT?=
 =?us-ascii?Q?82WBUjViYls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(52116014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tqAlyh9KX/29QPkR14sTKzZ5b7tdFMzycic56vg9kPoTb1vu0hs84M2L9vwS?=
 =?us-ascii?Q?nYxRrcFKQn6eROhI9jgxbBQqCb+DLfjvUHRo3DleVNVSIQGq5genG6W1tzSx?=
 =?us-ascii?Q?gpvDZmQGheoyRxJZNPFl+WVqv4cyQBL1U4DxFF9vFlk7mGHMRaOiIPZ0ftF/?=
 =?us-ascii?Q?fpF+qvDSvgxF5Q11vUOFSbR7mp2zhEWOXxRxyld6bV1MU/MH9mugOC2S+1iH?=
 =?us-ascii?Q?l2VD1cWhUG/wCddTvyz/8h+RACEHv0hAiS34FJ/D1nGo34LaAct4b0LFbOk7?=
 =?us-ascii?Q?wCmAxNSAT4NnPRaN52plShx8mBNmTf2SH+VqjJPrnzVkNbqbLiF2yReTTBNZ?=
 =?us-ascii?Q?0DerjVfEVR6rT0QUNuj1BK+9JprXpvFrptMbiZi6x2cQ7Ixl3OlMDcCTJB7O?=
 =?us-ascii?Q?HwFaekPSH90bKIVXCxOyyJVzN/pgsHgy0UU/ZXGM6eeq/LHhl0S6DtwspH56?=
 =?us-ascii?Q?2EF67SQzo1pji6iV+pqm7qEzmrJuqosxfCsCzvQNmGqR2wrB+1jXDPTcE/+A?=
 =?us-ascii?Q?ERNX57mp+uQYXIQ0hQvq/ynLZye5vn0y4nJD2H7xb+d41slagBCn31WRTfKl?=
 =?us-ascii?Q?5zrwOkXnYg+sJ/DZQzPsHmwvE5ocS99NNw9iqX/wbrW1CTvRMj8h2rpgDOVQ?=
 =?us-ascii?Q?gf9RKPWujTR6tSHuunBpuyCehID2fNASj7ysbsSo5Mls29rzI4wnu/Bcta4g?=
 =?us-ascii?Q?7AuQx2xv7A47py/u/NzRsh+73ustFGymqnng5ae54X5/JAGIEZdg2vpZIuXb?=
 =?us-ascii?Q?F3oynYCRtIjPGxzaQPdbcfBhmi9wGv90u4iFb4RzdhyJfpFr3ktm/ojwL5oy?=
 =?us-ascii?Q?lcabcAKENE7UGFg2h9u51xcLFjqQPC7Eny6y1MQeYw6ZsEiEJWqctIlB7D18?=
 =?us-ascii?Q?xvprXFGkJrGbK0h4mxqMnQwdAdyJBMvF9iuruWX3hOs2gQeVwxx++yZFT1ot?=
 =?us-ascii?Q?NxdMrbybUdTdYXH31rmUhF/d3ZC4zo8rt0ZtvU2Gx9pMiyq7aqb/bCCCREGk?=
 =?us-ascii?Q?lYsZ5qWSi+Nv5Ib8W85AJh42ghwdJ4XQR+9EApcRM58PzkRBhQ00kysJZtnh?=
 =?us-ascii?Q?HtgMhFh19CrefY81lH1U4FIOBzp1ty9/iXVvqwbInVp+i/l+K2A0Rj/hU43j?=
 =?us-ascii?Q?cL+YN3YtXUjciQhPqVSCcOzBZVDVbH7R71gGI8bQrJosYXiCx72LE5K5oKEG?=
 =?us-ascii?Q?sDnVZAMnARuGSJf1WfDU6/Duqsbo74r9x/34Nwffs0PO/uMMiarlmwYlKMiu?=
 =?us-ascii?Q?/hZNGa4lh810cwDU+UlT/4hc7m8KktR1RK0vEvjt8dYa/I0wEFo0QVst5rJz?=
 =?us-ascii?Q?tgdGhDuJAWfX8Ef66+zrdmVsi8q2B5o+OZa28bE8rV2OJszAupU8/vaMlHOp?=
 =?us-ascii?Q?GMjhXneL2aP9JYwDTjKs/QdYHApTTz2k8iX7uY6qE1qQ/zUC6gBhJr13gDT1?=
 =?us-ascii?Q?ZFzaZxco04ngn205X6VhZ2ZmXJx6e0xvAstb07yA5I2zSQxhztXQkeCIkbCB?=
 =?us-ascii?Q?5/GbRzQI7RH6u2S5ZiF53hKN8angl3AQueaEehAYswvSkXTAWUnSzQd6v9RD?=
 =?us-ascii?Q?N1dJa8wx0wBnUlnWtMGSLV3U4P4u/flhXrj5FJ2rP9Mf3J0zRxpjB2DryG3i?=
 =?us-ascii?Q?duriAfeNIm1p7Xuvu/ucQtk=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1e6a51-6585-4140-c3e1-08ddd2a1437a
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 15:20:22.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLTFvoW7RKfAMYXaOIxIszFuf9kqkjsb15Hqm6rvPx+6+P4uV1OyPEJ5jSZ1ixAi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_082024_381767_A34FC167 
X-CRM114-Status: UNSURE (   9.90  )
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

The used bindings syntax has been deprecated and doesn't work properly
anymore.

Use the newer (and non-deprecated) fixed-layout approach. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Tan Siewert <tan@siewert.io>
---
 .../boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
index 6dd221644dc6..e306655ce4a3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
@@ -134,11 +134,15 @@ eeprom@50 {
 		compatible = "st,24c128", "atmel,24c128";
 		reg = <0x50>;
 		pagesize = <16>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
-		eth0_macaddress: macaddress@3f80 {
-			reg = <0x3f80 6>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
 		};
 	};
 };
-- 
2.43.0


