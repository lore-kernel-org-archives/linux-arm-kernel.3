Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07047CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 02:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUbmjPnzKfd0NlFINWHxU23pEjXJPIB1gxaif+1S1yM=; b=4SA9lxL3oMeMzfDhVq55aCkUMl
	iPy2ulJtlv3H1Meg5kbX8J66OEJYXgW2OeTWt5uthgmq6VkZ7YPZZpXKJ3ex4XrWFaK6z2Kck2lR1
	QSE80g9dEEBu8b6qj4NQ6TsCE3qNtFrkH8xKEjf8QTV2Wv6PxqUat3W+N1OixipQUCr2sG1UmepQ/
	UmxKtEeNL6ZfigaQhzOFRK2HzFdtwG3Hr/mM+HORLIBW8On1k4akCP+r0J2TNLo1cMazCIp0xTbay
	qYBno9KSrwM9WoGhFWbSr+QZlbifd/rSl/GHVXnBp79vbjfJPnSa9c2R+9e/OlaWf+JPLsouQs6qw
	6S+hICIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoSM-00000002WVA-4Aot;
	Thu, 07 May 2026 02:27:18 +0000
Received: from mail-norwayeastazon11013017.outbound.protection.outlook.com ([40.107.159.17] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoSM-00000002WUZ-0IPy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 02:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKyZsB8rKQUqmBJNGl3w9jHur29mwfAB8OWCdMdCgrCacBQZdpVpRQ4LykuiZ2IL/IhscBc2lg3wH3ODz1l+hHbZPwKrvKZXJp+bLArENiLE1re6oSA96Gjrnr2dfaiAhbQFIVoEXKjZotUsMZxGIG92grokyWqPy1kXyHjfEXLEElNBwGYar9Qzg4DXm5h8ek37MypZ4GXCRNRNwPbQrlgc9O0g6uf9ehP0snbIFHYLfdKySIb9pqxY01H3oq/6ordrktW12nvBXKaHiHPRjh4gOUNaGJxGKlikyazS42gWUaCE28GUYkEk2AnoJfH1f7DVjER4/wtI59sPCtnfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUbmjPnzKfd0NlFINWHxU23pEjXJPIB1gxaif+1S1yM=;
 b=ZPxK1SjACw2wVFJnYeDQapm8WH12zVBZhM//RC7Hm7NUojs2D2MSeoOeceXc1EY8IMpmsmPTjOFPEftxyi/B+Ob2vWfZwJSD8Y1nJF9czfv0vWPJmPtDGbKMH6EPgl4ngZqwpv9sOX1XdJJAbHCPRimRkYAw2IrXsb9+p8G3LmpKdMm8KwqH7rvWAEvkx9VrJmIAcgu7CGFzlVD0TCqYj5sC80cNblFIqDAxmRsbgYtMxaKh+BCvjYZOV4Zc+Qp23VJD0y5ivansjugYRaP1640vWLDH/Y/SXo5+3SAsSmwFOwYV6pEtK8mpF8Y/zcgFEs6071tNqxEiM/Qcce0c2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUbmjPnzKfd0NlFINWHxU23pEjXJPIB1gxaif+1S1yM=;
 b=jR+B6fXUKrU5L3Y/hxNPcBi5AT57B7HjR0z7q/whj0aMVRyInRVYRX4i0pVTSoVy83tUJdbRkIebCRR9fbOaMLyTA94raI6mtYd5JAG/e4558ZaF4CIbytYgk5u3A/HSLPwxwJBLlMUXR+GaWCIRCtJzs18Dh4Wl3upKCqjUP7jQrlqYHHQorTT/iQlC4ON9lZTI+wut/JThrMzMQVVqHtPGbasTTgXzU2u2AsfG9IUeZtpr2y7quw3AYtScjn3CEVi0qoY8CwXtDjzHjO+SCeMSirZKeaq0YiEteYRmEvtrvx5U5OVo+9uztDHNAKlVlEj0zosCWfhL/gsfcXNU8Q==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AMCPR04MB12622.eurprd04.prod.outlook.com (2603:10a6:20b:76f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 02:27:11 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 02:27:11 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, Frank Li <frank.li@nxp.com>,
	"chleroy@kernel.org" <chleroy@kernel.org>, "horms@kernel.org"
	<horms@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v5 net-next 13/15] net: dsa: netc: initialize buffer pool
 table and implement flow-control
Thread-Topic: [PATCH v5 net-next 13/15] net: dsa: netc: initialize buffer pool
 table and implement flow-control
Thread-Index: AQHc2EvmLJjYRi98M0mOfSXCegXj9rYB4F2g
Date: Thu, 7 May 2026 02:27:11 +0000
Message-ID: <DBBPR04MB7500CA94186081EB8039A2C8883C2@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-14-wei.fang@nxp.com>
In-Reply-To: <20260430024945.3413973-14-wei.fang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AMCPR04MB12622:EE_
x-ms-office365-filtering-correlation-id: 16c26623-51c8-4248-b2de-08deabe024cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|7416014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: neMi2Z8fYXxsqxUXx7U2V9kZc2NI8+6sI8OQzZ8eHrX+rA1gvVY3OQB5nXNjLIpDBpROoU5gM78ovmZAcEMRt0i0AyrQJIaF/LgifgVxmodW9nQjN2yfHzyY538KtRWjzpsyYUXXycE8RCghndyUra6HHQd9J8NUvcNgUnYvLwkMbQtJpUWjnzjg3nCf9Ft6Cpft3h+R/53e/aLikhpQqX8rasBuWgLZkx6KiPhIfUdpXT2CHUJSBGYqZpqHGLkShMsQfI9FoNGb5oIN22MnaVGPO7mT7LAKK84hzyoX5/DAfMk6aYjvfen6fz6A783URYNShNLJFClwNHBmKbjR2f8IsLGsBC0MVglY6xQHFS51zuseSkZOnE9Sd7rkNwJV2kamEmO7Su2tga5WKU/f0NuFgqBaUfac6HCpYR/E9htYSLSaWevD6gRPW4fkAi3pUBj1ZekUh6ODiUFg4CE6g3tJZ6Vm6VvSmZJQ+x2y1Fy5t+vXPpMxw6ZKgtaA+xDbk89FRlwSYrhN8l9gipixfZJjE2CdqBD2zk4eYnTIbbzMgqaxAhTWGOxt0RDkbWnAFcnlFiE4IpUN9uEz1ls+NPbP0QmOqIkLqezjoTTdp/LL83wwjNPWLTTe/6GSK2POzO3jCGmDTu4fKexKPuhYNrVueRp9QWM2afnedqAPlLn0bJB//BaJaom4mBhBWgPr1jFpyZZTJB04fpBwxnmgrbvUOMmS66racpV4OMzxwmEtMYF1EsG3XZaDULdAFv5LaB4YKdHRi8eCWt58/zaWuw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(7416014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dStYWXd2NlUwdnN2Mi8xdm5GNlNQY0UvYmJUZ3RMeWkxemkzaWgycEZTWk44?=
 =?utf-8?B?NFZHTlFqeGZObWZaT1NyMktmNld1WC9tNStScGVSQXVGcjJ3VkRtWittNHVK?=
 =?utf-8?B?cHg1QTVnZktFQjd1WnJNQ1plai84WVdhT3drbGY0b1YrV0ppNFpxellxSTc0?=
 =?utf-8?B?bmUzMGV2M09KcmhHMnhQeDA3eE5IUUVadkZ5SWdRME5ybWpWaTFtcjR6Tk1a?=
 =?utf-8?B?WHpnZ2lNMjlHU3RoUVR5blFBemZnMTkzQWFyS2lCblNnVjlraUt1VGlmZjJl?=
 =?utf-8?B?eU41SEZOV3lHOS9ya0xzSDJJOG5JaUhPQnROQ0JwUGZMSEpWTTNaNXJqT2lp?=
 =?utf-8?B?d0tQV3FRbHl3amRhYWJ0K3NlMC96NWFZQmNHa3BEVGloVGgya1lUQ2V1K095?=
 =?utf-8?B?MDlUVC9HbHJBdWowd1Z2cjBoK3JuTEZiQk5FMFQxK3hYbUw3NXV6ZUd5Q2Jt?=
 =?utf-8?B?djBodHpHYVFvb1o0UDdBMEttM2Z4TEZGeUZiSUdnNFVFSkppeEFuY3d5M1Zs?=
 =?utf-8?B?UlRBalNxZHVRa1dBUTFxM3VZOVRtTXUrS05GL2FhaUdvek50a0h2RDRkMG1N?=
 =?utf-8?B?N2VmSDJOcFMyNEZHK1FZTmNmUXFQczgxb2JhRDZpWnUyOWNoMmY5V2U3TU5G?=
 =?utf-8?B?UGhxcXJmM3NnK01oc3h3U0x0cTBqZVd4eGs0WlAvWDBxN3lkYit2REkweDZw?=
 =?utf-8?B?UmladEhzalltc21NWTZaT1lwdXRlTkR3RFNzaFVnVW93d0lYUnprNHVKVGVC?=
 =?utf-8?B?SUZWcHJFY0tRT1ZyVWVkSExOeVQ1NlBEMEJNdmc2alFpTFV5ME9CQlRrbGlM?=
 =?utf-8?B?Wjd2OC9FYjIxSUxacWVIWXY3VTlOd0F4VWlzSHBUUWdFdkc3QVozZUduUmtH?=
 =?utf-8?B?KzlyOFhsYlJyMVpTNDR6eTJIZ2hUZVdBUEhnYjV3aVJQSmNTRzdROFY0UE5E?=
 =?utf-8?B?dXlIWFIrT0xQeWQ2Ujd3UXVQY1Y2a2RCbkRNWVVFSEJkTWtuMm0vY3Izb2lV?=
 =?utf-8?B?T3psN2tQbnlFandnTnhNandDaXdmM2lOYUw1aDlsL2J4d1JzVVVqbUVVWldh?=
 =?utf-8?B?b01LR1RKKzFOd29vQ2lPY0NCWmw0TnkvK2ZvYXJCcEg5NEFJTTRCeWc2M2Fy?=
 =?utf-8?B?bDNRVlpqUTUvdUZQMGpHbE05VHRya09vRG1zQW1NWXYxN2xNdzFZS1lOWUVL?=
 =?utf-8?B?NFQyU0dmUm9iTG5pNDdPbnNCVkZXOUhhcUR3TUk5TVRSMGxqb08wdzZyL1VH?=
 =?utf-8?B?ZDN3czZDVlp1ay9UZzNidlRmWEI5ZS9XWXp5bytiRnVzUFp0bzlocE4vem1P?=
 =?utf-8?B?WXVrVjB6cEdWcG11ZWVtbVRYZ2NxaWxJSjdaVTNyMDdreE5QQ1pwYlFuY3lJ?=
 =?utf-8?B?UkdLbEFPMjdYVVM5a0lmOUFoeWpLRVdhRzJVcVN6M3hrUW9mb1BiYUtra050?=
 =?utf-8?B?V3RZTEUwQlZoM1EvUFdFcDhIbVpTZ1dydklOTHhhN3pjM3NNRlVrOTk1Z1Fu?=
 =?utf-8?B?dElIOGhMZ1BTNWFsaitJNjB5TjBIcVloMUVzYk1FY0g2MnhZd0FUcXdtMHlD?=
 =?utf-8?B?NmRNL1dTY1QyWTZmSm9CTkl4YWJHNDFQaCtEdFFoU00xcmdySjlwamgwMXBs?=
 =?utf-8?B?ZitxTllPQkhvcFZlTGZJQjRpaHA4SWhDN2IzYmUxc1djSCtobjZldXFhUldl?=
 =?utf-8?B?Q3VZbFFmTUdpQ2xQYmJvekszbERuNld1NGRvaHhPcHhZVGxNMzVDM2dpRmh6?=
 =?utf-8?B?cDhiUytGNTVDMWdyS3JTVnNCUDFmeXBBWmVjdmE4NmIzV2cxdWZQQmE1ZjVn?=
 =?utf-8?B?NmQrMXdKNzBrckg5RFhDdkdwVnpTdC9IVm95bGJ3TW4wYmE0S0JvZzlnQS9k?=
 =?utf-8?B?L0grMkI3UmJKUGxCV0tsZWwrVlM1RFFKRDlzQ0swYVhIRk05Nmp1WldwQTZM?=
 =?utf-8?B?RXFNNjRJcTN6azlZUFhxd3NqaGRPcVd2YUJ0SFY3c2Y2NDQrNk4vUk9Zc1dh?=
 =?utf-8?B?Q0Y2VXVwcG8yUHBNWmxkNlRQVVB0ZWU4WE9Bc1JoMTlCYXR6dGRJTzdOeXVW?=
 =?utf-8?B?WmJoVkJVRWVNdWlJSW50QUR6bXBwd0R1ajcrSEl3NjB4RUZabFdmTDVKTlg3?=
 =?utf-8?B?U0FZWGM5UmwxUWovY0dIeGFLU2FjcEdNQ2JHUG5ieTVBL3pwZ0F2a1FhMHdX?=
 =?utf-8?B?Qk9tRGEyemJ6YmkzdE5GUlhQbGpEQUFVQWNwR0oydmhUUmJaKytpRlBRY0tS?=
 =?utf-8?B?em5vWmYzRmM1YjVGQ3drUHcxVjd0T0w2cjZlK1BOam10WGNQaWpwMXVVTkYr?=
 =?utf-8?Q?hsabWy/zV6RHx7Dc4R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c26623-51c8-4248-b2de-08deabe024cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 02:27:11.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LbrFDssUHfdJcFe7udej+vR4FjzrUbfoIUI9PdHOBY0jDUcLM/SmLQPIKJ9GQF9TS5Kq+TKCMsDqAbboJXWuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_192718_118391_3DA16CEB 
X-CRM114-Status: GOOD (  15.99  )
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

PiArc3RhdGljIHZvaWQgbmV0Y19pcHZfdG9fYnVmZmVyX3Bvb2xfbWFwcGluZyhzdHJ1Y3QgbmV0
Y19zd2l0Y2ggKnByaXYpDQo+ICt7DQo+ICsJaW50IGJwX3Blcl9wb3J0ID0gcHJpdi0+bnVtX2Jw
IC8gcHJpdi0+aW5mby0+bnVtX3BvcnRzOw0KPiArCWludCBxID0gTkVUQ19JUFZfTlVNIC8gYnBf
cGVyX3BvcnQ7DQo+ICsJaW50IHIgPSBORVRDX0lQVl9OVU0gJSBicF9wZXJfcG9ydDsNCj4gKwlp
bnQgbnVtID0gcSArIHI7DQo+ICsNCj4gKwkvKiBJUFYtdG/igJNidWZmZXItcG9vbCBtYXBwaW5n
IHBlciBwb3J0Og0KPiArCSAqIEVhY2ggcG9ydCBpcyBhbGxvY2F0ZWQgJ2JwX3Blcl9wb3J0JyBi
dWZmZXIgcG9vbHMgYW5kIHN1cHBvcnRzIDgNCj4gKwkgKiBJUFZzLCB3aGVyZSBhIGhpZ2hlciBJ
UFYgaW5kaWNhdGVzIGEgaGlnaGVyIGZyYW1lIHByaW9yaXR5LiBFYWNoDQo+ICsJICogSVBWIGNh
biBiZSBtYXBwZWQgdG8gb25seSBvbmUgYnVmZmVyIHBvb2wuDQo+ICsJICoNCj4gKwkgKiBUaGUg
bWFwcGluZyBydWxlIGlzIGFzIGZvbGxvd3M6DQo+ICsJICogLSBUaGUgZmlyc3QgJ251bScgSVBW
cyBzaGFyZSB0aGUgcG9ydCdzIGZpcnN0IGJ1ZmZlciBwb29sIChpbmRleA0KPiArCSAqICdiYXNl
X2lkJykuDQo+ICsJICogLSBBZnRlciB0aGF0LCBldmVyeSAncScgSVBWcyBzaGFyZSBvbmUgYnVm
ZmVyIHBvb2wsIHdpdGggcG9vbA0KPiArCSAqIGluZGljZXMgaW5jcmVhc2luZyBzZXF1ZW50aWFs
bHkuDQo+ICsJICovDQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBwcml2LT5pbmZvLT5udW1fcG9y
dHM7IGkrKykgew0KPiArCQl1MzIgYmFzZV9pZCA9IGkgKiBicF9wZXJfcG9ydDsNCj4gKwkJdTMy
IGJwX2lkID0gYmFzZV9pZDsNCj4gKwkJdTY0IG1hcHBpbmcgPSAwOw0KPiArDQo+ICsJCWZvciAo
aW50IGlwdiA9IDA7IGlwdiA8IE5FVENfSVBWX05VTTsgaXB2KyspIHsNCj4gKwkJCS8qIFVwZGF0
ZSB0aGUgYnVmZmVyIHBvb2wgaW5kZXggKi8NCj4gKwkJCWlmIChpcHYgPj0gbnVtKQ0KPiArCQkJ
CWJwX2lkID0gYmFzZV9pZCArICgoaXB2IC0gbnVtKSAvIHEpICsgMTsNCj4gKw0KPiArCQkJbWFw
cGluZyB8PSAodTY0KWJwX2lkIDw8IChpcHYgKiA4KTsNCg0KU2FzaGlrbyBzYXlzOg0KDQpJZiBo
YXJkd2FyZSBldmVyIHByb3ZpZGVzIG1vcmUgdGhhbiA4IGJ1ZmZlciBwb29scyBwZXIgcG9ydCAo
Zm9yIGV4YW1wbGUsDQpicF9wZXJfcG9ydCA9IDEwKSwgd2lsbCB0aGlzIGxvZ2ljIGZhaWwgdG8g
dXRpbGl6ZSB0aGUgZXh0cmEgcG9vbHM/DQoNCldpdGggYnBfcGVyX3BvcnQgPiA4LCBxIGV2YWx1
YXRlcyB0byAwLCByIGV2YWx1YXRlcyB0byA4LCBhbmQgbnVtIGJlY29tZXMgOC4NClRoZSBjb25k
aXRpb24gaWYgKGlwdiA+PSBudW0pIHRoZW4gZXZhbHVhdGVzIHRvIGlmIChpcHYgPj0gOCksIHdo
aWNoDQppcyBuZXZlciBtZXQgc2luY2UgdGhlIGxvb3AgdGVybWluYXRlcyBhdCBpcHYgPCA4Lg0K
DQpUaGlzIHdvdWxkIGxlYXZlIGJwX2lkIGF0IGJhc2VfaWQgZm9yIGFsbCBwcmlvcml0aWVzLCBt
YXBwaW5nIHRoZW0gYWxsIHRvIGENCnNpbmdsZSBidWZmZXIgcG9vbCBhbmQgbGVhdmluZyB0aGUg
cmVzdCB1bnVzZWQuIFNob3VsZCBicF9wZXJfcG9ydCBiZSBjYXBwZWQNCnRvIE5FVENfSVBWX05V
TSBiZWZvcmUgY2FsY3VsYXRpbmcgcSB0byBwcmV2ZW50IHRoaXMgc2lsZW50IGZhbGxiYWNrPw0K
DQpGcm9tIGhhcmR3YXJlIHBlcnNwZWN0aXZlLCBlYWNoIHBvcnQgaGFzIDggSVBWcywgZWFjaCBJ
UFYgY2FuIG9ubHkgYmUNCm1hcHBlZCB0byBvbmUgYnVmZmVyIHBvb2wsIGl0IGlzIGltcG9zc2li
bGUgdGhhdCB0aGUgaGFyZHdhcmUgcHJvdmlkZXMNCm1vcmUgdGhhbiA4IGJ1ZmZlciBwb29scyBw
ZXIgcG9ydC4gU28gdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlLg0KDQo=

