Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6530E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm3qpXAWP4UFLlqBLLZrSUbbJFq41ZAnsOUmyccZjOY=; b=PKkCXbYbwjMm4i/LC2zfdpo3Z2
	xtO2TE7bJiNUKT7Erc/T0F/hyeXl+3JesmfgSk2qftbAQO9Qtp08dLhjPXfryGqfeS26u8nM98+zg
	b3oiIrayy98jcKSMC5wwv6CH9P7di8mD/C77Nq5PWUMSay0zEgV5wssTRJeLBPdaN5KmWJXFsUH8V
	Wj+oskjE73EfH+makhACR4KTWStHu/tqnpsrfVBSrv2cak0ss9MlNKsZbjjdRfge8Zf6iXTPdK/ct
	IQ4RpNoW3cQa2bEAh4xMRXveI4OAEj/I48iq5CSQFd9U/Lpa6FFfmGGpvodwOibW39W2MrDWaplSO
	kzaSxAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5Y0-00000004LjF-0niM;
	Mon, 30 Dec 2024 02:30:24 +0000
Received: from mail-am0eur02on20623.outbound.protection.outlook.com ([2a01:111:f403:2606::623] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5Hz-00000004J1Y-1ZIg;
	Mon, 30 Dec 2024 02:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOq1G3+8sYmEcoqL+M/lOIXbnTl8rU3ctHrifQEXwvyXbNqaI2yjRHvhV7v3S9xW2cpDNKoRt7HWPzA7vtE/a82iM2psTNJh+TOQnOHO126nlHuZROrWyKCMUcG1BIQi6FlRrlP98i4JWIQYU9Ukh2+jeTJWpnm6C6+Mcp3yxZI/laCm0NDSR+aT2keXHe3HzG7vXjqeNHVwxBAR8rfohkBP+qSky4TsrQAHctieAZHMcPfE7bodmuvz11NJvkqJqmqJFANDiJt6VlNAWyDeL8sWN33ga5HF8p7UyBySrv/o3234tAYRhJBo0LsqsOstvFLOerm/4MK16i6X1jkf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm3qpXAWP4UFLlqBLLZrSUbbJFq41ZAnsOUmyccZjOY=;
 b=JW/6eV8q3DlCpMD+zWhIMi8wdO9IJLBSLoDNgPkh7ZQ4owR6D4Te+mFloaLPUuKcunm0oiy+xRqSEy/mtQD5HbHS4J9g6SWBDITHpiTnwxgpHb4ckYoSYeKnehy7mRZQq/zd+Fc32xemOr7kcBbCG1MnOO7UT0xnkOuj6vo+ALrPdUpLCKTZjOhbVGGy+YLj3DNLo/sNY+osfUEaXPneu3QID2ScRdoy8A3stygWKlDrPzS82jYzVl+oshaIbpIvFucFLh1aXRTHtlTUdicUZcjmcZwReG6gnf10QPV1Urw8MCdFis/RlELpopZ2BvBw9qkRfYErH0VNcO09vrjCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm3qpXAWP4UFLlqBLLZrSUbbJFq41ZAnsOUmyccZjOY=;
 b=WUYs3XxTe9G710hXqqMzhPEejH/X7KcO/fCnDfMSUDBlUf0y7bMBN1/qijSAWj3Kqm8D6GT50hBbIl8EWKKoj3WKeHcji/GRHijnmF4xSLlwv5O75ZIbeliMXkIxbjIMrnXi9JOTx9nWlFUWT2g1owaocSTvQaPp85DiNzOA5tXjpgs/y31dyC8h5tis+k8K2F5eR1wQJlxrXvecRnzDHA7V/UhJdPorojJsOjZ5DZId39Xr6wbleGfa0pe/nAZCLp0ePy6SWco1cjjXtSRaEEpYlyOl/Hgf6bUeJuAAwAMisssibkFkg74q/+gFEIwTZzRjYhjllxeXO73POFJqQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:13:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:13:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com,
	francesco@dolcini.it,
	frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v8 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
Date: Mon, 30 Dec 2024 10:12:01 +0800
Message-Id: <20241230021207.220144-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: c4095358-5d75-4453-99b0-08dd2877960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cDCbTRqak8CrYUliDu1ZJXY3Izu3zyyp+N7uQls1F2EMMvzL4JHDM5cwvLtX?=
 =?us-ascii?Q?zJJEliuf6GXDjoEHWfXPQdF26V7iiW1kaVfLH2jdpHx/Cdylivz54gi1B0GG?=
 =?us-ascii?Q?Vx6ErxKwxIILFJUEqSj5rX/iXd4uKY9jjMQJrfMnB+o5fxiNBmqrqeVUe5LZ?=
 =?us-ascii?Q?GwP7tJl0qZ1a0B6G1bX7wkllIE6jn5rAQ7TPJ30iaXYmWRovzVyVbYcrt/f+?=
 =?us-ascii?Q?JVvluJpYjlutbqxjkwkzEm+Yyau39seCEdE4FbsuaofN6CXlKt2pDuIt+hbu?=
 =?us-ascii?Q?4q/HLqqN5DvHSkX8jD1jydCBQcLnYlhM2ePFd68mk45M750RVEF6XDzt90IX?=
 =?us-ascii?Q?JA8xIjnXirEXWt01Z0i88MiNKKTZv/QhBfzdb5tkvBj36yneBPSGdsNPQLhX?=
 =?us-ascii?Q?8kQdMSJb1zswDQC5rbhIzO+y9MFKU2ZkU0En33o2hcBDpjLxDfiMQbIuhv9i?=
 =?us-ascii?Q?2bK8d3DRAccC3BNK3oWKBKY6nJcKVAgtqa5uzClWutyKhEBAw5DdSYB3lE+g?=
 =?us-ascii?Q?VT3aOIxhEWpbZWdI0HbU/+noK0vu+dOeuzTGrCGa6uluPu+5RyEjG7+0CegH?=
 =?us-ascii?Q?Bnntoo9uRAgL5/8T+bhXwOc/QM6d9pyagK8F2oFg7fjKdviwdhfByP9f8pEH?=
 =?us-ascii?Q?oMeniK8CY/GGSuRJb7fElA/ZR50qqYEBfia/Ypwr5mp+5nCzengqkGBbthF9?=
 =?us-ascii?Q?C3i5+BFHJqcrBGMPmsiTsq3o+rMaG101Z6SErvcNBloKifJnbLdA8+SKsgUR?=
 =?us-ascii?Q?eDzPFjgvLZWOWcmaXmwzAGuwUX3s01CmC94548t8g1hvOx3L0Nah3D7Ep/nx?=
 =?us-ascii?Q?jfZfZf0XYd+7FT0tF1fK4zUm4CF7kk2zxYn779Tf7kBoK8QzXQP0rKis7Au2?=
 =?us-ascii?Q?sd0gscbWcVou4+ahZ1v5pIKlOXXlH+dSnS+auUHMVp0CHlmWVQny3Hov333Y?=
 =?us-ascii?Q?qcfq463i80GFiyxPNmW0zSsElbCXMajBP02clDwFZs8uLUHYlH5PyDVF2orq?=
 =?us-ascii?Q?igm2x3YC52ulAm1e+ryYrKQPw+mQeIp6yJXMiH3hYgC4jKzVz+Bme5yvqG8I?=
 =?us-ascii?Q?aDc1FUaVd0K/ayN82sgDGxI4Rv5/CjchkPeQN7A3fAYZ7QWWpmTo6pYDmPl4?=
 =?us-ascii?Q?5akOxGPE+EdBqzqxuT+LpfXPRs678hOb4rycwwgFai3q1KOWMivfh867FvMm?=
 =?us-ascii?Q?LbylfmnO/lffJXuG7UaBbJl1d8Y6AboGpUX4twC3ikK/2q4sJ/mcQ3yfmd1m?=
 =?us-ascii?Q?pNR6p20LFmaS4MXVybRoEz1mL5TWp/2CTYGuVEC4Zmq43VQyrOqsvNJv9q+F?=
 =?us-ascii?Q?3axNjhK9xgP1cznNjP9RsfLTyqQUfXVGhDTCoRkz/ktPEBAjR2ApP7kbL2Fh?=
 =?us-ascii?Q?53fBxBHptM2ibjW0u/LsG/Og800J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vor0SGVCWfd7bwUb7S72ZuBPrRAAFg5Ws9G0yJRRV56d89GXM+Wr4O2DlvY9?=
 =?us-ascii?Q?7pRx0hxV2e1d1mMHRITkqUDvhvbexrNtDFl6opVak4/cs+2YeVQaneZ/gZZB?=
 =?us-ascii?Q?Tz+SAGVh16AI/EPiIJQWWEF8bWv+CFTNwQivzayz3B07MibhCyJpyIhJ/Bum?=
 =?us-ascii?Q?69JjxrufzbD71qw8+sJikOl6Mqv/LcMqUT1+iVAfxbjTizVZ4CCWBUYE5Qhb?=
 =?us-ascii?Q?PBewCkY/aLDuLHUMmqj+NFWoVo0B7VtqI4IoPVAWFiMpA12cvnlW+EqtmSaD?=
 =?us-ascii?Q?QwqQzlC/dn7osXdJO4LpgWhgUUVb/ckD5AOHkRIHGwNlr1/K0yWz3DPhQX0x?=
 =?us-ascii?Q?cKLcPQTN7tqn7yCWtHPUMP0oplh5IL458QN9slE24dFSoOsQtT9QPDVUu1Jc?=
 =?us-ascii?Q?Iom5kNoFLzt9GVxvxg6gNjklEHo8dHYHsof3LmuZnDlztLvJdwwfMwlL08/R?=
 =?us-ascii?Q?Vn+l0n96ovtYOCINQ/IGjV4Lnkiyghp5QbPrm1oCHuahO3k+fWo7kcEMzyjJ?=
 =?us-ascii?Q?OGavZI2EQrdYwqv/KblceYAryECLg30WBqJgs5wmwY3ly7536S3XCujinWLs?=
 =?us-ascii?Q?QRpextale85FI5EHsPDiIIHItjdRuDgoTe27YoxvW2vUjgqi9XTkFRXbbdjy?=
 =?us-ascii?Q?JByGYYgSQvQkUm2a6+Bl+yo6bqWlcL7Xf/mhteHEDPH8arLnjBLIlm361hGv?=
 =?us-ascii?Q?YvKZYZBU2tqB34mmAiJunFM8Ff3YxmFhevqJLlDr+WWLXJb0xSYUAWaKSA6x?=
 =?us-ascii?Q?Dlu2nB6HKjdRYk8EAJyz98ohUr33ItmfvodUNMrCRR6RmDCtUa3XHisLooSj?=
 =?us-ascii?Q?LeyPqu2pAjqbf0fhEvspsf/OJm5te5x+YBXQeUxp2ce+JM1LlMMaOYEsLYuj?=
 =?us-ascii?Q?E49GD/UdNtZ0hGPodVCH+LmvPRabdz4T+g1YI24tRK7AV3ONOm7qiRdaDgRC?=
 =?us-ascii?Q?DsFF8a97I0fXPDoKPBvDtrvRUOv5Wzyyt294nJ/FBlNK6b6XZp3dBJSxyHop?=
 =?us-ascii?Q?c+j7aCRKYUY4rFi5g0Kl1VIo2rVx16nwOgzOE2zAnJbMdKA9u+Gx/BnZhdLg?=
 =?us-ascii?Q?97+T4OTacESv8209r4iH33OvFITLtGWMIpr+w+Fxxyc75T+1HldIyY/aXQWL?=
 =?us-ascii?Q?mCWH28DmjDeE6XLh+IjyqvVfDbkFvOHzlcaqhU5zjhHvXJQT7rET1XHUWOHw?=
 =?us-ascii?Q?puMQGAgy0qDI18vLkVpUbl9BQ6O2SbPX1ClnLqQnrsOXkPnnnVeL0i0B/YhJ?=
 =?us-ascii?Q?BvDTNEQqMsjMahRDPYap6HYUxY8aO0FO++rltwpn/FxmYjZTMON6VfaYko0U?=
 =?us-ascii?Q?3ZhzQri+4t4uD+NYaaYZv3EAFCh0ih+VbBMH9lMJAhFw3/CrO9kDcEy1A5VJ?=
 =?us-ascii?Q?rTwB/C3r9nXdCJcNuEHs5VoSiKOw2nINFy3tWPuDuxmFuCGgHwcKe4qQlFc1?=
 =?us-ascii?Q?D/ml52rLYsl3W5o2hwlVy2/CH5oSA5+RE9V8kPcimQVVxFNR6Uy8s7iXL5KJ?=
 =?us-ascii?Q?tWfiPKyOfCHq01FPwYcQPzPAN2cDzAIfzkQql5Q++D+MihtLUvngWhapyP5J?=
 =?us-ascii?Q?Zz/LPcZofLbdafexQQCNiykbSgFFLuXbyEoe6Z8f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4095358-5d75-4453-99b0-08dd2877960d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:13:44.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fr3vyqsfiL59oBhy/IWtfBknCHuZ0yNkFoIJL+TPdgDjz/3aIMEZZXhlaqV+T+S6Mkhz7zPKQ3GPIx6tqRq1pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_181351_439420_CF83606A 
X-CRM114-Status: UNSURE (   7.92  )
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d2ab799a0659..0459878925df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7735,6 +7735,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1


