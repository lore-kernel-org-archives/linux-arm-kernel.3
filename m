Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01780C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JddUaa0wLJyC6eSU+yxvhJrBLSskqrBTBPGi8c6Tuww=; b=XzYCcFDqku32x3/iZtmaHQfwS7
	/ezDO2ioD2Qn5UJh2m0fK/zyN+olDLnJMb3opWGiBEboqo2rmI42mzt1nx8+TMw4LRbDBPVYfNG96
	UE1+jUOAj8kVd6yzxtd1nFoOS2FngUmC+jV5GHOtrKU2j2wkaS5huGbKymJEdabjAJ9xbb3PSQ9Tj
	7P3I1rmjc2TPTyV64VQYBghHjVvKezMNDOZ4iarWq9rT6SLP475xZ8K3bXJDYEO8IiEEnzKUXCX/k
	c42ElfgniJkN2rMEZWJMSoSoclvAbcMv/xG/tA/POljGUO5CAJrpplIElxvxycvkalZup3hUuum+L
	dgKGqS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviog-000000058PO-48eV;
	Sun, 16 Aug 2026 21:54:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviof-000000058PG-0kAI
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 16 Aug 2026 21:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
	From:Sender:Reply-To:Content-Description;
	bh=JddUaa0wLJyC6eSU+yxvhJrBLSskqrBTBPGi8c6Tuww=; b=hs1gsf6EQk1OheLB1A9S+m4ceK
	AOsz6lW6L2ayGbZIMUofXOZltFjMKmcqkPTqVCNaJVpEaJxWcXfN6pkn+Jfbk2RGn6qcKc8lJs+34
	giJTxVB/9625Kmjn7QYRusqNuxzxT2KUAKcy7S5DcmBNOZd7T+UtXOrj15b4ZWKoQdarVPNYCZISo
	gL8Rdlj8DGAYURmDTTioRPEL6FXmBzlxTdV8hPXYmdYjTKB9x3oAyi5g9kJR3VIZP55au93Z7qHES
	iZmvK5JVLxiwkX/xHsaBNnobd55F+OK9uftesHdIHu7PawiS+scu5hEn7P1wA2pUgDkDl3QQyOZ2V
	msb85FGQ==;
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvioZ-00000008yxr-2f9L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 21:54:51 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 168E52C01D7;
	Mon, 17 Aug 2026 09:32:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1786915930;
	bh=JddUaa0wLJyC6eSU+yxvhJrBLSskqrBTBPGi8c6Tuww=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=N1i4pxtVLgvcn+9ZtP+NKO0YeaJXIumjb0bTEbZWKAULW8zMI1Bmx2wbBEEVSlvR9
	 Eucafh1bXagxm4ADjS18kq6kfkbMQBLXfbyUWa/Yaii8z9zFdZXA5+/SdgOj5lU0W+
	 XH2N+jkSbRhnvnukdP1/fRTa3l5bGWw3v7AzgZgS4RKqGGtWqq8jUqCE4yznb8ivty
	 d9rbtJ82lNYRUokLY0NjxW4Z1kqPoVDlG2qlGIsn4m2ScWlZaXwaB3LPXNovYvdjS2
	 s5DBpk8yXebj5P5svgIyGfApOCBQR/akL638/+YDPJnrAxJSjoqG3aJJETaEZ+19+n
	 zb56oJHhKv+7g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a822c590000>; Mon, 17 Aug 2026 09:32:09 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Mon, 17 Aug 2026 09:32:09 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Mon, 17 Aug 2026 09:32:09 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Liu Zhenlong <dragonliu2018@gmail.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "jochen@scram.de" <jochen@scram.de>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "vz@mleia.com" <vz@mleia.com>,
	"piotr.wojtaszczyk@timesys.com" <piotr.wojtaszczyk@timesys.com>
CC: "mpe@ellerman.id.uk" <mpe@ellerman.id.uk>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "chleroy@kernel.org" <chleroy@kernel.org>,
	"grant.likely@secretlab.ca" <grant.likely@secretlab.ca>,
	"neelegup@linux.vnet.ibm.com" <neelegup@linux.vnet.ibm.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "wsa@kernel.org"
	<wsa@kernel.org>, "stigge@antcom.de" <stigge@antcom.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH 1/5] i2c: mpc: fix device_node refcount leak in
 fsl_i2c_probe()/fsl_i2c_remove()
Thread-Topic: [PATCH 1/5] i2c: mpc: fix device_node refcount leak in
 fsl_i2c_probe()/fsl_i2c_remove()
Thread-Index: AQHdLOGwizUCWCZB906ULMjP0xiw17aganMA
Date: Sun, 16 Aug 2026 21:32:09 +0000
Message-ID: <5d7663b2-628e-43d3-9077-fc3a8c0fe9b3@alliedtelesis.co.nz>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
 <20260815181204.2321-2-dragonliu2018@gmail.com>
In-Reply-To: <20260815181204.2321-2-dragonliu2018@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.12]
Content-Type: text/plain; charset="utf-8"
Content-ID: <795203B68820D24CBB330239887239E9@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CKmJXgrD c=1 sm=1 tr=0 ts=6a822c59 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=g5w_v8IkoF8M0yuuWAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_225448_644015_5EC33A9E 
X-CRM114-Status: GOOD (  31.48  )
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

SGkgTGl1DQoNCk9uIDE2LzA4LzIwMjYgMDY6MTIsIExpdSBaaGVubG9uZyB3cm90ZToNCj4gZnNs
X2kyY19wcm9iZSgpIGNhbGxzIG9mX25vZGVfZ2V0KCkgdG8gdGFrZSBhbiBleHRyYSByZWZlcmVu
Y2Ugb24gdGhlDQo+IHBsYXRmb3JtIGRldmljZSdzIG9mX25vZGUgd2hlbiBhc3NpZ25pbmcgaXQg
dG8gdGhlIGFkYXB0ZXIgZGV2aWNlLCBidXQNCj4gbmVpdGhlciB0aGUgcHJvYmUgZXJyb3IgcGF0
aCBub3IgZnNsX2kyY19yZW1vdmUoKSBkcm9wcyBpdC4NCj4NCj4gZGV2aWNlX3JlbGVhc2UoKSBk
b2VzIG5vdCBjYWxsIG9mX25vZGVfcHV0KCkgYW5kIGkyY19hZGFwdGVyX2Rldl9yZWxlYXNlKCkN
Cj4gb25seSBjb21wbGV0ZXMgYSBzdHJ1Y3QsIHNvIHRoZSBleHRyYSByZWZlcmVuY2UgaXMgbmV2
ZXIgcmVsZWFzZWQsIGxlYWtpbmcNCj4gdGhlIGRldmljZV9ub2RlIG9uIGV2ZXJ5IHByb2JlIGZh
aWx1cmUgYW5kIGV2ZXJ5IGFkYXB0ZXIgcmVtb3ZhbC4NCj4NCj4gQWRkIHRoZSBtYXRjaGluZyBv
Zl9ub2RlX3B1dCgpIHRvIGJvdGggcGF0aHMuDQo+DQo+IEluIHRoZSBwcm9iZSBlcnJvciBwYXRo
LCBpMmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoKSBmYWlsdXJlIGRvZXMgbm90IHJ1bg0KPiBpMmNf
ZGVsX2FkYXB0ZXIoKSwgc28gb2Zfbm9kZV9wdXQoaTJjLT5hZGFwLmRldi5vZl9ub2RlKSBpcyBz
YWZlLg0KPg0KPiBJbiBmc2xfaTJjX3JlbW92ZSgpLCBpMmNfZGVsX2FkYXB0ZXIoKSBjbGVhcnMg
YWRhcC0+ZGV2IHdpdGggbWVtc2V0KCkgYXQNCj4gdGhlIGVuZCAoY29tbWl0IGJkNGJjM2RiZGVk
OSAoImkyYzogQ2xlYXIgaTJjX2FkYXB0ZXIuZGV2IG9uIGFkYXB0ZXINCj4gcmVtb3ZhbCIpKSwg
d2hpY2ggemVyb2VzIGFkYXAtPmRldi5vZl9ub2RlIGJlZm9yZSBvZl9ub2RlX3B1dCgpIHJ1bnMs
DQo+IHR1cm5pbmcgaXQgaW50byBhIG5vLW9wLiAgQ2FjaGUgdGhlIHBvaW50ZXIgYmVmb3JlIGNh
bGxpbmcNCj4gaTJjX2RlbF9hZGFwdGVyKCksIHRoZSBzYW1lIGFwcHJvYWNoIHVzZWQgaW4gaTJj
LW11eA0KPiAoaTJjX211eF9kZWxfYWRhcHRlcnMpIGFuZCBtdGQgKGNvbW1pdCA1NjU3MGJkYWQ1
ZTMgKCJtdGQ6IGNvcmU6IEZpeA0KPiByZWZjb3VudCBlcnJvciBpbiBkZWxfbXRkX2RldmljZSgp
IikpLg0KPg0KPiBDb21waWxlLXRlc3RlZCB3aXRoIGdjYy1wb3dlcnBjLWxpbnV4LWdudSBvbiBw
bWFjMzIgZGVmY29uZmlnOyBubw0KPiBoYXJkd2FyZSBhdmFpbGFibGUgZm9yIHJ1bnRpbWUgdGVz
dGluZy4NCj4NCj4gRml4ZXM6IDlmZDA0OTkyN2NjYiAoIm9mL2kyYzogR2VuZXJhbGl6ZSBPRiBz
dXBwb3J0IikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQXNzaXN0ZWQtYnk6IENs
YXVkZTpjbGF1ZGUtb3B1cy01DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBaaGVubG9uZyA8ZHJhZ29u
bGl1MjAxOEBnbWFpbC5jb20+DQoNCkkgZGlkIHdvbmRlciBpZiB0aGVyZSB3YXMgYSBiZXR0ZXIg
d2F5IG9mIGZpeGluZyB0aGlzIGdlbmVyaWNhbGx5IHNpbmNlIA0KaXQgYWZmZWN0cyBtdWx0aXBs
ZSBkcml2ZXJzIGUuZy4gZG9pbmcgdGhlIHB1dCBpbiBpMmNfZGVsX2FkYXB0ZXIoKSwgDQphZGRp
bmcgYSBkZXZtXyBmdW5jdGlvbiB0aGFuIGRlYWxzIHdpdGggdGhlIHJlZmVyZW5jZSBvciBqdXN0
IG5vdCANCmFjcXVpcmluZyB0aGUgcmVmZXJlbmNlICh3aGljaCBzZWVtcyB0byBiZSB3aGF0IFNQ
SSBkb2VzKS4NCg0KUmVnYXJkbGVzcyBmb3IgYW4gb2xkZXIgZHJpdmVyIGxpa2UgaTJjLW1wYyB0
aGlzIGlzIHByb2JhYmx5IGEgbWluaW1hbGx5IA0Kc2FuZSBmaXguDQoNClJldmlld2VkLWJ5OiBD
aHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCj4gLS0t
DQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDYgKysrKystDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXBjLmMNCj4gaW5kZXggYTIxZmE0NWJkNjRjLi44MTgyZjdkYzNkMGYgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tcGMuYw0KPiBAQCAtODY3LDggKzg2NywxMCBAQCBzdGF0aWMgaW50IGZzbF9pMmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCWkyY19zZXRfYWRhcGRhdGEoJmky
Yy0+YWRhcCwgaTJjKTsNCj4gICANCj4gICAJcmVzdWx0ID0gaTJjX2FkZF9udW1iZXJlZF9hZGFw
dGVyKCZpMmMtPmFkYXApOw0KPiAtCWlmIChyZXN1bHQpDQo+ICsJaWYgKHJlc3VsdCkgew0KPiAr
CQlvZl9ub2RlX3B1dChpMmMtPmFkYXAuZGV2Lm9mX25vZGUpOw0KPiAgIAkJcmV0dXJuIHJlc3Vs
dDsNCj4gKwl9DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIH07DQo+IEBAIC04NzYsOCArODc4
LDEwIEBAIHN0YXRpYyBpbnQgZnNsX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpv
cCkNCj4gICBzdGF0aWMgdm9pZCBmc2xfaTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpvcCkNCj4gICB7DQo+ICAgCXN0cnVjdCBtcGNfaTJjICppMmMgPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShvcCk7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gaTJjLT5hZGFwLmRldi5v
Zl9ub2RlOw0KPiAgIA0KPiAgIAlpMmNfZGVsX2FkYXB0ZXIoJmkyYy0+YWRhcCk7DQo+ICsJb2Zf
bm9kZV9wdXQobm9kZSk7DQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIG1wY19pMmNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp

