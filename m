Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD58FD063E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGjNOJPp9rWcwIOisQPBjh97WK0WB/bEXnTEUpbp2QM=; b=yuJIK6Gkcboj6ouEhCETYzGlKx
	M+ra7vMmY6iAWokqXpwQ7jrG8rtdlhhdbqiY2fGRBlkZtXXdrv1iY+/LQcc2UQR4MieH18yEK/nDF
	fjswsnzYxmTTU6O1WCb8cfaiLFK79AkhOGID2tdcL4b+IWNaegYESzHrwHw/Om+Ab63ZVaGWJnxED
	qoirLO3UtyfwzSQDxjp1mNaYSDgw9TnHLykzNtNkTuIk8TvV2vuxBZL0sZmzR9POuKmbkVDM+i9+C
	3BM0kZwq/sQboCmfmjl+2er4fetmkxP6AiqUIoE7Hz3/JPw1pEQCdi91QRclEXYnYLzFV2E+0H7OP
	n3WocJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DhG-0000000B184-1TEq;
	Wed, 11 Mar 2026 07:09:34 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DhD-0000000B14G-15DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 07:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFazx+ukriTHKp/obKPJVQA60jocrqkqz4GylyJQ6iFgKX/+YEngkt5hPtRN69peTKbdRVC6EZqQIo8Poj/j8gLQ1iupNNnH7rGJNjTDFDUUJZTmGWryTNtHghB/tRmd7nVTNitllQH+SVdVOM5IpsOTJxoAt+wsPzgDa8wEF8vuymWLNEGUKUFByOYiqAvXVUSKEfZxtQYEaLbFCxqB/oIuOOk2cwu31CHuoy5e4GZdrOnv84SuQl42/2GogZq185YUDqrAHEmsV4MmjYpG1JJLTOoT8n0kC6erPP+F3QpERfNLzDndsYV0jeptvq7Y9luF2I5e6PExCY68Rv1s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGjNOJPp9rWcwIOisQPBjh97WK0WB/bEXnTEUpbp2QM=;
 b=zH4kwHPwzrRHAC30m0PqzOzO3FSaDic3+z+SycOYF4fD9MbuNGdKKS9MfA3OtjQlh79jaeyZ6BSGQLpfdX452baYX8Q0RdlP00luZ0d+ssccoHqM7H7M0IPkr0JgxYa8BGaqy024hiIkp1lvGBA0K18Y58iDCraVGicdufl7Vxke7vsTyGpWvY1CJzmKy2dtOjo8AZfJv86Or833LhJU34qdIKdL/HGaa01THAE055h5eY0vFf0khOpxsE04mpMcrSMRchcod6zzUEhmXN48vK24yDh+Y+Vn8A2XKuHBC9kef5zCeL7am0EMZlcJ/By1W1AqS6CAmp1sldSP77zqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGjNOJPp9rWcwIOisQPBjh97WK0WB/bEXnTEUpbp2QM=;
 b=WxACo7thDryXwxx35pGCpvUQMKiINJNO/opP+TKJNYZy8DBszVvNeDPS67RpmOSYysh6s/wzA6jC5XwEs/+My5GcAT7y5DDmDqB8G0YbISj0TORMlAwR5ZYbRL8PbsJsmdQ+01+s3qK4Ao3bih1epuwH2imz/bwtVqszHANot8pFUkewK58UcLRR21EJ2ycTrEUhONKISMKNYH46Tf9iWOL2BmA8HYPG9jF3Kszs8XUx1JEEXjZ4BPt6JshEXRxL3MDjaiy0lfSNf5TFldW5BDYrGW2htaOgO8ngkxHOemK8UW0dz99qUhelmkCHxPjeeDqEl+ODXDlb7rTuxh2LWA==
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by PA1PR04MB10649.eurprd04.prod.outlook.com (2603:10a6:102:48c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 07:09:25 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 07:09:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V7 04/13] PCI: imx6: Assert PERST# before enabling
 regulators
Thread-Topic: [PATCH V7 04/13] PCI: imx6: Assert PERST# before enabling
 regulators
Thread-Index: AQHcsDCyjAV45mKAOkSIm4R7B2ie6rWn416AgAD+fWA=
Date: Wed, 11 Mar 2026 07:09:25 +0000
Message-ID: <GV2PR04MB12102DDD1B5D75E766CFE2F6A9247A@GV2PR04MB12102.eurprd04.prod.outlook.com>
References: <20260310015426.365675-1-sherry.sun@nxp.com>
 <20260310015426.365675-5-sherry.sun@nxp.com>
 <abA3cM-Icmz47Ti2@lizhi-Precision-Tower-5810>
In-Reply-To: <abA3cM-Icmz47Ti2@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12102:EE_|PA1PR04MB10649:EE_
x-ms-office365-filtering-correlation-id: 35d07494-f7bf-442b-26e1-08de7f3d20c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 5dyEGuqVTCLEGW746thIrCxIhMBR+lrTFjxrToB5ErCPzSmcz8SplOC5u3Axz/ekMXyRwVCaNjbtIwNGJr6pmrLSr5mXiJ20C1MRqj/a1pBvng7wRuhoncmCaGH7dOkLmkDq3b/Ny5qtEjNT+kr/+jWiRE1MDSfBKjI8Q3HW95/oFsNq9VzVhf/zAQSjK4+HcQn6Q80dothmMSrXpzFLbwZYVG5iCODZZuQGVcKePvk6CfmLiZgZz2ZJ6NZcBKZ0YGinWGsC33qS6n3IflaXLl/YbSgscnE2CFVNhwxt0MwwK6+y4Gwc7tCIC+Q9dAdyeFFWygSt01BV6zH/4JGtZkB0zawHFxZ8ibSv8+An74em3qJOQnGlSkw8zMyneVzylA/KhkmHEQZq0anujOtYKcQcLECYFVWNLNeth/2sy3kdTgU65bdL/REv1czqZUzW6FcvjWYRz2c6oh4KXnxtaylHiyTmXUaIDsEpIQ78b5sM5d9d4voJZu6Szea2r7+wdswmVbfp4HAbmbbvPiOugt3GqUyNti4fAZJJZNQWDV/I/GPu0qd80gPGfDB8UwtC9YrICRik9WZsgSCb+JSdtYYkgsXVG5UpNaXSHaOEmYARAEvYOxlKztlu7Wu/heYkYdFhupGOmuRiF/SvybxT23j8IEVr2uy+INGLjzwB9VfYkjZZ1kvbNEqRrkQ0aTkgD65iVtV51j817Q9ZwJDWCR4cxzHGvQ5EkPYmty4b3uoY8raNfYHt+pb6MViQtlB1U52pV5t+GDRDB9ePSC32rNOMm1p6ABsPkj0jB6LZRoA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N32XWvyG9fhuzB7GS79+wRCAWXYqUR/chJVhGUlJ9y07nqvGbY0YPTwM0dYq?=
 =?us-ascii?Q?EkgDNEFr4p3WdGrmXHZJVHIl5mFTQPXRAuh6n28lPgpKJzeHawEKrrA2R/Kg?=
 =?us-ascii?Q?M1fFj8wWRdp9CeNwbR7/qVe/JycgqsFA+4i6SYQ/HO7+oEfafJVu0ZcL9g9p?=
 =?us-ascii?Q?1RUqFmd6gPux2gvYRixu0+xYgI7mIThjM7sbh6PRfj14hsfcUEdQ/aDye1WF?=
 =?us-ascii?Q?KRxZ3L0GzJtK/QyO5qwg7QZ5CEQ+N/hu0GsCHLH0QymdJ9FeUZZWalEiPsi7?=
 =?us-ascii?Q?uVeOUcCZtlH7kEuQFMC69xheFbcAP3UmuTqqp/2N5Jm0f/SKM/yrQ9zz7LQn?=
 =?us-ascii?Q?HKYrdKUoiCdHph3GUnfcSM3CGNBuZeg+djfL2ULBgSn+FgYPmiSBuhXdoa/t?=
 =?us-ascii?Q?hJ2IOZWs5FAaj9Zc2kye2jORNM33HnUTQTmwtmamN5dRIDuU/q1L0hOWd9Ml?=
 =?us-ascii?Q?4SI1GQhjumB5ZhKGq82EUZ38gQjHVxXXQEHCR9bcXNB8EHVOJb/usRTEoiuK?=
 =?us-ascii?Q?3+34Fbd/5owq2rdNb2Ur6ikd62MWD/MnvMPpvUxrY0gE9EZTN7fFlDjLCj6m?=
 =?us-ascii?Q?V/LQpp1ehep+uVuYwGTx6WNcsgCT4BHwUGbm2Wy8tY7RjNEDqez+SVv/23SD?=
 =?us-ascii?Q?jL+gnelFLg1SPas/26AQPWvGT/TmiI8Btc5oGQTY+CNlsEFNqAbHNmLBbh8F?=
 =?us-ascii?Q?Mm/2PvDbWMmOuE4T8afEPueiMC91M4coF2qZmpZGOXGhf0gV6XQJMPqWVmRo?=
 =?us-ascii?Q?4knAQtcDJn2LUsTlgClpw0JhcUns66I3MM2lVPNkigOsfa8Zq2EDZ8nvy3FD?=
 =?us-ascii?Q?XZnVmnOLCNVyuV7+vGvbh4BNbPSABKcQcOe7+0QpCMrHQuRZsDEGj8GBvGId?=
 =?us-ascii?Q?LRWIjeynZL3ZZ+q27hEm95qn4sRsaS8AJGjJ2yuVjSgHDutJaffF3WgTz0+z?=
 =?us-ascii?Q?Kjzhr5owQ5KxzTh1YVuTaTEi/sMK76CQoFuSegB76z+GeL4yy45VGnedWVHQ?=
 =?us-ascii?Q?bxGcFPJ47sEfpK2T8RYkJz6HqIBmn1YFFSbAQ5LtA17xx3v0rTbAcqV3iMG6?=
 =?us-ascii?Q?uh9BY4mLOZ76p5+MYr31GnP+sKWZWqamaLIEq1YZ7dC+aKDisAS3aA4ynIiz?=
 =?us-ascii?Q?2Xq0U5a3cfW+UaN8D9t1aLnqr0eZKZk3mf/jFV6bWDBNp/Cd+suEFddh7EWF?=
 =?us-ascii?Q?xwhw3R24qxAxoOel0VkvROXc32dC6U7qek0Yo0BVEZWx/2Ld6brxXYohkzXE?=
 =?us-ascii?Q?MmQU13MwVTuJBLq5oldvJ7fuMLLE1jbv5EoMjRgSxvpto39RGr46yVdfuklL?=
 =?us-ascii?Q?m7bDaPg+PCvy8iPodiA9cA8o8G4o0MfbjxtyOMqhJBoxI8CxVpI5SwEL1McQ?=
 =?us-ascii?Q?H1Qy2nzXTfwDxgCKibo8P2Bbz4dMPcnxzwCk+zBcIgIl+7Sy+4euZVzmMETJ?=
 =?us-ascii?Q?FUl5XQLboPfEixgkJnxOZ1gQGcHLpL4+oJegrVtu0cJA/KJbVjkFBIMpa/0l?=
 =?us-ascii?Q?rVNEMYtw+QaDnX5fvgtAeFnZyVBmRntlp5oVbgNHZ2w7J3zenfJL5vqEJMNK?=
 =?us-ascii?Q?h5T4nQ5PWT1YJFBNIVRQe+6wa2oG3vFIQi5vVIMNCafj+OUPVaZ1zOJEyNkB?=
 =?us-ascii?Q?MnZcj1S+nAXGrW0YRCP44B+Db4s97aV1Eoss1SixOpEQEKB9ZOPG53Ogud/o?=
 =?us-ascii?Q?nI5MCSAYLZtXhaI5gEB+fA+bjDYhZmjXkZT/bjjVBM+8UkQm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d07494-f7bf-442b-26e1-08de7f3d20c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 07:09:25.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgSYrZJ3zjFCNmdI6eNIdTOJHdbACVp7i4FqlcPsPbcRwJKhjKdafJusvo9hMYu5jhhfLrR2vMkBygtWm0WAsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_000931_319934_943AF208 
X-CRM114-Status: GOOD (  30.89  )
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

> On Tue, Mar 10, 2026 at 09:54:17AM +0800, Sherry Sun wrote:
> > According to the PCIe initialization requirements, PERST# signal
> > should be asserted before applying power to the PCIe device, and
> > deasserted after power and reference clock are stable.
> >
> > Currently, the driver enables the vpcie3v3aux regulator in
> > imx_pcie_probe() before PERST# is asserted in imx_pcie_host_init(),
> > which violates the PCIe power sequencing requirements. However, there
> > is no issue so far because PERST# is requested as GPIOD_OUT_HIGH in
> > imx_pcie_probe(), which guarantees that PERST# is asserted before
> > enabling the vpcie3v3aux regulator.
> >
> > This is a preparation patch for the upcoming changes that will parse
> > the
>=20
> Nit: This is prepare for ...

Ok, will fix it.

>=20
> > reset property using the new Root Port binding, which will use
> > GPIOD_ASIS when requesting the reset GPIO. With GPIOD_ASIS, the GPIO
> > state is not guaranteed, so explicit sequencing is required.
> >
> > Fix the power sequencing by:
> > 1. Moving vpcie3v3aux regulator enable from probe to
> >    imx_pcie_host_init(), where it can be properly sequenced with PERST#=
.
> > 2. Moving imx_pcie_assert_perst() before regulator and clock enable to
> >    ensure correct ordering.
> >
> > The vpcie3v3aux regulator is kept enabled for the entire PCIe
> > controller lifecycle and automatically disabled on device removal via d=
evm
> cleanup.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> ...
> >  static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool
> > assert)  {
> >  	if (assert) {
> > @@ -1240,6 +1249,29 @@ static int imx_pcie_host_init(struct dw_pcie_rp
> *pp)
> >  	struct imx_pcie *imx_pcie =3D to_imx_pcie(pci);
> >  	int ret;
> >
> > +	if (pp->bridge && imx_check_flag(imx_pcie,
> IMX_PCIE_FLAG_HAS_LUT)) {
> > +		pp->bridge->enable_device =3D imx_pcie_enable_device;
> > +		pp->bridge->disable_device =3D imx_pcie_disable_device;
> > +	}
>=20
> are you sure need move this part? it is not related preset and vaux.

Yes, from code logic, no need to move this, I do this just to makes the cod=
e
"asser perst -> enable regulartor -> enable clk -> deassert perst" look cle=
aner.
If moving irrelevant code is not recommended, I can remove this part of the=
 change.

>=20
> > +
> > +	imx_pcie_assert_perst(imx_pcie, true);
> > +
> > +	/* Keep 3.3Vaux supply enabled for the entire PCIe controller lifecyc=
le
> */
> > +	if (imx_pcie->vpcie_aux && !imx_pcie->vpcie_aux_enabled) {
>=20
> How about two pcie shared one vaux regulator?

Currently, both vpcie_aux and vpcie are enabled in imx_pcie_host_init(), th=
is function
is called not only during probe but also during system resume. Since we nee=
d to keep
the 3.3Vaux power enabled for the entire PCIe controller lifecycle, we hope=
 vpcie_aux
to be enabled only once during probe, so this flag is added to prevent it f=
rom being
touched during system resume.

>=20
> ...
> >  		if (ret) {
> > @@ -1790,9 +1816,12 @@ static int imx_pcie_probe(struct platform_device
> *pdev)
> >  	of_property_read_u32(node, "fsl,max-link-speed", &pci-
> >max_link_speed);
> >  	imx_pcie->supports_clkreq =3D of_property_read_bool(node,
> > "supports-clkreq");
> >
> > -	ret =3D devm_regulator_get_enable_optional(&pdev->dev,
> "vpcie3v3aux");
> > -	if (ret < 0 && ret !=3D -ENODEV)
> > -		return dev_err_probe(dev, ret, "failed to enable Vaux
> supply\n");
> > +	imx_pcie->vpcie_aux =3D devm_regulator_get_optional(&pdev->dev,
> "vpcie3v3aux");
> > +	if (IS_ERR(imx_pcie->vpcie_aux)) {
> > +		if (PTR_ERR(imx_pcie->vpcie_aux) !=3D -ENODEV)
> > +			return PTR_ERR(imx_pcie->vpcie_aux);
>=20
> keep old dev_err_probe(), just message change to "failed to get Vaux supp=
ly".

This is done to keep the same code style with vpcie and vph regulator in cu=
rrent code.

    imx_pcie->vpcie =3D devm_regulator_get_optional(&pdev->dev, "vpcie");
    if (IS_ERR(imx_pcie->vpcie)) {
        if (PTR_ERR(imx_pcie->vpcie) !=3D -ENODEV)
            return PTR_ERR(imx_pcie->vpcie);
        imx_pcie->vpcie =3D NULL;
    }

    imx_pcie->vph =3D devm_regulator_get_optional(&pdev->dev, "vph");
    if (IS_ERR(imx_pcie->vph)) {
        if (PTR_ERR(imx_pcie->vph) !=3D -ENODEV)
            return PTR_ERR(imx_pcie->vph);
        imx_pcie->vph =3D NULL;
    }

Best Regards
Sherry
>=20
> Frnak
> > +		imx_pcie->vpcie_aux =3D NULL;
> > +	}
> >
> >  	imx_pcie->vpcie =3D devm_regulator_get_optional(&pdev->dev,
> "vpcie");
> >  	if (IS_ERR(imx_pcie->vpcie)) {
> > --
> > 2.37.1
> >

