Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED39C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74sK4bwNfKjJi9jvQjtkRj3j9Wu3z9liULdHAtabAj8=; b=GZlqn/Ag4Qjjm1d6JUwBSXMslD
	H/AbpqKr/8NWyp+aznETHOg8Fj9f1a5d9GPpe5tOwx+PuYDXKxDVpThJ/QO772Np0sZH5sOlGt8Hw
	TkGpi8CPf5DGdGSBTDkg8EW/4M6SPU/8Ag/34YmBg95EM8WcwGPT6rHeEWP71rcWZ1HVaKFtSkiCK
	fagqSKmxwA29vXVruQdhuzsLgl9n6mzTlH31iLLER29zmmbkH+ZLebSNNSVg6O47jUa3en6qkomRO
	6GZBbHyrQKPkZkPcf3LnX0eGBoATqdd9PV6gCqpteIkCS84ZaueUmmWl+LrZwXWgYujAboQ4ipd/T
	QkecoGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyTn-00000009dxS-2tT7;
	Wed, 05 Mar 2025 23:48:47 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxUn-00000009VxT-22hb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKDiaZiGdENVfWLJKrokW4A/ecUNm9tvAWPR6sCLOsRfnJjca3ZhKMftdSdRYSMyktokktPyySC/syGfcx3dGl+Rq9qbyaSEG64J0yoQ5zgd9kpz59IGYtd19W6RtweokYzH223fUOMGTzOUiClQZ50aai6eRhOW7agOcSat6lHKF850fwdgRqHrQr8uA7cfYz0YIW2iTd0G/2sgrlp9Jawv80//FXucmQxw1qHSGO8Bbviqrbt90GbC14Kg1YD/r1PbZ+VALVzKBB/0eckOlcwxN/RmgWL5dl36FQyJKXZu+ml5hwkOIgxYheoZ+B9u31OTqY6kHzFcFno09AnaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74sK4bwNfKjJi9jvQjtkRj3j9Wu3z9liULdHAtabAj8=;
 b=eaOdWchwYmtQe0qjbHBq/jm1WbjNlMDQVf5MUi1KHLIil5t8my9btCw8iA8OT/YS3KqKAzxfkodMRuYOOOYU2LKo8U0WGvt9GJu9ElJW0SH/PsMNCyt2HcYYMjlPwueKFG7i2n7MOMWKWf3LWRQSV+D5jvug8r2QrJVIX9TrSsKydWETVBKpQYrkmWinRDaETCXqJijhU/HoV2PgYPZdnMhDigAKOZc+XOhXxPR2q7RgBUouKi5eMdGnxuIp8sziNyVGZc52X87mIJs+dvhvfwzgrKciZf+mBkwEHm5VNygeHvry7EBPzvm5/JDXf5kglAqXn9/whwfnkhSggnNqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74sK4bwNfKjJi9jvQjtkRj3j9Wu3z9liULdHAtabAj8=;
 b=GmBJaPGTpMVdYgtvZKf/q31MwQ16DgbWuH3jWCCl0nFrDU6yGWsAPzSMIqOdYywgghLw/4CPCTd5Z/TqGMCFm5rHHOXDtVWIRd+vrOBh44QPjXILb+G2AeQ0gOiXN56oLpQqTRLxBC2eJ8oM4ApeRQFKXd6VswhuSZ7ectZtanAhHRmzTpEmT3/A83xA0R8gPNLwrUCQ56JoeyXmCmdZ1HqOLiNHUTRW69E8CNbxrOA5tsZfsdxrDUhlIkSSvAbEhEdp3cXEYd9eCNC3zxtRG1ffqT0VTiY140tDvecohfCXwacm7Vk1gBWrpo89zh/Hjj6VXzbOD4Bcks6KkrF4Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8101.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 22:45:42 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 22:45:41 +0000
Date: Thu, 6 Mar 2025 00:45:37 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v8 03/11] net: ethtool: mm: reset verification
 status when link is down
Message-ID: <20250305224537.77vatd2553pna7wq@skbuf>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-4-faizal.abdul.rahim@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130026.642219-4-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR02CA0065.eurprd02.prod.outlook.com
 (2603:10a6:802:14::36) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 03443deb-fa41-4b12-cde4-08dd5c377549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T9qrowAX9kRSW+P5+pIAsGDzApg6OgaJQ2Ve5+K/JvvAyr7TJArIsfVHbbiN?=
 =?us-ascii?Q?D0YvfJgCGUNN+qIeYEI/qTiexyBSiQZ6qWxQMSoa1zjAWJ1kUVWdgcJXmb1b?=
 =?us-ascii?Q?iTHE5BMnk60Kd/TxVus79FgZUAeC++9FMqEbRinrZ/86T0GKCtGirn/2scRo?=
 =?us-ascii?Q?5kKXT5nxz7Ln69Vs2/bzUAqWM17hiowt9byfWI/T03K1IFSqvclW0vh0To5o?=
 =?us-ascii?Q?3T8AH0/3y1XMqTdAHh9yYHKjqh+ddQAOPNQYf76oBorQ7nV21PHPZ7PS1yBt?=
 =?us-ascii?Q?+LCdt44LjBfxo1BFOkFIZZXx4qCjBIuQadkBQs46G9nfLjA0nCKYP2dMlNHH?=
 =?us-ascii?Q?Vo0yJ4ZE5/3h8lnjkkXvrM54O1JVhmkndbZLKYA4VAOBJyc7fEB3+hYqORPU?=
 =?us-ascii?Q?wntdROgZC+r6cjngA/zsI5jXGbH2S0WQH4RVU2Uwy373hDZu40NlZn46DXcL?=
 =?us-ascii?Q?mNdA4hOttm7mwb3bL9dw9yheaHJh7mNR/l8tzO4FlWkljIgfacSUGHQG4fJc?=
 =?us-ascii?Q?qWArzG6+NH31EZoO03ju3SGlO4APdI2pcKNrds5+dLb/CMQ/Caz11U2bsVAG?=
 =?us-ascii?Q?36vzBwa/H3Wi7sRM1E1ADKiBOWiDMA/GPrJrW8VR0VpGMZux6sVDupx/+xV1?=
 =?us-ascii?Q?3YJCEgqpFQGNwalh0SLwlWm4uR/zukryjcucKHFucTmeRFid64UAOZbAvngL?=
 =?us-ascii?Q?9+H1fmDkO8XTU52Y1eiFWWe997NvC8x1h7tFJOMJRmtNtNxM0pKDzhjk/hL+?=
 =?us-ascii?Q?Ov3CyW/9+6Jkn5u6+jiZ1nq6h1CaX89imEY3Hx/Fy1CTiXEkVuw8Ck8sO2IF?=
 =?us-ascii?Q?LQLvXHzXoxg4oD2bPVbkkVt1ykVjRePP2N+oMGKUfrvm5btA2BmkKmVMWKHS?=
 =?us-ascii?Q?m148hFo6/ulVYCftgYrije6x23Eb+sIe1YWiHtO0rB2lNp2j2zN7GNPOh1aW?=
 =?us-ascii?Q?e9sR1oM8qoOfAWY620baTcrHX8kxZ8R6Rg+AdnaVsc5QfacdgPiV8DHPJV3f?=
 =?us-ascii?Q?C5ubzBlzeuAOVVuORR5VAdh8RbLkdSxB+fahlaKHd+ls4wR3/shV5y/+dZN0?=
 =?us-ascii?Q?kFaGEt/5gX2UQOu5KKbV93R6kv8o1eVkACZbBCRBiQtTcf9OFJP3sePdCzDo?=
 =?us-ascii?Q?dhBxX09eZruFQenjt+hq70LjQfNZlA0kZcnjVWf9K5FbbQFZ3aIA0AE96BTg?=
 =?us-ascii?Q?WjNscJUESi0Gb6RLE+5MEe1Bbi6XLefsu+CgjSpSZ1JNultkj+RL60D73Nhu?=
 =?us-ascii?Q?62aCN4OmVyQ0mLp5m9CDF67zotUwkagjxFmwrxEoWhD26OQg9pJOxSKTm9z9?=
 =?us-ascii?Q?EhUSo19+u5y1Nqaqjt46HcrzPV0BRjGCMIL/U39CQBMIZm+c7WduW6IvazIL?=
 =?us-ascii?Q?icua8TtOdxHVzqOPLOgR0P6ejfH5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/y4rErHDiOGrbuw+MzrNBTSftJENApyFYu8n+9ys1AbPR09Q0P7K2ugRsEWq?=
 =?us-ascii?Q?dhI1yZhO/PMfjWGq8BWs3d+KLk3JWn+l2lwve9rZarIQRKX4RKCPnZ+SbbD6?=
 =?us-ascii?Q?7QsH0qp05jSsrYxss75AHkR4sYV9KoWpbkdh1kioEajKn0h1UQThU3DvDW9Q?=
 =?us-ascii?Q?JB48pkhpOoQ8yPgwE/nLJp+7Eu4Wcpd1TTyg9n5G19fh25GKcICFStZf0Ilv?=
 =?us-ascii?Q?7x4Wo6anvXMxSCtJIBLQ60bv3DyTsReJarDbXFZMIbqmOeRU6IhM3a1hvZtq?=
 =?us-ascii?Q?5CXaj5JRxawGClZFM+oaLUarpq7WFpY3WQPdvq1QV8JML2q8GFYDwfT6XDCp?=
 =?us-ascii?Q?MmeTWM8T/i9w9rqcoVUrrXb8L4wEOSxX4JCUuDVOY9BWo7KSnaTQr2npV12m?=
 =?us-ascii?Q?wBhUi2TqWNSNqlhca9UukRoX/Mk9I1/+B89nuUmDGpAQNpqDovURWuKP7KpR?=
 =?us-ascii?Q?MIiy2k28+LxBjfSLuylKgrdMRF08YkqK68k5nB2Fh9MJ/1FuSzTiujh/VHMA?=
 =?us-ascii?Q?G1uomNKlu7Ax217w6VB8ZIFeVDnddWGTIYDIKvnIbPlFFjcgQc9bUw4s4HI6?=
 =?us-ascii?Q?qN6kn0taxouZ+vZv3Pg4xJfkLzHqmrbUi3aFo13mMG9R256Azqp/Xem/42h8?=
 =?us-ascii?Q?Ed5FPN1ae7Lv9IBxb/vqh4aYX1ZRpNELgwowGJ/SsOQcRcqvNdmC+952R8tQ?=
 =?us-ascii?Q?U2mWkNBygwtTkQWApzAaC62P0evcdqLpBdFJ+wuqwHGByr9wucw+iT6fQ6gZ?=
 =?us-ascii?Q?lm7j+o9g8vtrAMiZUdSe1NP/3TB2EtQ5c/7qnEGO/jZjztS/JXqTv8KuwyrQ?=
 =?us-ascii?Q?1TIAc/Sf/Gs7EPXYr8M6m09/+DbDfJhc/lQ3bJx3wjNd1RpxOUPCku134EZW?=
 =?us-ascii?Q?o/85xvWdppyCfxEN2Ss35UwM/B54SGqZ2ME3TXhyc80FDcygLWVpJqheUCUI?=
 =?us-ascii?Q?qdx/2moZz/Tfgn61RV5l4bCZjxbryAfFAb0X8MMsizoEtHuOPHfNu2Ce0VVf?=
 =?us-ascii?Q?xSp9vyK1RppHQw1nytFaJDNfJZsCEu7UCIANoCdBZ4cPwljdM5c3vYLU+BX1?=
 =?us-ascii?Q?sCtJGrAKF5AO1PTgyjS6DzUnnXmtm/Pvi0VlraaZ0/p8uRwok4udk7DmuN6K?=
 =?us-ascii?Q?G5X5GtqSMFvXhXLxu0siycAALcO+YB5SCKpcsyQUBRMV07oXP7GlHoYgBPiP?=
 =?us-ascii?Q?1mzduwxyMaK8WC0Ab9Tcg3JpjdBtAA50lDDMLVKcHX6UhUw6gFDWJAAEe9Cg?=
 =?us-ascii?Q?nMxdnRQuYXSG+ag0jh173imlntLaRSb1mFM1/VMqGfQEveMBungkhg/TpxMR?=
 =?us-ascii?Q?xHXfgIGk1P6OGB+F1l6XCePd4B1PZhpMjJZfbwAL8gZf/LSx9LDEDT4VAvfU?=
 =?us-ascii?Q?FEwMD+GSy3LJp2+u5q3WZ4mR8DDh852VpE3CTkpbXgtBn18eItJXbnhhxHL9?=
 =?us-ascii?Q?AiY6L0MxRpUTZPcxAPobIkNmwmwjTvN8ir/9g64ubrVS9nRVTskgpr9TXuu4?=
 =?us-ascii?Q?J97g2PmYw6Sz4pUZypVcwY2zVHA1v2/+gofPTScIE/DoB1NPOV24t/sOVhYT?=
 =?us-ascii?Q?H65S8RgOQbW2xgf7PAHtxiibLDfF7o1wMJufN6M6rQY7aL8neQKbBVLuC868?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03443deb-fa41-4b12-cde4-08dd5c377549
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 22:45:41.8497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9NbO42usLJwXjasTf4MBDuvGHEU4op6zLz3YBFJ/fA7V8fkrjG6WwhyIkSSgw3U28JOO8yiJlwvem6P11XB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_144545_527822_82D34D88 
X-CRM114-Status: GOOD (  19.97  )
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

On Wed, Mar 05, 2025 at 08:00:18AM -0500, Faizal Rahim wrote:
> When the link partner goes down, "ethtool --show-mm" still displays
> "Verification status: SUCCEEDED," reflecting a previous state that is
> no longer valid.
> 
> Reset the verification status to ensure it reflects the current state.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>  net/ethtool/mm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
> index aa43df2ecac0..ad9b40034003 100644
> --- a/net/ethtool/mm.c
> +++ b/net/ethtool/mm.c
> @@ -415,8 +415,9 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
>  		/* New link => maybe new partner => new verification process */
>  		ethtool_mmsv_apply(mmsv);
>  	} else {
> -		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
> -		mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;

This is not what I requested. The lines with "-" here should have never
been introduced by patch 02/11 in the first place.

> +		/* Reset the reported verification state while the link is down */
> +		if (mmsv->verify_enabled)
> +			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
>  
>  		/* No link or pMAC not enabled */
>  		ethtool_mmsv_configure_pmac(mmsv, false);
> -- 
> 2.34.1
>

