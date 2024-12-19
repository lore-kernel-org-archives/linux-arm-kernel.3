Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE48AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOi+nFPdHd0TxTy+wHKEpaHVLv2wyL0jPE2XgxeVCL0=; b=w9rFioMJ4x2BkRwxsndkMDCxbl
	4A7OQLtPIT4IAv+GWQX08kVxDQNIb++LKLBJr1aXHcMzrdgygOT6xOMC6jeW3c/sHNIZQigTlV8I8
	N8HExvJsg5rV61Cfo2y3UvijF9CXm6GxxKIYH+K3BQ8Rr+FXeYyfiqk0hFxWL5giS1Vl7ePtmgyEZ
	nAk+C0thhwXCfcG+UsqXlQJ+X+JjLXMIFdtCzre9E8jjLpD1pbpTfLysKh125CawNVb12f6TxvwzO
	IDJyQrHwYWOZty0vPQvdD5l04uDR3Dc0/rb09L4q3GuMsIL6v6BEbl46rYBx4cT709CCDlMUPm+Tb
	TRZby6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKCq-00000002XJ0-3rUu;
	Thu, 19 Dec 2024 17:21:00 +0000
Received: from mail-am6eur05on20615.outbound.protection.outlook.com ([2a01:111:f403:2612::615] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK9c-00000002WSj-3llj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cws59yCfH/njIXLzmxBtNyR5QBfc2QSE4Kz+yDf2inr4rhDx2Srix++jOBmrBzGqxyyTeBFMFFb+TmBmCSBjwtqB8eky3XmP/YM44LTRDekWhynIaCsTLRnUMnVuNIWybYPaguQypo4ZrkMDn6js4MqbBIlo7Mc0DmJzGX8WK8GwSLTKwdrUO76d0Tz7QC/S7vckU6h/EH8ogDVjKqdgUcTUuA6BBNQEngGVKPYdVF+7U8pgHWDto+e83VTeHEpOritwA70a1MpgvhuLL81jtr/8QRoebdSD34Y6BpwBPYIYVXrZXB4MxXCtkX9RSilJ0xhruS/6s/zNaxs7VUu+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOi+nFPdHd0TxTy+wHKEpaHVLv2wyL0jPE2XgxeVCL0=;
 b=Y+f1W1uCSy2w+IGQu0zsFMIgLm9tZb6fk4taBYlTiAuLewpaZKr6rCICNJsD//u9IEKcYEzW3DcvZpj7p3/HKRKgw4jw0KfOx2rlibyVm24/2EOB9Y0dBSVRFjNt/+9fmEy9eW3t9bQiDD2HgGEAaJPeyMJ6SAQ0j1VFQD1wHlKVlqlIKalwZv5qVmFpuOq/ztT6VQGWl5lHTutP8E4wqamFzzSXmZEQqRkAzuh8PytyWZOL+LDRoFxgO8rKGAb25gq7EXdEBBoo0f6EfMe2Y9dQdig5aYZhXjPqm0YCpQRgCY34W5flMRdsqm6/OVc0/phjC58zRzI/9Hs3AOAnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOi+nFPdHd0TxTy+wHKEpaHVLv2wyL0jPE2XgxeVCL0=;
 b=NRSJwatnGzCiSv9M4lEJS8HYCB2EtZnLkraQ34FweGg9q3RdptChjr2H5sqNA30EiJJD1ePQJrApPNm+FpImK9CGQyvTznje5xEQl/pfBWxfp/CHDscI++7mFwPid1Q0fU3xbp8Agk0I1/5tK05wKz8+ND4iJS+5PKsF0JiPluX6EeDItiA/y+0mLTDAVXebBguHkCL2iIIu6PAZQcfHXfWnQ0xdAWFNNq0LQ4henjJlq1RSlBNmfJt2nXHryvlARf/Fy20bHx7VF9KNXNlc7fYgvDS9QlxuUNlY+7qL5BoUcDqFDwSGifT8BEKE6NnaD4DEIfeObkFBdXSa76zIsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB11066.eurprd04.prod.outlook.com (2603:10a6:150:224::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 17:17:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:17:34 +0000
Date: Thu, 19 Dec 2024 12:17:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: s32g: add 'I2C' common board support
Message-ID: <Z2RVJLKqimn+jDYY@lizhi-Precision-Tower-5810>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
 <20241219131029.1139720-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219131029.1139720-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB11066:EE_
X-MS-Office365-Filtering-Correlation-Id: 004d892f-8adf-4edc-7fac-08dd2051071b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/sU0wI1QaNnLD46oki3mwMgHH9WX+dRYnjLKzg5BUq4KdNzsW1tNxsfvbRMj?=
 =?us-ascii?Q?pLKk4qRWMB63XRkz2copvJypcS/+K3RkCCqfoCf8yP6hnobis476+/lmiFor?=
 =?us-ascii?Q?2PvmzaNxOL7NtbDhfmg8ZK3YWfEaZBLqUVfoWff+k7zBy8jhKURRPeIi9EmI?=
 =?us-ascii?Q?kfYxg4+tlnkCLP9xEn5ZE1rhN+MJZS/XqFY5AOVgqXgsh4had5T5tYqz+1Ik?=
 =?us-ascii?Q?zcTy1lrRlQMmcqDdsRVf69P0J2BaMkbxASMdNzDZ7zkWqUSsIQbY/UFEbhz5?=
 =?us-ascii?Q?eisX+DFN/ZRtZ4p9+EkvE4FclW+K0CveEFQ67rWOAAVjqDruDohAnTwvdTjh?=
 =?us-ascii?Q?+ndFeUi9lGxAhhPleqIi6GBtsaXQqGMVMmVX2nZtVxbJ5d2pGCuRNovWJ1gt?=
 =?us-ascii?Q?M5k/rOIwB9/oA9QYcgGR5s7I7FWC+F0EzmpZdKEnjZObun6JeSU7McKlFcbJ?=
 =?us-ascii?Q?pWEPimANbv7RJ3pkqSW+kLbtnSGXg9Ha6fmPzwDbKctbZiRJhYoSgTuTwQ+g?=
 =?us-ascii?Q?jCMOfDvXJIQt+pWVG8XGs4s7GDrXhtgdGy7bX0nydJ0cgj/m3crhqZDWBaQs?=
 =?us-ascii?Q?xOPKkb3sGPrdj5d3y7e1PnptEygt2vhSzmhK9NaK9kXnvwVLR+xNqY1A6VcA?=
 =?us-ascii?Q?fmhHg/w/B3dOfKAJl/FBzQ7cn3S27YCJytABW5DhsD3C94yFGI1pzA3eguvs?=
 =?us-ascii?Q?wgbGHm/9A2IEtLgIHzwVD1pYI0XqqOkFMyePLM+EOtG3W3LiDP4jAqVxPg3O?=
 =?us-ascii?Q?mHdF1/PcCjI78X7oiOElOghMfSDoqSpWjOS7RFfxpBd2pyep7jqrP+P4kSs5?=
 =?us-ascii?Q?aak/pTS3+leOyEVpQ29FVpAkalKHNVYsydJMAbDrOYnLGoHASSyBv5CcTc/2?=
 =?us-ascii?Q?NzgliY/1rxlWbfMcFxfJz2m8ImAeqheUErKKeISXsgjo8uk3Oa4mkJVgsnUi?=
 =?us-ascii?Q?jGvvv17kpI3rn3gxh8JRInu1VUbPCTbQ3JYeTAWU1YwaSpoBAzbGNMRm12Dw?=
 =?us-ascii?Q?3LXdQB3JYml0lCttaeY2O3qGbRIGoT155NyEZoIcLRlYE6SvIKrmCjg/Y2x6?=
 =?us-ascii?Q?2Vz0c90ZFbgeIROJeMIijWeaKpJ/KyIey29lChqyHDDE7mBmqSTLJ6IuvhOv?=
 =?us-ascii?Q?wJAjkefBWZFXsBl4j/VI8D5aNSkZKMBJqFUd7sBMKtNQyHgghENj8QiGyLGW?=
 =?us-ascii?Q?bQz9Bmq6FJPe4LZzlvLp88aM6y+BjjI0c/QaEiuruogGUgdGyHlqwmU5zsjU?=
 =?us-ascii?Q?eOwmNo1atpkrKNxCPUsTkeD1Il4V7pQcBbhGsmfWGxcscPZOkQWkOTkPnGOP?=
 =?us-ascii?Q?1SrZoN5hOpjyoK7rBBr9nS6Xcu6V3loCM71CEQih52DYITZ5qjHkBGsGcQ2s?=
 =?us-ascii?Q?PKx75cDVhrtNXYp/dDDdKcN/4hO9bLuMIeBKsAql4YRKzq93fTo02lie7g0a?=
 =?us-ascii?Q?0RmO4WW6dHGLLqN4W3YEm520BTe2iJAp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUUmsotaoeeRYQXRrvsw3swrRqiuwDuNsFtGAh9PvKqV2aUSL9JuSDqXSO81?=
 =?us-ascii?Q?9RiszJ7MC7HodfVhVZBnBMqL4WnKsV56nV3T6+9cOE5yPw6brjG4I59RQ4w1?=
 =?us-ascii?Q?S17wZpd8cNGvsSEeLAVPOfuToPRe7bBXiy8QJZGF3u1cmvHSd0UAChgCMO+A?=
 =?us-ascii?Q?ilfMTpa2R/hP8E+dshi1Xq7rJeZvBrSgI4vwRxwYUYM/cYUEsOk/0RVndrGg?=
 =?us-ascii?Q?xLRrlO4yhJzoPCHqASzxkwz4GUvpS+FqD0B+I3Ze1s1F5ISk5duLr5iEa3l9?=
 =?us-ascii?Q?xLODr+E2w/+5Z0NkObB4aMnUi+s7x2/ww00jWvtlMrFOk0UssB+lE+RnsOpD?=
 =?us-ascii?Q?B7iCiv8qovuVVP4yBXevR7U2kKvt0CxARdIha0+hQlkJcUzKNsApIgNgdnId?=
 =?us-ascii?Q?9XOapU0PNpX8ENB30hp3KJFdURYLhEViIaSGp/XQxvNd4iRHsTYiuRyBv08z?=
 =?us-ascii?Q?bqREvrEb40jvY5J3y0rEM5uQ6Dk1T83diVQ6n3u7I7a1SYIOuly7cdvz4EzT?=
 =?us-ascii?Q?uNJwS679E5Fjod/DomeQEnLf36WgEDik8frvtVMJ9QnW+xf6AjaThf5MFXNM?=
 =?us-ascii?Q?ilkZTJh1ZKdnMyqaKYa3tP5iAKfgsTFUClZI5TmjzvOs0qtdJZWDHK6Vaf4J?=
 =?us-ascii?Q?1wZEkXppKDRySZ2oxmYwfWd2v+UO1R7FmpZwZCrTyB8DrF2vXyxzIgCgkBsD?=
 =?us-ascii?Q?wHe86KBD2Q5gY7OKqN30JXJKt1Sd7ip1xh+Jw3PvAfzR4CT87hV4GDvF3A6m?=
 =?us-ascii?Q?jQX07Bx6kXBzfSOU8p6R5iikKhHyVzsMKIxUU1Kkc6ZZAGEyEWLE9RIEmi3r?=
 =?us-ascii?Q?WRM3J2uBjRqIGdKp7r32KJP0+7gIiLJwlYDcbd5vWwS1JkkuYOPd9t5aEG6u?=
 =?us-ascii?Q?J9EqZCi/4ZfiRTw5fa9tqYGcjG1wA35Htnlkk40ORiomE9zv907FSWUDsHEr?=
 =?us-ascii?Q?MWn8LgvpK75wIjKdi10SLw3hq3PSKuEJM/+35/G4QHo/qqmPlMEm1AFOasn3?=
 =?us-ascii?Q?uFor+6pI1uTcF0uasBflnbNGg9skxkTKrFe7msxWWB0tmdnvmXMQT5k2xJ09?=
 =?us-ascii?Q?GVfCUGnXbg/H5RMF8gXplXSstuaV/4pDwtx6ITWwO7Iw0M3X+dyBE+A65el1?=
 =?us-ascii?Q?C62XAW76iobs8lSK6kc/smSuqs/sAkV375y8fFHjLM9yMW0qT/4Iq6+un9+j?=
 =?us-ascii?Q?ZtjGTgDKt170d4vgGnc/i766bYn/76k3D2Nzh9IDu4lFQJjptaNP0L/oJ958?=
 =?us-ascii?Q?CW2yJqBWY59IsZnMLYo0ohqzs7DlVhiJg0vdm1y9grwX4NxsC2uHC2p7QErJ?=
 =?us-ascii?Q?qGCClfRDnHCeEPuXJCDRU431pCPLKlhP0qXzKF6cutFO/BnlYcswTvU+JC5L?=
 =?us-ascii?Q?NCAWZuYSKve3MFZz62edUkIl+sJOZ81h2iS+LSB/hNOOwQxj3A+1KVNWmpNG?=
 =?us-ascii?Q?D+hhe9gHfBr+HLmiFfkRsWmwHcTxlZ9wng4AAo2P5pc95E9C6EMPpNPkCP32?=
 =?us-ascii?Q?2nf4bKfxGBsYLujUl17VhiChomE3RHQAZcGCdedTnCBoECfEa10W59hbsuf1?=
 =?us-ascii?Q?ETIjpU4f4+aprIyOMg/7q6pdAwAWhZz6J22favMM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004d892f-8adf-4edc-7fac-08dd2051071b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:17:34.1222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPHYg0EFjfhc5nZ5gtj2E7Uzqonje7cSbzpP/0m+0tZGn0hTGiL2rtR85qxci6ryNoB8IrAG9vcOOMqlRKP1Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_091740_984257_849C4696 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, Dec 19, 2024 at 03:10:26PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
> (i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
> will be added in further commits.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 45 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 50 ++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..0e6c847ab0c3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -333,6 +333,33 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;

Need add common part #address-cell and #size-cell, which all are the same
for all I2C.

Frank

> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g2-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -341,6 +368,24 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g2-usdhc";
>  			reg = <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..666e4029e588 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -390,6 +390,36 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g3-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -398,6 +428,26 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g3-usdhc",
>  				     "nxp,s32g2-usdhc";
> --
> 2.45.2
>

