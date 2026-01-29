Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F87FD358E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQA7Q7Z0g3FpriYOz4ifvr0ZOt/v+Ijv6ZHQEse1Re8=; b=Vh+LXlFAvOPdDcBn6SryXOEZa4
	cT6x2JY08FW+qZzLK6pfU7YfyffQotiUsvSt9CS4iY7NiMXjEYlC2pxRLp+R9TRs44uOiQG/KAnLN
	737ZHJKBPFhd9sUEJG3z99j0f94QpEkAG3s7osvfFODOqr+FUSaD5/oSvo8Fd/Dbclr3CzW1MXyAe
	fSsQlS0SMJxy3E3Gt/gqv/rYm1ux9ojz1iUkjtckuPOffuL6Xb9oW2WZWVVY/FCfkDFcSPTMl8cPH
	MfSEqjHv4hjsvFesnfayXL8bNOTovcPdxr9dVNE4hb2g7nqv4qHM/XHLUVyH5KeZo4K/7PYTaoLxq
	UkMg7J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNdD-0000000HTKC-2lqk;
	Thu, 29 Jan 2026 08:44:03 +0000
Received: from mail-norwayeastazon11013050.outbound.protection.outlook.com ([40.107.159.50] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNd7-0000000HTDF-084g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 08:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5vBJEmkt0qOKZd4OF6WVzeV8WvR321EwafdVju0G5cBV6YR0PHS7IEJLwX8wMfpxYyHqOdPxzwH/ho3im1BP9eXKrPcAAzM93lIFjb/YIaeWk+1QfkvwBu2e/yOuI+J8u+lraRcJkePn214C/ukJ7r8efUbGcQIgCIKG1o5pqYxVKe5XwJa7kiBC4Ze/LDmKYwrG4Q/a9q6n3zAW9rc4G96he71/3Ie+3rTByoZCgGAFVa7vRtGBeJq3cJEugSD6LK/pXmhLHnRVSCuF1qvPKWAG7XGvQNhdoTi+sXGfuz5vyynhHGuV8rvZdniTNDd5oLQyQM7Z7izK+K3Rq4+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQA7Q7Z0g3FpriYOz4ifvr0ZOt/v+Ijv6ZHQEse1Re8=;
 b=Lz1RlX2PluOlQl6OWqy6BqtWBYkI0xCcuK73S1cJrYqUOj7LqsKjhg0USrEzDz1aV3fsgBbW0cKPjqA57XVJ4f04mvUWwcuVozjJNOYiDFEW1y+VRXZHiPY+QbHQ/uGvpN312KNAyJnuHctbjyAvjmvu0oS6Ezepikvme7CyVlaSe/H/rKw7UA7N1F94LvfBkosm8ka1Clu39AzVpgrCXlT1TuIHp/EaCOi+IcVbTSn79qZhB2p1SsghUbfNe/GzxK4L9mQUom/GYcnTcre6FTSirYw+cI6QVlQRSuyVfOLVd+eQjTQP+yUh7FnKoim+W878XSWWLjlYcZsal93+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQA7Q7Z0g3FpriYOz4ifvr0ZOt/v+Ijv6ZHQEse1Re8=;
 b=cf8UQBacOQLQDiW/h8DmPKVuFW+9+mQnJ3B+IMEb+XMMSC7455N13WCK2qcAukZCkgGKte5rOUz0xes4aM8C/GMjpq+iaE6jhfD1D7/G7iJGxw0vHZjep0d8uH3mx2PLQWL/l2HtuuByEnEuDEmNDWbJD8KWP86o1WH9jxbnq7xyGeleLGhpiraLHn4tLyjcNRXwqevhXUNdFgfGeXDzmKbEsgt/NQHOl1KMb5K7yrK8aPjpsDaBagem/roiBT2zGiAT6b8yKfcVwPqvTDBkdipsObtUxchgauZ4qW6OCxJBgnAiwUShWfehDqra93dGfTQzQjVbidYScZglFY4V+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB10661.eurprd04.prod.outlook.com
 (2603:10a6:800:265::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:43:54 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:43:54 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 4/4] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
Date: Thu, 29 Jan 2026 16:42:49 +0800
Message-Id: <20260129084249.3079432-5-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260129084249.3079432-1-sherry.sun@nxp.com>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI0PR04MB10661:EE_
X-MS-Office365-Filtering-Correlation-Id: 305aae18-e1a5-45af-2605-08de5f1288e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xmAHHZMIxo3mBmjYudCOBweji5RfdgfLYKk8vN7fRyvqnBhTX/CVzVW7zZd?=
 =?us-ascii?Q?5F75lL6Lb8T8IlG/9WI2vyJNJ9vfrPrKp0uGTH1eQiuYBimlqy0OnYs3g4uE?=
 =?us-ascii?Q?khKNKP7q3YFijdP2ZK6nIo729B1GASSVv3ZRSXZAo7SVqIQnPP50pAQa2cV5?=
 =?us-ascii?Q?Hfua6MVIggtZQDrtJnH1SAOQE1/J5grA61BLFaD1nH/74pWuoRjX3638O/7M?=
 =?us-ascii?Q?By17W50dIVZqOikY/CWAwltEpwEPRHbrPyaI1n6kzZruAysa1oZ+VNQKswIq?=
 =?us-ascii?Q?s5xt18qdLMQfGpYAhwO6k+4TlzsUSF5w1sD+OqWxGLrZ+s8Y7qDdfgJbQ280?=
 =?us-ascii?Q?EPgGWqHXVDzAVX2H6xyFrEl8SmHl8shVqFNpcPTUEJgr4gYOB1wYHdBpsIih?=
 =?us-ascii?Q?yTmrvwjAlPdV3+ph/MDNh2abK4UoYtKE7jcMFyaL+c0CGWljGQbEEX7r+OL4?=
 =?us-ascii?Q?TJDKFGWLFZ4tLrtPxjJGchTfgL/oc97IKtbGGgCc+8ZdUhF89ub3YoI3hxTz?=
 =?us-ascii?Q?/XlCY3LAD5msZmSZfHQpXvAOvFyqeqakOqmuSlfl99vm01dJ+XQ53N3Z9Twr?=
 =?us-ascii?Q?+bmZS5IwZZ4cAi+xZVK2B9MqgqrXD30s+vjErilpHAjnF6n4dnke0MBH5nlZ?=
 =?us-ascii?Q?E4wMaQx5IqDwfNtxkuSqGdSP3M4dRIBBNWsmZUHs+uIGAqmNFWF6bNFQfuCw?=
 =?us-ascii?Q?P44U1474vHXutlm2eaLR25P/skRePpvRuqWPBxcL7AKoChquY9yUvTrdkehV?=
 =?us-ascii?Q?dRneZhEcDcFV71rgSy0Gn5V3U982E/YbPILFZU3NS6NZYCQr0iH+8zfhJW7u?=
 =?us-ascii?Q?ZHkD0S/ROP6GuZoDch0Nm41bjx1Xfk3RfP94eLH5jU3NSNO253bquVVoVxHq?=
 =?us-ascii?Q?qn6DA1K8fUfWuTocc3uIKUJrBL58CqWsd0PwWbyNBJRtds29GZEV2toepFZc?=
 =?us-ascii?Q?BWuQOBZYxV25yJA+OxRKUtXA+BJQgdeglYNatgvMPS7eG4OT6wpOduIFZ0Zn?=
 =?us-ascii?Q?NvLBFIfywNxPDFApVLg82ns8YB/Z5vK8Xlfs09wsqHB3pWNfLGW+BmIYxKwB?=
 =?us-ascii?Q?sfdo2DQSRzRvbw/Om6I1SbNw8mRzKKKRTMK+rRFUKeI0z0Tw/D/aRxSl5r0g?=
 =?us-ascii?Q?7xCkrCc5SZ/Vudv92R84azKL60vtI0uCn3Jwl5idxsAsLbM7VPY3VLpHpKJ6?=
 =?us-ascii?Q?1mnZ3S99HBRGcjn5EJGcjuXqfp9TlWt0bCMHC7EgnSYIWbMew3apEs+Jvx51?=
 =?us-ascii?Q?uaqQuvieqhoUqusGF9xaoFckGPwNiXCI++bxBNwKGE7+OLqW+1MDL05V5yLZ?=
 =?us-ascii?Q?dsOTBvWH+rnIVsMigzx8/wzjh1fDuHf6fXAguFEdewXpkDRZSZcy5dM4U6NR?=
 =?us-ascii?Q?Tu4LVFtIuHrgF/qcOH7fFVXfcmqv2CZfgiJMM6rGGjCmKtwu8Ti9Ot8A4rWw?=
 =?us-ascii?Q?UfbRTMNNBA6Spzp8tDaR/bObnij8d3krKnGF40WTJiPma9DNewTjq+CDdPLC?=
 =?us-ascii?Q?8iE7DnUAUUHr0SAQM6NBTrzrDLF7QleAopbExKY/cnFg6HTOVE7S1+W5rnUL?=
 =?us-ascii?Q?w4gDkWX1JvGSbDX7uHe2Z1SMktv/41vostjXPfFM7Eqw4QQS3+Ukm9vwExfB?=
 =?us-ascii?Q?j1jqZJJLej+NsArUE7o0XtGbpl6dUC6jTz/iCmdLny/+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O7FYHJzy/1AueIbk+eP/GjOH3Vb/oZRx2i5/ZppBLS/peI9HJtP3ARzyu75a?=
 =?us-ascii?Q?LvnAfR5AFJRYM6flekVrXvsoHd8VPaRgCRARqGuOud99iQvVpSrgLhKxbm0l?=
 =?us-ascii?Q?Gnju4+IMgwr5uxf68hugnIP+vwQUVdwvzodxgM7TQdwxt+lQIDdWILa9Vnc6?=
 =?us-ascii?Q?gtqmbxZ1lgF9427O/7NMwi1ODThNgQtXjhuZE+IDGWoOfKCY4QFeEN9o7qxi?=
 =?us-ascii?Q?p6GmXID1B76qbie+XNqbkycEax6dU9D1ZypushBal0GAKyNO/vZW6AxjZFXd?=
 =?us-ascii?Q?OvlqAGbzdHuWiTn1ihgapMhXmzQ2dyxvLsRuaQ9G1GDkYAPkhh7cdeW813Zs?=
 =?us-ascii?Q?UPQRwBRKaEtgVuP6KcimphNldcCMSItrMhhVEliHgQJJ+/Nl8bVxdPxP6AJf?=
 =?us-ascii?Q?BUWWTjPIvUHQeWWkqNdGWyFaI88nxfyaUuYmnnIuFXlQck+z/hS7MNYPabVj?=
 =?us-ascii?Q?deLrL1viiQW4bTAXzYqT7VOR8o0jcLitKGJS1mq32A2WzpcYJ9MV0DDyLnDw?=
 =?us-ascii?Q?EqWVStj1GJ6Vj/eRI2sT+e+6TrrUF3HFZIgcVJ9WAgo+q3Cxb9ZrLEd8V99R?=
 =?us-ascii?Q?+mlNR1uHZHuFCdY1tEjPnO7l752Oxssm+WdQroIeaRwMzjuYAo98kz+VT2Ma?=
 =?us-ascii?Q?WcTrDcozpFm4PfU+zxMp9VYLfjzE4MdKW7TXfYboI8JeFVrOr8l1amcDot/d?=
 =?us-ascii?Q?Kw25/V30O8X+JKez3IZMEzWQI42Q/GuAux2KLXj3d9EXgnur1Wc0smD8EzYn?=
 =?us-ascii?Q?m7ZqQKRUhKVaY3+QN7mWRKPlHHGwinPfpy3A3gDAUUt5/lGbVJILRNtlCW2b?=
 =?us-ascii?Q?VQb9QjT5DPhtJD5w8dkNSCLty5pYSxqmtLqs4UTvIB7ttAPwr30osOPSiaaz?=
 =?us-ascii?Q?rw4WBvsaL53NUuwpVVBK6PTN5SdCw+6aPiI6Izu7movcQtcWaSy2ENm69FQH?=
 =?us-ascii?Q?mRZbZdhp/rYf01x7JXYfLgGT1JcP9GVLaSDnb9l/Wl/5bnrUqxB6z92L3Q+W?=
 =?us-ascii?Q?zZEySrDjjJ5iGY5dT4uhZO2J7VGodcDDO1net8kOZCEBsvMSTwuxn4+T1RZA?=
 =?us-ascii?Q?DOKFhqBKJy4G0MUECEPYRpUm4hU6P989Wj9G8Itm0oPXJeh2KGPhD7chGjGb?=
 =?us-ascii?Q?HZtS2SPBZ0Wo3Tz7IbYHu2ZEwfYYoNf/YlsQbUmkDFYapXjd+KtZYhi2acp5?=
 =?us-ascii?Q?z1x5S+B9lB2/IKythGYDB+k1UlzJqPlaW1xE26jJnxGB/AZkpb3+5utCxPIT?=
 =?us-ascii?Q?7ieZJK9Vd5fTIVRfd2bUlnld8iWnj+X7JFWoj0MDex5tB6+SM2f5J/V2Gf5P?=
 =?us-ascii?Q?AtGQ42HG5ZheeAQDoCfwEQJPv+1TP1vOGHe1ESAe1Al4cpbfDnJJvCdb4Ewa?=
 =?us-ascii?Q?ExPLah05w+vDYRwtJF/ExGYrb3IUxQiWPywFATZAH+Yd28u+rLN8tBqhOJ2T?=
 =?us-ascii?Q?R3YrsLUQZc9BdHG+WNGsDJRULqcoNgcIYa8miLhS2qcWcrU/LHVODuI/a4sv?=
 =?us-ascii?Q?E4+O2PGZ2mCtYFm0k4t2/ukwDzOGv/ZQf2bJjMKrMtDocMbc36ZTMNAbyIFl?=
 =?us-ascii?Q?bRN4P4KvuL5zUjJww/b/5rYEzxQeTFCVDW3NStIv4fC2WnhskDutk26LhpzH?=
 =?us-ascii?Q?YuEUeAIZKCH6x3gYop3VF7Qm6XdilQY426QXkJGpfRni6L7tskCIXaKXl8XR?=
 =?us-ascii?Q?+IRmNANMuLobQkdxg+gBtz4hSc7aT6OIhWWan6GcfOAz7+S9XuMTkmbPqBUD?=
 =?us-ascii?Q?y26sNHQwUQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305aae18-e1a5-45af-2605-08de5f1288e8
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:43:54.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heXTA/cgGXFQHLvx/vfzzoHFnuIsgNQQqgI4aQCHY0L99l5vouLjZDHg+BGzE/LPoeeqDj8bl3AahxkYroZGhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_004357_077569_4F15E922 
X-CRM114-Status: GOOD (  13.96  )
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

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences. Reuse the new
imx93-evk-common.dtsi and add the board-specific changes here.

Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
11x11 EVK board.

Function differences:
Function	i.MX93W EVK			i.MX93 EVK
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
PDM MIC		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 23 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..d0ea746c59b8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
new file mode 100644
index 000000000000..9832b82b6ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93w.dtsi"
+#include "imx93-evk-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+};
-- 
2.37.1


