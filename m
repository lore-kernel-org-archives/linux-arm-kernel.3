Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADF7C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1andkWVSBI72uYY9GTzzp+Z35hpcWoDV3yz7imaRHA=; b=Qids/xQtAtXepY2/OZCMv1HcLk
	m4yPx54foeFQu5ypcK1ntfRxjHc60W+bYy/axft2vydP/R+W7umFEfk3VV7XlKFsnwsu12JIteFTj
	PyiWJy8Mf/Q+s66mEuvSat6d6deG4c3INPUB9ll8ly45TvzUXR3aZxr/q52qyBX5yChwj/9REhu8G
	pLxnMFHHnpU5rv62PD6VDmSD96cDsnJmqMIxzDN6+z5R2DfLzlvh4ZTSECGZI2iAc/PIngrb99ASi
	XNsRTCOAKSyijPDZ5wx3vjOEgSr9G8wK+ZkUugH8ly+6tzr1Tpz+6gN+gavJdttue4cLmaUSOvx32
	3r9lGMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAmt-0000000Fff0-1PJu;
	Thu, 05 Jun 2025 13:37:43 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAde-0000000FdbG-0PvN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:28:11 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 15:28:01 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 5 Jun 2025 15:28:01 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v4 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v4 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHb1h2pouM9yuOYnE+5OxMC9E/dlw==
Date: Thu, 5 Jun 2025 13:28:01 +0000
Message-ID: <20250605132754.1771368-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445363726A
Content-Type: text/plain; charset="utf-8"
Content-ID: <B519CDE65672574BA3CA98973B5E72A9@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_062810_136442_4C8BBB10 
X-CRM114-Status: GOOD (  11.81  )
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
IHZhcmlhbnRzKS4NCg0KdjQ6IChkZXRhaWxlZCBjaGFuZ2Vsb2cgaW4gZWFjaCBwYXRjaCkNCiAt
IERlY2xhcmUgbW9yZSBjb21wYXRpYmxlcyBpbiBiaW5kaW5ncyAoRnJhbmsgTGkpDQogLSBNb3Zl
IGpvYi1yaW5nIGNvbXBhdCBjaGVjayB1bmRlciB0aGUgam9iLXJpbmcgc3Vic2NoZW1hIChSb2Ig
SGVycmluZykNCg0KdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8yMDI1
MDUyODE0NDI1OS4yNjAzOTE0LTEtam9obi5lcm5iZXJnQGFjdGlhLnNlL1QNCiAtIEZpeCBkZXZp
Y2V0cmVlIENJIGRldGVjdGVkIGVycm9ycyAoUm9iIEhlcnJpbmcncyBib3QpDQogLSBEZWNsYXJl
IHRoZSBjb21wYXRpYmxlcyBjb3JyZWN0bHkgaW4gYmluZGluZ3MgKEtyenlzenRvZiBLb3psb3dz
a2kpDQoNCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA1Mjcw
NzE1NTIuMTQyNDk5Ny0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBDbGFyaWZ5IGluIHRo
ZSBjb21taXQgbWVzc2FnZSBob3cgdGhlIGNyYXNoIGZpeCB3b3JrcyAoRnJhbmsgTGkpDQogLSBS
ZXN0cmljdCBwb3dlci1kb21haW5zIG9ubHkgZm9yIGlNWDhRKiBTb0NzIGluIGJpbmRpbmdzIChG
cmFuayBMaSkNCiAtIENvbGxlY3QgdGFncw0KDQp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3J5cHRvLzIwMjUwNTIzMTMxODE0LjEwNDc2NjItMS1qb2huLmVybmJlcmdAYWN0aWEu
c2UvVA0KDQpIb3JpYSBHZWFudMSDICgxKToNCiAgYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBpbXg4
cXhwL2lteDhxbTogQWRkIENBQU0gc3VwcG9ydA0KDQpKb2huIEVybmJlcmcgKDMpOg0KICBjcnlw
dG86IGNhYW0gLSBQcmV2ZW50IGNyYXNoIG9uIHN1c3BlbmQgd2l0aCBpTVg4UU0gLyBpTVg4VUxQ
DQogIGNyeXB0bzogY2FhbSAtIFN1cHBvcnQgaU1YOFFYUCBhbmQgdmFyaWFudHMgdGhlcmVvZg0K
ICBkdC1iaW5kaW5nczogY3J5cHRvOiBmc2wsc2VjLXY0LjA6IEFkZCBwb3dlciBkb21haW5zIGZv
ciBpTVg4UU0gYW5kDQogICAgaU1YOFFYUA0KDQogLi4uL2JpbmRpbmdzL2NyeXB0by9mc2wsc2Vj
LXY0LjAueWFtbCAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrLQ0KIC4uLi9ib290L2R0
cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpICB8IDM4ICsrKysrKysrKysrKysrKysr
DQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kgICAgIHwgIDEgKw0K
IC4uLi9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3Mtc2VjdXJpdHkuZHRzaSAgICB8IDE2ICsrKysr
KysrDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDIg
Kw0KIGRyaXZlcnMvY3J5cHRvL2NhYW0vY3RybC5jICAgICAgICAgICAgICAgICAgICB8ICA3ICsr
LS0NCiBkcml2ZXJzL2NyeXB0by9jYWFtL2ludGVybi5oICAgICAgICAgICAgICAgICAgfCAgMSAr
DQogNyBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1z
ZWN1cml0eS5kdHNpDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxeHAtc3Mtc2VjdXJpdHkuZHRzaQ0KDQotLSANCjIuNDkuMA0K

