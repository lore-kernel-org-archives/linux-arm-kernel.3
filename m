Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A536ECCA462
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROQGttvnrz53Og6SHqMoqConxaD+Kdjmwoj2PX0LzIg=; b=RLb0rckU64Dx2pQwOH0PV0LOp6
	KAIo+LR5mF0O6O5IIdv4u0CuXPltTVSqiKbtVzNLb+UgrBqHWsIkGWgf8Bu6GdcZxgCNhl+FWAO5D
	L2CkuFd2WQhWJGc58HQw/TztilbjueNygsxOYONQA6uKr//h6SupM+knj/7w673MXpNqhWF1DKRSs
	lCy+vRfOCUMhikyuATJTSwLvnvGUoQcnM/SSJ3xuPWrlXlv4V92dRoI0LHlACPucgyrk1XXeY3Pd2
	B07N1wI8rwY+SPP7/hOi3YW6nP1VVheUwwzOFM4tJy572JA1Ekc265/wIazOcAdhOCpStZyD9WDKT
	iA1AB0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzw0-00000004aIx-3F0E;
	Sat, 17 Oct 2026 08:38:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzvx-00000004aIk-16n1;
	Sat, 17 Oct 2026 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ROQGttvnrz53Og6SHqMoqConxaD+Kdjmwoj2PX0LzIg=; b=acC4YlILNM4gia6vKR7xylmd1m
	o4ScGuVKqlTMCd/NBnQFBw9Q1CxouFod3DWjsPZWzNAGzuBpvVQRmJzvrgMhLMkDwPKFDayO5voG0
	u/DfU8RYb1e9iBFUVFOLuRhs5vIzH221sGTFzTpv6WCLd7XprU7tmPRN6IQdeaewqufmnl/qYOZow
	roy0YqvKcdBTvluqySKxsAD4lVjZ4NMuo5OhfRbi9aaxR95lidT0yBBBTKaLbYf1z/4RXCHpaeYjO
	qmIB4FcymGTQX9EMax75pdPQoc0PQEnQjDzOl9Tjlvt7+olcX3NYI83EBdDNdPVcbtmTKYWIc8pzN
	0CnmEDgg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHzvr-00000002Exo-19Bj;
	Sat, 17 Oct 2026 08:38:27 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H8bH341001360, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792226237; bh=ROQGttvnrz53Og6SHqMoqConxaD+Kdjmwoj2PX0LzIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=s9ne5iO3Al0Vt6YDsBMlSVrXzDtQSbAG+tx/c+klMIjT+TM42luEHv0TXE7sUjTdN
	 z+s+dQDbs0i6HvkK1lXLjLuxhK593jfcURxFvC8Y/oigoiV+V+uATtvcHFkWWfudzm
	 zpS6/Dq2hfFuH/aCSQkMEAz8PzXlt0JNchgNf+vkycNQ8JqDrezfQBW8JH65HQTMjP
	 eip+/btMKrUcgZUA31PIgeD6MJg0Yc3tKVFsWFEAigcMYYU+JkbLI5aYDG5PoVbv6g
	 Xo3JiXztayB4pNZmgCbgjyCiNqxggq3IgU5OmDWm91UGA+BqV8NWJrSggbZKbDjhqH
	 X4kHE/Ebgge2A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H8bH341001360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 16:37:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 16:37:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 16:37:14 +0800
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
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
Thread-Topic: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
Thread-Index: AQHdUkHB5XaBTXVELkuRjLnOEVjsZrb1DaSAgAxy+WA=
Date: Sat, 17 Oct 2026 08:37:14 +0000
Message-ID: <4c78868d5f734fc198b4d0b38a04098d@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <179157057523.266328.2566485767894163325.b4-review@b4>
In-Reply-To: <179157057523.266328.2566485767894163325.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093824_626099_12A820B3 
X-CRM114-Status: GOOD (  15.83  )
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

SGkgSmVyb21lLA0KDQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IHRoZSBjbG9jayBhbmQgcmVzZXQgY29udHJvbGxlciBzdXBwb3J0IGZvcg0KPiA+IFJlYWx0ZWsn
cw0KPiA+IFJURDE2MjUgU29DIHBsYXRmb3JtLg0KPiA+DQo+ID4gQmVjYXVzZSB0aGUgcmVzZXQg
Y29udHJvbGxlcnMgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXIgc3BhY2Ugd2l0aCB0aGUNCj4gPiBj
bG9jayBjb250cm9sbGVycyBvbiB0aGlzIHBsYXRmb3JtLCB3ZSB1dGlsaXplIHRoZSBBdXhpbGlh
cnkgQnVzDQo+ID4gZnJhbWV3b3JrIHRvIGRlY291cGxlIHRoZW0uIFRoZSBjbG9jayBjb250cm9s
bGVycyBhY3QgYXMgdGhlIHByaW1hcnkNCj4gPiBkZXZpY2VzLCByZWdpc3RlcmluZyB0aGUgcmVz
ZXQgY29udHJvbGxlcnMgYXMgYXV4aWxpYXJ5IGRldmljZXMuDQo+IA0KPiBDb25zaWRlcmluZyB0
aG9zZSBhcmUgcHJvcGVybHkgZGVjb3VwbGVkLCB0aGVyZSBpcyBubyByZWFzb24gdG8gc2VuZCB0
aGVtDQo+IHRvZ2V0aGVyIGFueW1vcmUuIFlvdSBjb3VsZCBzZW5kIHRoZSByZXNldCBwYXJ0IHRv
IHJlc2V0LCBhbmQganVzdCBjbG9jayBwYXJ0IHRvDQo+IGNsb2NrLg0KPiANCj4gU2VuZGluZyBh
IHNlcmllcyB0aGF0IGFkZHJlc3MgYSBzaW5nbGUgdHJlZSBoZWxwcyBiZWNhdXNlIHRoZW4gd2Ug
Y2FuIG1lcmdlIGl0DQo+IHVzaW5nIHlvdXIgY292ZXItbGV0dGVyIGFzIG1lcmdlIGNvbW1pdCwg
aW5zdGVhZCBvZiBjaGVycnktcGlja2luZy4NCj4gDQoNCkkgd2lsbCBzcGxpdCB0aGlzIGludG8g
dHdvIHNlcGFyYXRlIHBhdGNoIHNlcmllczoNCg0KMS4gZHQtYmluZGluZ3MsIGR0cywgY2xrLXJl
bGF0ZWQgcGF0Y2hlcyAodGFyZ2V0aW5nIHRoZSBjbGsgdHJlZSkuDQoyLiBUaGUgcmVtYWluaW5n
IHJlc2V0LXJlbGF0ZWQgcGF0Y2hlcyAodGFyZ2V0aW5nIHRoZSByZXNldCB0cmVlKS4NCg0KQmVz
dCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IC0tDQo+IEplcm9tZQ0K

