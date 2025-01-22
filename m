Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D39C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 05:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ8VyTEdnsQJT9Vd2q2u5thSzgoYgSxfGogG769vinQ=; b=rLRQ5rYEYXKwt8wbel9M3G54wO
	BFCo4n8zKJWp5o8kgP14N2dPZkiHDZYsUKdfDVaqRyI11Dne3BfOjo38mC7d0/0s1rw0YAXnQ0qEw
	6EL4G6D4DU5FGBcd9+Z+2sMahGgHz/vARHr4IpYay00x/yu70ODU37I29ti9+nfk7BO2VzQYWej8s
	gWk1rt/MEw5w/c9sGY9dKkLvS7gmSA2NNTEvUyVTUSipdQ2JXeOZ29V9MXaCup7m04CVX0FIOKB5n
	E4uG6WUEU2YRg5wI4LZrwmqfDBXt4ivc8T0P9jLHKXY4S2/PxxmoJQP5chvpny1gVBH5Qc4vT/fbz
	TfWU3h9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTM7-00000009Q8s-3CbN;
	Wed, 22 Jan 2025 05:32:47 +0000
Received: from mail-am0eur02on2062f.outbound.protection.outlook.com ([2a01:111:f403:2606::62f] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTKm-00000009Q1o-3fKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 05:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0e6yaISQvHSPxHTh5LhAkumjZ+RkuYEcHESnVrn4sA2j1wGPmw4xN849Q80BvmLN9MTlm98ASae87vytd+5wRoOmG9eBqkVhaQsKJzuzXCAVRUteqfNR+urClF8ZWU3RnRgNUm30/OZ1zyvfaifOm3CQrBuJVLlqAwkZnvp2/lLXP1WxgPdDEmAGCqqFykJj4Fn4dIl5LflIEIdyhIjgQt11GRgAH7nHOiJ92ZXqW1GXQSs5Pol6Kj9Meg9Nu2QL/X6h+ouRiaMuElBCLz7mXRgMdjtBk+xvTQHndQ2MppHIqnhWdY+yf7TNdwScibYOPwXQ3qKUmgfH1Gq2ueDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ8VyTEdnsQJT9Vd2q2u5thSzgoYgSxfGogG769vinQ=;
 b=chX/YHS/QzxOHOmP6Qvh+PfnsMjhfOHQtMb1zt0PfL8M3lOcxtDlNWwuYxjmgpqVXAamfXOb2MxqJlEqVb+yNNjXHO7sSeal0bLKxWUzmvG6SiGmri5NJTdiTglqhkdN8oVeNUHkOdpOlHHyOEDSW0rHKrmTanYkg3TFDOJGCbeDHLTNvLvvgRDb4DlI2lwVJazjQIeWDy57G+K9iC4ZDGkDuTbqcfU4KeC1MRT8/cMJOu/el8JjlnboT3BgPH4YFUmFQegNu5tP43UVcQ6VB201qnbuOlMoW/cvlcohlAp25ZrFtgROCsh2r8mIaynXRs9E7ZDMZ4cqprRW2exYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ8VyTEdnsQJT9Vd2q2u5thSzgoYgSxfGogG769vinQ=;
 b=cCGCT9DpLLj784FqpmSy8F0Gi8BVaxg0isYKvQXYs+SED7yHwcIfxs66MaeMDiMc9jMrR/VEKbmOWyOFO6oHveqcpsty7W+8lEcqOLGH51hGQaFuwOZKjRs0FvUivh8vrle82cWVUkt2k/VwivcZOAMId1Y54RYID7oOisdb7Ybf7t1OGktSNrr2ku/GZRs/burIjZl0zuxyWUeWoSPXZScu2aFY9VBQ0nQgIJN5p6SWen+PanxdiaCl6BFO14P3BrUWBqITac9QTpYxs4UgpfDZzdsPcbcsr6zTJ90c4Hb5tzeBwyb5BXBvSjdFzkRTmum5FrKcxpI49p9SHvdvig==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10415.eurprd04.prod.outlook.com (2603:10a6:102:444::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 05:31:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 05:31:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Topic: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Index: AQHbbBZjcHLLf8FX10So5eTusHGTcbMhWsoAgADownA=
Date: Wed, 22 Jan 2025 05:31:20 +0000
Message-ID: <PAXPR04MB84591FF19A3CA8D37F2D97CD88E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <Z4-9rSwR3L9t7bHp@pluto>
In-Reply-To: <Z4-9rSwR3L9t7bHp@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA1PR04MB10415:EE_
x-ms-office365-filtering-correlation-id: 4393e92b-15ef-48ca-4663-08dd3aa6007e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LnDH4xCUZv4MMvF6PaDm7SmnnK0+79vkTGloJDycbUSDGFD02OpYd9x7fsWO?=
 =?us-ascii?Q?asN3oH3GtvEr2cG5/QB0h3OUhfF/yoy3xArFi5ksqjTUfc3a8rfe63At66tB?=
 =?us-ascii?Q?B8WBRDutKxLOKTB09O613CL6J+vB3i5LfJInberAsDBzkYD29igWm7tUAZWB?=
 =?us-ascii?Q?fI3A4Z+fOYwyJO5pb5S//D0WQXARFkF2Xw7DPUZEIfC0PnpTPnkjWELWg28u?=
 =?us-ascii?Q?IGwwiuADWjjLaRI1j/xp6WcFrkr3EOuIgzniAYm9iwbCe2xs/PxPRp6kZ70T?=
 =?us-ascii?Q?qvQD8MGF5PQUc8lro/kfuv0920aRUcUMPbDsYX/ACBxUUhHqA9c1V5q/WgSQ?=
 =?us-ascii?Q?07jbf0JWPfV74UhTT4db6MKCDgbvwipXaAGnFaGoh2TrQUxXo9m6nv3IcUPG?=
 =?us-ascii?Q?mop+AiHfeB7Dy3wqFtWSriQa2ifrI8AVuIwYruJ4IxzNHi9GnpIMKcM9+Cgu?=
 =?us-ascii?Q?nIQTvCCd8eGzUVjbyXEfPjezY7u2OhOyiKKI23OMa7ahnZC127/zS6NlzziP?=
 =?us-ascii?Q?rZ+eAXFxtyxUgCO/jwFj5iJN09anh833f4bdWQ20rrnlphiHAHrnnBfiSupD?=
 =?us-ascii?Q?ozYtf8vogkr0r1VDQuqmmEkMltaQTFZzxnLASElg8IBn1joao3/xYGuqcH1g?=
 =?us-ascii?Q?WGopGOg2f4KoyBpnukpyFauEkY4ZCwTs/9TSenImsQU9+UOyg6oyjPQk1bA7?=
 =?us-ascii?Q?H92L2/wwfj8UtZx2uSUumO1zMTfLAQRuRCusq1ZjdZe1w52FmFyAWd98ygfg?=
 =?us-ascii?Q?kn07lryR+/90rQhrMXGLnpe3owx3Y+aFx+4WFap9HmMdFj1oOqI35Js1LriN?=
 =?us-ascii?Q?UG2CT2Se0yDeCIvUhGKBnPJXy/lJRA6kuR8YFisY1+PNBNCPMs2VFjhteZuS?=
 =?us-ascii?Q?K+XcuIkhM56FqCke44/gKwNTErZfOQsTyWMPWYXpHRg2n90nXbebXTtzXhqC?=
 =?us-ascii?Q?jbNqlhBnQf2At+i5T4wdk3DC+w25Ul/Sp6HN5hvOI3QIbTzTTbasxaPUhAam?=
 =?us-ascii?Q?jWyAR0re9jvSjee9Toz5Gmyx4RXTpHrS5ZwYbDPBF/1CTY87iuzytJfbY4hW?=
 =?us-ascii?Q?Lqnsqpfj9PoGwrUoI93zWq/oM4EUfKYmZLN9s4KkqwLgJojhVT4KdB/KD9Nu?=
 =?us-ascii?Q?d4SDLHEL50czbiIXyzV0XFnj0Pjea0fwfjzlq6t39aec8YGVJPxvqnmHykwt?=
 =?us-ascii?Q?a8AYiQEoc3fY1cr2HMOmyEMl5wljQaJzF81hMTj4uk9ShJOtz2fEz+9hTK9M?=
 =?us-ascii?Q?+MwjoBxuhNDETdQxur55t3yY/srMAPKTwj5Jc+Ldlk6PUoCFCQIjN2O0WUDo?=
 =?us-ascii?Q?IJLM3r4UFhljPoWTt7T2dwE8Qz6FTUH2XfEdyWcTi+WZiFt8RsX3EhlO8Pwb?=
 =?us-ascii?Q?iT8lVBUJX1PQT09v8UhGH9mm/pnlDQB5DoJVY3cgmbsMbCbviGvyXmgNv8Tz?=
 =?us-ascii?Q?iBQuoCChA0GLFnzmQ02vWNhjoNt5FK8L?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RJZaDwRsyuKcE4jcUyZ18LCxC4lor0/Fz10Gi2K9uhfvvPsNRbyNof3GMbyY?=
 =?us-ascii?Q?dvDMceB0FYMBr9ZV9iVeXdN7fR2mexDvF91bAwKw8wIliIcSVSgK2xgxDnPO?=
 =?us-ascii?Q?fQj2Vl+ltLXpoxURqHwlL4/HBcf8j0iPu40ePfaguw/6RSwIk+1spvxLPPBD?=
 =?us-ascii?Q?7qlc5VRdZgjmFe9NHExyk+5vy4Y8cFWmXZv79Qvgmglp8wJ0Ll4kshxVKnaz?=
 =?us-ascii?Q?dJf2i2PDqjP3Tn1PAUxwYgKhMVk3j5L0d5qJAzYN8q/WodGDSZsl562PnVJO?=
 =?us-ascii?Q?nEn8za+MjuJ/5LePlctvzrrPTtxlvo2+jRqh5F+ZocWu3CpOJ9c3Ul0ii+9c?=
 =?us-ascii?Q?Eu7F9f9Op3U24+fGxchbTT5ooLh786Jj8NTBDfk5Tijw9auzZUDl/5Jv5CTw?=
 =?us-ascii?Q?sJaFI3FdbU/iJq87bxBukLFIMnoGejtD4tlNtwJuBmOoBlfweUZ6bcIX+CE/?=
 =?us-ascii?Q?kkvFVNtLZgZRqn5DvadDKkB3YueCk2WhTNCkBjK9KzWiCIFATOcsQIjQqWwl?=
 =?us-ascii?Q?vUr9FGyyQZIAg4luDnLMkeutBwcSG21s1xA5qYZ1niXdtlyaB22OReoYTffS?=
 =?us-ascii?Q?b+68v4SBWIH61ytZS0jKff0z4yKTR+2Ou3tuEhzXQ/NSzpFv8GkyaqWwFoyS?=
 =?us-ascii?Q?FnoIhcMHQVVxEO8UgR2I6270/0ucoQ/DQ3aYHWV1BGFXrV97ofcTOAU2WUc0?=
 =?us-ascii?Q?+Ym57EqbyK8qSPEiPyh5KNpc6Az/hpo2E1ibuzDP7AN0ELBhykrwybqNND/M?=
 =?us-ascii?Q?5fc0Go/LzW4fpYYK7OJzX9gVcB6VicF+jB7jtYF4AkWNSPV9N7/7+W46MNoa?=
 =?us-ascii?Q?O5IpYcxHBWtPvV4Dx12+75fP4m1H4NSYCnESDHlaX/QgWxDFzd+X+9pmx2tj?=
 =?us-ascii?Q?N2G1U4QuIvolCbDJpPTitaxMIJZsE7iIJgQCHU/y1gfGK5BdwS/wA8W+Q0E9?=
 =?us-ascii?Q?YcHa46k3AR+cr2VTs8MNCDG+s4EnwIiCUebc0Nl8dHESi+Z4niPiin9Zwx/5?=
 =?us-ascii?Q?sV8TNdG4SZin4R8ZWsqzcUVuxNMVvthJhnCZ7lZvJ/suXK4PEhdjWUYEfZig?=
 =?us-ascii?Q?Yc1ZHTzXVOKCNemVzfCWUdMkWOTGv7lo37GNed8efR3Q2HvbBbBLcUgICyk+?=
 =?us-ascii?Q?WPCsSOlj0O1CDlub18/U3Rjq/lR4Genwxc7CS2NaHGbE/DPpYVq7oiLN7E1T?=
 =?us-ascii?Q?BJYxTHZhwlZZaxPptoj3n1xuheSooHHjRAxpBjY3oWXsDKiSTHjBXQwnsxH6?=
 =?us-ascii?Q?4FfFL7dW+IiWnV9hqRoIhQIOcduhUdYWNsEtT/1mnrEPWvuNMi58Rk98OmhV?=
 =?us-ascii?Q?nGi5dyFKeYHYwXGPZJp+zO3JIq2LDBCDhJ6+A6jsOTHmZqW+KWUzqdQdMVyv?=
 =?us-ascii?Q?OsRCITWMjPRmmb0ZZ9In0tEutudBq3xOt/QonCwT4P2TTuTNmz1UiP0/JhYY?=
 =?us-ascii?Q?XQ9H/t6/FiQ5yzhJOyw4LFcUtfNXHudvkKJ8rlJb3gjhHcNHvwVRsgz2bgB4?=
 =?us-ascii?Q?bMMObylTfawboTGBGSbDO9NExVscUkw9Xmf57It6b7eh/Q0FByGOM563TnKf?=
 =?us-ascii?Q?ilnMHNoK7Vehk/8GnBs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4393e92b-15ef-48ca-4663-08dd3aa6007e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 05:31:20.3587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SgWIPgpaSbSGs4nf7UmKtmyho4SH56k2QNMbykv0b727FYNK43HHqD01SG+cgFewEfD76Fov46gzo9yXzvD+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_213124_916222_FB5888FC 
X-CRM114-Status: GOOD (  16.37  )
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

Hi Cristian,

> Subject: Re: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU
> Protocol
>=20
> On Tue, Jan 21, 2025 at 11:08:10PM +0800, Peng Fan (OSS) wrote:
> > i.MX95 System Manager(SM) implements Logical Machine
> Management(LMM)
> > and CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
> >
> > To manage M7 in a separate LM or in same LM as Linux itself. LMM
> APIs
> > and CPU APIs are needed.
> >
>=20
> Hi Peng,
>=20
> I see that you are really starting to like vendor extensions
> capabilities :P ... jokes apart

I not like vendor extensions (:

 I'll have a deeper look at this in the next
> days (togetehr with your other pending patches...),

Thanks for helping reviewing patches.

 BUT in the
> meantime a quick one...where are the bindings for these additional
> vendor protocols...seems like a patch is missing to add those in
>=20
>  Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
>=20
> ...even if bare simple protocol numbers (like existing protocol@81)
> currently these are needed for the protocol to be initialized by the core=
.

I missed that. Thanks for pointing out. I will include the binding in V2.
V2 will be post out later after collecting some comments on V1.

Thanks,
Peng.

>=20
> Thanks,
> Cristian


