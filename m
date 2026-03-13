Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD0E106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woathD8LuljSF0y+WBydr0+FrdGIltMUluCExGWGHSk=; b=G0dWTvKhAKBZVcaZg54JlGXxi7
	FjODwJMjEc4/wHEU72dWNYrTvpQIFaekOmuWj+9uI2RGUIXWJZhwcjaIhMBLtlIkS+zTgAeQ6oFgW
	vAzz42KXPA11sDAVOw3E+VyU+nscdhSVz0UEt8tFRuXWzBK9tvTurI++5CoSUBUarTd/gtW+7B8Fb
	xg07y3dARoYu4S9wyma9wx2vTo6CQ5uBsxdGR7zKgf+uLQzFs/ciUBEznWvloQmQ5+kQaIFY1cJyD
	6J6dMgj+2t2PSitHW+I+eBE7io917MCYYEwsNMIExfalfb9VAdcwtp13FHv2cfRbcpcY9ribwA8m7
	VGhyY8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0run-0000000G9YO-2ORI;
	Fri, 13 Mar 2026 02:06:13 +0000
Received: from mail-westeuropeazon11010010.outbound.protection.outlook.com ([52.101.69.10] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rul-0000000G9Xc-3iBt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:06:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIP3aTGbDajBVcRm76FAC6Ps7G/oqJlA5QY6ICUvr44NxfmyP56FxSY+RrAo/zCN6bzBukgNIjV58VtixLVvEgDK76rqXj8sNvhAVDcxv98wJMPgkheig21tY492VRBRV2Bvkb4J7TYIXKfdS24GdZb5O6Rkmsg/Z1G1cl5u/CQQ5WEc0z4ilBaCaq2FdaSPMeF/LcJM++6jnbFJkmC6axnfB4dIJOlLJtdV3RlLvn9RxOPpg0YoKmQBfSkgwHi5OYd9eihK2iiuFcJxfPx6e5mZeM3HDyU7bX4L6w+DuiV/qVZiv7G82hRx5JkQUD74Lt7F+nbx5gn0U1CntuRwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woathD8LuljSF0y+WBydr0+FrdGIltMUluCExGWGHSk=;
 b=MItFVfHpdmaXaYu4dCXoutwsqnhM5C2J9neng1iz1m/vBfZhjN6GD7ZABmJFNBpcJjXgzBHD6jRoTOl1fj94Y8jBmdYU9yjgZ3HDZ006pDXDnzf1OWXp889fnTzI/yB0IVQqky+uowPZb8HWtlUdGHeU2XaLq4mWJgomG+zjcEPYW6xsm+51ZxUQ1XSacGzpD/K9a4fUbhk/VxsP0gZrLja8YjxqawrA9wK4BSo9qvVjyg0WETkIgaJa3HRDgEVsRIpSejrBVae5jgs96STevSO0G9KCLAX0AnuxeeBtBrondspMkjsWN6kbQtwSEvhtQ9wDAiWMj5qbRov9JwOFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woathD8LuljSF0y+WBydr0+FrdGIltMUluCExGWGHSk=;
 b=L2wiY8Ja4RpWi5nafzvjX/DSZkEPE+q6AjrkUu0tIzwjrVTLmdXhsovQbC7udP+p2ir5QcX9fc0wJ/+sRVRoaSpOxxE7d7avTbnIizMVsp1VYyppfj4QJmuqXWSO1xWn22exPC1OP+FCiGj4ZVNqvDmtFGtEXij2EeqG8ApjvETca9oXd2Jl5k2pYWwbCJiTcoL7etoj32KU16/2K7C5pS8a7JOlI1D7KzEpbkXJv3hZfb/6vmsbGAow9flxfP0ludPRtx32ba6wR/M5l3WmLVWjC/gO2GC4lfUHaHk7YPNTqbDl88L3O80MFpVAVrwAEbhI+9I3Llgbae5J4VDc5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 13 Mar
 2026 02:06:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 02:06:03 +0000
Date: Fri, 13 Mar 2026 09:58:18 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, amitsd@google.com, gregkh@linuxfoundation.org, 
	kyletso@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Message-ID: <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
 <20260312-facial-backshift-7e810ca5f996@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-facial-backshift-7e810ca5f996@spud>
X-ClientProxiedBy: FR4P281CA0310.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 04db5b90-6bbe-49b8-71bd-08de80a51445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|19092799006|38350700014|56012099003|22082099003|18002099003|27256017;
X-Microsoft-Antispam-Message-Info: uwqEwRjURbfkzyDpu8DoY0i+LC0qB7o4yYRiKAP8I0yct8iiDrWvVddZE8/dexv9O5n7QTVqAmALrSkuAXjoMhKVOw6MTNXSCSNIqfUyF9k/cR1W7OgK7hwCMsf/G+IVQuIST6xEyDVjDf+rOzLzPurg3aFldafP880yCp1OgEmXbAp6/8GjB/3UEN8KToMJPwMtjsO1eoUKj8a6p7UL1+E6k8YQ7wwlVbmhGoKNBkEbx6Te+obxwJleCzy2jCkztaaykPuRpuytLkka8qRq52aYk3jU9RbwOHr5dYHitBp1Nhw3feasXhf5cTQGd6WahvyXEPUv9KoC5uL3wbWZjGU4fEg3YxhVZQYwT7IW4Vs4ENy5mDn7A191Y74rJGB7zOjfPF7zMrUUHIwx8PnaRaUM+P1t/jHauKubkvAkiJZwDFaobM/ZVeijqTgNrTXv6By/iyXica5T00+y1yiN5hcPoVF95pnHBvhdQpsQ4M1QSoppzbRMuD3FMmWgBuZba4RFfj4luMkFguK2jMgDEv0vmpkqiXc4j4PgBExqpHULzPvbyhmlfg2MwiS3D81nv7mjmb1TP7UcSQYrg3nlH5YEDRhDPmOn/2vDV5cB8qkg3zpPX+59bKjPU8MKgZnMUYYnzOdgMTHSHDjNxTkhmYvmerxKD9lj15Up3nr4UyVa3pxY9HXmNgQhttMtSOxUm2A0MBrQwTyEn1gDs0eAcGxrSVFC+rtu257Df966UfGlVLGXM2F3DYrEqqdNIpbNR6plrFRAIoTmjhj+FF4cOSblY6ImxMyzhATUJWuYvwrQtnj6zon5Pm7WQaq9Hwk8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBtOhMlTQNfJXyXSOwiwvgT8faYUdMAGTI4AQmrszX74EpI/FF+hYBZscnE5?=
 =?us-ascii?Q?/VlNA6mKiGo6qd1pFpizuBZ3J9IPKkBdM4vM+RHyZMhdMa+mBSmzEG7CkcFn?=
 =?us-ascii?Q?oLwedcLxqzl8VXFfV9ZCyUYmJTQ3FsjYUClS6ulaz1illiYqovv51s9sgOal?=
 =?us-ascii?Q?4JQMBPpMv8s8mnUiZ5fEa5uvuJ7lxm4Tbc1A84yd0FFy/Ed/FEMyRz8Ij39q?=
 =?us-ascii?Q?CbfqSA8Ksf6RVNviroOdedFzK9vsa2gLYGNwJeWYnfZWdjSTCsy4rmzZ23QT?=
 =?us-ascii?Q?/w/i+c+L+tdEnDxt88iPa8KbACFSqdLxv22zzgnroGKD8gi3Mc9Yl2T7/LL4?=
 =?us-ascii?Q?QePJWj6WDqh6DvmaW/WXfs8yMBVQgD7sPOzF7ic+V8tWTdaVg/RCbpdij7pJ?=
 =?us-ascii?Q?CH/jubiq9dFXNsaQXjQAdIqSH58UflxKpyOHsMH4b5FEtdDuV/Cq0gCY9KH4?=
 =?us-ascii?Q?hNJZisxxdwJ1x08fYBCl0vk7KLws65FNfk12HQVx3M3BtSZybJ2FH75ztkAb?=
 =?us-ascii?Q?c73jQUfKq/cbrgLq7eCdcymf+cn+9wfjmKOQN5FR/yqn/ZsSwhd8KJZBzF1z?=
 =?us-ascii?Q?lx4aZOL7Nt4Q0rQhUKkmnZ+32QJ9gj9z5C8AMOeZ/FxT965TEYf4OJVgQa2H?=
 =?us-ascii?Q?AOe22AJW+fYyUJAdufBBpfVzsq7hdsk5JMDph7QPNZLsYxME/NuGNscvmzUi?=
 =?us-ascii?Q?BLISMF/YFh49/rbTdv1hihkwq9lxO36LezMyg3z85cAgpIvfwunayqpRf4Jd?=
 =?us-ascii?Q?ePWHwp3pNg7lIuPTYizm+z83OgVfsfYnryRhBcQG9bRDy7gLPQec1RIXNIo8?=
 =?us-ascii?Q?83iWrHAoAOiFfxSlZTeXJkgEsgHouVNcsl5yrxKsZYUXKf1F37ZokD62vK84?=
 =?us-ascii?Q?yeUWO5jzxvpY4m2RvWeswZ7gxYwjyWw79D0k0Xjq9xUjmyutxW2s0R7MZQ/D?=
 =?us-ascii?Q?IEzn95s3np0JaljYmjzCj/IXFpnFqv2uK0QFQlsBhqg7qPgjtY8IX/foOSO2?=
 =?us-ascii?Q?XAyIgeLvU/z7H0WF5W04T2C8jr46LlRHaeRkwefXfztRKhffVJRoWCw3k51V?=
 =?us-ascii?Q?J6aEDJ6xy6AY46wW6Fsmx59W8HdVhUApj5pWi/i1lvssLF/dBy8MMdfJvy0x?=
 =?us-ascii?Q?BY3dvdEMPT0KG3yC7AfRgmd1CqhAVyzc7YSK0VeHXiI6QKYQKHVuV4IA6w0i?=
 =?us-ascii?Q?h4VdME7ORBaC/Uw65vj8o5FSBoZzMVdWt8ytYVeye5gA66rm3bh9+C5AjvU6?=
 =?us-ascii?Q?47TEsZal23GrL6TECZ+ygPOXX4VelGqGN9G2xCy+W8TqgCaP21ZK7ylE5YFX?=
 =?us-ascii?Q?k2hCoNaIbByQxHcF6p8XORb/WeOM8IePWkH+7S7vf000cOqpF4oaQbRDk5Al?=
 =?us-ascii?Q?mWn1UMf26+W85RmVOq9FERVbC+UmBBoZgg4hGbajWvulFN8VMyh5Fqs9YnLr?=
 =?us-ascii?Q?pqSkPp2ULhJkvyyco8elk0zNQ6aelOpFAjDexM/jE/Ap84q+UmWQWmJ4LnvH?=
 =?us-ascii?Q?Zq/5rASwAGGaO2V4KTwH5VJQw/6MFyxxQgmpFKGeOvKZi/P5CkWJJLzdLTbC?=
 =?us-ascii?Q?j/FaDJ9oTEv63TGV+dnmWq63rV7WxprTGtr2FhgaIPI5QfiI5BScuqhCTOAd?=
 =?us-ascii?Q?IA8aEx8vW2+r1yDZPFRbnwARfCEne1sGGSptFrZjD13UnRKIEQ7DHVyZ3T+k?=
 =?us-ascii?Q?clwnFDla3tx2/iqfmP90UlBjtu5NbGefXMesjrcH7d9LubxCgErMIqKRmWyK?=
 =?us-ascii?Q?KnJqgNXuOw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04db5b90-6bbe-49b8-71bd-08de80a51445
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:06:03.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rAoe6VFguLPhPkS2opIDF8teUVcp5yWiv58cvbcGFDRp+HoZw0QaezblxBqshSq6xfT50C8J+AQsn+lCZUNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_190611_946485_53BD8BE6 
X-CRM114-Status: GOOD (  11.77  )
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

On Thu, Mar 12, 2026 at 05:47:32PM +0000, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 03:16:08PM +0800, Xu Yang wrote:
> > When Power Delivery is not supported, the source is unable to obtain the
> > current capability from the Source PDO. As a result, typec-power-opmode
> > needs to be added to advertise such capability.
> 
> What's the impact on any users of making this a dependency?
> I assume nothing negative, since this will only impact systems that
> don't work properly at present?

Yes, right. Most of the user satisfy this requirement,
expect imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso.
I suppose this user can't work well, so patch#2 is added.

Thanks,
Xu Yang

