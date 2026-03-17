Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90B8F3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCrm+w3tUUlM8ch+a2wKJacmlL0DN83WttD+bfCoMqM=; b=KM87jKAqzwTsxdaB8V+RZnAj5r
	QSn1lUM0AZwBr6mx6oJAPq69BX9Du0m0klzqL8P4TwdQPHMcagbJByCYWWUtP4daWdU5yTZMJKi+r
	9+l8cP97X6+xXelUiXbxsMKTFNj9fuPrFgpz7Q/L2cfzZ/oBDAlnYi6aoidkh4WQ+SnZc2WpIAL24
	29NV5Uw3d9MInlCKa1JypDdSoQLzDTapzRNwjH52NBdxb/K+HNinKhMgfG2l6QpaI8K3dCv2nR+Df
	IJS3y/bR7D8TT50LvEG5Hx6L1wo6cfrNMY24KICzEtgf9ziy4augvOEHbDBdU9niXfqlOumZc9eTz
	/fVLHnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P3z-00000005ann-2isM;
	Tue, 17 Mar 2026 07:42:03 +0000
Received: from mail-francesouthazon11011055.outbound.protection.outlook.com ([40.107.130.55] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P3x-00000005anT-2Wzf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Drv2/c1rtFafCDY2VH4L3MIBdsRJo/kQY3m2oLEYiQrzTNmrtvpEE7swHjJxrQIVfdYnuZ0azV6xtzzJRM9yJTau5Da1jBX2KJAf+5jfitoTEyvQPVWiKlojtIAhKd2WLBxKefS5n0iUvUItMvOBuOtyoPBFTsVYnjD+1KA8frJpRLXPHo7pg3JMGhZroB9lpna7W7fvTVjE42LxM1HDMOaaYD6U6DwCht/bTRzBql61RcDjGwiSopKriKqVueh4450LgldSxwwvsH7Fe/Kk9y11DOz4mpTBHl3j09o3hegKoGvc1dzypKMz4vqFe+mkENHhsDwkI7yJDMRDjbItzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCrm+w3tUUlM8ch+a2wKJacmlL0DN83WttD+bfCoMqM=;
 b=JZG0HrRwVi78kXYn9ESJ8k5r09xARTwLVv94N75jgpdCPgxrofZZCj1ba9J3Hbth7ZL1HUEgODoJrht7fVpeqZmkx68umyK77ojbSsOaufkcP23wT37rlt8bVjxh3W9ehn8SUgZCQHRYvDyMas/7oUQlXvOruTONJ1Oh7ds+XeS0xIcrbfhlD3L6ASHoV19aW1jDqjfT6juVbzvODED5Vxw84JZuayjFGLBaXtQwDlfbOR1pGzaqWFkVOmDFlEkI5HUZBmms1cAy4+Bjtathuu6q6m0Ye9DFnKsApuzs+lNc9SmmxD5GRCror6+BKDzqaMP19aJaUjHhhU6TWtU2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCrm+w3tUUlM8ch+a2wKJacmlL0DN83WttD+bfCoMqM=;
 b=wcuLZbyvZQ+8erg13MJr4+1LtiBMTitHpDbX/m3f2IeaKhDi0ail46cTLJHuvPqiUptsheEO+K6ehOF8PLgnH2AppJ+k6DNR88PUmJusWgxGXTfR87sIx5QVPlfDUOR/4zGRFc4p2So0CkSmNlVXadUec6R21r1SiiCpTuYzlQNW8uYCy0rU7OrOtWBw2JcYpLpeKAi9cg8WVRNCpJpHfsZDnI1+0VvjBmHRt1zs96vRy87TUTPkKR+sAhjFdXoRT1BZl7y1KCZFLV0tyQCnHvyR017s6g8hIPmvy8jj1cnd4ml5CkYp5qGB0HrYvrT56KdIvpnuESG86DQScRo1tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVUPR04MB12169.eurprd04.prod.outlook.com (2603:10a6:150:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:41:55 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:41:25 +0000
Date: Tue, 17 Mar 2026 15:44:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 11/13] firmware: arm_scmi: Add bound iterators support
Message-ID: <abkGQn9ODanEVns5@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-12-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-12-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVUPR04MB12169:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a2f38b-f506-4eed-60f5-08de83f8978f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: YIq6TrSqwAn9mNbVs5kX/WrJFO2oPyTvUhrRF/crQHvbIK29tEERA6UyfsLGI2+Hyt9GvZiVLUznKSaqaZ2FSZPNILUXYKVDNIK8zEUaj6JyclM5U6LUD+2tBnnfJuscx+bsvprV6sU/pYz5lZXcPgyAPGxlNU++UVrTIYTuTSfYXJyPjbBem1y0leYtf725rZ8UWjqNjnt34gUKkfsgdYN5Ii6kEM/PlRsEpPHZuQWIlCBsgURSFU5n+PEb6rgbMPq+gle2SPYRzq/YGP05axn/jHxVR7SMO55Fb4J42bJSrUtknrVFfWR1meUFLU1IU8EvGM9ybgBSOz0Lb5v4L+EXUhEgVVF3NzcY2vt2PdvXvU/TwHLOt1xc9vkcjwBK7LcdnCZAB/gMKdYC3hCLzHZ0bDUaIxnYwiKL6qfYAj9o+ejNeU9sikccXeIJkao7LI4exFr62NGJ1W4PKLuZsNxMrqPXOlCVusjOpqr3SwYGGAp96jxWJ2fWewU2Pw4spq/FOzIRlGzQVkwV+csTHhGTwe83mVTZctdf5ebszG8ctwMp4McGHQuHSL2NXVjOdsoWBxSAcPGUuXC/x4u43yHYP0y3dLCW6uB3/zRgrg7DkhUdWjRmKwas6+Dwl5KQdVQKLeycO/br+LfKvA9IqYEnLRGb+mS78/4EJ2qr/95s82AR4+gWwlDotjNh0OdvsSn1X5Gxak8BzAe6odYGL5AW3txp7FNZZXsLcyrikBkK9BMlvp6LdLW5noVMGbdW1mIrxqOgwJMxW8jUfxqoc0A0qxqx04OsMAy5yta1vnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wh29p9viSC0zFFsptlLKTecCnAGLFuGUK1b/+p3dGaik+CJy3I2BSSKAVd6R?=
 =?us-ascii?Q?8CPFTM7sJQGBKvqy+mFzK2yP17uVXBq8ZBfwRLUYJ7tbf8S7H4Fv3BloUbCZ?=
 =?us-ascii?Q?IqEcnajJ4aenhG+4D7jW2QBC2TpujTjz8YADXzrpCcgZXZ04qbVH6Iff4bHp?=
 =?us-ascii?Q?2Daywl8wFBRpwoK72DzQxE7trJ2AISMxOvREOBpIlUSZ2MNqnxQTGV5MXxLM?=
 =?us-ascii?Q?STY4gNTYKal6V38bFc268vf/eJs3CFA/LXDQ/2mL6OSfjgICjxOUZUrfNubo?=
 =?us-ascii?Q?uGQA/vV3yn9aZbauW4o73r0BRDghyBfLhmynaw/bcK6p9VbkVRhLInpwt/Q4?=
 =?us-ascii?Q?O4AG1UhHUBHI7b0Ch3jioOWyu5Lm96xM71Y9t5N3FM7zJ7SA164f0zBxvCGD?=
 =?us-ascii?Q?x0VONKssDyWYm6YQ+WUsQyV0hEU7NdlVYmr4GY5FubGgJNLIFe5SlE0E76P9?=
 =?us-ascii?Q?cwQdOfPXqtSPUsnV/UGIvhNGI4ZR/lu9uREcLILpdIqXCZ6b3BdF5W7xGdRC?=
 =?us-ascii?Q?JZ9rshshEG4gUmUe2r5xiWYjNCag47pMIK/7gsu6FgEusY4orLoxAUnZtxxi?=
 =?us-ascii?Q?d8cFogcoDpH4IREh97HN4ReF19ZyNFBUaMPTk8aacCI6Lau9/5sVvzkHocAr?=
 =?us-ascii?Q?muGDchbB2CoA2yjM6Rde/p36epfOZa1ZW9In+Ph3X5e0aBXKkKFqb8fIQAoJ?=
 =?us-ascii?Q?OO9IXhlTggne0/mYzqUoRIo+3UnWK+vrp6hpoep7t47qsrDwv5J0nh+WuK9P?=
 =?us-ascii?Q?YBFwc4GCqfLtPyTQloceheF7/q7KttvfMjjDgWfXby1iq3meauFIW2n03YIe?=
 =?us-ascii?Q?Xw+CuLiDGdgS1Et5FDm/f8q9Qq+oczTZqKdjdObSmV+JN0uwIvwq4ATLrm5Z?=
 =?us-ascii?Q?VaFo4k+7/ZWaImrko2uJIyGzVN6iaPnsqP2cL/xrPzSXMBIIw0eUiALqa11P?=
 =?us-ascii?Q?YxutuKsEPcbJZLq7EuRYmgJl5bpmFhPJExRpYKcFQU0D9P+tHHv+9qJRZKlS?=
 =?us-ascii?Q?lLgJc2YA4PhtNAxXEvTNS1dzpyvfTZrjIRErbQsNUyS7vxelV+YnqSlra8jr?=
 =?us-ascii?Q?Zry+FxM9HPIIbzaNzukvySQALUqXSw5+7JWdHhWPJOcIIY+KQKSLxQPz0NU/?=
 =?us-ascii?Q?IuZULe31w7ZJDgvfNzutR/7kUqJT6dCQO5CCEvIzp/BlCpp/TxdOodA1zT8N?=
 =?us-ascii?Q?EIvY0wJb4Oh4+ABHN2H2UY40fb0HbAK2GKiZVjL7UOhK0CVHIqqqMz4wJHei?=
 =?us-ascii?Q?oNqhC0JhAnZfqW+MNYC1uwTV2oU7n32s3KZbA5rE1L/u8tYWybxzDttY8RsM?=
 =?us-ascii?Q?0v1wpXzndPAasgnNBiwiIzbHz5Wg1ousjoJm9T3bt5D/C3hFJ8ZDNTVCBitz?=
 =?us-ascii?Q?IcHHFgj0Q8FFe+vwSiVHQyIo1ZtMBmaEPKugttw0rxb9lT8m6MhTTU2U3EBg?=
 =?us-ascii?Q?l0al5qIcBWZ0IuzbZxpG76Y6C2Ndh0os/lklKZ8jw7ziPMVMx8lQYx5A/N0E?=
 =?us-ascii?Q?kSXgAjhgsyfFEUXAxgbYMJ90QzAnxViBG+g7Yaqig9n4Ti/J4melRUmXhNPy?=
 =?us-ascii?Q?0tjeLcWYiwgU5mSyeEZvwoU0e/N2iC4LbSitJY69NcOoBntr393NuNgOgKAS?=
 =?us-ascii?Q?9WgZ8TSiVyvhVe5gEaatkL9RRL5LjNU4DA3ca7kGEx7FwWPvV92htpBU8jhx?=
 =?us-ascii?Q?v5JbmcEJmGpsOgAoINSa8d6E27zgKHX8Z0q1jo1+j3YqLzkLsrMqYgQtlL5G?=
 =?us-ascii?Q?EvUc958Ujg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a2f38b-f506-4eed-60f5-08de83f8978f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:41:25.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQRN0ZIYCcUvvZrIuwPvAmQ6oZstVSBOYAlLr2F6U0alhffmaBp4ErL1CT9YzojJ2KyTfUpDbx3CdwsRWrk/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004201_644858_7CC4B4D0 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, Mar 10, 2026 at 06:40:28PM +0000, Cristian Marussi wrote:
>SCMI core stack provides some common helpers to handle in a unified way
>multipart message replies: such iterator-helpers, when run, currently
>process by default the whole set of discovered resources.
>
>Introduce an alternative way to run the initialized iterator on a limited
>range of resources.
>
>Note that the subset of resources that can be chosen is anyway limited by
>the SCMI protocol specification, since you are only allowed to choose the
>startindex on a multi-part enumeration NOT the end index, so that the
>effective number of returned items by a bound iterators depends really
>on platform side decisions.
>
>Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>+static void scmi_iterator_cleanup(void *iter)
>+{
>+	struct scmi_iterator *i = iter;

I see you use no_free_ptr for allocation,
Do we need to use __free for i or drop the __free usage in allocation? 

Regards
Peng

>+
>+	i->ph->xops->xfer_put(i->ph, i->t);
>+	kfree(i);
>+}
>+

