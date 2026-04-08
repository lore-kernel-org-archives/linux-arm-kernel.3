Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599ADFD5F89
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thl/VlRtRCAG8/l486DdbwYWOadfiLXeSMDKznREDG8=; b=d7aTIyKKPQ2e/QuezPXjewtCiB
	VlrEgaHiGgxtP8ATLLonLEB2JlqpODk6pgfs13pNg7awyzP8WvN+Q35huHeRtZgTzhEi2Zh5ljhfx
	GaRkmc95GzCRvf9Cy699wPBsjhB4GPVM1u+ZFf749psJN6F4IrjdwNEjiItcsy/AbO62g+xMQ57Uu
	MTOT7yrxdg6T0KCCZMStzvrPteeuKF82qQjVBGuSwgF88dhOLV1+ggM8ntfKvZrbmPxlDG6yCIbUd
	JQ8t6FB7AV11A8c3gauo9GI2lhDeCBfnEwW2BKcd5CIJOW1O6HO7lf9BYpURWJcWoFnKyA6Vi8ISg
	BX7ItZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMxg-00000008NxL-2u6l;
	Wed, 08 Apr 2026 07:04:28 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMxe-00000008Nwh-2pZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbk5nOJ7sgRd5U4bfrcz3WQs2D6i8wFJc+i6Zc409chZXXfqO5EFrqb4+ICmEJbOA0iue+xdcbEHkZXuDJ2fKfduMhG3TSCQYvj1IKxGvASduInzCanxLRsbcg8N0zVO1sjyJQPdb8nAmMWRdhUhDkax8YE5Nu8xPp8N6TbVXZ0vDHBwCcZJN/0Y82aR5vG5SLgwA1K/7Yv8+y8oGWFQK7ViZAk1o/We6J7Ijf7dtekO9TB/0i3Khdk2nM9avpzSQ8EBJ1nlHfcdFwLkpvo9a/N1Rym9UbagSpxOqluV4wpVTG2a0COF6ujSicaKHQBuSPlQC+B9YG8k2MVvwr6GhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thl/VlRtRCAG8/l486DdbwYWOadfiLXeSMDKznREDG8=;
 b=IZrI5loG3mvRvP7WblP9gP+6KTP5iBQC6/jcnnoXL6WDuoNsX0N2jMWSLOfPtCHIhjBsdkj+ImnKmFlMNcdsMnUUudy30EdG+Wor9xGCjuRIKA5lMUgFbq9JfRx5sebVcQdFZM8Ip0L310Ojzzmcv/Mh9iqb9x23Zw2Jljhx42yBncggIQUOh/vRY7ma5/KFFJjHTHS4GbIn6EnJbxDJwIcpQ2qE4bSIUudbaV8N1h4Qqb7QNsjQ8x/irUczz02GPdDk14VHIFI2i+L254hCa9KqRAEym3r80jcZnJnJszkAJWd5uoZPHX2b4ZvpRtr9+I9/gHU5snZMySB2QXwB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thl/VlRtRCAG8/l486DdbwYWOadfiLXeSMDKznREDG8=;
 b=Kl+d9im2Nh0PsFFqg6Quxdld5y89XMqmqyHtNU9OdGh6iiND8edEWL+npGHlHUwCJRpls0FMcA4xa/F5MPdp46icVR5A81jOLuIAQBmcP9h7g1ThIOH4YC7eW+5maCRU57k2ihfRXh2lNhK+DV0lvaybRIXf+2DZnHNrrUfxKmUCKZ1vOxnEfhZdSkNOFSjmi+BzKRInS+FUb06ewUT6Pnm18BZtmVLjPeKJavjyze1kHZPGwnVGm+UVG4MiQEclcyJ/7QfJC1JypSxMSYkcnPcJyoSdzAw0G1nal4bzQYkHTCvqGkVfWT+Y5IHCX0CaFuM6OeIFLou7subSn1Nu0g==
Received: from AM8PR04MB7284.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::8)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 07:04:20 +0000
Received: from AM8PR04MB7284.eurprd04.prod.outlook.com
 ([fe80::9cd6:51bd:82b:98dc]) by AM8PR04MB7284.eurprd04.prod.outlook.com
 ([fe80::9cd6:51bd:82b:98dc%5]) with mapi id 15.20.9769.014; Wed, 8 Apr 2026
 07:04:19 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, Frank
 Li <frank.li@nxp.com>, "chleroy@kernel.org" <chleroy@kernel.org>,
	"horms@kernel.org" <horms@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v4 net-next 04/14] net: enetc: add basic operations to the
 FDB table
Thread-Topic: [PATCH v4 net-next 04/14] net: enetc: add basic operations to
 the FDB table
Thread-Index: AQHcwQGRdpZmLUMUwkGdnLHx3d+rArXMjUAAgAg7X0A=
Date: Wed, 8 Apr 2026 07:04:19 +0000
Message-ID: <AM8PR04MB728494A137BF1BF72B39070A885BA@AM8PR04MB7284.eurprd04.prod.outlook.com>
References: <20260331113025.1566878-5-wei.fang@nxp.com>
 <20260403011727.1795379-1-kuba@kernel.org>
In-Reply-To: <20260403011727.1795379-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR04MB7284:EE_|GVXPR04MB10611:EE_
x-ms-office365-filtering-correlation-id: f7a9daf8-c38a-4715-41e4-08de953d0e50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: ueXBzHzvQ1mR2ouX/KAFfKi51ph0waxXll0UWJi0hhMcbTGK7aSSa+QnfXFQO2TH5pG/dthDsy7AzrA+U+iwnTROQEI5HTdKd5zU0CQOVeB48BImoNWiYs3bcfseivNrJU3P2TmbF867Z5scTZxzVmAGSeJCA/7bw8YfadBR9BpXfxlCdwfk+a2qE0vjE5biIE1ITh4KXQB6ayvVrcA3Z+f6DkBzpYg1349Zu626jrv46ILbEShkI/4dHedrRSc/xJ0io28+n7JZmRFANZltCm/gMXg8mY6MD1/4Ch7uPBMul/w3MH4ZY20Sz+B3tGaUZIOANKRFB5Pyur+PDNe+96but8b0hjSCBk93aUkvyTmbVUr1bZ1ep4CUnfq3RdS+1TK1Gw7z6vFyw3+AjR6n2+z0H8KZzlj//+Sq0bfVlMEcw16nj8arH6sjscdL/Rm+YEQpEopukpXEyt3lkyUrLKHBrKaNEgoi03MyPWJl4zVsGrMxjpbd4J5M8DET+b7uPjP2uwjWAMSzn04IvzorQ4boHiWvPmdVVOY08i2Yji75+yevepiQX4QhwPl3FGqiR8hJXAcHbVfx1ot++R90kMhDr8jIRJFgWOHPXI2Rr9rICTZP1jE7kkH6DJ2vetXQtzcd5DAyPP6F8RuhxGx38bTaaFbMS0tJoyn58MkE/9S13u63j4VD3J3N+RCqq4LL1HFiQoPCBcVzff0CjKCAV/Aiw0bAnvqWzwYq5geEdwr1yZxnTDUejD86h5khru1QZ/NvO2xGZEuRrZ4VWa3fVe0kUZyXGjabBsfRP7THAoo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7284.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o+107Qtb5q5DJ1Uyry6l66oz+Bg9jEBckt3KHfIN09FZqINPR+q3BfhNhNhf?=
 =?us-ascii?Q?sVbbiV7GBa1zLpA+QZv2SydLzxkW/znru74uZ02kaCQ2mbnnQaYHQDjNmzPh?=
 =?us-ascii?Q?Mv9L2DW9ujkNqvkgC8/lQsX+2RT76er3SomJvyodCFzbt8+FvpDf+zSXziYp?=
 =?us-ascii?Q?esI/D0lHn0SR8DgNyBAjmORgFR2SoCN/hW+6qYief/euZfevoVG5s3plQ969?=
 =?us-ascii?Q?z2Tt2ngbJIE78KczkSDShVqSzWBlTaVx8X1a0jZwT5LzFZWmgeqWIA1zwol2?=
 =?us-ascii?Q?ZAW1QISNVkxLkSV7I/oUKYoalnhGWD0T9EglU+vHe/HgndZZb24kaLkD+oYg?=
 =?us-ascii?Q?rRfAfg4Rqxm3Wccwux2ZFdog6agWBqq1pyREQsoy6WeZcegx2jDeZQv8SN6W?=
 =?us-ascii?Q?/onhmKG83qge/+Qn7gkq+1fEqn4V+FDuj924EmfXoITqANghjNDcPe2GcIF1?=
 =?us-ascii?Q?A4mWQXkRbTzAQjWa2VQwNGUh3RpNpwtY91AH0VKBwDHVxOHAeIe4W6Tc80NB?=
 =?us-ascii?Q?Ur/Z3ARcDSywZqIuYMvuz4J3T8fo6IOLqrbTM437LIvAGeZwW0QDRT0e2rGL?=
 =?us-ascii?Q?B5dV2ZFgwEBx2OOL80CquiWb3LIh9UtScEsVfhjVyzh9i0032osJeG9NDHya?=
 =?us-ascii?Q?75t8Y3dk057Q15fIqjLC4xrfcsEVMEKR9dk0gHLma7ky42ufC0Yy5m5a90m7?=
 =?us-ascii?Q?p9JqDP7wFjuO+0nLkdFKmbmroNHK428jA8dC/qkqPxI1r5le5yoHGRqpPVve?=
 =?us-ascii?Q?hNYxza8LTQpEPEpUs+BkgfDfVCPbkKI8/MNyO4deu9RZr2idBAOJUcYTsZ2f?=
 =?us-ascii?Q?Ci6BX+SyOS9n66Bsx2BRfe1JR2jIyHTfNr25s6pA+iPsiHEGckH2LAztjp20?=
 =?us-ascii?Q?vlTfavXhyZ6khPY28ih8W9UFTBZ8deDy1/BsMcuO5PGtdQzm690UWffV9Buh?=
 =?us-ascii?Q?TUDsH+86h3FkxE0BOM9Py4Eam+YCgkPPZvrN1yS6EXd8EG/IscNPfzp6tfcu?=
 =?us-ascii?Q?WLfII7c2geF1GTYXAjkz4r5WR/CqZzHmodEdmpsAEH+tdXl9gr2atuEIWW5y?=
 =?us-ascii?Q?psGKcf3+rJUn/3Lb8uoSd6w7NckoBuQ/FaA3fUt1zPEu5fR/qZasC3C0nOXp?=
 =?us-ascii?Q?LbdTrnhvk4vBTcMk1rBsD04lo4hapCZyer2vAvgpTzKx8iOwKSBKBtD3yfcb?=
 =?us-ascii?Q?YjQa2WzVYTNIhkssPNwFt/nIqCQ0iIvfNgpEZ7y0cObXN/9hKTipbKo/N+Oi?=
 =?us-ascii?Q?BF9rmisHphai/tNobqRz8Nfiufqn03vBVO6/Wz/LSFFz/7JAnffaA4bLKLFD?=
 =?us-ascii?Q?65q2i9c1cr+mlEIUtvwhKOS7I4WTy9JyvpVeuVJEa6lCLkJEtVB2ZwUyPjHY?=
 =?us-ascii?Q?fMlprXdSZEjfi/iMYDcVJ/HWMrPGYyQ4ymRzOpxBIpjE5ueshXLA/4/K8Llo?=
 =?us-ascii?Q?Mi4IUWpxNpMJdFz26qckUgq8rYEuNzmA5N2NX7lrqUGznqPgbFkZvcZc5LFw?=
 =?us-ascii?Q?FI/qBimjU9AKxvDfiwj6YgAVS70Aa+LHna/nOl7kIlZ4f+lHjFWdWNFz/23H?=
 =?us-ascii?Q?BTT/arnAuqjjRMGzLh+6Txz+VFrU0jINw9F3R3/ouo9iKIMNyTgfGFz/PcpV?=
 =?us-ascii?Q?YuYjEuRl+HrNb6YQJtz8mi4pHgM8TqpBZFnA8Mg+zIOWwo7HbR8sGhWfSknS?=
 =?us-ascii?Q?z8U8f+hLX2A2hk6RpzEHRiYKS4hepDHHbFlsM8/TIOWMp2HW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7284.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a9daf8-c38a-4715-41e4-08de953d0e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 07:04:19.8716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFX7Zy9+OoCQHNj7cPKTIDf0UPQ6V5GTDlQGX334hGrUjpkC5At9DFPsVFBnX4/NX5UwAEpNgHoLdsys+/dTkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_000426_754332_2A094179 
X-CRM114-Status: GOOD (  13.59  )
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

> > @@ -116,6 +158,31 @@ static inline int ntmp_rsst_query_entry(struct
> ntmp_user *user,
> >  	return 0;
> >  }
> >
> > +static inline int ntmp_fdbt_add_entry(struct ntmp_user *user, u32 *ent=
ry_id,
> > +				      const struct fdbt_keye_data *keye,
> > +				      const struct fdbt_cfge_data *data)
> > +{
> > +	return 0;
> > +}
>=20
> If CONFIG_NXP_NETC_LIB is disabled, will returning 0 here cause callers t=
o
> falsely assume the operation succeeded and proceed to use an uninitialize=
d
> entry_id pointer? Would it be safer to return an error code such as
> -EOPNOTSUPP for stubs that have output parameters?
>=20

The ntmp_fdbt_add_entry() is only called by the netc switch driver,
and the driver will select CONFIG_NXP_NETC_LIB option, so actually
this inline function is not used by any drivers. I suppose such inline
functions could be removed. Thanks.


