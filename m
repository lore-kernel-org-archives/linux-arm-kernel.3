Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C4CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCorOwqJJQDQ0Y3TcNJ7w1ahAGoqxBylTMM7bCAJniM=; b=ieIYkyGXc20A5R37Po0yeDRWhP
	eCawPBN4YF7t3rUewFP6n/XoTfuSqKQkHnj/TZJE1GCCs1koB5ix8qkU9lJx2klbhRtAVAuhRijXH
	4Tv5vqgqvJt5Thh+vtBjBLmLchtQOwNgQvwnLL5Ab35B8ws/5n1+z4z2UhhMKfApJemiOvdJE19SS
	TwvvF5sMkkdnDfuf46kdD+qpJO2ZW9NO/OkrU37SusM0/SQE9Iz04M8dV9XfhLRib4Txv2ass5rMo
	AC2NLL+kvr8kt5pRHrZi4Gg2TXvALv3NcKFCd67olOeov+QrtduQHJsDU7NVoWGrIyC5CP5jyHLba
	N6W9v6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qnq-00000008sjT-3jaU;
	Fri, 17 Oct 2025 20:11:54 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qnm-00000008si1-3m2B;
	Fri, 17 Oct 2025 20:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvB1rZuFjqX6zSSWl1JhXxChgUlD36bxpzQMRWi+0VYcfbZMBvB5O0v42ooexfkl3n8TEgLJUVlpg2qOtyzW0GJ0Db9Yxxihy5ALHp+4myANVJBT8iTheBzp6KR9mbRH6beyPf6M3+rncC1TSbQ55Vy4HCEd+KRUhIBYrhm0zzfv/AOF1rqFViB139NDZNtIteLNM6JqNmWu8QPP0BMz/b8/8+Es9L32bZEzqXdZXLP0pKIp+eqaXhopnwra693h0fbbmvcJjVlqS5YUrV4SNLGEl8B9NvaHtD4SFXs/N0VSyxJeRqs02Ych5KcAGrL+Lalc1YqpZTWQaganiypGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCorOwqJJQDQ0Y3TcNJ7w1ahAGoqxBylTMM7bCAJniM=;
 b=jaWUPyTLLYjZOrFh4eL5wyxKxzLu6TPZyIVyhvcsGwvhek0kgm7SSbNnTF9NuhjVaLcaYk/pGO7CCVlP1/cDOh5+IazTyK5psHa7ddd3zLP4Q5TO6Z9a1k9ujGsThh8d/lCkxV7HvLga2oXscLp1VZL+TVGmF2ACPXe7YrxhPIrjZBnQ8Zj/3NhNkozEfFAe8RVXFo6cZR1lKe16Yp7Zdl1bVeCk3qdgcraOL8/PaB2uICLqUwtzRLMoz4k6TvKA0ikNbzohaNu4jSZMzFHiOBIpBEofC2B+IdRKDvIyY5mWcJPXrDiinBEEzlR96J0fIldqb/7lO/BxUtwDa8WhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCorOwqJJQDQ0Y3TcNJ7w1ahAGoqxBylTMM7bCAJniM=;
 b=vAOSXym8B0HwIihOAsTEhxaSfaVVYMef22Po92TXAk7FlGer8GNOkSoh1G2sZZpqT/qcT492VjcrbvseW1BYIqpip1VrPasxVAUkk+wA554tVqbY0qkX+RceIp+qAiATWMOLe2gsZbbFcUHKkMSPWm5YgL8WRaFjysFlR62BoZvinpRzXuSrGjQIr5xbsJ0Wbgv8bW9vH1AsGpQrpZrv27HPsg1JS80h8q9TJlCwECTHx7y7XkFMDJCdoMzuLv0SMFZfYQhFD4eo8/WU0ErVxXeTDYN5mpfYwa0Ni1ZMr+gxRENZMxj1zKINFi13WuU56nw7PoTRlMyOHY4IP/d1mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB11247.eurprd08.prod.outlook.com (2603:10a6:150:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 17 Oct
 2025 20:11:38 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 20:11:38 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v3 1/3] dt-bindings: clock: airoha: Add reset support to EN7523 clock binding
Date: Fri, 17 Oct 2025 23:11:24 +0300
Message-ID: <20251017201126.493496-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::16) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB11247:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db9671c-98ad-4bdb-4851-08de0db960c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/4yJ7s7fPrkT1y/jEJ29yffLiJv73yhQttsMDWNw67Q9AOmOkMtJsxdOLSA7?=
 =?us-ascii?Q?+hEEDj5+oUf89Cr+CU0O9KJov6TLgFw67RuBDXW+/ca613epX9bQ44Ge5Ze0?=
 =?us-ascii?Q?WA/6np99YdighKxDmHRj8yI0KSKd3ilChOh8UWGQWmCQzOJ0B6fNF5k90Kxa?=
 =?us-ascii?Q?xRguwHNf9Gb/3PMeC9ooat2OYWw5y3jvMJKXGIG5WRqvFUjSwr7TPmXb9UVw?=
 =?us-ascii?Q?t3dPNkUPHuGIaJZzcET+dL+EoOcVgptN7PYPjzSUiXzk6NA+sgwiTb8j4uL5?=
 =?us-ascii?Q?rYPWndcUvwkp7iX3FRaHglYtzjkiU29gL+vdEMCJCUwXdAOqyu3BQujfJIUx?=
 =?us-ascii?Q?xhktXovJkZvfO97hOEyxv7+THsT6+yBSlaISHF5DEKf+EBNxyz/oiELUFKWP?=
 =?us-ascii?Q?Iz6AiTEEoQ2XGUFrlq93v6advsyNzNmMq9nl6kjLkR1dsCuvUwn1aWzfwsel?=
 =?us-ascii?Q?XvawXYbZS7eqGmyVQLORQ0ez2RZWdFuzZIcGcl2A/AzEr2J/SPj/Q3PYbo4W?=
 =?us-ascii?Q?xffI69349g0QY/JVS6s0VP0GE+IycX25VzTmYOsuk1P4tZJM2nCAkj7g36xP?=
 =?us-ascii?Q?X/9as6Z20LqECaMb9KA/6qoNAECYQ0NA/3d1vAZ1uhcTyhS8pGgHoFWkUZBD?=
 =?us-ascii?Q?4VsoMz2oXGOGDQpDWhNZz7oqEXL7cFEWou7e08ZUTZkja4/E+yRHhxol7flI?=
 =?us-ascii?Q?1J75AZcdrWLREIQYLVMclzZqNl6culK/7zXvTODY3FtF9aXhM9YMLHHE7m+3?=
 =?us-ascii?Q?QcABm6/nMEbHcwWJToqTLdOP1Fkz52p7QwmthrvgDhu0rcNx57/SD0X4hhEr?=
 =?us-ascii?Q?l0Z34fBzUQuOa7exjuMIxnLers1TizOWRlJ7LOVyNziU5UsxlYxMYo537g1y?=
 =?us-ascii?Q?e4F+dKeAhstPEEKJg1MWwSPEEkj8LQs9WrFaF8xiqhtKFJJtuF5ZpMyHL0Tt?=
 =?us-ascii?Q?p+BLxLV7c/JwKOn7At06wESTsO8VqBR3Ar6NnmRAvE0HQRb2brxhtJPwGNZp?=
 =?us-ascii?Q?lbFRzrSb9c7yGO3UqGIHaE1GXLEmQiAtPUxHlADpVUL7NU/gAtAyOjaEwM28?=
 =?us-ascii?Q?VM8BH8HQU/vG8a1gASROttyXvQVZvTl3w2P1Qxi8QWGtXmgW0I0DT/oYc/8C?=
 =?us-ascii?Q?MCQbFpfpczigrUjlsD1pRXtnWylj97inA1rkOJoW8JDYE75PmWJr7c63OXiY?=
 =?us-ascii?Q?YYLe095V5FcNM+wiycA9g4mAslgyFBarUVhIoxTP6Ig3l5RtXHZfikqYOyR0?=
 =?us-ascii?Q?pxT4mGyres8pNxFHFq87ciRXcu3zmxtWh0HNFB9kumVcxB9PXpkk8g3SfgHr?=
 =?us-ascii?Q?8WXo5OYVJMeWalFceX6WI193w0ZO720XgrGNbRc5D2SJR1qq3NaI1RzkJXzT?=
 =?us-ascii?Q?JbbuOXUOKWjcGYgD5yKJn/A6jBKtVDLY2Z9OiYWAWpbe8wJH9Dc6vLsjMfXk?=
 =?us-ascii?Q?mDoWIz0AXIw+ZKNM8gMjBcgfOPsDVg/j5CiJa3OPQMduZeF2Ytfsf9AHQhbw?=
 =?us-ascii?Q?xzUAGPlhNbUwvlCekS4VNnmjf02/Noai1QzcvFrk+uiZ89vu061xm3Wltw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Dd+bunyob+SkNMjxOU1eL8v3avrGgiWIPOtZwt8xRZu1LAYB1V7+uJPMQkG?=
 =?us-ascii?Q?HrCgg2BQIBt5Y741fu7sd61RIW33vComtPnvT/aa+U9O6vBWLtbhRO+dyp/x?=
 =?us-ascii?Q?anJLPpn8+jlVuj0EE4odwP0YrceIc3Bpyig/BSguZhkMq8qT9jLQcxZBcBGe?=
 =?us-ascii?Q?KtM7zSHsqnI+oVICfcbvSP4bcH4ZemjAO1/tO7OA+ssPvB0cYdUFFMJpOxSG?=
 =?us-ascii?Q?X7Tonk+QYnVnJWFLJoYqz00ZExCW5DtcdYH7mdhvU6M0s+8GNY5B9P1jKcSP?=
 =?us-ascii?Q?ZuoFoFm4KSPYAe5vAcM/dXyn4ahptCucWOnqRg0o8938BPJW3yTiqxcbJiUf?=
 =?us-ascii?Q?CD6LvlRr7leKF33tJlT64MBzK03xxGiBL64OB6dyAENlm4D1GltUfhk7mg5W?=
 =?us-ascii?Q?Vkesyf2nznf9C4V6J2FbsqMwdlWvqb0sKy36h7G3lb1MWHlYj2a9xgHD6LM1?=
 =?us-ascii?Q?nzbj65xStHVLqptbgeXCCHpqNKop8IW9j0mdMHHPxFQ14Ck6XVGlqRpU9Qpm?=
 =?us-ascii?Q?q9DR64jZIj2qgx0VyK5O0HiHzVoyduKXyEyqXwI+rBJ8NsB3rpYEVSfXAoXx?=
 =?us-ascii?Q?Tl1yDE6lSDf6lSoRQpMFpMJaFLtv4UPaEA3defGUcl2NuAAjaOEqUcJx+9eY?=
 =?us-ascii?Q?RrYG9av/mJP4qTt/HGvcUZ30DhadaYJF6dQei7mnTv4+OnPa0+grCkLP12R2?=
 =?us-ascii?Q?tzx2+mGwXBm5KBrSEyM0/7M/rSeO2HSdt4vYm7gBR5t/9NGYDstDlpzZr44/?=
 =?us-ascii?Q?EXASh2wSW0JnmfpywCNdT0GszjkFIfOzY8WsJactlK68JV32qZILpEQV4JaG?=
 =?us-ascii?Q?gIdGrFZ7W/5GXyG44UgrTFwmu/tuCZXVDCZ7HCEYRtl34SMK1e0q9kq73DaI?=
 =?us-ascii?Q?u8/AbVfZ6ekX1kctYpVHuXSjlJ/75YyrXlFTg6mHFVehEJf/zvrHaCPik+TF?=
 =?us-ascii?Q?qugiNElqdVIhXwu944ukeQcvpgitGInZHXRlkLcpj0u7i5nOxQRKHJY2gLG8?=
 =?us-ascii?Q?w3xSs+HrcjHBxZvb5AjBTolIIwgaakU2w+Hc4YlyqoX8mj1Pvi1dcrZ84WlC?=
 =?us-ascii?Q?b2MOCuMUtRakoIEXLVCrEhVbhnJRt6kOGeHo6HzI9XZQwagwEq2fuzpuECm+?=
 =?us-ascii?Q?H0S11SUlK1cQwY3v30Pri7Yp4sxQcHEfCZpW9G8SK9rhS61sgeBn0WUMameO?=
 =?us-ascii?Q?gpqLsqvgLVDnyz3+v994VLA/C2cp3e3fllVfICRpJ9WhVlP2tRX5Q1JprHmw?=
 =?us-ascii?Q?JQIpm5Z0ZUnMfrjdtwfEWL+nZ/UfP7k+IjyZD0zdSqSyNLWVvFG9puQNnplh?=
 =?us-ascii?Q?6dGW3JcZisWU3NRTItlZRyIkoJFW7e6HLQxD9Gn2agXNN/apY7gOtlZZXbgu?=
 =?us-ascii?Q?h8h1qrXBsq2AMjkW0bOsfpMc1N8SiYQ2Dpow4L7dpM3EcWmOUew16LjtPSD9?=
 =?us-ascii?Q?qNc61pbERuND3f3Q6yZIqp2cDrL85f5OuFXMRQV9t7AVwxDG07zm+ODZPmA+?=
 =?us-ascii?Q?pdM/bTVZWI5IdONIi9HMPlq5grKMK8edqoltnE2fLu9EGiLQg26jkw+dBtO2?=
 =?us-ascii?Q?lb1jUk5VcbTba6McnvaJJVIImwobKhqaAyql0D08hEQCv1OX27NOaU7eOCjX?=
 =?us-ascii?Q?B4b13l3MwDgwpdqpU/UmHmc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db9671c-98ad-4bdb-4851-08de0db960c3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:11:37.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKZBU1zlvLV22xkyLfNNEYWbww2r4WZXy8wuiDyRXfMEgXiEvg5JZkfJ7hVXQ4zG+MSvSC4QaKASahOh+ih9Dje+irwtqkC/AhrgTvMr58U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_131152_015042_CE4277F7 
X-CRM114-Status: GOOD (  12.66  )
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

Introduce reset capability to EN7523 device-tree clock binding
documentation.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     |  3 +-
 .../dt-bindings/reset/airoha,en7523-reset.h   | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7523-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..a8471367175b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -64,8 +64,6 @@ allOf:
         reg:
           minItems: 2
 
-        '#reset-cells': false
-
   - if:
       properties:
         compatible:
@@ -85,6 +83,7 @@ examples:
       reg = <0x1fa20000 0x400>,
             <0x1fb00000 0x1000>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
     };
 
   - |
diff --git a/include/dt-bindings/reset/airoha,en7523-reset.h b/include/dt-bindings/reset/airoha,en7523-reset.h
new file mode 100644
index 000000000000..211e8a23a21c
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,en7523-reset.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 iopsys Software Solutions AB.
+ * Copyright (C) 2025 Genexis AB.
+ *
+ * Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
+ *
+ * based on
+ *   include/dt-bindings/reset/airoha,en7581-reset.h
+ * by Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7523_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7523_H_
+
+/* RST_CTRL2 */
+#define EN7523_XPON_PHY_RST		 0
+#define EN7523_XSI_MAC_RST		 1
+#define EN7523_XSI_PHY_RST		 2
+#define EN7523_NPU_RST			 3
+#define EN7523_I2S_RST			 4
+#define EN7523_TRNG_RST			 5
+#define EN7523_TRNG_MSTART_RST		 6
+#define EN7523_DUAL_HSI0_RST		 7
+#define EN7523_DUAL_HSI1_RST		 8
+#define EN7523_HSI_RST			 9
+#define EN7523_DUAL_HSI0_MAC_RST	10
+#define EN7523_DUAL_HSI1_MAC_RST	11
+#define EN7523_HSI_MAC_RST		12
+#define EN7523_WDMA_RST			13
+#define EN7523_WOE0_RST			14
+#define EN7523_WOE1_RST			15
+#define EN7523_HSDMA_RST		16
+#define EN7523_I2C2RBUS_RST		17
+#define EN7523_TDMA_RST			18
+/* RST_CTRL1 */
+#define EN7523_PCM1_ZSI_ISI_RST		19
+#define EN7523_FE_PDMA_RST		20
+#define EN7523_FE_QDMA_RST		21
+#define EN7523_PCM_SPIWP_RST		22
+#define EN7523_CRYPTO_RST		23
+#define EN7523_TIMER_RST		24
+#define EN7523_PCM1_RST			25
+#define EN7523_UART_RST			26
+#define EN7523_GPIO_RST			27
+#define EN7523_GDMA_RST			28
+#define EN7523_I2C_MASTER_RST		29
+#define EN7523_PCM2_ZSI_ISI_RST		30
+#define EN7523_SFC_RST			31
+#define EN7523_UART2_RST		32
+#define EN7523_GDMP_RST			33
+#define EN7523_FE_RST			34
+#define EN7523_USB_HOST_P0_RST		35
+#define EN7523_GSW_RST			36
+#define EN7523_SFC2_PCM_RST		37
+#define EN7523_PCIE0_RST		38
+#define EN7523_PCIE1_RST		39
+#define EN7523_PCIE_HB_RST		40
+#define EN7523_XPON_MAC_RST		41
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7523_H_ */
-- 
2.51.0


