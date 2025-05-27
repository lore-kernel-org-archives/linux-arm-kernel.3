Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B030C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k+by0adHcEvdVW7TpYj+/UGk4iIyaS/4a2TG6II89tI=; b=xSXRWm/NHKIAQU6ROBv6t3/LbD
	EUuWtoiEt7Dtqn0fHnVobqg67yclRSSp9aPJsIuzizZ8BzmmOaSSoeU+ycLir24kD9kHGAVxfb7gI
	xA8dpuSDw3HVeEnCDK99kL4OxrFMgt+DRaxW/DPPns5T3I1bZdYvGTz5CmPevSRO9fDyk6XhW/IJf
	fWZ4/GObzcZBwFAe34zO/Jo7CtnurmojZqEBrNy60AyRC+95ZJKevNf+ixU00+QB12x0pDT0IDGpk
	N4tHHQ4elpkfsm1a4KbnaAqcJemIwIuC27sS3Y9+Ez/q49nchC+CeLPCEID7cvo5HgBfQGWDHt6dp
	WBvpFCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoby-0000000A8y3-0yRP;
	Tue, 27 May 2025 07:20:34 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoXg-0000000A8LO-45Nv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 07:16:11 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 09:16:02 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 27 May 2025 09:16:02 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v2 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v2 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHbztc0+n0doXv/EUywtPoFaqnp/Q==
Date: Tue, 27 May 2025 07:16:02 +0000
Message-ID: <20250527071552.1424997-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445360726A
Content-Type: text/plain; charset="utf-8"
Content-ID: <E26ABAA79C8EA24BB96EF0E531D86379@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_001609_015204_5E0FEF36 
X-CRM114-Status: GOOD (  11.05  )
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

VGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgdXNlIG9mIHRoZSBDQUFNIChDcnlwdG9ncmFwaGljIEFj
Y2VsZXJhdGlvbiBhbmQNCkFzc3VyYW5jZSBNb2R1bGUpIG9uIHRoZSBpTVg4UVhQIChhbmQgaXRz
IHZhcmlhbnRzKS4NCg0KDQp2MjogKGRldGFpbGVkIGxvZ3MgaW4gZWFjaCBwYXRjaCkNCiAtIENs
YXJpZnkgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGhvdyB0aGUgY3Jhc2ggZml4IHdvcmtzIChGcmFu
ayBMaSkNCiAtIFJlc3RyaWN0IHBvd2VyLWRvbWFpbnMgb25seSBmb3IgaU1YOFEqIFNvQ3MgaW4g
YmluZGluZ3MgKEZyYW5rIExpKQ0KIC0gQ29sbGVjdCB0YWdzDQoNCnYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA1MjMxMzE4MTQuMTA0NzY2Mi0xLWpvaG4uZXJu
YmVyZ0BhY3RpYS5zZS9UDQoNCkhvcmlhIEdlYW50xIMgKDEpOg0KICBhcm02NDogZHRzOiBmcmVl
c2NhbGU6IGlteDhxeHAvaW14OHFtOiBBZGQgQ0FBTSBzdXBwb3J0DQoNCkpvaG4gRXJuYmVyZyAo
Myk6DQogIGNyeXB0bzogY2FhbSAtIFByZXZlbnQgY3Jhc2ggb24gc3VzcGVuZCB3aXRoIGlNWDhR
TSAvIGlNWDhVTFANCiAgY3J5cHRvOiBjYWFtIC0gU3VwcG9ydCBpTVg4UVhQIGFuZCB2YXJpYW50
cyB0aGVyZW9mDQogIGR0LWJpbmRpbmdzOiBjcnlwdG86IGZzbCxzZWMtdjQuMDogQWRkIHBvd2Vy
IGRvbWFpbnMgZm9yIGlNWDhRTSBhbmQNCiAgICBpTVg4UVhQDQoNCiAuLi4vYmluZGluZ3MvY3J5
cHRvL2ZzbCxzZWMtdjQuMC55YW1sICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysNCiAu
Li4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaSAgfCAzOCArKysrKysr
KysrKysrKysrKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kg
ICAgIHwgIDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSAg
ICB8ICAxICsNCiBkcml2ZXJzL2NyeXB0by9jYWFtL2N0cmwuYyAgICAgICAgICAgICAgICAgICAg
fCAgNyArKy0tDQogZHJpdmVycy9jcnlwdG8vY2FhbS9pbnRlcm4uaCAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KIDYgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OC1zcy1zZWN1cml0eS5kdHNpDQoNCi0tIA0KMi40OS4wDQo=

