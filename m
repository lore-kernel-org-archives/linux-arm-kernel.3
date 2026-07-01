Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D740C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY2o5dWEAvddugmQW/vs6ACDRe9NBEJocX+1e1hRgcw=; b=huimA5mP5GzRa0vbIzF6sG5QGb
	R2YNpxm/3kvJhC65oDD9lPUKI1dfSy0/sNr+rdfnxLWwhuMVUoKnZd9sYpp99nI22DmJOQpaiJ2zc
	66UC/UKCBY471g0ZQ/kzfpVNC7lJK1ePzglldeibsc9flq8309FXRE0q/ld+CjzhKTGu2beolG3FU
	YymciK5EM6LzBId61qg3Z/K9Vzln02epTvsqWlgKsI4Pja29P+JoOAlODRCdUlTUsqDaQIgqUDuPk
	AYoI292Nqaqd9PwNFlPp2Az7MzeR+ylhWemK/wcHtmxLHPhZ1hKA6pnq5qnzLGJdvUUWn5hK7dM1o
	yGeSAd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesOY-00000001L0j-3MQZ;
	Wed, 01 Jul 2026 10:42:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesOX-00000001L0Y-2ePl;
	Wed, 01 Jul 2026 10:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zY2o5dWEAvddugmQW/vs6ACDRe9NBEJocX+1e1hRgcw=; b=BP5mKMztJVq8NxfUBSeJhiQcO5
	Ktz9fxxVQ6VJIAV4wjhUQQNaNI6EVmpLxc2HyO64YgVFauDzmRZ6BstwK5xjhBeK2nZjIPmzLq8ch
	2s6mtwAzFFDQNI0GVmwX5v0lfZljhMmmcfYDYQ+/akwiq7vkzib4v+Nb1fDd8yT8L+fFrvJWRtx+O
	MOGK/G/tGUKU+xSN7P0TEQecmz6lIiHNgljj17Kgfp0Cdifhw6P4bv7wonBudkTgg5nKFPr8PeLrH
	NCCP8+LUE2obMYg8BpYMBe/oYXh75LESKLAoCGReESvBdOCK8ZRmAA5wOIhOSlzHaj+xE4PzK82l9
	WYdnQfqQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesOU-00000002dN9-0SCi;
	Wed, 01 Jul 2026 10:42:16 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 661AVSAL01060427, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782901888; bh=zY2o5dWEAvddugmQW/vs6ACDRe9NBEJocX+1e1hRgcw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fptQfysDkOaqFFxM3SYMPybfkJ4BveTUE/3J/VPXssmowtbicMhcPH4AeImK6gKAE
	 srgAU5pBFXxxkkAgf749/dEpJDU+Nb3oxq/9sqpQTzWW4M0zTjzi6R+EMRunMrEpl/
	 PaXLYedqPmiRl7MfIBNObrkdgSClVOhqLqBgDwH27yR7+cU5WbwUKGrrQbr8h5ogBO
	 8g98+bXalDNJU6UJ/wHLZDouVVUUKXcuRMB8iOWQLq6/916OYAhKh5nOvO3nlW67eg
	 URtqpJSk375FtZv8I6CqaXD2euQ/bUkK/BsV70Jt8JqHaIfCUaTtMCxRRVdL1SvwP7
	 bKN2vhpXgaFAg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 661AVSAL01060427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Jul 2026 18:31:28 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Jul 2026 18:31:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Jul 2026 18:31:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 1 Jul 2026 18:31:28 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Linus Walleij <linusw@kernel.org>
CC: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>, "andriy.shevchenko@intel.com"
	<andriy.shevchenko@intel.com>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Thread-Topic: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Thread-Index: AQHdAijOAwCaZwN04Eyh2gkxEUiUVrZWmzIAgAHmnoA=
Date: Wed, 1 Jul 2026 10:31:28 +0000
Message-ID: <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com>
 <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
In-Reply-To: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_114214_821244_84FA9940 
X-CRM114-Status: GOOD (  19.16  )
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

SGkgTGludXMsDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+IE9uIE1vbiwgSnVuIDIyLCAyMDI2IGF0IDEwOjMz4oCvQU0gWXUtQ2h1biBMaW4gPGVs
ZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogVHp1eWkgQ2hh
bmcgPHR5Y2hhbmdAcmVhbHRlay5jb20+DQo+ID4NCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJp
bmRpbmdzIGZvciB0aGUgUmVhbHRlayBESEMgKERpZ2l0YWwgSG9tZSBDZW50ZXIpDQo+ID4gUlRE
MTYyNSBHUElPIGNvbnRyb2xsZXJzLg0KPiA+DQo+ID4gVGhlIFJURDE2MjUgR1BJTyBjb250cm9s
bGVyIGZlYXR1cmVzIGEgcGVyLXBpbiByZWdpc3RlciBhcmNoaXRlY3R1cmUNCj4gPiB0aGF0IGRp
ZmZlcnMgc2lnbmlmaWNhbnRseSBmcm9tIHByZXZpb3VzIGdlbmVyYXRpb25zLiBJdCB1dGlsaXpl
cw0KPiA+IHNlcGFyYXRlIHJlZ2lzdGVyIGJsb2NrcyBmb3IgR1BJTyBjb25maWd1cmF0aW9uIGFu
ZCBpbnRlcnJ1cHQgY29udHJvbC4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpDQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ICguLi4p
DQo+IA0KPiA+ICsgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gKw0KPiA+ICsgICIj
aW50ZXJydXB0LWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAyDQo+ID4gKw0KPiA+ICsgIGdwaW8t
cmFuZ2VzOiB0cnVlDQo+ID4gKw0KPiA+ICsgIGdwaW8tY29udHJvbGxlcjogdHJ1ZQ0KPiA+ICsN
Cj4gPiArICAiI2dwaW8tY2VsbHMiOg0KPiA+ICsgICAgY29uc3Q6IDINCj4gDQo+IEFmdGVyIGxv
b2tpbmcgYXQgdGhlIGRyaXZlciBJIG11c3QgY2hhbGxlbmdlIHRoaXMgYmluZGluZy4NCj4gDQo+
IFlvdXIgZHJpdmVyIGlzIGZ1bGwgb2YgKG9mZnNldCAlIDMyKSBhbmQgZXZlbiAob2Zmc2V0ICUg
MzIpICo0IHRvIGp1c3Qgd29yayBhcm91bmQNCj4gdGhlIGZhY3QgdGhhdCB0aGUgaGFyZHdhcmUg
aW5oZXJlbnRseSBoYXMgMzItcGluIGJhbmtzLg0KPiANCj4gSW5zdGVhZCBvZiB1c2luZyB0d29j
ZWxsIEdQSU8gYW5kIGlycXMsIGp1c3QgdXNlIHRocmVlY2VsbCwgaW50ZXJydXB0LWNlbGxzIGFu
ZA0KPiBncGlvLWNlbGxzIDMuDQo+IA0KPiBGaXJzdCBjZWxsIGlzIGJhbmssIHNlY29uZCBjZWxs
IGlzIG9mZnNldCBpbnNpZGUgZWFjaCBiYW5rLg0KPiANCj4gRm9yIExpbnV4IHNwZWNpZmljYWxs
eSB0aGVyZSBhcmUgaGVscGVycyBmb3IgZGVhbGluZyB3aXRoIHRoaXMgaW4gZ3Bpb2xpYiwgYW5k
DQo+IGZ1cnRoZXIgeW91IHdpbGwgYmUgYWJsZSB0byB1c2UgdGhlIEdQSU9fR0VORVJJQyBsaWJy
YXJ5LCB3aGlsZSB0aGlzIGlzIGJlc2lkZQ0KPiB0aGUgcG9pbnQgZm9yIHRoZSBiaW5kaW5nIGl0
c2VsZi4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNClRvIGNsYXJpZnkgdGhlIGhh
cmR3YXJlIGRlc2lnbjogdGhpcyBTb0MgZG9lcyBub3QgdXNlIGEgYmFua2VkIEdQSU8NCmFyY2hp
dGVjdHVyZS4NCg0KRWFjaCBHUElPIHBpbiBoYXMgaXRzIG93biBkZWRpY2F0ZWQgMzItYml0IGNv
bnRyb2wgcmVnaXN0ZXIgdGhhdCBoYW5kbGVzDQpib3RoIEdQSU8gY29uZmlndXJhdGlvbiBhbmQg
aW50ZXJydXB0IHNldHRpbmdzIChlLmcuLCBlZGdlL2xldmVsIGVuYWJsZSkuDQpUaGUgb25seSBl
eGNlcHRpb24gaXMgdGhlIGludGVycnVwdCBzdGF0dXMgcmVnaXN0ZXIsIHdoaWNoIGlzIGdyb3Vw
ZWQgaW50bw0KMzItYml0IHdvcmRzLg0KDQpTaW5jZSBwaHlzaWNhbCBHUElPIGJhbmtzIGRvIG5v
dCBleGlzdCwgdXNpbmcgYSAzLWNlbGwgPGJhbmsgb2Zmc2V0IGZsYWdzPg0KZm9ybWF0IHdvdWxk
IG1pc3JlcHJlc2VudCB0aGUgaGFyZHdhcmUuIFRoZXJlZm9yZSwNCmtlZXBpbmcgI2dwaW8tY2Vs
bHMgPSA8Mj4gYW5kICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj4gaXMgdGhlIG1vc3QgYWNjdXJhdGUN
CnJlZmxlY3Rpb24gb2YgdGhlIGFjdHVhbCBzaWxpY29uLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQo=

