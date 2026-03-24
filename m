Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12040F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0ShM5vppey+2laGhe3cYNlqwgtdi9smWHRApM8NlTk=; b=ZejZcOcZKXoDWEaUSanLK4Iihx
	ZVLQghh9Wkhg8jeeWhKpNf41d8tZs0Ov1Gyz3x89R95yDZxy23kGsK/2BiVaAOZ/yAta5iVDkt9im
	ih2JjEzdNC+l52YkXbJ4OpFko2v4rAInPB9Ih0mOgeDkHxZW25eeRvYgsogwQLy2CbMbry7Y53CWQ
	XJH8UUZS5cRr9NXNg5qH63SYQ/hyn4gWWsg6imRqCHlaGOwe4dmWjX6N77vrp/WXlT1P7Rs4/SDuA
	PvBAo/FoYFAWcUsRNXV8RpnFxYAn/Crkuhnj1ivPxrDtpCrhvt3lDTcEsIPcK6D3/KsBozOLvAgur
	vo+veksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sN4-00000000Tf4-0bxL;
	Tue, 24 Mar 2026 03:23:58 +0000
Received: from mail-westeuropeazon11013046.outbound.protection.outlook.com ([52.101.72.46] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sN2-00000000Teg-0o0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuVYw75zgneomuSYT6cEIn8jKnBRklfeZz5+nngU7fpYzGTlzyoB4i7KyhYsndm1rO1L69yE/FyZFBopvcb1aGWVtWfzzRKLkcpEZXSikGA+/u+8UNickIPOWv1q3dgAOHewNCjGyDGL/k+LsI2YjExLxg68IzlAP1PkLgW5XY16wpwZuTPbAo2fjacRTtXK9X4N4efxalZLDQb4O8ZKPUjP/4AlgbObYelwVRZHVfMXbVu9e3PG6qrT/ZUAfZYHlkArbeJQfIOI9IFt5xcVQUVmbe/VOxAAlLUGFgLmmgOZdYpJ6pAM6RDTenb9L8uHPtgX3Jqv/cnqs+/s7ZCAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0ShM5vppey+2laGhe3cYNlqwgtdi9smWHRApM8NlTk=;
 b=GBFBwAhSvLFf+2fsBEFtzF6EtfC/1ZCxv5v/fGaHAzrCuQKUWR3oBGQmkj6PjNyvsxDNx5g/aEeyhoU4q0Rhrqt84iCONIoxkAm6A3aYLWF++IMlKE5OwEzdusgEUo6HKzbI3CV5ONzeAd8JS7FMLX5nWSYZhU+hmGya+Y3ZxXtFSYEBsl+UsI1idImhGCAkg6WYBp7Xm8HECUqQFFDbUoZznsrccZsVTCIJ684XEPGgtb3iYuVV4Ydo+0xPVShwrUsx+jS4huwwe/QXZARbj/ALB1CV799XcqBIHvqcBFRPRt7Vx4WYTgaeTGQ9e4NdrYajkzNp1mnN3dCsdMY8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0ShM5vppey+2laGhe3cYNlqwgtdi9smWHRApM8NlTk=;
 b=hnLtUXAmUuBGalBi1zvV+og3DEajxX9Bjowr/9KUM92dIagBH/GICbHPO8G2yLXZIyGRQehZb+aSv8vTd2UPJ7E2oJsUwX/fsdv+07I90bdkMVxXS1H8xcrKQTfYzsFkq4eu5BxaG+FHBr9e45lED/1b0mK8TVm2Dw6WIcviCNfm1/e8rqMfMJrN/wCllFsppQfu0udShoDr/1pFrvJ7Yt3QP/CAt/P8EoF/LxvSLYcs3qlFUPg2cH6caoMoGRVdZWTL1D2HZz30PMudsqtzcazZ5sPszJZVVaEaUUGqSnp6PRHZjBqeKOChDAI+L200GUx9+ctGL0RCEbMa2kBToQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB11337.eurprd04.prod.outlook.com (2603:10a6:10:5ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:23:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 03:23:48 +0000
Date: Tue, 24 Mar 2026 11:15:58 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-mek: switch Type-C connector
 power-role to dual
Message-ID: <e6lzqq4g34gqumtk5sxz4ur2fyiuv5feyoyrykmaddykhpmwxt@ptuxy7ui5qw3>
References: <20260323110923.2567366-1-xu.yang_2@nxp.com>
 <acGDbMKECQ3xPdTA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGDbMKECQ3xPdTA@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB11337:EE_
X-MS-Office365-Filtering-Correlation-Id: 880c86dd-a35c-4ac0-e355-08de8954c330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6XXSft4Ud9Ha0B83oQyQTxNbKKXVOT0Ree7updV0uh4IZTnnx6eCDH/uJbqR/3Ts4BT0kjF5TlGMULIFPsD5GBb273mPoAl2rcbeVXxSMlS6HBMx5gdKJF1hulh0psa/ZQpLlGFRc87zFttTvN63Fc1vr+ipYoG363s+/CIQ5QnWYevvrMvxXtdjJ6ju3FETeXy5k25nqw855s7idW+YZ2ClFGG2A1Wlkk+YrCT87XNbmqnZqJoQiMhVsuqurunGYP+TR3i5rGf8j7ETDfcJSKehFPsKu/c+wAVQSn0qr8Si0MvaiZSnxRU+Kzp7i+2An6sPo4CYdqrTlRniNDrmr8DS23NdlxIHHRUrhDhqWH2qHxVFAvbqfL10Lp7hjawXfOKfpNFv2H16sRL+fqZtS+z+G6OgxrSvmcJmIMKi9Ro1tBy1MJZ8Sm6vva3qXK2L9DPIUiS4OoBFm0hlMFUcIZaAnfoJ+8mbEKZfiNaAwIrUaR/j9LSCV+F9dhPo29FNqMTRQgcBn/Uk8NzxUlFlGiDR950CpTIoDjuQhFybOISc8uMyCac3Ehn/+89AbKpphQqhFdKY9XFgXk/8rBcDt1fx2pJVQtezflg91wsF+mjfLxi4ewi10KwHHNcHVZlqh8/LTTkVDryCiBNWTNOj6o4p1g9xfm3w7tfVDU9ix9BwseTX+56lOx2Bn0UwQDn3hTf1uI4hYyqrScek53IEvMQEnXvqoJ4rvK+I2Vp087+NWlYsb1zqtkWNWAsniDFzcwOcSJLg2d7SeDjAyNsBBAU97UreYC8s/f1YBh5GJQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+vzXCaQx9vUmQnu7b5/qMQE0LSkzBwKc5pj9frHbph+7mFEJPs74+dTaoG9?=
 =?us-ascii?Q?kf0IDUvFiun21Z27pYjtAy6ty+6biJA8E2jCFq28JW1LzFgEZx52LbIUOy7F?=
 =?us-ascii?Q?SOQJYG2BGecF/FiLSD3ZY5CC1CNLlNsZEW20N5RTvHIAMfXgu95KRMENHKT7?=
 =?us-ascii?Q?9kVICe00987ChVLkvSviVS51qe4Toc11DAzadBxkjiY687FmrrDWKCDVD77d?=
 =?us-ascii?Q?QLYrnwM2aJjvvkaYVQXgwcyxoNhsTjiHHemnfEGF8dPRP4smND0h1I6BgGqA?=
 =?us-ascii?Q?eVlPXuIUwcgshAEey2FNSsR/T5Pb7U2a2e848yHkU9d1AwvW7dtZha34Dye4?=
 =?us-ascii?Q?wTs3gsf+6G/JkeOu416rbtOnt/sytDLKdSTGX6mF6SnvLTthgPzjLn02Rc0J?=
 =?us-ascii?Q?JCwCSp+K24RgdgXI/0AOLlqRGSQFV0PShti8Or8DmYuBoDJGKztDfrQW7y5Q?=
 =?us-ascii?Q?QWF7KCjrhECF5RoS6FSFZlwY9DVF7La4EiYfYv5R6MnySBQo8GizOM5ohAxJ?=
 =?us-ascii?Q?C9RvqbRTZmqxBnqhJ39rVOPFVViHVwK4APsKrw7eSkSuGVmiLfT6wNTNM3oS?=
 =?us-ascii?Q?4t2+iT7w3c4f7GRSzB9wp09Acyx0zzJVUfh/Gzy5xLowH/7Hr4HiwNdAZWu6?=
 =?us-ascii?Q?8sFN3QNGFaBFEXkqLZ/7wOHorb9K96WfgTYnw5HIGwul4msa2Z8VWANjehPA?=
 =?us-ascii?Q?nsc65s6NuFY4cEmX5QBV/LyCUOcrqizMgISWtb5QKwSWeR7mjEQYD+HRpcjk?=
 =?us-ascii?Q?PMc6TPV6QI9Qoe21UkL6DteNcsU7Ggw4ecoDp5hfCoLiCbRJZb4lLEPxfutv?=
 =?us-ascii?Q?hmG1+ZRZsm42qJge0tbxtKmYwPofNK3jI3VQ/tPav2eBw9oDD745J9RuNUUn?=
 =?us-ascii?Q?Ok71HVY0KYl6vhiI8xI6zAoePAw44fFP8KkJno7cZ040YdwlqVo71U5lF4nt?=
 =?us-ascii?Q?4j+hWfkckEgplbQNf0Y/ee2MeWJBjcUAhODE/dLvxqFoYbeQPCHoUgjCZ6Dt?=
 =?us-ascii?Q?w6iZs5+vkAexGi9UN84IIW28xS82U7tj7O4YnSx4LuqMR3P1NVp/djYeYzQ/?=
 =?us-ascii?Q?9B8dNUQoGdYWRtEastONUj9OMn3AfYgJKFOtTM1Zi+J0Fcgp2FwTU4B7AZVW?=
 =?us-ascii?Q?co2kv889cWL06c1cv/88FaU6ncqrMvuJwKMIVVLKlUhD9/oLqpYpCjELnpCz?=
 =?us-ascii?Q?SYtCoj8zKYpIWc56K05Dop/gPVhmkqTYOMQ/8cIHQ+9TLmnOGIR3GT80+G3e?=
 =?us-ascii?Q?zZqr9WnWoGPTa0dgoRL8lG+KES8rsY3FcWC0LDOwWmF2fv6jEq4xereH5XrR?=
 =?us-ascii?Q?q28Uj93bnq/I3LUF9P6zkDHclv1x1pU+i2v+0/vd7C7w72ID0n8tFRbGw5Uq?=
 =?us-ascii?Q?8IVyAKBmazHr1r96mf5iufTGjXkVMJmSrEVB/oAJs70sFoOtSJ39qIt1fCIp?=
 =?us-ascii?Q?wUPQ4CxCnNah0xOZq93cUNePOkqASa8ujgR8u7ZfxUdVCMD4H9y8Lrk9hWhP?=
 =?us-ascii?Q?7/1xz3xvxx7LkqaDBAgYx8zck5SBBAwBumg0F0bymV73GiSDRRHQ+z240ND5?=
 =?us-ascii?Q?zR6EdCFXCTsKI4ok5sfPHsovA2kzQXM+OCHwUYtfBUFOBL9/6Ww3Vfe7S5Q5?=
 =?us-ascii?Q?bNSZyBLcgyxHnPuEYSi5ApFVMutH5I/Y2ZQ+i7ZSLnDpdjzbCGq+hUWA7f4d?=
 =?us-ascii?Q?vxrg91VUUDOhlzyzOugtKeUipCCU+DtNQoWVnkYLbeK8FqPThIWEmNZHaP8v?=
 =?us-ascii?Q?n0WSKF4/eg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880c86dd-a35c-4ac0-e355-08de8954c330
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:23:48.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh0s/IfdYkYht1V08o1/ZYCdsh2/8gq7aCyoGWxT/22D2d3QE1sny7ycA/JxPZI4wEMlMNptgYrtU2qjUUzTWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_202356_263546_AF8024A3 
X-CRM114-Status: GOOD (  24.93  )
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

On Mon, Mar 23, 2026 at 02:16:12PM -0400, Frank Li wrote:
> On Mon, Mar 23, 2026 at 07:09:22PM +0800, Xu Yang wrote:
> > When attach to PC Type-A port, the USB device controller does not function
> > at all. Because it is configured as source-only and a Type-A port doesn't
> > support PD capability, a data role swap is impossible.
> >
> > Actually, PTN5110THQ is configured for DFP/Source role only at POR, but
> > after POR it can operate as a DRP. By switching the power-role to dual,
> > the port can operate as a sink and enter device mode when attached to
> > Type-A port.
> 
> when first use term DFP/DRP,
> 	DFP (Downstream Facing Port)  ...
> 
> Except well known term, like POR.

OK.

> 
> >
> > Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
> > to control the 12V VBUS output,
> 
> I remember a hardware rework to fix this problem.

Yes, PTN5110THQ is EOL, then PTN5110NHQ is used as a replacement. Since PTN5110NHQ
works as DRP at POR, then this will bring an issue that PTN5110NHQ may work as
a sink when attached to PC then EN_SNK will be enabled and 12V will be output to
PC and this will damage the PC. A hardware rework is done to change PTN5110NHQ to
DFP/Source role at POR to avoid the issue.

The hardware rework and this patch fix different issues.

> 
> > to avoid outputting a higher VBUS when in
> > sink role, we set the operation current limit to 0mA so that SW will not
> > control EN_SNK at all.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > index dadc136aec6e..8a832a0e105d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > @@ -611,9 +611,13 @@ ptn5110: tcpc@51 {
> >  		usb_con1: connector {
> >  			compatible = "usb-c-connector";
> >  			label = "USB-C";
> > -			power-role = "source";
> > +			power-role = "dual";
> >  			data-role = "dual";
> > +			try-power-role = "sink";
> >  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> > +			op-sink-microwatt = <0>;
> 
> Need comment here.

OK.

Thanks,
Xu Yang

