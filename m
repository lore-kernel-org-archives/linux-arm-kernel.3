Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB901098796
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cllGIOLczCOQ9rNUzM20y9HnRtTuNo8JOVU9ZRZRTqc=; b=wRffIaIq5sgnoTZE97fPD8BcFi
	7HdQ5sR1PdvJqV59EhcS71pXLrt4waL9mphrXq076MTaV3pst+mTG2FGlc5jD1mdr+AtPK4La1/7y
	C8fJyglPZ3+mZH0yom7n+5eeTP5RyGxDL6xR7d3QKr2sdFvA8iy/dXQ4hKzjHKZO4EBaSduXLUwen
	vvKsUyWnTKBg22GIgVkH5UnuRT0qF8fZOnBlTqfy/9GLNvfr07KAx7ZBE6VvCFQcWvM+Cg5BIfupl
	Ppl4HR3gFgJ64lqvZKWefDUKVGBux8coQbL1MMNAI5mR1TXFPvwBR4/wgGMz5r4a01cPt9XO4uMQa
	jca5Z6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bYV-0000000D0zF-3IgE;
	Fri, 20 Mar 2026 15:14:31 +0000
Received: from mail-westeuropeazon11011055.outbound.protection.outlook.com ([52.101.70.55] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bYT-0000000D0yj-3wxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5xvcK8EYmRUJCXHwYRqKu6oQDIGQSH6VQQ0OKg33Me+Ksy5DAww3sRcZjQijOr3NUOLZN4tq+H/I36RxvTXn4YYraHbIFLcUcczyAXnUP4AcB5zchsODWS/+k+CCH2u8Cnme3tuFr7OqNa0ooprSABBfr5hlc/e3p935u/vw+HcSBAfxFgigOqbmFHBq/u4bpl53IPqASWAOAUkdau50oEwcSWU900taloUXQNbzVm+GufnqvgbYLvhHUrUfyrvdJecuLNtGEoQs0O2gWYsAhOCIRjoq6fFIjNkwkaS7Q3cjRsPoeEwgVDhmv1cdfi0T2n6ZKK82aJDYLSMECdNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cllGIOLczCOQ9rNUzM20y9HnRtTuNo8JOVU9ZRZRTqc=;
 b=DiZJwzxV6EB0s0OZEcsnnRkLASNJq6DIWAsSzBX8oxbiw78svVu8B6YWY346O0+08uSjKlQR1EE+p9jjq9cGynsYpvy9kQ47LqbYJrdQqrvyLUdw5ybgX6febT1I9tqCYYKBjUIdRkie3vkN9onDswDQpxLGv4NiDlLgTZvCPkHz5HKaRqzobPSV0MMYQMYzlDbzmA4cj28Vjde2Ls2wbuviaMoRVtZAfnY95ltjapv+xExjvbs4FGLrWZt6w95xWrfP4+hFgdvbvM/ze4nxiooQlrrOqnY0gz3H/97kvgHf8i3bP1Nt/PfAzZndI3RDD8fQJ6hK6QKK60qngHx8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cllGIOLczCOQ9rNUzM20y9HnRtTuNo8JOVU9ZRZRTqc=;
 b=iRE8nAfOOsQ0wvHVLBPovNDZR2zE53jDsSMCCNToGzEkwXSbETy2X+87Y5JA7L7mV4tfSOZ6T5lB7nVH7HO8PsNEddDydNl4mDDgAvdLAsJgr8u46FRptnUIJrv35oXEvXVo5gcW/FpRa+Gq3fE2exodCgYfMDHQOAWn8ZpEk4aTBHFXGakCuSOTgBYH2Bd/we87UK29XDKSz5f7AB8bAHyoXzOjwkOxibvQ6tkb95CvycO/zya578G/74KvN8I50z3PwyiJvXjwcgzxVpiWosHgvAQHV5g6APCFO2OTWhiCJ0waOKXQTs7YnNtEFeyJuyzDS2ZgfNnajWIX7Snthg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10630.eurprd04.prod.outlook.com (2603:10a6:150:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 15:14:14 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 15:14:13 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v4 0/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Fri, 20 Mar 2026 17:29:57 +0200
Message-Id: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10630:EE_
X-MS-Office365-Filtering-Correlation-Id: e68077bf-5057-4355-9343-08de869357ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kFz+VbiYzVyH9EHpWhkBpEdFfoSX/xgeBQhaBYstNjuQoLiutfBjFnp55PIpCekFAN0+Q1V1MHhz6JTmgN0COBknH8+xFH776AAQR+aP/elof68iTvhdptq47kTyjkdtkLfZN5j/7yzkW5c4HeJ//FH634W5TyktykuBDnPckhZdFExrUpkhnisY0FU/Gy0p8Fg+eLDp5cw2CGl4GOzZ0ZtJlJpQg7H0GMN5iA4ZY2IhKPRsLy25MDf1RjUdonqID0uhmG4M0EbzB4+VbGpX6dwcekK695YLfEX0x89+6azUj/osISH0IFByqlfcPVnGm5GqK/RB+eQykyey5CF1/1/dbeNVM8g7tJuz2MoAkAo05tAl3M3RR8OqDXvZLzx5vor0yrK4i0HFskNJgOJ9ds5I2TDJpYj6qMHyeb9x8inRVBXrxh0deVsOEhwX9/xEet7lL5iFsvVW3C34EnBZ2GJ+yI8rYo/J7ig51GHtMfFN1V1HYCp2yz5WNVM+hKBtJM6fJHp9HedoXs9t3mK0SdZaj3YO0uOASdWyzxhiiICaMdkW8yXpiIWAk+URDlKF/2CanPao8tnMKnu241KkMktGDVXLPxaYpXVEOc7QVg2mZK3nIM/TCdd5eY+Ec4RDXK4+M+dYSgKw1JxHjbJ6Liw/mINoMLII/Eif8WGoEwa9t+MkzK826MBd/m4PUDipxswnT+TEAnVffViBma1aUX6MNHgE2x6rJ7lfaInEFd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RDiawvOQYzSKoy0qIDhIQNBrW8ITR1ZIM696zQHCtGLmP9GNiGzUrte7ID?=
 =?iso-8859-1?Q?UYdXolmOkQ4reDfH2jxuGdjF+59phIaDINl2u7uf+FEOPQeUCQFdpntW5h?=
 =?iso-8859-1?Q?Q8/ADGU3AdZuazVne2Jm55F+RRiqeGIigKEzd70TzS5P9CifNC81CWkVlo?=
 =?iso-8859-1?Q?PJ2JWFBcrV5efImnTAW04pZhAWmCkwp0v6AbThAB+z2cJmqMYMFc5si2Uv?=
 =?iso-8859-1?Q?Q786siQQTkrsSdmdpKqg50Y6Pc5TqhLl+EAH4hElYShAalbRj+YixfDyDX?=
 =?iso-8859-1?Q?FuqAiw8izJqGhm3AqADFBnN3IKuEMxFQCxAZ6i/YalTzd6764MqyXhk/Gq?=
 =?iso-8859-1?Q?DbJgr+KuCQh7iUruD3H/vZYO0Y/x8i19U92C2m7u0FYzpE0qn4ifzBgnvF?=
 =?iso-8859-1?Q?JgC2pjkk7JKD7iPUHA84fciyMCAlk5lNe/wZXhDojpiV++a4Xs7T9vQyC4?=
 =?iso-8859-1?Q?uofyQu/T67di65gvz616ozxLWViI1jkIredlzY0OQESIUR3BSHPQ34RUuG?=
 =?iso-8859-1?Q?pUftQSHXU82iy02BXChOvHI0qai2N/CCGtGMLvYsNjkco4OftEc5WZ4wv6?=
 =?iso-8859-1?Q?XY7CXYSm0oUAQoG6NsQHXyeuCy5dBThmtVIlffwrvaJFUZFbuU36nMJyrP?=
 =?iso-8859-1?Q?f6GZvey1CXx5M1rtp136LUoSHWTSKeZfnthw85PCRbctT+MkseA6uWQPhP?=
 =?iso-8859-1?Q?wPAbnIbooFHAO+QH9aACZpKgeHWWStDaR80LMfXSPdySZftBlzCsRHCu8h?=
 =?iso-8859-1?Q?WbQJIHpc+4UV7qvoGOPVrAk8BtRkuwho0eBRygXxrKnVb0xk8dIdCQPpXH?=
 =?iso-8859-1?Q?VWv/iTaCl/GBixte9x4IDoFXA7bktGekJeJoeMIClvY88sjSZG7v3JHxgv?=
 =?iso-8859-1?Q?Z36600Oi5mAvFwB4NyVUEpxrzLkWRGeMKsOQnX9MkfmRPHwni63giqaULP?=
 =?iso-8859-1?Q?ZV1xXPVK97Hj5Kq6GLzwo8aCu9E3TeN9OoLupTR0iLyO3s3TY/eNZ/J0Iv?=
 =?iso-8859-1?Q?5Eldgkx/wQUNae3LP1PaqNKq+yT2EloawRZrqO4oxEKGv4j/5DHieEeXim?=
 =?iso-8859-1?Q?ZzrkoazcUQ2qT7fwGSa7tOkItdO6hRcJ2OxuUop5zPITNbGSlcRjGDqqVu?=
 =?iso-8859-1?Q?xea0hY8mfwUE9R6hYSEDGlVa0zEwG9NmR5foJT9+ZHMiluGv6kf49mfQkG?=
 =?iso-8859-1?Q?+XfB4lIlHrr9zlzW+2RLb4iGnRTvP/fuRdknah9exs4TsUE6FkV2KJnn01?=
 =?iso-8859-1?Q?erS5fUlFJv4FoPhbmP8bUl2AOkaC9EpcgeKG0PYMkdj+uqNTLRqaGUE4ps?=
 =?iso-8859-1?Q?3jjpZmBj/BuKv99IdVm1hyKK4zLlXxx7nVV5ChI/CnLlvGbRHmNA7NL080?=
 =?iso-8859-1?Q?iTT3TaJBJdfc7/pL40bgUpxpR8MGdAav3zMGBBeP8R7yhzH0Q1IGkGJdDb?=
 =?iso-8859-1?Q?LibGEaPglTXUcM6oHAJUJhCADWRIvq+K/mCRKvErdVBrwiTrRiqHgWIRyA?=
 =?iso-8859-1?Q?TlRrULWHfOyoX9zJ39IntvYaVcNVWnLb+HbSgnJHLmKE9dYgy7IhSVugTY?=
 =?iso-8859-1?Q?t5X6TyZbXpGzzeNPDAdm30VtL2oyF4s5Ie4JUXEmlugtDvVctdAulArEvN?=
 =?iso-8859-1?Q?mDNlflEiFVOz26zdpdHG2nAKT/TW+vNw7b5V+fD/jpEmSXDWN3EiBVRQZJ?=
 =?iso-8859-1?Q?CuLW/lVFieeT1EuNYgq30jQVCCgXiBuA51FpB1cXsoIuNK5dyOHUjX1L8D?=
 =?iso-8859-1?Q?bygO046T9EbBKs9Mjp82Q9ard4AF7pWyFVDPAaR6MBHkAn/Gvmdi7VbujW?=
 =?iso-8859-1?Q?AGtV9HEElQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68077bf-5057-4355-9343-08de869357ea
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 15:14:13.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjVI0oWuW1sBbHUMEF0otCawz8b/0DojGN0ghxM1rla31MRoR/V2maY9nK9bBxP+f6OBIMmKQswfsmv0aBeiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_081429_989716_B6CB20B8 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

This series adds support for configuring the fan PWM duty cycle applied
during system shutdown for the EMC2305 fan controller.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

Changes in v4:
- Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
  to avoid treating unconfigured channels as valid and written 0
  during shutdown
Changes in v3:
- Rebased on current upstream
- Dropped already upstreamed of_node_put(child) fix
Changes in v2:
- Address feedback from Guenter Roeck
- Make shutdown behavior configurable via Device Tree
- Add optional fan-shutdown-percent property
- Apply shutdown PWM only for channels defining the property

Florin Leotescu (2):
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
 drivers/hwmon/emc2305.c                       | 35 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.34.1


