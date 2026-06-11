Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EFDCD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWiLrxq1oZw+QBnyIQ7OiDxidOfzpo7wpBD8ZfFzKcQ=; b=kutIZ9cr5RRzRnN9+hHCqIxMT8
	D7RjuCcJ2eQAMIpUcRUVBp5oQX+7Wvd16XkEDSaUhVl12tMp9BopeTXdKUhVgtlOXjzFQKLg3NK/T
	hHIMCcwq1vQkyPlDRQIjygUNWeOk4j6n+NzGyIHaTE2xdJWoesOm8g+TMGpehAvjy2yL2Il3EhvAw
	4ah0JJaWH+lA+4v3EAAnhFUORH4jSpY5YccdL7jJxuai5BwOtMMNKBtEUzApsbVWk6rvWaj7Vd1N9
	1mpy4nC7GB7ByGbCvUPqgJqLjQyGBvWGhmhjTuMNLB88bh2LFFUAohSjnqARaepQx5pj7csOhNKsQ
	CyaNDnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXxR-00000008jaI-0eTe;
	Thu, 11 Jun 2026 05:28:01 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXxO-00000008jZe-1UfM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e00uFMvvSydhpmT555L6dNdUhm+Nsy2XevY0e6mrPzlWyvWQCeQ+TaqxlQ8XCWXAKF+l4aCocN6L4mQyHVJCHOxaf3J76C0Gy7hoJOAruQ9w9PY+Se2RDPH14N5SSMuP/3pzTKu4Abyp/QrtkDWgMe6FaFWrIPR8/Cl8NSgvfVcETNmn9Bk4gm3QG2qK6TO5DLRMMucQQ3lwBt4vHVp47jum3rNeEn1DeMtLqxIq/g9TxVuI8P1JCdj2PlxbmEsOr+0ST03DGrC/nIMz5g7W+LrxMlZHWzOri+/lb4LbDKG3Dfd6X1CgL4EmFsqQpH/dmzFCgHQLskvtnsup72LSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWiLrxq1oZw+QBnyIQ7OiDxidOfzpo7wpBD8ZfFzKcQ=;
 b=asHR22yBWo5LzkasEoo434PgVpEBDowXulTJBCz4z9FzjkA8fgi8YFyFT3e7+L1sdq5y4lXSnyOX8iHwKSu/fzGtIJrMBXm/pyriVI1ZEOUWMsojKnN8ALTu2+czbKyZBj2kFRz2s23v8bwJNFKccmjRcx+OpOfhQnqPprbfmNhEJhviLpqhAxRo3gpmFJxsbFamVNd6hN9GxeA+zTs+GDyQA5ZrAUiY9Uf4wEMqb2kPdAUPT6wWHj48duTcTiWs7BojgmLjL27DCcs5kJ1cfw2HwauI1IQCXEQ5YQu8wyPp/f6fFviD+49Kr9FXPkUZ098ey4hwn4OsNLdAUbzRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cortina-access.com; dmarc=pass action=none
 header.from=cortina-access.com; dkim=pass header.d=cortina-access.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=CORTINA-ACCESS.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWiLrxq1oZw+QBnyIQ7OiDxidOfzpo7wpBD8ZfFzKcQ=;
 b=dETn3j6x6pe1IoDJpT4gpaUHkuh6vRYuXD4SUmceTygaO2hHH0TdVSvz5iu8DAhUKMcniagSq4uaZMTFJ9ZukqAWsUrMFzvN+0iKr1Ik+gRU+lZhU+ux559r3N1EWn8kgdXZZ5IcVDgBMbGXHFBuaNGz1UnL14pu2UMC9RVWdeg=
Received: from JH0PR01MB5777.apcprd01.prod.exchangelabs.com
 (2603:1096:990:4a::12) by SEZPR01MB7392.apcprd01.prod.exchangelabs.com
 (2603:1096:101:29e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 05:27:49 +0000
Received: from JH0PR01MB5777.apcprd01.prod.exchangelabs.com
 ([fe80::f3ef:4248:51c3:9cfe]) by JH0PR01MB5777.apcprd01.prod.exchangelabs.com
 ([fe80::f3ef:4248:51c3:9cfe%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 05:27:49 +0000
From: Jason Li <jason.li@cortina-access.com>
To: Arnd Bergmann <arnd@arndb.de>, Jason Li <jason.lee651024@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and
 platform support
Thread-Topic: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and
 platform support
Thread-Index: AQHc+MxUhkbpOK/sUEulinUWgN8yDbY3pt8AgAAXCwCAAObFwA==
Date: Thu, 11 Jun 2026 05:27:49 +0000
Message-ID: <JH0PR01MB5777B84BE8D9987329ABA54BA21B2@JH0PR01MB5777.apcprd01.prod.exchangelabs.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
 <20260610112821.3030099-2-jason.li@cortina-access.com>
 <7dcc8386-a0e0-4c79-a9f7-f63188bb997e@app.fastmail.com>
In-Reply-To: <7dcc8386-a0e0-4c79-a9f7-f63188bb997e@app.fastmail.com>
Accept-Language: en-US, zh-TW, en-AS
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cortina-access.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR01MB5777:EE_|SEZPR01MB7392:EE_
x-ms-office365-filtering-correlation-id: 0ca13390-efd7-4d53-05cf-08dec77a2d84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|5023799004|11063799006|4143699003|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: GcgK6wxZjMLI+4YhQK3bQ2ljFcmgpa0WCzEu+Q9obdrAPRWYooCNOUQ8ShxOUtJ3fCLEZCTr4mwmiGM4nk+wDSQwegQYWpBs3jW8vZqvTsn1Ii1CM8G5eXG6Vx/8Xhqlo2TKOCfUf0918V66jRmU4/MSVFBjDtUMH3XKwsacOihG1OTtL0NhNc0G0AHzHqw98vjtASBdYvJl8BuIdMHLlzufHb7PK63Kcjpx2EqRd7jockRPvYUGmvw4E6HI8PLU773OMvybiA/2dPkK2a2uuTPqwrlOOgxK6I6IXg0W6dKIbVcMhUskoGltZUP8loS53dXZahGj1LZwear88mfTGXc7C2cAMcAg0QJqt4KoF65Z/g7fd71sNnzFA/I3ugNy27yxhz4496hirBajKwSh05O6rpOc/fqYgqh2gBDgVFN5ufPh6GTIL+jY3bKzLU40qPRt5eDSzr9PDAP3+Hgs0AhjwG+jUILX1785wWeYuhpnZmAS8IhymTTFJfLDryWi02a18p7Y4boAgtYepbpj6A1vT12J6rTc71TaTEGupDxZikJbCfzPXNPF5wfjYnDQjCfMO1kK0PmUgvA3iC9GX4RX58GPgQbKGkuK20DayEx1obxL95i6RxvrbQRPvPicqszW1qG2abhT6goCrETOLrrir7E4Wp9dIVGFaIU7BOhj/bOIq/BSxm+rjWQT0FAO5SxCwbbTGtUknCTnspbrFPSAFxTcYLfr86x4TYHIsDkqlCroSrzJv+bd2beEO1QQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR01MB5777.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(5023799004)(11063799006)(4143699003)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ydiUafkFq2xTyrL8WVHdSgH5pmJWzCNEGQ5FKmdBN7eDT0ujlVY8MwU7uH7u?=
 =?us-ascii?Q?K+U5d8HftzFA8NYy9Av3J5oiwlFmWWxBPQtyR8zg6rsZN7DLpiTpEdvaRtQc?=
 =?us-ascii?Q?9wxdJWPkd+TT/I/MiwORhelI9WXmcCySTykf2gETQ90GoNwfkuBvPe7k2q2E?=
 =?us-ascii?Q?N15H92UrCHRZfyFqEwnG1GrGhRENYoqwZWK8ktNKlW5TD/ZNysY8tpv44iLj?=
 =?us-ascii?Q?KkUwOeGrVoGvRr2egtYpo5ZMla+nGIF7Jtbdqu0cW59P1cWmTnkKX5f9TLbM?=
 =?us-ascii?Q?xBb8QsJM/HHrzc9RYR+ljxyHNqEnKqKAGynJ8XaCjpQdPOwRBsg1BOa5CLMU?=
 =?us-ascii?Q?oBXiJr3MXqqfHa9JhZWDY0p//wXm2aZl5YkLspw3DiuyR36VvdyD+Qgx1rXj?=
 =?us-ascii?Q?vTZDJrJCv8ArhNkzhCX9QVc469RceefdBtT29tnA+x/FgsHBL7Ryfaj/SgOO?=
 =?us-ascii?Q?oqZ9Z1Vhu/Fy9HjXDvutbT08MViKPqQdffEJ6Epa/38eEK7+DwHr/EgmwA3l?=
 =?us-ascii?Q?Gua6Icxgcx1mT/r8WDmhVCcqrQk6u9j6MCW4xLN8UATVTDy3Fgv5tFOd2TAs?=
 =?us-ascii?Q?33Z+jBZtmeOS02KYJsmeJ0sJSXunKFPmd/pP4zhZ4YAUtlEhFl0RkL//MM5i?=
 =?us-ascii?Q?7KfxQiyqoSE5u5USm0CRI/oEL5KJMpwy4LBWkpFTMX9Xvy9A5Lw3DaRk3Xq8?=
 =?us-ascii?Q?ym9QF6s4rwQAWqjQwnX15q6McukDWoSYqMa8nvLaYoKd7btOr3+1VNFRHPXW?=
 =?us-ascii?Q?sx6yDInwur7qWo5lKEZT9+1Ny5CPhteZaiIuJyGFCbDdAB7GwBT2ZVh5MkO5?=
 =?us-ascii?Q?GdcqHWPspW2DFVSgUjEWwPwT4h0218DQwegiWkex8FzYQnRTYEOQAYa+z6gi?=
 =?us-ascii?Q?J3S5wgSyB4dW31ET5M+HVfFOvaN/zf8TR1qxoOzeQBSKbgZ0iPtHmLQ9RCdG?=
 =?us-ascii?Q?a5iFKVN1iqjCHA+4KuU6iP3ILXuinDGq4NRcKdx+NdmpfIsmvdc9/hkPW1Uz?=
 =?us-ascii?Q?gsNbQTv1wr2P9rg483aicd7vqodahVOcmOmFdpH0BeLoIRM5HM/fABWBEWR9?=
 =?us-ascii?Q?N9n6rK4dSxlbeZ5HHQQF55kc3OwnHjMwJfMlkMIVNQaoxIPj+exlWMwYhcnn?=
 =?us-ascii?Q?cs2ARy8KcjGFfyXINal4euh0nspR3xoSMESnoEQbtiIdPTRUoCszPftFFYsr?=
 =?us-ascii?Q?52BUXvAVFTXVh9Mqpc30c89m6OWatlHI4fQhbvZCYiH7ItNQzokc+G49aSBI?=
 =?us-ascii?Q?qPtH5kbrB6xR9D2UKCp3FkeZ1IsghOM9lvjjXNBuUB0t27N+E8gtEnz7aP6T?=
 =?us-ascii?Q?vePvIxb7JS2FIl9DcxW6tNMHHjseovfpgVwj9G7g07nXAJPLKRBp9X19PPN0?=
 =?us-ascii?Q?syWtCCrC3P/WM2LuXKCnH9xJLw2ho2ULtVwdJXLLchly1aVjMjGclU22GvPF?=
 =?us-ascii?Q?6YuUTC6DfVK7rT5KVNmJfQM1oszE7FC9uoUwxbSCh41EIO1iX6APxr+d+rQo?=
 =?us-ascii?Q?UKtVVlsHh5P/E7DmsqdbDf9kMi+UIYO32BTGefuDjhvX89cRcxJeKqgkQVpN?=
 =?us-ascii?Q?mQgHbh/j+I85LhKd2CUAn5aAdWjMsEhB66O06SvAu3cO8kwdGTsB3WXjiQvE?=
 =?us-ascii?Q?eayZfNl8zQ2suw80EWOV6BKMbiW1Jolyf18kPkIS7ZzERSHVFDvJBsHQ5iSf?=
 =?us-ascii?Q?StIsz/g7KFPmJ+3IC3J4cxN+rxpyrSvoFQr1cbuxyBudc+Kzxpv9v27kVbJi?=
 =?us-ascii?Q?3VD8n9OoSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: CORTINA-ACCESS.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR01MB5777.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca13390-efd7-4d53-05cf-08dec77a2d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 05:27:49.6245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0694623c-6669-497c-89c3-3a32a9934313
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KU4enVxe09KUr4zo3qL7wZd0zMQhliu8xUXE5UfSluqpSA5PclpacX+JamcimVlFahJqgpeMrHzlsJDTrV18o/F+08sWDSu+7mfDsZfLSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB7392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_222758_397175_8113ABE0 
X-CRM114-Status: GOOD (  34.45  )
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

Hi Arnd,

Your memory is truly amazing; you even remember a submission from a few yea=
rs ago.
Since the last sumbission was drop so I though restart a new one this time.
OK, I'll review all feedback and fix them for the next V6 submission.

Yes, we expect actual end-user products based on these SoCs, and our intent=
ion is to provide complete upstream support over time. The UART driver and =
DTS support submitted in this series are the first step in that effort.

Cortina-System and Cortina-Access are now totally different company.
Current aarch64 chipset are totally different with legacy gemini processor.
Realtek has many business unit, different BU may have upstream plan but the=
y are individual.
Although Cortina-Access is a wholly-owned subsidiary of Realtek, our produc=
t development is entirely independent.


Thanks,
Jason
> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Wednesday, June 10, 2026 8:51 PM
> To: Jason Li <jason.lee651024@gmail.com>; Jason Li
> <jason.li@cortina-access.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Jiri Slaby <jirislaby@kernel.org>
> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.or=
g>;
> Conor Dooley <conor+dt@kernel.org>; Catalin Marinas
> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>;
> linux-serial@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and
> platform support
>=20
> External mail :
> This email originated from outside the organization. Do not reply, click =
links, or
> open attachments unless you recognize the sender and know the content is
> safe.
>=20
> On Wed, Jun 10, 2026, at 13:28, Jason Li wrote:
> > This series adds Linux kernel support for the UART controller
> > integrated in Cortina-Access SoCs, with CA8289 (Venus) as the first sup=
ported
> device.
>=20
> Hi Jason,
>=20
> Thanks a lot for your submission!
>=20
> I'm glad to see Cortina Access is getting back to upstreaming this suppor=
t, I see
> that you first tries this in 2021 but didn't get very far at the time. Th=
e last
> submission was v4, so it would make sense to cound this one as v5 and
> continue with v6 next time.
>=20
> You have already received a number of comments, so I'll skip looking at t=
he
> details for the moment and let you work through them.
>=20
> Regarding how to split up the patch series between uart and soc, I think
> sending them together during the review phase as you do here makes sense,
> but as they are loosely coupled, I think we will likely merge them separa=
tely.
> For simplicity, I would then just put the MAINTAINERS entry and the bindi=
ngs
> for the vendor and board into the series for the soc tree.
>=20
> It would also help me if you could add some more context about the SoC in=
to
> the patch description for the patch that adds the arm64 platform, in part=
icular:
>=20
>  - is this the only one you are planning to upstream at this
>    point, or do you already have plans for other SoCs in this
>    family?
>=20
>  - do you expect to see full support for actual end-user
>    products using these chips?
>=20
>  - is there any shared lineage with the cortina-systems
>    (storlink/storm, now marvell) gemini 32-bit chips that we
>    already support, or with any of the Realtek SoCs that
>    are also being upstreamed now?
>=20
>        Arnd

