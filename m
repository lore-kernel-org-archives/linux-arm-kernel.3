Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5134C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lpHAaiWow+aad2BBKkvtJuEQxaOZwqLxi8ae+QrPWKA=; b=jCSQ8hWj1ziadxkqoLHvR+QmXn
	NW1/1V0jFyHuotCae7fsLOXbXQh6gaPcgBg50W112VsqKpmTjrW0IgexFn/Z76bCunzwHsaZmxaPK
	U9p6cZmVKTLfRkXBRtGzVoo7amiBgmJxtNv5kzGI4Q+eAEHDo8+IM0gmTwCCexYVdYE+dl+jfHopN
	GFN3YpKAaHnRCJ9OGCueOq4vHrrHeGcHxJMZqFiZeA3ArcKD5faQqAqiRkewVo1P8c/r7fVV1pXLn
	/jDnY60D5RfBS81EkgkDbhHKz/KZvYTwXSQbN+OVDyjvTMw2DrVHvv/VtZUImiy8XTPRIkY7w2fMu
	JKdqBfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKI4B-0000000DSfX-31Nh;
	Wed, 28 May 2025 14:47:39 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHzt-0000000DRuQ-39of
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:43:15 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 16:43:07 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Wed, 28 May 2025 16:43:07 +0200
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
Subject: [PATCH v3 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v3 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHbz97TPuW5MW56gEKcuq8Jspje1Q==
Date: Wed, 28 May 2025 14:43:07 +0000
Message-ID: <20250528144259.2603914-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453607C60
Content-Type: text/plain; charset="utf-8"
Content-ID: <47E64EBDE00C974EAAF9F94B34C0B364@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_074313_797628_30742962 
X-CRM114-Status: GOOD (  11.02  )
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
IHZhcmlhbnRzKS4NCg0KdjM6IChkZXRhaWxlZCBjaGFuZ2Vsb2cgaW4gZWFjaCBwYXRjaCkNCiAt
IEZpeCBkZXZpY2V0cmVlIENJIGRldGVjdGVkIGVycm9ycyAoUm9iIEhlcnJpbmcncyBib3QpDQog
LSBEZWNsYXJlIHRoZSBjb21wYXRpYmxlcyBjb3JyZWN0bHkgaW4gYmluZGluZ3MgKEtyenlzenRv
ZiBLb3psb3dza2kpDQoNCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8v
MjAyNTA1MjcwNzE1NTIuMTQyNDk5Ny0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBDbGFy
aWZ5IGluIHRoZSBjb21taXQgbWVzc2FnZSBob3cgdGhlIGNyYXNoIGZpeCB3b3JrcyAoRnJhbmsg
TGkpDQogLSBSZXN0cmljdCBwb3dlci1kb21haW5zIG9ubHkgZm9yIGlNWDhRKiBTb0NzIGluIGJp
bmRpbmdzIChGcmFuayBMaSkNCiAtIENvbGxlY3QgdGFncw0KDQp2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtY3J5cHRvLzIwMjUwNTIzMTMxODE0LjEwNDc2NjItMS1qb2huLmVybmJl
cmdAYWN0aWEuc2UvVA0KDQpIb3JpYSBHZWFudMSDICgxKToNCiAgYXJtNjQ6IGR0czogZnJlZXNj
YWxlOiBpbXg4cXhwL2lteDhxbTogQWRkIENBQU0gc3VwcG9ydA0KDQpKb2huIEVybmJlcmcgKDMp
Og0KICBjcnlwdG86IGNhYW0gLSBQcmV2ZW50IGNyYXNoIG9uIHN1c3BlbmQgd2l0aCBpTVg4UU0g
LyBpTVg4VUxQDQogIGNyeXB0bzogY2FhbSAtIFN1cHBvcnQgaU1YOFFYUCBhbmQgdmFyaWFudHMg
dGhlcmVvZg0KICBkdC1iaW5kaW5nczogY3J5cHRvOiBmc2wsc2VjLXY0LjA6IEFkZCBwb3dlciBk
b21haW5zIGZvciBpTVg4UU0gYW5kDQogICAgaU1YOFFYUA0KDQogLi4uL2JpbmRpbmdzL2NyeXB0
by9mc2wsc2VjLXY0LjAueWFtbCAgICAgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrLQ0KIC4u
Li9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpICB8IDM4ICsrKysrKysr
KysrKysrKysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaSAgICAg
fCAgMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwg
IDEgKw0KIGRyaXZlcnMvY3J5cHRvL2NhYW0vY3RybC5jICAgICAgICAgICAgICAgICAgICB8ICA3
ICstLQ0KIGRyaXZlcnMvY3J5cHRvL2NhYW0vaW50ZXJuLmggICAgICAgICAgICAgICAgICB8ICAx
ICsNCiA2IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mt
c2VjdXJpdHkuZHRzaQ0KDQotLSANCjIuNDkuMA0K

