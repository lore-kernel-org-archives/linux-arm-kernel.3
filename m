Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC68D4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChxI+JJz8Xodkt4+L3iUBIBX0LyvBwkYhztGG5S+XVI=; b=a+WTi2s+e/9+7Ht+wO01qvrUtt
	zzkJq7IKrODvWAfpNYC8ja7o0fWU7E+swhfRJ62NPpLp/EcghTaQyzBRA2exudDjVZadbv5BVMnh7
	Jn3rAaR/pBUlTDyaX09N8IL3tRPU6CVUzzuhQNNy34gfNv5/xfanF8c+OWR0xP4CLRWY5DIhemaQw
	W1+XlK6cwXNL3tp+jdF0u4+qCuntfSQPkyhWOd/t209cr4RceVrSrYXnvY47b7STxA4O7BUsD2vWx
	wkKDLtQXs8X9CYL1Bxya++6g5xQkUJn0e+inrcdQjABLiMgDrwlhJJy6L0FtIVrr+R+iIZ6rqbtfa
	1sGoWwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t944f-00000007NmB-0oW1;
	Thu, 07 Nov 2024 15:05:29 +0000
Received: from mail-am6eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2612::618] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t942Q-00000007NVH-2726
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEHDPtZ02hUmuGFAdPfxxChNX/QWLyu4JVNYjTfssRXMBb6OtIAL07QGJ9KuBl4y9YmJ6pGTervgpZMA4Rw8wFjuhE+WHwlBhkZfFyJBgQ5oi1Ac4CNDrYTEARfd5hBWh+ZEycS5C6phYU7XfEmDwQZRpDpA6jFaQgdF1gQCqwdLsCxYCHxdDWTwzUrGxMjksoPw/2OaN7bFzMvcKK4TXr4mfmbmdwUKROZWim2fijNahF8ZKTvFKQ9JA9+EpKpzWST7wSHYp7Sbp8+U1RkMrSeuYb0s9xtE/hHJJcurn1+a9QTTQRC8xVcz1vAOug8YhEuC/yY1/AqGuQ0Q4Bd3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChxI+JJz8Xodkt4+L3iUBIBX0LyvBwkYhztGG5S+XVI=;
 b=wgX9F0GGI/nPzrBqpFge1jYVT8BiHdtThyl8xw/Utrh+qUZ1Mb5N7OgQHoPnw2T/5LVmQ7FmTbVoyVpzZ8KnJlWo6GonEKUk/WLymQUnMPfCfAz2zudwRbmDWOjGY3wXhh2kpSrFWq4fK/8+CdiP1E0DJUaxojfVPIzahk85k/zBf+RUowYr6xWzFlk0Qj1cOAu4kGMxwvWE0yDi0qFWW6JDQgpWkQEnczfk7XVEcsI3Hr4p38aMPr1vQnIZWzg7wWi9t6UZ6ZCPzfpyYRPa4CyYj6oyyn4+6L2wiQjB5pjW9D+lYtjMUO+h/k3XQFz+DxxCSBz3sZo2DOQcBuhtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChxI+JJz8Xodkt4+L3iUBIBX0LyvBwkYhztGG5S+XVI=;
 b=Rxsf+1rQqUj5TvvKy2DhFIrWEuEzpnL95t0u4ZiKVP4NeP/gFRrAOrc7ovYzNz80B9YsrkEL58xzD9zXHP2v9qOem8jx/T5gxfvicFTTZhVCDbYeLfKP161t4oxLvfa2tXcvLLWPuSfunxKhxy8l+4IOYmX/muAeBQdf7gDmyvoYJoVHXTb88pNkTjQo8NaAYI8mxpD0oNoYP/tjCXYicdOV/nQ8s7MNlJchjolxTDh8uYnwOVHqT7TxnaabKDnd8NdIQrbKZ30LR5lBGq9YcOvV2O3lVt4hu9LE3jZ7D/kMs6p5KV2K5wmHeniG9PfcuM4KQbO62+vN03V48LYsug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 15:03:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 15:03:04 +0000
Date: Thu, 7 Nov 2024 10:02:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de, marex@denx.de,
	hvilleneuve@dimonoff.com, peng.fan@nxp.com,
	alexander.stein@ew.tq-group.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	hiago.franco@toradex.com, tharvey@gateworks.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Message-ID: <ZyzWnHmPyjBJZ7/F@lizhi-Precision-Tower-5810>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com>
 <20241108022703.1877171-2-pengfei.li_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108022703.1877171-2-pengfei.li_1@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: b759af0c-00f1-40c1-de65-08dcff3d47ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kgUM1oN2/GYjV9fq9a8LvwNbZT65oGmsOpx9QAtjh366qxoCoSmgENCj1cxf?=
 =?us-ascii?Q?b68U54y2VXX4UfFJ+ueurXX4A9Wl/e9NRDWIy41aGdub8ZxX6x7sTz7IaW2P?=
 =?us-ascii?Q?0DFOXWbJGltjHWsCl4EFQutraBT45ITXoS0EmHOxwxKBcXPB5uqvKuH6M24b?=
 =?us-ascii?Q?egJlHSndads+YQQmN8PGYUUSnszFrvJMosGsfsLlI3cx+cbSEcpklhKi6j9/?=
 =?us-ascii?Q?gHKbB/OS9IYN7BCqvymUP2eS64/NiX3tcy1TMdGMYsHqzD7+IKyzv/TIb5Qb?=
 =?us-ascii?Q?z/wjTpr01tlo0Eu6z3l4fWjz8fzYa82LhjIWLejplXDFAe7iF0J/lFRm+fOI?=
 =?us-ascii?Q?TiXCrfIyX4L7rH6jqLwyGNMWey5ThWL6ELPXYBgkzMtDDmk+n/XVgE7WYyA/?=
 =?us-ascii?Q?6ed0iVfnjP0LBjiB3PfpJ1hwA0So4H839I6Xyzvbfq0Msz1LKGd65WJUCtGy?=
 =?us-ascii?Q?A9ng0EorBp8phVZ+9+yCGE7D2LRkYo56X3LcsyDz4fqdHFouyuC2++o4vA0r?=
 =?us-ascii?Q?IeiAZXrw84t6L20yJmyCz6uH9bkL7fzJpJcTvL/lx57J48XpHTpHG3CYqLDz?=
 =?us-ascii?Q?09acpVCxdCA8E6WjL5WxIZn1JYEc5n9uFBwri3j3XYvjSy8XZUDNBSCEIibv?=
 =?us-ascii?Q?Q1hj4IsWLP5dR36CHiNAMEPELDuOUs8M/7C/3sAzcHBn9/Mm7sOo6oEXJ466?=
 =?us-ascii?Q?CmsBTZSPQ2+/isHJTOeXYUiBALOepZBf4ZnTu0Bw/4N+8YsonTEtYryzGL41?=
 =?us-ascii?Q?aOmmaw0savSUGNwBwGRUUIJmsDgSLfyEhlnp84OxwauAZWS6PkvlM/ABMPaQ?=
 =?us-ascii?Q?FKKBrIdfzP3LxYOQXTfi6lIH+VuOLc+veeQvl7X9kGEpD2NrpIwEXsEMxVz1?=
 =?us-ascii?Q?e/jO9FeQ6j7oAp/gbGKsOOxDMFHrhkRg7odaRiWRaXbro+ErlVufnfOXPNj4?=
 =?us-ascii?Q?/qjNhlxOTzCj98N35Nu8vEwmHtYon108Vu4YsBPulOWnwsnpBRTGkiXgyJ/x?=
 =?us-ascii?Q?w+FNmNSdZwrpnCKIy/WXOrrkyb2vUsq8krXE6BF3q5OBmQdYGuvk9BlmnccD?=
 =?us-ascii?Q?GurFs4nLNdV147Zk8fyEg1RaPc5p0ObjweT5yhcDrJ9OP+Q74PWFTuk2zw2i?=
 =?us-ascii?Q?fCOisADXTEyQYRHDF62+qLFd63MpKdrVt4n2+tCMsJS2NbmX8dO9+kQJmHc6?=
 =?us-ascii?Q?Rl+Ufk62YJkgL5KgLiJPpY2JAjPmOumwwedHinnEEcvWDOG+wXA5WoCSC4wb?=
 =?us-ascii?Q?TWsooRJA+qg9I9dxYLhBDp5jw0E4yv4/YAmOy3qtCos7xyNWsG+xOCvY720p?=
 =?us-ascii?Q?ZT+PEmUV4Gov/2JhS7kioJXTPoDzqAs6d3W7s3aJj0z7BL87P96MHTsQNvN4?=
 =?us-ascii?Q?L91fnwg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0K2+eiFuokzdyg96uv1MQVJ/PuKjik1Qs5eAvgnfNlu7ZCvijnCZatIg645R?=
 =?us-ascii?Q?FxUUarulLtT/ZzysrFfbacz3rJSgCnak1bmhTNP7jwHl8l6qOUmDg0py36tS?=
 =?us-ascii?Q?9Bsib50GeKWKd+oQDmeFGboz0L19BTrd2HydUinawS9Oj1B0aZl8OUEcfyC6?=
 =?us-ascii?Q?cwTfDUFdTbq0gNl9Z+pp2pjtgZERkPiNCDYvGZ8DeHWzeXOoswX+fNy45HYy?=
 =?us-ascii?Q?4onlNyoVNZv34NEJ9HUcci0fwiSchP9sP7L6bv5tgQIVemJe8mxzsjraadD5?=
 =?us-ascii?Q?CXk/6xV4zGK1Z/ki75Tqm4oFAisG7i5dlHmFbh3nRW7/OW44FFYWBDXZkyEI?=
 =?us-ascii?Q?5zSi3+c1qHjAWHXj6FvMl3GoeWTyxvpR4BnpIM+6P0TqKmEzabEga29lcCAs?=
 =?us-ascii?Q?MUME2KKbO/uKyuq666bsk4IohalequdxtZ8uCBmPcTkfh7DBPEHVZbi0BzJb?=
 =?us-ascii?Q?e2rrl5OsNIjqqwfQIq3ccRVA9y5gpK96/Ce3vreiXFVZY9oMhMtrVA4PJA2r?=
 =?us-ascii?Q?Rnz1Y+QwwxTP9SPNICy/gkDUe9i+WwRQOrr50HwV2HlQVNNPbWth5OVpdOzm?=
 =?us-ascii?Q?h7xUOq3Qwbaa1qF60Gpc7AsteWXr1nH+y4M287t91LvUqkOzIp4UfQWKyAha?=
 =?us-ascii?Q?4YFim2Zl6EA+ZN0z6LGOxBA9OHXVH0Wz7J6KbTXVbkuC27GsI/FIRH629D8E?=
 =?us-ascii?Q?02hDrePae6Tc5tAN96chNz5ppRqKli/B9ml+U7nkoM/5Q20C0NlIOOacgZ1u?=
 =?us-ascii?Q?J8Whpc+8z30T1oWAc+6et/WQDFUVvrmzTZAb9zHTEpvotw2T2ADC2qVNu9XX?=
 =?us-ascii?Q?E8ZonKhu5mjBl/t/IivWfKy31rGjX8E/wl03SAIJvABhi0wuE0Xdv4gTEXtt?=
 =?us-ascii?Q?ORSWbYu+x6estxW5JBnB6FwDEXgE93o5kItAMY0PspTeCCXG+L4EoYdE9XDM?=
 =?us-ascii?Q?hw2x2m743WfYGbMWTNy44WF/m1pQQXjLap9zwrqRofIBs11Le+Y0xtF5zHnD?=
 =?us-ascii?Q?hZuMdE4iRutVtfTcwh82mUHr/R6Dqz+AUzPG4amjQbuZYugTTZMA5mEM/+JJ?=
 =?us-ascii?Q?16C/4+YNOnWxTw3kclxL34gtL7yDHPTaFEDHk1TE+aBw6WDJ3qsie3E6XLsL?=
 =?us-ascii?Q?7bvbbLPH0T4eczpaS8Pc1SaB+yD8gDE+iypEehIJq1af2Yf/LowXo4wQyoeO?=
 =?us-ascii?Q?14hYaMQVfzuXHgftnkLzE3oLTzYJUkNIcGn01H5PxS+2URkjra/XBRGn/AwS?=
 =?us-ascii?Q?9ietCZrEodZYPckVh33PC0PHQB7dYqD/Ae9pTan57UXi9kdFxo057dIzQpl6?=
 =?us-ascii?Q?P+CmsywWGbPsL9EmPkhIJhLR3YZDSuKAFHsuFPuL+0cvOXxyzm8d9ERHEFjB?=
 =?us-ascii?Q?L6WBc6ubXyZxGobYEdkwvIyjyMDoxiIuhGBmdMKWed/4wBI5aGQGR2awm1f8?=
 =?us-ascii?Q?2P7wZmiVdQsVNBJNBqUgq6levOHEKySVYpjWy0BqAfp3CZkAnw6elqVfOqqF?=
 =?us-ascii?Q?CedZNn5tBl7cpwQypPH+7LnDJi/7lsPWxFuX4ZTHN4y/SLUjrxCnxlEx5tA7?=
 =?us-ascii?Q?SpYHoRM7Z42YbPZvdtg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b759af0c-00f1-40c1-de65-08dcff3d47ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:03:04.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +d6Y9dHPHEtgg8UYEgdwLKqavbBi3pv5ep8BdUIrHkwtdhomW5Xy6f1AEQCUB2PV1arWxFU77PhCd3C8BApFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_070310_614098_69442512 
X-CRM114-Status: GOOD (  14.01  )
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

On Thu, Nov 07, 2024 at 06:27:01PM -0800, Pengfei Li wrote:
> Add the board imx91-11x11-evk in the binding docuemnt.
>
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---

Please not include my review tag next time when send out to public list.
review tag need explicitily sent out.

Anyways, I am fine for this patch.

Frank

>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 6e0dcf4307f1..5951317ce900 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1332,6 +1332,12 @@ properties:
>                - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
>            - const: fsl,imx8ulp
>
> +      - description: i.MX91 based Boards
> +        items:
> +          - enum:
> +              - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> +          - const: fsl,imx91
> +
>        - description: i.MX93 based Boards
>          items:
>            - enum:
> --
> 2.34.1
>

