Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DCAD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIfGqIfpXLoJAz7hvPPvJWHOonux85R6g8kYnsR9WDE=; b=C1nSYmO9wb+GASX8FokCKcDSx1
	bpr5ejtITAXePekAjitQ1PGvwFaOsPNnH44ZLUJ0QohM1vEbnpBamaskOJ2Tm0TyCYIQzdJgSYzzz
	lVyhboCZDn81b3E4kzdJptlGNNuZcNZs0CqT809DEhblsZV/RDiDF6F+noxVSut8PpwTng60IQwtK
	gQfddipgGhFuUMq8XQDOk8IsAOMsqW3YNLLyN1eBhcfG423NLseKjo/KBS0WlHD1BSatDvJ3yBbOb
	wUWjfEhgEoUz9NRrRjzoG1hm84shS3VHdrFoHDz42u4ApMzl/tjDNTVlQEMzdERiV0P/WZJIV2zVu
	Y6wGPAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQF8z-00000004fjv-26s9;
	Tue, 02 Dec 2025 01:25:29 +0000
Received: from mail03.siengine.com ([43.240.192.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQF8w-00000004fjO-1Eo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 01:25:28 +0000
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 5B21OaiF029191
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 2 Dec 2025 09:24:36 +0800 (+08)
	(envelope-from hailong.fan@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4dL31G0TrJz5pX1;
	Tue,  2 Dec 2025 09:22:58 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1748.39; Tue, 2 Dec 2025 09:24:35 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1748.039; Tue, 2 Dec 2025 09:24:35 +0800
From: =?utf-8?B?RmFuIEhhaWxvbmcv6IyD5rW36b6Z?= <hailong.fan@siengine.com>
To: Eric Dumazet <edumazet@google.com>,
        "2694439648@qq.com"
	<2694439648@qq.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "davem@davemloft.net"
	<davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>,
        "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>,
        "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "inux-kernel@vger.kernel.org"
	<inux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG5ldDogc3RtbWFjOiBNb2RpZnkgdGhlIGp1ZGdt?=
 =?utf-8?Q?ent_condition_of_"tx=5Favail"_from_1_to_2?=
Thread-Topic: [PATCH] net: stmmac: Modify the judgment condition of "tx_avail"
 from 1 to 2
Thread-Index: AQHcYm4w5U5uVlzf+UqD24zBtjcj6LUMLvyAgAFf1+A=
Date: Tue, 2 Dec 2025 01:24:35 +0000
Message-ID: <addd14c84f164e4e90e35e8dc4121dd4@siengine.com>
References: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
 <CANn89iLW+68YE9s9dChEcQYbmwXSBzWRPzFH50+--Kw3XNZXEQ@mail.gmail.com>
In-Reply-To: <CANn89iLW+68YE9s9dChEcQYbmwXSBzWRPzFH50+--Kw3XNZXEQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.20.38]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-MAIL: mail03.siengine.com 5B21OaiF029191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_172526_600414_1F414788 
X-CRM114-Status: GOOD (  16.53  )
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

SGkgRXJpYw0KDQpZb3UgYXJlIHJpZ2h0LCBJIHdpbGwgZm9sbG93IHlvdXIgYWR2aWNlIHRvIG1v
ZGlmeSB0aGUgcmVsZXZhbnQgY29kZS4NCg0KUmVnYXJkcw0KSGFpbG9uZw0KDQoNCi0tLS0t6YKu
5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUu
Y29tPiANCuWPkemAgeaXtumXtDogMjAyNeW5tDEy5pyIMeaXpSAyMDoyMQ0K5pS25Lu25Lq6OiAy
Njk0NDM5NjQ4QHFxLmNvbQ0K5oqE6YCBOiBhbmRyZXcrbmV0ZGV2QGx1bm4uY2g7IGRhdmVtQGRh
dmVtbG9mdC5uZXQ7IGt1YmFAa2VybmVsLm9yZzsgcGFiZW5pQHJlZGhhdC5jb207IG1jb3F1ZWxp
bi5zdG0zMkBnbWFpbC5jb207IGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb207IEZhbiBIYWls
b25nL+iMg+a1t+m+mSA8aGFpbG9uZy5mYW5Ac2llbmdpbmUuY29tPjsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCuS4u+mimDogUmU6IFtQQVRDSF0gbmV0OiBzdG1tYWM6IE1vZGlmeSB0aGUganVkZ21lbnQg
Y29uZGl0aW9uIG9mICJ0eF9hdmFpbCIgZnJvbSAxIHRvIDINCg0KT24gU3VuLCBOb3YgMzAsIDIw
MjUgYXQgNjo1N+KAr1BNIDwyNjk0NDM5NjQ4QHFxLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206ICJo
YWlsb25nLmZhbiIgPGhhaWxvbmcuZmFuQHNpZW5naW5lLmNvbT4NCj4NCj4gICAgIFVuZGVyIGNl
cnRhaW4gY29uZGl0aW9ucywgYSBXQVJOX09OIHdpbGwgYmUgdHJpZ2dlcmVkDQo+ICAgICBpZiBh
dmFpbCBlcXVhbHMgMS4NCj4NCj4gICAgIEZvciBleGFtcGxlLCB3aGVuIGEgVkxBTiBwYWNrZXQg
aXMgdG8gc2VuZCwNCj4gICAgIHN0bW1hY192bGFuX2luc2VydCBjb25zdW1lcyBvbmUgdW5pdCBv
ZiBzcGFjZSwNCj4gICAgIGFuZCB0aGUgZGF0YSBpdHNlbGYgY29uc3VtZXMgYW5vdGhlci4NCj4g
ICAgIGFjdHVhbGx5IHJlcXVpcmluZyAyIHVuaXRzIG9mIHNwYWNlIGluIHRvdGFsLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBoYWlsb25nLmZhbiA8aGFpbG9uZy5mYW5Ac2llbmdpbmUuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
fCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMgDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYw0KPiBpbmRleCA3YjkwZWNkM2EuLmI1NzUzODRjZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+IEBA
IC00NTI5LDcgKzQ1MjksNyBAQCBzdGF0aWMgbmV0ZGV2X3R4X3Qgc3RtbWFjX3htaXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikNCj4gICAgICAgICAgICAgICAg
IH0NCj4gICAgICAgICB9DQo+DQo+IC0gICAgICAgaWYgKHVubGlrZWx5KHN0bW1hY190eF9hdmFp
bChwcml2LCBxdWV1ZSkgPCBuZnJhZ3MgKyAxKSkgew0KPiArICAgICAgIGlmICh1bmxpa2VseShz
dG1tYWNfdHhfYXZhaWwocHJpdiwgcXVldWUpIDwgbmZyYWdzICsgMikpIHsNCj4gICAgICAgICAg
ICAgICAgIGlmICghbmV0aWZfdHhfcXVldWVfc3RvcHBlZChuZXRkZXZfZ2V0X3R4X3F1ZXVlKGRl
diwgcXVldWUpKSkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBuZXRpZl90eF9zdG9wX3F1
ZXVlKG5ldGRldl9nZXRfdHhfcXVldWUocHJpdi0+ZGV2LA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IHF1ZXVlKSk7
DQoNCkRyaXZlcnMgc2hvdWxkIHN0b3AgdGhlaXIgcXVldWVzIGVhcmxpZXIuDQoNCk5FVERFVl9U
WF9CVVNZIGlzIGFsbW9zdCBhbHdheXMgd3JvbmcuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQpiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMNCmluZGV4IDdiOTBlY2QzYTU1ZTYw
MDQ1OGIwYzg3ZDYxMjU4MzE2MjZmNDY4M2QuLjZkY2M3Yjg0YTg3NTk3NjNiNjQ3MWE0OGE2Yzgw
YjFmMTdjZDkzN2MNCjEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYw0KKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYw0KQEAgLTQ2NzUsNyArNDY3NSw3IEBAIHN0YXRpYyBuZXRkZXZf
dHhfdCBzdG1tYWNfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAq
ZGV2KQ0KICAgICAgICAgICAgICAgIHByaW50X3BrdChza2ItPmRhdGEsIHNrYi0+bGVuKTsNCiAg
ICAgICAgfQ0KDQotICAgICAgIGlmICh1bmxpa2VseShzdG1tYWNfdHhfYXZhaWwocHJpdiwgcXVl
dWUpIDw9IChNQVhfU0tCX0ZSQUdTICsgMSkpKSB7DQorICAgICAgIGlmICh1bmxpa2VseShzdG1t
YWNfdHhfYXZhaWwocHJpdiwgcXVldWUpIDw9IChNQVhfU0tCX0ZSQUdTICsgDQorIDIpKSkgew0K
ICAgICAgICAgICAgICAgIG5ldGlmX2RiZyhwcml2LCBodywgcHJpdi0+ZGV2LCAiJXM6IHN0b3Ag
dHJhbnNtaXR0ZWQgcGFja2V0c1xuIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5j
X18pOw0KICAgICAgICAgICAgICAgIG5ldGlmX3R4X3N0b3BfcXVldWUobmV0ZGV2X2dldF90eF9x
dWV1ZShwcml2LT5kZXYsIHF1ZXVlKSk7DQo=

