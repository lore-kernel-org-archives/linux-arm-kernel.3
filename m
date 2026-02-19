Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBAC531E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6/mIAZdri/JhBrqmu4leeYU+lRN3YVwjLWY47JL2fw=; b=zDfB6M13GRH6z3dnQjqku4NdsT
	iGD1r7n9yiUPTUk9W4jp2/ONqKKHrb0UK4rcNbj1L7clLoaqivKRKUcdD2RNWWKKxEabqjySVy4Zq
	ia8rTv6IIBYcZoyepvoj99z/zAhn2jjNmI4ZptQYJtopBzI95zrgMwpHckV+08WWfSp+j9aETMrVr
	bsgxuh9zyDeDgNWkQV1ncOCDWyg3Qfg979Oz1EzaN6Js5PkMYTZdnVJV/nGlP8wN65Mci6b0u4XyW
	d+JWze3s6aGDmYaky39DL5oaJMZQ9z9zcdUddth/YM6jDBGy4mNqfKyttiYQhbiege9yAWFyOnc42
	c8SnTa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCdn-0000000C9tW-1GqX;
	Thu, 19 Feb 2026 22:36:59 +0000
Received: from mail-norwayeastazon11013069.outbound.protection.outlook.com ([40.107.159.69] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCdj-0000000C9sr-3XgZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ6wgoJmNXxjKv5MaAOfwCgtYp1YLAz0Aq+KzL4UE2xhwpR/w97cFLKu6H5UYvC2F+SdZMCiEnitUUpoF8QTtUOd11WoMTWyvFfUDNFwN1eNemHIC1QzzPrTZj3dMsFSBIFlo39Hhhm99efHPXihMzDTRhg0LtiaEyyexFb4zgGcGuYfjTbdadPpqBmOTmlv1+6C7oGEFo7japcY4zKOF10JzJnSpGyXfUrs+9vXb72bBaAaOu0qPFWGOoCE9QJaioyti1V+HAcax5KuaY9exqXHgNEntb2C2TakiFa+TV62cHZARtMUjGZCPwpGUEErBTzxU/tOUH2vSWgTiQIWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6/mIAZdri/JhBrqmu4leeYU+lRN3YVwjLWY47JL2fw=;
 b=AZWlCOR9yqINPpc7L7KC6+z6SELbPODNS+MGNiVq3mHrXe+nkK8GqGbde95v1ECubk+2myumKMXQfNyEN+a7DuupfwkZnO6MYYCSLIVKxSLHYqUkILhu3tUc/LiB2dtJ6KuFVYnTuiMOUyINDAay6oJL52vC0oJ/AQKfHnLTo+5umE+5ZCxEgIFE/Ar7mlyqk+mWEG2VuZjr62oW0ni/nJ2kozvve+D1oUgzXaJ3ZMV2CAcaeOu4vtLmWWKUCqXUNYT2r5cILTcZYyT2DHSflenlfVrwW5y6BlHDt8cZifZJq5BFoJdC94K2mlOytU5LrLZyVrFONF7KRDjl4Oa7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6/mIAZdri/JhBrqmu4leeYU+lRN3YVwjLWY47JL2fw=;
 b=df/nNta6ymeJR6bXRw6rmz9BdBLI+xnbT63TBAPZCcJyv+7ievtQsgRj/IEEKZviJbHP/P3x1OyQhTCw5Yezq1JWAPA0wAebV6JihCRmsIIkmWrvqjE7Zr36tl5EGlj6umME8u+rMJEEaVSAZ+o163cFe8KG+0tikDQ8sWWlLQBzwJhc1gS8UAWZ5vOd2rOxB4S1lHIZgWEbxzMAK402mZMJx62vhEKskvjuVbiF6ENy5Sk6GcU4RKFjxV7W3/IAM92dOEIdVHwgoXS/z/42TE7WyLDg224EtROPKPoWltpBi3bZBhy7KjLHETpmxyyFjxC5pVP4ZDb9/LUlWhaNeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12065.eurprd04.prod.outlook.com (2603:10a6:150:2ff::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:36:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:36:50 +0000
Date: Thu, 19 Feb 2026 17:36:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Abin Joseph <abin.joseph@amd.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, git@amd.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dmaengine: xlnx,axi-dma: Convert bindings
 into yaml
Message-ID: <aZeQeVPU6VhFr8hV@lizhi-Precision-Tower-5810>
References: <20260219152621.2375256-1-abin.joseph@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219152621.2375256-1-abin.joseph@amd.com>
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12065:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e5e7e7-c00f-4094-280e-08de70075f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c34a7mW8BbUdkDLN3yHgsNA9ZDQXFt3emsc/4ZwZzrPtEdmtdMDLb6eLqdCE?=
 =?us-ascii?Q?qeOj7OOGqZbroQavhFsHLa/bNxxOq4h2Cgy8UK1Cbo6DuUVgNoVRbOdhCSPd?=
 =?us-ascii?Q?NYrOyhyD0whsUimycKCfOT0JuoDX5OAgw4DQmYdIoiB7hbsEQ4GP/gqSBSe8?=
 =?us-ascii?Q?vaXJ73m/1upU2Vjj2+bLFbqAokZIhAqW0IlTvzSb0OJaVSehMHapPO1Fs9gj?=
 =?us-ascii?Q?Ydy8jCoXG5nUPgnDq8v1fTSpG6AngRx4Dzucwmzsw9qAA1phiz7zMPUurUPd?=
 =?us-ascii?Q?cK9ZlyeBWH6Ro5QGIO9TNyRHZvTEgYmhRJee64DpNPKKiK3sU1xDUpnnLRiB?=
 =?us-ascii?Q?clGcIws0qxZNuAWXopZC4GC1HEJmY0v/H8WWi9jnHctJNynD2/QevJULyXs2?=
 =?us-ascii?Q?/vurWuzSZ6rJk+120yosymro9Xc4AGxs8K0lOjf3VVJB4TS0rtbFtgEHFvvC?=
 =?us-ascii?Q?daDamTfhK5OgJB3OiTF9m/auRrg8PgrUuOBEARBAmCVo70UAjVSW5V0g61g5?=
 =?us-ascii?Q?pETSr1VHXmlzg+e5wPHoTDS5d3/pytKvcXK8SyH6iLy3NyN2oTx0hrCFfIZU?=
 =?us-ascii?Q?FsYbStBMrjscGIss0xDYtbqepWLx4cBobiDdIwNQBypK42HPuzEY7+nuiZiW?=
 =?us-ascii?Q?4InTBMxE0BjoGQyKC0j6mrJJ6IhnJFeBdMh2rqxklAFqZLJ+vyPAmlRPqydL?=
 =?us-ascii?Q?N1bHjOHOpRaIt49vh83GTuDr91t/TsZUMt+FeBAEjiydjhNyYtcBIwR0q5CQ?=
 =?us-ascii?Q?lV7keoQkXJ2O/OJwfRaeZ+WMmLXKVtbzH5ZPhTmPutuL8qNJwQrbyVFalmGD?=
 =?us-ascii?Q?4t2oWXQX1/6WrFI7A23Qfu/5xRAqqgOH63J6LsFhC0Z1V16Nedo713uox5ZE?=
 =?us-ascii?Q?T7Zrbss1RBNEhGZt8aZL7vlPQZu1duKkWl2l9IDpcIj2va7cDoI/ARIkb3aA?=
 =?us-ascii?Q?e6hhX7XEZyd4k+K0gAAYRWJTzvqZWR2YKb+J4EpSC4/MXpUFTrCHjo1cyiD1?=
 =?us-ascii?Q?C0XoKwJy0XHDrkRIOt+YRZt7MT82v/A0sLxrg7lMDPsvMnxs+nwGlqqedb67?=
 =?us-ascii?Q?bczfcc3Oa05j+EYdKvIxT7LCmTFMcn8zWfA4os6lBFjsmlDNtmqKzgxK/rir?=
 =?us-ascii?Q?HA6ORw9B+ZTpmR8/kc0VVHZqgylMkU/NruItcd6VxmlaYY/lEQ1g26jRfgJx?=
 =?us-ascii?Q?JqCIABczBjcPbS62sXOKuoIROL3184eEtvWjymsD6b/Xm4KgcOMtdpx5RzYw?=
 =?us-ascii?Q?vky6jrP/HnbhhaZY/pMjFZItFFLLLWB4e35ClZUj8a8Bjc98VlKdqJQq2XaA?=
 =?us-ascii?Q?xPAnTLHCmlOYgu8RSG+SDOMpHinwlW1GkguSgDAd0ZhQvgrjSP+xtjTjph4E?=
 =?us-ascii?Q?bjlw5pAbPwz8BDS2dORzL+c2TAqpHQ1KylqxFT112FNCrgh8aoSj03M/kz5P?=
 =?us-ascii?Q?kucfFcXa5L6jC8Myo40PH6WdhsT/uYHbeOO6xj/zWfpDQ5+djnZrFxW6U7EE?=
 =?us-ascii?Q?W95HUsclEdj/W0hN8QWjL/T+zL3IxjotZar6r6o98kh2zW64iFKw+DcOiLqa?=
 =?us-ascii?Q?Tg7eYU/djcamn7k70toUV1RK5+63l6XbcBEUjq0vFMar1xhUzB748FfdxN5C?=
 =?us-ascii?Q?1qcIpSoEsbPbuX2cN7cNluk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1UczstJ4EBrYglQFmxPSV1FHkpkSOhTAdup8tMNsCTPBhgMjtAiKi/xNq0b7?=
 =?us-ascii?Q?xk3sAQfoiWtnaQrcybDdjFiOTwK6+NcmdZ0b4Cj/gjruZgoT+/WDrya1F28e?=
 =?us-ascii?Q?qrDJ75JQ+rgwfEo28poCcCq07bM7Lb2s5kLbJ9ahQjhoJ9mp5j2EJyr8iu9O?=
 =?us-ascii?Q?oSNyZ/Tk/IjCskTPhqPjDfZk6Zzp6MwjmdeoWtrRXOSX1Yco0Nc7ntAcnUnf?=
 =?us-ascii?Q?QQxOSN6/G0QJrh/OVPhsFDcLMpz0sFxB5b6d00+eSoaNusKapWExzjGYje2H?=
 =?us-ascii?Q?YFY3PoivGIWnp1TAXn9aoVfcJCHOL3tcPs+9+HhZTYMhLV7cF3Xhoic84ed4?=
 =?us-ascii?Q?mqzB8axhr7SD4JSLztxCn/8ooTjl3RR+JxknWmhIlLHsCyxMy5iScl5grUc/?=
 =?us-ascii?Q?GxfbR1TozETODmemK1h6tGfT9eeY2Q/KVNBnp3ZTubvtTjZBGvArl8D6a87G?=
 =?us-ascii?Q?a6m2ENT/0Ng5jTMsZCUMq7Mwi310oGUJOB/tI2QeE5qQ8VTHzpF82fzPmZrB?=
 =?us-ascii?Q?tRgBGVw8Wdc6kRJPL1VOcsg0yoJb58T+QRSRzAx/pyERRad2BiATHopCKcZH?=
 =?us-ascii?Q?xS+5khOv7ja88w3NKpJ+sSQBwefjwZUd+8QDz7bQ3btPILYcgQTZ9irEokAX?=
 =?us-ascii?Q?ImVjVD/BXtUJrP4UdAihIA/XTTkl/29EEtTTLrjmDvpAN9sBoPFs40cnEOKU?=
 =?us-ascii?Q?ZiQAiJIenzoNq5PJep4UuHsNxXPKw0PRxngCQ9fPMpqGvs8Qral1AefC6yP8?=
 =?us-ascii?Q?6H/gKABFPRPE9gUSS0Y0EaDbNZbm6c6M4ANDgziWdiRTv9lp9ab4eXHdqrD1?=
 =?us-ascii?Q?Y2dECboSNRQCqaOxBVxW/96gyfuDOXJ73FBwhBT29HldXnBwdPtrDOHzlwok?=
 =?us-ascii?Q?aiN0yeibh/y8JNOrj1+PnzDw3qkmTjvFAjmsNawKNXG+27xX5Xd0HE14JRic?=
 =?us-ascii?Q?oqm1yxoafH0ZmbZpckSSZLkAAK9pzBS/1YITezvDSha0YeuS0wjUy4uJkaXh?=
 =?us-ascii?Q?PhT/iDKkQ7fkAg2+/UuQwKTeKG0PQw3LeH5NEv9uk4+i1L5kJPQdOWz0dbcp?=
 =?us-ascii?Q?7c33MZPZctBS0jqI5RV0mfPl74GDoPqQnBTymqcGA1qHAiHHUm1WnkbGG0BY?=
 =?us-ascii?Q?A4DcQy+qg4XKGkoCZ0cm9v2IwmkMp3n3RnLCDC6gSH9yLG1aCx4teN+VIbGF?=
 =?us-ascii?Q?XLJzAW5all878y5Uv42Z0Ll94cxaZdODdhtAv+X1Uz9ZqxwCUH3qrUkFKSlA?=
 =?us-ascii?Q?brHH2guHaBtuEiud+iu5ctSiQd6wBEtt0J/c672yer6+1tZ8qhEp2XJS53P+?=
 =?us-ascii?Q?SZwhQlNIXDyxkQQ0IpplLxACeu6I8Emc4LtleoMWDHrxWfmsyi00e828NCP4?=
 =?us-ascii?Q?pwaX72lxPgxG81+LvzXeK30lKbNvrnbN1mYenryoZLlHVmxTfTNrSqWNkr1D?=
 =?us-ascii?Q?PtejyM/7oraP68N7aZnbFwBN5j4x7EeSbR+kLvdwjqbn4EK6O8IfW7YAb6Wa?=
 =?us-ascii?Q?184p+HWm8xn6mpziQZ/gfMuV5t3JVLvrjELOT4ljyJln/NMfsQquiWg2fVFp?=
 =?us-ascii?Q?9x4+Ce6umjjMoy7AQHrF/auo+2nit8IOiQKw5Yaehqzv62Sn92zJIXrttKD6?=
 =?us-ascii?Q?U7ofVlVVjrCTPchvIRxacW7exUMTSB2ANIJ0MiRUxpCEYv6cAGaeYcFzWvAi?=
 =?us-ascii?Q?KBAGm/5WqD6wJAwAC4K47Dx4dwaIJfcFL0NG2F6TlcPM/1mo2K8WITBOFPrk?=
 =?us-ascii?Q?T0z0x39WzA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e5e7e7-c00f-4094-280e-08de70075f9d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:36:50.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0HnWLnqK/3/xcsGXEKzYsB3yC+G6Y+o0y1wVqHroVigl5GKUFq4mVsfaSxPSNLs+/KPoJnJGUxB9+jJMVT+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_143656_072399_F4E9D49B 
X-CRM114-Status: GOOD (  24.39  )
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

On Thu, Feb 19, 2026 at 08:56:21PM +0530, Abin Joseph wrote:
> Convert the bindings document for Xilinx DMA from txt to yaml.
> No changes to existing binding description.
>
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
>  .../bindings/dma/xilinx/xilinx_dma.txt        | 111 -------
>  .../bindings/dma/xilinx/xlnx,axi-dma.yaml     | 290 ++++++++++++++++++
>  2 files changed, 290 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml

yaml file need use one of your compatible string

>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> deleted file mode 100644
> index b567107270cb..000000000000
...
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Interrupt lines for the DMA controller. Only used when xlnx,axistream-connected
> +      is present (DMA connected to AXI Stream IP). One interrupt for single channel
> +      (MM2S or S2MM), two interrupts for dual channel configuration.
> +      When child dma-channel nodes are present, interrupts are specified in the
> +      child nodes instead.

interrupts
  items:
    - description: for single channel
    - description: for dual channel
  minItems: 1

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  dma-ranges: true
> +
> +  xlnx,addrwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [32, 64]
> +    description: The DMA addressing size in bits.
> +
> +  xlnx,num-fstores:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32
> +    description: Should be the number of framebuffers as configured in h/w.
> +
> +  xlnx,flush-fsync:
> +    type: boolean
> +    description: Tells which channel to Flush on Frame sync.
> +
> +  xlnx,sg-length-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 8
> +    maximum: 26
> +    default: 23
> +    description:
> +      Should be set to the width in bits of the length register as configured
> +      in h/w. Takes values {8...26}. If the property is missing or invalid then
> +      the default value 23 is used. This is the maximum value that is supported
> +      by all IP versions.
> +
> +  xlnx,irq-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description:
> +      Tells the interrupt delay timeout value. Valid range is from 0-255.
> +      Setting this value to zero disables the delay timer interrupt.
> +      1 timeout interval = 125 * clock period of SG clock.
> +
> +  xlnx,axistream-connected:
> +    type: boolean
> +    description: Tells whether DMA is connected to AXI stream IP.
> +
> +# Note: This schema combines all DMA types in one file. Parent-child channel
> +# compatibility is enforced via allOf conditionals below. Alternatively, this
> +# could be split into separate schemas per DMA type to simplify validation rules.
> +patternProperties:
> +  "^dma-channel(-mm2s|-s2mm)?$":
> +    type: object
> +    description:
> +      Should have at least one channel and can have up to two channels per
> +      device. This node specifies the properties of each DMA channel.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - xlnx,axi-vdma-mm2s-channel
> +          - xlnx,axi-vdma-s2mm-channel
> +          - xlnx,axi-cdma-channel
> +          - xlnx,axi-dma-mm2s-channel
> +          - xlnx,axi-dma-s2mm-channel
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      xlnx,datawidth:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [32, 64, 128, 256, 512, 1024]
> +        description: Should contain the stream data width, take values {32,64...1024}.
> +
> +      xlnx,include-dre:
> +        type: boolean
> +        description: Tells hardware is configured for Data Realignment Engine.
> +
> +      xlnx,genlock-mode:
> +        type: boolean
> +        description: Tells Genlock synchronization is enabled/disabled in hardware.
> +
> +      xlnx,enable-vert-flip:
> +        type: boolean
> +        description:
> +          Tells vertical flip is enabled/disabled in hardware(S2MM path).
> +
> +      dma-channels:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of dma channels in child node.
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - xlnx,datawidth
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,axi-vdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          contains:
> +            const: s_axi_lite_aclk
> +          items:
> +            enum:
> +              - s_axi_lite_aclk
> +              - m_axi_mm2s_aclk
> +              - m_axi_s2mm_aclk
> +              - m_axis_mm2s_aclk
> +              - s_axis_s2mm_aclk
> +          minItems: 1
> +          maxItems: 5
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-vdma-mm2s-channel
> +                - xlnx,axi-vdma-s2mm-channel
> +      required:
> +        - xlnx,num-fstores
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,axi-cdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: s_axi_lite_aclk
> +            - const: m_axi_aclk
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-cdma-channel
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: xlnx,axi-dma-1.00.a
> +              - const: xlnx,axi-mcdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          contains:
> +            const: s_axi_lite_aclk
> +          items:
> +            enum:
> +              - s_axi_lite_aclk
> +              - m_axi_mm2s_aclk
> +              - m_axi_s2mm_aclk
> +              - m_axi_sg_aclk
> +          minItems: 1
> +          maxItems: 4
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?(@[0-9a-f]+)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-dma-mm2s-channel
> +                - xlnx,axi-dma-s2mm-channel
> +
> +  - if:
> +      anyOf:
> +        - properties:
> +            compatible:
> +              contains:
> +                anyOf:
> +                  - const: xlnx,axi-cdma-1.00.a
> +                  - const: xlnx,axi-mcdma-1.00.a
> +                  - const: xlnx,axi-dma-1.00.a
> +    then:
> +      properties:
> +        interrupts: false
> +
> +required:
> +  - "#dma-cells"
> +  - reg
> +  - xlnx,addrwidth
> +  - dma-ranges
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

need ref dma-controller.yaml

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    axi_vdma_0: dma@40030000 {

Needn't label axi_vdma_0

> +        compatible = "xlnx,axi-vdma-1.00.a";
> +        #dma-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0x40030000 0x10000>;
> +        dma-ranges = <0x0 0x0 0x40000000>;
> +        xlnx,num-fstores = <8>;
> +        xlnx,flush-fsync;
> +        xlnx,addrwidth = <32>;
> +        clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
> +        clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk",
> +                      "m_axi_s2mm_aclk", "m_axis_mm2s_aclk",
> +                      "s_axis_s2mm_aclk";
> +
> +        dma-channel-mm2s {
> +            compatible = "xlnx,axi-vdma-mm2s-channel";
> +            interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +        };
> +
> +        dma-channel-s2mm {
> +            compatible = "xlnx,axi-vdma-s2mm-channel";
> +            interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +        };
> +    };
> --
> 2.25.1
>

