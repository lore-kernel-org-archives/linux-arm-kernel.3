Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C52C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oWbheLtmxAxFo30a5sy0XXCegWFyhqhELgo3ZhyLng=; b=vQK/LgQXvtcZUxZWhs96CZ6+kC
	bnsMt8UqIrhnS/C/yBLbgy8LvvY04yFxmp3cWGDV6Uge7SY9c+zGETozbQoJYRD9wONMNfS8TTmDy
	Tirq/NNV5YZsikflryci4r44FR7IwA7xmcM23u1aYiefX6PYHfZPCrw6vZSu+VH//rE7cuI9Y2OTp
	DI99SAHoYdjUTST9lZIhebkmVJNoUfBlY7xsN090gwzqGWjlEGgDpGkj14zeFN3VsKhHzs1CiC1lh
	95fYoGDs4b1ReJ1X4dJHxCJoxQqExxrgp5sKgDlrvfb6g5P9kc6ZiX4YSpyD7aJtB4nlAnipG5Qlr
	Iw0xdQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISQH-00000003x3E-01fR;
	Fri, 23 May 2025 13:26:53 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISIJ-00000003vdr-3Uge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:18:41 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:18:32 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Fri, 23 May 2025 15:18:32 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Thomas Richard <thomas.richard@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Index: AQHby+UudBZY+LpW90mK/tjBsTdMwg==
Date: Fri, 23 May 2025 13:18:31 +0000
Message-ID: <20250523131814.1047662-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453607162
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF573AF18ED1AA43B5D721DEF54B24E9@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_061839_868896_2456B5C5 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
IHZhcmlhbnRzKS4NCg0KSG9yaWEgR2VhbnTEgyAoMSk6DQogIGFybTY0OiBkdHM6IGZyZWVzY2Fs
ZTogaW14OHF4cC9pbXg4cW06IEFkZCBDQUFNIHN1cHBvcnQNCg0KSm9obiBFcm5iZXJnICgzKToN
CiAgY3J5cHRvOiBjYWFtIC0gUHJldmVudCBjcmFzaCBvbiBzdXNwZW5kIHdpdGggaU1YOFFNIC8g
aU1YOFVMUA0KICBjcnlwdG86IGNhYW0gLSBTdXBwb3J0IGlNWDhRWFAgYW5kIHZhcmlhbnRzIHRo
ZXJlb2YNCiAgZHQtYmluZGluZ3M6IGNyeXB0bzogZnNsLHNlYy12NC4wOiBBbGxvdyBzdXBwbHlp
bmcgcG93ZXItZG9tYWlucw0KDQogLi4uL2JpbmRpbmdzL2NyeXB0by9mc2wsc2VjLXY0LjAueWFt
bCAgICAgICAgIHwgIDYgKysrDQogLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLXNlY3Vy
aXR5LmR0c2kgIHwgMzggKysrKysrKysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhxbS5kdHNpICAgICB8ICAxICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4cXhwLmR0c2kgICAgfCAgMSArDQogZHJpdmVycy9jcnlwdG8vY2FhbS9jdHJs
LmMgICAgICAgICAgICAgICAgICAgIHwgIDcgKystLQ0KIGRyaXZlcnMvY3J5cHRvL2NhYW0vaW50
ZXJuLmggICAgICAgICAgICAgICAgICB8ICAxICsNCiA2IGZpbGVzIGNoYW5nZWQsIDUxIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaQ0KDQotLSANCjIuNDkuMA0K

