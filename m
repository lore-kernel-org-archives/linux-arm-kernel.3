Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvZEWV5+1gluiYffVenZPiFIyE/eX6THHLAEROIDwQc=; b=34bqiIhDsfCoj8NL4QWuYy0XNH
	JNdpD3XwHPfhymoBPKG/wHSDnk8t0EiBZ4aHMEyj+xQMTbAbJtfaKMTtRTm8G4YaeMVhb+5fWQeIN
	ou1xp1rPdiA6Zn0UU01IIjPaDmyOdEEVlm/QLM4rLH16TFAbH8v6Nu3QF9gAfIZScFDj0K8eSarmO
	tVqhtcdExikb1VEJwErzKYLlGuC8A483+RYExsoYD/I7G2dJNszTi51fzGc5gQyyLdmaFrd1xdkMa
	WliWm9if5ahXRIljjeBkxj0OjJjwFobQkNe0ywu3jzhtKiKo8q9YFvWgQRKUXnICe/RtJk+XwPYmp
	3XYQMtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdX6V-000000097gw-3tTk;
	Thu, 30 Jan 2025 16:09:19 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdX5B-000000097aL-33HZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 16:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4R6VcoQ6jfvhySdHGR0rrlzYWaxTvUWSYZOnKyzzeeHKeALCWSWT3Ft8bPrnP9jBRd7q/lKGUhtqw28KiFIei+Z8n5T6eWEXjcMstSXp8qyS39iUjhM457sOa1v5I5DpveBGbUw4uIV0L/fsKSxQw3pZgaJ7nnWLxgmhT+uZzhxnu8e7nNFhKQkEcaqFi0fg6KeLApNEj4l+cykHEeohuOJseHPybw6N53RClunW9XqERC1v5Yn2+xsyutwZPszbSXYD/2Y+q2Q+J5Mtdj3WqEmKZmSojG2QuUn9SZnlHiD4f6pSwg6ZfN2ZUbeHyY44RLR5AuTzCYOMLEHSnxx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvZEWV5+1gluiYffVenZPiFIyE/eX6THHLAEROIDwQc=;
 b=hHSiDBsaBiOZCbyQKkZei3wzQCvxgdkpp55fE7LESM89HGY8GGvu6UtyEzVMhNHj72lM6zI/mM0/vXN/VTc/QeJLq8R+TEl+uB5aytLY6vNILyG0wIyF8XPqJvXSHBUEJ8QZMb2KhiA7iLh5pIirGPSxgG0EontzraLCi7fYOdENfqv0HNzmcFfLDR8b4ypqqu99VgA33m/RhtPdfm+8PwhpPjlz86T3eQujOhLE5Qu722OqnA3fAVVcDFhCphLphp/rTd4MWpSuzr15VWsjwczEERBRhmeG9Mq+PPAq7dHgm2d1P6dI13iFy1iWMBmqx8xqbaViorENjihq5SkpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvZEWV5+1gluiYffVenZPiFIyE/eX6THHLAEROIDwQc=;
 b=HoOwF7eF7/jVvAYRi0ETtITZ9X903tmKMbUGG3z1o8CXhrpmTJmyVkFupwapykLqWipPaA76K2Bd0rRgDKWbI7fZSIiUKdl3lh1kZKh5+cEtI4QHijF/6lhQjGHtjyKGHqYYFem5OLZ8YLqsZX7CDNKjmMYaA4R+uMtRnIOP4F++31/JeX3dGldt1489+yXJiaQ7bhqt38C7aHGsykILBJ8dZuE/YqgsmRHrnP8qA+z0AJB7r5hZIaMRMGyrsvcZK+w0tniYbyV5jtO33kesGuMl49Wav+cNaqCJsWMR5kBOt5u/b//sP1w8DCza4ol0aLnBi/aD4nu0FgsfzllcZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8373.eurprd04.prod.outlook.com (2603:10a6:102:1bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:07:53 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:07:53 +0000
Date: Thu, 30 Jan 2025 11:07:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 1/7] PCI: dwc: Use resource start as iomap() input in
 dw_pcie_pme_turn_off()
Message-ID: <Z5uj0Jw9/UQ/wE0e@lizhi-Precision-Tower-5810>
References: <20250128-pci_fixup_addr-v9-1-3c4bb506f665@nxp.com>
 <20250129231937.GA523281@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129231937.GA523281@bhelgaas>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: fe36c0d0-bc88-462a-3ee6-08dd41484085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AsBFToRDeaQYMiJVs6fdkbRWRDF39AuAljmgayYYcf0goBglTTHNazJlDRsJ?=
 =?us-ascii?Q?XVD7mhc5BMMnt74HfKmiM8QuGG0BNPPHpGsq6uebXqGQZcW9jrtvApKM/njI?=
 =?us-ascii?Q?AwxC3O8Oe/GcS4n832BBrv/IcnMbH3LlVB6NsMAD0CBb5eBoz6cVOApIk2Fc?=
 =?us-ascii?Q?i5bOqTOOeAvPMJGY9SHUK6D13keqaT1yLVjPV6mmePtXPXIJ1CtxmoW8daAC?=
 =?us-ascii?Q?nBb4Irq/mgMAYoe+BdzgOkFmbG42ny0GDb8Dg01iumkVnUXSACqsno1AwiQZ?=
 =?us-ascii?Q?v5cX1N3VgDG+dSo/+uZVPOfyhjnuq1xUavsf4TtA1Djok5H+AgTU6vZX1y07?=
 =?us-ascii?Q?GrmuKxjFnFfvoAGkISJWpc9dlumSNcTJyVverQ7xn9bKbQk3+Tw36INlIc1G?=
 =?us-ascii?Q?98sx0xyBK58kBnYeTVZYKc7kiW/FxqRmYHflOPxOY2KIf1UcTl/VkktmWhYA?=
 =?us-ascii?Q?aFQwkTvTZduFHWXbpcZgJPOXhvabvIDHDbZkRfgucFUf/X+O2Pr8H7d5HboQ?=
 =?us-ascii?Q?ilBREg62WAGgJbRHqBGXemG0/PvgIEiGWBOAXSbAZe9RRptQdpXCeLQYP+S7?=
 =?us-ascii?Q?JpSQm8oVXg89r1RespqDE9zEyxt+KEmd0NWmPsXHF+tjFobedock9vGX1xV0?=
 =?us-ascii?Q?EYg0s/Yl9CPlogYvWALv1dUoQJAq39+BMepm9vNQ4nw5vwHATcvdVc5ZZKET?=
 =?us-ascii?Q?A7HXwgk5U/VHJVvGP8kGBC8jfqnLiKqVM91QYK3Xf1nREtKN8NQ1Xr9mkFCy?=
 =?us-ascii?Q?mQw2r8S28833o/WyoIvrcbD+QrAxUardnMORtENqURgfwLA0R903bMghGoT/?=
 =?us-ascii?Q?XCnIsn+ww4JO+ni6BaK0oEaNLy9ka4N/IXIZEg2wmIazSMESuDy/VNz6XAgv?=
 =?us-ascii?Q?ogbTGDOwXtmOcCP3v4Lvou1gVhqvW8aYpJsV76+hmw9bDdOY8Serk8qRglgb?=
 =?us-ascii?Q?6xC5ICSj1/mDYM4vQtv7k5pYMVGjxApbWJgI+2GEyO+wJr4REL2nTecWu4BS?=
 =?us-ascii?Q?mOm6gTyt5c+YurMf/zAdQeVqDos7YzPfJodM6HJRxSOFbIQ6g2YxdRC52UzW?=
 =?us-ascii?Q?dxfbaFNw9Z2w39OdG4Dfwtu1BAz15o5t0K0YyCs8g8r7isWdESyqFzusFUgy?=
 =?us-ascii?Q?zDPuwGdq++oLGX1twptvDYhpgjlK9mCJgcNhC7BBDdfGaz/76y9B15gIoVCM?=
 =?us-ascii?Q?BbVpuOu419h9jafTc+GsA577qsKMLBzwmzoxKd5a5NaXsKadyD+RVzbCbxvN?=
 =?us-ascii?Q?RZ9qKQmHh0SvIx4BY+ui17xvs/BGoh6RYmTlA2i9pJrUsv+Ca3jwt5b2QKrv?=
 =?us-ascii?Q?pIK6HBfNkKWCjiu5q99Q/vNxMV51z6nm/VLC3mrgKrZdwFQ2qGeCrl2+l1ad?=
 =?us-ascii?Q?s7QEfA4WUQ16TbPQcNGSgsrBiuScmNLzs7UH/5oD5GFPb04y1oXyS2wiLTZ7?=
 =?us-ascii?Q?NqF9oUkrqX6oyCfEkDifT/crpRke1aIX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mt8RaFFAK+vyz/xQrFTO/A7Be0//2tac1k8JFO9JEGsYiWrw49e+nSZnSROT?=
 =?us-ascii?Q?MVvhOIwfZc+GLRgF2FC3Mx5Gig2ctaWwljiRp25pO0ov/ZiFABl0stWsFqgQ?=
 =?us-ascii?Q?kscwoE4ZwD90rB3gciYpe8Jb6Kk8aTJkSDWmod6CmONG68FUBnbOSuPgQEaw?=
 =?us-ascii?Q?E9trJ/4yq6FJj7fohaRm1yClYZrwVsF06NsBFSgkRSDDjzFE5gYD6y3RP878?=
 =?us-ascii?Q?f7Jh+4KXpy/6Zv3QHZ/Rb5S7Q1yX+s3MYqFpHr1hb3HDX09nT0PDJFA/s62T?=
 =?us-ascii?Q?hay7CHrtD2SVHFa9HaL6UPiWbkRlQSM/fBPzWh/jS7vvRfT9LXvah6EsobyX?=
 =?us-ascii?Q?FjccxWFhdqbt98H+5oqhXSCS3BDvOFHgMEEhjXP4SdHHf29eV75uI5F9Mu2N?=
 =?us-ascii?Q?EEbUa4G+/pFza0cIM3jeineWDcWRUG7qFTD2hVIsIotvSSGEpJf3Z8OAcLO2?=
 =?us-ascii?Q?0jzlQsGz+W/Rf8Vleh7WX+Khr+8b18BWzncZpQo7YumxRBuwCRe4zKugxlmF?=
 =?us-ascii?Q?YRJZfEHz4jdvYA1dgHjiOFlYKbYsszAw1KmYQnfSNeQkoB2izZFuOaVfTgW3?=
 =?us-ascii?Q?EbS558CyUdSq9fKMSl+dbwUA60kDmXYHSmS/89RyLncMXRev3CPdc+J2lkyp?=
 =?us-ascii?Q?SDGHPwog39o2S43Em9j68zG5XtWtZ8vKwPNU0Pd+Fh8fx6yMQ3O6YPGkwkv6?=
 =?us-ascii?Q?mLZJSmQhvRt5pVzTx+oe7TEWc3zw9O1C0GX/TJ+9sLJSaot62ej2CdfJp9Hl?=
 =?us-ascii?Q?yB4PtLN3kActZTPLElyOrledd5HWxqnUfk/BuvVRXu9/I2XonQNQNA61mbP3?=
 =?us-ascii?Q?Elh54ppyKKjlcF/WfPMFcqV5erioCQxg7TKBDcdGVvZXCx8b/OaKYkwHB4Mn?=
 =?us-ascii?Q?yF+h+hLYT5GGFRvDeDq9fGdDXqjfp2H8euxqKkpEB5iki1hEOYTYM6b27yoU?=
 =?us-ascii?Q?+qZyhdlpw+XA/yZ5Uv3tg05WjOYz9dCJDbk4PMKE0vfM54W6xFOyL7mAH6bv?=
 =?us-ascii?Q?t0Q/c8G69Vp5uO7Rph9JuPP2k+MCjvewRRYSUt9yR76niFSZbeBp+dMq3xKc?=
 =?us-ascii?Q?IwThgl88yrcI2ixIcz0W+YQO1Alk7To3rrPtMSHPdvqU4ezuDA/MC0Rebo+q?=
 =?us-ascii?Q?5wK7QlcAWzuHYIcUhdx48Sm68r0FX0jWchSqqme390Us7cng2jHhnPk1nbmD?=
 =?us-ascii?Q?ZRvdMQL9Dyh3EOum2/3El3bfQnZfEXO0+l+4OVtYYa7/fVuRCa86ddI25dat?=
 =?us-ascii?Q?LNXJD8f7HKxvDEkwaED2zfsfP7EPUELQ3FEjPlU9fByXjTNp6xuOY0tjInYM?=
 =?us-ascii?Q?2p5DfrbaVA7MVMvrv3+px0+p5thrOURXtLTWDjeJEm05Ty0T2yqlFIiIf8GH?=
 =?us-ascii?Q?ft3lKH11NlrlUzfg2e1DO4NyGtWRggrDaeZ36zAlkdhfPzz+qAjSZEckScHL?=
 =?us-ascii?Q?/jGaw0Iuvod+tVnf03CZnLlrfjQOzDm/TDIwTHinYJRtDIYpfGeKsE3mm0se?=
 =?us-ascii?Q?a4A67G7yiGSfHyyTiNRyRB1N2z0nzxlMdQxJTBt12TBIHNL1Bhx1wdDhmo9G?=
 =?us-ascii?Q?yzdP51RmQNcHHXeB83cywk3lxuIOJDGOcutc4vDk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe36c0d0-bc88-462a-3ee6-08dd41484085
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:07:53.4590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G8W33g5MUFlJqA5j3BKk1F/1Hvx7OKsbRsT/VpPrpZ38n8kOqy3n9Bh5NOyWo9bKLcYuPs3QChJJN5ZGxB+SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_080757_769327_3B36F40E 
X-CRM114-Status: GOOD (  29.06  )
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

On Wed, Jan 29, 2025 at 05:19:37PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 28, 2025 at 05:07:34PM -0500, Frank Li wrote:
> > Pass resource start as the input argument to iomap() instead of
> > atu.cpu_address in dw_pcie_pme_turn_off(). While atu.cpu_address happens to
> > be the same here, it actually represents the parent bus address before ATU,
> > which may not always align with the CPU address. Using resource start
> > ensures correctness and clarity.
>
> 1) "atu.cpu_address happens to be the same here" is currently true
>    but only because this function is buggy and assumes the ATU input
>    address is the same as a CPU physical address.
>
> 2) We're trying to make a correctness fix, not a clarity fix.  This
>    patch by itself isn't a functional change because of the cpu_addr
>    bug, but without this patch, fixing the cpu_addr bug would break
>    the iomap.
>
> 3) "Pass resource start as the input to iomap()" just restates the
>    patch.  We should say *why* this is important.  Something like
>    this:
>
>      The msg_res region translates writes into PCIe Message TLPs.
>      Previously we mapped this region using atu.cpu_addr, the input
>      address programmed into the ATU.
>
>      "cpu_addr" is a misnomer because when a bus fabric translates
>      addresses between the CPU and the ATU, the ATU input address is
>      different from the CPU address.  A future patch will rename
>      "cpu_addr" and correct the value to be the ATU input address
>      instead of the CPU physical address.
>
>      Map the msg_res region before writing to it using the msg_res
>      resource start, a CPU physical address.

Thanks, will update commit message. The key change is patch 3

PCI: Add parent_bus_offset to resource_entry

Frank

>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v9 to v10
> > - new patch
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index ffaded8f2df7b..ae3fd2a5dbf85 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -908,7 +908,7 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> >  	if (ret)
> >  		return ret;
> >
> > -	mem = ioremap(atu.cpu_addr, pci->region_align);
> > +	mem = ioremap(pci->pp.msg_res->start, pci->region_align);
> >  	if (!mem)
> >  		return -ENOMEM;
> >
> >
> > --
> > 2.34.1
> >

