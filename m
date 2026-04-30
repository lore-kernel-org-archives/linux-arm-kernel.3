Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F85FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PGDIxkpcitFk3yLOUpMLWWFaNQfol7INw0g6Bklar0=; b=QMFosq//le+J/oX2fC9aygmd4R
	8yJBV3hsJeyB3Z4Icg3kgIN48tXCvt7Z+higJm9dw2k8Vcbx63ONbpz97urL7l+BeAQNBlznpZnHz
	aRPz8dm779LelqxbDzYZ6d9Gcxo3ANVVqgEXGMocu0FfaNrE5L+uSTuvuYTRmdJcGmTZRq5IcB6R5
	7JX2Zfqz9WWKjIrFGQbHqVwjfpbJ9idYweheIgeUt86DUhuTBcXjMja7K4rsskMlcWp30GwOwf982
	6wouXmPEwqXJgDIUCCqBjRU76g7bVOLHZ/PEPARJiVuLc042v0Eh/LrCeBOoMCXU2w+YdEewnYrgb
	Hbi2MLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOBO-000000059I5-0VIw;
	Thu, 30 Apr 2026 09:59:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOBL-000000059HV-3sTi;
	Thu, 30 Apr 2026 09:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+PGDIxkpcitFk3yLOUpMLWWFaNQfol7INw0g6Bklar0=; b=MmH9v83fEsirkpMTXTZMYP1coH
	z+NjVA5tXjE5Ivs3ES/QEqJOWDEuF4LpieNUUMB/cVFad1Ky7OfeKMyPNEtEVQnCF7Dj9es43W/oD
	E0a4osTgBqe1sx9b+Ls01lS/N529uL2q7AdP0beIctdMwrhRKss2VrihnplP/eKgV4XMo5WYUmDsX
	AXVpL79D9UoQDxhe6TktA4mEXz0se0f0LxPn/Nrwu25jxexEMk6koWTyrqz3G/CofB/JxEzQ4sFfs
	/LfSrRqSuoVa4rrDmV3mba72izeGJh7U8HBBtSapjXRAcQHoUznqGxziLuZTQCx6irg/ssaVEjWwu
	M/7MdXrw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOBH-000000073pH-44jP;
	Thu, 30 Apr 2026 09:59:42 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63U9wfSuB1879409, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777543122; bh=+PGDIxkpcitFk3yLOUpMLWWFaNQfol7INw0g6Bklar0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NwZJC/mTMxTRTZUMTBjWN37oEC+vNkdq0deXPNha41fcFgkGRgCngtpJR9uqtGNJR
	 ZnsZ4i5ZGnOII7v3UemrYBPgpbRDS5ReFZgRztOen7+k2y2CzKeJfieZ+JhAw0V+89
	 KR6svOyb5LyuZnSHv/+nFmm6JtW7OGlQ/oY53z0rGQqzP1YBLPPilwtewWchP6RGAX
	 LQ8+3Mr8r++al5olme9f0PmY/vSFVOkmyeTPhq+M7bPx5R9hDk6Yv74Ooi5b5z7cQz
	 Gp+0uocs1Nkzmbvq+9vDXya3//x/jGF72iW+11DF/7lZE/+9WbSdfOvyyQBd/TXh07
	 U6OymJwWbZiFw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 63U9wfSuB1879409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 17:58:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 30 Apr 2026 17:58:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Thu, 30 Apr 2026 17:58:42 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: RE: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Topic: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Index: AQHcxwLHJ5/eWVH9pU2ZY37QYpQGurXUP0uAgAPMV8CADmSzAIAAqFqAgBBo1aA=
Date: Thu, 30 Apr 2026 09:58:42 +0000
Message-ID: <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
In-Reply-To: <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_105940_594423_FE4A8627 
X-CRM114-Status: GOOD (  42.97  )
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

SGkgTGludXMgYW5kIE1pY2hhZWwsDQoNCj4gSGksDQo+DQo+IE9uIFN1biBBcHIgMTksIDIwMjYg
YXQgMTE6MTkgUE0gQ0VTVCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPiBIaSBZdS1DaHVuLA0K
PiA+DQo+ID4gT24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMTE6MznigK9BTSBZdS1DaHVuIExpbiBb
5p6X56WQ5ZCbXQ0KPiA+IDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4g
Pj4gV2UgZGlkIGxvb2sgaW50byBncGlvLW1taW8gYW5kIGdwaW8tcmVnbWFwLCBidXQgdGhleSBh
cmUgbm90IHF1aXRlIHN1aXRhYmxlIGZvcg0KPiA+PiBvdXIgcGxhdGZvcm0gZHVlIHRvIHRoZSBz
cGVjaWZpYyBoYXJkd2FyZSBkZXNpZ246DQo+ID4+DQo+ID4+IDEuIFBlci1HUElPIERlZGljYXRl
ZCBSZWdpc3RlcnM6IFVubGlrZSB0eXBpY2FsIEdQSU8gY29udHJvbGxlcnMgdGhhdCBwYWNrIDMy
IHBpbnMNCj4gPj4gaW50byBhIHNpbmdsZSAzMi1iaXQgcmVnaXN0ZXIgKDEgYml0IHBlciBwaW4p
LCBvdXIgaGFyZHdhcmUgdXNlcyBhIGRlZGljYXRlZCAzMi1iaXQNCj4gPj4gcmVnaXN0ZXIgZm9y
IGVhY2ggaW5kaXZpZHVhbCBHUElPLiBUaGlzIHNpbmdsZSByZWdpc3RlciBjb250cm9scyB0aGUN
Cj4gPj4gaW5wdXQvb3V0cHV0IHN0YXRlLCBkaXJlY3Rpb24sIGFuZCBpbnRlcnJ1cHQgdHJpZ2dl
ciB0eXBlIGZvciB0aGF0IHNwZWNpZmljIHBpbi4NCj4gPg0KPiA+IElzbid0IHRoYXQgYXR0YWlu
YWJsZSBieToNCj4gPg0KPiA+IC0gc2V0dGluZyAubmdwaW9fcGVyX3JlZyB0byAxIGluIHN0cnVj
dCBncGlvX3JlZ21hcF9jb25maWcNCj4NCj4gV2hpY2ggaXMganVzdCB1c2VkIGJ5IHRoZSBncGlv
X3JlZ21hcF9zaW1wbGVfeGxhdGUoKSBhbnl3YXkuIFNvIGl0DQo+IGRvZXNuJ3QgcmVhbGx5IG1h
dHRlci4gQnV0IHllYWgsIDEgd291bGQgYmUgdGhlIGNvcnJlY3QgdmFsdWUgaGVyZSwNCj4gYXNz
dW1pbmcgdGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBjb25zZWN1dGl2ZS4NCj4NCj4gPiAtIGV4dGVu
ZCAucmVnX21hc2tfeGxhdGUgY2FsbGJhY2sgd2l0aCBhbiBlbnVtIGZvciBlYWNoIG9wZXJhdGlv
bg0KPiA+ICAgKG5lZWQgdG8gY2hhbmdlIGFsbCB1c2VycyBvZiB0aGUgLnJlZ19tYXNrX3hsYXRl
IGNhbGxiYWNrIGJ1dA0KPiA+ICAgd2hvIGNhcmVzLCB0aGV5IGFyZSBub3QgbWFueSk6DQo+ID4N
Cj4gPiBlLmcuDQo+ID4NCj4gPiBlbnVtIGdwaW9fcmVnbWFwX29wZXJhdGlvbiB7DQo+ID4gICAg
IEdQSU9fUkVHTUFQX0dFVF9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfU0VUX09QLA0KPiA+ICAg
ICBHUElPX1JFR01BUF9TRVRfV0lUSF9DTEVBUl9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfR0VU
X0RJUl9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfU0VUX0RJUl9PUCwNCj4gPiB9Ow0KPiA+DQo+
ID4gIGludCAoKnJlZ19tYXNrX3hsYXRlKShzdHJ1Y3QgZ3Bpb19yZWdtYXAgKmdwaW8sDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bV9ncGlvX3JlZ21hcF9vcGVyYXRpb24g
b3AsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJhc2Us
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCwg
dW5zaWduZWQgaW50ICpyZWcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50ICptYXNrKTsNCj4gPg0KPiA+IFRoaXMgd2F5IC5yZWdfbWFza194bGF0ZSgpIGNh
biBoaXQgZGlmZmVyZW50IGJpdHMgaW4gdGhlIHJldHVybmVkDQo+ID4gKm1hc2sgZGVwZW5kaW5n
IG9uIG9wZXJhdGlvbiBhbmQgaXQgd2lsbCBiZSBmaW5kIHRvIHBhY2sgYWxsIG9mDQo+ID4gdGhl
IGJpdHMgaW50byBvbmUgMzJiaXQgcmVnaXN0ZXIuDQo+ID4NCj4gPiBBZGRlZCBNaWNoYWVsIFdh
bGxlIHRvIHRoZSB0aGUgdGhyZWFkLCBoZSB3aWxsIGtub3cgaWYgdGhpcyBpcyBhDQo+ID4gZ29v
ZCBpZGVhLg0KPiANCj4gTmljZSBpZGVhLCB0aG91Z2ggdGhlIGluZm9ybWF0aW9uIGlzIHRoZW4g
cmVkdW5kYW50IGluIHRoZSB1c3VhbA0KPiBjYXNlLCBpLmUuIGRyaXZlcnMgd2hpY2ggbmVlZCB0
byB0cmFuc2xhdGUgc3BlY2lmaWMgcmVnaXN0ZXJzDQo+IHdpbGwgZG8gYSAic3dpdGNoIChiYXNl
KSIgYXQgdGhlIG1vbWVudC4gVGhlc2Ugc2hvdWxkIGJlIGNvbnZlcnRlZA0KPiB0byAic3dpdGNo
IChvcCkiIGp1c3QgdG8ga2VlcCBhbGwgdGhlIGRyaXZlcnMgYWxpZ25lZCBhbmQgcHJldmVudA0K
PiBuZXcgZHJpdmVycyBmcm9tIHVzaW5nIHRoZSBvbGQgbWV0aG9kLiBZb3UnZCBuZWVkIHRvIHRv
dWNoIHRoZW0NCj4gYW55d2F5Lg0KPiANCj4gSSB3YXMgYnJpZWZseSB0aGlua2luZyBhYm91dCBt
YWtpbmcgaXQgc29tZXdoYXQgcG9zc2libGUgdG8gZW1iZWQNCj4gdGhlIG9wIGludG8gdGhlIGJh
c2UsIGlmIGl0IHdvdWxkIG90aGVyd2lzZSBiZSBhbGwgdGhlIHNhbWUuIFRoYXQNCj4gd2F5LCB5
b3UgY291bGQgZ3Bpby1yZWdtYXAgYXMgaXMuIEEgc3BlY2lhbCBjYXNlIGxpa2UNCj4gR1BJT19S
RUdNQVBfQUREUl9aRVJPLCB0aGF0IGNvdWxkIGJlIHVzZWQgYnkgdGhlc2Uga2luZCBvZiBkcml2
ZXJzLA0KPiBidXQgdGhhdCBpcyBwcm9iYWJseSB0b28gaGFja3kuDQo+IA0KPiBJJ20gZmluZSB3
aXRoIGVpdGhlciB3YXkuDQo+IA0KPiA+PiAyLiBXcml0ZS1FbmFibGUgKFdSRU4pIE1hc2sgTWVj
aGFuaXNtOiBPdXIgaGFyZHdhcmUgcmVxdWlyZXMgYSBzcGVjaWZpYyBXcml0ZS1FbmFibGUNCj4g
Pj4gbWFzayB0byBiZSB3cml0dGVuIHNpbXVsdGFuZW91c2x5IHdoZW4gdXBkYXRpbmcgdGhlIHJl
Z2lzdGVyIHZhbHVlcy4NCj4gPg0KPiA+IFdoaWNoIGlzIHRvIGp1c3Qgc2V0IGJpdCAzMS4NCj4g
Pg0KPiA+IFdpdGggdGhlIGFib3ZlIHNjaGVtZSB5b3VyIC5yZWdfbWFza194bGF0ZSBjYWxsYmFj
ayBjYW4ganVzdCBzZXQgYml0IDMxDQo+ID4gbm8gbWF0dGVyIHdoYXQgb3BlcmF0aW5nIHlvdSdy
ZSBkb2luZy4gUGllY2Ugb2YgY2FrZS4NCj4gDQo+IEtlZXAgaW4gbWluZCwgdGhhdCB0aGlzIHdp
bGwgbWFrZSByZWFkaW5nIGFuZCB3cml0aW5nIHNvbWV3aGF0DQo+IGRpZmZlcmVudC4gcmVhZGlu
ZyBhc3N1bWVzIHRoZXJlIGlzIG9ubHkgb25lIGJpdCBzZXQgaW4gbWFzaywNCj4gYmVjYXVzZSBv
ZiB0aGUgIiEhKHZhbCAmIG1hc2spIiBvcCwgd2hpY2ggaXMgaGFyZGNvZGVkLiBJJ20gbm90DQo+
IGFnYWluc3QgdXNpbmcgdGhlIHdyaXRlIGxpa2UgdGhhdCB0aG91Z2guDQo+IA0KPiAtbWljaGFl
bA0KPiANCg0KSSB1bmRlcnN0YW5kIHRoZSBwcm9wb3NlZCBhcHByb2FjaCBmb3IgZXh0ZW5kaW5n
ICcucmVnX21hc2tfeGxhdGUnIHdpdGgNCidlbnVtIGdwaW9fcmVnbWFwX29wZXJhdGlvbicsIGFu
ZCBJIGhhdmUgc3RhcnRlZCBpbXBsZW1lbnRpbmcgaXQuDQoNCj4gPj4gMy4gSGFyZHdhcmUgRGVi
b3VuY2U6IFdlIGFsc28gbmVlZCB0byBzdXBwb3J0IGhhcmR3YXJlIGRlYm91bmNlIHNldHRpbmdz
IHBlciBwaW4sDQo+ID4+IHdoaWNoIHJlcXVpcmVzIGN1c3RvbSBjb25maWd1cmF0aW9uIHZpYSBz
ZXRfY29uZmlnIG1hcHBlZCB0byB0aGVzZSBzcGVjaWZpYyBwZXItcGluDQo+ID4+IHJlZ2lzdGVy
cy4NCj4gPg0KPiA+IEp1c3QgYWRkIGEgdmVyc2lvbiBvZiBhbiBvcHRpb25hbCAuc2V0X2NvbmZp
ZygpIGNhbGwgdG8gZ3Bpby1yZWdtYXAuYw0KPiA+IHRvIGhhbmRsZSB0aGlzIHVzaW5nIC5yZWdf
bWFza194bGF0ZSgpIHBlciBhYm92ZSBhbmQgYWRkIGEgbmV3DQo+ID4gR1BJT19SRUdNQVBfQ09O
RklHX09QIHRvIHRoZSBhYm92ZSBlbnVtLCBwcm9ibGVtIHNvbHZlZC4NCj4gPg0KPiA+IElmIGl0
IHNlZW1zIHRvbyBoYXJkIEkgY2FuIHdyaXRlIHBhdGNoIDEgJiAyIGFkZGluZyB0aGlzIGluZnJh
c3RydWN0dXJlDQo+ID4gYnV0IEkgYmV0IHlvdSBjYW4gZWFzaWx5IHNlZSB3aGF0IGNhbiBiZSBk
b25lIHdpdGggZ3Bpby1yZWdtYXAuYw0KPiA+IGhlcmUgcHJvdmlkZWQgTWljaGFlbCBXIGFwcHJv
dmVzIHRoZSBpZGVhLg0KPiA+DQoNCk91ciAuc2V0X2NvbmZpZyByZXF1aXJlcyBtYXBwaW5nIHNw
ZWNpZmljIGRlYm91bmNlIHRpbWUgdmFsdWVzIHRvDQpoYXJkd2FyZS1zcGVjaWZpYyBlbnVtcyBh
bmQgYXBwbHlpbmcgYSBXcml0ZS1FbmFibGUgYml0Lg0KDQpXb3VsZCBpdCBiZSBiZXR0ZXIgdG8g
YWxsb3cgZHJpdmVycyB0byBhc3NpZ24gYSBjdXN0b20gJy5zZXRfY29uZmlnJyBjYWxsYmFjaw0K
ZGlyZWN0bHkgd2l0aGluICdzdHJ1Y3QgZ3Bpb19yZWdtYXBfY29uZmlnJz8NCg0KQWRkaXRpb25h
bGx5LCBJIGRpZG4ndCBtZW50aW9uIHRoaXMgaW4gbXkgcHJldmlvdXMgZW1haWwuIHdlIGFsc28g
bmVlZCB0bw0KaW1wbGVtZW50IEdQSU8gaW50ZXJydXB0cy4gT3VyIGhhcmR3YXJlIGRlc2lnbiBk
b2VzIG5vdCBmaXQgd2VsbCB3aXRoDQoncmVnbWFwX2lycV9jaGlwJy4gVGhlcmVmb3JlLCBJIGFt
IHBsYW5uaW5nIHRvIGNyZWF0ZSBvdXIgb3duICdpcnFkb21haW4nIGFuZA0KJ2lycWNoaXAnIG9w
cyB0byBoYW5kbGUgb3VyIGNhc2NhZGVkIGludGVycnVwdHMuDQoNCkJlY2F1c2Ugb2YgdGhpcyBj
dXN0b20gSVJRIGltcGxlbWVudGF0aW9uLCBJIHdvdWxkIG5lZWQgdG8gdXNlICdyZWFkbCgpL3dy
aXRlbCgpJw0KZm9yIHRoZSBJUlEgY2FsbGJhY2tzIGluIHRoZSBydGQxNjI1IEdQSU8gZHJpdmVy
IGluc3RlYWQgb2YgdGhlIHJlZ21hcCBBUElzLg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
IG9uIGhvdyB0byBoYW5kbGUgdGhpcyBncmFjZWZ1bGx5IHdoaWxlIGtlZXBpbmcgaXQNCmFsaWdu
ZWQgd2l0aCB0aGUgcmVnbWFwIGluZnJhc3RydWN0dXJlPw0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQoNCj4gPiBZb3VycywNCj4gPiBMaW51cyBXYWxsZWlqDQo=

