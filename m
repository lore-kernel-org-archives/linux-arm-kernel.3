Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3316CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfgRchHlRQeAdTd0SX5cVUflKKL7Nljihx/jYn85Ba8=; b=MzS9mWccdwei+MzfcXvlu/IpzW
	lwOFUiGo4azCpKpJe+pBNIzYpPjgItrSsTPuvlELl91GZqIndIMQjm92gTrvn2tkxxQVyaUroPbxZ
	eMS0Nj6PV531zE5mMgROBiUdG6pIxYkzod518/mrYir4Pl8emvw5F/y5KnZbdwFU9WKEN1lCHfkLi
	8WXIjpXQbXH3tIG7I/FCJuBuopPwSfXLADAfh+TmlW4PGShbX+7WhZhm8MR2o7QJLT6nl6e4rZf39
	a7d6lnBX/MOjl7Yw3v1mjIqU6B7PzzNFExXCQCtSvziRO6vCmd8RLSgDMGohFqhiVmjOVyS6MJjoC
	v9mEkykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0RP-00000004bmA-0T2B;
	Sat, 17 Oct 2026 09:10:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0RN-00000004bm0-1u84;
	Sat, 17 Oct 2026 09:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LfgRchHlRQeAdTd0SX5cVUflKKL7Nljihx/jYn85Ba8=; b=rA63Ru8hfiuQaQcO0yIzaEKSZB
	kuHYgfUjy+x4hPlQkrYz5dDUdJ9pI351ejhblAbdsJ24J63/5ZKJOqsJMQXhKfG0xoJxW8qx/BRPV
	kW8oxUrIp4tNIRdURhETObXbQ40kgD57y0NOxpQNtnK/yptt/flj3Rr3VTwm+9dWYWyx2xxHx67hk
	aVuOQp66B76fZBjsfc6aj5i2zho4rsTZkQpiVgcbWPsbrHw7kX5oYXG7RFL8WcX1jKtsAbaZPcoHJ
	wwJg2evd/bBHl2zLcsC2ghjie35s1dIZGMfVkbPpJYf2F78fr64SlYgncq1LQLAL3ssaJ83w+f+LP
	54V+igoA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI0RJ-00000002G7o-2xsQ;
	Sat, 17 Oct 2026 09:10:56 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H9ATNO0011149, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792228229; bh=LfgRchHlRQeAdTd0SX5cVUflKKL7Nljihx/jYn85Ba8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Abh4zKiO0k2YtyNyKkh/W+vf4vxV7if925DmsYTgx+JPgYvFkjOQJf32DOAqvGZ4k
	 +NysjTt/vR13Cb0JKWQ4Re5vMB/5HDCL+BHSpZSA6SENGemUX9fhQ1crqQOplFNBpO
	 D0maATMITR7tfm2p2vDQ7O0s/iYM6pWy+i7yC7gWqMCuZ9MuWtsDE6nSSdAmfElMWv
	 qJZhXeNfygj4eJixTx+R5MMLqjb8he7nTxweSiZRlaIIr2i+82chVq4yOvnvT5BCvC
	 6LSVWPdkmuelvHOGZLqVX5WjbxCzTSgABqgOPwtBlO2t7aVwBuuEhv2vW4YLcDe1ft
	 DU/tsBN6rlX8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H9ATNO0011149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:10:29 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Thread-Topic: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Thread-Index: AQHdUkG6u/r2V0yIkUqBUlG0HylGb7b1DaWAgAx8c1A=
Date: Sat, 17 Oct 2026 09:10:29 +0000
Message-ID: <cda5b6f190ab4ad6adcff57e4811fcf7@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-11-eleanor.lin@realtek.com>
 <179157057525.266328.2342228871690409432.b4-review@b4>
In-Reply-To: <179157057525.266328.2342228871690409432.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_101054_736726_D5622FA5 
X-CRM114-Status: UNSURE (   9.56  )
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl91c2Jf
cDQsICJjbGtfc3lzIiwgMCwgMHg4YywgMCwgMCk7DQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01B
UF9HQVRFKGNsa19lbl91c2JfcDMsICJjbGtfc3lzIiwgMCwgMHg4YywgMSwgMCk7DQo+ID4gK3N0
YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9taXNjX2NlYzAsICJjbGtfZW5fbWlzYyIs
IDAsIDB4OGMsDQo+ID4gKzIsIDApOyBzdGF0aWMgUlRLX0NMS19SRUdNQVBfR0FURShjbGtfZW5f
Y2J1c3J4X3N5cywgImNsa19zeXMiLCAwLA0KPiA+ICsweDhjLCAzLCAwKTsgc3RhdGljIFJUS19D
TEtfUkVHTUFQX0dBVEUoY2xrX2VuX2NidXN0eF9zeXMsICJjbGtfc3lzIiwNCj4gPiArMCwgMHg4
YywgNCwgMCk7IHN0YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9jYnVzX3N5cywNCj4g
PiArImNsa19zeXMiLCAwLCAweDhjLCA1LCAwKTsgc3RhdGljDQo+ID4gK1JUS19DTEtfUkVHTUFQ
X0dBVEUoY2xrX2VuX2NidXNfb3NjLCAib3NjMjdtIiwgMCwgMHg4YywgNiwgMCk7DQo+IA0KPiBZ
b3UgYXJlIHJlcXVlc3RpbmcgeW91ciBpbnB1dCBieSBnbG9iYWwgaGVyZS4gVGhpcyBpcyB3cm9u
Zy4NCj4gRFQgbmFtZXMgYXJlIHN0YWJsZSwgaW50ZXJuYWwgQ0NGIGFyZSBub3QuIFlvdSBzaG91
bGQgbm90IHJlbHkgb24gdGhpcy4NCj4gDQo+IEVpdGhlciBnaXZlIGl0IGEgbmFtZSBpbiB5b3Vy
IGJpbmRpbmdzIGFuZCB1c2UgZndfbmFtZSBvciB1c2UgaW5kZXgNCj4gDQo+IFNhbWUgYXBwbGll
cyB0byB0aGUgb3RoZXIgY29udHJvbGxlcg0KPiANCg0KQWdyZWVkLg0KDQpXZSB3aWxsIGFkZCBh
ICdjbG9jay1uYW1lcycgcHJvcGVydHkgaW4gdGhlIGR0LWJpbmRpbmdzIGZvciBleHRlcm5hbCBp
bnB1dCBjbG9ja3MuDQoNCkFuZCB3aWxsIHVzZSAnUlRLX0NMS19SRUdNQVBfR0FURV9GV19OQU1F
KCknLCB3aGljaCB1c2VzDQonQ0xLX0hXX0lOSVRfRldfTkFNRSgpJyB0byBzZXQgJy5md19uYW1l
JyBmb3IgdGhlc2UgZXh0ZXJuYWwgaW5wdXQgY2xvY2tzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQoNCj4gLS0NCj4gSmVyb21lDQo=

