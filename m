Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0CBE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GG0RjcNGNE2OK3lCVeZBPxKNfW8B/oXmAkc+WuOPYA=; b=VPGFKUEAqonRBo/pQaVi7EHoc1
	zIMY0jC8dZSAtXRjrdZPppXsGl+9uG7sxACE0XAdL8yQoNYaHNDC9Yvngjzh6pEfql8hKi70yWGVJ
	FN7EgXuj3Cjbr69BOMSVrcQiwd7M2lbtq0QxvEyW1wOvF0BbCr6pyzfOhFb04iv9f9/AKDseXiGOn
	MIqxIotgCzE+cVTn5VdPDdtayH+JCXRBlaOiiZwjRmAhwADIfXdir2PhlFwFzmrzMcjnMCA33afhb
	a8iENAWUIGt1vOg+dV9f4o8z+gGmi7MmTTdKYB9XzbPNBPw/Kw+Ya2PiPUrRDhjiV00LnuPtWNYB0
	Xtkhsgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMZbd-00000006yWG-1jiA;
	Sat, 14 Dec 2024 21:23:21 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMZaX-00000006yQl-3Ni1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 21:22:15 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-58-sktCOR70PYGp0bebtytxiw-1; Sat, 14 Dec 2024 21:22:09 +0000
X-MC-Unique: sktCOR70PYGp0bebtytxiw-1
X-Mimecast-MFC-AGG-ID: sktCOR70PYGp0bebtytxiw
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 14 Dec
 2024 21:21:12 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 14 Dec 2024 21:21:12 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guenter Roeck' <linux@roeck-us.net>, Phil Eichinger <phil@zankapfel.net>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: aspeed: replace mdelay with msleep
Thread-Topic: [PATCH] watchdog: aspeed: replace mdelay with msleep
Thread-Index: AQHbTJ2DHVjYGoChYUCL8UX75YmbgrLmQtrQ
Date: Sat, 14 Dec 2024 21:21:12 +0000
Message-ID: <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
References: <20241212113014.1075414-1-phil@zankapfel.net>
 <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
In-Reply-To: <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lvXtQohN2aPCdJrgvSH-FCni5w6sNfspm404zxd5YWQ_1734211329
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_132214_115918_1F3617F4 
X-CRM114-Status: GOOD (  17.45  )
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

RnJvbTogR3VlbnRlciBSb2Vjaw0KPiBTZW50OiAxMiBEZWNlbWJlciAyMDI0IDEzOjU2DQo+IFRv
OiBQaGlsIEVpY2hpbmdlciA8cGhpbEB6YW5rYXBmZWwubmV0Pjsgd2ltQGxpbnV4LXdhdGNoZG9n
Lm9yZzsgam9lbEBqbXMuaWQuYXU7DQo+IGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdTsgbGlu
dXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHdhdGNoZG9nOiBhc3BlZWQ6
IHJlcGxhY2UgbWRlbGF5IHdpdGggbXNsZWVwDQo+IA0KPiBPbiAxMi8xMi8yNCAwMzozMCwgUGhp
bCBFaWNoaW5nZXIgd3JvdGU6DQo+ID4gU2luY2UgaXQgaXMgbm90IGNhbGxlZCBpbiBhbiBhdG9t
aWMgY29udGV4dCB0aGUgbWRlbGF5IGZ1bmN0aW9uDQo+ID4gY2FuIGJlIHJlcGxhY2VkIHdpdGgg
bXNsZWVwIHRvIGF2b2lkIGJ1c3kgd2FpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwg
RWljaGluZ2VyIDxwaGlsQHphbmthcGZlbC5uZXQ+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3dh
dGNoZG9nL2FzcGVlZF93ZHQuYyB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0
Y2hkb2cvYXNwZWVkX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiBp
bmRleCBiNDc3M2E2YWFmOGMuLjk4ZWYzNDE0MDhmNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3dhdGNoZG9nL2FzcGVlZF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVk
X3dkdC5jDQo+ID4gQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcmVz
dGFydChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsDQo+ID4gICAJd2R0LT5jdHJsICY9IH5X
RFRfQ1RSTF9CT09UX1NFQ09OREFSWTsNCj4gPiAgIAlhc3BlZWRfd2R0X2VuYWJsZSh3ZHQsIDEy
OCAqIFdEVF9SQVRFXzFNSFogLyAxMDAwKTsNCj4gPg0KPiA+IC0JbWRlbGF5KDEwMDApOw0KPiA+
ICsJbXNsZWVwKDEwMDApOw0KPiA+DQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+IFRoaXMg
aXMgYSBfcmVzdGFydF8gaGFuZGxlci4gVGhlIG9ubHkgcHVycG9zZSBvZiB0aGUgZGVsYXkgaXMg
dG8gd2FpdA0KPiBmb3IgdGhlIHJlc2V0IHRvIHRyaWdnZXIuIEl0IGlzIG5vdCBzdXBwb3NlZCB0
byBzbGVlcC4NCg0KV2l0aCB0aGUgcmVjZW50IHNjaGVkdWxlciBjaGFuZ2VzIGlzbid0IHRoZSBj
b2RlIGxpa2VseSB0byBnZXQNCnByZS1lbXB0ZWQ/DQpXaGljaCAoZWZmZWN0aXZlbHkpIGNvbnZl
cnRzIGlzIHRvIGEgc2xlZXA/DQoNCglEYXZpZA0KIA0KPiANCj4gTkFDSy4NCj4gDQo+IEd1ZW50
ZXINCj4gDQo+IA0KPiANCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K


