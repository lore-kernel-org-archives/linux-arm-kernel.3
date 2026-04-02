Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3068CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 04:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ye8ggPnRGdOHXMQYE2mEMQaf4+h2GkijZg4ZxahkCt4=; b=NWiJeLt0Bs/LedeutMVsviaCF2
	HrBxFKh12nXisHTJj2WMXtixnJRde/9//I96PWkmnXQNRtOmSR3MFRBqXobe6/LwO2We+e9MS2XJz
	uxX7/y3VW+A9OY/63fELrhhcVxF12KiwFre5TlE5n0FsJim8MfkUatfDGHR6oHuP7at+knX1dNVkQ
	IMhWQtpClI0MfA9hrYMuRs0rKTfiPM4lqrEk+r57ZTiYk4s+/ebXtV3+5nEH5fcE43B9j37GE9tal
	XYSDRCvUbAJdFYFakyF4gEH9Ly4Y86KZ4Mz+FRx8zkcuWdGJPDSyG8JptuK4RQG67ZP7vA/ZifuBX
	a3AROaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89wr-0000000GmIW-2YSw;
	Thu, 02 Apr 2026 04:46:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89wq-0000000GmIJ-0YgR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 04:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ye8ggPnRGdOHXMQYE2mEMQaf4+h2GkijZg4ZxahkCt4=; b=SAO1CddG7gS8xgPxww7d82FpHx
	A1YmhGx3v4fW7u6ae0HSKCvQUTLWbzaYbomIZNwV1da+4xbZn9NfXt2zG3lCj83dzZSD7JYwiMyhM
	QUZb6zoDet1daQPudHUQYmah59x/eSI6ho7CBnQt9S4mcYjOH3jwRZLSTgXK3zQ4rpaOfS6FjPed/
	zuQU5IueKULSpDppRfNuk22sRvRygRuD368eQjNEcqqNRr2+ItagiNJV4eMs9Rv8Ke3ISd5zYDc+k
	NDKPNmIChY40Mxwt3ve/zzHragMESAYgVn8h1ENXbgqf6oIWQyRU+rT58hp7j5ayWr8z+7pX7CLUD
	vp5s1ypQ==;
Received: from mo-csw-fb1801.securemx.jp ([210.130.202.160] helo=mo-csw-fb.securemx.jp)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89wl-0000000BbN5-47sD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 04:46:27 +0000
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 6324NIi62789399; Thu, 2 Apr 2026 13:23:19 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key2.smx;t=1775103756;x=1776313356;bh=ye8ggPnRGdOHXMQYE2mEMQaf4+h2GkijZg4Zx
	ahkCt4=;b=bV0AOOtlXdDfHXsMgsO41kERQwCFeNlSQj85mu0WQ2MoEwsU3D+wiXOzIcI4BecAVbY
	M7EBjxjNqauvSbvLauc6qAG6q5IMZS7zXH+aObZCK0TuR8sH0jKkVe5xhHlXhe6iCKgWXDH3xSGU6
	i3zUjh4LACt/GqjBmnG1fe35Z2vz78QSob/i3vu/V3h6kRudS9uXGA9Fpd7OhtKJEftFoD5IPqCYl
	byxfOdYZQYIuxPTI/DO6b9g/MpqozDaU6fDE6mOAQxPeRgRPYR4ql7/ehze5igknxn1ec8BWKryTr
	GGHoYaOkbcEkQnJJ82AHHqop+QUseUWfrPbGjtmhkU7g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 6324MZ982295551; Thu, 2 Apr 2026 13:22:35 +0900
X-Iguazu-Qid: 2yAbEdUNObgh6pNvhx
X-Iguazu-QSIG: v=2; s=0; t=1775103755; q=2yAbEdUNObgh6pNvhx; m=RdkoZWakRrwq/Dto5niliutZSjQYmHqfyvhGWCmPQOM=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4fmTGf16XrzyPZ; Thu,  2 Apr 2026 13:22:33 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+bnGweZFLNXCYPE5vvsmo/Q9uWpnbfR+iNsQbPV0h81DzL/VjiZMjPTILaLqAHdZGrQp8vly9/yKcZ7I9WmQAFBcVjAGwxJn3RU/XDZpnEQtUAFt4qo/oTMjwukFrWI2RKiwXUmO3KEw7DFJpC44Lbk+sTdG4+IIAjZBEqigQ22GUoYH0AFKoO4nekZrdqQSfszg30aOqewsAnwGwNzaLkEF8e1P05SVSrki+ja/2f0aZvwaXS0MyV3PcITZ+zLQ0GQOCrR0nhhVSeEaYjJifW7LmnAep/x2fA6O4Zw9kbHGpjS2BqqJ5B+g8V7nvcuNP9jU3VgPZt2ciVBt2qVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye8ggPnRGdOHXMQYE2mEMQaf4+h2GkijZg4ZxahkCt4=;
 b=Fafd8rO4ADWxxITmReT1rfGm2xIDqhwATOlHNf6wjEscl7aAxXqPVZw5JYJa5tf4ffz1E2DqJufO9Skn6CkqPP849uyYOfEtPLRQN7LcoecnPjOOvABeIC43+Eh9kb5IL+bmojp/E22F3m6iz8wIVp9+WWgqccLtwYEhVX/OqDaDHj58y/vG3ZkNMopxtIfzqiQSLE/zSHdtBVy2BGPV0dcf4yJVAdRfCoORYPxuZRVd1WZz4bGmce+ePJKLAgSVHnmDsIqpoQSZ9KZLT17z5T7PECsGqczg3yhaZiuE5M8wn5KSLl25/uuSdEWZUtuNSpJQsOqh9SUkKHY8y+rLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <benoit.monin@bootlin.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <rosenp@gmail.com>, <bmasney@redhat.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
Thread-Topic: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
Thread-Index: AQHcwFImnMFSXBeIq0CCUhVteUxzabXKJeYAgAEJuLA=
Date: Thu, 2 Apr 2026 04:22:31 +0000
X-TSB-HOP2: ON
Message-ID: <TY7PR01MB148187E763784C1664C287A6DCD51A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
 <2787121.vuYhMxLoTh@benoit.monin>
In-Reply-To: <2787121.vuYhMxLoTh@benoit.monin>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TY7PR01MB14832:EE_
x-ms-office365-filtering-correlation-id: 8b3755eb-a55c-47df-c646-08de906f74f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: PK+B1nCVQr9cbv5qtf/C+PCCtaSaFHrH6x00eIVX93aKTwzeTX3DdLggUXZqv12q4xadaXRsH0H9C7nxskFF70O3Q55YrS5f98X42MhrOiK1+hIBcTYfAGbTwKbBXp4e3KKg9XW4JOgl7YxoYHDBh246L52EW4+VFi40cQ1WagnPVrrRDt5KaJ6eOPjjLsPTDbsmksDe48+/x4bFnE7uFrv5H9nQ4DMvUu+OdU//GeXWniSLL0mYS6IrXxAPVOuDU+dU4UVQ7p3co7Izv52rj7Dgumoru7Wqh+wQnJ1PkKlTDSgZr1BhohYk60hQmrDvh69sd2lKwP1yAp80m2kPY18QYaQV44lt2xY/rVv2ppX+uG67BqWWBjEPYYmbm7Fqnl4W2igssp4TKJy8ytxTfa4rHx3IHBEd9GBt5h5nrh2W0IODFe+XQtYVmhiqCpP3HvVD/OCrUkUqn5o7vdNUwhWyAv3L4F5SNVr96WGeSH/2YZ3Eq15NEs5vmDFP7VMUEzReVJ+MUVgAU106FdkXOMywxTf2u1oQyobh+a56wyu4XN0wpHmSZ1FyGKhSt+lOn5HMTFqYdZxJqSznZseC4LAqpgdoUCQom/O3+Is79fy/OdWr/G0y4vBQRbWfS69xrjX2A8xp+faV79MuSfKftkKvvjKVs1RfU0jCkJlGZU8urL4gGMhH/Uh50sc6toofYlIe9paU6SjWBUCLwUJ9/YqhRFetyiG+X9SoGBZz6+g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmlQWUg4VDhCUzFOK3NHMDlMc29BRWxsRTE5cTU5eWlab0lpby9PN3VtM1I3?=
 =?utf-8?B?eW85aDN2UkVFRFI1YU1TUkV2QjlUOWlwckpuSWN1SGc3QU1FK0krc3N6Vlc1?=
 =?utf-8?B?SzdYOFlJMTFXK2xycFluUzdLcThPS1FWejJDMUdoWFFzNEcvck9VM3BxNnFn?=
 =?utf-8?B?MWtIZEltaHNPVTR2eTBSL2pwVngrNG5xYmlLbTBIcEovWHJsMCt0YVZYZW10?=
 =?utf-8?B?T2RtU01OeThHRm5jOThMbDBTRjlMS3l6SCs3dTNuQzNwQ2tybDF4OFl1SVQ4?=
 =?utf-8?B?dW00MklXSXdYeGlOZE5YOXZvN3h0OU4xWlo5OXZiTVFWZklaKzJMdEMzcS81?=
 =?utf-8?B?dlo0bVFwVHUvTkNqQnZ4ZWtNLzVWa3V5RWxYVVJiY1NBQ1dYS2lvenFDYkg3?=
 =?utf-8?B?U2lyQTd0WXNtUU9iUHR3WlN1WmNlM2c4bGdTMzRHbEhCODlCZ09TeVBBWFZV?=
 =?utf-8?B?QW9GcTVVZ1ZzekdUdGR4TWpocWdEdEN6cVVBdk9hbU5tUVcxNGl4Y2VXNFlT?=
 =?utf-8?B?SEs5Rldwa0NhaVEyRWZCcTBWOGJFSjBybGFJTU5oTlJSbVl2Z2NkVXIwa3FZ?=
 =?utf-8?B?NlFVQ2loUHhvclBaTVhCQkJaa0NvU09YU1V1bGNKQ0pSRUNjeStjeE00MG52?=
 =?utf-8?B?S0p3MjdlNEUrL3Y1QzlwUmRldE5GazhYb00wQnMrM1BjbGNaelI0VDRuQisy?=
 =?utf-8?B?bmVhZm5YVi9tK1JxYkI1ZmtURnJqSUZWQUtob250STI3a2tlWVBtakl2NHJB?=
 =?utf-8?B?M3JVN1ZkUTJuVnpHRGdqalRtT1lSb280dmtNRzJUOUlENm8xWWhBbk5SbVg5?=
 =?utf-8?B?QitYN3pXODlHWVk2UitORnBjdlhTbkVsUUU1dG84aFJVckVoV1pmcTA0UnNj?=
 =?utf-8?B?RjJFOGdrQWFSTlUzRk5JNGdZb0lMbDlnRUNYYTdndThkZXVhYy9JRHQrL2Vi?=
 =?utf-8?B?dW9yenV5Rmt3U0JzcEdQd2YxVnJhM0xEbmpmWm9VOVJTcGtvdHM1OTNtK1da?=
 =?utf-8?B?RUJvazQwbUhsTVhMNE1tOXlUQW96OEJiZTNDdkQ5K3M3Wi9ad1oxVnBFU3lO?=
 =?utf-8?B?d1Y2enBqODI5cVA3YzJqNUJlL0tvWjMvbEpoQnF2anRZSlk1eGhLWHFtamZu?=
 =?utf-8?B?elJodGU3K0xvQ21jWDN5YmhzUFdmWmhpUjVoQXpydnU0TTF1TUhId2x3c0NC?=
 =?utf-8?B?NEtuNGZPRnUxR3BQNnZEVkljV3dUZ2p5TEd5ZFBPN2xrUXBLSHdSOW5DU3Ry?=
 =?utf-8?B?R0VqbFhMb25hZjJsWFBXZGRTa3k4NEVadjlnSFB4dld0cjNWejVURXI1b3Nl?=
 =?utf-8?B?TTNITDFoT3lrODNRR3dpcjNQVnRFVkZiTm40c2NFQkZ5Ry8xQ2thOVRnay92?=
 =?utf-8?B?dnh5aFdoUW9FU3dkUXljeXRWMjUwbmJFd0lJYWZuWHFpM0plZXVGeHBkckxT?=
 =?utf-8?B?ZVdlcG1qdm9SVDhDWFpqUFdkNHBEKzZ1dzhqT3p5Rm91QTdCQ3c3bGw1ajd4?=
 =?utf-8?B?em96VXc3ci9EOG41ZDczWWxZYVhtZjZkQlY2eUh4N0xtdmIzLzFoNzdGWmhG?=
 =?utf-8?B?QmViREJ4QWgrdnp6b0trT0dOVGQ3TFVnUDA3VnlzWFJSV2c1YVdTWWtwYUtH?=
 =?utf-8?B?ZXg0TWwrQXcyREQwYkZnam81WnN2ZmpsNStObkRTVDVyalVpVnN1TFNYcXA2?=
 =?utf-8?B?ekVTMGhxM25jaHRZSStBbXJBUGFsbTVRaklzbnhWUUp1N1hickQ0WmI0Y1ZU?=
 =?utf-8?B?MVB2WEVkOWxFblZEM2JoREVuWkIzcnpaSUVmN3c1UTlLOTBTU0dzTVJqVjZY?=
 =?utf-8?B?MmVuKzgwdTkvNDlsUkxTOXZDYnlBMmpyQUtuMGd1TUIzbjB2RnZMMExkd0E3?=
 =?utf-8?B?enpYaUwxdmNKclBLWFcxWTdqZWJLaGR0TzVpQUNXZEtYMmVhZW9UTHZQa0ti?=
 =?utf-8?B?aTBQRStQZm9aQjlGYmNvbGtkV0pjOW1NYUQrQ1dKS3M0bDFBUlVXdzU3Q1Bm?=
 =?utf-8?B?YTZRTzF2YUVCZjVWNlladU9ReUxyMmQrNDdVSVcydFVUOENvTlRCTFdYQ2lK?=
 =?utf-8?B?dldSckRxTkdKY1E3NE04MnVxbW5CV2hWS3FmMTdZOTNRZ3lmdEZQQ1c3cUJK?=
 =?utf-8?B?WHJsUnBCQURSR2tkakU0dzRpSWlRamR5clM0MzVyNzNnc3B3SzFienFFT012?=
 =?utf-8?B?dEJkSnVVV0NjUjJZRmEyTDJxY21iWlU5VTBEZjdTbjNZcDk5S1kwaW9PcWtX?=
 =?utf-8?B?M0ZEY3VFbnJNNnNRWWtlWk9pQlJQc2MyNENYR24xNUpkUDQxVjBENTBZalVa?=
 =?utf-8?B?bU9GT2FvSklZSHVoc2djSC9PYk5ac21uU1NEUWR0bUNEQTJ2S1VCdU9UMGty?=
 =?utf-8?Q?b91lsx8E91CaeJfk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: b4w5+j5qGyCZ0m1sYT5iKNDc2k4VZll/UbHi9jeYB18ZKrZERXxLny4DFamkIg4baeJLqZ7xvGO65Z6EZb83wEE/ADbUvUClAbvnUh//X8yZQKg6KyQ4Hqcu3R+JEm89TtGAhIS7rGyjTmxEo44cb4SUPMyG3qhHq89fPZhrmCyHF0xiKZF786jKNRaDVJb3N6BMN3c/4snfTyYiaUFoDq1xOhwh63SjJqhVfYd3ECujGtqgq6SPBmIcD+y3FJEGmL/QCyJK4+IZokVs1Fz6GwqixUQS/Jkl54MjyFvFiFexJbAxTTE/1cPdv9JRc+tl72vtWYvUa1J/0LlE/GSs3Q==
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3755eb-a55c-47df-c646-08de906f74f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 04:22:31.1199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1uGjR5wCC4ByPELsEr2I3Elzx9qOtXIjofGR5begv3r8Ps5+JQPo0aJ6vtexT8JHZuU9cH442egpS8iOUt3Jm/aGr/DSbZYaY7e5WXG1ntJ7QvCFPGpHyxuVfNgcPht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_054624_542712_E147C0AA 
X-CRM114-Status: GOOD (  14.09  )
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVub8OudCBNb25p
biA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDEs
IDIwMjYgOTozMCBQTQ0KPiBUbzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGli
cmUuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPjsgaXdhbWF0c3Ugbm9idWhp
cm8o5bKp5p2+IOS/oea0iw0KPiDilqHvvKTvvKnvvLTvvKPil4vvvKPvvLDvvLQpIDxub2J1aGly
by5pd2FtYXRzdS54OTBAbWFpbC50b3NoaWJhPjsgUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFpbC5j
b20+OyBCcmlhbiBNYXNuZXkNCj4gPGJtYXNuZXlAcmVkaGF0LmNvbT4NCj4gQ2M6IGxpbnV4LWNs
a0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6
IHZpc2NvbnRpOiBwbGw6IGluaXRpYWxpemUgY2xrX2luaXRfZGF0YSB0byB6ZXJvDQo+IA0KPiBP
biBNb25kYXksIDMwIE1hcmNoIDIwMjYgYXQgMTY6MzI6MzcgQ0VTVCwgQnJpYW4gTWFzbmV5IHdy
b3RlOg0KPiA+IFNhc2hpa28gcmVwb3J0ZWQgdGhlIGZvbGxvd2luZzoNCj4gPg0KPiA+ID4gVGhl
IHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgaXMgZGVjbGFyZWQgb24gdGhlIHN0YWNrIHdpdGhv
dXQgYmVpbmcNCj4gPiA+IGZ1bGx5IHplcm8taW5pdGlhbGl6ZWQuIFdoaWxlIGZpZWxkcyBsaWtl
IG5hbWUsIGZsYWdzLCBwYXJlbnRfbmFtZXMsDQo+ID4gPiBudW1fcGFyZW50cywgYW5kIG9wcyBh
cmUgZXhwbGljaXRseSBhc3NpZ25lZCwgdGhlIHBhcmVudF9kYXRhIGFuZA0KPiA+ID4gcGFyZW50
X2h3cyBmaWVsZHMgYXJlIGxlZnQgY29udGFpbmluZyBzdGFjayBnYXJiYWdlLg0KPiA+DQo+ID4g
Y2xrX2NvcmVfcG9wdWxhdGVfcGFyZW50X21hcCgpIGN1cnJlbnRseSBwcmVmZXJzIHRoZSBwYXJl
bnQgbmFtZXMgb3Zlcg0KPiA+IHRoZSBwYXJlbnQgZGF0YSBhbmQgaHdzLCBzbyB0aGlzIGlzbid0
IGEgcHJvYmxlbSBhdCB0aGUgbW9tZW50LiBJZg0KPiA+IHRoYXQgb3JkZXJpbmcgZXZlciBjaGFu
Z2VkIGluIHRoZSBmdXR1cmUsIHRoZW4gdGhpcyBjb3VsZCBsZWFkIHRvIHNvbWUNCj4gPiB1bmV4
cGVjdGVkIGNyYXNoZXMuIExldCdzIGp1c3QgZ28gYWhlYWQgYW5kIG1ha2Ugc3VyZSB0aGF0IHRo
ZSBzdHJ1Y3QNCj4gPiBjbGtfaW5pdF9kYXRhIGlzIGluaXRpYWxpemVkIHRvIHplcm8gYXMgYSBn
b29kIHByYWN0aWNlLg0KPiA+DQo+ID4gRml4ZXM6IGI0Y2JlNjA2ZGMzNjcgKCJjbGs6IHZpc2Nv
bnRpOiBBZGQgc3VwcG9ydCBjb21tb24gY2xvY2sgZHJpdmVyDQo+ID4gYW5kIHJlc2V0IGRyaXZl
ciIpDQo+ID4gTGluazoNCj4gPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjAz
MjYwNDIzMTcuMTIyNTM2LTEtcm9zZW5wJTQwZ21haWwuDQo+ID4gY29tDQo+ID4gU2lnbmVkLW9m
Zi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPg0KPiANCg0KUmV2aWV3
ZWQtYnk6IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGlyby5pd2FtYXRzdS54OTBAbWFpbC50b3No
aWJhPg0KDQpCZXN0IHJlZ2FyZHMsDQogIE5vYnVoaXJvDQo=


