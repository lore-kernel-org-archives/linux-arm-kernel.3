Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F85CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh5eguMgQOHmoTyzXzSs7aogeMT2P2/J0VUeUvWxnZ0=; b=s01f7gRsOb6WWYkL/7xaC1QE8P
	k+AcCkJMtgVG/HPs16t8ft6MZvSwKQU157UEtuAeGz8eOq+Wlti13KQWVZjX/wCHU4gYcdBaap+k4
	KOw+d/U/m6QTHSPY7VCkT53NteSMePPN3kX2ENtj8QjzExhZqoGjmj5WXHR/6h/xOHOxf6MOL/p0L
	jwEGacaa310WVwzxSYQmd1d5tcF0Ms/biH9nwhRvAhrreABlue+APKz5nVqy/CcCcHNMk2TjAWN99
	wtWr4ToAo4nVu8XiOCu07IxpDNeYfOkZqqhoqkKi/9SpJO8kEY6+G/D8yarOTHDVShUqKoXyHEKq7
	4OKHgX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZsJ-00000002lNT-0n3y;
	Fri, 19 Sep 2025 12:06:03 +0000
Received: from wxsgout03.xfusion.com ([36.139.52.80] helo=wxsgout04.xfusion.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZsG-00000002lKj-0yyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:06:02 +0000
Received: from wuxpheds03046.xfusion.com (unknown [10.32.128.186])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cSrlQ0P8KzB8y5J;
	Fri, 19 Sep 2025 20:04:18 +0800 (CST)
Received: from wuxpheds03048.xfusion.com (10.32.143.30) by
 wuxpheds03046.xfusion.com (10.32.128.186) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.26;
 Fri, 19 Sep 2025 20:05:39 +0800
Received: from wuxpheds03048.xfusion.com ([fe80::36b8:d40d:4624:ad84]) by
 wuxpheds03048.xfusion.com ([fe80::36b8:d40d:4624:ad84%12]) with mapi id
 15.02.2562.020; Fri, 19 Sep 2025 20:05:38 +0800
From: shechenglong <shechenglong@xfusion.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: "will@kernel.org" <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, xulei <stone.xulei@xfusion.com>, chenjialong
	<chenjialong@xfusion.com>, yuxiating <yuxiating@xfusion.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGNwdTogZml4IGhhcmQgbG9ja3VwIHRyaWdnZXJl?=
 =?utf-8?Q?d_during_stress-ng_stress_testing.?=
Thread-Topic: [PATCH] cpu: fix hard lockup triggered during stress-ng stress
 testing.
Thread-Index: AQHcKGhasfpFyT4DM0G5RpWWNk3BFbSYR6yAgAIiPGA=
Date: Fri, 19 Sep 2025 12:05:38 +0000
Message-ID: <2eeb109f50b34e628327972d1af57f5d@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <aMvsxd8nHb5roC0o@arm.com>
In-Reply-To: <aMvsxd8nHb5roC0o@arm.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.82.130.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_050600_860368_9496A183 
X-CRM114-Status: GOOD (  23.26  )
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

T2theSwgdW5kZXJzdG9vZC4gVGhhbmsgeW91ISBNYXkgSSBhc2sgd2hlbiB0aGUgZml4L3BhdGNo
IGlzIGV4cGVjdGVkIHRvIGJlIGF2YWlsYWJsZT8NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K
5Y+R5Lu25Lq6OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiANCuWP
kemAgeaXtumXtDogMjAyNeW5tDnmnIgxOOaXpSAxOToyOA0K5pS25Lu25Lq6OiBzaGVjaGVuZ2xv
bmcgPHNoZWNoZW5nbG9uZ0B4ZnVzaW9uLmNvbT4NCuaKhOmAgTogd2lsbEBrZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IHh1bGVpIDxzdG9uZS54dWxlaUB4ZnVzaW9uLmNvbT47IGNoZW5qaWFsb25nIDxj
aGVuamlhbG9uZ0B4ZnVzaW9uLmNvbT47IHl1eGlhdGluZyA8eXV4aWF0aW5nQHhmdXNpb24uY29t
Pg0K5Li76aKYOiBSZTogW1BBVENIXSBjcHU6IGZpeCBoYXJkIGxvY2t1cCB0cmlnZ2VyZWQgZHVy
aW5nIHN0cmVzcy1uZyBzdHJlc3MgdGVzdGluZy4NCg0KT24gVGh1LCBTZXAgMTgsIDIwMjUgYXQg
MDI6NDk6MDdQTSArMDgwMCwgc2hlY2hlbmdsb25nIHdyb3RlOg0KPiBDb250ZXh0IG9mIHRoZSBJ
c3N1ZToNCj4gSW4gYW4gQVJNNjQgZW52aXJvbm1lbnQsIHRoZSBmb2xsb3dpbmcgc3RlcHMgd2Vy
ZSBwZXJmb3JtZWQ6DQo+IA0KPiAxLiBSZXBlYXRlZGx5IHJhbiBzdHJlc3MtbmcgdG8gc3RyZXNz
IHRoZSBDUFUsIG1lbW9yeSwgYW5kIEkvTy4NCj4gMi4gQ3ljbGljYWxseSBleGVjdXRlZCB0ZXN0
IGNhc2UgcHR5MDYgZnJvbSB0aGUgTFRQIHRlc3Qgc3VpdGUuDQo+IDMuIEFkZGVkIG1pdGlnYXRp
b25zPW9mZiB0byB0aGUgR1JVQiBwYXJhbWV0ZXJzLg0KPiANCj4gQWZ0ZXIgMeKAkzIgaG91cnMg
b2Ygc3RyZXNzIHRlc3RpbmcsIGEgaGFyZGxvY2t1cCBvY2N1cnJlZCwgY2F1c2luZyBhIA0KPiBz
eXN0ZW0gY3Jhc2guDQo+IA0KPiBSb290IENhdXNlIG9mIHRoZSBIYXJkbG9ja3VwOg0KPiBFYWNo
IHRpbWUgc3RyZXNzLW5nIHN0YXJ0cywgaXQgaW52b2tlcyB0aGUgDQo+IC9zeXMva2VybmVsL2Rl
YnVnL2NsZWFyX3dhcm5fb25jZSBpbnRlcmZhY2UsIHdoaWNoIGNsZWFycyB0aGUgdmFsdWVzIA0K
PiBpbiB0aGUgbWVtb3J5IHNlY3Rpb24gZnJvbSBfX3N0YXJ0X29uY2UgdG8gX19lbmRfb25jZS4g
VGhpcyBjYXVzZWQgDQo+IGZ1bmN0aW9ucyBsaWtlIHByX2luZm9fb25jZSgpIOKAlCBvcmlnaW5h
bGx5IGRlc2lnbmVkIHRvIHByaW50IG9ubHkgb25jZSDigJQgdG8gcHJpbnQgYWdhaW4gZXZlcnkg
dGltZSBzdHJlc3Mtbmcgd2FzIGNhbGxlZC4NCj4gSWYgdGhlIHB0eTA2IHRlc3QgY2FzZSBoYXBw
ZW5lZCB0byBiZSB1c2luZyB0aGUgc2VyaWFsIG1vZHVsZSBhdCB0aGF0IA0KPiBzYW1lIG1vbWVu
dCwgaXQgd291bGQgc2xlZXAgaW4gd2FpdGVyLmxpc3Qgd2l0aGluIHRoZSBfX2Rvd25fY29tbW9u
IGZ1bmN0aW9uLg0KPiANCj4gQWZ0ZXIgcHJfaW5mb19vbmNlKCkgY29tcGxldGVkIGl0cyBvdXRw
dXQgdXNpbmcgdGhlIHNlcmlhbCBtb2R1bGUsIGl0IA0KPiBpbnZva2VkIHRoZSBzZW1hcGhvcmUg
dXAoKSBmdW5jdGlvbiB0byB3YWtlIHVwIHRoZSBwcm9jZXNzIHdhaXRpbmcgaW4gDQo+IHdhaXRl
ci5saXN0LiBUaGlzIHNlcXVlbmNlIHRyaWdnZXJlZCBhbiBBLUEgZGVhZGxvY2ssIHVsdGltYXRl
bHkgDQo+IGxlYWRpbmcgdG8gYSBoYXJkbG9ja3VwIGFuZCBzeXN0ZW0gY3Jhc2guDQo+IA0KPiBU
byBwcmV2ZW50IHRoaXMsIGEgbG9jYWwgdmFyaWFibGUgc2hvdWxkIGJlIHVzZWQgdG8gY29udHJv
bCBhbmQgZW5zdXJlIA0KPiB0aGUgcHJpbnQgb3BlcmF0aW9uIG9jY3VycyBvbmx5IG9uY2UuDQo+
IA0KPiBIYXJkIGxvY2t1cCBjYWxsIHN0YWNrOg0KPiANCj4gX3Jhd19zcGluX2xvY2tfbmVzdGVk
KzE2OA0KPiB0dHd1X3F1ZXVlKzE4MCDvvIhycV9sb2NrKHJxLCAmcmYpOyAybmQgYWNxdWlyaW5n
IHRoZSBycS0+X19sb2Nr77yJDQo+IHRyeV90b193YWtlX3VwKzU0OA0KPiB3YWtlX3VwX3Byb2Nl
c3MrMzINCj4gX191cCs4OA0KPiB1cCsxMDANCj4gX191cF9jb25zb2xlX3NlbSs5Ng0KPiBjb25z
b2xlX3VubG9jays2OTYNCj4gdnByaW50a19lbWl0KzQyOA0KPiB2cHJpbnRrX2RlZmF1bHQrNjQN
Cj4gdnByaW50a19mdW5jKzIyMA0KPiBwcmludGsrMTA0DQo+IHNwZWN0cmVfdjRfZW5hYmxlX3Rh
c2tfbWl0aWdhdGlvbiszNDQNCj4gX19zd2l0Y2hfdG8rMTAwDQo+IF9fc2NoZWR1bGUrMTAyOCAo
cnFfbG9jayhycSwgJnJmKTsgMXN0IGFjcXVpcmluZyB0aGUgcnEtPl9fbG9jaykNCj4gc2NoZWR1
bGVfaWRsZSs0OA0KPiBkb19pZGxlKzM4OA0KPiBjcHVfc3RhcnR1cF9lbnRyeSs0NA0KPiBzZWNv
bmRhcnlfc3RhcnRfa2VybmVsKzM1Mg0KDQpJcyB0aGUgcHJvYmxlbSBhY3R1YWxseSB0aGF0IHdl
IGNhbGwgdGhlIHNwZWN0cmUgdjQgc3R1ZmYgb24gdGhlDQpzd2l0Y2hfdG8oKSBwYXRoICh3ZSBj
YW4ndCBjaGFuZ2UgdGhpcykgdW5kZXIgdGhlIHJxX2xvY2soKSBhbmQgaXQgc3Vic2VxdWVudGx5
IGNhbGxzIHByaW50aygpIHdoaWNoIHRha2VzIHRoZSBjb25zb2xlIHNlbWFwaG9yZT8gSSB0aGlu
ayB0aGUgIm9uY2UiIGFzcGVjdCBtYWtlcyBpdCBsZXNzIGxpa2VseSBidXQgZG9lcyBub3QgYWRk
cmVzcyB0aGUgYWN0dWFsIHByb2JsZW0uDQoNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2Vy
bmVsL3Byb3Rvbi1wYWNrLmMgDQo+IGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvdG9uLXBhY2suYyBp
bmRleCBlZGYxNzgzZmZjODEuLmY4NjYzMTU3ZTA0MSANCj4gMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
YXJtNjQva2VybmVsL3Byb3Rvbi1wYWNrLmMNCj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJv
dG9uLXBhY2suYw0KPiBAQCAtNDI0LDggKzQyNCwxMCBAQCBzdGF0aWMgYm9vbCBzcGVjdHJlX3Y0
X21pdGlnYXRpb25zX29mZih2b2lkKQ0KPiAgCWJvb2wgcmV0ID0gY3B1X21pdGlnYXRpb25zX29m
ZigpIHx8DQo+ICAJCSAgIF9fc3BlY3RyZV92NF9wb2xpY3kgPT0gU1BFQ1RSRV9WNF9QT0xJQ1lf
TUlUSUdBVElPTl9ESVNBQkxFRDsNCj4gIA0KPiAtCWlmIChyZXQpDQo+IC0JCXByX2luZm9fb25j
ZSgic3BlY3RyZS12NCBtaXRpZ2F0aW9uIGRpc2FibGVkIGJ5IGNvbW1hbmQtbGluZSBvcHRpb25c
biIpOw0KPiArCXN0YXRpYyBhdG9taWNfdCBfX3ByaW50a19vbmNlID0gQVRPTUlDX0lOSVQoMCk7
DQo+ICsNCj4gKwlpZiAocmV0ICYmICFhdG9taWNfY21weGNoZygmX19wcmludGtfb25jZSwgMCwg
MSkpDQo+ICsJCXByX2luZm8oInNwZWN0cmUtdjQgbWl0aWdhdGlvbiBkaXNhYmxlZCBieSBjb21t
YW5kLWxpbmUgb3B0aW9uXG4iKTsNCj4gIA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQoNCkkgdGhp
bmsgd2Ugc2hvdWxkIGp1c3QgYXZvaWQgdGhlIHByaW50aygpIG9uIHRoZQ0Kc3BlY3RyZV92NF9l
bmFibGVfdGFza19taXRpZ2F0aW9uKCkgcGF0aC4gV2VsbCwgSSdkIHJlbW92ZSBpdCBhbHRvZ2V0
aGVyIGZyb20gdGhlIHNwZWN0cmVfdjRfbWl0aWdhdGlvbnNfb2ZmKCkgYXMgaXQncyBjYWxsZWQg
b24ga2VybmVsIGVudHJ5IGFzIHdlbGwuIEp1c3QgYWRkIGEgZGlmZmVyZW50IHdheSB0byBwcmlu
dCB0aGUgc3RhdHVzIGR1cmluZyBrZXJuZWwgYm9vdCBpZiB0aGVyZSBpc24ndCBvbmUgYWxyZWFk
eSwgbWF5YmUgYW4gaW5pdGNhbGwuDQoNCi0tDQpDYXRhbGluDQo=

