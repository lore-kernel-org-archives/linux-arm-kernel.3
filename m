Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D444C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 04:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=; b=c3LqaYzaFrWKTYwnbQaqxYQARd
	sV1Sd9RkDqbYaMqy1tFU1cwerzUAv4Pyk1GFFUMYZ6UpXzJveXjRpA/+Egsk39KtVZZnI+LepfojG
	Uj8G61678x3Sk2EWZrn3rO2Ytt3D1kBoWD9qiScHfacmAOo70ZVtGgMgirqH5hev7MahUPhRejA9Z
	P5cpMhBy4ARHXRKGo/mzsxGESngxeKAmZdN8HOWl7v2Xz+ATzLcZ58atr1Dt0lUrL5+3oPkwo2J7l
	nOSmsdWDIQxwH6zzHM2w4qwP4QZtaiz/cKGPm3heJ0iPbz25uwu48U/kpoPs7AzYS4fIOpd9KxyDj
	734RTa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ljo-000000010wc-1UtO;
	Fri, 04 Sep 2026 04:41:16 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ljk-000000010sq-1TWV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 04:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb+PjBHRjzBtLzffJRNTAfWgzPFj9iNWIYfuXvdWZMXkZpctiKQ+jQCSsIg0CVyR6iN0+EJvy7N+yYX+Ec+aNrhspBI4LuwULmdxrZ7rx/tX3HkNah+RPbzZ+Sw6F0EGXYaY2kqxQFUCUrW7zQpAHGPvxhAfX9vgK0izo6M2Jm8Jd4hfZqDE5mZEo1sfzu2dow+pTbrDMalG+kwobJgR6x9aHwueYy2F1kTkiua7QE5rZvdjzQtBFXSvFkL4zMjfD9zIyLDSnrIzEEXwQXqjBlfEd2FtPkQB1MwBmwd4n22jGZtUKZdx9YgcFX7kpLVqWt/rHYXWkopRHZa4uUaawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=;
 b=UJnijtFXNLLjCtY7hD8LKbFF2GkW4lRF+b0uuEskWbA55KOfk01TsmOqvKXxTkV1aaCMEvdTaiGhzzaPlO+7qqn+p96h1kB69J4rXJTE5+ZATSqU/pTTdDyYIQRVB5OxuM8WuuMivwzuDdokwmvgOSHyccMgymrO6j01HGQSBxY73I97ZbQDS8ka6fpkq2Jkto0F44tzCePl38BnvwN6djU3WThQ0tvzP95dit+TqFVOSt/s/IOhrbTp3Z3Etk3VwD60VoeYreCb9YaAoDXzAnVaZ0rgq/i6doYWkCXqLfB9eWRVny5zb6JGn7goQRqStPdd4giV0Vtzzkjf+QZ5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=;
 b=l2yMgfH0XIb+5E7h2M175P4Gl8lSSNSpMiWGqXGFsRHE6ANj6YaEHMKis7lICV5F4GWQjO6Cr7LrwoYKtzOd1G+DICjm118Z6quO8VK0exxkEvf+zFkdiTIlDM6mq9oJP/EG4gf+y+hWM+K9RO0uf9o2S2cvBU2/QwZyZMoFcG9CVBTY8cK6YnstRiqxTzNzoXqmCFfXhqM9ClPphLsZE/iCRW08kvsSOIzLG5BN3DijAHkH06+ZjyeSlG3ojE8mbUTzp8qkBcz5m0IbKIzD63WWdALR9nDSZExzllsH9IZWhH38qwav9LLrKDALO1M4awv/S+1lUDH98Qqiyr5pvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:41:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:41:08 +0000
Date: Fri, 4 Sep 2026 12:45:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <appM3K6fgE4fw9sK@shlinux89>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f54a325-1cd0-42ea-dc17-08df0a3ebca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: RcKke4CWtvriXecUM1Wj5WeGHh8ga7R/pmkLvGa5d/OTiujJ5vXZWmIV2cUwsMVM6esSxJwr2o9gPaiUJ0gSH2AzcXCalOC3vHQt2Q4qdyPX0xSjrHnn/bhOyjECor3qZmV+mFfVHnVuwVzRqSScWTBfupn9Fpdo46ulytyngMD9By/y4QkCAK3iP4O4zSGADRwUQKUIehP1u318KAyAuup/XkhCRmhfcJl6K7QcpYOAVFd7f1L0E1WfI9meTds8b7iQBVI8tlC1s9XV84c/KoZrvwljOOvPsidvarVX6VIeIyVKrBnmBqyVfmxtIx8HPI2j6n8Tw/quSU0wYFGwXkKgZEbO8CbuzWH4cxc2Qqktu0D60fknDmnwb0KDKk3F6BSS0CC/Hs9vAuwwstZY9AhPkFzubLBO4zTd7GSsQl91c6uB8B7POFnqmdv/5MvVoHSzeq3Nr+MyqFJ7ryq0++1eye9oXthM0lCKoTm8VuNqN1aiQSkDI1ngeXC8p6c/kVJJzS9fhubGQmxXQhP+8izgCzHoghhRtI0oJRlEIvm7V/tiIgB17/9fN9ogPbK/OYxowtBx0el1vB72g1sAnMCDkq8Kfumt56PI0N/1e4iKT6urvApLAKfyYxG+JWcFxxmEILF6r76UJts/jdJITuJU022+FwtKc0t5NkFCzMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9nTXQMgEKsv0Zm3hWzd4NJqm6uvmWHXE50YzWBBwrYVVm1VJHgq0UFTJ3Rto?=
 =?us-ascii?Q?52znVH5uNZ8sA811Qj7sq9/GiDfr7LcZMZ07x5wnSoRgbIq9wvtabT8JcfuP?=
 =?us-ascii?Q?LGb1eHjIGxVFDjhucP7cMIdfC4dybDpb5Lr6r3ZUMw3OcJ72QhSNXvPk+SV+?=
 =?us-ascii?Q?dQwGSCQJdGUru+3R/qDW7ptfGTRsuebeH1ONNK8cjph31WLDmYdnWse5/6Mh?=
 =?us-ascii?Q?wf0iwWC82DrJuX/wRkApkvG7r9eN9s3Jt4S073hmrjba/IuA4REq3TVBbg+9?=
 =?us-ascii?Q?fTG2kWtcljo6E2yOHeQm60so0/nMcGuli5lrH8XiFvapuwge4BWFvBj2sfca?=
 =?us-ascii?Q?AgFP9Sqq895A4RhS65euZ8Qny72yrW7qZPZvceO2qM8cN39qawlZ1H835ADJ?=
 =?us-ascii?Q?ToAiRkivz8UGyzavN1xVkzQR6v2y4ANhzn66zf482DGSn6RYNysQWQHoEW5/?=
 =?us-ascii?Q?7Rddbzvo1KP1l2E9dwQoiSocS9R6Sjpo5m/OrVRqeZlywJ4+P83+UCJruywi?=
 =?us-ascii?Q?AhBXt8tMeiylxeGMfrIlFwitUeS9IiLnhD5PcQXwowQULCGhOVPr7WT/HWx0?=
 =?us-ascii?Q?8bl5aQw5gWBcWtWKiKSvvsNmiFvA2VVqtox5WYJaKERFTC2vIrRJW15Z210P?=
 =?us-ascii?Q?whCtksJSKW9OSQFq0yBIBpcChbDDsCtobBPQ1tj7PG9cVWJFcr/G3XrOMQHs?=
 =?us-ascii?Q?MT9wfn5kOI5Ofie9IiCwCRSNdfMyFRShWuCL6e5ewVnNDULWMi3hdn5b3ZVl?=
 =?us-ascii?Q?tmQuz27shtKhNAQALgzlU9lVsib2V2g/lhF4cCEg9oVntCBf4cax7Ye50vR9?=
 =?us-ascii?Q?tMchikg9/vCdyAZ1GQuSvCn0XN2Qmckn8K9CNkOSpAESjIQoFYuqE4HYKRLt?=
 =?us-ascii?Q?i1Vomz1iTTchg839tZ42rwbE96MZHYpgz8hBNF88XffiI1uuW1EgXE+ozw8r?=
 =?us-ascii?Q?tO3jOsPbem6ZK6gU8+q1E7QmzRMaomS/q7vv1ps305H0v7+s1il4zapMku+1?=
 =?us-ascii?Q?oH1Dxpva+Pbzcf3xAQPkTwBc69ZHVfrNGyvdSPhx00qLtQcc3zL44oi+Hyl2?=
 =?us-ascii?Q?BHLDJMsN6t1Qd6vqci706pwcyianQRHiNBAna8lXVRRqZf2fjhzppopKioUB?=
 =?us-ascii?Q?S3LTyWJ4qyQj38WrCX54X2L/2nLXd3qD/dMG7jlY6SwhvTGyZ6ZNt673+cWU?=
 =?us-ascii?Q?kIu9fKOC3qxRLnr97ro5uLfnBkhhN+hyLRLiHHpRhLCECm2PYFwhy0Hdvbzh?=
 =?us-ascii?Q?dKGcrEcDcP9wqSKNb++zbxoF+wPrbDypDTVzlRv/zfESFPoymvOO37rTlseW?=
 =?us-ascii?Q?7QQA+pd3Cv2pQvIp8hC/gp0bWTAgqo8b9nvO1gJqoD5fUY2Gat/+kZYLCdoA?=
 =?us-ascii?Q?pfRvUtk8hKZZjm6HdS6BeLwfxsGD8Cny9Xm57knKRPFGfo7accTk0r8EV2sw?=
 =?us-ascii?Q?waCTydJyYeZ5XQ5RRldZmcvvfCybb4BrwfNfiheXM33lF9xd9Hq/h/YxX5qi?=
 =?us-ascii?Q?j3dSQ2AUvtMHdxtgDOF70S4J8jMBj1fanWthiQ9Vc3wLRI0jLzJH83pewomn?=
 =?us-ascii?Q?AfKuiRrOnlSXKvBNvYFv6DWnO6mthHdAFvCa9OengJMPaSYZN5zygKcoBB1x?=
 =?us-ascii?Q?fr7FtTISnzQ3LOf2Ka1/3tqM85l5MQOGOemZsp2T18Ueno5cltWGAJdF4Uwg?=
 =?us-ascii?Q?aRYIejjQP/2muWe4zZqhKc8JzFMLncEsUzxrg3W5+ZTwIvz9r5wiRFvFUHAo?=
 =?us-ascii?Q?LUwOQJcQJUQK1wCjmhh/4ZsqLdxhXyh0C++MEL/Nuti10Lm7+dAx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f54a325-1cd0-42ea-dc17-08df0a3ebca5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:41:08.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjeARr/O7/DONoaqRkrCi+RrxrgGinzthru2ebZO7DoUQm5eelHgY2Bu6oiPgSzIquMiCVvgDkpXo8QtdEjidBQYdTbTtzpll8y4MrEcx9RE3ySeHdhJhH3oSwvK+8PW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214114_634517_856E849D 
X-CRM114-Status: UNSURE (   6.69  )
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

On Thu, Sep 03, 2026 at 05:32:16PM +0200, Dario Binacchi wrote:
>Add support for spread spectrum clock (SSC) generation to the pll14xx
>driver.
>
>Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

