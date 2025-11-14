Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3B9CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fn0ve/t6caFAqoic0VJyxmB/9vjJfjxZX+MboCspRss=; b=kyObeot3ifAIk2C8UFBs8fziCx
	2fDgZMbDvmSlhi9s7ult5weYuDjQycNmXv0aTTN15YuWIiUDdRzDK125Ny/0NcGOjhDB61z/rhkNh
	B+eoSPYmi0Gho6Gb5c3ox244V91RtVjP21Wh57L2mU0ysw/QBRKFDlcGT471v6OBsDOXl+2Kie3qV
	MR1cFpb5b6Hq4Ep5ZMG/R+3o/kGM0An9TO6y/nsxxQ6MoPgEB0cSt1CI/yV+L7oZJzO3tIlyYEf77
	IlTuf0+F0hPtroAlGjPlJlcpG0tYBKG+iGAdesK6pFmWMoIgdBS+Nhksp3IaNuWF3GcuOkAt/0qU7
	in/nY8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwRf-0000000CiUK-0Y8i;
	Fri, 14 Nov 2025 16:14:43 +0000
Received: from mail-francecentralazon11013017.outbound.protection.outlook.com ([40.107.162.17] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwRd-0000000CiT8-1RFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r243LJoVC9+ZnhiGScf017mCPoBz7lV/tHHco6zXXBtfb+bMdk+4npRkJnpDwOwlUBdZSVNPJTpG8HnnDkdb/iyZ/MgO9tYd+zIld5XJGhh0KoluAtMxR1qh0HXUuYZhnQMpve9Y10jfzIynevg7izkOm+CqWjS7c8M1pNsXlqbZkhWtHCRdQ/YclU37zdkJwON5ScxazojAN+YqmB0+IYntdDfBUwd4pQ/y1VFvbBAtUEW+mzyUE9O47jbG0JL/3sXxxTr1rzRFNp6rPtIDk06ovu99XKsZOT9VJ+OUfHrefWteqm0pmbvBoBtlk2tybx7JxaTjuLIYBd/cBWeliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn0ve/t6caFAqoic0VJyxmB/9vjJfjxZX+MboCspRss=;
 b=Eun+ghIUVLY1lhhY0tWH9hYZHZY3SOMrgFpYlmYCBlquJBLhB9Ezz6gy99ElEnwHYWnUVmAInE0TY3VLEMTYM+K/mxveJx2ism4ctArm7BzUXKcYO+HWl/zIs6oyaQVqLdLj1vmNdMBrp1+VgC+UCuW0uZ5AedeIjKL0/1XP8SaC2SuhJp6f9LC69Ju3cy6tp35NVywZZvcSJITJTprydK7lK7mHei23S8WSVB6YyOzfhYsYThIsScK0JDCPH8FaP6oP/gq5gCS/I9SoJ6xLXgqHhZX+kOC7X2eeatFL2KiwLi27wkuetiezVUSIC8Z3drSP36HiX5i4jnouxQcADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn0ve/t6caFAqoic0VJyxmB/9vjJfjxZX+MboCspRss=;
 b=FiqwrGCIWV+lwmE0XGc5lU2bJbFPJQmoGyTKYd3miqGkVu3XBSGPiKzElrJ3QCLIgIfdY33cFBAH2z6Frx3wLufybnzYhFkjHTJQlJvOsaFfpyaNCq+x2evpr4M4f8ynMhTXcUTMCiOqlgzgum0/tbvpzd9egk4nuc8njXzrSj+vSh68ViTSQfuvFIPB/zbde3hCcgROnVvu/me+nr/Xv1lzpziYlt/e8VWE3Nee6UXJ/zVL39tCicZSHPRo3k0n9LMsoYeTVpjUwerwHxoi8l55Y0htMkVSz2DhPi3wMLnafvKNIouXVX2XM70Sjig11o9dibA9JkTJQYtNfivyLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8494.eurprd04.prod.outlook.com (2603:10a6:10:2c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:14:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:14:36 +0000
Date: Fri, 14 Nov 2025 11:14:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 4/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
Message-ID: <aRdVY5aMCjj4fmDB@lizhi-Precision-Tower-5810>
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-4-Frank.Li@nxp.com>
 <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fc7912-7476-4de2-2ace-08de2398e772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B4m8r2VQbamyJumJN60gL6weNJEYcQ61aNkI4ZLdefNLHI7ylNCbNxOcBwwY?=
 =?us-ascii?Q?ArEc0W35tF0q8712VzrW8rLfExZuxw91WvVBxBe970o0VjYTIHahKJ8EL7O4?=
 =?us-ascii?Q?sG1T5L9nXdCOqhu8C0ESSDAj5Nu5f+OrG33ENRHOqN37ZqNj6CVbaNUKagsQ?=
 =?us-ascii?Q?I9jJOxBqQ9kpSND7R2tV45N7jcxOeZZ+6Xj5bm4H16TJvJLAax3YTKQfq7lQ?=
 =?us-ascii?Q?X9n5SgqbAIZA/towIiaDts+mcUHy+bIjwW98KmsWJoRG5VuytgD4YIv6nWqP?=
 =?us-ascii?Q?xR8E2epB/NmE+yQDkOVssjhZ9z9O7XO7cSLzY5aM387IKuBD0EKmGPPNmSRo?=
 =?us-ascii?Q?HLqd8KpEwCnYw6Fi1L6obDLGMZgPo7VfDScwuaKucU34DGntrjQRmnAR70Y3?=
 =?us-ascii?Q?U6MyIYbN5E8+Tuqdmv52gKdQlvjfuvrkOLYbVIvo/dMEXWS0HVfuEz7JxwcU?=
 =?us-ascii?Q?lt+HhV+iaAM5hvmpRqtHwPv7O0o2s5o0giRiF/oVITLBPepavsLsW7EDx0I7?=
 =?us-ascii?Q?X/4muWb25aoyAWKx6/Mc0vkVg4oVSbRv2fX4xUITRc83tghRESWpBXywhnZt?=
 =?us-ascii?Q?FR6ZjzoetulrxJK0tKycYJ5jKsEOUw6KSJaJFv6uERGQk3ShDNRfYOMeYyzG?=
 =?us-ascii?Q?K1wRNGTAnMSfmyrxcA3YwkiwYSC/rBp3sYcuz9HjR/W0NIBz1a/X6Ikx0VUs?=
 =?us-ascii?Q?hItbqcQYMsMSd6maFjp1T3SWOufhkC4adBpQLBGhggKbe0YiquAlZvv9y1NI?=
 =?us-ascii?Q?EYNa7yt4zS7DG6xreq0K5MslneZc+Zq9l/p67/2qM7ayiLrFEY+cFCcXI3/t?=
 =?us-ascii?Q?GwuRChmJbZbmHaVQC2miu+0Y9Y0weGSGeAt/0SM6g/G60m250rmEm0Nstpjy?=
 =?us-ascii?Q?MSYLF/YLZ6AuItgOIsVtapcgWGhlUtA6pmbP8c2e/js+Xumy62wkXk+Gio3x?=
 =?us-ascii?Q?v54PoGZS2qfFBdh5lTDMjUmcQaHc37HU/8XTQ44+PSmx/z5TOrC9wTJ0Z9pU?=
 =?us-ascii?Q?G+hFYY1YMVtV4CePRSaYYPeao7lzz3BGEvZ+5TeFSfR+qdqIMcGZ2Avje9pL?=
 =?us-ascii?Q?IKwgRbl3CH+QibUzucK51u4trOK6r/Tf6m0cldqqrBwXiOdq3Bl7Odrrglyi?=
 =?us-ascii?Q?ObAb00ybeYaSKHLJDSuHWKYJQoSPhlp6vP4/SSLQsxDptj66zwbRAVWPy2SE?=
 =?us-ascii?Q?0vLFt/CjHsY5xk1BK95hU9Bg4HwNb3owKYgbPNw2e/75eO8SOCkuBjdjD2hk?=
 =?us-ascii?Q?VCHtEyZMr3YLP4iQvE2OLwHgFgm2fnAysDzL+wHm3T/Dc8eYpCWiL1vxZwfX?=
 =?us-ascii?Q?ubLxtyDge1HT2zEdbJ1BLFqWR8eTXW2+vEie1wzCm0tBvymNast/mrPzF17R?=
 =?us-ascii?Q?K5/pnZ6LpWx2tW4T5dIiq7IiBIMfcpYlhKUQlJvpXoJY883XYpquSeXpGDV+?=
 =?us-ascii?Q?fMz6PucqMwRu1vR0fT6CVVYekyEFhlpcvzZDRUA1cSutPiNki88lfszgK7gw?=
 =?us-ascii?Q?fRBVG4ev0873QNDOXEqvKvOehPRn3zTDPCQk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WLKdnrhE/nTB81vu3d/iC8dyms5uUX0+E7jLI2VixqwEG60jOq0sgqn7YxUg?=
 =?us-ascii?Q?q0RAsCFGSjJiZpoIfzG3dX+m/rq8ci2wykQafih7DJiX7FHJhZb8ntOS+LNm?=
 =?us-ascii?Q?0B3OyZb2u27LuvDvjPKnENg1IdGRwnMAcNnYZ/8iCoJ0N1yTSrheyxurl9yP?=
 =?us-ascii?Q?4uD70Dud53zX79V/GEIlYlRc9XkwhC1TSnBhaQwp53rCIARGkFEXImpVS0/d?=
 =?us-ascii?Q?amxVkXSNnvF5Gme2ZWqVZEXWc3SBLJ2aTBUFbdyETqYAal0U8xDqv2aWXLy5?=
 =?us-ascii?Q?RZOiJqCD54MFPnMMKyj02ZZwy3Wqg44DFjYFiNeU2cU7vggrAMl78ltA/nid?=
 =?us-ascii?Q?K6ItYcECO8EAk3DMkoo3bBqwiGfdDuN/qPKqC/PNKi3ZvVtKnw5/Z8NSCckN?=
 =?us-ascii?Q?l9w29q+L96n92wtdJ4jlopzk16YrbJpLlP85EmmQbNU4hwekqVN2XLF5Mdqa?=
 =?us-ascii?Q?rAofTIvuN8xiJKqaGRRRqqVnxMC49aBDxkOCnwgaWQpT37ACDVX8eWBKdybI?=
 =?us-ascii?Q?RnqYpD80snRmq6HXiZIAl++Q3bvZw6Qo5qr9dJT78FGaWVQtMvsJB2iRSJfV?=
 =?us-ascii?Q?RolBaMxtrVr6eWyzZihfpnOdHFqkH2/jmb1KEiuouS90fjBN7ltFRb9maSKf?=
 =?us-ascii?Q?+t7McBYc7Exsl2jNigCHC/a2iFdkMubie+Ltl5gf4W+1Wo1x2vm2DIQ3dGEB?=
 =?us-ascii?Q?hJz6i6wwhRQNZLBOiBMy/Wkm8jF8eG5LrtyVDsD0xVrGocncbYSWoHy9nEry?=
 =?us-ascii?Q?gjWepq76A0Y8HA0lwWIKCPUYCppYG5kxUsX0ey2Y38fvQW4qQqXbwOpbqlog?=
 =?us-ascii?Q?GxvTIOyaYqEiUCB61/rqwXV+aGzv0H/824SUIPvddPyFSCgKzooyqzA1v16Z?=
 =?us-ascii?Q?WXNrQ+CoH1ZZDaQ+360IZTWlEq4RFd2xhg7qdy0f6xfGhEEXbr7kZEtWgxIH?=
 =?us-ascii?Q?WXx4Mk6lnS8q5vcgp75d93QCDS8oOZTvPqEFjqm1v0S+YVmm9hcFgwY4Q9Zz?=
 =?us-ascii?Q?MfFt2oeEU7Ue7WFXLY/8b+jmQDm5kBbPvtaxFPzThN2Fcc2DAR8ZhwQA2W0T?=
 =?us-ascii?Q?Jx8TlC2ZoDpwcbzn4xI22Hwl+JBomAJefIAPfE7B53lLMMVDQpMAfPF9MDSv?=
 =?us-ascii?Q?/FmNf5eWBb4Reo+v1pRzMEPBsDekdl3To1hb/zPxBkDvQf3faWrkkV7yE0nn?=
 =?us-ascii?Q?Wb9TS4fTLXJHfb9nP+bz69GpmWRpwEZd0MR/pGjtnfDhFXGbtX6AIKqhXhJi?=
 =?us-ascii?Q?EpMuvm6nB/pTCtobdTzPQi35XUuo/xVaeJiCy6vmPL85YoerhaG4e55jgQrD?=
 =?us-ascii?Q?QMCGSledHYqBRb7gvXuJn6CTdg1Nqn61ihVm6ggekWorJz1Z8doC14h503jv?=
 =?us-ascii?Q?6nGfrPWNnW9tuJyVa/2yW9Chn/X+udQ/8nrFApVyqZNV0pDaDuaru6eTWtom?=
 =?us-ascii?Q?MW4AZTKHc0JD8zeg5bPgnxoGKz9XkI9Bz9l8JI6pVUjmT0aHdAXytKUdtPzf?=
 =?us-ascii?Q?6iLxjGPWcQc4SmNTuaZQnDihutHNQ92f5ZxdnfaFHs5W0F5GD27lcbMgK/uR?=
 =?us-ascii?Q?lukmUB4bUpfB7QpUKng=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fc7912-7476-4de2-2ace-08de2398e772
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:14:36.1326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K94GBIel3Tf9ATZ7UY8jx2j7xBQPmf3nxlV5p6UEDTtIqG9HEU7Vv9c1zG1M5P0obHXxJIxz8uZiLIMLq18H5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_081441_386844_18672ED2 
X-CRM114-Status: GOOD (  23.06  )
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

On Fri, Nov 14, 2025 at 01:47:48AM +0200, Vladimir Zapolskiy wrote:
> Hi Frank.
>
> On 10/29/25 22:28, Frank Li wrote:
> > Add at25 required properties (size, address-width and pagesize), which
> > duplicate deprecated properties.
> >
> > Change nodename 'at25' to 'eeprom'.
> >
> > Fix below CHECK_DTB warning:
> >    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
> >    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > index 21a6d0bca1e8a..15463a96938cc 100644
> > --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > @@ -200,7 +200,7 @@ &ssp0 {
> >   	cs-gpios = <&gpio 3 5 0>;
> >   	status = "okay";
> > -	eeprom: at25@0 {
> > +	eeprom: eeprom@0 {
> >   		compatible = "atmel,at25";
> >   		reg = <0>;
> >   		spi-max-frequency = <5000000>;
> > @@ -216,6 +216,10 @@ eeprom: at25@0 {
> >   		at25,byte-len = <0x8000>;
> >   		at25,addr-mode = <2>;
> >   		at25,page-size = <64>;
> > +
> > +		size = <0x8000>;
> > +		address-width = <16>;
> > +		pagesize = <64>;
>
> Is there any need to have both sets of properties?
>

Generally, keep old one just for back compatible. It is quite common for
this case.

I am NOT sure if it is safe enough to remove deprecated properties now.

> I'd suggest to remove the deprecated set in a separate patch, note
> that your done change is not described in the commit message.

Which part is not described?

Frank
>
> >   	};
> >   };
>
> --
> Best wishes,
> Vladimir

