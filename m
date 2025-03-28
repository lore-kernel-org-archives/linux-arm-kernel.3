Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3F6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfAX8YlRaEhaBnuYjIKd6JG2gAva0TqPnJzNErGzfNk=; b=0TrJ8Dy/y4ntGqayusdnIEX0Y7
	xq9WE2zwMoB85g0D7rsubKkxUr3ZIIsRKy1YPmuunQCIFOfWRc9MV31IGkjNHlCZl8ImSdNrJBcVL
	58HoatQAOnWycmd8yK9jWoWqot4uLnyAlCgBm1XP0ZQrkEF4jGKpbLrXDq1Y4V7zvDHe3itJbt2wp
	6Z//awZ4gKP1j42frQBZnHqQUWkcBE0AdSTH6M93dAnb5faCNd83gvXklRcqYeoVZVvj7oss/IC0M
	BLtqTwZLlAlyu1nO0Pfdh6OR2tC3a4Cq2E79N7YA67+dgAQblN8/cOagxyKOTr5Xt3EjP2G0WJi40
	/8kDVWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4JW-0000000CoKh-2niN;
	Fri, 28 Mar 2025 07:39:38 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Hc-0000000CoDl-08L8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi2MGY8lqUx+cxitYFedKCvqxArPRt073EbIK8rQSNpzokx0SmlPQRrqUcvDqEigLYRCX4/xtFVcEqAfjWAl3bvc73u3jltRfyPW9a5aSJeHBbnAMjfgH+ek6o+TVvTRerzLkR1TjSxpu5Xyhda1Z3fP0/5vAtnOEp1opw2cSnCjg1PnRlkBC3VLVnGKZ4m6XEWcot1pDdP7dxbPkbw738B/RcR3m7POKASkSxAjDN3QH83mLxX3fdMO0gQd1+4WFxRnTkx2c0BsC8/ROnH5sJfdbChdZL23FffO/H5OB783Gx9GjqGljQGHgsOG1BydJmT/NOKaBd4RAEZgGoPuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfAX8YlRaEhaBnuYjIKd6JG2gAva0TqPnJzNErGzfNk=;
 b=hDrAQNWFPJV6uVtQQMB2TQBBZAtpLtuAfwrboyEguBjVkV5wdUiBJb66RSsZsRKUvU3yEhSr7B5w+OE0pyy6CZoWRwbU5jbPB7ft1Nw8DjvJq0eMABrLrxdjWGNOtYqcj6scPDlzGnMN+LeplhbfbEtH+2E7RpdU5zDgwTnTzMQecbmUxYAruaxx/lVAvkn2cavM7RmkP/mhwJqqRzQgh5SblZfm+EkFsjeXqct2zAucCTmWijIOn+9BhdRXTRIHVrOraox5CX+EFg9nTnpV2+ljN8Ci674wWMPDKuxYbslpLcknITX/YvboNYDYpM72yJz/S7L9Wi8FkBeZW2pJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfAX8YlRaEhaBnuYjIKd6JG2gAva0TqPnJzNErGzfNk=;
 b=GqPIC2PAvGspMPrTN7WaG3Y20bsRJVhRAX8AfN0N8ozzZAfpiy7MYuQMSt9cVUWN5D7NrUkdsNv+WFAGL2laKwvyU/epE3jybYkywZf1Wb+cSsbzT0d/8RL0A4nbPhs6vPsnC/2FeIZRHsSV9hyfN0h3bjV/md8E9xQmqDnyp+umMt+YP7kt/sqErTtVm4ROj9fD2PnrYr1l9R/ZELjOvu5EOdLDACyXM4tcGQl6iQioQUfAD5XGsI7aJXZOMbp1wLPVU/kFSiAABs68mqzMIHre90APE6D/B+K2+wqSzLGUT/G14qgD/swjO8jbOEb+ie2o/QFClPO8F3UttTI/Tg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DB9PR04MB8329.eurprd04.prod.outlook.com (2603:10a6:10:24c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 07:37:36 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:37:34 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Thread-Topic: [PATCH v3 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Thread-Index: AQHbnzWuD+6TN2bpakeLoV1CxDdKfLOIJ/37
Date: Fri, 28 Mar 2025 07:37:34 +0000
Message-ID: <PA4PR04MB76307362F79F848A8B7AE905C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-7-4e89ea1676ab@gocontroll.com>
 <Z+V9UCSN1L6lIVat@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+V9UCSN1L6lIVat@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|DB9PR04MB8329:EE_
x-ms-office365-filtering-correlation-id: 0404d3f6-3cc0-4024-5e93-08dd6dcb67eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?kdCN0FDjQ7lvsLYL9SBAyOCm8+f2wei130Owz+aiZ0G/aEF0Z6PIaLblrU?=
 =?iso-8859-1?Q?mXntL2Lz3PfF4JNvrUkDk0HkvtnrE6NprZG140L39QDcEw5o6dD1EtarDu?=
 =?iso-8859-1?Q?G8Jx7nyCIPQS597OoPyM8fvo33DGF2+MdJ2Fca7hoAGxUkOctXlKvpOf4y?=
 =?iso-8859-1?Q?TWR6AB/oBff5ySTObPzN2n+quzerfUHYsKSx+bHL8IdDnGYQojqiHb8QPG?=
 =?iso-8859-1?Q?4beAarHOZahq2L3+flQjSbBFPddAET/ysq+LNWXGScO9AAGApa7QjT3WcY?=
 =?iso-8859-1?Q?3V04VYu8QszUP8B6FBbupL5MlcdL39eiHWO3PMWDyaBqyYCJkroyBnQAee?=
 =?iso-8859-1?Q?/He8fSHSErWSPTHOWRnyAS/2iqsF2MOOLPbgQrpYOMSnVonj+hWCxxlvxB?=
 =?iso-8859-1?Q?JxBvCK+E8b/vuisF2WO4ybaIDIoKr8dx4gspjy2bQv74zQM3XROWRkRTCk?=
 =?iso-8859-1?Q?T5DTx6BU5AxiVRgeL3URameIXfGBAW1p9KNzYHRCcWQ1FmIXiwPTdGk4nn?=
 =?iso-8859-1?Q?dXssFXotcBRk914BeMifQlf254VFiaeZiEBdCRTRE5cidBBQOM3QqAwyml?=
 =?iso-8859-1?Q?6Eor2oW0MbYIDglqPdgQFg1nqTYdTLABSlA29kFReLfgkLLvXtMIgPBYnR?=
 =?iso-8859-1?Q?jcM8YUE9Sz3cZJN+qEq1iPQgbxvWZwASLJKESpeUj/v6fw9pFQsZzCDz6r?=
 =?iso-8859-1?Q?5d3dyfXKeUglJzHknsZyxv013qWQENEZh77VsxvkYfaSwcvYBlBr3Cxi2q?=
 =?iso-8859-1?Q?ZbTjQ85hzrg44ElO/ov50pXvdhwasszIP1aRDbfLLhcKVQTGQoeWj0Vv3q?=
 =?iso-8859-1?Q?DmWiqmGjOL1iShaBPVjvUrAgAXhhwCMwsbZ6OsleJa/Qs9m8BM5EK++FOv?=
 =?iso-8859-1?Q?i+LnnhHEgUkqfHd/v5n8Lmkv1Qvsrc4g5f8qgarnzxFxQZ3feHlqcgsyba?=
 =?iso-8859-1?Q?MpMlcii9qFadaX3D0hiDNkFfPaKauoPP7APb9KPLwVPn0LKQFMIdvWvVaR?=
 =?iso-8859-1?Q?faLtgI5UsoUmUm6zES/dcK9AzHjbCyBd9d67QMQ82s9rmlPGpWS1J+j17t?=
 =?iso-8859-1?Q?9BeUCAcpy6U358McZJo3tlnkKdk+qRXpa794TD9KsggsLVc/RAnd1tsE/Y?=
 =?iso-8859-1?Q?B286vLJs6/MGbke2/00o+whFIv5oemBKCqbb4+pa7hbeUtNAy7HvDdfDUb?=
 =?iso-8859-1?Q?KI0SG9qpWHH05SsiuhbIvQxTtEcSmP8zQnKwdokY4inZRWi77gc9V2WOpE?=
 =?iso-8859-1?Q?9G+sKo2nBVzgt3YKX/ikB2F4XyDHBRERDBGP0g3TQgYD7pFnUhJeFpZ0ND?=
 =?iso-8859-1?Q?2P8gOqXiDtHwAKd2qYUDDd7mXNepoXGnWuFHuBEeZsX0wur6cKRV9pCTN2?=
 =?iso-8859-1?Q?UDD1gpN349jf5NZWpOkYi8m+7cPG99JZGgMUr/muPO3YgdehtfVA6QAGea?=
 =?iso-8859-1?Q?Ku7A8lIoiq1aCaetAXCK6k7in2tlUQroMxUTdHlFgzgtaAA6LtYulXWKxL?=
 =?iso-8859-1?Q?MdxCR1WiqF12gcG0hrmyX/?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1ORRTBo2I/k1KVGSgVSBcJnpipxzndvQpHHXnBbiE2e1bMJd6TJwXenux9?=
 =?iso-8859-1?Q?2aTXDSqIcEGWLB28A2S0S/5wkIn9w2rzA980dXqrcAUXWsjpQMY48lDr4+?=
 =?iso-8859-1?Q?Yi9fzJgbFE59ZthhPnSnebJg8fpP9h2mvt1KSi6iv9Q7MYG6Gk5AbFm2ho?=
 =?iso-8859-1?Q?tqr8nd8SZG+8XJq7s7B47GCmZuRKNndQAAjs0ecpuBZvHtslDN6ie4YlP6?=
 =?iso-8859-1?Q?jPaSuFjR2UOEfZmZElCyBXxhaxXR6F6o9HT4ahYaSbNnYZf8OhmojsCNRR?=
 =?iso-8859-1?Q?3PWYu5VB4UGJMOaHQxYTzq5YbDWgzvD2N2rHpmAymGGAq9q2iJ8rttta+q?=
 =?iso-8859-1?Q?hLmAw0ghvVzStEN/z9cG25R3ZnmZvMJyGnfW6dS6R8xltll5lQNFQE1Bo+?=
 =?iso-8859-1?Q?k0uo1dny+Qt931VEVIc18LqrJX5oZTxC5i3bzQ8HqrGjJxPopVOJqkFV+4?=
 =?iso-8859-1?Q?Y9vGBhsiAAVwC6IU6kpPdXKy+5hWBMcvfWo+ErTYrVmn8s1rgY5FFwvVaa?=
 =?iso-8859-1?Q?RHkhAo3PYgE8m4NtEGca+0de1qIwF+Y2jZTEAHsff1whzBHCHA8+gHhowR?=
 =?iso-8859-1?Q?KScf5Tdc4UvPvtdEJc+gIbpLjpNUDMSxFEhvfW1RtsqNB6R+4uEGYHiuqr?=
 =?iso-8859-1?Q?BlFerd49Yfv1IExzCQ3ni6QV/geSOj+IwrIC0R5oJy9RV3hDtzZ5awSxcX?=
 =?iso-8859-1?Q?frFLAVTyeG0tgX8YpeNg+9xDjjs1TKhI4pXPQ2+FRBoN5H7fj0BBd80e89?=
 =?iso-8859-1?Q?w7DKaHjVC58nXmpW9t8mKE/od3bsSz8VLfbmX/ZK/OI06AgQT0uWSVs+KR?=
 =?iso-8859-1?Q?mNEhTCKxIgwaPkzgiEqwa+QvGQ03aSi5Px2yWurWWRxh6CNbMW/+8NhJ8i?=
 =?iso-8859-1?Q?JM8v5xxbIUYEvnhwNDl5T1aGrhaRpWBHI7RZ+mnUAxIi1tT7Ug9q7jIRrH?=
 =?iso-8859-1?Q?PN2Z6G/O/nxlYIUJ/NMuR8ZeNDnl0gpKUUdAVKJE55jLPeVlTQ+c4j6rH/?=
 =?iso-8859-1?Q?P8mtXbef0j8WF9FzinzROZtxqM7nuDL0eZno82GYCvWXXsIaz4B0Wrtm/j?=
 =?iso-8859-1?Q?WE6VO3+dXERs44aNDVA1VH2zHIASfS3ArB4Qf4eD4YvYqxSVmu8IjkAsGz?=
 =?iso-8859-1?Q?SA/xVorp1q6O+JnlmyrYlUippU3qLoJO7sPb/He4+m4U/dqFuYgDFXT/J4?=
 =?iso-8859-1?Q?nBnBdUnhbLBzMXK+9mr+aziq99MX4YS9XkqoEF48p0xHb145nNgydIdafM?=
 =?iso-8859-1?Q?CmzRodiJeKJ8bivbf0+SXbAARGgwYy9DluL4Ke4tZqo4pEwTXoIkd90HIP?=
 =?iso-8859-1?Q?gN8TBslZakLB59v1rffxL2pXyrM+VpXt6ZSotWCjzSlDWl3Kd9dscZb0Ic?=
 =?iso-8859-1?Q?Nq4lAhU0otM4M4ta9yzUcbcqYhpw2uCt/6E6EIEpy7Eh6vSg9i36cQAV5P?=
 =?iso-8859-1?Q?LODWO8FAMw1bgJip568v5FnWYHRMsRUuTCuqtFSMfhmSx3rgcHx84kHIs/?=
 =?iso-8859-1?Q?JlJQN9osIuqRN5TPvsFp9GEHTr+DNArl6SXNtPtRGrY6+3/EGEnk/w8D+P?=
 =?iso-8859-1?Q?zUJyofodfs+lqfinzC93mVOugZVe/9Nwf4gFCBcgommyP0cc30dTe5NDlU?=
 =?iso-8859-1?Q?VIuV3vrkjWJFXVaWNY8QYJ/xfQpJ0LONd+xSpZ8Is+s4fqcvI34Tg+a+v1?=
 =?iso-8859-1?Q?+XK9JabNNEyVjS/YSDh9zI1jdsDFQH/RGFPPAdOEc7k4BKyU40bCkIV4/R?=
 =?iso-8859-1?Q?bSoQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0404d3f6-3cc0-4024-5e93-08dd6dcb67eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 07:37:34.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fppGsNDoB3DDc06/T5hJSEi16Csy7zm/L2snzqGq3ts5QsgfYClkHfnU5kTkd01vaMZw6Rmm+jIjujxpD07wom+oRFG1oYzmI9KfLNq9XO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_003740_219723_D5AE1843 
X-CRM114-Status: GOOD (  16.57  )
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

Sent:=A0Thursday, March 27, 2025 5:31 PM=0A=
To:=A0Maud Spierings | GOcontroll <maudspierings@gocontroll.com>=0A=
=A0=0A=
> On Thu, Mar 27, 2025 at 04:52:42PM +0100, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant=
=0A=
>> comes with a 10.1 1280x720 display with a touchscreen (not working in=0A=
>> mainline).=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> ---=0A=
>> Currently the backlight driver is not available, this will be upstreamed=
=0A=
>> in a future patch series. It is a Maxim max25014atg.=0A=
>>=0A=
>> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far a=
s=0A=
>> I know is not supported upstream, the driver we currently use for this i=
s=0A=
>> a mess and I doubt we will be able to get it in an upstreamable state.=
=0A=
>> ---=0A=
>>  ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 ++++++++++++++=
+++++++=0A=
>>  1 file changed, 100 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-dis=
play-106-av101hdt-a10.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-=
moduline-display-106-av101hdt-a10.dts=0A=
>> new file mode 100644=0A=
>> index 0000000000000000000000000000000000000000..1917e22001a1815a6540f00c=
f039ff352801cda8=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-10=
6-av101hdt-a10.dts=0A=
> =0A=
> why not use dt overlay to handle difference dsplay module.=0A=
> =0A=
> Frank=0A=
=0A=
This may just be me not being very familiar with overlays, how they work=0A=
and when to use them. I guess the advantage is saving some spaces in not=0A=
having the base board dtsi copied in two dtbs on the target right?=0A=
=0A=
I am still quite new to all of this, so any info on when to use what is=0A=
greatly appreciated.=0A=
=0A=
>> @@ -0,0 +1,100 @@=0A=
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)=0A=
>> +/*=0A=
>> + * Copyright 2025 GOcontroll B.V.=0A=
>> + * Author: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> + */=0A=
>> +=0A=
>> +/dts-v1/;=0A=
>> +=0A=
>> +#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"=0A=
>> +=0A=
>> +/ {=0A=
>> +     model =3D "GOcontroll Moduline Display with BOE av101hdt-a10 displ=
ay";=0A=
>> +=0A=
>> +     panel {=0A=
>> +             compatible =3D "boe,av101hdt-a10";=0A=
>> +             pinctrl-names =3D "default";=0A=
>> +             pinctrl-0 =3D <&pinctrl_panel>;=0A=
>> +             enable-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;=0A=
>> +             reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;=0A=
>> +             power-supply =3D <&reg_3v3_per>;=0A=
>> +=0A=
>> +             port {=0A=
>> +                     panel_lvds_in: endpoint {=0A=
>> +                             remote-endpoint =3D <&ldb_lvds_ch0>;=0A=
>> +                     };=0A=
>> +             };=0A=
>> +     };=0A=
>> +=0A=
>> +     reg_vbus: regulator-vbus {=0A=
>> +             compatible =3D "regulator-fixed";=0A=
>> +             regulator-name =3D "usb-c-vbus";=0A=
>> +             regulator-min-microvolt =3D <5000000>;=0A=
>> +             regulator-max-microvolt =3D <5000000>;=0A=
>> +             power-supply =3D <&reg_6v4>;=0A=
>> +             regulator-always-on;=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&lcdif2 {=0A=
>> +     status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&usb3_1 {=0A=
>> +     status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&usb3_phy1 {=0A=
>> +     status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&usb_dwc3_1 {=0A=
>> +     dr_mode =3D "host";=0A=
>> +=0A=
>> +     port {=0A=
>> +             usb1_hs_ep: endpoint {=0A=
>> +                     remote-endpoint =3D <&high_speed_ep>;=0A=
>> +             };=0A=
>> +     };=0A=
>> +=0A=
>> +     connector {=0A=
>> +             compatible =3D "usb-c-connector";=0A=
>> +             pd-disable;=0A=
>> +             data-role =3D "host";=0A=
>> +             vbus-supply =3D <&reg_vbus>;=0A=
>> +=0A=
>> +             port {=0A=
>> +                     high_speed_ep: endpoint {=0A=
>> +                             remote-endpoint =3D <&usb1_hs_ep>;=0A=
>> +                     };=0A=
>> +             };=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&lvds_bridge {=0A=
>> +     assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_LDB>,=0A=
>> +     <&clk IMX8MP_VIDEO_PLL1>;=0A=
> =0A=
> fix indentation.=0A=
=0A=
Just put it on one line as it fits within the 80 columns=0A=
=0A=
>> +     assigned-clock-parents =3D <&clk IMX8MP_VIDEO_PLL1_OUT>;=0A=
>> +     /* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */=0A=
>> +     assigned-clock-rates =3D <0>, <1054620000>;=0A=
>> +     status =3D "okay";=0A=
>> +=0A=
>> +     ports {=0A=
>> +             port@1 {=0A=
>> +                     ldb_lvds_ch0: endpoint {=0A=
>> +                             remote-endpoint =3D <&panel_lvds_in>;=0A=
>> +                     };=0A=
>> +             };=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&iomuxc {=0A=
>> +     pinctrl_panel: panelgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157=
 */=0A=
>> +                     MX8MP_DSE_X1=0A=
>> +                     MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159=
 */=0A=
>> +                     MX8MP_DSE_X1=0A=
>> +             >;=0A=
>> +     };=0A=
>> +};=0A=
>>=0A=
>> --=0A=
>> 2.49.0=0A=
>>=0A=
>>=0A=
=0A=
Kind Regards,=0A=
Maud=

