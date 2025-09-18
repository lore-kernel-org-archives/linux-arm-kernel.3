Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A919CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CSw51gPDhLvYysySFDwNskNYVwrnFNk4nZweUi3cbQ=; b=ss9HJA0f+3DfTRaSRnIHLs13/5
	NrhWKFAzfV8yqzxOH6V/Rcg4gTX7c47uG1kS2dT0/qe/s5trVL9XrBalrzRt7TdOBbqieMuSJqs6E
	68e5FS8Fjw7Q52t0ncW5orvTvaqzZd6bnw3b54ZqheYb38A6BVus8oXq90B5fwn0YNlaJMFEVFBT2
	Oj9+1De26UeiGzS1K6agPUyng77LgKM63z7THu71MPwc6RyBNhV6xOvKr3KoX5mGURpc4KUrDTzP1
	EtbZlJHKoCEGX65Z09GPP0OGAlvUGP0yh+MHfNHjxihsxUn8Iq2YRHxcDezpIMK8j/4OWSIKwsMby
	sUXhhfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA1g-0000000GhWk-0sbf;
	Thu, 18 Sep 2025 08:30:00 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA1e-0000000GhVm-1C8b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:29:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1zsNLtG/1lsYiYyzAe8QqzsYTae0HuYGDYbEuLgRvrKF1kDxm8Fso45fYtwTq72N4re+yOkCQQu/gP0nSDKfEBmwl2pBqtrky2aw23go8yZWPfY4x1WdChsjwLl8MrDF8FbdYYSqkD7yEBK+YbWw8GAYkf1XMDZBm45+7mX8c4UI6x0/Ucd5kD8IHVddlEdJD+/bjlzirOav9jT8Qha80CAswbAFvoK9lY8u9iV9y9LgYGjSah07EdjF9yLtR8vsv7ZEQvhLJ+8oHnkXGlJwFDk3zYgBZy8r4hmWHL3HgqxOqowdr0Qiny/AaSAnUfpS1HtFzmvgexYo9e8JoxBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CSw51gPDhLvYysySFDwNskNYVwrnFNk4nZweUi3cbQ=;
 b=KFnojsp7u2Q6goHWoTVQef0C+VitBmu6vcknDgphXxjLLcFmjFgPRw+6TnlFEBd9RIIEcg0CkRB6AOjewrBpjbeOKodNet9tweOTdMH1NwkOhfvbpp8Q66ZHmq9YrRG64zCKlA0LcID8tdrf/sIK/xMGpvFvxyARgF3O90DVhGQYC6uOs8wMfMpoYWasi9/VPkWEgEBdJJ21veKiAVH6KJHprXZWGXRjkjhyAL7hooR1uuqXvKyO9OrFI46Wmzaii+T4Wv1txuDsjdc5KEQVQTgERXCQJxRrMbcnsjDDYXNSOz3M4cBaHPZ7F8IkPX9iXZbphK0JYnA27uOgr+H9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CSw51gPDhLvYysySFDwNskNYVwrnFNk4nZweUi3cbQ=;
 b=Mzd+OQZxMb44CZKPy8Yc5ujrqmgZp/aJUTrgZwihp+PwnrtY+yW7lAgBcwwkUtv5B0aEiYKxk4g2UUwvaH2meYXUMwi5gE1nbdYYVkvWYy0HMSH4y988MveqNCnpYxr0PnHAcKLp5qe/neW/9MHLGISHOz2wWm5XRpqMALUREmN20uAdzRSS9qyqXz/fMEZYwp7mAIb0LfBVUJyAVmmzuYimCqQojLvwx+vvSA+jpbPOLvH3fyifgpNL/agjpnwrPgo/7zXivvHF/7ajAkB0aqo1o7EozoUCuFvGuO0kwMdpxEUY4mAArPO2nJJ2YMMEYd8en7H/vHKbsvxfRX+WVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6910.eurprd04.prod.outlook.com (2603:10a6:803:135::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 08:29:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:29:52 +0000
Date: Thu, 18 Sep 2025 17:41:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add USB
 vbus regulators
Message-ID: <20250918094130.GB9196@nxa18884-linux.ap.freescale.net>
References: <20250916080635.1520551-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916080635.1520551-1-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f24907b-cb5b-41f6-92f3-08ddf68d89f3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QNfn4g8hCGswddp18w93ETUXhYqNYX333SZB0baXZG4miD5IDUKoK4FTJ943?=
 =?us-ascii?Q?YHwHIf78B+5w5tlQdiFXYpc8GkhtuQzfnnHM4qFHp2qgMrcuZz14y4cuUxJ4?=
 =?us-ascii?Q?7vwpsqDlH553Vc2ujZKSJ9sE1kKHKRYt8buSR3MAWQIZAh/xSSFtTjCOFY5d?=
 =?us-ascii?Q?Qujr1btkxEUGIlen6c+/VxiCLIfkzfY5WO92IU8+AyRw+t5rDNdnZhpollbT?=
 =?us-ascii?Q?B2R3dFqpeXuAyErSfIJ1K1pk0tZTuddwOH2MmMkBDu/CtyW8//Hs2FH8whq3?=
 =?us-ascii?Q?t4Oeb24Hd8hDuMgge4T3vrT3elZP1lFi5te8xbYKpdMMcwXIIfocI/vDFG4j?=
 =?us-ascii?Q?cfhWR14CF14/xV7Ncr+TziZepI93T11L2eH0uFtAnA1suH8wqm1xLeXcW3Sg?=
 =?us-ascii?Q?GJz4TZ6JkKNlV+t+P25u2CASk2jVo/nmytaqXFwp4sZziBa3fS+nn4FfXBeX?=
 =?us-ascii?Q?Y9NJs0El5N5VPTjuZQ73FfxAzcR9z9m6/YeB0uAWWNyQSyYqDArtzVZ3BUTW?=
 =?us-ascii?Q?tDdPNmq97JOqQYfmZ9rMjJAA2QNwpc9eXx17gVaHJsL4qx/sYwUiPE2EIDL6?=
 =?us-ascii?Q?MKncIyq254up/mk7dNjkdnODhCTcxM/tGp0Q1rDBamOay/aa6dN2HuKqYAMp?=
 =?us-ascii?Q?GG2Xata5034brwrhp9JNX8Hauu7POep567DkE8rTwWgUCdgZqy58ZPOj8tUz?=
 =?us-ascii?Q?fv8HoM+4hTNUMFB9h0zd8F6g9Hmn0RGOFoLpY7cimSHqmbaXjFrTyhqpLEVL?=
 =?us-ascii?Q?1ZnAoxNZAZktVmokXQavsObhvHioi2jrE/9Xd9ukLAeT+F24vsCJ4oCL4MIa?=
 =?us-ascii?Q?WpvbWJH24x3prLsv+Uiro2Vu0m1RjR8AdE3qmUeplhT5uoXPcGhrLnAMm0Wq?=
 =?us-ascii?Q?ZK4Fw2BxQtBYarBVj73ln8DXkeKThqwXq0Na0j/jf3jkf1J+uPxREJuyL0fM?=
 =?us-ascii?Q?qMZM2MT88tjKfFvUqmQYqlpGy/2YQDW9v+bfcHGOV6UmQJqmkJQJqVMQi+e8?=
 =?us-ascii?Q?JvBTId8lBEqYsIhGm08gqINGtzf2BPwGR+yD4uKP878YIRIrlhB8ZdHiCne4?=
 =?us-ascii?Q?44KmZacS0+ZkDg3bBn1pYqAdHDOIQRSfNsOYhKvKdXr4SwUMbyYFtjZRmwqD?=
 =?us-ascii?Q?JDQb0Cq9qObKx0EITbuHnngp6aixcLgxlY296tf04cgwOgYoFes205wwUpD7?=
 =?us-ascii?Q?migSPWl+x3CAbcpXVuBPhbxMxsjofmcwUFNCg8IbOi4F1exyTH33T3Ekt7fg?=
 =?us-ascii?Q?xHFXqOU0IfwGE4/QBLltVmaL6fI/aSlHydiVAncRiJgy+aGEyvQ9jd6sEWA4?=
 =?us-ascii?Q?aNpZf4+CFuuq3RvlewU/u2FHufQNZUpqK8qXH3nZ3sqw//f7IbvoJ6Z7Hb85?=
 =?us-ascii?Q?GZCeqKnkkmu61phyHOrb6bNvHSmCc32/XS/gy40MV4wHWRpqw0I7RRECLAWg?=
 =?us-ascii?Q?/FUF9ttcWdVjMeVdVgfnVWDq42QLNygDuSzEMgSNcWMa25ipLxehNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ANpKvdFRpVMsWqUFHWi4J8KdyZ2IOKeBCSNkaWpYOWqiY/3SsQwKbIlyftW3?=
 =?us-ascii?Q?u8emEWS/WHj9zgIWQ34bIjaIAc7Lm68bnmR0BOtHdBBuac2h8XRCzOO/Zpt1?=
 =?us-ascii?Q?571Fh/PGx89cbZWMK8vV5SMZQfCELeQgVuMlW0MOPGgEn3GhcsiXHRlirWaT?=
 =?us-ascii?Q?EvEatUBIh3jktO+FiKfuNzeVu1CBwb4q2VtHxUXe/Cc8IM8gc/rBmePQBWl3?=
 =?us-ascii?Q?4m4yxOIzVttvWjDG1lvT5ykq4Cj2FSIMHwxM85RApTByAzKLrH8afxZMl8Vj?=
 =?us-ascii?Q?amiYWYz7DULLP1Joqh0TXbktJ0qO7Er4vbvAZVwJcXA2yUfphibJ+/5ILyKT?=
 =?us-ascii?Q?1Og98d0iGPZCBYAjnGHkP2N42MeeSGtNyXGnlDBJfuUhm/oJTTGTA/0cqtNJ?=
 =?us-ascii?Q?VMF2hhVP1FCVOoDJHX2bRRcsJd/JWJBZvyA28rlKE9e5L01OXSqQlryWSYWW?=
 =?us-ascii?Q?O1SI7lbv6Cf2gS9y4UONf6BClfExgISq89cfUQOEezAH/2XFJk+HnY3dzFeb?=
 =?us-ascii?Q?rU8+wTxndyyAJ/xs4GOCiVDXSd2wtTv/1O5bG0jLaUFpa6sS/E7qVXAQyDol?=
 =?us-ascii?Q?q4mbCXUr/8aoJclksuNhLn/0I2pvn6Jj0+xyUlZV/XbGVa/OGDHVomus4Sz1?=
 =?us-ascii?Q?1Pt5F9A342X8N9GoYXODydHFGCmouRdAzRlPR5NbiXanxjzYN5/pcKbGwaDI?=
 =?us-ascii?Q?VwYju1lz5fuzBnJnBd+lL2Qx4wDnLvJDqH5D/WmSjaUlAHNfgMwFR0uItRkv?=
 =?us-ascii?Q?Z5C7K9iGKS6kExK08eOJieyJ22mYd/3G5Opd4Ej3xiwi4/nlh6M0HFVUzjH1?=
 =?us-ascii?Q?fANL1OGfRSCx+ceGCNbWc+R6cO/cZ9Hj+TiB4Pi5r6/4URT4nOLK+mc4NiDV?=
 =?us-ascii?Q?skGy+HHWsoxJbz7W5W9uIgWbsOWK5Ygb28adu47OAhiKpb5uHAEkCgbqFcYc?=
 =?us-ascii?Q?6JZL+SkQObHJ+cwGg24YDmLWhQy4k4ycN+HPtC/55RDL56h3hR1894/0O7FX?=
 =?us-ascii?Q?domPlegzOabyf67elfaB/HDDjzCa7b7Whaouflxt7HJyq/rkl2KQnzWo5nOa?=
 =?us-ascii?Q?GN6MJnE7eTKC+lseIhWFNxHpdB+RKEjMXlvzh3ay0p25Zg0Bi5x0p2zkEzIP?=
 =?us-ascii?Q?Va663Fppn9uOpXwqwp2qr8BlkGdo0pAtA0WXrQSAdaQfgFdUHz09P/Gp8zoR?=
 =?us-ascii?Q?LGwgBrifT9b7IxNU1b5ZpmXknK/27/YrSyV88aUPFAP3YOOjEFh+c3Ebts9J?=
 =?us-ascii?Q?oGVprQiOIgshon6F2mAk8NhvKEMtIzKTWvw9oi5LPb5UrajIpJSyDkJWz0t4?=
 =?us-ascii?Q?gWeFxSspi0+xpvPABx1qILD8yRZjyjGuM70sm4Tj2TaCnahBtXgEWHyFwmCe?=
 =?us-ascii?Q?MG65jUJ6yXiP7QbS3UpHRSsqs86VA1Etg5M4/XkBWaqYGEf8IpPHWL8c3WwF?=
 =?us-ascii?Q?N5jRrBl/6uKw0o69RgxHYr8IKtnrKNJ6kwd60VKRNjwkuzjDN2gFmFQJ1OqP?=
 =?us-ascii?Q?SfCnlXm9ezT/RHjKhUWTXZmqe5mgs0N2fVALhU8/wuuaWqizmoLcEC8YEcvl?=
 =?us-ascii?Q?7s4xdz1dV56gOv96vqHvGP7u5dMhGrvqgIKaulcT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f24907b-cb5b-41f6-92f3-08ddf68d89f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:29:52.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJbCFhHjt6IJJqe3vCiS9LuKS2msgFZBKWy67FV/jH/kZtrGkNZLNDpSeIv+wxAJ19qaeg15ckQ/CRyAMo5eRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_012958_331584_483339E3 
X-CRM114-Status: UNSURE (   6.97  )
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

On Tue, Sep 16, 2025 at 10:06:34AM +0200, Primoz Fiser wrote:
>Add USB vbus regulators to silence the following kernel warnings:
>
>  usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests (id=vbus)
>  usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)
>
>Because generic USB PHY driver requires exclusive vbus regulators since
>commit 75fd6485ccce ("usb: phy: generic: Get the vbus supply").
>
>Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

