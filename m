Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E387CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJHxpSQ2RAsx52NGXeVPNpjdG3TF8+xCdq6mPtq3ZlA=; b=QKqcuyUCSsH2Cd9Dr6cArz0Hfr
	9MXPwBzWqmrSf2sECJzxa48tg1A4RkokhSA+lY5DvbOnQAChNiDFw368ERQx53un+rqJuKiLJcktm
	AAGQcYV1DgbDWn18gyumTnfufCyjJOIdH5rzOZJ1eTknXVqWyf9OfEFspfgyo6OsJL48AU6wWoB/j
	tg5F7JpHZ2RdsXgIrYOdrCx6457eRVEtrRBSuo7Tmh5FJ21n7UJ55vJR5BHdTwo3GnM9x8+jJ5zaY
	3R3aM1AZWIzrDSbZJ7kbaiOI8+TuUDbytkQTWf+sL3d8SNIGSZNaQ8j+SPhU2dzdk3hOMX02+yCf+
	g0mvvFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFEP-0000000GEZ6-0PaV;
	Tue, 05 May 2026 12:50:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFEN-0000000GEYi-0aGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C01BC446F5
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A802EC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985430;
	bh=kJHxpSQ2RAsx52NGXeVPNpjdG3TF8+xCdq6mPtq3ZlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ye08dOtX5KswflTgRy7PioBdoSHzsNA0RQxedsIJKIPz6V+B8rSm6nxQbmGoY57HM
	 gEkEC0sm93CSINHwSl0nI1nz1Ow05cj7q5bmYMgP0D9vf9TggYlWvLtu6amg/rZS+y
	 c8I8jmtAFKRujwezh0WXKHmuk1MmvTDAxhYDmxcadk1JaFGPpEtErVe63hJuzryrqr
	 LO//AG5UIfxiImG4kzaWeDMSMjPl01UxhVyQj9SZsMdjlAEHtAGj9TjmCJEKYXBBXM
	 e4Tk/Whzf+of6Av/vW8LQ1Heaw7ISyLlq7igxySdZ1dJs96zAP03l/SKWr27U5zOvb
	 VqkrlnmvjVaCQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso20749041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BkAFr5k5nwB3bY1GODxBeqxQ6oGEF/47XdB6Lt9wLUuwRQT6UTo5M8/NCaN0ZsLJ15ePI3UOueZ/OFEG61ifY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+/cu5vK0BvaPCO92RzxXn3Ho/Sl/jI37aQTIeilLOuzIUjGx3
	uHSf8aX/ojbO+xxP2QwD1I14UEfOJhUqXWQ/OWQyiwxB3Zz8sYAMKLZLGrWEoSgLx0MdfTctBUt
	fzoAHcjTpWrCd4vUzo42EOKM6TeQWGGw=
X-Received: by 2002:a05:651c:e07:b0:393:a39f:5826 with SMTP id
 38308e7fff4ca-393b2bb72cemr10436711fa.21.1777985429375; Tue, 05 May 2026
 05:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:50:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
X-Gm-Features: AVHnY4KycpDZhMuiBecuVH9tsvrsrZHEaBFUypvKntpPBTYsQnaEicGr2XejHl0
Message-ID: <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_055031_221031_3764250F 
X-CRM114-Status: GOOD (  18.53  )
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

SGkgRnJhbmshDQoNCk9uIFR1ZSwgTWF5IDUsIDIwMjYgYXQgMTo1NeKAr0FNIEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPiB3cm90ZToNCg0KPiBBZGQgYSBnZW5lcmljIHBpbmN0cmwgYmluZGlu
ZyBmb3IgYm9hcmQtbGV2ZWwgcGlubXV4IGNoaXBzIHRoYXQgYXJlDQo+IGNvbnRyb2xsZWQgdGhy
b3VnaCB0aGUgbXVsdGlwbGV4ZXIgc3Vic3lzdGVtLg0KPg0KPiBPbiBzb21lIGJvYXJkcywgZXNw
ZWNpYWxseSBkZXZlbG9wbWVudCBib2FyZHMsIGV4dGVybmFsIG11eCBjaGlwcyBhcmUgdXNlZA0K
PiB0byBzd2l0Y2ggU29DIHNpZ25hbHMgYmV0d2VlbiBkaWZmZXJlbnQgcGVyaXBoZXJhbHMgKGUu
Zy4gTU1DIGFuZCBVQVJUKS4NCj4gVGhlIG11eCBzZWxlY3QgbGluZXMgYXJlIG9mdGVuIGRyaXZl
biBieSBhIEdQSU8gZXhwYW5kZXIgb3ZlciBJMkMsDQo+IGFzIGlsbHVzdHJhdGVkIGJlbG93Og0K
Pg0KPiAgICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgIOKUjOKUgOKUgOKUgOKU
gOKUgOKUkA0KPiAgICAgICAgIOKUgiBTT0MgIOKUgiAgICAgIOKUgiAgICAg4pSCICAgIOKUjOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKUgiAg
ICAg4pSC4pSA4pSA4pSA4pa64pSCIE1NQyAgIOKUgg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAg
ICAgIOKUgiBNVVgg4pSCICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAgICAgICAg
IOKUgiAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKWuuKUgiAgICAg4pSCICAgIOKUjOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKUgiAgICAg4pSC
4pSA4pSA4pSA4pa64pSCIFVBUlQgIOKUgg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKU
lOKUgOKUgOKUgOKUgOKUgOKUmCAgICDilJTilIDilIDilIDilIDilIDilIDilIDilJgNCj4gICAg
ICAgICDilIIgICAgICDilIIgICAgICAgICDilrINCj4gICAgICAgICDilIIgICAgICDilIIgICAg
4pSM4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSQDQo+ICAgICAgICAg4pSCIEkyQyAg4pSc4pSA4pSA4pSA4pa64pSCIEdQSU8gRXhwYW5k
ZXIgICAgIOKUgg0KPiAgICAgICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgICDilJTilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgN
Cj4NCj4gVHJhZGl0aW9uYWxseSwgZ3Bpby1ob2cgaXMgdXNlZCB0byBjb25maWd1cmUgdGhlIG9u
Ym9hcmQgbXV4IGF0IGJvb3QuDQo+IEhvd2V2ZXIsIHRoZSBHUElPIGV4cGFuZGVyIG1heSBwcm9i
ZSBsYXRlciB0aGFuIGNvbnN1bWVyIGRldmljZXMgc3VjaCBhcw0KPiBNTUMuIEFzIGEgcmVzdWx0
LCB0aGUgTVVYIG1pZ2h0IG5vdCBiZSBjb25maWd1cmVkIHdoZW4gdGhlIHBlcmlwaGVyYWwNCj4g
ZHJpdmVyIHByb2JlcywgbGVhZGluZyB0byBpbml0aWFsaXphdGlvbiBmYWlsdXJlcyBvciBkYXRh
IHRyYW5zZmVyIGVycm9ycy4NCj4NCj4gSW50cm9kdWNlIGEgZ2VuZXJpYyBwaW5jdHJsIGJpbmRp
bmcgdGhhdCBtb2RlbHMgdGhlIGJvYXJkLWxldmVsIE1VWCBhcyBhDQo+IHBpbiBjb250cm9sIHBy
b3ZpZGVyIGFuZCBidWlsZHMgcHJvcGVyIGRldmljZSBsaW5rcyBiZXR3ZWVuIHRoZSBNVVgsIGl0
cw0KPiBHUElPIGNvbnRyb2xsZXIsIGFuZCBwZXJpcGhlcmFsIGRldmljZXMuIFRoaXMgZW5zdXJl
cyBjb3JyZWN0IHByb2JlDQo+IG9yZGVyaW5nIGFuZCByZWxpYWJsZSBtdXggY29uZmlndXJhdGlv
bi4NCj4NCj4gVGhlIGltcGxlbWVudGF0aW9uIGxldmVyYWdlcyB0aGUgc3RhbmRhcmQgbXVsdGlw
bGV4ZXIgc3Vic3lzdGVtLCB3aGljaA0KPiBwcm92aWRlcyBicm9hZCBzdXBwb3J0IGZvciBvbmJv
YXJkIG11eCBjb250cm9sbGVycyBhbmQgYXZvaWRzIHRoZSBuZWVkIGZvcg0KPiBwZXItZHJpdmVy
IGN1c3RvbSBNVVggaGFuZGxpbmcNCj4NCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5r
LkxpQG54cC5jb20+DQoNCkkgcHV0IHRoZSBwaW5jdHJsIHBhdGNoZXMgb24gYW4gaW1tdXRhYmxl
IGJyYW5jaCBmb3IgdGVzdGluZyBhZ2FpbiwNCmlmIG5vdGhpbmcgZXhwbG9kZXMgSSB3aWxsIHRy
eSB0byBtZXJnZSBpdCBmb3IgbGludXgtbmV4dCBBU0FQIQ0KDQpZb3VycywNCkxpbnVzIFdhbGxl
aWoNCg==

