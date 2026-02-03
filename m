Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63976E87850
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZeNuyudnWi1rgNJyNlN7Vqnwi4oT0zYYIeolsQeOqc=; b=Wqr/M/sfX8grz+tIgJXubd9hL2
	HNqsNMWMm5ZJeesdMjTXL1YTnTyNuAGP/tPXKOcYV31MJVrWE2Z5ahGlTlGIYWkyvN00pqz9OHweH
	8GFM1NOKHiMyaA7t5SHxSnr/FKjaxnc5EhdikvVPGJ7BA6+xM8P4fc2M81IdQNCDe3MpBl+NFEPsP
	rpdGcS6RwIh2r+61rhatmwwTIg3G26T7tsU4KaoJe15WQysOSlMjEOIToWY75FF7fQxDYKPg71mEP
	ridCl73FFCscoxcHjBNLesB3yAAZzYLrMx+7i95n9jz7GipCT6+9JNHBIQzqKpe+Su0NG3HLOS59I
	FwZWFlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKHs-000000073Sa-3Q6Q;
	Tue, 03 Feb 2026 17:34:04 +0000
Received: from mail-swedencentralazon11013055.outbound.protection.outlook.com ([52.101.83.55] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKHn-000000073S4-0b23
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcT7IcymI2ZKOZGXhcGQobMy3KhgV1p3UYx4XJu9AYMVXY62i2Cfiw020mt0n7f94xagJ0/lcCLN5LbbVk5bWv1K37pdtBbw5Woe30j75AspgX1qbikbhZmxjJdK1IFp94BsHHVXridL9e6qsR9X05nH/vGMdAX94a6VWZYDf6gidlL5z7wkqKfeMzWEdC7cuTO6+CV5pTEE71CiPr6lH0EDOfElrVEI+FX9ivM1DRihQXef+PH8SPGyNwQJvNHEHdImtcTIyIhKf9iPNx9xzEEI5i72rai7nQhiginq6v2R+kH9ks4eRH7n8qSXZ0TvEAbVBRTjzrmg1HOO/oQFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZeNuyudnWi1rgNJyNlN7Vqnwi4oT0zYYIeolsQeOqc=;
 b=nwoY0DUuPPCfPM7656SQkqivSLPgN8Wu8C/HxRDgqMEWsiahBkX+w0ZoqI7OluMaEFnTAaI7iPBu1CcgYeztZs1KzT2uTgJoYltQVjKcxFsnFVNI4M12u7NCfriN5qaO7PIwbLQwwex6HT0WRKiAnsd9mpsT5PODjPpdi9hDMYkm5BCdCEF0DYubY9clbe99UdMQk1AVL7LI18V11IB7rn8pXJOBS9Pf3S/vRfjcfz4hfc8VnDfFXrCQFUtWYc24u/ZVsKbFVM4DCuhIg8QFn3NKHp14n54/gB1nIBnWBbsRnawoktFkbx318zpJ7/Yh0Luvj6mHW5CJj7NUtD2PQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZeNuyudnWi1rgNJyNlN7Vqnwi4oT0zYYIeolsQeOqc=;
 b=L5ov+KAtjQV7mbhuVYlzg2MVni1SoyCcPVQZ6UFTLG2kgmh11xt2kYfQ5nQLP285MkQIz8Z/h77qT2reiiVEZRz6pEMO6m/t1F7LH5Tm3sUyA16D7TAAgNKAGZZq137p3AM3sST0sVpJtBE3GotunzkffpU++oAboHVDYhU7A0C3ukyAf2Di+rbYyD47pDsRxpnGUglu0m4jN8mkpC3lHZMd6+NVk3EW7XjW0ovv3cSeenHL79sjU5DWda+UhJvI4ul1OR06Kfzm4nfaJsm9oF1cL5QfhqFW/75I1NgJmOjb8UqelfoYOuNbQQ5T6wawxKa9q+JW2sER6QQwjrUFFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 17:33:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:33:54 +0000
Date: Tue, 3 Feb 2026 12:33:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] clk: imx: imx6q: Fix device node reference leak
 in pll6_bypassed()
Message-ID: <aYIxeY4p1UUVnouH@lizhi-Precision-Tower-5810>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
 <20260203-clk-imx6q-v3-1-6cd2696bb371@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-clk-imx6q-v3-1-6cd2696bb371@gmail.com>
X-ClientProxiedBy: PH7P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f303602-706d-44bb-e2d1-08de634a66d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZZqlYrLIc/+Gv0JnEkb+vda9gUP1vKDKnEE08bxBVYv0y9SEjgLeFxn6m3AE?=
 =?us-ascii?Q?bTt4E4uEjBiP5cL+uXPMuK/etdUlIgFLAm7FtsJJfinJHCDpJGRajUyXm5aF?=
 =?us-ascii?Q?Zqpp8aM8ylCqMeHPaAjProFUjSJLStyPvendPhcCJZq3IHF80aNRFiva4U2/?=
 =?us-ascii?Q?DJqBtH7mqn/ONub1nz21EsiEtLII1ub7lzveOcjbBfT/3r/FZRAc6n5fVlOG?=
 =?us-ascii?Q?u+wAVIj4XZxHEjqzRDQ46GArEhaJ017jAFjaKmPGXsmAtQHoeNLvtPNCAIBF?=
 =?us-ascii?Q?dYnH5ZNoW3Csuy/cRKWlJx+WMDqnZtk21OGrRIK7jXPX3AuchldQBHBCLk1p?=
 =?us-ascii?Q?OXK4Y5oNDnJXsjefT0P1euM7u9u71ZPEPm9y5qSXsNdvkoI13tKh5MpNxrru?=
 =?us-ascii?Q?c/mng587tbzK1QAGh4MinDMFI/HN55ckE5trxKdQlYJ+wyXFp9etAxOOu6V0?=
 =?us-ascii?Q?v0wstwI4X7K7T7Wg/X/KKTf0v1T921m2M/ws4R8izj3v/nDAzxi7nAndo+fM?=
 =?us-ascii?Q?wqun21arPTtSIY/v/5RsG53FJ1TmNrnXYbaz29dtxdCeGIYGZkTe80Y4ajPQ?=
 =?us-ascii?Q?YarSzK7D278D/NU7814OoAey0z8UUouQwM87Bbi/l07Tm2ilp505lYKsZQjY?=
 =?us-ascii?Q?OPhPGZYHnjEtjWm43l4V2d/9NR0Tsnw1VFM99KhOA822vfmId3GoYqZnbNTA?=
 =?us-ascii?Q?CAq4VZuYhLxVScl+GlM6xGTrIQT49nRK+/kkA7S/ezX7qn+EDRnD9zxFpt+r?=
 =?us-ascii?Q?UO20MFwnk966bCShH83ZJad++X495JBMcuPIydogfXT9X9AM/AxeT7Taandv?=
 =?us-ascii?Q?AkasTZ9Bk63kivRd8rfTc5RAGW0WRzbgPpUFbro/3VF5eYV9L3s/TkynSXe8?=
 =?us-ascii?Q?zG8nqINsRKrIyjYZZGxkrhEYLZDlqhYFnYIILntXqZgE9MpVvkafzsv9uMKp?=
 =?us-ascii?Q?pMEEXqFs/F5ELDpGqpeoR7bgr7t9gHXYjGG/WrX7E9iAxAY1+Shh2AYUvbGM?=
 =?us-ascii?Q?bWPAprG9kT8pgSLF83XmM2JchYRT4qDI4XfeE2xsSEybBfs4S+zKmpp4aMnM?=
 =?us-ascii?Q?ye0DhLBajoideiLN7h6uRxJeZsZhloxLwsUvGeZIlLQRjeTc5PQ14+AoZEof?=
 =?us-ascii?Q?dEFdIjuHvaZ8qdbuKeIsNZt6+pr/enLuV0rWJg5s+B9djGBJzhGwYxUgitCA?=
 =?us-ascii?Q?XWfuyHyEas6jIPNx8rhnruDQL65I10jp2zzybITC2gIq/mev5Ii3qJjmtOTz?=
 =?us-ascii?Q?7LA147oz7ZDe8e0qup5glHfglam7Zmiki+5Db0rvakE0XA7hw+4fT0OOLPuL?=
 =?us-ascii?Q?oJF91DvE7cZLTqoywDGW7hXpaMQYO4mc68HZmJDrX4qQeN4YVhMem5DvkO6f?=
 =?us-ascii?Q?ndLj4dpaVfUO7iaXPFiToj9gn6hG3dVTTp+BhxhwGzCE/RDRm1V7Vh6SSp24?=
 =?us-ascii?Q?EQ2rRm3idRAASlbB9aPYk/6SkELdXIVxvd7MM7NBXQfPlNQUK1K3dj0t/jtz?=
 =?us-ascii?Q?qnqRvSSoo/OOmfCEIm3OeMtPA8Q9MjlwpNJieYU9ZUzXS0DBBvQXYqVq7Sxv?=
 =?us-ascii?Q?yPg17eVAZusTlRbTwxppAa6CYgIbeCI0URkaCKhzm/K6Vj0IwsUCgMig6rSk?=
 =?us-ascii?Q?g+9sEuGz/aTvhM++gxphmYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QS8gLmUW7SwrQPOUQF6LEqERfxQgVdZUnGZxFwm54WFwNPgz164kLaKOx2BR?=
 =?us-ascii?Q?p/0sZAu1eci9ITDOCtFXNqEKMlztFGXycH2fqhAyBZqN6VacspjLsEmm0mNp?=
 =?us-ascii?Q?ZIAQFndHPYn/iIn4E0izCy1FadEXmhCSntaCVAEKeHzj5spBGVCMaJyTLaBn?=
 =?us-ascii?Q?f4rOy6ePQjUDHsnNVivRzR5eMPe4jSfCM1/+Co6/UoBt1PawX9VEL9bmfpfZ?=
 =?us-ascii?Q?DmjS+w26V3Xh9nk7LbxVO1hWMMKS8Mz3KmRjqn2c/T5EO1XcEI+ee0blRBcw?=
 =?us-ascii?Q?EYgXe/JRc+hDL4eYf8FSNJt2q9eVeaW0vDNz3AEp58qbAYyaWHtLEwcedoJw?=
 =?us-ascii?Q?gGJkAzchxz/v+PvmgezDtPL0H89eIur7JiVZtCfC5Pk9Z+FAzcvr6TMamb7U?=
 =?us-ascii?Q?09Noj4dP/DxBZImUj6bVWW1fHj1JnBMGCG0BsTA+5aLMOtz1A55Q631drQzX?=
 =?us-ascii?Q?P30Vt4wIJC73xQX9PXLyi7HvVWPF370YKESolc7Qg6oD+BS9Aw555lqOSus9?=
 =?us-ascii?Q?Wx5+JmgBF046cPpdhhwkETcEcR8JOMkDy05e3RdGIhsjpKyofTf3oyU97t8L?=
 =?us-ascii?Q?HGpsJjfEG2eVmFSh5pNmGqWRIbjudnbFSFIjXalWoPdsBGHR8ThzFzk93cAl?=
 =?us-ascii?Q?SBhpEXkokqouJFuZ69onacGJXeONlhrSrl4nEzdYgxeoM7lPJOAxauKjzCdc?=
 =?us-ascii?Q?EXTfcAXku6XNAs44dIy8WxIahtadSBexIMz0pBSjx01yTzmDUIko2XOma506?=
 =?us-ascii?Q?fQP2swnfWu/1NRbLLaWah78YDMuDVvWi6ymGpBZ1iAtSefrb/tMh18KZlx6i?=
 =?us-ascii?Q?OFt7wCx9IukcMiv+pCNUxGEJUeD2vnMDd1OmVCh1rkQsRNZBfLp6CfyuI1Fv?=
 =?us-ascii?Q?rAFucdHiMVM/3Y5Mdw/GaAHrgDB//11+b/2GqhIZ9tPRhbO79mLFt3XiNGCC?=
 =?us-ascii?Q?JaHGIP7LvVC8A2w3NMaQnOsT2MHQbl4yc6aKsvr/GPDVg8NUwBohv65/AUG/?=
 =?us-ascii?Q?iBMCUTI8v7V78fOssvg1GO74ZuqmoZeOn+QNYfcFirvnyka5fEqsht81TYyw?=
 =?us-ascii?Q?kCI/ISuBT1NEd1PQGiMfrqw5/Elemv//ci4ugYW6+RWk6Lid6410TfDEZjCz?=
 =?us-ascii?Q?gDBPoTxi3dSCd9lm3PeqHniWQV+P6JbZ0bxLLGUk+F2XGLBR+mazO2XMVJgJ?=
 =?us-ascii?Q?2cwZOWsMxzvL1xQbKn60OncYW2dQxKyPrNH7nv8PosyYK13OXrYdRPXftD9G?=
 =?us-ascii?Q?gKrs2H/DY8haDouZVek81qyOm4yZE6JpvOJ5CrjmOha0KVmcU/qW6KlkVaV6?=
 =?us-ascii?Q?wwL51y5ZO6WTmsL7SgKiYPS6hs/BtujQjMPxG8xqpfQu5wxhVsiU0lPrFMLm?=
 =?us-ascii?Q?/996MKDyw3sForsMYfDKk0pdj6pIBgXcwZSiOJyYArHupyFt7z0EvHIKMgHs?=
 =?us-ascii?Q?I5VeKKfgfagOLDC95GH5bZDB7iBGFTLiTUluEBz+0hkvl66lOSWUkQYhGRD3?=
 =?us-ascii?Q?X9qiN9KD5fJzNw5rdpO4IdVqPjLN+Jl1Y07zoiW4Yrebl9sH3xWwKKekRsVJ?=
 =?us-ascii?Q?IgmHeD90nJ0tHAdRKGNiwD+pgGh56kYzjaZtJx2av1JYq1QWL2Qis6fqGihU?=
 =?us-ascii?Q?7e2O7cn0/lLhCADQTktB+SpY3kRBrZmdsmeTvrTFguV8gEt21osSX4xs7Eia?=
 =?us-ascii?Q?40mesN3lQQHOMJQgH45scwqIZkxo81F+DkGyMOx5qI2VJAR7MjEQN2iz4OtG?=
 =?us-ascii?Q?73Xf2tuMNA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f303602-706d-44bb-e2d1-08de634a66d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:33:54.1289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pPQMlIT3DwuIhQ3YE3ZuHP6za5wozYAllo3FW8kyO+oahcrNRb/4r4ow4fEzYBHpwMxDECGhKKDr52coCDfNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_093359_186176_121085E9 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, Feb 03, 2026 at 10:07:57PM +0800, Felix Gu wrote:
> The function pll6_bypassed() calls of_parse_phandle_with_args()
> but never calls of_node_put() to release the reference, causing
> a memory leak.
>
> Fix this by adding proper cleanup calls on all exit paths.
>
> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> v3 changes:
> - Fix Frank's comment, add check before calling of_node_put().
> ---
>  drivers/clk/imx/clk-imx6q.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index bf4c1d9c9928..ba696cf34fe3 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
>  			return false;
>
>  		if (clkspec.np == node &&
> -		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
> +		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
> +			of_node_put(clkspec.np);
>  			break;
> +		}
> +		of_node_put(clkspec.np);
>  	}
>
>  	/* PLL6 bypass is not part of the assigned clock list */
> @@ -249,6 +252,9 @@ static bool pll6_bypassed(struct device_node *node)
>  	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
>  					 "#clock-cells", index, &clkspec);
>
> +	if (!ret)
> +		of_node_put(clkspec.np);
> +
>  	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
>  		return true;
>
>
> --
> 2.43.0
>

