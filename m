Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C97C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKketelVx+eNuE6jGxke2Jwkoy7/zEgJnLQ30rzBBqo=; b=1hlTzrGqgfh9VwY1ZQf3kHxnZv
	20tNplSQwWvDxAWkR0n5ocI7+jiW3cDvUxxZmuLeMypi7iB6Y3HAqGwtu/nDegtFaCmGLmJgkbYLz
	V38n5ddJSeMbQKEySdjI81uIRUJrwZ+y3xBK30mHpl0PGbPv8Via8N55vj+fjpRfdHnJZD8i9WGNu
	yiqc2EbDBHPkM5coz7bZy0Wtncy7LNY2oiOH2wg2EgKABtl7ahvvhpJUHGJxDfkC2OpWRVpwcMONb
	1WXBLqffp/O2QiKTlkbcvYCshgnJgtLMAt1peMKjnlyGvdiobvWbjxQQhPo4lrkvmPbtxIXu3/wp/
	x2S37ZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Flc-00000007Bvm-0GLF;
	Wed, 23 Sep 2026 05:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Flb-00000007BvF-1fcp;
	Wed, 23 Sep 2026 05:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YKketelVx+eNuE6jGxke2Jwkoy7/zEgJnLQ30rzBBqo=; b=bWV2Bvcko9L02hdUgerwUH9wB4
	tGr2hSRHPhcmiUDO54gt3H/61krZAPHoGgdxb3uN/+QgW7qLB0Nsjj3nBNLQLFuRGYGmoDLBeJo1O
	IJR1PZHqJaBFc6WhGnEvgqiF83vCVkO5U7ieKLjXAcxXWfx6bfxR+rnci984XcqwvW8w9JmnTL5vj
	Gi55+KZKjLE+qh5Iq4D4rAzD93Nw5bscB3bSa/KRmZJ0oqUiAhJ/UfVugT/x5M4BeQu9UJXWaGpHx
	rC8nnkpz4Y8kEKxxdMiiAelS7lQilTSmNCgf61m1apMHmJg+9NyrmLD6HJl1QOUXQcMq3j9qbOk5F
	jmf/UaGw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9FlO-0000000EOIj-0apC;
	Wed, 23 Sep 2026 05:43:38 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5hIltD096178, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142198; bh=YKketelVx+eNuE6jGxke2Jwkoy7/zEgJnLQ30rzBBqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=uo6EEZ4NuL78mWKXT+ZsJ34oSvNMFHTTSn/XgSs2PlP9zyPwHa33K/vhGVLBb4EQX
	 jWPmE9DzTFwxWa6L2ldMZawfNscL+jv0uD863lpZPF9qKVYyDD8xWr4kbN4o/nraS1
	 oBnJg7I//ejKS51Rt7dLuyS2tys5lg6cNmrPDjSJ8/7sEOJX9SYvE0MFB7ExXzt8ux
	 IKsG19sD3pPkHc00srLa8rcOJ7tjJY40GKzuTTJ2XmFzM6h4IWzdNEvodZ7d2IH2qH
	 BfbMB5bgKBYlZbjXb9RmE/rF3AW535OcICu4y2l/tfAN0BXclP8aH3No/WUdjOnREM
	 fQs4u/NeRsUvw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5hIltD096178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:43:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:43:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:43:17 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
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
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdOeMAtkU9yq5qUkW8LZXsVLtozbbPKxAAgAyd7PA=
Date: Wed, 23 Sep 2026 05:43:17 +0000
Message-ID: <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
In-Reply-To: <178947735404.448573.10061486937030065064.b4-reply@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064336_233829_2E03C4D7 
X-CRM114-Status: GOOD (  10.10  )
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

SGkgSmVyb21lLA0KDQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGNsa19n
cHVfcGFyZW50c1tdID0geyJwbGxfZ3B1IiwgImNsa19zeXMifTsNCj4gPiArc3RhdGljIFJUS19D
TEtfUkVHTUFQX01VWChjbGtfZ3B1LCBjbGtfZ3B1X3BhcmVudHMsDQo+IENMS19TRVRfUkFURV9Q
QVJFTlQgfCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgMHgyOCwgMTIsIDB4MSk7IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QNCj4gPiArY2xr
X3ZlX3BhcmVudHNbXSA9IHsicGxsX3ZvIiwgImNsa19zeXNoIiwgInBsbF92ZTEiLCAicGxsX3Zl
MiJ9Ow0KPiA+ICtzdGF0aWMgUlRLX0NMS19SRUdNQVBfTVVYKGNsa192ZTEsIGNsa192ZV9wYXJl
bnRzLA0KPiBDTEtfU0VUX1JBVEVfUEFSRU5UIHwgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4NGMsIDAsIDB4Myk7IHN0YXRpYw0KPiA+ICtS
VEtfQ0xLX1JFR01BUF9NVVgoY2xrX3ZlMiwgY2xrX3ZlX3BhcmVudHMsIENMS19TRVRfUkFURV9Q
QVJFTlQgfA0KPiBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgMHg0YywgMywgMHgzKTsgc3RhdGljDQo+ID4gK1JUS19DTEtfUkVHTUFQX01VWChj
bGtfdmU0LCBjbGtfdmVfcGFyZW50cywgQ0xLX1NFVF9SQVRFX1BBUkVOVCB8DQo+IENMS19TRVRf
UkFURV9OT19SRVBBUkVOVCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAweDRjLCA2LCAw
eDMpOyBzdGF0aWMNCj4gPiArUlRLX0NMS19SRUdNQVBfR0FURV9OT19QQVJFTlQoY2xrX2VuX21p
c2MsIENMS19JU19DUklUSUNBTCwgMHg1MCwNCj4gMCwNCj4gPiArMSk7IGNsa19lbl9wY2llMCwg
MCwgMHg1MCwgMiwNCj4gPiArMSk7IGNsa19lbl9nc3BpLCAwLCAweDUwLCA2LCAxKTsNCj4gPiAr
Y2xrX2VuX2lzb19taXNjLCAwLCAweDUwLCAxMCwNCj4gPiArMSk7IGNsa19lbl9zZHMsIDAsIDB4
NTAsIDEyLCAxKTsNCj4gPiArY2xrX2VuX2hkbWksIDAsIDB4NTAsIDE0LCAxKTsNCj4gDQo+IFRo
aXMgaXMgYSBsb3Qgb2YgY2xvY2sgd2l0aCBubyBwYXJlbnRzIHdoaWNoIGlzIGEgYml0IHN1c3Bp
Y2lvdXMgZXNwZWNpYWxseSBmb3INCj4gZ2F0ZXMuDQo+IFdoYXQgaXMgcmVhbGx5IGZlZWRpbmcg
dGhvc2UgPw0KPiANCg0KSW4gdjE1LCB3ZSB3aWxsIGRvIG91ciBiZXN0IHRvIHJlZHVjZSB0aGUg
bnVtYmVyIG9mIGdhdGUgY2xvY2tzIHdpdGhvdXQgYSBwYXJlbnQuDQoNCkhvd2V2ZXIsIGFmdGVy
IGRpc2N1c3Npbmcgd2l0aCBvdXIgY29sbGVhZ3VlLCB3ZSBjb25maXJtZWQgdGhhdCBmb3Igc29t
ZSBvZg0KdGhlc2UgTk9fUEFSRU5UIGdhdGUgY2xvY2tzLCB0aGVpciBhY3R1YWwgdXBzdHJlYW0g
Y2xvY2tzIChsaWtlIFBMTHMgYW5kDQpNdXhlcykgYXJlIGxvY2F0ZWQgaW4gc2VwYXJhdGUsIGlu
ZGVwZW5kZW50IGhhcmR3YXJlIHN1YnN5c3RlbXMuIFRoZSByZWdpc3RlcnMNCmNvbnRyb2xsaW5n
IHRob3NlIHVwc3RyZWFtIGNsb2NrcyBhcmUgcGh5c2ljYWxseSBpbmFjY2Vzc2libGUgZnJvbSB0
aGUgTGludXgNCkNQVSBkb21haW4uDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

