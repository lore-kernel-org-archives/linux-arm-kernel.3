Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C3EFCA17E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBHaUOy7pzzInV6Z2HGjU0HppAKGLJLPiesmCO5+b9k=; b=VpCd8BEX/9Boig29CjHM8wZtlT
	IaH4WGGI8naIUqkkQOG+zvApXGvo5mvZxQedklXeV8y1V1fSvy+yDnurtskASZJCuRzMMZxVvNhEQ
	Usmfc5gg9KYtb+zef51pmCDfCxBMBRo4lG7pZMQoUVkqxFD6EdlSVQXOQHmMFfS7OorkyNIyz4wi/
	V5GQGYtDndY3yPpoDmhd9eDxLLVIYPlGulpuR7wYOz2oc9iYBk18CO0BzDozeA4X4u7jSN5EH2dNI
	/HFqsSgo1nfvAru0caa5oVQc3U/rxWeHhgrbAsdSZVeN4XvBtVS19HCCkKAR1KEVjNWM8h9mzY7dS
	lsocDN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgdf-0000000859E-2RIK;
	Mon, 09 Mar 2026 19:51:39 +0000
Received: from mail-westeuropeazon11013042.outbound.protection.outlook.com ([52.101.72.42] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgde-0000000858N-0B2W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 19:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXgZc9dWAC/P7ve5byzprglNvNX79ruhMv0piMCVIvMnVAi7tb8cKEQzlV/PtWfaNzap08WFO+OPaC+sgQHWHew+Yhj21e0EBE5NSR6iY0HEaaRZPz5rPSPJRM+bWu187ls6I8YnvVKltv67ibDqCAX4BPCALp8kCuSQPpd7p3FM7GwIp0kovPVtx6nCnZxGghT6o9+lZ24u1QoWFYQ9VHArborGHtHbb+iYG7baWo0PdEH4KAXCWhQyqD00PsEA1NhfDa2CYn4ZlKHixn1c0qgdWCTQjHYlNBptkIazjkw9X7MG2xXtmPUC6/9Cxi77imlwyfiyy+CP5URslzeoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBHaUOy7pzzInV6Z2HGjU0HppAKGLJLPiesmCO5+b9k=;
 b=HA2gKXnm+jMUl/OwdBUYNtBscke0AaWl9hlzSrtr9iqFQXfcn8qRURlsanr3kB6LYreqQQ2136Tu0JkCRsteokd7alxUfnx6hMIagQXK1rKFW8FBJf4kgcyYSgO3cY/2p33Jfg+drqFnaImdcywg0mcRzzeJqajZmuMIAti1YJC3/B+4KcDAnkkADu8ZkQZPKVV2RgrzPHOBAabXEyzVghW1fKfqX7k6iBy3UirIi9zCYFH0FxAw9b2btalWyIna9Uo8D5zQ9qf4ivKNYNyur/FEH8YPEhwtbJhYOqAMK9rvt5fg1Qgb7W2R+uWI+WKWfIEw9jvrW+fnjCMi/pyv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBHaUOy7pzzInV6Z2HGjU0HppAKGLJLPiesmCO5+b9k=;
 b=m5dcykomW24blga5CIAYnCefGToOIqiyHBwUyFQsRbQ0CykBNrwDdocMQ+E5JfdWm7rGHsKJVZJSlkmFF7Ytg0rh7pRXuiS7JIyPZUvbfG0JJWcAIDEY7FQPPa9K70HF7YUKevaznXwxVbzQp0g3K3SaK3kWLk5rPKZPw85SPAaudmw18NgnNxLUFGifXEtz9UBPiRMmBC01dLnMcBhcNiub+EZCVwQzGHXmlK16iF5CW0OfFDEftoCcBGySAZpDLWjtdpEm5fp0aYmGiqOozXQJr+vln8PKyd6KDnbHMLklJ79xKthn0750z3FxvMfDPpiTjFi/PLEp2EfqJl29eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:51:34 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 19:51:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Add virtual channel support
Date: Mon,  9 Mar 2026 15:51:19 -0400
Message-ID: <20260309195121.1786325-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com>
References: <20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:806:6e::32) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bc1ad9-e93c-4774-675c-08de7e1541df
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: itDhB779FVFLwF0cgrSV0sQzmtB0l9ligWDqity+xw4klmU/9EyvRloQaWcwuOzi763Rl2ZP0GC3naEjIoqEBvC9R7u2uRvRBpVD9SIJIumppVYrYZrNEFi/vMBJJd+dWo/0O14HS4Sk8OQ7mnxnCeIU9IF67HhUvBtjoUMpvCFFZLIzYxXyrJ3doObetvQ17Hs9cVX4M1I0IQBwNiOrGdUeDwTrKVX8bh7sP2Wh9qar82ubgQ2LNt+1Ee1imTGIQvS8vsGdeM9ORuyYPyjH+4kCLjGXafDOFTlD/2UVxMEg2jlLWIVni/grxZHPeWQ9B7XDda8cQiSeM7NQxvobWYyVPjsnNz9QoMOz0vbwqXvPPkDMbqczSwUPyWbadNSJwZGethNcS8ckPd992FAoiKa5bFYwi13vI/KRAKHyHbTKzyu8gE2PBuTRgHsMR5QEJlmWg/f0EK3V15TyqtTrLHb3BnGfmInDGX2lHVHUwhjo1q7u3R3AHb7/MBUDaSLd0fyiuVo3DXifKJ4yxRplgeAyE98zwapOUluVSaUnZmkUO1YOqkiHKaBfMxGB5+7vBzzNi1obu9v00N7HZA4XhrTsC+hCmzii2qrH959HabINC3pnZS/CNsY/vWIDuGdW+Prz12hczHQYk16Pl8L+Niso0DpNKErwyNC7nVEnWTJT9D2/aUlbmfuhqlNsd8QVAfRYBtJExvFYmiJ2L5ksnusUUjiHn8O2/Xq7O05qudtykPcrC6fSuuqLKjHgOha8VvMS5c8ivyVoEccPdAnLAp9L+nglmV+NDQ6D4Ho2Rc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f4qG5iWucP+R9y/6zsobG2xnQXEFxsu2mLB7GzwxOWShGjzI1Q4XEWp/MwCz?=
 =?us-ascii?Q?GiYvdy97JAT2bF1n+gBWAljHF8GARvJJihWLW6V0YUHZvPfPbbL2Sfq58IkA?=
 =?us-ascii?Q?upft5qAr0gDLnNsIVeyMfM7/BUZQmKPEQQSDPhJMEBfSUGIMp8sBSXuqGBfA?=
 =?us-ascii?Q?y8CQtOWBhbLfmZIJisihEMac231oIgoYnNJWv9Vg8ZTNz5cHn0Kb3Yz/oxcI?=
 =?us-ascii?Q?KPY/fNlqMPybN5qNlWVzFrQ3afVxlG/84Zir7RUIVtVumWRdkxmvX2ZCFMLS?=
 =?us-ascii?Q?lCN3hKEEvH91SYxPsdq2N+rpcoUVzCvbVAaP++n9wkbIfvovndDRcl3YVuQU?=
 =?us-ascii?Q?P9EB7O2kmSTd/Qir7MSQHv8A6Iv2d/QN+0F9oafK7z7sNmz/VHI96mCrjUDW?=
 =?us-ascii?Q?MyJz68NwYijZhJR7wIJfHCAPiXUANOtCxUuc63weL69git263ajXakyWFyRc?=
 =?us-ascii?Q?ngJaj0gwJkMxx7kCbEiDZJeQCA9xy/m8nOzin24L7N72YG1g6U1NT58TavIe?=
 =?us-ascii?Q?Hu8xB8ZQm8O+KinCUc+dAnOYtQqAUzfB60rvtaP27JEunG4pVC0JAhYFLCWP?=
 =?us-ascii?Q?7gbUk1HgnygO25bzLPLsKvC1J8guhNZHWE+GZlggDf1p4HaMv9YoyvngFW88?=
 =?us-ascii?Q?gj0Ul4yXKt5H6dOH6yXUUp9o0NXSR+gIoxElIyv4UJBj1J3ZNz1MYfvLmL/j?=
 =?us-ascii?Q?SEYP5cG3TlK/+5ykro8UHJNZgun5km8CdhlkIDfF1Bb46hpUeSkonpz78tKn?=
 =?us-ascii?Q?4oS8n/RhA3Vdwvuw8vouueFgna8BTHI9fU/p/cTIcTOj++37PJS6rqedGeJC?=
 =?us-ascii?Q?G9hNVuLeMdwyuZKPp/GBjPab09anga669eYpQCeJDRWAE3DdRCUu+5XrcfGH?=
 =?us-ascii?Q?ndfCvaQTnwF2e2lV+BnlFhRABOIoLAi2qstodcrWokswpMkQbkOEWMWuxwXW?=
 =?us-ascii?Q?o1rbWpX/nxToFRacdbMthyr7YZB8FPjiYGZdfBuvQQFOq1m/lJ3AutoO6rsg?=
 =?us-ascii?Q?axr0KBWb44hLT+IXFIoQg3m4wUgmi0WobXAMT2NHOE+m6kz2fJCyPfFieNhG?=
 =?us-ascii?Q?y/hrWTiPq7EaTfiepREddfedEOIf+SW9bj5+WU04bqQpVpLkCbvxpKy0Mr2w?=
 =?us-ascii?Q?QgqXx8GxRRgULmS1vE30t31HD1DNwu59kEKXSQoibDkOOBAR1Wk9hkCu0K+J?=
 =?us-ascii?Q?TaGelnwLlghWIMXKg/mvEJAoW7lmJ6SvkyGlhzhY0obo3Ah5nMhD3ZwMKgbN?=
 =?us-ascii?Q?68iuH3axtZCb6otxVUr4Euj7YlJ0A6c+G0ka/e9tP7OXhTL8boZ76/G04U3+?=
 =?us-ascii?Q?9UFONiczbn26pRAU7x3KKyxVY9dkDPpy/MX/7Zhxis2OzaG7MPl/5df7UN6U?=
 =?us-ascii?Q?I3diezKVNZCHDpfO90KrAbe9Ar3IjCaxx6ywyHsHtABW9DBULohgS2oAUfMQ?=
 =?us-ascii?Q?GK2RZuHrtJDxOQIeMS2EjaX9f8sCLQFF6caTjmy7t5i0R7PzXFkrILYBdP3g?=
 =?us-ascii?Q?roi3NmffCVyvZLMVTmA2PtiBd2tnq22Uieuwqgf59/m1ITe2QaoRmo6xZ80L?=
 =?us-ascii?Q?ySCYi1dlWVFObwzlGwPtlLlM2853LNsg5d1ECHEtPc04TP6RpoT/NNmiAwmu?=
 =?us-ascii?Q?+zCDzXvV3/TVzIAyZ+jzLydXjZVnIYom/uzwzbOvxQz0700xLW4noRxv+f6/?=
 =?us-ascii?Q?G0uUAEKvUWl0iWbkC7ClEd05XPOSx17W0Bp2bqRqCURLdpctHcnK7oj08SQ9?=
 =?us-ascii?Q?mr/olN8/QQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc1ad9-e93c-4774-675c-08de7e1541df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:51:30.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4yPtTYRF+qGbssaUg17krdZd+jj8U4apdjA/9nD3wVnaLFp1a28783346RYt+j/x5cP/HrbLU7FNwO+WTRBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_125138_088091_2CE43CD9 
X-CRM114-Status: UNSURE (   7.55  )
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	/* Platform like i.MX95, ISI support 8 virtual channels */

AI: Typo in commit message/comment: "ISI support" should be "ISI supports"

> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))

AI: Removing CHNL_CTRL_BLANK_PXL and CHNL_CTRL_BLANK_PXL_MASK without explanation.
If these are unused, mention in commit message or confirm they're dead code.

Frank

