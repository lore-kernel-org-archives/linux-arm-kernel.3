Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31611EFCD6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLKn0D3+caEG0fRfWnqbTBNVYksxlzArBkfJ/TX4iJw=; b=wEFwOziCyZY9Ot5ZPtPIDi9Lx9
	7hmJMHPWgI1bp1gu/Q6eF5GlWkbAW25oN8DgT7Pc5LaFKhYm+A+h5Z7lXUMMCRKjf/y5OBnlHTc7F
	l6k1cKDQr/QOX+z6B44hbGYDG5JUhq2D2nH+tX+qdMT0PurPwyPrKWaPln0D4GtZp9hHfpUFPIAk8
	nmeS04EeVVPvDKADIkE6ORI0JhjPjm3Lv3+pX8A8l316MWT4Mqp6BmcFCXUhgXSuafFe5SR68drKY
	hMF+CAdolEWV5g4QryAkgnJbiRuOEWnetctsO0YHMCCNy4R7Lt+LC3kEco+jb869Ytpf2A0Tw7rX9
	828j/0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWkl-00000006x57-3hFm;
	Mon, 09 Mar 2026 09:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWkl-00000006x4e-0kYa;
	Mon, 09 Mar 2026 09:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BLKn0D3+caEG0fRfWnqbTBNVYksxlzArBkfJ/TX4iJw=; b=jT0Bsgu7uI1tcQK92F7VZTE89I
	IlBuC/PXQvyYBdCiSpPUwr6LwW9uwo4vDGGjYxyYnMoC53ev26VpKz1jW/BNwzaYVKNA+XVEWpI5H
	W9nbbYVIQBePfNsnVJre+Jbo9JDazZ0DProiklAhTVx2EZxGQ6h8LErumiukZ55up1Lv5Qo6tl3mr
	0gKsEesj/eQR/LNTNeqlD5oO9W0h6e0lMNloK64/Lx1kpB+ZXvcbeoV9xHbb6o0cEtvcEuXevd0pP
	z2A1NojWW0tiWvEiEpl2OxGomNGmK54LKsEQJcKqV9YsxMX3lODVUmloH0vyXIJiAdGs7p1M058zH
	OFY1er+w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWkh-0000000Bl2n-2W1Z;
	Mon, 09 Mar 2026 09:18:18 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6299I3TV0266110, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773047883; bh=BLKn0D3+caEG0fRfWnqbTBNVYksxlzArBkfJ/TX4iJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=eyzmddQ1fCKznvjwToIpJ9OOcW0YqfvI1KGwxaui6GYNcM0PvdWOfIhguLEgB3RDx
	 2G5qjQBH2TTKpUzKm9aPaoMxI/D3ueoe3R5D1YtWdfSJ1PAm4S2gXixAHMUouK0Wcp
	 izuTq2IJNJs43DizFPMrJCrJyAJTjoHOkh3dyqlFbNaQ93j7/+D5PFqHYgL3fovH0o
	 9D3id/M6jF+A8XhcXinJ8dL4P6m5r6sdF+8TYrnrwgou65+KzkJYUDh6D5HdlBlsHh
	 VeaoE50WedvQMXXsHLpUQrmpNgfbDVy5VqTTtcI8hSaxrJlP0yUFUyzQNfC75BSXSU
	 YYTtwpp6YXrfw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6299I3TV0266110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:18:03 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:18:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:18:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 17:18:03 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Topic: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Index: AQHcrT45GXc0XObXlE68QVSv60G8LrWigisAgANt3nA=
Date: Mon, 9 Mar 2026 09:18:03 +0000
Message-ID: <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
 <20260307-purring-kind-binturong-1fcb37@quoll>
In-Reply-To: <20260307-purring-kind-binturong-1fcb37@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_091816_320932_204560DE 
X-CRM114-Status: GOOD (  23.89  )
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

PiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwMzo1MjozOVBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPg0K
PiA+IFJlbmFtZSAncmVhbHRlayxkdXR5LWN5Y2xlJyB0byAncmVhbHRlayxwdWxzZS13aWR0aC1h
ZGp1c3QnLg0KPiA+DQo+ID4gVGhlIHByZXZpb3VzIG5hbWUgd2FzIG1pc2xlYWRpbmcgYmVjYXVz
ZSB0aGlzIGhhcmR3YXJlIGJsb2NrIGlzIG5vdCBhDQo+ID4gUFdNIGdlbmVyYXRvci4gSXQgZG9l
cyBub3QgZ2VuZXJhdGUgYSBzaWduYWwgd2l0aCBhIHNwZWNpZmljIGZyZXF1ZW5jeQ0KPiA+IGFu
ZCBkdXR5IHJhdGlvLg0KPiA+DQo+ID4gSW5zdGVhZCwgaXQgcHJvdmlkZXMgYSBmaXhlZCBuYW5v
c2Vjb25kLWxldmVsIGFkanVzdG1lbnQgdG8gdGhlDQo+ID4gcmlzaW5nLyBmYWxsaW5nIGVkZ2Vz
IG9mIGFuIGV4aXN0aW5nIHNpZ25hbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENo
YW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBM
aW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4g
TGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdz
L3BpbmN0cmwvcmVhbHRlayxydGQxMzE1ZS1waW5jdHJsLnlhbWwgICAgICAgfCA5ICsrKysrKy0t
LQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0cmwueWFt
bCAgICAgICB8IDkgKysrKysrLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWss
cnRkMTYxOWItcGluY3RybC55YW1sICAgICAgIHwgOSArKysrKystLS0NCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVh
bHRlayxydGQxMzE1ZS1waW5jdHJsLnkNCj4gPiBhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRkMTMxNWUtcGluY3RybC55DQo+ID4g
YW1sIGluZGV4IDkwYmQ0OWQ4N2QyZS4uN2IzODg4YjJjZWE4IDEwMDY0NA0KPiA+IC0tLQ0KPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQx
MzE1ZS1waW5jdHJsLnkNCj4gPiBhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0DQo+ID4gKysrIHJsLnlh
bWwNCj4gPiBAQCAtMTMzLDEwICsxMzMsMTMgQEAgcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gICAg
ICAgICAgbWluaW11bTogMA0KPiA+ICAgICAgICAgIG1heGltdW06IDcNCj4gPg0KPiA+IC0gICAg
ICByZWFsdGVrLGR1dHktY3ljbGU6DQo+ID4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRq
dXN0Og0KPiANCj4gTm8sIHRoYXQncyBBQkkgYnJlYWsgd2l0aG91dCBleHBsYW5hdGlvbi4gIm1p
c2xlYWRpbmciIGlzIG5vdCB0aGUgc3VmZmljaWVudA0KPiBhcmd1bWVudCBmb3IgYnJlYWtpbmcg
QUJJLg0KPiBZb3UgYXJlIHN0dWNrIHdpdGggdGhlIEFCSSB5b3UgYWRkZWQgYmFjayBpbiAyMDIz
Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KVGhlIHJlYXNvbiBJIHJlbmFt
ZWQgJ3JlYWx0ZWssZHV0eS1jeWNsZScgdG8gJ3JlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0JyBp
cyB0aGF0DQpkdXJpbmcgdGhlIHYxIHJldmlldywgaXQgd2FzIHBvaW50ZWQgb3V0IHRoYXQgdGhl
IG5hbWUgY2F1c2VkIGNvbmZ1c2lvbiB3aXRoDQpzdGFuZGFyZCBQV00gYmluZGluZ3MgWzFdLiBT
aW5jZSBJIG5lZWQgdG8gbW9kaWZ5IHRoZSBkcml2ZXIgbG9naWMgdG8gYWRkcmVzcw0KdGhpcywg
SSBpbnRlbmRlZCB0byB1cGRhdGUgdGhlIGJpbmRpbmcgc2ltdWx0YW5lb3VzbHkuDQoNCkFsdGhv
dWdoIHRoZSBiaW5kaW5nIHdhcyBhZGRlZCBpbiAyMDIzLCB0aGVyZSBhcmUgY3VycmVudGx5IG5v
IERUUyBmaWxlcyBpbiB0aGUNCm1haW5saW5lIGtlcm5lbCB0aGF0IHVzZSB0aGUgMTMxNWUsIDEz
MTlkLCBvciAxNjE5YiBwaW5jdHJsIGRldmljZSBub2Rlcy4NClRoZXJlZm9yZSwgY2hhbmdpbmcg
dGhpcyBwcm9wZXJ0eSBuYW1lIHdpbGwgbm90IGJyZWFrIGFueSBleGlzdGluZyBkZXZpY2Ugc3Vw
cG9ydA0KaW4gdGhlIG1haW5saW5lIHRyZWUuDQoNCkFzIGZvciB0aGUgcGF0Y2ggc3RydWN0dXJl
LCBJIHNlcGFyYXRlZCB0aGUgYmluZGluZyBhbmQgZHJpdmVyIGNoYW5nZXMgc29sZWx5DQpiZWNh
dXNlIGNoZWNrcGF0Y2gucGwgd2FybmVkOg0KIldBUk5JTkc6IERUIGJpbmRpbmcgZG9jcyBhbmQg
aW5jbHVkZXMgc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2guIg0KDQpHaXZlbiB0aGF0IHRoZXJl
IGFyZSBubyBhY3R1YWwgdXNlcnMgb2YgdGhpcyBwcm9wZXJ0eSBpbiB0aGUgY3VycmVudCBtYWlu
bGluZSBEVFMsDQp3b3VsZCBpdCBiZSBhY2NlcHRhYmxlIHRvIHByb2NlZWQgd2l0aCB0aGlzIHJl
bmFtZT8NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9kNWJlMzU3YzE0Yjg0MTU1
YWRmYThhOWYwMGE2NGQ4M0ByZWFsdGVrLmNvbS8NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0K

