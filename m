Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25253C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44kXH3/E0w/lHoH9WlHMM2cyxoqGH42gczpsrCIsszU=; b=sRlMhdJvEy4dAaxcHQxqSyXp2Z
	F2cpbOi2mfUcUbvsDwxYRqGbJATiIUJp+tbkacGYPV8JFEIwbVM0H1xROzrv1iT4avK1r+ISqVV9A
	2h9mDI0D+KZ6A7QpbC/Y8wx6XvfdNAnqIaUPWoBz/A6z+QEY37KXsj4OA0YHzJytYXXX8LnDefqpV
	yJ7TUEVap9Eau/inpHv5vLWrKGXgqmz4JQyfmeywlhbN1VqfVBAosqz4NumzqzZW3obb7r/mB5BmE
	mMJ4vV2CFOZBBMNAe6gvROtfiZA9DbvwId+e7O5/MSRJQ8YJHgGoqE9IDQ5dHFJg3tnrPljW+SPgm
	oJ4x6Dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKA9-0000000H73l-0Kxr;
	Thu, 16 Jul 2026 11:21:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKA8-0000000H73P-039b;
	Thu, 16 Jul 2026 11:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=44kXH3/E0w/lHoH9WlHMM2cyxoqGH42gczpsrCIsszU=; b=axNYwo07nLHVmy5YvpQaiXBbzE
	PGigXkO/RycM8B4OwOMqWDathkz1CDkM3vmITuBVYf3aEgIDXJKVtSzOBel7Dauh9mO6vNZKQgeih
	cAY0nXa2KBqfjalrb+hVNfMAqD5+T2Zst/G5VHyjH6IxumzWr42J8VbeoLxO7ncBlU19iXJXhPgc0
	f8aCpemWaYWkO7+FR9RYi6cWudW+WR4twx7irlyeR1zvUpgv8WGrwTEVlAAMOA8lKD857jMBV1Arz
	ajHH1zgxgmK+5N/tQp6W729nqzlS88Njj2xd0zgJQxFHdZMN+XcX7czuo+l0KiOoNClw0apWkZ/jJ
	7aeH4/Gw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkKA0-0000000Dzwf-2MnZ;
	Thu, 16 Jul 2026 11:21:54 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66GBL5WO03604801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784200865; bh=44kXH3/E0w/lHoH9WlHMM2cyxoqGH42gczpsrCIsszU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ItLSuFDVradEyRHwRtXmYUGqpuvmf/rc9uYSGZlQpGnjXH9XJet2akTWdBjBA7gS1
	 U81eeJIZyUxWVS6f9YcNG9LAxAKvTbCaDz9sLNs+HO9O5Jwnc4yBzRMDE+pKPK9RnD
	 pGg8W5RDHPyxkzTRY/ulpRZ73lJ0YYgtv+JcRmXl9pVen/fM4hldGKc3BeD4HzZ4kq
	 +7lgYGfXZQJQ8rpO2kXRKUjkyNWupq/kXNlzjucQ0MBbIPdpyFlqGkNdSjSnB7u4X9
	 K+UidcoUJ1VF3c+lGzi/8W3RRf979dIvCE65yPqbeejKxOVoc2lOcU7HO86dWFQCYp
	 wjoTIBWk9YyEw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66GBL5WO03604801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 19:21:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 19:21:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 16 Jul 2026 19:21:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>
CC: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "andy@kernel.org" <andy@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dlechner@baylibre.com"
	<dlechner@baylibre.com>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "lars@metafoo.de"
	<lars@metafoo.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "nuno.sa@analog.com"
	<nuno.sa@analog.com>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"wbg@kernel.org" <wbg@kernel.org>
Subject: RE: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Topic: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Index: AQHc4cATPP5CAXxOA0S9aBj6QrzqgrYJ8C6AgFvXxWCACcZxAIAAIc4AgAALpoCAAAi9AIAAl8rg//9/lACAAIpZkA==
Date: Thu, 16 Jul 2026 11:21:02 +0000
Message-ID: <068b13e117464cf38b7b215eee72fe7a@realtek.com>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
 <9ee344c1d9c642bdb7d3b85bc922fe66@realtek.com>
 <DJZY1YPMDLIN.3W0QOPEI9L8JA@kernel.org>
In-Reply-To: <DJZY1YPMDLIN.3W0QOPEI9L8JA@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_122153_213309_D0887461 
X-CRM114-Status: GOOD (  25.66  )
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

PiBIaSwNCj4gDQo+IE9uIFRodSBKdWwgMTYsIDIwMjYgYXQgMTI6NDcgUE0gQ0VTVCwgWXUtQ2h1
biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+ID4gSSBjaGVja2VkIHdpdGggb3VyIGludGVybmFs
IGhhcmR3YXJlIGVuZ2luZWVycy4gVGhlIFdSRU4gYml0IHdhcw0KPiA+IGRlc2lnbmVkIHRvIGF2
b2lkIHJhY2UgY29uZGl0aW9ucywgd2hpY2ggcmVxdWlyZXMgYm90aCB0aGUgZGF0YSBiaXQNCj4g
PiBhbmQgdGhlIFdSRU4gYml0IHRvIGJlIHVwZGF0ZWQgc2ltdWx0YW5lb3VzbHkgd2l0aGluIHRo
ZSBzYW1lIHJlZ2lzdGVyLg0KPiANCj4gWW91ciBtYWlsIGp1c3QgYXJyaXZlZCBhcyBJIHdhcyB3
cml0aW5nIG15IHJlcGx5LiBTbyB5ZWFoLCB0aGF0J3MgYmFzaWNhbGx5IHdoYXQgSQ0KPiB3YXMg
c2F5aW5nLg0KPiANCj4gPiBJIGhhdmUgYSBuZXcgaWRlYSB0aGF0IG1pZ2h0IGJlIHNpbWlsYXIg
dG8gTWljaGFlbCdzIHN1Z2dlc3Rpb24uDQo+IA0KPiBJZiBub3QgYWxtb3N0IGV4YWN0bHkgd2hh
dCBJIGhhZCBpbiBtaW5kLiA6KQ0KPiANCj4gPiBXZSBjYW4NCj4gPiBpbnRyb2R1Y2UgYSBuZXcg
Y2FsbGJhY2sgdG8gYWxsb3cgdGhlIGRyaXZlciB0byBpbnRlcmNlcHQgYW5kIG1vZGlmeQ0KPiA+
IHRoZSBtYXNrIGFuZCB0aGUgdmFsdWUuIEJ5IGRvaW5nIHNvLCB0aGUgZHJpdmVyIGNhbiBkZXRl
cm1pbmUgdGhlDQo+ID4gY29ycmVzcG9uZGluZyBXUkVOIGJpdCBiYXNlZCBvbiB0aGUgb3JpZ2lu
YWwgbWFzaywgYW5kIGFzc2VtYmxlIHRoZQ0KPiA+IFdSRU4gYml0IGludG8gdGhpcyBuZXcgY2Fs
bGJhY2sgZnVuY3Rpb24gcmlnaHQgYmVmb3JlIHRoZSBmaW5hbCB3cml0ZSBBUEkgaXMNCj4gZXhl
Y3V0ZWQuDQo+ID4NCj4gPiBUaGUgaWRlYSBsb29rcyBsaWtlOg0KPiA+DQo+ID4gc3RhdGljIHZv
aWQgZ3Bpb19yZWdtYXBfc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBv
ZmZzZXQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGludCB2YWwpDQo+ID4gew0KPiA+
ICAgICAgIHN0cnVjdCBncGlvX3JlZ21hcCAqZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXAp
Ow0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBiYXNlID0gZ3Bpb19yZWdtYXBfYWRkcihncGlvLT5y
ZWdfc2V0X2Jhc2UpOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCByZWcsIG1hc2ssIG1hc2tfdmFs
LCB3cmVuX3JlZywgd3Jlbl9tYXNrOw0KPiA+ICAgICAgIGludCByZXQ7DQo+ID4NCj4gPiAgICAg
ICByZXQgPSBncGlvLT5yZWdfbWFza194bGF0ZShncGlvLCBHUElPX1JFR01BUF9TRVRfT1AsIGJh
c2UsDQo+IG9mZnNldCwgJnJlZywgJm1hc2spOw0KPiA+ICAgICAgIGlmIChyZXQpDQo+ID4gICAg
ICAgICAgICAgICByZXR1cm47DQo+ID4NCj4gPiAgICAgICBpZiAodmFsKQ0KPiA+ICAgICAgICAg
ICAgICAgbWFza192YWwgPSBtYXNrOw0KPiA+ICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAg
IG1hc2tfdmFsID0gMDsNCj4gPg0KPiA+ICAgICAvKiBMZXQgdGhlIGRyaXZlciBtb2RpZnkgdGhl
IG1hc2sgYW5kIG1hc2tfdmFsIHRvIGluY2x1ZGUgV1JFTiAqLw0KPiA+ICAgICAgIGlmIChncGlv
LT52YWx1ZV94bGF0ZSkgew0KPiA+ICAgICAgICAgICAgICAgcmV0ID0gZ3Bpby0+dmFsdWVfeGxh
dGUoJm1hc2ssICZtYXNrX3ZhbCk7DQo+IA0KPiBZZWFoLCBidXQgeW91IHByb2JhYmx5IGFsc28g
aGF2ZSB0byBwYXNzIGdwaW8gOikgQW5kIGF0IHRoaXMgcG9pbnQgSSdkIGNhbGwgaXQNCj4gdmFs
dWUgbm90IG1hc2tfdmFsIGFueW1vcmUuIEFuZCB0aGUgc2lnbmF0dXJlIHNob3VsZCBwcm9iYWJs
eSBsb29rcw0KPiBzb210aGluZyBsaWtlOg0KPiANCj4gaW50ICgqdmFsdWVfeGxhdGUpKHN0cnVj
dCBncGlvX2NoaXAgKmNoaXAsIGVudW0gZ3Bpb19yZWdtYXBfb3Agb3AsIHVuc2lnbmVkDQo+IGlu
dCBvZmZzZXQsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBtYXNrLCB1bnNpZ25lZCBp
bnQgKnZhbHVlKQ0KPiANCj4gbWFzayBzaG91bGRuJ3QgbmVlZCB0byBiZSBhIHBvaW50ZXIgYXMg
eW91IGRvbid0IGhhdmUgdG8gbW9kaWZ5IGl0LCBkbyB5b3U/DQo+IHJlZ19tYXNrX3hsYXRlLCBh
bHJlYWR5IGRvZXMgdGhhdC4NCj4gDQoNCkFjdHVhbGx5LCBJIGRvIG5lZWQgdG8gbW9kaWZ5IHRo
ZSAnbWFzaycsIHNvIGl0IHN0aWxsIG5lZWRzIHRvIGJlIHBhc3NlZA0KYXMgYSBwb2ludGVyIHRv
IHRoaXMgY2FsbGJhY2suDQoNClNpbmNlIHRoZSBXUkVOIGVuYWJsZSBiaXQgYW5kIHRoZSBkYXRh
IGJpdCBhcmUgbG9jYXRlZCBhdCBkaWZmZXJlbnQgYml0DQpwb3NpdGlvbnMsIHRoZSBmaW5hbCAn
bWFzaycgdXNlZCBpbiB3cml0ZSBBUEkgbXVzdCBiZSBleHBhbmRlZCB0byBpbmNsdWRlDQpib3Ro
IHRoZSBXUkVOIG1hc2sgYW5kIHRoZSBkYXRhIG1hc2suDQoNCkFzaWRlIGZyb20gbmVlZGluZyAn
bWFzaycgYXMgYSBwb2ludGVyLCBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB0aGUgcmVzdCBvZg0K
eW91ciBzdWdnZXN0ZWQgc2lnbmF0dXJlLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4g
LW1pY2hhZWwNCj4gDQo+ID4gICAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIC8qIGln
bm9yZSBpbnB1dCB2YWx1ZXMgd2hpY2ggc2hhZG93IHRoZSBvbGQgb3V0cHV0IHZhbHVlICovDQo+
ID4gICAgICAgaWYgKGdwaW8tPnJlZ19kYXRfYmFzZSA9PSBncGlvLT5yZWdfc2V0X2Jhc2UpDQo+
ID4gICAgICAgICAgICAgICByZXQgPSByZWdtYXBfd3JpdGVfYml0cyhncGlvLT5yZWdtYXAsIHJl
ZywgbWFzaywNCj4gbWFza192YWwpOw0KPiA+ICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAg
IHJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhncGlvLT5yZWdtYXAsIHJlZywgbWFzaywNCj4gPiBt
YXNrX3ZhbCk7DQo+ID4NCj4gPiAgICAgICByZXR1cm4gcmV0Ow0KPiA+IH0NCj4gPg0KPiA+IEJl
c3QgUmVnYXJkcywNCj4gPiBZdS1DaHVuDQoNCg==

