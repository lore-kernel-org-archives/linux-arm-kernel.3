Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D17CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDwdEDUcOvRgJczC/Pb2GZ5RGhhnw+OhgjLrodSfM8E=; b=ac+k4qVz1BSb8+qqfFQDxwKD22
	FXpp1VqD/BSd7rTMxC9C23WbAFVArTIGyoFW82PvtuhNXHVfi8g7lNlAWXQZzv9miKr97VkLLM81p
	ahNcsVOthJp1tCu5cqdPlenucJofNIJnsmrmgUZhRu0urE5+PaDcFcGoImy/MR7u2kbrVqRq7N+dC
	koLK7S1s/ePcKIkNmszbAxe8YkSxtlSzqBGL2AeJne61JAlLGQOuCvhl9XLt8GtsppFSDnMaXntYZ
	KzYNiPmU4q6IUs5RRU7mzLrscM1hhAnMZElmRSLkre5xy9S4siUtQTo+vK5dPbE+23T3ycHJzxySk
	dQHC/vIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAvQ-0000000HY73-2CE5;
	Tue, 19 May 2026 03:15:20 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAvN-0000000HY6C-1jhU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUwYzrs53lQfKXEt5OtYFoRX0rkg1N5MZF4QTxD9GYQ0DWlhDO334qQhof48UrWc05dCSoo+5pfsvRwrL5Kv9KW/9mczmsrfVsM9lZ4j6u2gQ+ken+sgWrqle8cvPOLCQYscqtpTgbZkfb50vWDOls9hxxMIjo9VZg2V61DuCOwPhTS/xMPge55slQZ6f5futx8ug0CpgrFkWxECJKcaSLcfe73vRS1zu5yhRnw2sIyzziT+R0hoa/7EG+p+sSrorihm7Uj9vrxUlDWFf/iHmX3AWdO4f83abXwyq98gi7xwDfYS1ScuJu6hawBHnQAY6q9POlzF43DEhy+x9H714Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDwdEDUcOvRgJczC/Pb2GZ5RGhhnw+OhgjLrodSfM8E=;
 b=gQcZVtqw43GTDk6vlAP1BkQ0nJW9Kah0WZMzUXn8mHnAO5IjpII6JX/BSuUKUtyBu57Mh2v9ZfAvPoQAucCvLtmeiEiYNXD6AJqn1j+9+2okMGu1fb+AeVJsxb5WH/MvSRtV62TO1Nufg7Sf94HMXVQ63pI6N5RFEpA6E5gyVAwf28PvTsWljTfbSbePK15+WAiKbLhw7mmq9kOUEkLKqhUG3IUcUA9KbiA0b3v2gUcfQF3UBmDfbx6ilit6lbkSN+KYDOVHL5RaMfKnGyvAZmQCCwzniXveAgcG7Z8ib6JppYx7S0vAvmnAl/A/9NtMwj11aU2rKY013VA6TwALxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDwdEDUcOvRgJczC/Pb2GZ5RGhhnw+OhgjLrodSfM8E=;
 b=e5tHBGjSO6XnHaosotgZ5HfRv/JR+1n1nt8J2DtkW73+Kaef/NlaJrsyxbrxA4OmPanMgmC8QSUNjbo/9t8F/hsIW5HDvTedZkA2i9JolW4Elr+F79BvOjvUukV1PDMyxXExjhox8ZLXWTbfCspsGVF23BQDWCBquv9S60zR6G0HQX9usEBBKpqQQ5XJj/7xRW82i1dsLgmfvD9WTuaFGXJCbyLwmInVk4nAHeKrkCeJC9q8vaZ71gOcLRbMkhGKP5MlPQO9AlBk3VgutjHlf/BrLM0XVIGbY/a1J8gc70vaxIJP2WfKcyJwqWB2J7HEYkj2YFguKEJTKGwkTeNtTA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYNPR06MB8475.apcprd06.prod.outlook.com (2603:1096:405:3b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 03:14:50 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 03:14:50 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, Lee
 Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	"patrickw3@meta.com" <patrickw3@meta.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc1-pinctrl
Thread-Topic: [PATCH v3 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc1-pinctrl
Thread-Index: AQHc5E588q9ImUX0F0Op+WUD84rxUbYPVlwAgAVbpcY=
Date: Tue, 19 May 2026 03:14:50 +0000
Message-ID: <OSQPR06MB7252FFE3CCFC8767A0CFFC498B002@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com>
 <20260515-pinctrl-single-bit-v3-2-e97da4312104@aspeedtech.com>
 <20260515-verify-awhile-cb0c72d49e91@spud>
In-Reply-To: <20260515-verify-awhile-cb0c72d49e91@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYNPR06MB8475:EE_
x-ms-office365-filtering-correlation-id: 447eb25c-b9ae-481e-9800-08deb554ca31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|18002099003|4143699003|22082099003;
x-microsoft-antispam-message-info: 8dsRS0va34GT3RlT+SKq2Cn1nL1DqnvBrk8jI7V7RklOg0RPI9C7JqSy/3hBsbIPsCh27RyJIxRGeoXVByR8FnMVqtgPrJd7rk3G7+23A+0vqKbnQ1FsZKKb4ItUjTZbt9szkpn9JmjBKDzjpPdZzxHJsM/XdTF1eSSmGD4iv7m/6vwfWmFOD1xOFEPR/fHapIE3fox6mROw+M+hNnnlAkxTbNHtkkynUrJ9Afv6bKJWcIcUCsutyd7cyyHhFzJ50nWzuSt2tbiVGz4uK2Gr2HoYpFgp+a5POYEPV3CRmC6ctFi6o4eGEJYUvrg9prDeEuljTqhcJG3GirNj8NEy5wRoHsMF1JkASzDtLRjNUE8vCZbMiSuuybW7olszPxjpieY1zhjcbtMka69EtfeSJLt+t4oUJCXuAmNrXa2bN1bC33Bq5vFZ9EKdko+Uq6tDxkPA97b+k+CqwD9952W9hK9CMgtHld8gPq3Bs829JGHV9sMTyGANfxYf5258Em+0nnvtm9RslO3nYMhzo1RzdzWW8r3uu45TYt1QS4WN2NyKTQJovVJ+JGNz1D2YkT0zGmWcOQrhqf2iKzaS4efDCGQeahzfVS5Hu2nWeGYg3zkhD9bDiFu6vFbKQIZ+jHArFAoG/rUK7ngA+A5bRjGlitzfnfGyhF/oyVMVW+ToSi0sN3ULUZ6VaWrHSzRfo5HTj0Irz6P6+7F4KzMuJzh36OmdGmjCbIrWFawlhEt8UAZMNDozviL2gzQKi+wnzHN+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(18002099003)(4143699003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vr8Pd8qN5c48yr1MPibYEM9vxRvxF+7+cW0/AK9hSXQOVgGs38YvwV7jrL?=
 =?iso-8859-1?Q?paBeffMu5XvPKcTvEx2iuWyOSLvA6yCDV8ti+aSST2Apb09lqOaq88xF8P?=
 =?iso-8859-1?Q?7SchuaxdSzSkpjSq6N3muQKLQMzfU5uLAKf72JyhIpQfqzYZROSzuh+WQN?=
 =?iso-8859-1?Q?INL/2fN6y7G8NPnXefLBBVYI7fD2UkxdfMFk/l8Ty9YVbGp6MC6bDh/V9e?=
 =?iso-8859-1?Q?7ENGa2JC/sJVLw4TIJ2ru0nyyys7Nzy98+BkhWFdAe3Ii9wMTvZfapAp4W?=
 =?iso-8859-1?Q?5XQuS5i0suIG05/MypWX9x/nngRfu05wZ6idSS3jMIDR22PhkcYui+aF48?=
 =?iso-8859-1?Q?2fm+j5qiYSwlG3gn12l8x/hA6uEvkVvpox5QE2Q0gKXZs9HLnEL7hU+QZl?=
 =?iso-8859-1?Q?goVmQsykw0d8I0S+/bJkUs3ydOLajehiDrR3i1kUKvFbti9V47uVpFOorh?=
 =?iso-8859-1?Q?FDoyRxIQR1MwP8eQEUlv6/571EsecRi94x+LzHKaKvXKnv3jIfx1/IxKX6?=
 =?iso-8859-1?Q?jNPtjUWDX0IyBXG3oLxlHzhXRcYI/rrWqN86ff4Jy3UyzbXST1pmGstRqN?=
 =?iso-8859-1?Q?PlO/gOwKxcp+DVbYYHpfE2HozwZHiOk78KOAlRanCOVgzIyRc0Oyesw5NL?=
 =?iso-8859-1?Q?ApgIlZkVSk4UlIa558d7SenI8DgONC1AlBdSKXIseHtPTHHRad3bExFT6a?=
 =?iso-8859-1?Q?F3T70e/EuD1tEylM/tmXSf5qvzlqw+6Ehw1WspKE2mWMd/HkLnlccJlke5?=
 =?iso-8859-1?Q?E3nOAWNk1g3ZuXEMrNiXTd63FWn3q8xyMF7ojYgtClDldZACear8DG4003?=
 =?iso-8859-1?Q?zx88NGmj9DN+Eg9uG4ky1qsJH7xK+WWbpzZJ9zU2sNWA4FW2OcmB5vmTpx?=
 =?iso-8859-1?Q?7Y1y1YJZpeaodm/IFg9JEtluR7L+t5K8SHnYoolOcnL0NVLL3/ejFsgpJI?=
 =?iso-8859-1?Q?LUTsERwj/MWky3nZsq/EMyPiDD24ITSeKJxchv9yUbPMUeFZcCyS36qQWF?=
 =?iso-8859-1?Q?XCvXYlqC4Aog+E2SB5bpbVjyjE+1YQwh0ZOquNe7SaK+drCmoTweS8gliV?=
 =?iso-8859-1?Q?toHL3dqb0X5V+ySnv4VUuEPytcOb8xKbLCaPajAMj4w0oFSbmdw7jZzEH7?=
 =?iso-8859-1?Q?BsPIwkAdXz5AQrx8XFgmVv3HBcx618agNF//no5KD6bCVrZnQNRspjhpXU?=
 =?iso-8859-1?Q?n8FcaDY2KR+rJCwThI3GtNL9kAcKvbdI0vwkGh49mJoo/n/pnSEQ7YLuyG?=
 =?iso-8859-1?Q?en+8vgQM3UoGYd8PbHefDG7/xhmqU8w8aimbyg14svrUfEtzV/c2jd7TFl?=
 =?iso-8859-1?Q?OMtjVX2FqzTaMdzuaE3hvBU4EBNMQDgGIP01gPOH5EX3E1N5RV+hikNaZr?=
 =?iso-8859-1?Q?gJSs3j+A58ep3c/Q9ow235BByx7E52Z+PmYnPDF3LYQW2rUav0bOWe5DmD?=
 =?iso-8859-1?Q?0ama/P2BTF7SwxGS4MYjEIvaMDa01s7Ow/GPNZM+WWZB/rl6Ued6/2NWjT?=
 =?iso-8859-1?Q?fL/Wc3bzWrEyNLn+HczPSHFqLpo/kwj9O5VrauTuAbRHr//xUbxoVUmJTV?=
 =?iso-8859-1?Q?XXUzaXv8jpYn5kXxmNzk/k8Fsh9MaGiMR38JNvEHDCiDNuQDB96qWdqvSq?=
 =?iso-8859-1?Q?hypPxOxSpVZ96KYSR1P4XtdNEaaUhE1cC6h4bBM9eKrjdQCOFumwpQvs3i?=
 =?iso-8859-1?Q?2XcV/tUebjbIfgDihAaQzV85LtaqhZT5HzrxfrUeYeds1oZhM5pJMsEZ1l?=
 =?iso-8859-1?Q?WNxjV3PftRS3fply1FzqWRyLWToZAmF6BjWuMHo4rp6R9bJFiq9Zk/I1iy?=
 =?iso-8859-1?Q?IT6RWtbzpw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447eb25c-b9ae-481e-9800-08deb554ca31
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 03:14:50.7141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtaymiiFyxe790Nw2xkg+ZnxRcRD9Zx/+UznddmTINMc0kU8yp9FFFnsZDYDoRBQ1iDfDUvSd9RpSyIW9M4MWXgmFlZsgfrCsnA7bMgJSKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_201517_745302_9898BA01 
X-CRM114-Status: GOOD (  10.90  )
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

> > +=A0=A0=A0 properties:=0A=
> > +=A0=A0=A0=A0=A0 function:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - ADC0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - ADC1=0A=
=0A=
> It'd be nice if you could use the other enum format I think so that=0A=
> there's not 700 lines taken up by functions/groups/pins.=0A=
=0A=
I considered the inline format, but kept the one-item-per-line style=0A=
intentionally: with 200+ entries in each enum, any future addition or=0A=
rename produces a clean single-line diff. The inline format would=0A=
require re-wrapping the entire list on every change, making those diffs=0A=
significantly harder to review.=0A=
=0A=
> Otherwise, I really don't like this approach but it seems to be standard=
=0A=
> on aspeed so whatever.=0A=
> Acked-by: Conor Dooley <conor.dooley@microchip.com>=0A=
> pw-bot: not-applicable=0A=
=0A=
Thank you for the review and the ack.=0A=
=0A=
Billy Tsai=0A=

