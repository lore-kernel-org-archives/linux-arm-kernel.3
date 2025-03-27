Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF62C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsNLuGW4b8uCQAuepyeyJXCzLHESc1yaWLPqaROWUkk=; b=jdBfwRZt7gX0cueE0+NZug80eK
	/wcsAxrwWcLiac5NDFjh4/ktsuMAFDs7eUn3f256Gp41OhHz5JByid2dIbgOrWq8LqSM4sGkT/ixE
	NG3Z2GNYG7t/hv5XrhT11mZHo94wNShd06aNgbfyW1hV2Kgsg2XrXRgqdmX54ldpq3LSkzGdnbdvo
	NKNEbbd76AulrQDLEj9OXA1+77D4BahXmaOPTmez749Hgkf1ujQ2bVsTqm4F7UzuZGowmTQ8I7ezK
	LRwrrkW5K0umxV5BM4YMosnUHjEgol4ne3/YwzTDGxScMSMUaRRa/TL7OJwgqXMp1jmA/9WpB6SZ5
	7n/YmaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoo7-0000000BJOZ-0SuH;
	Thu, 27 Mar 2025 15:06:11 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txof8-0000000BHIL-1CCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/oCKfyDey3UE8sYv/6nVj/I1ex2r/87l9SR6NNuSOPiXmCI1OEVN4SenE78o2NaqSvgNIIbFhM3bxVUSsjC3ejwl6ZZaTECM4lPkCMLajf+ZOQBB6fUok7TuiJu+JlECxlBK6jsS3iVb5tFoVkU55tRieKU94i+Y/pPNgJ7u5rIPAQy1RhR27xagFuuO6zmqCg8W+gY/6k26GrNjV7ZLAxR5lncq+gsosojR3KwioJF3ETynmR4wiWCYV22ngwvNrX5FJ5lFdRyTcYkx3wwLY5wy7Vi53Uz192p+xH3TapeqfsOm//eT9bwNXrzdQHk4W1erT45cPG6AnvfzovrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsNLuGW4b8uCQAuepyeyJXCzLHESc1yaWLPqaROWUkk=;
 b=fLpHsznuQB8xw2HzbUKSa3WTrW2/BneL+2H7R4o9laAIvrEZS6BKJrt4jp0Dmrcx5RSTQuXuPzyPlofQIZRQssLEL7/XhmJb89pbBn8IuG8oh7qZgqZAUnj+zVzx6TcbmtYyfhVBmR+gRvVA5UnyzGTFWF9Fv9IcM42QOu7C5qlxndouX9N5YqWthjiTAEZynOEPkGjrJXRS8NUYweQ8D8SqOxkPtwG4ba15FYlGYCxhtr7AlBm5d0LQX1bBvvfDQrwExMbYEl1fnhoCU4CIWvR3fRxcYI4H5Wk5hBQZDb2leYJKRNww5x6CAjHb1KcApn2m94Gs2W3jjQdPKTLcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsNLuGW4b8uCQAuepyeyJXCzLHESc1yaWLPqaROWUkk=;
 b=RcPOETxlKXyRm6pzTh/+peeNHsCLBDOo0J8RSjMiOCZQNnukfO8QgMcmKHqeVYbRNIODBUPtz1y/4HHLU/ZR8Rz84JU8GMseC9/W+B1vS52bEIKCKEEx5sOrhztJejsQLxTz1+D0aIyTpMPEozT6lVGncHamvcgYjM6euK2k/BB4CJvGvoyedmdtAzwWiWXGzLZrbKuS3hz7f5Vqpo15uTxXwN+Aovt+W83E5eqj02T3ylo2U73oYQfkI+krD/o2TaRPXFYqZKUuqxFPdoU9dbRhOs/QQPU7N9XlewvXCQHjnPqokaW2OPUYxSuyWlmkHYBblsYNTnRWJ6pYHZFHlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11133.eurprd04.prod.outlook.com (2603:10a6:10:5c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:56:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:56:48 +0000
Date: Thu, 27 Mar 2025 10:56:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for
 spi-nor
Message-ID: <Z+VnKhbXj0SB1L+i@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:510:325::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba2a3eb-1bc5-40ce-6d94-08dd6d3f99b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2lXlBois2MrAEEm8wY2JmxB6iKgI3HkX/wNzvNgAQRkO3eB6+P5YvQQlObKm?=
 =?us-ascii?Q?Ms8o/Lx21Z/HStD+U428r4x8BqJtEGwzBtMw8o/1Mk3q+JX6xto7M7y7zrWZ?=
 =?us-ascii?Q?9R20zDcnbf4W8wvBcxyiNpLHVh9uks5gpSPO+Wv/xa/h60JqmCuva6Xbop/W?=
 =?us-ascii?Q?rTxVTXW9QFnZr+Gk7fzZSahYVbAOtwYIOggRZQHWxm7+9Iagb5P0ZZehI1ST?=
 =?us-ascii?Q?cm4EYPyIeqIAWxGqgHLK87Y5t+oSE8gBo2wOa4PtWU48tvxVp5ee5PQgubTo?=
 =?us-ascii?Q?i2ZoxZ7EQDyTjqQq2ja9tnvo8mTWMNcTx/Ao/YSVyBhgQ1jwPZAqvAP2geQq?=
 =?us-ascii?Q?N/DJT6OIBY/Y3LvCzDAHuJsmVdEhf8VsgrMk/uxumxhMLt7V4IhyXM1U5XPN?=
 =?us-ascii?Q?ktHFCzaOzOUjsBBCRbyox8RiM89z4YbNrwAD4H8UG+Af6Wq9GU7xw37CNe8m?=
 =?us-ascii?Q?tBEesVyn7Uy0sQUzY01lYYtk3U7Ho1UICk3qTPn/14MUxu5gsOHjj8doezs1?=
 =?us-ascii?Q?pwbdoVh5Ge4VLFpLvyCHNjh/tYjLkPtTHoOKUguJl7xdvIQcX+GKGlJTMNkl?=
 =?us-ascii?Q?PHVduKarV4poiZosPLBSCgZo+ROzpikIEgSp0lVMTuU3OSaKLVWQomZQSRPS?=
 =?us-ascii?Q?n8E2Wdg5txiFXkohwAtSHU3wHrroiFHW2iClrLs6rm6MYhVmThXsy2NpDacx?=
 =?us-ascii?Q?cVpTJEmQyJ3yiFVkWw4bF9dcktjlearPWdQQXJK6VLCxWMPYDaOAzeKAui9C?=
 =?us-ascii?Q?e50QZPmIJNhgbK2G8zV81uvDYHAp8PTHfit22LM/s24w53UvmvH8RVl9JSvj?=
 =?us-ascii?Q?rUKMPnnIIw8wC8RZBQtOP5nTNVqWq4ajrDO8YF0Nf5t8QXhllLk2NT2hxc34?=
 =?us-ascii?Q?geR1VmgZ6KE6uLcK0l3udDEvu1HGUlweuKHeHwnvez8GNP/mJDPKT0m8A4ME?=
 =?us-ascii?Q?/Z8eGtU82QNYr+2vL6cEBGC3GOcRaV947+kpAzHTdV/VXTbW0nFM013mAksJ?=
 =?us-ascii?Q?M2QgdGQ3XQ+In3Kp1Cjjg7AA8WkkQpavgVs1su+VKDfPe1C98cEq4+IwZu1b?=
 =?us-ascii?Q?DXeyD+Y2bEslAX3FYDb6m1dQ4ysj1q/ebemHzqKryn/srlZ/+Y6SCiO9pO3O?=
 =?us-ascii?Q?tyr4hysoM/BPuCb8wSRM8nmpKeevhjoeTGasw4iLZFCXamFqE9VsoB5BARZB?=
 =?us-ascii?Q?4vE44gZSs0wsQcx41iaVTql8B517m/n3rGtffYa3efK+GYjuZUrKslK/pIis?=
 =?us-ascii?Q?Y9eC/2dg4vsgl16wlGE2worCF8bFg0CdyD8qIfC1zC50BOlDB2gp0Mkzi2SX?=
 =?us-ascii?Q?0AZpUvLd8XJNPlTmS/AKDLhXYPn1xd94UGN+Wp95YhoJvUxEJO2ZGfj3jlb6?=
 =?us-ascii?Q?QVgFf+uZa5SDv2UFh+lrEtvL35d3zOYwQ/2aCplX31fkSbNYX+Bng2ShIe5/?=
 =?us-ascii?Q?vk3rZpiTe08iLkTuIHTiiF1Tov/4affqj8ugmdIG31Eh4edekDvlHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTBZfpr0BqZ4teqkrgN4e3rEXuUusrHqdf8iKBb/CrZm/Rfh4+Vuo/ki4ZNv?=
 =?us-ascii?Q?kg2O9QC8Bdis/SoE02ysU16vhfo+1PBZAjN6ZSD7yFjrU0jwE9IIJjQOkLgI?=
 =?us-ascii?Q?L+BBm6yHU+deTKhpUNhHhIgPgqogra49ownOwQy5ctZDQDXZ7CaFGn2QKzDL?=
 =?us-ascii?Q?nyMmwa4ARcp6H7h3FUIx6rXQEU0NsiwK2gKi9i4s6ECJrx20dPyZ6YHuGX5r?=
 =?us-ascii?Q?/TP4qyzCjbE1kRZf8In5t+Xj5cU1aRk06kXmcS/vGYwDnq6j0XAhELkQ/lPs?=
 =?us-ascii?Q?FCpVfx6G8pzOP+tAMGFQQjjh45qaIIe4FmIeU/4E+xGoZdEu3Ifnft94Y1yd?=
 =?us-ascii?Q?s+6canCvTojuz/3rZ10zAqLWRUOIQP8+7R2TbDHyFwbWvqfwk4hEqJjEuwvz?=
 =?us-ascii?Q?2cDF0J22dgEwXim/0zaLHMF1C2WdSmv7SgH8JcGex8nATR0y4BWmOatYLG46?=
 =?us-ascii?Q?QFIuEu8Q6wvIhgxnJ0cgdy7WaEPJXlZt55syTT8/l2/qGTyk49iDwGia8z2C?=
 =?us-ascii?Q?uGJOk5a/RApwk/qEbZfxY7C4CSayhxbOoIgUJUeuHtpTiCXmpxzqCBdTuO2l?=
 =?us-ascii?Q?tg15oB5UzCgb6zO7MIqZmoP7sVEY6oHXY34dfzd+M5OMxYWnCopiHWD4GiK5?=
 =?us-ascii?Q?AjriHdpFkPxrXvribhQ/k4wTf+ILwSpHchrcpIeodiu+vurmz3wnAQdu1nTM?=
 =?us-ascii?Q?S62uiCc++3NVOImA5xP+b5UGrZ28xj6rq3iIvNGlo4LTlgsJeRBg19Uk0oco?=
 =?us-ascii?Q?502g5T2/nNU3TMaDOhdOqmDHTvHMP2/Xq1FGfsArkGXHDCtZpb6Y3ganHGqb?=
 =?us-ascii?Q?G2RIhfWdXPrWlpPpfFbmIYnSRqf6XuS2WUjP6hL32NxDStV4vX3jGW0Be6zZ?=
 =?us-ascii?Q?leiUq4d23mb3UgD7U+U9NV8JNGi89LgBol9DMZ3Z5c5FyUU74RCEnLrksZiC?=
 =?us-ascii?Q?6dmL7ubpV507NCOM4C6uOplvtOihyeaLCgfTtcVEWU6JhnTQOxlD8ZxbtY9m?=
 =?us-ascii?Q?jo9Qr6q4aDHABWqmEIgpPdt4L7sMzrkocCN3AmLbw36yqsYgBQa45kQ+lNl4?=
 =?us-ascii?Q?KBmMLGbYnUTew3iQBFPOc17zD40MP3f6QT0wU8R5fdgiqtpeuGTvZNY63wgx?=
 =?us-ascii?Q?9hoDPNW1Ifkb+90/eYvX9ZGfTZiYWt1njvkjsb1dPnveBxZ8rvgS5I7ZeVrk?=
 =?us-ascii?Q?cKrh0Gp9bqFRrz0IteJahXqktgX2EidA9xwQp6/cBQBS/+ITPLOybOS8IddT?=
 =?us-ascii?Q?Qj8BfRcDiGqHBDXcmsLY30XbwZXVa1E5ZhqpJ7Rw1FVKy1UfxXkpVxLMw29D?=
 =?us-ascii?Q?IxKyPJRSt0rZTBMzWcP6uk/kstn6HRK9Fvm/lswmBng6Q/SHYIHJacA7nUei?=
 =?us-ascii?Q?TjBk+9ppj/ynqU1lFvVvZ2OkIvbQU2YbAIBON9mFVGNJxi/XKW79rHlgxVQK?=
 =?us-ascii?Q?tuHFB5fkHbUAZ4AvZ5APYap7d+dWtuNRhRuS1ajl+ts2ikuytXvYJ0RBn/bd?=
 =?us-ascii?Q?im4pKWDd8rtFv5Og7LrEsBYxs3z+JcWzGqTjdoI95DmpFy3q+Ss75jxfskGy?=
 =?us-ascii?Q?tYl5ghjncioAas4IMtoXLvYNZbZYhr4qE+Jqdefl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba2a3eb-1bc5-40ce-6d94-08dd6d3f99b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:56:48.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtW9Y/PmzZJIR6cfCxL1OlM6lgtoiY015p1hpyl3g8WmQwpP1p9zCnHOJ5EyoI81XXWmUfffDDhAtrDokVWqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_075654_341984_9F1D8942 
X-CRM114-Status: GOOD (  14.81  )
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

On Thu, Mar 27, 2025 at 03:41:08PM +0100, Alexander Stein wrote:
> (Q)SPI NOR flash is supplied by 3.3V. Add the corresponding supply.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> index f7fe8581a23fa..271001eb5ad7f 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> @@ -72,6 +72,7 @@ qflash0: flash@0 {
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		reg = <0>;
> +		vcc-supply = <&reg_3p3v_som>;
>
>  		partitions {
>  			compatible = "fixed-partitions";
> --
> 2.43.0
>

