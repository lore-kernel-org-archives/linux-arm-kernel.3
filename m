Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB07C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 01:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqXOFDl9ecgT0GXrvD1nmdRavHyRT2/X7OACABC+0/U=; b=y1C1olxT91/C+ThnJ/mcW9hC2w
	tBxedvbRlDPRM8tsdG7i8nNC9Jw/voHyFBX0CSg2Sm0/RVYH99FFhgnzu3HIwPsS7e7xO9ZotIVI9
	MzqtW2eGsLzcqfWU7JcDBEzWNRCd6FtCQPUk1eAy9J0jYMyE9trNhtQhnXZKTe78XEubRnt2+vBh9
	GqX29sTAcH5IgOy2GGyseKd06nTapXrGXqVHVs2IrY9HL0B9fV1NWYABDuunyWXQ7h6e/3hOrycbx
	jLaffZSeo1pJVSIYsHwEGE8xOLMNGbzLflYXZOL69vWs2t1fOYFgmy556tXQeEUQB0kcCzvFVzudk
	sA0PwY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLyz-0000000Aixg-3wZ8;
	Wed, 22 Jul 2026 01:42:49 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLyw-0000000AixK-1LvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 01:42:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoYUsNpd1P/rmzfoCXXpXmygxB5mTRVYEDIsOPYzeba/7cLt3zEGl/poUsUL4TblFmWbxyrVqKzJDyGRJ6k+GO91/JlWSMP/pEc7CArB7RyvtaG4cnMUoEEzx+UvAbdAk5ViU0zwgGVQ8eoB37uWJInoKPEixk1fe7wsLJ+nWXI995a0PRhVmHLhZerS3MrGfK8jz5zXnmtbaO3lhiwgluMfvEDplvQS2uDqA86ZXiyM1OMF2vOMQuMGh/utXDoijk3UyFS6VfYEQPqwPHMPyh1DD5nBwZcqa/MVHqWmYAjKFoAv4NJXcd7lkombqHkKryoV+GNmpa++zX0Fv4AbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqXOFDl9ecgT0GXrvD1nmdRavHyRT2/X7OACABC+0/U=;
 b=dDE/99ZLhmzd0G443wFgsnhGtGdt7CEEYBC3VEX2gDj9k6qARLuYb5qlguk9fNgHYvSevsfpXvXCYTYoAFQuogMEMTxjG5fojzM05eoxnm0Hp01TfVwzzG18KHTdSRs3bGy/DxaPn6/0stRyvr4SrLMZ4Np7s65CJq9obHyF0AQSq1rNrd8ci7GkQOBdShXRAvcUH7r1OH9QWZcNt1eGS5qkXw/yT7Nd0daoHxFWUFvXF7UshdiEbr+qMS89Z80oZYh8eNVysDWGuP9PDe10A/eHXohtNRyT5DMqZIPjKAA9RyGdL0EJwgbrfTtIyCdtcx/JlCxkLuzWzpoCQ54dJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.bosch.com; dmarc=pass action=none header.from=cn.bosch.com;
 dkim=pass header.d=cn.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqXOFDl9ecgT0GXrvD1nmdRavHyRT2/X7OACABC+0/U=;
 b=edZncOS5heDFSOsJxLTK/vbtvN/oCTdlKLWd1OFB5JLj/q03uWknzoNePlkzfv1hqnsualawKGgZYKxkFhzbhfnps2YqhJltsvMgSeI9eaGQGEQtvY14QWtKNwJkEqBf/w2VIAMYIWX6eVF/7aoiEBWRmKQgyUzOq28at1VCyq5Mhcrh1tOJiF1xG+YrznEQO2Z45rxVHsamI3na764bM/L7lOT1gwG1Kkzz9kLSnccZCPY5wyoYe6q7ovKL6nxd7naRODAqbM+HAJa2jiPTvauM/ckYHfGSzxXLgcbq2qMlkjZiql/B4SKAjWYznyOuOU3FSmi60NFrMrcyW3I26w==
Received: from PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ee::8)
 by DU4PR10MB9618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:642::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 01:42:39 +0000
Received: from PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fa9a:794b:21d4:ae9b]) by PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fa9a:794b:21d4:ae9b%5]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 01:42:39 +0000
From: "CHENG Haoning (BCSC/ENG1)" <Haoning.CHENG@cn.bosch.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 3/3] thermal/drivers/imx: Add calibration offset
 support
Thread-Topic: [PATCH v8 3/3] thermal/drivers/imx: Add calibration offset
 support
Thread-Index: AQHdE3uQOwhGQ7gvREa8/JzAX/2zpLZuS2CAgAL3SOCABHAl0IAAaXSAgAKzhlA=
Date: Wed, 22 Jul 2026 01:42:39 +0000
Message-ID: <PAWPR10MB7415C0CD57F76103C5F858C4C2C12@PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
 <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-3-d54d8690e16e@cn.bosch.com>
 <5a000235-5e17-4d54-8bbe-42fda0b59db0@kontron.de>
 <PAWPR10MB741520A95E4822E935A0B7C0C2C62@PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM>
 <PAWPR10MB7415DE998EA3CCA639F14EF2C2C32@PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM>
 <cf03ce93-bd08-411c-9ca3-2a3238e38eec@kontron.de>
In-Reply-To: <cf03ce93-bd08-411c-9ca3-2a3238e38eec@kontron.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.11.3.81
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cn.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR10MB7415:EE_|DU4PR10MB9618:EE_
x-ms-office365-filtering-correlation-id: a96d5bb6-4a2b-4a54-a27e-08dee79283aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|4143699003|11063799006|10067099003|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: WVkPe4a1N56A079W3pnfjW0D5g3ehRCFo+9wQxD+kYULPKZkD+tjmsvMt8Sf9qW1EEPWS9ODOTyfckXs234AO6PLG2Lsv9HKQ3cgFaefiN+TZJk9ZxD+JIuUtZNxVu4/Jy0LNlEUBTYl2vo9f9AWabvUlX5IdCiG8lpNOYFQ9C8q9CxSWI8eXt4/IKo6PVnVDhSSjQ1OUOLcNcI/Vb2Da/VBb13oxPTqVPSV6LhNAg6D55xVXAkMi0wMyYmfZDIeLKpDZYXRLLwIJnCGyjfpBUElJcXp34BWanysnBt7SOoJfFioSZhQp1z4vUqhLXoYPkPctN6B2JITnKBj0lCsrlNJUbgmwMPN89heSpLOVU2GcNU7vdKWThNOvvxipj7Ss/XGAw9rxAgQvXhQ1x+0iWzWP6ebYlOR0nYQ0SuZY0Vk+r3qNooYhgneb/q87cUSQJvsw/wIOeDTkMMUTU5Ix6+3b1eoECcV/9kTDHT3l35BfleIyU9z4pX+3vRaDNybiuaWAM2Z/0SeMdS+qtuZrQw2JvDr9gb3qTueRxAObhllEVv5CMq2lnaOhX305e9suud+JZCKeZsNaxNQzKrtLC/WQQBy+y05YB6bhlBB5WcMdkzYQaVI9Q3t2rDaPUEEPv7Z6cpZ+zCgRE/1i2GMrpyHJvucOIcfmBkYe5qRL6r68p4mBVI7FvAb3P2kSNEAWTNEWNNWm2NJRNqoet9Kimd3ckp3vLBRmtPwYZhKsss=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(11063799006)(10067099003)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b3bawG2+lYXz3nPaZmeERsk4XMcdTf9MLfWUfklc1YztKI4wFXdYWhBWC3sM?=
 =?us-ascii?Q?RZTi1BRXkoVo1I5ZB+MJaoD7EKrEuuIX87T8UzskV3Bz1t2oYZRXaoDqjsU4?=
 =?us-ascii?Q?mZuqzcjeQf4ubrDdqJM3Plq4aNJcaRnqX6ZmrODOLlCRDqiqO+Ti7kkHSpmW?=
 =?us-ascii?Q?TSXYigOM50LeqoDq6sx4eKoSnUNKtpebfVqkyshPkV5zz37UPNz/fWg+lV4E?=
 =?us-ascii?Q?KWiidpJKxU+GBJPgSUttQhqVOeccUGPd/ByUqzHKkaSX3BagBZpwZ9yMelCj?=
 =?us-ascii?Q?kERajiawQ41H5Dblgwi+FC/iA9W31EbOhtM9TWiyI2NNZjSuhNjs4SACQPs1?=
 =?us-ascii?Q?n4kBAuY4EtoOadpCO8ntMAjyYqArkP9rBKXFr52hhyWu4fO/opTo5mNohpHo?=
 =?us-ascii?Q?uFNqpmdGudgrAj7nVjja/nlZF8bhPFOLdZCpTc8LrQVOkY4ia5FpQc3Im5rV?=
 =?us-ascii?Q?0MrpRFK5UgC/yWyY5wL7qOF/dxRJw3AYeev8Sl+R3zuSC1dWvxEE93PNg9Gy?=
 =?us-ascii?Q?pVCt3ghZBJ5T6rpDQgjAcgVlux3q86oseEVLhCuSiDKIsE+1Lo98MOZYR/lD?=
 =?us-ascii?Q?PRXTqAyfe0VuTljDCTvouXcrnbSPhB7YrdmppzJEot8PAkCsD27REhhmWFvS?=
 =?us-ascii?Q?lRePGLi7321GvT5i0PaIpsyf8fHeZ5PjOsnImxo2Y80EMsLxB8pkL6wqkKhk?=
 =?us-ascii?Q?2I86EVy54p6rpOUKHXmni7dm8dYzY2lf3IXStiDH/TCC2HovG4PRAjQWBJFd?=
 =?us-ascii?Q?/u+UshzaisUY+bij/NHcaSi9ihUhv5bLQtEAmUQ6yw0ZBVaHZ0mOxFWERCfK?=
 =?us-ascii?Q?t9p6PyqJlgYPjDOiJY69woF7AHTYi8vY6Oke1wLS/AkUE/kXWrKGe8x/i2oK?=
 =?us-ascii?Q?+kuG6SW9mPqZwkx0slinWg5Au37lJxa1i4oRmCJB3LoYUgk0YzfTvL1TirhZ?=
 =?us-ascii?Q?amzsrhsJBkgJs42SeMx9BRrEkjUWyPFEBN146aurAn1ecITE6GOnl5GGqIZJ?=
 =?us-ascii?Q?7QJTekYCXG1xtyGIuXlthSikB/IUDcRjj0ZDS12U4aBcjPt71Fq0XEL6Woxi?=
 =?us-ascii?Q?e95+7brvrmC5qUZsYcPZr621SFSR8vR++qVFa35VG/SWbKT1X/W/7bt0VZhx?=
 =?us-ascii?Q?s72MCGrPG3Dy6gRuOPdHI8KwDIyZo1gZwBkf6Sn+apiesV9qAwUrmEQhYa1N?=
 =?us-ascii?Q?pErJF4ZlPPxIu9cJFp9FkR8dYYL/gb6WPelsLmsZW2w5MKqhybyE6OztN7cm?=
 =?us-ascii?Q?8gK+K3yBawhQXSyneV3bDO9sFst//oGkPwYOayKzoANQjpRjXwA5X/7DBWwn?=
 =?us-ascii?Q?1FdqntigW1N77aolTdBHuFp8rgee81x7GVHNU5UQgE8ox3L23cL8IGd65OdM?=
 =?us-ascii?Q?6rs+YgXS5h6u2S3kEh0FqMVJ3cuqBq1qrEtWpp9FhtFrqt9oSABUbICwZazR?=
 =?us-ascii?Q?HIuyaG9SNPZM0zrHrSb9txwqfpEoN7MJZmDgRQQ0jzSca/jh/XkE/fAMawem?=
 =?us-ascii?Q?n6mBrn2khD6n9nv94vCSX4cAyS54Zo91I0yIYFV/6AJwngr6AS2xkUqbU7gP?=
 =?us-ascii?Q?UREVqibC4pYqFFOsPTfAden1Vy9NYWM7MIRzC6vP9h2qFHLjLZeJYDQiW1MP?=
 =?us-ascii?Q?GK9qIoQ3bKhGGM5F6sWJ75iovxNEg/SvGZEZVrbNTXKnF//WO0PozFVaUqdi?=
 =?us-ascii?Q?wldBB8gp4oxFxCKYOyOxJrf0Uj3n4+AGDn5SKUGlm9otvlLc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR10MB7415.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a96d5bb6-4a2b-4a54-a27e-08dee79283aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 01:42:39.3372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eucdyC/30+uFajL9iJvyRnHJnPhyMHB2RVtBV7ZYb5u54QE07p2DUuKk119X+LcohsPOTS50R/GDAGHAhqb9PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_184246_861548_54A3C936 
X-CRM114-Status: GOOD (  20.95  )
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

On 2026-07-20 10:27:33+02:00, Frieder Schrempf wrote:
> On 20.07.26 04:10, CHENG Haoning (BCSC/ENG1) wrote:
>
> > [Sie erhalten nicht h?ufig E-Mails von haoning.cheng@cn.bosch.com. Weit=
ere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/=
LearnAboutSenderIdentification ]
> >
> > On 2026-07-17 06:23:44+00:00, CHENG Haoning (BCSC/ENG1) wrote:
> > Hi Frieder,
> >
> > I need to correct my previous reply. After further discussion with our =
hardware team, the offset does NOT convert die temperature to package-surfa=
ce temperature.
> >
> > Their thermal characterization shows that the raw TEMPMON sensor readin=
g itself deviates from the theoretical junction temperature - this deviatio=
n exists even at the die level, before any board or package influence. The =
offset corrects the sensor reading toward the actual junction temperature, =
so it is a genuine sensor calibration.
> >
> > Board-level effects may contribute additionally, but they are not the p=
rimary reason for this feature. I apologize for the confusion - my earlier =
description was inaccurate. The v10 series reflects this corrected understa=
nding.
>
> Thanks for the update. If that is the case, then I would still be
> interested to know:
>
> 1. How is the value for fsl,temp-calibration-offset-millicelsius
> determined, if it is not provided by the SoC vendor.
>
> 2. Why do we need an additional offset, if there is already a
> calibration using the value that NXP stores in the OTPs.
>
> 3. Who is supposed to set this property and where does it belong? The
> SoC dtsi, the board dts?
>
> Thanks
> Frieder
Hi Frieder,

On 1: The offset was determined during product-level thermal characterizati=
on by comparing TEMPMON readings against the junction temperature, as estim=
ated from calibrated external measurements and a validated thermal model. A=
 repeatable residual bias was observed. This offset compensates for that bi=
as and does not replace the NXP factory OTP calibration.

On 2: After applying the NXP factory calibration data and vendor-provided c=
onversion formula, a repeatable residual error remains. The offset compensa=
tes for this residual error. This correction is particularly important in t=
he high-temperature range, where accurate trip points are most critical.

The correction must be applied consistently in the kernel to both temperatu=
re reporting and hardware alarm programming. imx_set_alarm_temp() converts =
a thermal trip temperature into the raw threshold value programmed into the=
 TEMPMON hardware comparator. If the correction were applied only in usersp=
ace, the hardware IRQ threshold would not correspond to the corrected tempe=
rature scale used by the thermal framework.

On 3: The offset was determined and validated by the product integrator's h=
ardware team during development, based on thermal characterization of repre=
sentative devices. The resulting value is specified in the board DTS becaus=
e it was derived and validated for this specific board/product configuratio=
n. It should not be treated as a generic correction for all i.MX6UL devices=
.

Thanks,
Haoning

