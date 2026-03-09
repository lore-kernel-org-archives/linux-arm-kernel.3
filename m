Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C580FF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzT2Irw4xmETMgciZLTboVv1+5OtHL/vSOhEYpCuZU0=; b=ZJGBsI6ic5A/leqckGzePJre8y
	uahV7xPw+ULKjtrvQAPyGwdNZw6ypCt4higjPOQ0rAEQ5stFtStNac2wtW3rJ4ZbZzVxdsGS6urO8
	APIAxwC8O9b0BNPGUCD1jA/jEMof/eX4yYrCrIvPqSmR+c6FLOLChlJwfHert96bECtw8FFRhd0Kb
	Rbt33YUpKyvrhSXZYd9n30OC3sAOOt9SdM6prI9W7oBsYBS2EXdleDkQHJ12W5LjqcA2AEnUMcGrt
	BNmtbMGtWKe3XR00SMhEVcdMb6MiZqIK1kfke0AQslYvcTROmkGZVCM/tCW246OPwbX/RBFk7kP3B
	2I6xfKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdHT-00000007g8P-2OL0;
	Mon, 09 Mar 2026 16:16:31 +0000
Received: from mail-westeuropeazon11013028.outbound.protection.outlook.com ([52.101.72.28] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdHR-00000007g7t-1dom
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8inV/pZyNi3Ezo2/h9AtmaUGdmLN7cJeUitC0QNybjaVGDCY8l/fmvNZESD1ijgZM0byo8fNTX5iLFA365G3Pp2EdLT1Xsipun2xuPCyTxeWYiufrkitcRl9NYgVCGtxMZrp9m/2TuE3bRAz2RaG9c/3q/UmkiLf7HYeI1coMcfyiKbH572IOgXwtGmKQEE4AaMWmPjzDa4EzEWY9TJC8Fm8+Gy1LGEgVpWv9s/UdfGBwJF32TCVoKGb+kjrmSSn9hX1+UimmxLoQj6qbZ56THy/rDMDriMXCBaq+GMdC4HjMPCeZzrs9KfmO/jh/7G+976bQ8WWaCxtAH9HWKKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzT2Irw4xmETMgciZLTboVv1+5OtHL/vSOhEYpCuZU0=;
 b=JnaIM8+HDdyXusD5d1odZNBNOk72slPgjg93kAZFcIp6kx3C14XDLYh12ete/svTRR+rXPUXJA2Xez/fXqXhw2jESH5X9353Pw1jpY70pv2lyWvYh0FBchOOki3PSF1rglpjIF8nmaufqV2hCvSlXQ0Tq5HRoo0E7gDnj0KiqpGIW/lK7LwmKdFNltSb1+xK502mQtJcwGB7I2p44co0telk8JfvW1bKGKjs1FDlJsT6jLEMggQ4Y30mgcvKc1qXkUHbmmDuvOE/79BDwS0zAdPgncUlk3Zxx2UiF9ITdPzxasjZVwfGj4ncEvxNI+DRo69/kZXNRWY/2V+c7UFqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzT2Irw4xmETMgciZLTboVv1+5OtHL/vSOhEYpCuZU0=;
 b=hi9eLhvMx1Aj7zXdAfBYr5jLeftvWC9e5QPYsQsaXmx6pjgFjwFxPlmX0paj9yIShqP5GTbRUVu2w3NmbDTJn82BnAWPl25BOt/w4HhXxcfxPX0Jbww6OnHJ/CmF0RYDq5nmQpwfiHCaRHI+BE9IxMXYgKMoD9VYND1XqTT5Q0qVTpOCgW5vy7gfC1DnXbpVYicix0Lj+sUR82h32e+CsWxY86M9HBRVQ57Ts77MOwcIdjjz8lne4ggxU4hQfpsfItiwbvT731SwHHU9QTo3v3IaTK1TEuaw9ozvBHHkoea0kBB4xLn51R29OYjcpVkA/AykmPQfbgNbSoAqU5muHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 16:16:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 16:16:24 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] ARM: dts: Add CPU clock and OPP table for i.MX7ULP
Date: Mon,  9 Mar 2026 12:16:03 -0400
Message-ID: <177307292952.1708959.10248082000363537313.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
References: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 849c4e65-421c-4577-8261-08de7df7354a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: Dgi+K6tl4WnLRg+/whd+neznutiN9Zeah/TDx3TaSV8kLLYUJtp3I6XAst/o/5HVHwf9+yT7xuCuIlO6iXxot+2JzKOX7hzFpy5jCb0UFrxwV7+Ur7SUwAr8NIWr9t3LAKEWgdmbPL0LPLkVdqs/BH/syz1GoX2hEuNu9r0aIsqQ6Q4npUtF5VGOg+EzHQO39pHGo6NKiyp+hqFok5lLINTdJ8rdcdyCjZvTzY/9/RLHL2aC8iW7JpU6ARytgy++ZiVbMHzlTtw+yey6S32PgeYvVMcy1F0CjRu/y4wtuVk5odhMo1CRk08qLnUHCP7nX1WeAwDlSCwOl8m/qRSazVjYX9sRXqn59Zv4JHPxPp4gWozQ/wleQ1UPgkc28WyVpD82hrboQGbW8eE7I0YGtZmsFMVULuyjqQjGvk3zNIeX1u5y4EKiJqsZsAxjVUWtRGvsKdhrFLhgkfp8bvcda7uV4/x6H4pXj/kZW3wIac//Jig5+Icy5GGTnQnSnh8Yr1omOqNil55pyzisQ5lLRvV3UYlXRlx/sFmfgwP44+cJ41ZoFPDdvNC3atCWUH1z4s+oQBxl+YCYxmFt/CyZfLoxHqwFdiuOdvnuXefAe/PChbw94M6T6ek9IfWfM+XYFqsdSxrQMmntc1meTEbnL7jNbpMXRQEuPDhEj/imrJt1iEKmau9QRnfzUd4pmd0CiQ76KIYKN0vkc8GBBsN/OgF9MoEf4bW3IDZzT9sTm13RYpDuPjfOENxla5MCHTtUKFY1Roh8mrX+rODhtgaItB9z7GMrMvB/XqFOTBT4y2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aktKbzEyNnJKOWhtSG9sNEZ1NFZXK1BuZWFoUnZ3a1VFNzluLzhVWkFrVFht?=
 =?utf-8?B?eVp4eTJERkJ5SzNoZlpSVWZJVU5Xa2loa2pmUHBMdWxGbWU5OFJEc0VUL2xW?=
 =?utf-8?B?RlB5ckJId28xTXFwWE83elh1Y3VOR1FBZEhZMGdmdW5vWkRDN3B2SFp4YmZH?=
 =?utf-8?B?aGpjRlp0RFdzZUZmWUtRaU5pd0VOTUxOV0dVUFdtSUJSRjkvalVuT0FwdDh2?=
 =?utf-8?B?dGZYMWhSeHZ3S1QyVkpMakdUSDBWOHEvYXdHQ1pZLy8zYzc0ZWNRNVRGdUd0?=
 =?utf-8?B?QnIrdU00cklLclhZL1ZtS1Bmai9tM2p1TXJwZlhseU1ybVRacFZzeStaU0o5?=
 =?utf-8?B?SnNpaWYrZDM3WitiWUg5eDlHWmw2UjByb1dBcXlhbXY4WWt5ekpmaDJ6S29W?=
 =?utf-8?B?bVArOFIxSnBJSEtWdk5yY1ZjYXVFbFkwMVQ4ZStRYnZSZWxES000S2doZHNi?=
 =?utf-8?B?cmJGa2JQQ1o1MEliSmJMMXFacW55OURubE1PMzVqNU8wZUVJeHdhck9ZSitn?=
 =?utf-8?B?NlowTWN3VnNFSFRSekY1MFRRcGRNdFdtMVUrRVVXbnNHeTMxbkxzTDErVXk1?=
 =?utf-8?B?MDNjZUJyVUlPbHorV3BOMjYwa1JCclZHRkJibEc2S1ZSaHhOeVYvZzhIajhn?=
 =?utf-8?B?QU1UbW92N3BjMjlVNWVOOHg2em9PcVBBWWloc21tUFRSd2hiR1JOU3RQVUEy?=
 =?utf-8?B?bVNpRlJHTm1lZ1ZwUTNzYi93MWJ3ak43ajR1YldHTUJ2Q3NWbmUvZnpOQXZz?=
 =?utf-8?B?bUFPNVNuZ1JQanZCbzlGV283MnZVaGdnKzZjTUZHRWZkd0Q5OTBWbEppUjRn?=
 =?utf-8?B?WEFkNmkwTmlGNjJkVGs3N0ZsWHk0dUUrbE15Q1UvVEhYZVRxUnBHenlwS0Nr?=
 =?utf-8?B?ZlZjU2QxdjlYOUhYeFpvY2RFVHZEVW1US1ZRWUNSa2NML0s0MHVCeGhyMlJE?=
 =?utf-8?B?aXZiVjdVVThRRjNrYW1ielBsUkEyYlpZNVpPdERxb3ZSVUpDS3pFVisyeERT?=
 =?utf-8?B?MnlaWHpITEkvVnp5WDY4SjNkYkxFNDY5aUJvVDdmaXBjd1M0YnZnK3poVm5R?=
 =?utf-8?B?MFRSVGhoT1R1djZjcjdoSTJMVksxY2JyTkx4UUlLL2VrdzdTeGFRTjQ4VjVu?=
 =?utf-8?B?OFhCdDhHdjZ0dmp0RExrVUEzTjlIVXY2TCtvSHBxWlUvZzdlYjBMb0tiR2M1?=
 =?utf-8?B?T0Q1M08wMks0bXpEMXhRcjNNVFZFVFBOeTV0VThCNWYzaE5lTTJzYVFxcGM0?=
 =?utf-8?B?MUxPZERLUnRiazhsOWVPZWZWc3M0b3RxZS92TlFhZjFZbDlkMnIwVXRraW5p?=
 =?utf-8?B?bnR4V0U0eGJoMHZpb0YraXRpU1lCbXZsNERKbVBzeTh5Ry9zRm0wY2xoZ0VN?=
 =?utf-8?B?NUZlM1NQY1gwOTk3VS9BS1NFTmhxYnc2RnY1am5hOW56MmgrRVZKVnBDRzBI?=
 =?utf-8?B?NXN4MWhuaFJhSXRpQnJkYUcrNHAzcnJ4RlkvTXc0cCt6RG9wajNTR3RROWJl?=
 =?utf-8?B?VjlpTnVkN3I2THpHMlh4MmFLcGswb2F5dXNXVDRGbkt2eTZQL0VlbzJKbjky?=
 =?utf-8?B?bEJ2N3E0U0lzRVV4bDhydDBnMzRzZnRvL0k5ZDlYOFFlMzRFVWYrTmwzeFc4?=
 =?utf-8?B?ZzZkK0hGQ3dxQ0I5SjFVL2lGc2xsV2tEQ3F2RFRkUXVTbHdaVElGMjN4MkVr?=
 =?utf-8?B?RG5ENVltQ2hBOEZNRFJRbVhxd1RzVlFCL1prN3RzUnZ0NHEyOXVyRU9iUnBp?=
 =?utf-8?B?ZGhORlI1cHlkUEhHa3NKN1c1ekF0RmhsN0NLZDVXUU43a2N3SHdoUm82RzVL?=
 =?utf-8?B?MnJQVGU0UjFneWpsTVB4MDZLdXNwR3U1WEpadUVFdXh3S0N6WnhLdEw0bEI2?=
 =?utf-8?B?aE5IUU1RMm1ZVG5SMVdmZno1NzRlNm5ub0s0K3F2bG1QM0piVzltTUt0WXRM?=
 =?utf-8?B?VEpHZU43ZitYaXBhQXJmdkJ2QXJxRldLeDArWnpDcGxHOWNCcmFFdkpZdjZy?=
 =?utf-8?B?OC9ZUEFVMmkyR2JwRjJBV1UycTAwL1A5UUtvS3VyUzJHaWRoUGtuVWE4ZG1M?=
 =?utf-8?B?cGxLQkdiMHVMQnNFZXZLTzNGMkpLdFhwK1BPKzl4V25NQlNaSk0zTHdObXVP?=
 =?utf-8?B?MWlXYUJiV2ZTd2g2SzAyWk9xcE5BQ0ExWGVjZC9lci9BZVg2aEJldTV6Rys0?=
 =?utf-8?B?b0UxN0NQbEVDT29pWjFCZnJJVkhGV0h0RWpUbXc3QWpJdjJhYkowakNXNGdi?=
 =?utf-8?B?Uk9KTU1WbnFZMUgxQ0dTOU91cXJJV1BQMnhhOHd4QldsZlduRm5mbjNUS24x?=
 =?utf-8?B?UjF5dkpsaFpxditJZWk4UTJJN3RuK2NzZjRNUU1LaTloMzlEbzNuZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849c4e65-421c-4577-8261-08de7df7354a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:16:24.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vimcLxXcaXjBnPX9KN0da3IRZCemiE4X2IGOqeyxa7cZb2BAfZXLDn79TkUdYFM0WYIuMfpViV7PHkwlBPgsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_091629_434951_D7CEAE57 
X-CRM114-Status: GOOD (  11.23  )
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


On Mon, 02 Mar 2026 23:07:40 +0800, Peng Fan (OSS) wrote:
> Patch 1 is a binding update to add missing #clock-cells, otherwise
> there is CHECK_DTBS warning.
> clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> And the clock will be used for cpufreq as done in patch 2.
> 
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: imx7ulp: Add CPU clock and OPP table support
      commit: 2314ecf275ae371638e1f35a346823d0b45de6eb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

