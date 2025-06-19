Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+FnsWsBnahNG2KCauDU68M1ybnLc9Y5/xlTjRXQX2Y=; b=Wovg+Eng5fFh6cCet1VHlNK9js
	iCtuRTSvQUCkIxwDfRlVBuSASjq39ASM31jTDCNFiQRQyvEqneyswdp0j4mQ/YPHkmLjfXxKAkuBM
	pBIDgOUlGqzYUu8Uc/BfTSkeQJpGn9wLdLBCkcfek/lyj8vOjmU/VeFVJb8St+leju87YoxDPZHRC
	T7p8+U+mMqbGwD+ZjscthDzOo/q3SMEw1P/8I5rQgthyAhD0B5oCHEhEluqbUMORVnPRFpSrlW+Xu
	vGVjW/w7786QrJH6MVDU04NwfnM21+UZPZS3EEov/sp6mczUALD0xk1fSlttIS080ku32CJVg3Muh
	Li8+b45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8rI-0000000CAFW-1Mn2;
	Thu, 19 Jun 2025 06:34:48 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Mt-0000000C7V7-0XxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 06:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPR9xv8rz6kp0E1M0uEgNHSB07kRbyWE2/dwSxjh2b8rsEQ0bNBTj0SzfnIihvhi4r0jgfJzccHKWs8w4/U5H27XpCtnNYvRRDq5bYg9iqDzEYiiW00TAxJ3h1Si4jwuvjGp/qz/HguFvkgqlv2qAmQ3KZtxap9bP0r2XiIC3kSOCf07OErZXSvxXDa/W9npmQecnkYBomEbilM2C8uPDqbTCowtdI9pqCI3LXaHs6E3T6STCVX7/1H+ES0sedAReHqNKO9KvMgTgbtN2d3xX3YQL2LS+8sY7BGq7NKK9hIKN4qTh0S/xV3/SIvjJAzFn11I5bIO3PT/7VgaNG/86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+FnsWsBnahNG2KCauDU68M1ybnLc9Y5/xlTjRXQX2Y=;
 b=plJ4/jcl+eCB1PBVzQVXfb6LteCNo7nHZGyzRb59keFp3K6O2MVfwUkefmf2xfUS1vbZhp1wDKMhwHFHGdy6hSTsaDkagwclenyJClKkwIevosCt9/XVZ/9lFamRN/hVDfR/ngcoFiDVnARhV7DCsQdL6Pvn5E873uKjHwJG0DUaCARCo7b4IF1wfIlOT+RqhUCDQEDyZCtrt3znn+jZwwETS3S3KHlwQtEJ9HBUUjeS2CsqVXuTNsK50TMrlxkRMxAaVhTn2MO1EQK4rcAkEWYuitkqcQx4S0RoL86N+Jb3Q7XUyVLzV0oG9Qjjb29CY8sMOfHoPY25L8L8uvgmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+FnsWsBnahNG2KCauDU68M1ybnLc9Y5/xlTjRXQX2Y=;
 b=oMkkhOfeCQWaOhzZ/SpNXGcZS5wJ76JAQ0yKGOUzvtB+sgNtvEVzYGJbEmVPituwqs6DoPI96ZESLBmDb6TLSu+p9/ni0+yKPk98DJkfMyX2nKfnH/j8vev/CVFstVh6RwhmDNXgCgVRxW1Rb9lo61SPYhyrw1OtEvzrjDuOz7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSOPR01MB12411.jpnprd01.prod.outlook.com
 (2603:1096:604:2dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 06:03:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 06:03:16 +0000
Message-ID: <87ecvggtek.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm: s3c: use string choices helper
In-Reply-To: <42f8e753-482b-4625-ba6b-fd9e3726a1d8@kernel.org>
References: <8734byndhd.wl-kuninori.morimoto.gx@renesas.com>
	<27de316b-b756-4982-85f5-6c37cc5189e2@kernel.org>
	<87jz58mzmn.wl-kuninori.morimoto.gx@renesas.com>
	<42f8e753-482b-4625-ba6b-fd9e3726a1d8@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Jun 2025 06:03:16 +0000
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSOPR01MB12411:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1333a8-2c2e-4382-2bc0-08ddaef6fb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JM75axQWLaAv7ZFDclX/KMcQBr3qLhV+l0AwPlRqQSThPpEJI+u9spbTUT0X?=
 =?us-ascii?Q?cbXMm6Aul34jQiADZhc37gI6r3dk4XHdpRbZgKU9WkrFlTRh5F65J6OcEtcX?=
 =?us-ascii?Q?ENfbGlOirLfFRCabBfQznqbliain9AA2KVtK0x2JaGuCDMU6Jgc//Q3/hlDE?=
 =?us-ascii?Q?elojb8hKiIlw5A+JuYYLFMRNdWHiIBwfCdOW0md2urqZm91ROwksVDJM5djy?=
 =?us-ascii?Q?NjK4nbZ6mMfB8/Q7ZsUiSoPaGrinXMtD1Hjo+vu1yGQ4pjSlQZklw0QBpT1r?=
 =?us-ascii?Q?Wy6El1njYIaT9gE7F7t2/mf4Ogu/WpBA3WOM6yRSFUNCaVb5wsJv8yop/k0J?=
 =?us-ascii?Q?LO2JcdV8pKXf8uocg2LxIzbYYMKJcBTqIUdegXcOSR1pMot3FbHMAejYQymi?=
 =?us-ascii?Q?PuKVVS3kNHPnw7GlRrZS4z20v7L4mLYGr4Rs0XAT8C9oK+sp3heVRre1DOCH?=
 =?us-ascii?Q?zXIusbzpBwjZ+BVewaSF6hrXvoHdYZ9hmjqcoKa96IEuavVNaDy+1jmFdVFO?=
 =?us-ascii?Q?u3a8MzOnbJpzqWqBejRu7DKRCrSkR2Qr4xMBqU3XHJEUckJkD9dd6sDfddqZ?=
 =?us-ascii?Q?r2Ff4LCjZwDbzNNoiAW+x/dy6b0KY/aDejILNK9GIUVfgQ4/50vB/8o2BQMB?=
 =?us-ascii?Q?m7118tM/44A9s7Q6l3SDiDt+0HMFgAXkqKtm/j5o+qWETafnzuSeAaXtcTDy?=
 =?us-ascii?Q?EZRvScIzbD2ahAVAhTOJoCL1vtyUU5thV9UTHIWq5hXK6ch5bJ/KBoK9cWhl?=
 =?us-ascii?Q?SRB0GHzBS80/+u5GBaF5zzvVhMhEITE2QQTjMeZ3fmSCkIn26yxFJbLn44oi?=
 =?us-ascii?Q?yIg/OJ6A+b84uJccvY3gMEbKuptb69uNlNEpTxXlTzsHmtjWODpmur3hyfsE?=
 =?us-ascii?Q?Sovlozkk7C6SbBgNEjZWIBywJiMcRhREYRHc35xtqJoGsCvENEY4QzY5Ne9C?=
 =?us-ascii?Q?FC67ka3HxDejRvUXhM7YqEasaei+PDNi1J30AOaqvNNmRkeFGLG7tF7MnTbE?=
 =?us-ascii?Q?tUaRmGGqlPio9OhG9/sGI8benFIrSvTXEqO9EOOKU7NnwkMmXVVa3RG9O33C?=
 =?us-ascii?Q?6g7WXu8TQU8SjbpnlEgr5dt4YaMLROdoVC5AGDGDvKP05qzDYPOHVHzmLk5f?=
 =?us-ascii?Q?AK3CXYVH2YNjdZlwUexYQrM7MQ/bSp88nHHimOTmhT5gN53Ai4AWj9Q06ipM?=
 =?us-ascii?Q?xSW5d0FxmfBU9RZkFsEJLj19xjdkv1847j9hEJFOFqc0r9yZfVFgOaQEBcMW?=
 =?us-ascii?Q?iqSjhaHyfHgf6qVDRUbKp71VysLglsOJiAO72BmauHDJ02QzKCv/d81KgyW1?=
 =?us-ascii?Q?4hlNfBCmUjsCkDPoOAIl2WdPVUowI8+ls5yKRuqlZkyLhWfYQ2Iz/M0OTGmW?=
 =?us-ascii?Q?PSmi6AAl5YT5OIj0sEHoDIdg6SjvPNa2JdQi6ua76EHtiOSbS8JPNmwEiND7?=
 =?us-ascii?Q?fZbFu+euBY0UDku6OzPQ7PlYuzS1L4i6YBM2gs3LnJhvm/QXMM0UZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91Ez7+W5AQmbRXVI63bTl0gNtxGB2N754Mpo7kbAQh0C1dmlso44C7YR1Oov?=
 =?us-ascii?Q?b2UGr4BCp9FhOUBWcmDxXrLrWnhL71fioDUFncItDI0yJZjsw2h1xn1fR/Ww?=
 =?us-ascii?Q?CrG+bOC/aHF8pdsNv62SuGX2GuXcraMz9+0mj6Y7zEx0j5UtrDqmpfq1ekCA?=
 =?us-ascii?Q?Te2n0/Cnax+iRdwbPbJNBvXOY+NFEgr9g7jtdRtwjfGnUyAyrmM0E7Ekj+WR?=
 =?us-ascii?Q?dMmDr23WQpQSfxGI/qAeu0pzi2EZw9Ul5OVrTBdxwX2gzKjHEsMyByHtNYQu?=
 =?us-ascii?Q?XuZq/IAp3Be55pMfUJpideh4BedqmtSx0KsveqvMRuDlKQBarci3VfvITZ/n?=
 =?us-ascii?Q?R6ur0KUK7D7I+WUfYJLi1fxa/ZQ4gYHF62ImR4bJfWMr5C0QGFXoTY16VCp6?=
 =?us-ascii?Q?4LCioYICcNKbbDKtDmMC8hFpLspEDCwA1SCAEuldMCVEWvgBWQ/yvJO48yrA?=
 =?us-ascii?Q?nYjVeuXW2UjqqwXgGo+q11kPO2UCPCXXlKl3DF0LdB/gPE1ZtHaiytB3RiOC?=
 =?us-ascii?Q?ep9vSbEAR/GgSOLKJ5zZQHVXs/h+mKutkAiuKI85RFmW661PNe5Aqap38wgf?=
 =?us-ascii?Q?wrmYqlnNIxmnz567ctROMEofiDqicZIat38OoHikgQWS8IjDN6UcobbTNCPb?=
 =?us-ascii?Q?mszaKuStLcs5NafTQYhyRphejnneKj8LyY4T+bg9gY9nahXbHLyGGZbIVpqV?=
 =?us-ascii?Q?DZwbqGbn0JSqIjHnJ/ZyRr2UCkVqDRpOnOjGeNjH4OZ+LZ0jDvzpHOdmN43Y?=
 =?us-ascii?Q?zsxJNNx7ZnyXTFSdtkK9UMfOhMTPdCQV8K0/Aegy/txOPLvPitC4qNG2xATd?=
 =?us-ascii?Q?2NVUznpKhT8dP0j88HDtRRCboMtz8Ghs9y/X9fLasU6aVlH3MF/FKuiol5Ou?=
 =?us-ascii?Q?wSNt02qLOPn9VRwiNE0Mg0Cb+IKaeuogAD72IZCxOdc8FkW/gxew4h/Wmmfj?=
 =?us-ascii?Q?vWfLbIo4WzaiZBp8ZbAeiBL9dxidnFsdo5rLKzjX05ubJtJtqemrZ5zpIlUL?=
 =?us-ascii?Q?CQuOkGBv71GI82yXmKLafIHkqBeYPNsXiDU81ofkZlVanG7eDr5MkzCRmAH8?=
 =?us-ascii?Q?YweclK++u3ImfqXhgJjJqiv4GJiqTEe7CMR3LjvT79JPe6ZO4zRXDqV7f6Ea?=
 =?us-ascii?Q?+IfgZxszeURx+sbgw5fvBd5g+gM18aehBrRV3iTweOrfI7GTJkDnclepyPFw?=
 =?us-ascii?Q?zZKn2/bLrA5NeOCnlGXWmn7OnPqo774MjP9vurWiTjMtMc+vD077Rx79hV83?=
 =?us-ascii?Q?e5ZQnMJKM5AkyZ8QmXOm94lvlgGEHyhP+Owqp0cx4EgGCGSC6e1S0ZXUTkwJ?=
 =?us-ascii?Q?jUKCNhPvJdFN23hkPV+3naLKF6Y4Gff5ol5UadNU4XUEre+gUB1s+Krqu62K?=
 =?us-ascii?Q?86SL4taZjZ/bdOMbRZ/iMQvOu4WiCBu7NIFlhmdsuW/50yGBl5m3pwEJzMUS?=
 =?us-ascii?Q?ohQEgY6FvWf+ZR3Ta1jI/VBsATaUEqNxGuVXutEFwKYt7R4a6UNo9CWUQpbC?=
 =?us-ascii?Q?azlV3k5sGSgbIiedJS2jP1PsAaPS5pXA9bpCzDAiiLi3L1OeTqjdU+pGjhpt?=
 =?us-ascii?Q?21hTO9My5nB4kkVkQA68zCu4HYrvbko2TWsqTSkWtn4r5WMMdEHooKJuPGoY?=
 =?us-ascii?Q?e39w8MTriyOfCUU96vNJdOE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1333a8-2c2e-4382-2bc0-08ddaef6fb93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:03:16.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcblMPvIgnBS3X1y1QG/2y7BUsz1Ah2nNsqkQdTLrDPruV5Fb8nlhsmhWGav4uON24uk+vMThcdbEom41M70Si9axRKB/cFhvqAoDa5zE1J4ogfKIQUSeFEyIQrxef6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_230323_400175_6CE778D3 
X-CRM114-Status: UNSURE (   5.67  )
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


Hi Krzysztof

> > Ah, I have been mis-understood. Will post v3
> Why v3? Feedback was don't do it unless you provide good reasons why...

Ah..., OK

Thank you for your help !!

Best regards
---
Kuninori Morimoto

