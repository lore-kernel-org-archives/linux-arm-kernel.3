Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C895C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYLpk3CG5YaC2teud/WTdp4tX/HzrW856xhGjZ4WPRw=; b=AiWrDH4eFq4oNFvfBrE1Agtt5K
	Rti17nfK5+7TVQkxuIAxmBsSz246I7rQdlaQoJL26I4thb/1mOwC837speh+V1eFG9nJVgDgOBvzz
	NKN8+iHt41wsLQda7vZGqYQDvwaLi37wyU1BXgx85FgKxzwi8RfTubAWvDtvijnI59nIX0fpFXqGL
	tBCb6XxSLY28T9H+NQF7IqtzT04b4uAjlH1u6tQ1VfqEqP/3HtivDkwCuBTh+6FeoYBdjD0VbgiDr
	TN8H7EAIv58WoR1kaPERnOEep8FBaxM02Ke1yQ75N8KO7TU0HMHsD+vF/BCfSYgrj7HcFoTok0JLd
	5g7ffhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkKG-0000000CIkz-3zoq;
	Fri, 31 Jul 2026 10:18:48 +0000
Received: from mail-swedencentralazon11013010.outbound.protection.outlook.com ([52.101.83.10] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkJu-0000000CIfO-1hRm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBI6iWLiBte65yP80RG2vo/rieVx3NgRaRev9+fASSANQFDTZy+v2C0DbpQ1X44pSUeup6tiD3iDTIN3T9P7PmcDH2O4bGKfvWkkb0IHZ17yTGyd6mpvPs34F6kGn6DLNht5M7bHtP8rjv31MsmI98NjYt0Ht7L3bzMnLoyMgeaS7mpqRSTZMJpxvMh2oBrWm6GO2Vv15/1+UdAA5iU73AmvUA4zdtaCPr0koQl+N8uk5O3s3Ckm4LTmizV5SixYoDmbbaMEG/TXCkKbkaSoAVLspx87N6qvy3Mph+LZ4D+jLTMC1GT+ASxrsk8HHKj2GRW5/NBlbDUuHnjSsz/uPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYLpk3CG5YaC2teud/WTdp4tX/HzrW856xhGjZ4WPRw=;
 b=zJxjnTqvD/GrY+TckIL8wkPOjfkBMVu4GMQ2YQb8m9QGVwR2PjSXqsgRo+mInBk3pclSwt4Zgi5FacR0AVmTTqGgxbHt53T9JpIee6xpUVmv0QiZkg9YdSxGxuA+9hrcwtUgoVJNPShn11zdvh6N+8n8vcqpouG5ekWeobQhulzgxtqbBpWzEPRI1cOH9gRzdojVWlHn2YZOG2hlj0Kp3qTnWLTfMSsi24MktR3mVYCLBg5BD+rCXj/RBUNWkc0+mcn2NQ46vHgfKb4ZYTv2nPurc1Bynm5yzpszVPzV7/F7Q29QoVe7n0RrI0iJmZljX62jwsUiTlyeYTeY+ESzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYLpk3CG5YaC2teud/WTdp4tX/HzrW856xhGjZ4WPRw=;
 b=LyBT5yCyhqQqh0BQWSOnKXPEnjG1ZMr5ntn0qTq+fExW6jO6hTJsxaMm7qeN95219yj0Pa+PGpzKPDgnDUEw1yd9fuaxnVeqPCtQgxfw5tv4xeyrpyNBLK8gPgVR00KDtouuUZfcB/fVAaLMT+srmGevDmmZyok2Edyuh8JFLThxGm08k5OPnXm2S/R+hB+MoHM+UuV9IErAbD3lx2/0nHtOUUeGNRHQSCuHARI3UMy8BBrkp80F28/vZC2qwM/rUu0OQwDw89FF6E6f7XB0UVY81y7aGe0a/8SARiXlQAfVt/pzj6tzffVYeajSm7Gu1uEpbpREixpI/bmhKhdnsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:18:19 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:18:19 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 31 Jul 2026 18:21:43 +0800
Subject: [PATCH v2 1/3] regulator: core: use system_freezable_wq for init
 complete work
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-regulator-pf01-v2-1-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7e6415-9f21-4922-173a-08deeeed0a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: SXHgXZwGS/1n5l2qPZhr5BJaYqmsAQEoKYrUxzy1FCN3grFU0Vd0DpNjMDAGQPtQuk6Y9mS6fW4OnVEowqjNZkJsRoIsPF+m2tN8ndKDhCb49yYEIG1y7qouUcxtzAEck8gx6cMqjO7kfvwL1u6BKCtC2N9ar2tKrQ2pGg+EuweEnjZC/44khGJZ67oAW7hUMdNxpvfCuK11RyjjdZbayPgz9v4PjzwXlnAXoFJRiLi/ocgRyU6GbYz+VdLjNt+z2qlZ/oRNHaqx7jafeFVgJDGYzhINTHFkseCNTeE3220bevDAVRmZez2Y/ob+xZpO3GfzcqbkfSbpVFXXs1dunVQDz5FJ3zfLLZyFfkuMq/6vJfSU9E0wNwIZ0VJjqUTExpWEMqHjA7dJC+7xcZAHNWbHFlSHgOIY3aaXYOhoLUmlBZR5AsMQiaoNDJ3EXy18BLgOEvUcx1o3c6Lkj3ocVK4TaVZNStAOzJRoe8b7pfAmnLvKonVMRn5S7lZ2rKv13xPmEwOanaxnSyZoRCMoI+EI16h10bXAJDTHEid1V8rmSzf2JnYrs7lQZcKhvBSdCRRL7hMRkO3RcSWg685/afGY/BPIEjNYtGhZW471na1RRN/XVKlQstTFfOIAmO7VhfF4z9F6aOsevLWppdPcl2Qh0RSxnfEpOTzZTDu1xmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU5MZTJFVk9XckxFNTZtY0hscS8reVRPMXc3SlIxK2l4SVdaR1E3S1VjWllu?=
 =?utf-8?B?L2Z1SnJyNlJPd3FXREFNQU00UktOSWs0b0lLRVh1WmF2NE5iQXgwYXdDQXQ1?=
 =?utf-8?B?emZHSDQ4bHhKUlRhSVdQZkNlTTBmb3FoWmtuWkhpUWNySG5NUEp1ajVxVXpn?=
 =?utf-8?B?NTdDZmUyYi9CNTZOdjhtTDNoMlk1eHcvcUxleTl2ckowMlRBZ1BsTUowOUZK?=
 =?utf-8?B?V3lrdjk0d0JyM2VvOVlzbERiY01lZGhRZ2liM1g4TzI3UjRLK0EyUWZaTC9x?=
 =?utf-8?B?cFJpa3pBdVBPTmFjRnRBWW50Mk5DakNYZVJnS1U0MXlmQVdxNkgydi90WCtJ?=
 =?utf-8?B?ZXdZMzFrN1RXdGYrc08xQmRaL1VweDJveWNkOW95Nm9BK3h1Wnd5MFY4QmhX?=
 =?utf-8?B?Z084aVNpQ0JGWlZjY1E4NDVxd3VRTzh3a2xvem15M0xsNnBSMklRSTJ0NWRv?=
 =?utf-8?B?QkpYcTZUZEQyVjZmS3oxV2kvKzNNcFYrbHhESEJ5dlNVa0JmcDFyWmpQVGxN?=
 =?utf-8?B?bGJnOEhZdFpTVVhUeGhEeUE5WmNJNTJCOHNYWS9vdHJQUUcwQTRRQ2xISitX?=
 =?utf-8?B?VHhicFVFb3VXSzRVZnJscU1PamtPeDNibXdIZCtqYUd2aUxSYXJ2NkVheGN1?=
 =?utf-8?B?NEFLTnZPdm1aYjNHT2N4Ny9vb3JCVTR5UEdoUkV1RHQxY1dwQmZBMDZKNGpR?=
 =?utf-8?B?Y0NFclQrQlduazR1SmFheE0xcVo2RkRic00wMkM0VFRGOVA0TllMdVVPR0lR?=
 =?utf-8?B?KzZYbkdhR0c3WUtYd1VGM0tqSENxdUFCckUxTUlNT1lzeFVoaFpGZDZsOWFx?=
 =?utf-8?B?N1Jha050ck5xU0cwWFJWVGpydjgyRnNPQXlFUlRYUXBtVHJINlRsMFdCTkxv?=
 =?utf-8?B?TUNzWjZINHhIZjdybmI0aTBLcGlkblhUbmNLREZkaFBudU02YVlsRXVLSTdD?=
 =?utf-8?B?MlY3TlBTeEJSQnJsVXBYbmdFbjVvWkNMVW4wTmV5LzdvYndiRzU3SUlLYWF5?=
 =?utf-8?B?RHVuTk1waUJYWXhHamk1UHpTTE9SdEYxZVpHcjRWQ1NRemhxMk9iOFNDVVZu?=
 =?utf-8?B?NWNndWJUUnBGeDk4Q3Fzb0dZenl2STRCaC9PTGFLdzQwTnY1T3BSZzYvSUow?=
 =?utf-8?B?NTJFSmJLdUU1YXViVWQ5dDMzVFJSd245SHZwOTVVQmRTNDRrMzJ0Zk13YVpa?=
 =?utf-8?B?RVJzRlR1ZkIxWTJjU3g5cXJDc3pQSVZXNmNMdHVjaUNVcWs1Z3B2Smt2c3VF?=
 =?utf-8?B?cExVSjM0VUxqY0Z3MFBaVEhzdHI5bnZTSnFTeHhvUEJrRm0zNDc2YjZybmdV?=
 =?utf-8?B?aTRjYXM1a05VaXdiT0Rhc1BZcTByRnMzSnZQaHZlbFZXQkRXbE9IMEZ2eEw2?=
 =?utf-8?B?THFFQzVIQmFQNnlMVktRcFZRYnlyU0FHcTlOb3E3dUp2MXlwdXZucFVaR1Iz?=
 =?utf-8?B?bTVBWWFYV3NIT2hDTUg0ZVg5elpGNk1QNnpTK3lya3kzWEVvOXh0ay8vNm95?=
 =?utf-8?B?dDdYdUEwelNnZUVLQTdXdk9HZkNheDNWSjdoc01uNmJtdWYyQTBoQVlsYWk1?=
 =?utf-8?B?RWdDcFJxM24wK0pYWWhPWmlsV2FOM2NaQU1xdUFQRkI0L3VZYzE0WlRVWTg4?=
 =?utf-8?B?TVZpOXk2VzE4TklyOGNrVXV2dzJCOGdteExXUXF6MWJXdkFCTWFuMndqcncr?=
 =?utf-8?B?ZlVCQW91MFFHWVNFb2xBaXdGYkNvUGF1Q0tVQkRYL2orM215NUZFRHJwa3Z2?=
 =?utf-8?B?bytVbkp4KzdlVnBHWFgvVUltdGNzdEZYVlA2emRuRno4Yzg1WHQvcG5UL0tT?=
 =?utf-8?B?RFNGbDY1UERENE1zQkU5Q2g4UG1LS2NWUWNEOHBhZ0ZVOGlnaHhnNnlxVFJZ?=
 =?utf-8?B?NWcxMVVZbS9GNDRNUERYaUJ6VThBTmtUTGk5TFk3KzhFRHcra3Vuc2NwVlgr?=
 =?utf-8?B?NXdUWi9raGhZZmFBUU8vT2dEZ2pyeE5rTHJUNXBOK0VrWnZBdVp5UmUyZnJo?=
 =?utf-8?B?bHp1cnNIUW9acmV0Q0xPQ1RnZEZhQ2djbDlyWC90WG1pQjBBNWtWRVlLK1RY?=
 =?utf-8?B?SytCTTlyZU5SRkovY0s4bVNnSXA0NDRDZFNScHVMMTJFa3E1c0lHNG1nbnly?=
 =?utf-8?B?UTFXRitOL2FycjRXeHl2RUt6ckZzSE51N1VXZ2JOOHJIc2crdmI0K0VGYkVP?=
 =?utf-8?B?UGtHNjROazZzMlZkS0ZrSERzamx0NTNFaUR1dWxiY0lNTEZmV0VqR2dSRU1p?=
 =?utf-8?B?S1NqRUZyQm9ta1M1ZTRYa2ZrMUVndXVXb1FsdlgyRDA1dzRzTVhCS2pDNklw?=
 =?utf-8?B?b2o1Z2Y3Q3FTU0kvdERXS200QmtReDg5VlhpNFVKZlAzTVNSRDErVUVxZk5k?=
 =?utf-8?Q?VSMt5//AquLXeNnNUmFTxFujdsM0761e9qaY/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7e6415-9f21-4922-173a-08deeeed0a87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:18:18.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5DWmyktKkpyx3eSR4mITuY8M4+dFx/ruiz0xBvAb4olsVSim3EhIY2mT7fMii9pB91hlkX+T+QyR2pinALjWl+q/EuxK0Czt+z8QVYSRk7NmRnMBW0gbReMMPdQPNTL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_031826_505496_8AB3C0A9 
X-CRM114-Status: GOOD (  14.21  )
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

schedule_delayed_work() uses system_wq, which is non-freezable, allowing
regulator_init_complete_work to run concurrently with system suspend. This
work fires ~30s after boot to disable unused regulators via I2C. When it
races with PM suspend, the I2C adapter may already be suspended, triggering
a -ESHUTDOWN warning in __i2c_transfer():

  WARNING: ... at __i2c_transfer+0x36c/0x3c8
  Call trace:
   __i2c_transfer
   i2c_transfer
   regmap_i2c_write
   _regmap_update_bits
   regulator_disable_regmap
   _regulator_do_disable
   regulator_late_cleanup
   regulator_init_complete_work_function
   process_one_work

Switch to system_freezable_wq so the work is frozen before any device
is suspended, eliminating the race.

Fixes: 55576cf18537 ("regulator: Defer init completion for a while after late_initcall")
Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Trim the oversized register dump from the backtrace in the commit
  message, keeping only the relevant call trace.
- Link to v1: https://patch.msgid.link/20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com
---
 drivers/regulator/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 1797929dfe56..d5d24a940f31 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -27,6 +27,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/module.h>
+#include <linux/workqueue.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/regulator.h>
@@ -6882,8 +6883,9 @@ static int __init regulator_init_complete(void)
 	 * we'd only do this on systems that need it, and a kernel
 	 * command line option might be useful.
 	 */
-	schedule_delayed_work(&regulator_init_complete_work,
-			      msecs_to_jiffies(30000));
+	queue_delayed_work(system_freezable_wq,
+			   &regulator_init_complete_work,
+			   msecs_to_jiffies(30000));
 
 	return 0;
 }

-- 
2.34.1


