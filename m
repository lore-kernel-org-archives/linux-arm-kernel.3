Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EF8C531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUUuOo6ZxopLvjIIEdBmRg87D1jjyje4PdZz0bjrgJU=; b=sWNEEM6yR62gemGM0kqam/bk/4
	FNmoe1KSS7kqoiYM3+z5OuwsRpOhfE6r5dZM+C+ZA9HUY42/fJNm1Dw8Hyqq6dnbzJ6zPgZjybz8n
	YwJqRMOEQE3L1CrK+SGg0JaQ6r1VT5uEyGCBCHO/wauHE4D8t7J/Sec7h5pemRtHqPP97Qvp+M+c6
	PCEQtEw/extvTLofI1lV/KuMRCg7yoGex9exux4fu9dFk25u384AtTVDZEBwbc58x94S9ukRnGnB8
	fz3epbylt4DGm8VbxWvSt9/7UY1guCLxbNg4gjoffoprx0jBB3Q3prteJAnoqKqZm1BkN0IDK7F0q
	y7DQ937Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDCK-0000000CQ90-41z7;
	Thu, 19 Feb 2026 23:12:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDCI-0000000CQ7q-3iQC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 23:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FCC8440AB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 23:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D1EC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771542758;
	bh=nUUuOo6ZxopLvjIIEdBmRg87D1jjyje4PdZz0bjrgJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABolqf4aUjZpne4hZV8TotXvrfrZdQbUypdnQOST6bcfHgh/1R/LS76yw2RZdd8C+
	 aBSa+QhZy64NjjGNpyVSIAkheruiA0L5rboDgy85J8DHiedpaVX1+pYYIUhM9DRIp0
	 cEWAlmVkGVRIzWfoFEhqApE20fmSU6e3cDwwnNkuEQ1HUX+p11oltQeUbRuPCdk2CU
	 Tv4RZJBCLR3uGjR5dhCU2/jl8+V6brxKoWGafnwVcsz8pm6lSoBs59//EcyqPaPepE
	 O4nglqhIlPhGFN8s79vwd9MpyFZCVnRjrbz9BpSXOZYknACUw9nWQHrgf5XuKNj/F7
	 GTbB4O8TJ4UPA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7946a1f2430so14276317b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 15:12:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+lSJtbRYzshtunVmSp+UVUsOpofwNnZv44A8hCQWde0ZfMmaDiBTzqW/1zngXrqie6Id+ugLfTmOwjJzUlf5y@lists.infradead.org
X-Gm-Message-State: AOJu0YyzHoHMm1LdRStuQeBhqlEacdXVoTSG3ovggHYUnLR5RhQTFxT+
	WsBLuiBBaYnOveqLpeFl6T3C9SYrKrnxV0J+Npl//BT1a60fxA+iEpVLYjuSc3jbPL9cfgFoxVV
	gvST8ygg/Hwrj020RxhaPRMqsN8M44bw=
X-Received: by 2002:a05:690c:498e:b0:796:2dfb:4af0 with SMTP id
 00721157ae682-797ac4e1933mr158898597b3.10.1771542757367; Thu, 19 Feb 2026
 15:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 00:12:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLmc43G9Ny9pseFw=HqmkaRPJdqMTXyLSa5eQUdoXNCu_Q@mail.gmail.com>
X-Gm-Features: AaiRm51dIVUnrSx9uukc7pK72Gq6A4VMruWXR8EfofV5QNuTsk2vfzGXdc8DdSY
Message-ID: <CAD++jLmc43G9Ny9pseFw=HqmkaRPJdqMTXyLSa5eQUdoXNCu_Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_151238_967622_599AB582 
X-CRM114-Status: GOOD (  17.92  )
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

SGkgRnJhbmssDQoNCk9uIFRodSwgRmViIDE5LCAyMDI2IGF0IDExOjI04oCvUE0gRnJhbmsgTGkg
PEZyYW5rLkxpQG54cC5jb20+IHdyb3RlOg0KDQo+IEFkZCBhIGdlbmVyaWMgcGluY3RybCBiaW5k
aW5nIGZvciBib2FyZC1sZXZlbCBwaW5tdXggY2hpcHMgdGhhdCBhcmUNCj4gY29udHJvbGxlZCB0
aHJvdWdoIHRoZSBtdWx0aXBsZXhlciBzdWJzeXN0ZW0uDQo+DQo+IE9uIHNvbWUgYm9hcmRzLCBl
c3BlY2lhbGx5IGRldmVsb3BtZW50IGJvYXJkcywgZXh0ZXJuYWwgbXV4IGNoaXBzIGFyZSB1c2Vk
DQo+IHRvIHN3aXRjaCBTb0Mgc2lnbmFscyBiZXR3ZWVuIGRpZmZlcmVudCBwZXJpcGhlcmFscyAo
ZS5nLiBNTUMgYW5kIFVBUlQpLg0KPiBUaGUgbXV4IHNlbGVjdCBsaW5lcyBhcmUgb2Z0ZW4gZHJp
dmVuIGJ5IGEgR1BJTyBleHBhbmRlciBvdmVyIEkyQywNCj4gYXMgaWxsdXN0cmF0ZWQgYmVsb3c6
DQo+DQo+ICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSQICAgICAg4pSM4pSA4pSA4pSA
4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCIFNPQyAg4pSCICAgICAg4pSCICAgICDilIIgICAg4pSM
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg4pSC
ICAgICDilILilIDilIDilIDilrrilIIgTU1DICAg4pSCDQo+ICAgICAgICAg4pSCICAgICAg4pSC
ICAgICAg4pSCIE1VWCDilIIgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+ICAgICAg
ICAg4pSCICAgICAg4pSc4pSA4pSA4pSA4pSA4pSA4pa64pSCICAgICDilIIgICAg4pSM4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg4pSCICAgICDi
lILilIDilIDilIDilrrilIIgVUFSVCAg4pSCDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg
4pSU4pSA4pSA4pSA4pSA4pSA4pSYICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAg
ICAgICAgIOKUgiAgICAgIOKUgiAgICAgICAgIOKWsg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAg
ICDilIzilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilJANCj4gICAgICAgICDilIIgSTJDICDilJzilIDilIDilIDilrrilIIgR1BJTyBFeHBh
bmRlciAgICAg4pSCDQo+ICAgICAgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgIOKUlOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
mA0KPg0KPiBUcmFkaXRpb25hbGx5LCBncGlvLWhvZyBpcyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUg
b25ib2FyZCBtdXggYXQgYm9vdC4NCj4gSG93ZXZlciwgdGhlIEdQSU8gZXhwYW5kZXIgbWF5IHBy
b2JlIGxhdGVyIHRoYW4gY29uc3VtZXIgZGV2aWNlcyBzdWNoIGFzDQo+IE1NQy4gQXMgYSByZXN1
bHQsIHRoZSBNVVggbWlnaHQgbm90IGJlIGNvbmZpZ3VyZWQgd2hlbiB0aGUgcGVyaXBoZXJhbA0K
PiBkcml2ZXIgcHJvYmVzLCBsZWFkaW5nIHRvIGluaXRpYWxpemF0aW9uIGZhaWx1cmVzIG9yIGRh
dGEgdHJhbnNmZXIgZXJyb3JzLg0KPg0KPiBJbnRyb2R1Y2UgYSBnZW5lcmljIHBpbmN0cmwgYmlu
ZGluZyB0aGF0IG1vZGVscyB0aGUgYm9hcmQtbGV2ZWwgTVVYIGFzIGENCj4gcGluIGNvbnRyb2wg
cHJvdmlkZXIgYW5kIGJ1aWxkcyBwcm9wZXIgZGV2aWNlIGxpbmtzIGJldHdlZW4gdGhlIE1VWCwg
aXRzDQo+IEdQSU8gY29udHJvbGxlciwgYW5kIHBlcmlwaGVyYWwgZGV2aWNlcy4gVGhpcyBlbnN1
cmVzIGNvcnJlY3QgcHJvYmUNCj4gb3JkZXJpbmcgYW5kIHJlbGlhYmxlIG11eCBjb25maWd1cmF0
aW9uLg0KPg0KPiBUaGUgaW1wbGVtZW50YXRpb24gbGV2ZXJhZ2VzIHRoZSBzdGFuZGFyZCBtdWx0
aXBsZXhlciBzdWJzeXN0ZW0sIHdoaWNoDQo+IHByb3ZpZGVzIGJyb2FkIHN1cHBvcnQgZm9yIG9u
Ym9hcmQgbXV4IGNvbnRyb2xsZXJzIGFuZCBhdm9pZHMgdGhlIG5lZWQgZm9yDQo+IHBlci1kcml2
ZXIgY3VzdG9tIE1VWCBoYW5kbGluZw0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJh
bmsuTGlAbnhwLmNvbT4NCg0KSSBraW5kIG9mIGxpa2Ugd2hhdCBJIHNlZSBoZXJlLiA6KQ0KDQpU
aGlzIG1ha2VzIGEgbG90IG9mIHNlbnNlOiBpdCB1c2VzIG11eGVzLCBhbmQgaXQgbXV4ZXMgcGlu
cy4NClNvIHRoYXQgaXMgdGhlIGFwcHJvcHJpYXRlIGRlc2NyaXB0aW9uLCBwaW5tdXhlcyB1c2lu
Zw0KbXV4ZXMgKGluIHR1cm4gY29udHJvbGxlZCBieSBHUElPcykuDQoNCkkganVzdCBuZWVkIHRv
IGhhdmUgYnV5LWluIGZyb20gRFQgYmluZGluZw0KbWFpbnRhaW5lcnMgYW5kIHRoZSBhdXRob3Jz
IG9mIHRoZSBtdXggY29yZSB0aGF0IHRoaXMgaXMgYSBnb29kDQppZGVhLg0KDQpZb3VycywNCkxp
bnVzIFdhbGxlaWoNCg==

