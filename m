Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07B1CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVb8zD/5g9nDmZkg6J7LWWN8Az4TsZOGJJHRP7lPS3Y=; b=TREgZeSEM7aRDExA4pk50QTDqR
	PJ1n2FW7l3V4E3LSsgCMiWgBIwgHgEB3BXEBDrGurMHAenRmXXME7WSOQpp9GI8rwqU+H837z3z0/
	t4jxPupPd0oy6yu2U2igbYAHYbzYqkm41nMMgvkWWSUDP2A8glxBTssUI0imJTVfdlOBlDuYXdFOb
	XTqKn0+2NPqSunSEr3JD17B8nbrueBAxLrvsIh+AWzGSUw4cNunSScWYMSYxBLeF95KHEZ+ICdbjK
	o/eMQzd4uKiaY5mmW+Qo/DDiZbRJkiOqtczjkawaTlQr9DBsP5PEI/O+f6q7z6Gtyyj6Trgv6QxFp
	JpB+Ho8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBne8-0000000581H-28Ng;
	Wed, 30 Sep 2026 06:18:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBne6-00000005817-2x70;
	Wed, 30 Sep 2026 06:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UVb8zD/5g9nDmZkg6J7LWWN8Az4TsZOGJJHRP7lPS3Y=; b=QQDRbVQP5kT1sBE4c/6MqDK8Zc
	vdExUEc/+OBKcnxlLhRV+fIX/7B/myANlMjCl7Tp0OwC7Erhv9sEY//CRQWWmPPCX16fLz7aehdZ9
	6eBXP/GRGbYE0Hi2JC6tKa90YgPdH6hnupz343z+/W31JY+SPhy4STIyH6p13kVm+80sX3Fj+8O8u
	j4II821jjUdo+bv8U2IgXEtcOC4vvRaUkKfWrwOhkykMwXurWwZKVPqk4MoXSi7ai2WPlVFZiGc0G
	/4H/C87hAciQEb0SGcONl4zf6GV9BiWqT/dDJs2pnoJSsGX3nwTCIuacyX6AAYrz10zsursPZUgI8
	RGCavLlg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBndy-00000003PI2-4BXG;
	Wed, 30 Sep 2026 06:18:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68U6HfAI21871059, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790749061; bh=UVb8zD/5g9nDmZkg6J7LWWN8Az4TsZOGJJHRP7lPS3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fqjBB3OemeU7gm5EiQ6s42L/u3FVSDdho0InToK+cB5kmbG7/x/WnawfGupGG3nYN
	 gQVg7Wu/qYSnZudoIw1CDYtB87IOVZVEuzP6+9TP0I5z0JzOmR94hLH+FdxPmJcNeJ
	 8J3rRhHyy0JOyLS+J0ms8Gf+x91HyT5TarOIjkS2QcZmiJvxP9YIqOBnb8+yziiPPi
	 HEVElD9FwBr19hS19rzLgoXL00RgpxastjmYoV9RIzJB13QfErAky5bFXcV5Cklp3A
	 9EKy9KrsiYSRakJKLws3phPqgs/mIeh/Vd4pvEzNQ6Kb3nk6Y3VjS2rmbBELyPWI5r
	 PWOvCPcAipO7g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68U6HfAI21871059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 30 Sep 2026 14:17:40 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdOeMAtkU9yq5qUkW8LZXsVLtozbbPKxAAgAyd7PCAAtmagIAIL/4w
Date: Wed, 30 Sep 2026 06:17:40 +0000
Message-ID: <0288fc6490dd4bd4abb0773ad4b5e8d2@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
 <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
 <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071819_808836_1A1CAB6D 
X-CRM114-Status: GOOD (  23.50  )
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

PiA+IEhpIEplcm9tZSwNCj4gPg0KPiA+PiA+ICsNCj4gPj4gPiArc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBjbGtfZ3B1X3BhcmVudHNbXSA9IHsicGxsX2dwdSIsDQo+ID4+ID4gKyJjbGtfc3lz
In07IHN0YXRpYyBSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX2dwdSwgY2xrX2dwdV9wYXJlbnRzLA0K
PiA+PiBDTEtfU0VUX1JBVEVfUEFSRU5UIHwgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULA0KPiA+
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4MjgsIDEyLCAweDEpOyBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0DQo+ID4+ID4gK2Nsa192ZV9wYXJlbnRzW10gPSB7InBsbF92byIsICJjbGtf
c3lzaCIsICJwbGxfdmUxIiwgInBsbF92ZTIifTsNCj4gPj4gPiArc3RhdGljIFJUS19DTEtfUkVH
TUFQX01VWChjbGtfdmUxLCBjbGtfdmVfcGFyZW50cywNCj4gPj4gQ0xLX1NFVF9SQVRFX1BBUkVO
VCB8IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAweDRjLCAwLCAweDMpOyBzdGF0aWMNCj4gPj4gPiArUlRLX0NMS19SRUdNQVBfTVVYKGNs
a192ZTIsIGNsa192ZV9wYXJlbnRzLA0KPiBDTEtfU0VUX1JBVEVfUEFSRU5UIHwNCj4gPj4gQ0xL
X1NFVF9SQVRFX05PX1JFUEFSRU5ULA0KPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4
NGMsIDMsIDB4Myk7IHN0YXRpYw0KPiA+PiA+ICtSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX3ZlNCwg
Y2xrX3ZlX3BhcmVudHMsDQo+IENMS19TRVRfUkFURV9QQVJFTlQgfA0KPiA+PiBDTEtfU0VUX1JB
VEVfTk9fUkVQQVJFTlQsDQo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgMHg0YywgNiwg
MHgzKTsgc3RhdGljDQo+ID4+ID4gK1JUS19DTEtfUkVHTUFQX0dBVEVfTk9fUEFSRU5UKGNsa19l
bl9taXNjLCBDTEtfSVNfQ1JJVElDQUwsDQo+IDB4NTAsDQo+ID4+IDAsDQo+ID4+ID4gKzEpOyBj
bGtfZW5fcGNpZTAsIDAsIDB4NTAsIDIsDQo+ID4+ID4gKzEpOyBjbGtfZW5fZ3NwaSwgMCwgMHg1
MCwgNiwgMSk7DQo+ID4+ID4gK2Nsa19lbl9pc29fbWlzYywgMCwgMHg1MCwgMTAsDQo+ID4+ID4g
KzEpOyBjbGtfZW5fc2RzLCAwLCAweDUwLCAxMiwgMSk7DQo+ID4+ID4gK2Nsa19lbl9oZG1pLCAw
LCAweDUwLCAxNCwgMSk7DQo+ID4+DQo+ID4+IFRoaXMgaXMgYSBsb3Qgb2YgY2xvY2sgd2l0aCBu
byBwYXJlbnRzIHdoaWNoIGlzIGEgYml0IHN1c3BpY2lvdXMNCj4gPj4gZXNwZWNpYWxseSBmb3Ig
Z2F0ZXMuDQo+ID4+IFdoYXQgaXMgcmVhbGx5IGZlZWRpbmcgdGhvc2UgPw0KPiA+Pg0KPiA+DQo+
ID4gSW4gdjE1LCB3ZSB3aWxsIGRvIG91ciBiZXN0IHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGdh
dGUgY2xvY2tzIHdpdGhvdXQgYQ0KPiBwYXJlbnQuDQo+ID4NCj4gPiBIb3dldmVyLCBhZnRlciBk
aXNjdXNzaW5nIHdpdGggb3VyIGNvbGxlYWd1ZSwgd2UgY29uZmlybWVkIHRoYXQgZm9yDQo+ID4g
c29tZSBvZiB0aGVzZSBOT19QQVJFTlQgZ2F0ZSBjbG9ja3MsIHRoZWlyIGFjdHVhbCB1cHN0cmVh
bSBjbG9ja3MNCj4gPiAobGlrZSBQTExzIGFuZA0KPiA+IE11eGVzKSBhcmUgbG9jYXRlZCBpbiBz
ZXBhcmF0ZSwgaW5kZXBlbmRlbnQgaGFyZHdhcmUgc3Vic3lzdGVtcy4gVGhlDQo+ID4gcmVnaXN0
ZXJzIGNvbnRyb2xsaW5nIHRob3NlIHVwc3RyZWFtIGNsb2NrcyBhcmUgcGh5c2ljYWxseQ0KPiA+
IGluYWNjZXNzaWJsZSBmcm9tIHRoZSBMaW51eCBDUFUgZG9tYWluLg0KPiANCj4gQ29udHJvbCBh
bmQgaW5wdXQgYXJlIGRpZmZlcmVudCB0aGluZ3MuIEl0IGZlZWxzIGxpa2UgeW91ciBEVCAoYmlu
ZGluZykgZGVzY3JpcHRpb24NCj4gaXMgbm90IGNvbXBsZXRlIGFzIGl0IHN0YW5kcyB3aGljaCB3
aWxsIGV2ZW50dWFsbHkgYmUgYSBwcm9ibGVtLg0KPiANCj4gQSBjbG9jayB3aXRoIG5vIGlucHV0
IGlzIHNvbWV0aGluZyB0aGF0IGRvZXMgZ2VuZXJhdGUgdGhlIGNsb2NrIGJ5IGl0c2VsZiwgbGlr
ZSBhbg0KPiBvc2NpYWxsYXRvci4gUHJldGVuZGluZyBpdCBoYXMgbm8gcGFyZW50IGJlY2F1c2Ug
eW91IGRvbid0IGtub3cgaG93IGRlc2NyaWJlIGl0DQo+IHlldCBpcyB3cm9uZy4NCj4gDQoNClRo
YW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4NCg0KSW4gdjE1LCB0aGVyZSB3aWxsIGJlIG5vIG1v
cmUgTk9fUEFSRU5UIGZvciBnYXRlcy4gRm9yIGV4YW1wbGUsDQptaXBpX2NzaSAtPiBjbGtfc3lz
aCwgYW5kIGFsbCBvdGhlciBnYXRlcyAtPiBjbGtfc3lzLg0KDQpBZGRpdGlvbmFsbHksIHdlIHdp
bGwgcHJvcGVybHkgbW9kZWwgdGhlIGZpcm13YXJlLW1hbmFnZWQgUExMcyBiYWNrZWQgYnkNCnJl
YWwgaGFyZHdhcmUgcmVnaXN0ZXJzLiBXZSB3aWxsIHJlcGxhY2UgdGhlIGZpeGVkIDM1MSBNSHog
cGxsX3ZvZG1hIHdpdGgNCmEgcmVhZC1vbmx5IE1OTyBQTEwuDQoNClRoaXMgYWxsb3dzIHRoZSBD
Q0YgdG8gY29ycmVjdGx5IGRlcml2ZSB0aGUgZnJlcXVlbmN5IGZyb20gdGhlIHJlZ2lzdGVyDQoo
ZS5nLiwgd2hlbiBhY3RpbmcgYXMgYSBwYXJlbnQgZm9yIG11eGVzKSwgd2hpbGUgZ3VhcmFudGVl
aW5nIHRoZSBrZXJuZWwNCndpbGwgbmV2ZXIgcmVwcm9ncmFtIG9yIGRpc2FibGUgdGhlIGJvb3Qg
Y29kZSdzIHNldHRpbmdzLg0KDQpCZXN0IHJlZ2FyZHMsDQpZdS1DaHVuDQoNCg0K

