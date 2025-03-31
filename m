Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5302C36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw5ohSoBs7ihq12VPqJvT1/P3g+JZLa+BPqoZgrIT6Q=; b=wSVhh/HNJnh3iFopuF/hM7uizM
	VmBf67ZNpeGfMNU2itDZkRbgKmk5v5CbPqTAh83+w1VrymBU1u8Utr+70/Inwv8l9BE7hJo47oVet
	Cz1mmI1hxWhl50GPQEtQplyZGDR6C4H8LxajIT8w2MPjqE5RbQghEsS00JrsrTfq8XfSJhKq9WBCK
	QzzQqNEYtHqTtEe/mz0+rzpCtmGg05PIRTuwNd519gSnGIRqp4HwbBmsM3wRVv5EHxsBW4IPa1hH8
	7//bmgX/3cBHvH3um363oILCgDFb3iZ+w3OAmzw9M7Stb9b3ylB3VF8q8qaFh43WLFr9GQyy066vx
	Hv+efpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA9V-0000000HIPc-2sF3;
	Mon, 31 Mar 2025 08:05:49 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA6H-0000000HHng-17VM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:02:31 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 10:02:21 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Mon, 31 Mar 2025 10:02:20 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Frank Li <Frank.li@nxp.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Thread-Topic: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Thread-Index: AQHboAAzgh/yl+5aq0iI+AsHqQOMo7OI4SUAgAPjxwA=
Date: Mon, 31 Mar 2025 08:02:20 +0000
Message-ID: <6f5877cb-e6b7-4420-9a92-d2f44f931e8f@actia.se>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
 <Z+b6qrgXz/NTOs5r@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+b6qrgXz/NTOs5r@lizhi-Precision-Tower-5810>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2955B144526C7360
Content-Type: text/plain; charset="utf-8"
Content-ID: <6285582D07366E4D8EF7B74993B8B916@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_010229_306524_8D71FA30 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgRnJhbmssDQoNCk9uIDMvMjgvMjUgODozOCBQTSwgRnJhbmsgTGkgd3JvdGU6DQo+IE9uIEZy
aSwgTWFyIDI4LCAyMDI1IGF0IDA0OjQxOjA1UE0gKzAwMDAsIEpvaG4gRXJuYmVyZyB3cm90ZToN
Cj4+IE9uIDYvMTIvMjMgNTozMSBQTSwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOg0KPj4+IEhpLA0K
Pj4+DQo+Pj4gVGhhdCdzIHY3IG9mIHRoZSBzZXJpZXMgcmVkdWNpbmcgdGhlIGttYWxsb2MoKSBt
aW5pbXVtIGFsaWdubWVudCBvbg0KPj4+IGFybTY0IHRvIDggKGZyb20gMTI4KS4gVGhlcmUncyBu
byBuZXcvZGlmZmVyZW50IGZ1bmN0aW9uYWxpdHksIG1vc3RseQ0KPj4+IGNvc21ldGljIGNoYW5n
ZXMgYW5kIGFja3MvdGVzdGVkLWJ5cy4NCj4+Pg0KPj4+IEFuZHJldywgaWYgdGhlcmUgYXJlIG5v
IGZ1cnRoZXIgY29tbWVudHMgb3Igb2JqZWN0aW9ucyB0byB0aGlzIHZlcnNpb24sDQo+Pj4gYXJl
IHlvdSBvayB0byB0YWtlIHRoZSBzZXJpZXMgdGhyb3VnaCB0aGUgbW0gdHJlZT8gVGhlIGFybTY0
IGNoYW5nZXMgYXJlDQo+Pj4gZmFpcmx5IHNtYWxsLiBBbHRlcm5hdGl2ZWx5LCBJIGNhbiBwdXNo
IGl0IGludG8gbGludXgtbmV4dCBub3cgdG8gZ2l2ZQ0KPj4+IGl0IHNvbWUgd2lkZXIgZXhwb3N1
cmUgYW5kIGRlY2lkZSB3aGV0aGVyIHRvIHVwc3RyZWFtIGl0IHdoZW4gdGhlDQo+Pj4gbWVyZ2lu
ZyB3aW5kb3cgb3BlbnMuIFRoYW5rcy4NCj4+Pg0KPj4+IFRoZSB1cGRhdGVkIHBhdGNoZXMgYXJl
IGFsc28gYXZhaWxhYmxlIG9uIHRoaXMgYnJhbmNoOg0KPj4+DQo+Pj4gZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FybTY0L2xpbnV4IGRldmVsL2ttYWxsb2Mt
bWluYWxpZ24NCj4+Pg0KPj4NCj4+IChJIHRyaW1tZWQgdGhlIHJlY2lwaWVudHMgYW5kIGFkZGVk
IGxpbnV4LXVzYiBhbmQgaW14IG1haWxpbmcgbGlzdCwgKw0KPj4gY2RuczMgbWFpbnRhaW5lcnMp
DQo+Pg0KPj4gSGkgQ2F0YWxpbiwgbGlzdHMsDQo+Pg0KPj4gU2VlbiBvbiBMaW51eCA2LjEyLjIw
LCBpdCBpcyBub3QgdHJpdmlhbCBmb3IgdXMgdG8gdGVzdCBsYXRlciBrZXJuZWxzIHNvDQo+PiBp
ZiB0aGUgaXNzdWUgaXMgcG90ZW50aWFsbHkgZml4ZWQgd2UgYXJlIG1vcmUgdGhhbiBoYXBweSB0
byBjaGVycnktcGljaw0KPj4gdGhlIHBvdGVudGlhbCBmaXhlcyBhbmQgZ2l2ZSB0aGVtIGEgZ28u
DQo+Pg0KPj4gSGF2aW5nIGFuIFNNU0M5NTEyIChzbXNjOTV4eCkgVVNCIEV0aGVybmV0L0h1YiBj
aGlwIGF0dGFjaGVkIHRvIHRoZSBhcm12OA0KPj4gU29DIGlNWDhRWFAgb3ZlciB0aGUgQ2FkZW5j
ZSBVU0IzIFVTQjIgaW50ZXJmYWNlIChjZG5zMy1pbXgpIHdpbGwgc2luY2UNCj4+IHRoZSBwYXRj
aCBzZXQgYXQgWzBdIGNhdXNlIHJhbmRvbSBpbnRlcnJ1cHQgc3Rvcm1zIG92ZXIgdGhlIFNNU0M5
NTEyIElOVA0KPj4gRVAuDQo+IA0KPiBEbyB5b3Uga25vdyB3aGVyZSBidXkgU01TQzk1MTIgVVNC
IEV0aGVybmV0L0h1Yj8NCg0KQSBxdWljayBnb29nbGUgc2VhcmNoIGRpZG4ndCBmaW5kIG15IGFu
eSBkb25nbGVzIHRoYXQgYXJlIHN0aWxsIA0KYXZhaWxhYmxlLCBob3dldmVyIHRoZSBTTVNDIDk1
eHggc2VyaWVzIG9mIGNoaXBzIHVzZWQgdG8gYmUgcG9wdWxhciBpbiANClVTQiB0byBFdGhlcm5l
dCBkb25nbGVzLg0KDQpPdGhlcndpc2UgdGhleSBhcmUgbWFkZSBieSBNaWNyb2NoaXAgdG9kYXks
IGFueSB2YXJpYW50IG9mIHRoZSBTTVNDIDk1eHggDQpzaG91bGQgYmUgYWJsZSB0byB0cmlnZ2Vy
IHRoZSBwcm9ibGVtLg0KDQo+IA0KPj4NCj4+IFRoZSByZWFzb24gZm9yIHRoZSBzdG9ybSBpcyB0
aGF0IHRoZSBhc3luYyBVUkJzIHF1ZXVlZCBhdCBbMV0gcmlnaHQgYmVmb3JlDQo+PiB0aGUgaW50
ZXJydXB0IGNvbmZpZ3VyYXRpb24gWzJdIGluIHRoZSBkcml2ZXIuDQo+PiBXaXRoIFswXSBhcHBs
aWVkLCB0aG9zZSBhc3luYyBVUkJzIGFyZSBsaWtlbHkgY2xvYmJlcmluZyBhbnkgVVJCIGxvY2F0
ZWQNCj4+IGFmdGVyIHRoZW0gaW4gbWVtb3J5IHNvbWV3aGVyZSBpbiB0aGUgeGhjaSBtZW1vcnkg
c3BhY2UuDQo+PiBUaGUgbWVtb3J5IGNvcnJ1cHRpb24gb25seSBoYXBwZW5zIGlmIHRoZXJlIGlz
IG1vcmUgdGhhbiBvbmUgVVJCIGluIHRoZQ0KPj4gcXVldWUgYXQgdGhlIHNhbWUgdGltZSwgbWFr
aW5nIHRoZXNlIGFzeW5jIFVSQnMgYSBnb29kIHRyaWdnZXIgb2YgdGhlDQo+PiBwcm9ibGVtLg0K
Pj4gSWYgd2UgZm9yY2UgdGhvc2UgVVJCcyB0byBiZSBzeW5jIG9yIHVzZSB0aGUgaGFjayBpbmxp
bmVkIGJlbG93LCB0aGUNCj4+IHByb2JsZW0gZ29lcyBhd2F5Lg0KPj4NCj4+IFRoZSBjb250ZW50
IG9mIHJlYWRfYnVmIGluIHRoZSBpbnRlcnJ1cHQgY29uZmlndXJhdGlvbiByZWFkIGF0IFsyXSBs
b29rcw0KPj4gdG8gYmUgdGhlIGxvLXBhcnQgb2YgYSBwb2ludGVyICstMjAgYnl0ZXMgZGlzdGFu
Y2UgZnJvbSB0aGUgcG9pbnRlcnMNCj4+IHByZXNlbnQgaW4gdGhlIGFzeW5jIFVSQnMgcXVldWVk
IGZyb20gWzFdIHdoZW4gd2UgZHVtcGVkIHRoZSBVUkIgc3RydWN0dXJlcw0KPj4gaW5zdGVhZCBv
ZiB0aGUgZXhwZWN0ZWQgcmVnaXN0ZXIgY29udGVudHMuDQo+Pg0KPj4gQXR0YWNoZWQgYXJlIDMg
dXNibW9uIGNhcHR1cmVzLCB3aXRoIHNvbWUgYW5ub3RhdGlvbnMsIHdoaWNoIHdlIHRob3VnaHQN
Cj4+IG1pZ2h0IGNvbnRhaW4gdXNlZnVsIGhpbnRzLg0KPj4NCj4+ICogdXNiLWFubm90YXRlZC1i
YWQucGNhcG5nIHNob3dzIHRoZSBVUkIgdGhhdCB3aWxsIGdldCBjbG9iYmVyZWQgaXMgcXVldWVk
DQo+PiAgICAgYXQgcG9zaXRpb24gMjgwLCBhbmQgY29tcGxldGVzIGF0IDI4Mi4NCj4+DQo+PiAq
IHVzYi1hbm5vdGF0ZWQtZ29vZC5wY2Fwbmcgc2hvd3MgdGhlIFVSQiB0aGF0IGdldHMgY2xvYmJl
cmVkIGluIHRoZSBiYWQNCj4+ICAgICBjYXNlIGlzIHF1ZXVlZCBhdCBwb3NpdGlvbiAyODIgYW5k
IGNvbXBsZXRlcyBhdCAyODMuDQo+Pg0KPj4gVGhlIGFib3ZlIGNhcHR1cmVzIGFyZSBmcm9tIGEg
a2VybmVsIHdoZXJlIHRoZSBoYWNrIGhhcyBub3QgYmVlbiBhcHBsaWVkLg0KPj4NCj4+ICogdXNi
LWFubm90YXRlZC1oYWNrZml4LnBjYXBuZyBzaG93cyB0aGUgVVJCIHRoYXQgZ2V0cyBjbG9iYmVy
ZWQgaW4gdGhlDQo+PiAgICAgYmFkIGNhc2UgaXMgcXVldWVkIGF0IHBvc2l0aW9uIDIzOCBhbmQg
Y29tcGxldGVzIGF0IDI0MC4NCj4gDQo+IE1haWxsaXN0IGhhdmUgbm90IGF0dGFjaG1lbnQuIENh
biB5b3Ugc2VuZCBpdCB0byBtZSBkaXJlY3RseT8NCg0KDQpUaGUgbGludXgtdXNiIG1haWxpbmcg
bGlzdCBwaWNrZWQgdXAgdGhlIGF0dGFjaG1lbnRzLg0KDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC11c2IvWitiNnFyZ1h6JTJGTlRPczVyQGxpemhpLVByZWNpc2lvbi1Ub3dlci01ODEw
L1QvI3QNCg0KQmVzdCByZWdhcmRzIC8vIEpvaG4gRXJuYmVyZw==

