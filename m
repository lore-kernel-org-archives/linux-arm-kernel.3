Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A6E7DF13
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GvcEoMpgHHwieYZ5c4rjWF8pM1s9RgiAJya0dg+Fv8=; b=PfY1fNBupXByvwPXu+jHFltqKT
	Y8R55SelDx+SVDkC/JF+EkPw+5cCRHLMlK1icOCsTIDCbA/5l5ixuF9WF0Erf5DYLc9ByPlhrnOMG
	vFGWoKoThfW+ryqc/x1YwxbpcBrsHtnaih3TIMeLNmp0K62gQSIjAP+797PTLYMSuillvS91TB1xO
	vqebQDeqF4xf+8eQOHWxSpUFl4noG89Y2pV8ehCsrtCZgXXPsyQXbHBTOAJ5d4Xv/E03d1cSxqw99
	2RYCVP/oTYQQ7Pks/yJ0QbO4RA3JxNh2QvpnSjWZMi3oRCpjiM0q42mStEuSDszBDWRhXCBba/etL
	wkpyCXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxx0-00000005NZ1-2SAa;
	Mon, 02 Feb 2026 17:43:02 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxwx-00000005NYc-2MSd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqPhXIVJ1/c5Ln13wEbPmYAacLR+RBZBIwjnHbmg5tfTw4m/nZdYwveMjuiRo/ZIzkVkc84dZzbcXgzviUIAus3eZAaf1baHvGEZilIiE6yOvUB0CQyecoRNhxZgnPjnvqB3w1iK1nhrBHze/xWNAREE9x52T2IFEe5yXdf2SE4AoOBkpQgZ8nQkmVxEYDoUsT3JqJIfRJ3rqQ87+eFKxm2Z/nuquOqvfdEJ7kvAhsvJpzr+Bxep7g6pNWBbgB6BQol9dSP2m74ksoN0SG0FpQ/WPOlvTp+oyDlTPmIM4OVRMkF+O69FuHU75Z34FMqLIyCUeZCLWeuEJZcx3BDTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GvcEoMpgHHwieYZ5c4rjWF8pM1s9RgiAJya0dg+Fv8=;
 b=xWw6HiTtpXKvxyVjMzWt7a+EU1FSCTjBaJnZjNKqPcXY6NSLfT8s67Pqc3DMjJXahZ7fGR91x/OJo3RykCQ40A/40qouEK2ITTUfiQjIQakVCspk14VKTGJ1akcrk8rkeFC6/WdxEoWmh2jDnU/4oceXGq3NUKdrybhkLJVPJs4sYA1lXfljI8PwV8e/VdC4fmzixUXTDYsLbuG6gdRRw1gn5UiB0sp622drV4kXB47QZvZJUXh6yFUs8QaDn5gK2rj9VMQ0bJBKU1De8lVE46NGzE47O3c2mZkWL+lOd4ZnQloHZ9OaI3aHKoHQz1LsHM5SAa9IFg0j/oqODVq4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GvcEoMpgHHwieYZ5c4rjWF8pM1s9RgiAJya0dg+Fv8=;
 b=jUfkpABly6O2JP64o6nca+rH59r8VXMPkHQW73wJ3yKy8D0SLOD0O9wuz+58cEJGjPQ/RzTqzVAehluPtMbO3UqFdCF2Ivpqt54gLjO/VINJwo2DQuyo5+cCMz68pMUiNLsj/Ou0Xgcjl3E0/BwscMdSB7LfaYWwAkkuiN+D4CWEXw71bm0dMQPAtzn/RCMNBLnUc9pS4ED77czJ1wD1bfhIjVYQ3bEK0zE8kN5xK1BuSBSXy4tqljMdB+mGhbW46si39JKvbWq8Uyttavi+Djz5QKDb/UWrdSoQEba2GmSwI633OHMLLfeB4KbrzQSI4UzzVOnUdeUOiupnkSSTbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11005.eurprd04.prod.outlook.com (2603:10a6:10:587::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 17:42:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:42:54 +0000
Date: Mon, 2 Feb 2026 12:42:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
Message-ID: <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810>
References: <20260202151050.1446165-1-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202151050.1446165-1-vincent.guittot@linaro.org>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a43ba88-b257-4d07-4230-08de62827ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1gvt+UErzRSW8fpm4Glv0OcD8Q1RxH6lSachRN55BRJapBeAc12Lnwy9tAt?=
 =?us-ascii?Q?Ek17JdWw8LwxWdHJ6ZfN/ieNBH/TZizsIBe/aXcVo+YPHJ27lGooZlkvgcHI?=
 =?us-ascii?Q?9hAEbkkbuLy4B3dcSYI25FrfrF7+GSAfXavVtPXs6am7lfxCqmyuhebDVMrg?=
 =?us-ascii?Q?tSoedyBaQPeelfVq0g+XQjRTBVLpxh40Wd6JW1KJJqiolH8jlN+UsimpXvtv?=
 =?us-ascii?Q?1EDNgeWOFwxTl4mUz3u/3fJWF8dJFkH/9swHTnoaNSw7gl5WeOvGCmddA/94?=
 =?us-ascii?Q?Q4aoTYVi8htN6FsPZHlFAamvwKA+saRPkM8quHVbSEymjo4tohvvr5Dh5hEx?=
 =?us-ascii?Q?xXGDyuJCKHOAZdOs+zz/ijXJmLAbMPtUAsiS19zOWlE2+yFYa2EMfS9lyY4i?=
 =?us-ascii?Q?iZiMak/z/9hwnzqWhIsttFIXn/SbUTXW0VZ/oVIU6tJ/xBK+2umxhHj+vbP1?=
 =?us-ascii?Q?GKLbLJVaynMuvLAb5ymfwDeXddI/jE2FLHQ9+nEehYraoyxwuJT0kVzIIr/M?=
 =?us-ascii?Q?vogUj44JrqJynq3pqrWFFGX2rLZbTn9yXwGWjzD2aI8WBQsQpCxzzY/gXuYJ?=
 =?us-ascii?Q?FkhluDiCl16yY8i87vrXQ6/OhlOOInVoVYmO9LRDHOvLL6LaLDubLymwdVUk?=
 =?us-ascii?Q?tD8twmmd7t/IJLr/C90XE8329pAppnprEgyGUpUD46s27UhSKblVrXas1Qnr?=
 =?us-ascii?Q?djZld+RwEgFVEBAcFlj1uigTx4Qn35o4YoQ7m6Jr0+AzmSnnZwkqCIGGZCfE?=
 =?us-ascii?Q?iiYACs7tQC9HND/xKJEnYfQpqaJNatO4kzUILrw09CuXy9abN+aBpjyBsBIA?=
 =?us-ascii?Q?MLEmaC6Eyz+ZshfmTcAfj1B1Dd/wbP5oFn9cJUSULVvPzk3dom9M789XjO5I?=
 =?us-ascii?Q?tUA409mYs5pT/6Hk9HP4ZQLsY/fhkEsYyetPD6xgXEqVC8yCetyWJ6N6UvMC?=
 =?us-ascii?Q?fD9d1yXUxMygIU5LQtsHgu4ckuPX+89Cj3l2Yi6+Rbi6sBZHrHbwiIQYxq15?=
 =?us-ascii?Q?Y5S5mbJaVqZanKnYTxNe/l9gtgPwRtMKrp6wWFbNZ3F1HTkfPhte6RHa4792?=
 =?us-ascii?Q?YOvcB7+UxR+mciYMPlYhSdCdKhIR8YiU07tuaQXb+1JJfQFwo5iZnwt4/7gd?=
 =?us-ascii?Q?GK0DPkgyPmMXB2jomqaUgC3bc/DoYkJQyr86mbOvRH8lgjH6ZURgq4pLA/78?=
 =?us-ascii?Q?bx/ev3S/xUIZ3x3eKXv+cZzth1cGEyfR8FYUcIJpRCD7tmN6JOUpnBLjFhR6?=
 =?us-ascii?Q?VWRD/h6Z/U1Ml+IUh7e4T3a5EYwUGULNm8o6YCCf2kehtHR9Y8/rp+LqCxH1?=
 =?us-ascii?Q?irV1oZmQcMZCUmzHSSOGk/Jmgxaa06k6KBZH3GMpWJmlSRnMA6dqDBzM5m/o?=
 =?us-ascii?Q?tQElmexFKNdVdn3uzgH9gsjmLBc5eFn/1UKiyXgT1nUpwq+tgHVzvBiG/ktX?=
 =?us-ascii?Q?P0dl9/x3P9mcEhOYY0K7Mv2qaAC8IImEMo4BtXpgUXJDYuBXmmlSbsGWhJ4H?=
 =?us-ascii?Q?ZCAh6zz8h2cSFibWmu4Q7EX57EGmZUocm1sTDqcgCPbJ+KmCehavQspiUyED?=
 =?us-ascii?Q?2AbUwkf1VcUMJCpOczfuXOmZvoRCQ2EzAitOrT2tCb5J3BHmq//WDyWRF8ay?=
 =?us-ascii?Q?7kKvHHtxQAzn+JIe8Qxjt8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HhZpSLpyowAkhEca7hqV3s/3jAZWiF5bVqcArTM0darudYga/nageqi+twtQ?=
 =?us-ascii?Q?pkvpPy6b6EJozuf9VxSAY46mranLb8vIU2Bq2WqmQHFLjlEibvnL7br5HQ2T?=
 =?us-ascii?Q?Clw28XWjo6rLste+QLZq675kMJ+mDS8BKLZ6mx2w0hqfpqQ8gEv6Sld2dX4z?=
 =?us-ascii?Q?A/XBZD/+wDp6PQlRLEbczYTHkLQeoEh0m/Glhw/JEBmexE71nfSlCYtv0giY?=
 =?us-ascii?Q?muNpylveiQefgxYiCYXSrcRCpSE3wTeDZ80J622cRC4Ed+WtbIgnaQpXJcoP?=
 =?us-ascii?Q?ExaGak2z1JzpTVCta3hDDlolqASqUZoCOepBr5kll79O0H+XK/2c7l/X5zVT?=
 =?us-ascii?Q?MZleOGrLL5x0H5DYchoVVwGytrhr6PqVehct4PS3G6BIWVDw8dfz6CLhMmdc?=
 =?us-ascii?Q?tlXW8vgOcL2+Se5egF5rbb8SnbkS0cEv90NemhfxYo3/7iNDoS0nAhb8Rcj/?=
 =?us-ascii?Q?vTlw7APQkjkkcDwiohAO92ksVcwKCtF0QUd1tUMcI7aQKhSFcFM2AGmvrLsw?=
 =?us-ascii?Q?MX1cAdN5Q1jZeJjRhOocMAcFw1AqCvBoPCPKL8OEm2dL69HfxHHcY4tcIrp0?=
 =?us-ascii?Q?uxndczjfIWP4QWEmz3vLul/kI6yEWPD2T6sSXJaMcmo2O3jHE3fiUNgIJ8d6?=
 =?us-ascii?Q?YhU0ruibcfwQm1UoNGztgC78AZf8v13rYYAX1uRVNj6laCnjU5YvtQQLMkhs?=
 =?us-ascii?Q?RPpafgAX007nNCETg96NAD7U+r0na7WWkGYGvKHvpOxJMpaOlfbXkpBJJm1o?=
 =?us-ascii?Q?J1O/3Jdx+saMJzd5YYDfjInqYjarBGWlc6ctpUYHkB+gVK57MLCtJxR3WaVU?=
 =?us-ascii?Q?SG1gszTZbB0FxSrk8DB8BVpNRpTWUXw43VFo5z7nx7MBsViWHcVdH41ojOg+?=
 =?us-ascii?Q?fNc/LChzRUqvPS3ig1lvaXt/+mgm+AzbD9OWQhLFYmQrSEFnyWR9A3+dCBdU?=
 =?us-ascii?Q?H0q1Spnk7eDy+JzQ2EdoXqG9ETYQOFEt59OuKXkXyqc7Gga1I1PMh2fl4Iax?=
 =?us-ascii?Q?/07JkWR93GNUrhDms5F4Dd97zsgeF9yfJttd8tSPCC3fkNFTwjoz1qLXOXvD?=
 =?us-ascii?Q?rXvVaR9rz7V1ErQkMT9PaSRTnAoLQUkqWWPRgbriV1bru6LEK0eh0187rHUj?=
 =?us-ascii?Q?wWDijxtgGo1QPR6Dy8ZHbusPi7owef2pg/GuFx294zLMqA2IDBxuBkMfrVMG?=
 =?us-ascii?Q?NSQ3qBWRhgd65qKluaTP0tuYeY3/FJgYrbsWyPSweLya8zpAL/NAUpzFH1C9?=
 =?us-ascii?Q?E1/IXzXGnG10wnZtukJHm6gh2ilJSUxANRp1/mCloVPc8MpaaWAr4X3vTCwe?=
 =?us-ascii?Q?pCKpgsqv9uoq3STWCF+/EegxI1RInx91NOlPTlLSIOnWzUvKWHof79XNCfww?=
 =?us-ascii?Q?PB1pOBsCLKgJ2WBxzPWEh6w4tfjTlLHAvbIbyovuCCjWHXgFnKIzFdrHHzRS?=
 =?us-ascii?Q?0uS2L+HaqKKMidxliJ2Pl3eaUtsix92DVOVA+oecdJTOI6oBstAj1i9IFh7O?=
 =?us-ascii?Q?7B9+Ez96MYsUjmtTeNnwjG9t1HG8RySFfpIyb6QgPOiv3PwOzNTXGxiX9CBx?=
 =?us-ascii?Q?s1EfYHug+ADGwQzKySmpfGIQDL3WBzjl86AVh3z9UtMbBRO2XRhfO6r40T6E?=
 =?us-ascii?Q?TxXKFwb3xCTynxtOgeECSrbui/m4Wp6D5jLY1vh1qYf8udM8wS8+e5FQuza8?=
 =?us-ascii?Q?amtsY/veCMw6K97p0yNAGUijXGSTEuxSt36NrN636DloHf24?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a43ba88-b257-4d07-4230-08de62827ebf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:42:54.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkSwVXqRraPUnddQdZAI9xHDuagZ2wNqsl2WLjZTFfr2PSNexxBwssGWj1KvWhZ2gyg8hPqHpk0tEfb9VSTtFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_094259_665291_58788C87 
X-CRM114-Status: GOOD (  18.05  )
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

On Mon, Feb 02, 2026 at 04:10:50PM +0100, Vincent Guittot wrote:
> No error return is missing after the loop resulting in removing the
> ports from the list.
>
> Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>
> Change since v1:
> - handle correctly the case when there is no child port
>
>  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> index 47745749f75c..b3ec38099fa3 100644
> --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> @@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
>
>  		ret = s32g_pcie_parse_port(s32g_pp, of_port);
>  		if (ret)
> -			goto err_port;
> +			break;
>  	}
>
> -err_port:
> -	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> -		list_del(&port->list);

break and goto is logical equal here. So only need below if (ret).

Frank

> +	if (ret)
> +		list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> +			list_del(&port->list);
>
>  	return ret;
>  }
> --
> 2.43.0
>

