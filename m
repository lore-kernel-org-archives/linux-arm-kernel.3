Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490D1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufz8OCbOlxhLA/3Iju8ocKEctXzcldKx2BBjBG9diL4=; b=rUb3+8Js7ixDConcrY/HGXzL+0
	hlUSqL9mvbUDXEgwKQNHCpJAYNebwQZ5htRSSqE135hPEYIFhTjDrMZhD6ZL4sFDso0DuNFbt0Dqx
	D5Afi6sHcUfxo72WXsPAyLn847WQVOm7/tWJhD5hP8ILojLgVjgKZ/UAQ2t7ESfutdTc2dHAatTSu
	tW38ObNErhTgS7miB9NUfEOElDMXKePSGawefdiPoWc0LYcePgITcUQ8kxW43OgTuBFjrh50lAyIS
	z+1fzmfsf11DnEGjHFod0jvQnwQFmGWm84rRKarR0fct662O9N472DFFL6UkhMcHM9FhSqKShVBlZ
	xLx8KRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNzd-00000005KsL-42g8;
	Wed, 26 Feb 2025 20:26:57 +0000
Received: from mail-dbaeur03on2062d.outbound.protection.outlook.com ([2a01:111:f403:260d::62d] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNwd-00000005KB8-4812
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 20:23:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6tjl2deMG0qafw8wiIOTKiy21BFkT0Tpm2JT9Su3rcDUU5H336YWU9QiejRhFr4c87nXJyrW6+UjrikbNZ04DLT+aMsapj4X7u7D+BZLg+EOiIQEdKIXlu+TO+m3r+/C/ghc060CzDOI2odvP35/+mcaGl/Ao9g0/JFq2hrwn8wVqG9e2CBCpN0AHngHDUeGZDPmPLjrEEAs+Ky0GgcX6DBp8MAGgKl4ygcY0/cnF2HLY61XF+d8Tnzj9P9C11qeNUXUj/w7jUs4d/PL5FgHsq0CywgPqzEBWDnPWxmb7s4YfsnQZx021f+F12vfGQ6mRLRdbRu2GWqjclZcwZ6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/towYvmVIwltrcSrorbC6S1ociVn3zAHMPJzXgkfHZI=;
 b=xLpfkvGd49mv1cSsS702lpSWF4IrewU7uqPGXi9ZW7FEhH8UR7kdPeJSMhQH+T/n6RiKS2pg6JGm1XzRAHUGyIAN8rYP7aF4TaQg+c00lcVIcNCVLINV6Dljbcjuow5pXavFTchpWzinbMhc9YkrVuO3QELDTknKngHRxxYIpdaZxXhNaKjmoqP/MKJiteZ9R+s4Q0l0tcX6eBP1M1tnmngQxOiUZpp5hfSnGflqmvXtT8XmJ0nA/CKGLpgC4LpfR4NRf2eIUOHSjZ2BSiUTFe3MC1w+y61PwAv/T8AKgbTdoU1F6pLZzL6gmu82H8IgZkpH4qhx1Jf5GH0tpG1wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/towYvmVIwltrcSrorbC6S1ociVn3zAHMPJzXgkfHZI=;
 b=SoV4mr1lkF8vzOuWq+ldbZVQQbrxV+AcslJxq+G2m+keBJ0bmVonAHAfEMdID6YevllsBHr2YkyPdLpuj7k/DSuQ+A1qY4NtnP+bSX1aVPygMtj3XQ+sdXJSwrwxNDJwk6IVLU6f2iK6hIKUzDwXAFg5xrOR99FAS8+8a3LDcJ9O3OKt1IEr6Wbav6oGp4MLyEJ2GwmW9+BZqjbHQmeN1nqxgO6XyCfUZh8IlZ7G31NtOVFe6CsBJQlGQ9HPu2NSUCHPh4iO8PXkPstvR9Muvpb2sJ8u23c4513x9OMreefcACJJSwESGEg4eNIl89x92Cn5lePYvZymCkBaLSXG3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7999.eurprd04.prod.outlook.com (2603:10a6:102:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 20:23:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 20:23:44 +0000
Date: Wed, 26 Feb 2025 15:23:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map
 property
Message-ID: <Z794R6RX4DJFZlMn@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <20250128211559.1582598-4-Frank.Li@nxp.com>
 <1995746.PYKUYFuaPT@steina-w>
 <Z79B3pH0BwxJseHK@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z79B3pH0BwxJseHK@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf18fcb-78cf-4bca-4b6c-08dd56a377a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xSrS8Lfq2pnE6Cy7pT9hwgNKSTPzAHkNbVrg0Jdud79sKQboVfAJxCLKCl?=
 =?iso-8859-1?Q?nNRH11hYJxGGQOluICr26htCZ733x3b4diMUG280fd8vgqpjm+YN/fu8Ux?=
 =?iso-8859-1?Q?ejGsL+L4kJ6kMKUsbveULopyqiLVf3Z8ogqRPw+XlrtgJbuB2RzH0MwLE/?=
 =?iso-8859-1?Q?vD7dTGvmsKZbqn1/CYJaPubp3Isc/JByo9RtJtIHiFVo42qQohmCznGuN6?=
 =?iso-8859-1?Q?q/yF6EGosaTcihvmW1kgfmX0k87JUdHkTYmmWONT2pbHcv8TZ653PL3im4?=
 =?iso-8859-1?Q?KyUiXxXkiB5OLQ0yuee38uzQRWDc46PKZ4iy1Y78KPidTs9U7VDSxVWumt?=
 =?iso-8859-1?Q?JLENT2WoNCYp5IrjMHQ1mIBA0MDT8gZG5W7yCTkVcx/iSp83c9JTWOZz0l?=
 =?iso-8859-1?Q?Dlh4g3LDZKV7Pj1RbHjPsFpkIQUhqai0U1Yfui5WaLpfftY2ROyVOXLGRN?=
 =?iso-8859-1?Q?fAJsEzA0v0x4+84aZGl1LRJmJjtPl1QEcP97MJ4BjiMW9BhSDiw2ZL9En6?=
 =?iso-8859-1?Q?bH+pN4ynLnLvaloEjmFwKVVFubVczCG7UAfM4HCRGC6BiZT1q/Nl++BEW3?=
 =?iso-8859-1?Q?mXSSt3xPaDS4Z3t4aSYQ0wibtp8UijWoTzVlo+IWKxb6j+e1pEmR7aDr4b?=
 =?iso-8859-1?Q?gMvHmJTX7o0n9SMbh0U3tKyS3otmFPi5ARxZCSCOcu2fBH+tFDBnc39Oql?=
 =?iso-8859-1?Q?KaBWRStLyJ8wItv+D/t9h62+UoSJz7610l9OezrRrkByxYiryh+mh5PYjU?=
 =?iso-8859-1?Q?Qdi24PnIQnQxv2fOdenKRdoRrOggfRUbgn512Fu3qW0tVm5Do0rrxskEP6?=
 =?iso-8859-1?Q?s6VrTToORbfy/ZnD6DqPXiO7HSAbdi7AVHITKSYvgvun9Wcut3I3zNb7Bi?=
 =?iso-8859-1?Q?6i5l0lFetoS16CHvpKIy9Cxsvd7UcqRyk9Q1EfYbS5a4zH5EW1KvIJj1aI?=
 =?iso-8859-1?Q?gEMy0L8xTXmz61YdyPOwLpuoU5Jzd8Tv5vbzsz7gxEjIl7O26pvaLcitqY?=
 =?iso-8859-1?Q?BGkOTrzycBFmV/w+Do3F9WFsQJkB4ZY5ENvNyY3NQAI65IcjS8GSZbJQO4?=
 =?iso-8859-1?Q?xPzA5TsO/9WgNknEREW1TbY7DHn6YnRm0Bbnj77tHDINUOT36hqQ7o5uOX?=
 =?iso-8859-1?Q?ekfeaYNtQ0u9z13lNSTIZT86hDluPMLJWMlwfJmiO4feIdJbJzgC4zVfUh?=
 =?iso-8859-1?Q?ERJd1l360eO7c5ygH5NUkvWqja8mJz4HHIJaYLcf8ofTye1u/AvaFXtXZL?=
 =?iso-8859-1?Q?1hR4SHejGWFHECE7fhxWy3Bv2EnS6KTWgDDFzWwLiRUbCcnHC6yTuFxJWy?=
 =?iso-8859-1?Q?+Qnj6C/d6Ie4dPrrTvNQbAgHzLjqUUgOALpS9iZ61lO4V2TFkJR2nDnWX2?=
 =?iso-8859-1?Q?EAiCC+X07FiHigiWZ/4FWiJETbKRPXhWh8uozpNRHHIoGHakVHgEPmtPut?=
 =?iso-8859-1?Q?xNWf5MF5BjxqHCy3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1nAhrlj/RmQBLKJ5WI/j68QvxKCNnAnEoUt3cU558+TXTplgxKhu3Qk8rO?=
 =?iso-8859-1?Q?p4d38LZebz7s9Rcw2hAgbjS6JVQGdwv9ML5KcdihUjFXBPrITh4parllMX?=
 =?iso-8859-1?Q?cOEtDqwtISZKe3UNBIG9UctIn9LkAOtENazM4stmNDi6Hl/z1yW5tH3DNC?=
 =?iso-8859-1?Q?rDLQWDuDYpz6pNaWENJssrmuLL7q4VS3onL1dv8irXy/Gdk381ZKKhxngU?=
 =?iso-8859-1?Q?jo++CUW8nPJMXP9Pm3LmN64XTP0L0ofdxYYUi/YfXqcSCeGf2MRu4DBf89?=
 =?iso-8859-1?Q?fnQaPt7SoDx8kP5pELS38O5YOf0Sz5qb7p67sX32L3m+KnWNs2tC13Aik1?=
 =?iso-8859-1?Q?qB+UVJhYtjNNoWd9HCZs3STtqxB8hzV+HAdgZ38tMEkBCxCnYQGHrjHEKV?=
 =?iso-8859-1?Q?WtvMkWpMH2ZP4hjb/1y1iBZSpiv/rroR1nU3DUhF42Ms0igxfI0VfrRkxI?=
 =?iso-8859-1?Q?rn+aG484p73NLeE7DErnBifT6OEZiz8j4xAq5Ay6+SCK1j+0ja+8UXZ47D?=
 =?iso-8859-1?Q?5G3dWxjrDrKE889OhYod60JLRswca0Lv8ja+wWCwlpHDjDngN374mBh3eY?=
 =?iso-8859-1?Q?4LLPaFJ7CBvtzIG17+Or3Z79gLnNhl/6mYS8zSkuDg6c4Ive8XHPZetAZW?=
 =?iso-8859-1?Q?uml3yV0wQDTlkpsou/fssAx0bmFoBTx/9THxmyFECc8soCamlV9ozNv8bc?=
 =?iso-8859-1?Q?SV+UNkhU92GpD3Obo91ysAAeiq3uMTPRoeVRGVrpWExVO94wkAN+IQVRrX?=
 =?iso-8859-1?Q?rYrj2X8WXdmwVYVztrUM9s9I8qgzyzTSoQzIDRSCL07J2/40nOY/f+ktQw?=
 =?iso-8859-1?Q?eWRsXYwn4t+DBc4uuuonq9MW0HuNbEt4l8jYE3mAjOimkyd66Ge8CP/xI0?=
 =?iso-8859-1?Q?R6txlAJM/w4HFIXqD01toctsgYyVRl/3W8uCAMCLP+1zLRBcGf9mCCeRpE?=
 =?iso-8859-1?Q?7k5ML20Khm9/BnVFBCTuEJnzl+crFSAmIWT9CTAEz42+0yOr1WtvnDDqw/?=
 =?iso-8859-1?Q?HvevR6lXMKHAgrx2PmpdTSZLduPrwRFm0o1OKTv5OHWpF12eH8AgJO28Lr?=
 =?iso-8859-1?Q?eD0Lg5XvkhLGPXdyyICzPZ49G/p3ZnjBlGh1K7PIs+clWM4lq8uFcRKM3a?=
 =?iso-8859-1?Q?GfJQALWzImVoR/fkj8wcNeN+wYuJDSXPKsZUHOT2aw8ByLUUFOccxsfgf9?=
 =?iso-8859-1?Q?YqTqFfVEz3Xx5JJFcm5jqPogWeOx2SjByyZRca31jz8i4mQGefWMLKwHgV?=
 =?iso-8859-1?Q?sMN3qqichyFxswO/D773uuZC5qBXaSn0Cgy8/dUWA/C7XnFQ8d9Wvt4e5j?=
 =?iso-8859-1?Q?rJ+obeZy5iixCLTfoyl4MkeG3aySfvz5ltO5Jk/Hn1CAvBCcCAdAZoaHIX?=
 =?iso-8859-1?Q?1Q4g+SIxAuI73TvZjQWivlAx8QrgRCWi8WVxdCUEh6/yk4S76gTZf0hlW5?=
 =?iso-8859-1?Q?H1o/qv8ce2TuRc/cDoCL1/lQYM91LSGzyO/27vqHJRN8l2idXFW1Ou+7dR?=
 =?iso-8859-1?Q?w8llvVFmzGVI9X7wA8f92yMj8onPk7BiAZb01kWe9s/r2Qgm9snFLtggZN?=
 =?iso-8859-1?Q?0qSLFunKLuCkr/JLAYoNqAfHv+bVYvQ9JOXgS6+tBOhf6QJLfUUmyHnXBe?=
 =?iso-8859-1?Q?o6ArRSRAsCyiqCs6zdBoNjXCuaH+wOQm9Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf18fcb-78cf-4bca-4b6c-08dd56a377a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:23:44.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3UwUCg9W9AFYVik/Ia9CvjFUg9y8jsj2ZwQhisXqMJH2Tvs+IOJmyQOBejnJkXpOYgXL3DpbX/YjliKX+8Tpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122352_032689_A036E36D 
X-CRM114-Status: GOOD (  29.72  )
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

On Wed, Feb 26, 2025 at 11:31:26AM -0500, Frank Li wrote:
> On Wed, Feb 26, 2025 at 01:11:37PM +0100, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Dienstag, 28. Januar 2025, 22:15:58 CET schrieb Frank Li:
> > > Add PCIe's msi-map and iommu-map property because i.MX95 support smmu and
> > > its.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index 6b8470cb3461a..2cebeda43a52d 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1573,6 +1573,12 @@ pcie0: pcie@4c300000 {
> > >  			assigned-clock-parents = <0>, <0>,
> > >  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> > >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > +			/* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
> > > +			msi-map = <0x0 &its 0x10 0x1>,
> > > +				  <0x100 &its 0x11 0x7>;
> >
> > Aren't you missing msi-map-mask = <0x1ff>; here? Similar to pcie1.
> > Either way, with this change PCIe on pcie0 is not working anymore,
> > regardless of msi-map-mask.
>
> Yes, it should have msi-map-mask. During my test, I have not enable enetc
> so I have not found this problem.

I check dts again. There are linux,pci-domain = <0>; It should work without
msi-map-mask.

I am not sure why 0000:03:00.0
                       ^^ bus number is 03 at your system.


>
> >
> > Without msi-map-mask:
> > > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > OF: /soc/pcie@4c300000: no msi-map translation for id 0x300 on (null)
> > > r8169 0000:03:00.0: error -EINVAL: enable failure
> > > r8169 0000:03:00.0: probe with driver r8169 failed with error -22
> >
> > With msi-map-mask:
> > > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > OF: /soc/pcie@4c300000: msi-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > r8169 0000:03:00.0: error -EIO: PCI read failed
> > > r8169 0000:03:00.0: probe with driver r8169 failed with error -5
>
> Can you try remove iommu-map and keep msi-map? then remove msi-map and
> keep iommu-map to check which one cause this problem.
>
> >
> > Without msi-map/iommu-map:
> > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > r8169 0000:03:00.0 eth0: RTL8168g/8111g, d8:9d:b9:00:16:10, XID 4c0, IRQ 166
> > > r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> > > r8169 0000:03:00.0 enp3s0: renamed from eth0
> > > r8169 0000:03:00.0: enabling bus mastering
> > > r8169 0000:03:00.0 enp3s0: Link is Down
> >
> > pcie1 works as expected. But this is only a single PCIe device, rather than
> > having a PCIe bridge.
> > Any idea what's wrong here?
>
> Can you help dump more information at for PCIe bridge case:
>
> imx_pcie_add_lut(), need rid and sid information.
> drivers/pci/controller/dwc/pci-imx6.c
>
> >
> > Best regards,
> > Alexander
> >
> > > +			iommu-map = <0x000 &smmu 0x10 0x1>,
> > > +				    <0x100 &smmu 0x11 0x7>;
> > > +			iommu-map-mask = <0x1ff>;
> > >  			fsl,max-link-speed = <3>;
> > >  			status = "disabled";
> > >  		};
> > > @@ -1640,6 +1646,14 @@ pcie1: pcie@4c380000 {
> > >  			assigned-clock-parents = <0>, <0>,
> > >  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> > >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > +			/* pcie1's Devid(BIT[7:6]) is 0x10, stream id(BIT[5:0]) is 0x18~0x1f */
> > > +			msi-map = <0x0 &its 0x98 0x1>,
> > > +				  <0x100 &its 0x99 0x7>;
> > > +			msi-map-mask = <0x1ff>;
> > > +			/* smmu have not Devid(BIT[7:6]) */
> > > +			iommu-map = <0x000 &smmu 0x18 0x1>,
> > > +				    <0x100 &smmu 0x19 0x7>;
> > > +			iommu-map-mask = <0x1ff>;
> > >  			fsl,max-link-speed = <3>;
> > >  			status = "disabled";
> > >  		};
> > >
> >
> >
> > --
> > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht München, HRB 105018
> > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >

