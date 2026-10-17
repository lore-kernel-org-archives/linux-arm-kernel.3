Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B08CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb7Ig0qo/zGxknvWhWUA4DQPAYbJBTbHJPRgb52Kevw=; b=QrKHNCPp8yl6lUoi6Z+HmpwUdP
	OhXReIA4cJ5CfQmw/ejgACPFE5IfW3c6N3noUdo7Znp5J0v5kQd1csp2zJpvHttNz0L7EC7And0bA
	H9x9Ko08+xpCv1WFu2u1mpZD2s/KDh7OZqkitruNFaol3Ro4rQ/xuYpyLH/UoDdzawf5dUdWCsrrG
	tO7rCN+p9IXgDkNZLkKy0aZ+FonYQEFnJ01FJ4rBFOLy2HFVw1crFpbul48cAFnarGCi31voilHd4
	wcCTx0ai+RTH7HlpwU8Xqcopsv2EUSLKtxz12zmCf7kLPP2ibvLoKBIXNWF0z/chosNisAxD2tLts
	leHqdQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI053-00000004arT-3OVp;
	Sat, 17 Oct 2026 08:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI052-00000004arK-3E3N;
	Sat, 17 Oct 2026 08:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eb7Ig0qo/zGxknvWhWUA4DQPAYbJBTbHJPRgb52Kevw=; b=qpWoGC6Nq3trTQn7/hAOTySPIN
	RwjM5WMwEO7CQdhpibkt09s/OfE08RczNaXLsnu2GwElWd3NCZD/bokRDdIrSjNoTIoGhwWm3xjiu
	gkhzxybUgLKREBV6YQtssS146UgQWdY56sei01Zq4Yc56+hfoAgsvy15Ol1My4DG87VO1B8n8Y8Al
	bC8UqIIOzJVgi+0o+P9titiE4D55B3N5b4zJrpBJBTNFC9jO+l2I8psoBLVoskCMoMRO7hgg7wVtE
	08k4dWYz5CyXj9H7hEZIByWnyYbF5HnGnOn5wc1pqHq4HNkYlbqEkYWeuD1C0+4X87lcbXYS77t2b
	8+mrQjaQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI02s-00000002FFC-0R3E;
	Sat, 17 Oct 2026 08:47:51 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H8jDTm9003939, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792226713; bh=eb7Ig0qo/zGxknvWhWUA4DQPAYbJBTbHJPRgb52Kevw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=qiUS7PAR+2F/biGcL4FNnMd14aCKJj6fUJV3Gf00QLs3Na2iR5DrQQJyX5NUdmTqE
	 AgKd1GhFg55exsLyXipsam40LruZ1s+k5UYM78VWXxq/0ImwZB4uEY2q5TA7+CwXnP
	 A8B5b5defYlkWtvbpLRvcwz3Qe3tOQwu1lOffCZrDn23agNK2rGCGjOPhVoc5onpXL
	 GhdaQk/n3IwwQLYVP/foomKvzYJU2lAGjqm79ncVLKxKqsuvQFfBwc+DrA7wxUHvaX
	 q23zYM8o+iKrwVqbsO1HloIX9n//2s+gbB/iAAI5TucGy0RDsaNY1OC50+Wkxf3l6i
	 KpWWs240Dz1gw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H8jDTm9003939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 16:45:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 16:45:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 16:45:13 +0800
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
Subject: RE: [PATCH v15 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Thread-Topic: [PATCH v15 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Thread-Index: AQHdUkG5pIovDIXk2kS/vNd36/pXPbb1DaWAgAx0y/A=
Date: Sat, 17 Oct 2026 08:45:12 +0000
Message-ID: <a53104475f414e12a69c3a942ad249b1@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-6-eleanor.lin@realtek.com>
 <179157057524.266328.7662236812996349329.b4-review@b4>
In-Reply-To: <179157057524.266328.7662236812996349329.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094551_073442_83DAD9AD 
X-CRM114-Status: GOOD (  33.78  )
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHJ0a19jbGtfcmVnbWFwX3Bs
bCAqdG9fcnRrX2Nsa19yZWdtYXBfcGxsKHN0cnVjdA0KPiA+ICtjbGtfaHcgKmh3KSB7DQo+ID4g
KyAgICAgc3RydWN0IHJ0a19jbGtfcmVnbWFwICpjbGtyID0gdG9fcnRrX2Nsa19yZWdtYXAoaHcp
Ow0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gY29udGFpbmVyX29mKGNsa3IsIHN0cnVjdCBydGtf
Y2xrX3JlZ21hcF9wbGwsIGNsa3IpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHdhaXRfZnJl
cV9yZWFkeShzdHJ1Y3QgcnRrX2Nsa19yZWdtYXBfcGxsICpjbGtwKSB7DQo+ID4gKyAgICAgdTMy
IHBvbGx2YWw7DQo+ID4gKw0KPiA+ICsgICAgIC8qIHJlZyA9PSAwIG1lYW5zIG5vdCBjb25maWd1
cmVkLg0KPiA+ICsgICAgICAqIFJlZ2lzdGVyIG9mZnNldCAwIGlzIG5ldmVyIGEgdmFsaWQgYWRk
cmVzcyBvbiBSZWFsdGVrIFNvQ3MuDQo+IA0KPiBGaXggdGhlIGNvbW1lbnQgc3R5bGUgcGxlYXNl
DQo+IA0KDQpBY2suDQoNCj4gPiArICAgICAgKi8NCj4gPiArICAgICBpZiAoIWNsa3AtPmZyZXFf
cmVhZHlfcmVnKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBEbyB5b3UgbmVl
ZCB0byBwcm90ZWN0IGFnYWluc3QgeW91ciBvd24gZHJpdmVyIHByb3ZpZGluZyBiYWQgb2Zmc2V0
ID8NCj4gDQoNCldpbGwgY2hhbmdlIHRoZSBjb21tZW50IHRvDQoNCi8qDQogKiBPcHRpb25hbCBy
ZWdpc3RlcjogcmV0dXJuIHN1Y2Nlc3MgaWYgbm90IHByb3ZpZGVkLg0KICovDQoNCj4gPiArDQo+
ID4gKyAgICAgcmV0dXJuIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dF9hdG9taWMoY2xrcC0+Y2xr
ci5yZWdtYXAsDQo+IGNsa3AtPmZyZXFfcmVhZHlfcmVnLCBwb2xsdmFsLA0KPiA+ICsgICAgICAg
ICAgICAgKHBvbGx2YWwgJiBjbGtwLT5mcmVxX3JlYWR5X21hc2spID09DQo+ID4gK2Nsa3AtPmZy
ZXFfcmVhZHlfdmFsLCAxLCBUSU1FT1VUKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgaXNf
cG93ZXJfb24oc3RydWN0IHJ0a19jbGtfcmVnbWFwX3BsbCAqY2xrcCkgew0KPiA+ICsgICAgIHUz
MiB2YWw7DQo+ID4gKw0KPiA+ICsgICAgIC8qIHJlZyA9PSAwIG1lYW5zIG5vdCBjb25maWd1cmVk
IChhc3N1bWUgYWx3YXlzIG9uKS4NCj4gPiArICAgICAgKiBSZWdpc3RlciBvZmZzZXQgMCBpcyBu
ZXZlciBhIHZhbGlkIGFkZHJlc3Mgb24gUmVhbHRlayBTb0NzLg0KPiA+ICsgICAgICAqLw0KPiAN
Cj4gWW91J3ZlIGFscmVhZHkgc2FpZCB0aGlzLiBJdCB3b3VsZCBiZSBtb3JlIGhlbHBmdWwgdG8g
dGVsbCB1cyB0aGF0IFBMTCB0aGF0IGRvZXMNCj4gbm90IHByb3ZpZGVyIGEgcG93ZXIgcmVnIGlz
IGNvbnNpZGVyZWQgdG8gYmUgYWx3YXlzIHBvd2VyZWQsIGlmIHRoYXQgaXMgdGhlIGNhc2UNCj4g
DQoNCldpbGwgY2hhbmdlIHRoZSBjb21tZW50IHRvIA0KDQovKg0KICogSWYgdGhlIFBMTCBkb2Vz
IG5vdCBwcm92aWRlIGEgcG93ZXIgcmVnaXN0ZXIsIGl0IGlzIGNvbnNpZGVyZWQNCiAqIHRvIGJl
IGFsd2F5cyBwb3dlcmVkLg0KICovDQoNCg0KPiA+ICsgICAgIGlmICghY2xrcC0+cG93ZXJfcmVn
KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+ID4gKw0KPiA+ICsgICAgIGlmIChy
ZWdtYXBfcmVhZChjbGtwLT5jbGtyLnJlZ21hcCwgY2xrcC0+cG93ZXJfcmVnLCAmdmFsKSkNCj4g
PiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuICh2
YWwgJiBjbGtwLT5wb3dlcl9tYXNrKSA9PSBjbGtwLT5wb3dlcl92YWxfb247IH0NCj4gPiArDQo+
ID4gK3N0YXRpYyB2b2lkIHJ0a19jbGtfcmVnbWFwX3BsbF9kaXNhYmxlKHN0cnVjdCBjbGtfaHcg
Kmh3KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0a19jbGtfcmVnbWFwX3BsbCAqY2xrcCA9IHRvX3J0
a19jbGtfcmVnbWFwX3BsbChodyk7DQo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4g
PiArDQo+ID4gKyAgICAgaWYgKCFjbGtwLT5zZXFfcG93ZXJfb2ZmKQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuOw0KPiA+ICsNCj4gPiArICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmY2xrcC0+bG9j
aywgZmxhZ3MpOw0KPiANCj4gV2hhdCBkbyB5b3UgcHJvdGVjdCB3aXRoIHRoaXMgPw0KPiByZWdt
YXAgZG9lcyBwcm92aWRlIHNvbWUgbG9ja2luZyBhbHJlYWR5IGFuZCBDQ0YgdG9vLiBEbyB5b3Ug
ZXhwZWN0DQo+IHNvbWV0aGluZyB0byBwb2tlIHRoZSByZWdpc3RlcnMgeW91IGFyZSB3cml0aW5n
ID8NCj4gDQoNClRoaXMgc3BpbmxvY2sgd2FzIGFkZGVkIGJhc2VkIG9uIEJyaWFuJ3MgZmVlZGJh
Y2sgWzFdIHRvIHByZXZlbnQgYSByYWNlDQpjb25kaXRpb24gYmV0d2VlbiAnLnNldF9yYXRlKCkn
IGFuZCAnLmVuYWJsZSgpJy8nLmRpc2FibGUoKScuDQoNClNpbmNlIG91ciAnLnNldF9yYXRlKCkn
IGludm9sdmVzIGEgbXVsdGktc3RlcCByZWdpc3RlciBzZXF1ZW5jZSBhbmQgYQ0KcG9sbGluZyBs
b29wLCBhbiBpbnRlcmxlYXZlZCAnLmVuYWJsZSgpJyBvciAnLmRpc2FibGUoKScgb3BlcmF0aW9u
IGNvdWxkDQpkaXNydXB0IHRoZSBoYXJkd2FyZSBzdGF0ZS4gVGh1cywgd2UgbmVlZCB0aGlzIHNo
YXJlZCBzcGlubG9jayB0byBzZXJpYWxpemUNCnRoZW0uDQoNClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL2FjX1NYMVVKUnFpQkgyaU1AcmVkaGF0LmNvbS8NCg0KDQo+ID4gKw0KPiA+
ICsgICAgIHJlZ21hcF9tdWx0aV9yZWdfd3JpdGUoY2xrcC0+Y2xrci5yZWdtYXAsIGNsa3AtPnNl
cV9wb3dlcl9vZmYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGtwLT5udW1f
c2VxX3Bvd2VyX29mZik7DQo+ID4gKw0KPiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmNsa3AtPmxvY2ssIGZsYWdzKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBydGtfY2xrX3Jl
Z21hcF9wbGxfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsgICAgIHN0cnVj
dCBydGtfY2xrX3JlZ21hcF9wbGwgKmNsa3AgPSB0b19ydGtfY2xrX3JlZ21hcF9wbGwoaHcpOw0K
PiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiAr
DQo+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmNsa3AtPmxvY2ssIGZsYWdzKTsNCj4gPiAr
DQo+ID4gKyAgICAgcmV0ID0gaXNfcG93ZXJfb24oY2xrcCk7DQo+ID4gKw0KPiA+ICsgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmNsa3AtPmxvY2ssIGZsYWdzKTsNCj4gPiArDQo+ID4gKyAg
ICAgcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBydGtfY2xrX3Jl
Z21hcF9wbGxfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0
DQo+ID4gKypyZXEpIHsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX2Nsa19yZWdtYXBfcGxsICpjbGtw
ID0gdG9fcnRrX2Nsa19yZWdtYXBfcGxsKGh3KTsNCj4gPiArICAgICBjb25zdCBzdHJ1Y3QgcnRr
X2ZyZXFfdGFibGUgKmZ0Ymx2ID0gTlVMTDsNCj4gPiArDQo+ID4gKyAgICAgZnRibHYgPSBmdGJs
X2ZpbmRfYnlfcmF0ZShjbGtwLT5mcmVxX3RibCwgcmVxLT5yYXRlKTsNCj4gDQo+IERvZXNuJ3Qg
dGhpcyBjb21wbGV0bHkgZGlzcmVnYXJkIHRoZSBwYXJlbnQgcmF0ZSA/DQo+IA0KDQpZZXMsIHRo
ZSBsb29rdXAgd29ya3Mgb24gdGhlIHByb2dyYW1tZWQgY29kZSwgbm90IG9uIHRoZSBwYXJlbnQg
cmF0ZS4NCkluIG91ciBoYXJkd2FyZSwgdGhlc2UgUExMcyBhcmUgaGFyZHdpcmVkIHRvIGEgc2lu
Z2xlIDI3TUh6IGNyeXN0YWwNCigib3NjMjdtIikgd2l0aG91dCBhbnkgbXV4Lg0KVGhlcmVmb3Jl
LCB0aGUgInBhcmVudCByYXRlIiBpcyBhIGZpeGVkIHByb3BlcnR5IG9mIHRoZSBoYXJkd2FyZSBy
YXRoZXINCnRoYW4gZHluYW1pY2FsbHkgc2VsZWN0YWJsZSBzb3VyY2UsIHdoaWNoIGlzIHdoeSB0
aGUgY29kZSBvcGVyYXRlcyBvbg0KcHJlZGVmaW5lZCB2YWx1ZXMuDQoNCj4gSSB1bmRlcnN0YW5k
IHRoYXQgU29DIHZlbmRvciBtYXkgZXhwZWN0IGEgc2luZ2xlIGZyZXF1ZW5jeSBhcyBpbnB1dCBi
dXQgaXQgaXQgaXMNCj4gcHJldHR5IGZyYWdpbGUgdG8gZG8gc28uDQo+IA0KDQpBZ3JlZWQuIHdp
bGwgYWRkIGFuIGV4cGxpY2l0IGNoZWNrIGFnYWluc3QgdGhlIGV4cGVjdGVkIHBhcmVudCByYXRl
LiBUaGlzDQplbnN1cmVzIHRoYXQgaWYgYSBib2FyZCBkZWNsYXJlcyBhIGRpZmZlcmVudCBvc2Np
bGxhdG9yLCBpdCB3aWxsIGZhaWwgc2FmZWx5DQphbmQgZXhwbGljaXRseSwgcmF0aGVyIHRoYW4g
c2lsZW50bHkgcHJvZ3JhbW1pbmcgdW52YWxpZGF0ZWQgdmFsdWVzLg0KDQo+IEEgUExMIGlzIHVz
dWFsbHkgc29tZSBzb3J0IG9mIChmcmFjdGlvbmFsKSBtdWx0aXBsaWVyLg0KPiBJdCBpcyB3YXkg
YmV0dGVyIHRvIHByb3ZpZGUgdGhlIHRhYmxlIG9mIG11bHRpcGxpZXIgeW91IHN1cHBvcnQsIGFs
b25nIHdpdGggdGhlaXINCj4gc2VxdWVuY2UgYW5kIHByb3Blcmx5IGRvaW5nIHRoZSBjYWxjdWxh
dGlvbiBoZXJlLg0KPiANCj4gPiArDQo+ID4gKyAgICAgaWYgKGZ0Ymx2ICYmIGZ0Ymx2LT5yYXRl
ID49IHJlcS0+bWluX3JhdGUpIHsNCj4gPiArICAgICAgICAgICAgIHJlcS0+cmF0ZSA9IGZ0Ymx2
LT5yYXRlOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICAvKiBmbG9vciByZXN1bHQgaXMgYmVsb3cgbWluX3JhdGU7IGZpbmQgdGhlIHNt
YWxsZXN0IHJhdGUgPj0gbWluX3JhdGUNCj4gKi8NCj4gPiArICAgICBmdGJsdiA9IGZ0YmxfZmlu
ZF9jZWlsX2J5X3JhdGUoY2xrcC0+ZnJlcV90YmwsIHJlcS0+bWluX3JhdGUpOw0KPiA+ICsgICAg
IGlmICghZnRibHYgfHwgZnRibHYtPnJhdGUgPiByZXEtPm1heF9yYXRlKQ0KPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBUaGlzIGlzIG5vdCBob3cgZGV0ZXJtaW5lX3Jh
dGUoKSB3b3Jrcy4gWW91IGp1c3Qgcm91bmQgdG8gdGhlIGNsb3Nlc3QgcmF0ZSB0aGUNCj4gUExM
IHN1cHBvcnRzLiBZb3UgYXJlIGZyZWUgdG8gcm91bmQgYXMgeW91IHdpc2ggKGJlbGxvdyBvciBj
bG9zZXN0KQ0KPiANCj4gSnVzdCB0ZXN0IHRoZSBkaWZmZXJlbnQgbXVsdGlwbGllcnMgeW91IHN1
cHBvcnQgYW5kIHJldHVybiB3aGF0IGlzIGJlc3QgY29tcGFyZWQNCj4gdG8gdGhlIHJlcXVlc3Qu
IFRoZXJlIGlzIG5vIHJlYXNvbiB0byByZXR1cm4gRUlOVkFMIGZvciB0aGlzLg0KPiANCg0KV2ls
bCBkcm9wIHRoZSBjb21wbGV4IGZsb29yLXRoZW4tY2VpbCBzZWFyY2ggYW5kIGRvIGEgcGxhaW4g
Y2xvc2VzdCBtYXRjaA0Kd2l0aGluIHRoZSAnW21pbl9yYXRlLCBtYXhfcmF0ZV0nIGJvdW5kYXJp
ZXMuDQoNClJlZ2FyZGluZyB0aGUgbXVsdGlwbGllciB0YWJsZToNCldlIHByZWZlciB0byBrZWVw
IHRoaXMgYXMgYSBwcmVkZWZpbmVkIGxpc3QgcmF0aGVyIHRoYW4gZGVyaXZpbmcgYSBuZXcgcG9p
bnQNCmZyb20gYW4gYXJiaXRyYXJ5IHJhdGUuIFRoaXMgaXMgYmVjYXVzZSB0aGVzZSByb3dzIGlu
ICdmcmVxX3RibFtdJyBhcmUgdGhlDQpleGFjdCBvcGVyYXRpbmcgcG9pbnRzIHdoZXJlIHRoZSBz
dXJyb3VuZGluZyBzZXF1ZW5jZXMgKHBvd2VyLCBTU0MsIHJlYWR5DQpmbG93KSB3ZXJlIHZhbGlk
YXRlZC4NCg0KV2UgaG9wZSB0aGlzIGRlc2lnbiBjaG9pY2UgbWFrZXMgc2Vuc2UgdG8geW91Lg0K
DQpUaGVyZWZvcmUsIHRoZSB1cGRhdGVkIGxvZ2ljIHdpbGwgbG9vayBsaWtlIHRoaXM6DQoNCnN0
YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBfcGxsX2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcg
Kmh3LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkNCnsNCiAgICAgICAgc3RydWN0IHJ0a19jbGtfcmVnbWFw
X3BsbCAqY2xrcCA9IHRvX3J0a19jbGtfcmVnbWFwX3BsbChodyk7DQogICAgICAgIGNvbnN0IHN0
cnVjdCBydGtfZnJlcV90YWJsZSAqZnRibHYgPSBOVUxMOw0KDQogICAgICAgIGlmIChjbGtwLT5l
eHBlY3RlZF9wYXJlbnRfcmF0ZSAmJg0KICAgICAgICAgICAgcmVxLT5iZXN0X3BhcmVudF9yYXRl
ICE9IGNsa3AtPmV4cGVjdGVkX3BhcmVudF9yYXRlKQ0KICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KDQogICAgICAgIGZ0Ymx2ID0gZnRibF9maW5kX2Nsb3Nlc3RfYnlfcmF0ZShjbGtw
LT5mcmVxX3RibCwgcmVxLT5yYXRlLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVxLT5taW5fcmF0ZSwgcmVxLT5tYXhfcmF0ZSk7DQogICAgICAgIGlmICghZnRi
bHYpDQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNCiAgICAgICAgcmVxLT5yYXRl
ID0gZnRibHYtPnJhdGU7DQoNCiAgICAgICAgcmV0dXJuIDA7DQp9DQoNCj4gPiArDQo+ID4gKyAg
ICAgcmVxLT5yYXRlID0gZnRibHYtPnJhdGU7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0K
PiA+ICt9DQo+ID4gKw0KDQpbLi4uXQ0KDQo+ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BMKHJ0a19j
bGtfcGxsX29wcywgIkNMS19SRUFMVEVLIik7DQo+ID4gKw0KPiA+ICtjb25zdCBzdHJ1Y3QgY2xr
X29wcyBydGtfY2xrX3BsbF9yb19vcHMgPSB7DQo+ID4gKyAgICAgLnJlY2FsY19yYXRlID0gcnRr
X2Nsa19yZWdtYXBfcGxsX3JlY2FsY19yYXRlLA0KPiANCj4gaXNfZW5hYmxlZCA/DQoNCkFjay4g
V2lsbCBhZGQuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCj4gDQo+IC0tDQo+IEplcm9tZQ0K

