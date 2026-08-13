Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0461FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/hIs90LN+YWZ2QTLOrkIPhW7uPAG/CbhH++hkokYbY=; b=kRu/UVpmfe0RjYOuAgbF07Veyu
	fuoMt5bOL1HYHNxu/fR8xT0Uavp8HDZcWQvUBfYxw5XjNct7wpggVpjomgR7y5cxJz9N8Wqfd0XC7
	AdJx8CNI28HV1rzz0jA4ENXwCRNgYL1BL04oaoNSmBZHi0f9VtThDF5KCNvcfFGb51NTy5CZCz/CP
	Z6CXZiWZXGy+DYihbWXK0wtotusr20VBL7ieTAF0WUlImhoMMFO53nmdrRn/DHxpxBMZUYCPCuM6J
	ODeYMQ/zqKWgXI0ZGPajARs/yPFhsi+LcpIwOmneo9FSebTKMrn2XCC/O8ISDBf4nGEl5WT+CYtKE
	VW98AVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUXw-00000000eeQ-1C0u;
	Thu, 13 Aug 2026 12:28:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUXu-00000000eeF-3vZv;
	Thu, 13 Aug 2026 12:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7/hIs90LN+YWZ2QTLOrkIPhW7uPAG/CbhH++hkokYbY=; b=WdIqIL5FqFozq74Y+ltGLtqoVI
	n2hqCpuPjBXpu+Fh3xlYriNAF3Dr+pFJXpbaRGCtDnZ33L8/7+SD4x6oYpFtdfqQgGzQtITLCivIZ
	MdlTnuVWKgsX/lUpeIgVb4YqIj/g1Z2bmX78tPabBmWtnU8RnHWUt2HsWELn7lPQGppSv7n+8JbLF
	FN+RQWykamHz1W8IgmgmbNegK7937i7pEEmwvYKKRDkgFR0+bBWSikRUH63UvWvmeam3cYDKSi3CB
	2oHzVuY7hfrMxD3oXAGv2FwAMbKdq1QXCJoRCAXRZZIF9HPV+6S6WLfkbe2tBPpEUXfkrh4jLsIhe
	jGtBiYJg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuUXr-0000000GBeJ-0Lmn;
	Thu, 13 Aug 2026 12:28:29 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67DCRe0aA324590, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786624060; bh=7/hIs90LN+YWZ2QTLOrkIPhW7uPAG/CbhH++hkokYbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EsUZY+l9fWmfr20KpP8slDU8xItkZMuoTn7c0eSjaSZUqeJ4xeBHHRkm+tZSia56/
	 u2ewTDRZtCUrLlkX2cXQqgR2TDblh+1Y4lOtLxxV0ls22RCFBYchP74p5+wIGl9pwj
	 T9WUCSaYhLJIoZR9zeOKwwCgKn0srK5oo3I/pn8eZagQg8bpOC0EL+MSCqXCdjqdD9
	 KWT+o1KWlGPCQ9n7mcoRlyeq9+4dPX5WNFjD1BXUSNMFXK/zb9+HsuR4j1/AF5VdF3
	 JrhpuGUfrpPdYyXinT3NiwZDitFGfk/au+s1f7lHDZPmJ1ZObKKXo+NjUEI6EppYY1
	 9D2ZiKw7kCvnA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67DCRe0aA324590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Aug 2026 20:27:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 13 Aug 2026 20:27:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Thu, 13 Aug 2026 20:27:40 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney@redhat.com" <bmasney@redhat.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Thread-Index: AQHdKf6sqK1LXpXPjkadMFMzDtoXkraZlK4AgACT8SD//3zlAIAAjtXw//+jrwCAAhGm4A==
Date: Thu, 13 Aug 2026 12:27:40 +0000
Message-ID: <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
 <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
In-Reply-To: <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_132827_742124_84EC7406 
X-CRM114-Status: GOOD (  23.88  )
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

PiBPbiAxMi8wOC8yMDI2IDEyOjIyLCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
Pj4gT24gMTIvMDgvMjAyNiAxMTo0MSwgWXUtQ2h1biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+
ID4+PiBIaSBLcnp5c3p0b2YsDQo+ID4+Pg0KPiA+Pj4+IE9uIDEyLzA4LzIwMjYgMDM6NTksIFl1
LUNodW4gTGluIHdyb3RlOg0KPiA+Pj4+PiBBZGQgRFQgYmluZGluZyBzY2hlbWEgZm9yIFJlYWx0
ZWsgUlREMTYyNSBjbG9jayBhbmQgcmVzZXQNCj4gPj4+Pj4gY29udHJvbGxlcg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+Pj4+PiA8a3J6eXN6
dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiA+Pj4+DQo+ID4+Pj4gSG93IG15IHRh
ZyBjb3VsZCBhcHBlYXIgaGVyZT8NCj4gPj4+Pg0KPiA+Pj4+IExvb2s6DQo+ID4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDMyNDAyNTMzMi4zNDE2OTc3LTItZWxlYW5vci5s
aW5Acg0KPiA+Pj4+IGVhDQo+ID4+Pj4gbHRlay5jDQo+ID4+Pj4gb20vDQo+ID4+Pj4NCj4gPj4+
Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+
ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVl1IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4N
Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsu
Y29tPg0KPiA+Pj4+DQo+ID4+Pj4gV2hvIGFkZGVkIG15IHRhZz8gV2hhdCBpcyB0aGUgYWN0dWFs
IGZsb3cgb2YgdGhpcyBwYXRjaD8NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IFlvdSBnYXZlIHlvdXIg
UmV2aWV3ZWQtYnkgdGFnIGluIHY1LiBIb3dldmVyLCBhZnRlciB0aGF0LCBTdGVwaG9uDQo+ID4+
PiBwcm92aWRlZCBhZGRpdGlvbmFsIGZlZWRiYWNrLiBJbiB2NiwgSSBtb2RpZmllZCB0aGUgcGF0
Y2ggYmFzZWQgb24NCj4gPj4+IFN0ZXBob24ncyBjb21tZW50cyBhbmQgbWFkZSBzb21lIG90aGVy
IGNoYW5nZXMuIEZ1cnRoZXJtb3JlLCBJIGFkZGVkDQo+ID4+PiB0aGUgY2xvY2sgSUQNCj4gPj4+
IDE0NCBpbiB2MTEuDQo+ID4+DQo+ID4+IFNvIGhvdyBteSB0YWcgY291bGQgYXBwZWFyIGJlZm9y
ZSBDaGVuZy1ZdSBMZWUgc2lnbmVkIG9mZiB0aGUgcGF0Y2g/DQo+ID4+DQo+ID4NCj4gPiBBaCwg
SSByZWFkIHRoZSBydWxlcyBzdGF0aW5nIHRoYXQgInRoZSBsYXN0IFNpZ25lZC1vZmYtYnk6IG11
c3QgYWx3YXlzDQo+ID4gYmUgdGhhdCBvZiB0aGUgZGV2ZWxvcGVyIHN1Ym1pdHRpbmcgdGhlIHBh
dGNoIi4NCj4gDQo+IFRoaXMgaXMgY29ycmVjdCBpbnRlcnByZXRhdGlvbiAoYWx0aG91Z2ggc29t
ZSBzdWJzeXN0ZW1zIHdpbGwgaW50ZXJwcmV0IGFib3ZlDQo+IG9ubHkgaW4gcmVzcGVjdCBvZiBv
dGhlciBTb0JzKS4NCj4gDQo+ID4NCj4gPiBJIG1pc3Rha2VubHkgdGhvdWdodCBteSBTaWduZWQt
b2ZmLWJ5IGhhZCB0byBiZSB0aGUgYWJzb2x1dGUgbGFzdCBsaW5lDQo+ID4gb2YNCj4gDQo+IFRo
aXMgaXMgY29ycmVjdC4NCj4gDQo+ID4gdGhlIGVudGlyZSBjb21taXQgbWVzc2FnZS4gVGhlcmVm
b3JlLCB3aGVuIEkgaW5zZXJ0ZWQgeW91ciB0YWcgYXQgdGhlDQo+ID4gdG9wIG9mIHRoZSB0YWcg
YmxvY2suDQo+IA0KPiBUaGlzIGlzIG9kZCByZXN1bHQgb2YgZWFybGllciBsb2dpYy4gSWYgeW91
ciBTb0IgaGFzIHRvIGJlIHRoZSBsYXN0LCB0aGVuIG9idmlvdXMNCj4gY2hvaWNlIGlzIHRvIHB1
dCB0aGUgUmV2aWV3ZWQtYnkgdGFnIEJFRk9SRSB5b3VyIFNvQi4NCj4gDQo+IEFuZCBpbiBhbnkg
Y2FzZSB5b3Ugc2hvdWxkIHVzZSBiNCBzaW5jZSBpdCB3b3VsZCBkbyB0aGUgY29ycmVjdCB0aGlu
Zy4NCj4gQWxsIHBhdGNoIHN1Ym1pc3Npb25zIGFyZSBzdXBwb3NlZCB0byB1c2UgYjQsIHNvIHlv
dSBkb24ndCBtYWtlIHRyaXZpYWwNCj4gcHJvY2VzcyBtaXN0YWtlcy4NCj4gDQoNClRoYW5rIHlv
dSBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJJ2xsIGxlYXJuIGhvdyB0byB1c2UgYjQuDQoNCkp1c3Qg
dG8gYmUgc3VyZSBJIGdldCBpdCByaWdodDogc2hvdWxkIEkga2VlcCB5b3VyIHRhZyBhbmQgbW92
ZSBpdCBiZXR3ZWVuDQpteSBDby1kZXZlbG9wZWQtYnkgYW5kIFNpZ25lZC1vZmYtYnksIG9yIHNo
b3VsZCBJIGRyb3AgaXQ/DQoNCkFsc28sIHRvIG1ha2Ugc3VyZSBJIGZvbGxvdyB0aGUgY29ycmVj
dCBwcm9jZXNzIGFuZCB1bmRlcnN0YW5kIHRoZSBjbG9jaw0KbWFpbnRhaW5lcidzIHByZWZlcmVu
Y2U6IFNob3VsZCBJIHNlbmQgYSB2MTQgdG8gZml4IHRoZSB0YWcsIG9yIGlzIGl0DQpwb3NzaWJs
ZSBmb3IgdGhlIGNsb2NrIG1haW50YWluZXIgdG8gaGVscCBhbWVuZCB0aGlzIGlmIHRoZXJlIGFy
ZSBubyBvdGhlcg0KY2hhbmdlcz8NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

