Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20073C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll2xdQD/yGv+/rUTk2ZcTVQklJ0EPp56qcNuTper22c=; b=WCzC2cV0UMxCheI1PZvBDGIXOQ
	6wR9JIBxOYIwHE9IMMIb6/juYz/DYUwRwj0tMTzHbJs72eTw0CLM4H1H1Mv6L8UOyl7qDb55MPhy0
	iZr0SRZ73/A4rN5Dcrrc5q4CGnNYZFCxY87Kd99Ry3t87oIeT2CMO2TGAEZXc+g5TGh4ngnYmgOtI
	sjBD6yIC//neDkZuHQ3ufOQ3ymQOyROthWuJ+WOMH9eW3GWf6+m66feGrS7i4b3wEDlXNrGV+tbU7
	MxetLp0F+2zSbcBCSTsJ8I0FsYNvWPE/fjckJpCARzYkT799mY7mqu5f6gcbLjvB7aRwS6SVT1mpL
	hDrAE8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYYB-00000003jzH-0tTJ;
	Mon, 09 Jun 2025 09:12:15 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYON-00000003ioI-0X2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 09:02:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx5HhSNlLDMOY2/mSzaHwEkp0G1tmuyJuOb9tR2EL7w38Q/baOlnSEKRoH7te+pdOwwaFuzNaZuAgXjCH7sVMjsap1ZYfcuN+uSdmgSLs7YwQ+/n/Qb0pVBA6ZsKqPXLaJFzUSRay6g8WwIA96DJ+QC2AQxdCbQR7A5aXsY0yA3fmbfkKaDGRRHBBLmuP4dKUht1uGc9iEomaZ336GZjWiBkz5Ckoj6oHlM/zbi63WNnVbr8QSmlZNP3UsdN+M1rmlzK4A+rdWNCFjPlFll5vzSnCQRK7hmERMtvXumV3pma3fhVFFSiDNcJ6Ua9O/iSW8uK2uiejdVIv6hkGqvQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll2xdQD/yGv+/rUTk2ZcTVQklJ0EPp56qcNuTper22c=;
 b=xEtwZmYpAo/ZetpuOD1uDLc2p8YA0IEx2yuqg8g1WfysjE6+PP92RApen7NLrLztjmK5vHbwkl3o5UIlM9myhD7BeKkf4L+uGcVpFaL5br9QMAIaoNBohY/gwmdkC75dwQXbeQ5h7h6XBsHvCG6a3zpVlHVSKSu9R2BFCHCLDjwZb3YGZBsxCLMo5Z1D0jfhM+nAehij7/o4gAylb4TzXh5rBWBB27yZMvpwHRRsB1Ktnoc9r8lPgkop7MZsz3UD5vyA0xN09HnO2rFh/R+daIURbRr5J3N9gVBnWmpnPXAbyWH3SwWOnj7kfLGVBJoRkinaL9SrOXprUt89oRMdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll2xdQD/yGv+/rUTk2ZcTVQklJ0EPp56qcNuTper22c=;
 b=wiTJnB6b7ljWP78x7vckZMQqaVFuHDPf9tVKa2mTv7KBOK7RdDXZ/9uSq0Xxu6kxfB4yZwpwFWrRf1RRjolMvrLDEPe/FDJxqjckpDc4rDBbxqnpJqFmzw5/fAaZpnluB4AZzv+MYeYb/LWzhUB7JEdYxOYwYv6zZuVVt5ZoYcgQLa1+cT9JzdmHR9NXcriSXl+qn1p6vFkyGj1ffky+4gZ13y40Fan5Sc+t1wG/Js4ADWLIi0yKuETFbIIa9PnAStn5A78AWvRr4tNtiAa/nv4PDeQ4s2GV57yMgZXFCvcvzhVt/01g65/wsqRCjdsySJbOIR4Qsn+xlL6TtGwqvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 09:02:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:02:02 +0000
Date: Mon, 9 Jun 2025 18:12:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: imx93-11x11-evk: disable all realtek
 ethernet phy CLKOUT
Message-ID: <20250609101209.GM13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
 <20250605205853.1334131-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-4-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 5590f613-367b-4d1c-a7c2-08dda7344ce7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wt45yKHYL3/rvXSV1AOm0P/HdEzqxhwY5pK1ALgTU2Rx0VqDkVXwzo53b5Ze?=
 =?us-ascii?Q?xNpi/hY1mHEEwbl4TGR70NjZF5ijGOknBD5hnwF9PL9JXDizD58T9cYJgvkm?=
 =?us-ascii?Q?/XLvaF9gFNxD95TP/YyKXOIre+KuWjAucjBTEgOnLz9FZZ5lK5RTsoM91xla?=
 =?us-ascii?Q?J6T7TT4Od9ApcOFogkQfcHdKuvHXea1z8IyU5EKL0fxZC1aTt69wVluV+E4+?=
 =?us-ascii?Q?rLHHT9972SXiW0BUY/KuDgyu0fWUA5lwEywfUdt6zcqDh/l+KVqyVh5Sz4LD?=
 =?us-ascii?Q?+u4GDhz+KjCBjSpH3BdBV/h/Vok8/MO/GESa4geyB38Gn+UxF7AEEseeAGKq?=
 =?us-ascii?Q?JuIkrcVJQ2vrZ2tH4Dch/BgTIe4sw8V9mh44F8CsMxhcs9/Y4XuObMxUCiNj?=
 =?us-ascii?Q?MLlAXHsk36Ew2f3+BOH/B87d6ru0l9iBmyU4n8b8LKEA+lfmtSfGXXX0kiBl?=
 =?us-ascii?Q?/TjKyV0OqTT88C0YS1zGemTu/G926e+rSyBYBiFLnX0u38dGVq+ohiPFIhMe?=
 =?us-ascii?Q?1Wcqn0mls6yxX4M+2Ml8EKwBC5CzX4Ela9fE3+3NQDroSJAKj9wZYMmXfvLS?=
 =?us-ascii?Q?DkWLgCHbMcw9IySlE/GoMxAd1F8uvV2aM44SebDB2xB4scg2j2OqSi7PB/Ek?=
 =?us-ascii?Q?miUUAuJWEZWbY+nGHMhuaP8MTjhdANcYveXcvam8XXncK1OF01ZXmR4T/rd7?=
 =?us-ascii?Q?PYHN4v2911hEDgYQGo6T/yu8rXtUFp1rVl08wPsy+aVUjnxRjcOfiKbaD4yG?=
 =?us-ascii?Q?4zDtRw7fmyDsEDXENPJLZk8/Rx/+Va5RA9zd0J+GTgqUhI4x46Jq72uBN9pd?=
 =?us-ascii?Q?aALa7IWxp3PR7rHIFSgPzyuD6VIIxdbGx9IAKrsgWEIyZT1LvKqW9yikjSu7?=
 =?us-ascii?Q?KOo90aY0HtfYcCNUEC53QNYU8li40aQzAkp+SotXgz06JhsFF0Axn6YE53mN?=
 =?us-ascii?Q?wb3HILpLyRKKA1Cr4M5zG1szLNQdv/1u20JlCiUUYXmC9EcdTBZVQUMthaEB?=
 =?us-ascii?Q?C+gRsuDxSZjIuYK3K1UVFV5D/R5X/R62HvoK2t4x1YoskidRwEWiss/dc3w5?=
 =?us-ascii?Q?a+XPDgT3h71rfieem+xcBUJlOGVK9yNMgbN57hg3Exg/comed+EbHT63Mjjk?=
 =?us-ascii?Q?cKUqbGjvp5XjZMR67KkWVOYtRK1/cQY3jH8+PLwSq5Lv+9i89lko302IntqJ?=
 =?us-ascii?Q?4Sy/y/3/u9SjS90CWUCiMVyVBZJcFzTayDCNA2Lf3foVN+X3FokB3pwWxevw?=
 =?us-ascii?Q?HMYG6FW+KMcCzW2U+jK4h2LSySvO5fMi3kglcqxvScmAiSlZHl8YmaUr3qt7?=
 =?us-ascii?Q?bnQKR0qveGClYyUe6PZNP6ErvVP+MdLk/QM6wf67cgQz4fUFyX/D4IkJYP0f?=
 =?us-ascii?Q?8NJJY+acBEs51jkZf5jFHQngv1Xy7W9wLyI2BrmOTSLRRrgiarMgGpOu7594?=
 =?us-ascii?Q?tfiR6g9WLv7As4srjNKiJgFCZr/Z5dGWfXprenhAFx6bqG0LhFT9fQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FoklqdyM1TDrfLiHRTfz93ROOaPqLcDPEwfwZZqqpqiS/JjXcQZxcOgGjiai?=
 =?us-ascii?Q?s9dbvRDYoZjDUjjldggCxg6r4GN10EUL13Gg9l0TAN+8TL3WhmZD5ieFEWYm?=
 =?us-ascii?Q?vVqupxe5zdkPLGRgMUxB5mWsv/GWiPun81iQVzVq9YSYUeNbUuyF+2LB6f4e?=
 =?us-ascii?Q?LT2fvYBXMtRTC80s2GrO8mTspdAXNup56pGu4mqWWsFdeCqAPAK4a3JYYIdF?=
 =?us-ascii?Q?fsqz+x0oklHGPhry9eigSdMczjbpWGyN8TeVRs0BGogihK3vUPYTvzuO2wbA?=
 =?us-ascii?Q?KM8l/kAJACxIiq0CoZdrBHGB+xY4klKtg3GGODAf4B1dUG62IR94gLLEyF2T?=
 =?us-ascii?Q?aCw9SYHdQ6QDiPUU29KfW4UE3tmNWCJffewXfo79CLeGaRx+xHpCystjWHPv?=
 =?us-ascii?Q?E/Wk299ef0SBYb6O5NvW8g1p/jx24RT3jl3MjvkAsczmHxpq5ndiohHAI5Qh?=
 =?us-ascii?Q?50tMGlK0wnu4KnPzm8UIjnnL6jIQwkn4vSw3JyrUpBX/eJJmOoG+fjoBVd9F?=
 =?us-ascii?Q?G+cixITtKkjPg2td6oSfkIz79S1UT5bm5Ud1eM+Blui+LvpKM+IXnmKM+5Jr?=
 =?us-ascii?Q?QYWn7Kx/n6x6cGdBixhAor0433MmiNnUd77G0yAiUp0J5SbCN5q14ntQjH7/?=
 =?us-ascii?Q?tsHKoYOLDEUlq/EiRXy9GFo812Zy+eGk5EVmlwU16tb4bepuAHcEriIDGRPx?=
 =?us-ascii?Q?KCOw3Wl8puy7gLuMbULJXAWHCqLtPdAt2K/gDptnbtYkn3FCLiuGVIJWeWUT?=
 =?us-ascii?Q?NnlAGxQgl3YwkMEddj07iqY2ACIdqfZVJbCWdFFh8cwBULcIcKVtXPh4o/24?=
 =?us-ascii?Q?ZLELlAx2iyANmoCS2Jo25HR9x8G/04MsdbY1Wzp78i2hk7EyWsdCStuAK8yA?=
 =?us-ascii?Q?O9mCg3MTCyiKVeFNsYYMq3Z+Irk2hKY2wEKByHToseMMIMwf5ifdfJxtzZft?=
 =?us-ascii?Q?lCvsigZmTfEv5q57CvRwkQMUX9RUFoh9Z5VkFEHM4Oh4v7K6bmqjl7iDPyMw?=
 =?us-ascii?Q?rGvrCuvXQvEq/4aKCNObU+MF28feKeP6Thy2YEY15ZPdYYqFLXUwHK2reKF/?=
 =?us-ascii?Q?P9v/3JKVLXBoQO0fjzvw5XfDx+iGOCTgnA2OFQ/T/JhGYbk3/NypHuJ/rgKo?=
 =?us-ascii?Q?Vx2FXzLTfshY3h9WIWYT6BDsjmK7nzox4PUTHDIjHxJMxll+qlrDKKdaI6no?=
 =?us-ascii?Q?JEAuDXdVdfRY7LufGuQACgVA1Z403ZbjeHsBhDv1ymoDtODvtUU7eXqxT28J?=
 =?us-ascii?Q?Z8aDcta3jlb0L4EtGP+JintGBlIGOi2G4Tt0IX7yt69rjbFVgQWh3T1Ikf0q?=
 =?us-ascii?Q?ZUyEEZRcgCnme2C0DygEL4Pssq8p+YQXBqK7jxEvRbUyYXUfkcT7rsbXOVc8?=
 =?us-ascii?Q?W2DeDW3Y6dW3zZNCcaLPqu7SAhQ1omWvJM960tHarXzJnKCxmewYYrLlFo70?=
 =?us-ascii?Q?Nhfe76BDjwR20Rsm2t981YPP4M0psz37WufqLMNzghx8iRKLXUTfTymyHmuJ?=
 =?us-ascii?Q?QrebWcqCsd67gH7AKvaJ7MAaw8R13+/3yHFaotjglLjrdkTujdCLbuYjjrTy?=
 =?us-ascii?Q?GxjNlyLE2HCnJ4K8E3murrYgLa/SnSrnlpgorxk8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5590f613-367b-4d1c-a7c2-08dda7344ce7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:02:02.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gbxRzH+pLn7aahSDvjEwtU0TnZgHASnOwxIy5VQQusg792WvHroHOSJ3RJCRiOnbBCHXKfBkihtxaozLMaReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_020207_165194_70E68373 
X-CRM114-Status: UNSURE (   6.26  )
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

On Thu, Jun 05, 2025 at 04:58:51PM -0400, Frank Li wrote:
>From: Clark Wang <xiaoning.wang@nxp.com>
>
>The realtek phy CLKOUT signal is not used. Disable it to save power.
>
>Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

