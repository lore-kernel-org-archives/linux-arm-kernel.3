Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBDFCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 22:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3a1SsYh9uMBLXpEutb5l2RGyNz0DWB6z1QkTKc1HTZo=; b=io2L2r1qBC/HEWqrdIxv95Ixiu
	M2eOLbwYTVbfICwrXfzpiyIB6XyZPr5mGF5l6dAjbUML8EU0dVdtYa7BlgpvWupZ/Im3mjGeFSXr7
	+wC1+92n5h5IUjZ0qdnZnEAbA/NxfFgHyRILKXeC+rA91LScpIioTvFXJfR9SL+HRPaWGhCdznbvs
	MH56M9GIsPF4rNEoPCAkcPiM+ZiJjmx4sjtN+ZuOoX8u98SR8BrnULdszA5BuV1FuyFQldfu7FxY4
	e5I67qvrvwCcKGeM5dGyc4VchgA+cr4Sp/pTqh/Fwo38lPLRy7q9zwy0/Hr72U4ncRYlqC0CYzlVE
	PISykbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06FA-000000061E1-0FuZ;
	Sat, 20 Sep 2025 22:39:48 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06F7-000000061DW-2tdx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 22:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758407985; x=1789943985;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=3a1SsYh9uMBLXpEutb5l2RGyNz0DWB6z1QkTKc1HTZo=;
  b=pPfxLJgRjXFVCsGuqTFlnHmOuc+/og5WftrVSHthd6H1xOfT6FFZM3Py
   tzO5I0TSNuPBUxtpYUdH6z+aXJ51slYKAGoA6wTLfdjxyDWoaNWbSrJEM
   FcebRhXRxmDz/d3KKaAb+aXlbifPcZTAfNNVEYEInSLsPP7sfCE9wflYQ
   0Urz4YlYag2P1TipJvUXNps0vc+IniJ00DIkZpS0uO8yEv4hN8XXKTH2l
   xdifUjX43FM/DhyCa76EkeijLCLMPoE6IYmFMcTSCL0VIxiX8Ghe95fC1
   CADqp253U9jWQQCgINzne66FsCxd/vRTt+AzLHeZgJtKSrN8lqfe+kDvr
   A==;
X-CSE-ConnectionGUID: GBDImWXqTeOeO0/tZEZN/g==
X-CSE-MsgGUID: NuHHHRL+STyTscmtqd2ZSQ==
X-IronPort-AV: E=Sophos;i="6.18,281,1751241600"; 
   d="scan'208";a="3244153"
Subject: Re: [PATCH] PCI: xilinx-xdma: Enable legacy interrupts
Thread-Topic: [PATCH] PCI: xilinx-xdma: Enable legacy interrupts
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 22:39:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:61299]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.110:2525] with esmtp (Farcaster)
 id 23c1ffd4-2ce3-4e70-8b70-02ad243df737; Sat, 20 Sep 2025 22:39:43 +0000 (UTC)
X-Farcaster-Flow-ID: 23c1ffd4-2ce3-4e70-8b70-02ad243df737
Received: from EX19D032UWA004.ant.amazon.com (10.13.139.56) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 20 Sep 2025 22:39:43 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA004.ant.amazon.com (10.13.139.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 20 Sep 2025 22:39:43 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.020; Sat, 20 Sep 2025 22:39:43 +0000
From: "Bandi, Ravi Kumar" <ravib@amazon.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Thread-Index: AQHcKkZ7CT5uBPbZrkSRzox+cc3ml7ScqlAA
Date: Sat, 20 Sep 2025 22:39:42 +0000
Message-ID: <C47CF283-C0C4-4ACF-BE07-3E87153D6EC6@amazon.com>
References: <20250919231330.886-1-ravib@amazon.com>
 <472oclxowztq4zfvtqjdrn4whe2hpcecgmgmsrkw2gwfuvac7r@xrgouxxp3qva>
In-Reply-To: <472oclxowztq4zfvtqjdrn4whe2hpcecgmgmsrkw2gwfuvac7r@xrgouxxp3qva>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.100.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0C24B00BA1D574FBB32E7AAF46C9175@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_153945_826469_793459BB 
X-CRM114-Status: GOOD (  22.12  )
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

SGVsbG8gTWFuaSwNCg0KVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLg0KDQo+IE9uIFNl
cCAyMCwgMjAyNSwgYXQgODo1MeKAr0FNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJv
bSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0
aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBPbiBGcmksIFNlcCAxOSwgMjAyNSBh
dCAxMToxMzozMFBNICswMDAwLCBSYXZpIEt1bWFyIEJhbmRpIHdyb3RlOg0KPiANCj4gKyBUaGlw
cGVzd2FteSAoYXV0aG9yIG9yIDhkNzg2MTQ5ZDc4YykNCg0KVGhhbmtzIGZvciBhZGRpbmcuDQoN
Cj4gDQo+PiBTdGFydGluZyB3aXRoIGtlcm5lbCA2LjYuMCwgbGVnYWN5IGludGVycnVwdHMgZnJv
bSBQQ0llIGVuZHBvaW50cw0KPj4gZG8gbm90IGZsb3cgdGhyb3VnaCB0aGUgWGlsaW54IFhETUEg
cm9vdCBwb3J0IGJyaWRnZSBiZWNhdXNlDQo+PiBpbnRlcnJ1cHRzIGFyZSBub3QgZW5hYmxlZCBh
ZnRlciBpbml0aWFsaXppbmcgdGhlIHBvcnQuDQo+PiANCj4+IFRoaXMgaXNzdWUgaXMgc2VlbiBh
ZnRlciBYRE1BIGRyaXZlciByZWNlaXZlZCBzdXBwb3J0IGZvciBRRE1BIGFuZA0KPj4gdW5kZXJ3
ZW50IHJlbGV2YW50IGNvZGUgcmVzdHJ1Y3R1cmluZyBvZiBvbGQgeGRtYS1wbCBkcml2ZXIgdG8N
Cj4+IHhpbGlueC1kbWEtcGwgKHJlZiBjb21taXQ6IDhkNzg2MTQ5ZDc4YykuDQo+PiANCj4gDQo+
IFRoZSBhYm92ZSBtZW50aW9uZWQgY29tbW1pdCBhZGRlZCBhIG5ldyBkcml2ZXIuIFNvIEkgZG9u
J3Qgc2VlIHdoZW4gdGhlIGRyaXZlcg0KPiByZXN0cnVjdHVyaW5nIGhhcHBlbmVkLg0KDQpBY2su
IEnigJl2ZSB1cGRhdGVkIHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgdjIuDQoNCj4gDQo+PiBU
aGlzIHBhdGNoIHJlLWVuYWJsZXMgbGVnYWN5IGludGVycnVwdHMgdG8gdXNlIHdpdGggUENJZSBl
bmRwb2ludHMNCj4+IHdpdGggbGVnYWN5IGludGVycnVwdHMuDQo+IA0KPiBzL2xlZ2FjeS9JTlR4
LCBoZXJlIGFuZCBldmVyeXdoZXJlLg0KDQpBY2suIFRha2VuIGNhcmUgaW4gdjIuDQoNCj4gDQo+
PiBUZXN0ZWQgdGhlIGZpeCBvbiBhIGJvYXJkIHdpdGggdHdvIGVuZHBvaW50cw0KPj4gZ2VuZXJh
dGluZyBsZWdhY3kgaW50ZXJydXB0cy4gSW50ZXJydXB0cyBhcmUgcHJvcGVybHkgZGV0ZWN0ZWQg
YW5kDQo+PiBzZXJ2aWNlZC4gVGhlIC9wcm9jL2ludGVycnVwdHMgb3V0cHV0IHNob3dzOg0KPj4g
Wy4uLl0NCj4+IDMyOiAgICAgICAgMzIwICAgICAgICAgIDAgIHBsX2RtYTpSQy1FdmVudCAgMTYg
TGV2ZWwgICAgIDQwMDAwMDAwMC5heGktcGNpZSwgYXpkcnYNCj4+IDUyOiAgICAgICAgNDcwICAg
ICAgICAgIDAgIHBsX2RtYTpSQy1FdmVudCAgMTYgTGV2ZWwgICAgIDUwMDAwMDAwMC5heGktcGNp
ZSwgYXpkcnYNCj4+IFsuLi5dDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhdmkgS3VtYXIgQmFu
ZGkgPHJhdmliQGFtYXpvbi5jb20+DQo+IA0KPiBNaXNzaW5nIEZpeGVzIHRhZyBhbmQgeW91IHNo
b3VsZCBDQyBzdGFibGUgbGlzdCBmb3IgYmFja3BvcnRpbmcuDQoNCkFjay4gQWRkZWQgdGhlIHRh
ZyBhbmQgQ0PigJllZCBzdGFibGUgbGlzdCBpbiB2Mi4NCg0KSeKAmWxsIHN1Ym1pdCB2MiB3aXRo
IHRoZSBjb21tZW50cyBpbmNvcnBvcmF0ZWQsIHBsZWFzZSByZXZpZXcuDQoNClRoYW5rcywNClJh
dmkNCg0KPiANCj4gLSBNYW5pDQo+IA0KPj4gLS0tDQo+PiBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUteGlsaW54LWRtYS1wbC5jIHwgNiArKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS14aWxpbngtZG1hLXBsLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUteGlsaW54
LWRtYS1wbC5jDQo+PiBpbmRleCBiMDM3YzhmMzE1ZTQuLmNjNTM5MjkyZDEwYSAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngtZG1hLXBsLmMNCj4+ICsr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngtZG1hLXBsLmMNCj4+IEBAIC02
NTksNiArNjU5LDEyIEBAIHN0YXRpYyBpbnQgeGlsaW54X3BsX2RtYV9wY2llX3NldHVwX2lycShz
dHJ1Y3QgcGxfZG1hX3BjaWUgKnBvcnQpDQo+PiAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4+
ICAgICAgfQ0KPj4gDQo+PiArICAgICAvKiBFbmFibGUgaW50ZXJydXB0cyAqLw0KPj4gKyAgICAg
cGNpZV93cml0ZShwb3J0LCBYSUxJTlhfUENJRV9ETUFfSU1SX0FMTF9NQVNLLA0KPj4gKyAgICAg
ICAgICAgICAgICBYSUxJTlhfUENJRV9ETUFfUkVHX0lNUik7DQo+PiArICAgICBwY2llX3dyaXRl
KHBvcnQsIFhJTElOWF9QQ0lFX0RNQV9JRFJOX01BU0ssDQo+PiArICAgICAgICAgICAgICAgIFhJ
TElOWF9QQ0lFX0RNQV9SRUdfSURSTl9NQVNLKTsNCj4+ICsNCj4+ICAgICAgcmV0dXJuIDA7DQo+
PiB9DQo+PiANCj4+IC0tDQo+PiAyLjQ3LjMNCj4+IA0KPiANCj4gLS0NCj4g4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQ0KDQo=

