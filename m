Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46274FD530E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCg2Zxvo6acA2Yw2ZIYWtwivAjVjBS6a9BEhToze71Q=; b=Wp2tYsx3h32O0RZSemZ9nMYoxH
	ORCVCxp24rAqhvdNQoVUVQgUCiEodEdJkmK1JJnOU1Rei3GoRW6822n7WFT4rL/8xgqFT5/6/yM2h
	+eEt8BiW4Uz7jQI4ov0wbezn5TQvz3dSzrS7Fl83OmPTiNMRckZe33KnTVq2Of75TrpD6zSqGTCmP
	OCuNhMNvlOvsYylobWihgOUxdNm64YPWlzrIPZ0wv2pNf9hEMLgqaqj+z6voTQWkSaxL+NSs+RdKi
	210qvOw5iKr5t+JXYx6pqJz6+rtzQXuyxywU3x7XLNrlJ3LxHLKjnn3dnR8qzqBbyxOFz59v2wPAo
	ZoB2Udug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtkH-000000082wi-2yfJ;
	Fri, 27 Feb 2026 09:02:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtkE-000000082vf-2upu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 857BE43D96
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8FAC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772182965;
	bh=iCg2Zxvo6acA2Yw2ZIYWtwivAjVjBS6a9BEhToze71Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k4qi1EZfRw2heqQivANaFL/LcTxGSYUAL8eWKO4G9HW4qJSVHMEryLEU1uC3nbHNP
	 dr70uzD3S/CL9agrWWYWZ/8NFND6InWIm/yglWWLPfSKcxVM7zZr2z57vs11kFQE0T
	 WdunP7/XZrWvda/guiWKsYE+tXtScAY0ZfoP2Yu+N/6Up+3QuoBC1Lzaow0B7bn3Sa
	 BkS6o+Esa0DruWvzvXa4sdzl2Z7yrTQbvk+BZV1baXrNFlCIIuHvHQlYYNay6M5b6C
	 1e9/ymLJXDQN8F+AduEpqIsKmOfNBjJPtfwabkA5asOseA5AIJraB2+QTIW6vF2b+R
	 +ik24v2kk5M9Q==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7982c3b7dfcso17991597b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 01:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHdALhHljBc7oCYiDl/ul0ehCPBSa6XcqyrVW3QVMPJRg/qoWkff9IvRhx1EsNsZzURQA8lRJvEu0B9xdh9q9H@lists.infradead.org
X-Gm-Message-State: AOJu0YyRf8KLi5b1qL7NO9Y4joIDXyab46v8cRNn+Qh4L5cfmawzCi4u
	HdyJj+pN8YqSJO6miUAz1mFfR2szI32WkPrh17KZ1Q7c/DQfYA4lMDfVbnr3oSFs2o09waUK6hy
	WJsPAPFOFoDxjK2eAauAWeNxXJNa2Jx4=
X-Received: by 2002:a05:690c:60c5:b0:796:3c39:eb96 with SMTP id
 00721157ae682-79885467a49mr18074887b3.13.1772182964670; Fri, 27 Feb 2026
 01:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com> <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:02:33 +0100
X-Gmail-Original-Message-ID: <CAD++jL=DXqRaqaiQ6d9U5pZMy5E16quma3_C_yQUw2jStmSO6Q@mail.gmail.com>
X-Gm-Features: AaiRm51E612-p9CExYKxT8Z14vh3Cki1CVedgmDy7Sz7aZn6k_WzumQSUtTh2J4
Message-ID: <CAD++jL=DXqRaqaiQ6d9U5pZMy5E16quma3_C_yQUw2jStmSO6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_010246_804173_39839EBD 
X-CRM114-Status: GOOD (  16.88  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMTI6NTXigK9BTSBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4gd3JvdGU6DQoNCj4gQWRkIGEgZ2VuZXJpYyBwaW5jdHJsIGJpbmRpbmcgZm9yIGJvYXJk
LWxldmVsIHBpbm11eCBjaGlwcyB0aGF0IGFyZQ0KPiBjb250cm9sbGVkIHRocm91Z2ggdGhlIG11
bHRpcGxleGVyIHN1YnN5c3RlbS4NCj4NCj4gT24gc29tZSBib2FyZHMsIGVzcGVjaWFsbHkgZGV2
ZWxvcG1lbnQgYm9hcmRzLCBleHRlcm5hbCBtdXggY2hpcHMgYXJlIHVzZWQNCj4gdG8gc3dpdGNo
IFNvQyBzaWduYWxzIGJldHdlZW4gZGlmZmVyZW50IHBlcmlwaGVyYWxzIChlLmcuIE1NQyBhbmQg
VUFSVCkuDQo+IFRoZSBtdXggc2VsZWN0IGxpbmVzIGFyZSBvZnRlbiBkcml2ZW4gYnkgYSBHUElP
IGV4cGFuZGVyIG92ZXIgSTJDLA0KPiBhcyBpbGx1c3RyYXRlZCBiZWxvdzoNCj4NCj4gICAgICAg
ICDilIzilIDilIDilIDilIDilIDilIDilJAgICAgICDilIzilIDilIDilIDilIDilIDilJANCj4g
ICAgICAgICDilIIgU09DICDilIIgICAgICDilIIgICAgIOKUgiAgICDilIzilIDilIDilIDilIDi
lIDilIDilIDilJANCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgICAgIOKUguKUgOKU
gOKUgOKWuuKUgiBNTUMgICDilIINCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgTVVY
IOKUgiAgICDilJTilIDilIDilIDilIDilIDilIDilIDilJgNCj4gICAgICAgICDilIIgICAgICDi
lJzilIDilIDilIDilIDilIDilrrilIIgICAgIOKUgiAgICDilIzilIDilIDilIDilIDilIDilIDi
lIDilJANCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgICAgIOKUguKUgOKUgOKUgOKW
uuKUgiBVQVJUICDilIINCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilJTilIDilIDilIDi
lIDilIDilJggICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+ICAgICAgICAg4pSCICAg
ICAg4pSCICAgICAgICAg4payDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgIOKUjOKUgOKUgOKU
gOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAg
ICAgICAgIOKUgiBJMkMgIOKUnOKUgOKUgOKUgOKWuuKUgiBHUElPIEV4cGFuZGVyICAgICDilIIN
Cj4gICAgICAgICDilJTilIDilIDilIDilIDilIDilIDilJggICAg4pSU4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+DQo+IFRyYWRp
dGlvbmFsbHksIGdwaW8taG9nIGlzIHVzZWQgdG8gY29uZmlndXJlIHRoZSBvbmJvYXJkIG11eCBh
dCBib290Lg0KPiBIb3dldmVyLCB0aGUgR1BJTyBleHBhbmRlciBtYXkgcHJvYmUgbGF0ZXIgdGhh
biBjb25zdW1lciBkZXZpY2VzIHN1Y2ggYXMNCj4gTU1DLiBBcyBhIHJlc3VsdCwgdGhlIE1VWCBt
aWdodCBub3QgYmUgY29uZmlndXJlZCB3aGVuIHRoZSBwZXJpcGhlcmFsDQo+IGRyaXZlciBwcm9i
ZXMsIGxlYWRpbmcgdG8gaW5pdGlhbGl6YXRpb24gZmFpbHVyZXMgb3IgZGF0YSB0cmFuc2ZlciBl
cnJvcnMuDQo+DQo+IEludHJvZHVjZSBhIGdlbmVyaWMgcGluY3RybCBiaW5kaW5nIHRoYXQgbW9k
ZWxzIHRoZSBib2FyZC1sZXZlbCBNVVggYXMgYQ0KPiBwaW4gY29udHJvbCBwcm92aWRlciBhbmQg
YnVpbGRzIHByb3BlciBkZXZpY2UgbGlua3MgYmV0d2VlbiB0aGUgTVVYLCBpdHMNCj4gR1BJTyBj
b250cm9sbGVyLCBhbmQgcGVyaXBoZXJhbCBkZXZpY2VzLiBUaGlzIGVuc3VyZXMgY29ycmVjdCBw
cm9iZQ0KPiBvcmRlcmluZyBhbmQgcmVsaWFibGUgbXV4IGNvbmZpZ3VyYXRpb24uDQo+DQo+IFRo
ZSBpbXBsZW1lbnRhdGlvbiBsZXZlcmFnZXMgdGhlIHN0YW5kYXJkIG11bHRpcGxleGVyIHN1YnN5
c3RlbSwgd2hpY2gNCj4gcHJvdmlkZXMgYnJvYWQgc3VwcG9ydCBmb3Igb25ib2FyZCBtdXggY29u
dHJvbGxlcnMgYW5kIGF2b2lkcyB0aGUgbmVlZCBmb3INCj4gcGVyLWRyaXZlciBjdXN0b20gTVVY
IGhhbmRsaW5nLg0KPg0KPiBBbGxvdyBwaW5jdHJsLSogcGF0dGVybiBhcyBub2RlIG5hbWUgYmVj
YXVzZSB0aGlzIHBpbmN0cmwgZGV2aWNlIGhhdmUgbm90DQo+IHJlZyBwcm9wZXJ0eS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQoNCkkgdGhpbmsgdGhp
cyBpcyBzbWFydCBhbmQgZWxlZ2FudC4NClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz4NCg0KWW91cnMsDQpMaW51cyBXYWxsZWlqDQo=

