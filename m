Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0250ECCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYqM551WXgRWcIxaDDOdYAjJq+79sGBmvMwwGursdzo=; b=n4YU0dBPnWXAc8RFnptr7FRaHi
	ZTr2WRk03QwAQyISY+YizmOrAOjXyR01T96JQrv35hfsNcpbvMFW07ODsDmzM7z9zV6YnBqX8Hb6s
	DjELDQPBJwGk65TtGc8aeRxZzOZhpLfs6AWHwsOLqb15VrC3GsTo/buRtE7/FDnKcADo4PItjVmLS
	M97QSaIXGZ7Pcw62lBTEgohBS206cJzu7QZ9tSy0KGF6SsS04+T8+hIOMvWkrxzgPfIXkFqg/kYZJ
	34MNmrIdEvwzNHuszRYBHWKgeeiQGX6oO6w0eAMMw7+BId5bCO4oe19/Fj2Tq9dIUiXoHfbQrZ+Oz
	ukIZOqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBGRE-00000000Hkv-0lxA;
	Tue, 21 Oct 2025 17:46:24 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBGRB-00000000HkL-0mtm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 17:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1761068781; x=1792604781;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=aYqM551WXgRWcIxaDDOdYAjJq+79sGBmvMwwGursdzo=;
  b=DoLEWCIKfBNJQ+jbTESsizDVtYDqenT0jIKhwLUqnsREZd6Pmk7SFOvI
   EM7jqxU6eiIklbTdl0fEUltDbNviUtDKC+YJtWD/+H8O8+mgxtgwhQX6h
   U9YJFe8lGwaQRGy6snISfyawHhoQXTN+uAV4lSpRWGl3lUW+WW9IFaM+M
   jg8ojZ8qWKBAIFPbPa+PWn1NERGeCBMND62zwS8XOyx7dwsTWcCMLfRCU
   w4fwtwQ+D188rziZSRGH3/l9RI7TGKQWlE11L02HIcmHBk/wGlQmLmVEC
   UsVUd8K0HiBy+Bv5OPCCErDRnLShjAz2l0NivfS3Fffnp06YibHyLdGoO
   w==;
X-CSE-ConnectionGUID: v8diPBoXTWOd3sF/Vw2+Xg==
X-CSE-MsgGUID: yjXNLWvyQoiOmCuQRMv8SQ==
X-IronPort-AV: E=Sophos;i="6.19,245,1754956800"; 
   d="scan'208";a="5228112"
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Thread-Topic: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:46:18 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:25913]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.196:2525] with esmtp (Farcaster)
 id e87fd396-6f95-4dbf-a220-ca3b6b5c9337; Tue, 21 Oct 2025 17:46:17 +0000 (UTC)
X-Farcaster-Flow-ID: e87fd396-6f95-4dbf-a220-ca3b6b5c9337
Received: from EX19D032UWA001.ant.amazon.com (10.13.139.62) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 17:46:17 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA001.ant.amazon.com (10.13.139.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 17:46:17 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.020; Tue, 21 Oct 2025 17:46:17 +0000
From: "Bandi, Ravi Kumar" <ravib@amazon.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "mani@kernel.org" <mani@kernel.org>, "thippeswamy.havalige@amd.com"
	<thippeswamy.havalige@amd.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Stefan Roese <stefan.roese@mailbox.org>, "Sean
 Anderson" <sean.anderson@linux.dev>
Thread-Index: AQHcKoFWBnk90o/gZUOv7QYU+iHxwrTNCbqAgAAGagA=
Date: Tue, 21 Oct 2025 17:46:17 +0000
Message-ID: <AB5963BB-A896-4CFA-AF27-31164705DF5A@amazon.com>
References: <20251021172309.GA1198438@bhelgaas>
In-Reply-To: <20251021172309.GA1198438@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.119.72.239]
Content-Type: text/plain; charset="utf-8"
Content-ID: <20ED62179285C540AE886CB28A73D7D2@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_104621_295071_F60AE05E 
X-CRM114-Status: GOOD (  19.47  )
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

DQo+IE9uIE9jdCAyMSwgMjAyNSwgYXQgMTA6MjPigK9BTSwgQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fh
c0BrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IFsrY2MgU3RlZmFuLCBTZWFu
XQ0KPiANCj4gT24gU2F0LCBTZXAgMjAsIDIwMjUgYXQgMTA6NTI6MzJQTSArMDAwMCwgUmF2aSBL
dW1hciBCYW5kaSB3cm90ZToNCj4+IFRoZSBwY2llLXhpbGlueC1kbWEtcGwgZHJpdmVyIGRvZXMg
bm90IGVuYWJsZSBJTlR4IGludGVycnVwdHMNCj4+IGFmdGVyIGluaXRpYWxpemluZyB0aGUgcG9y
dCwgcHJldmVudGluZyBJTlR4IGludGVycnVwdHMgZnJvbQ0KPj4gUENJZSBlbmRwb2ludHMgZnJv
bSBmbG93aW5nIHRocm91Z2ggdGhlIFhpbGlueCBYRE1BIHJvb3QgcG9ydA0KPj4gYnJpZGdlLiBU
aGlzIGlzc3VlIGFmZmVjdHMga2VybmVsIDYuNi4wIGFuZCBsYXRlciB2ZXJzaW9ucy4NCj4+IA0K
Pj4gVGhpcyBwYXRjaCBhbGxvd3MgSU5UeCBpbnRlcnJ1cHRzIGdlbmVyYXRlZCBieSBQQ0llIGVu
ZHBvaW50cw0KPj4gdG8gZmxvdyB0aHJvdWdoIHRoZSByb290IHBvcnQuIFRlc3RlZCB0aGUgZml4
IG9uIGEgYm9hcmQgd2l0aA0KPj4gdHdvIGVuZHBvaW50cyBnZW5lcmF0aW5nIElOVHggaW50ZXJy
dXB0cy4gSW50ZXJydXB0cyBhcmUNCj4+IHByb3Blcmx5IGRldGVjdGVkIGFuZCBzZXJ2aWNlZC4g
VGhlIC9wcm9jL2ludGVycnVwdHMgb3V0cHV0DQo+PiBzaG93czoNCj4+IA0KPj4gWy4uLl0NCj4+
IDMyOiAgICAgICAgMzIwICAgICAgICAgIDAgIHBsX2RtYTpSQy1FdmVudCAgMTYgTGV2ZWwgICAg
IDQwMDAwMDAwMC5heGktcGNpZSwgYXpkcnYNCj4+IDUyOiAgICAgICAgNDcwICAgICAgICAgIDAg
IHBsX2RtYTpSQy1FdmVudCAgMTYgTGV2ZWwgICAgIDUwMDAwMDAwMC5heGktcGNpZSwgYXpkcnYN
Cj4+IFsuLi5dDQo+PiANCj4+IENoYW5nZXMgc2luY2UgdjE6Og0KPj4gLSBGaXhlZCBjb21taXQg
bWVzc2FnZSBwZXIgcmV2aWV3ZXIncyBjb21tZW50cw0KPj4gDQo+PiBGaXhlczogOGQ3ODYxNDlk
NzhjICgiUENJOiB4aWxpbngteGRtYTogQWRkIFhpbGlueCBYRE1BIFJvb3QgUG9ydCBkcml2ZXIi
KQ0KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IFNpZ25lZC1vZmYtYnk6IFJhdmkg
S3VtYXIgQmFuZGkgPHJhdmliQGFtYXpvbi5jb20+DQo+IA0KPiBIaSBSYXZpLCBvYnZpb3VzbHkg
eW91IHRlc3RlZCB0aGlzLCBidXQgSSBkb24ndCBrbm93IGhvdyB0byByZWNvbmNpbGUNCj4gdGhp
cyB3aXRoIFN0ZWZhbidzIElOVHggZml4IGF0DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNTEwMjExNTQzMjIuOTczNjQwLTEtc3RlZmFuLnJvZXNlQG1haWxib3gub3JnDQo+IA0KPiBE
b2VzIFN0ZWZhbidzIGZpeCBuZWVkIHRvIGJlIHNxdWFzaGVkIGludG8gdGhpcyBwYXRjaD8NCg0K
SGkgQmpvcm4sDQoNClN1cmUsIHdlIGNhbiBzcXVhc2ggU3RlZmFu4oCZcyBmaXggaW50byB0aGlz
Lg0KDQpUaGFua3MNClJhdmkNCg0KPiANCj4+IC0tLQ0KPj4gZHJpdmVycy9wY2kvY29udHJvbGxl
ci9wY2llLXhpbGlueC1kbWEtcGwuYyB8IDYgKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUteGlsaW54LWRtYS1wbC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXhpbGlu
eC1kbWEtcGwuYw0KPj4gaW5kZXggYjAzN2M4ZjMxNWU0Li5jYzUzOTI5MmQxMGEgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUteGlsaW54LWRtYS1wbC5jDQo+PiAr
KysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUteGlsaW54LWRtYS1wbC5jDQo+PiBAQCAt
NjU5LDYgKzY1OSwxMiBAQCBzdGF0aWMgaW50IHhpbGlueF9wbF9kbWFfcGNpZV9zZXR1cF9pcnEo
c3RydWN0IHBsX2RtYV9wY2llICpwb3J0KQ0KPj4gICAgICAgICAgICAgIHJldHVybiBlcnI7DQo+
PiAgICAgIH0NCj4+IA0KPj4gKyAgICAgLyogRW5hYmxlIGludGVycnVwdHMgKi8NCj4+ICsgICAg
IHBjaWVfd3JpdGUocG9ydCwgWElMSU5YX1BDSUVfRE1BX0lNUl9BTExfTUFTSywNCj4+ICsgICAg
ICAgICAgICAgICAgWElMSU5YX1BDSUVfRE1BX1JFR19JTVIpOw0KPj4gKyAgICAgcGNpZV93cml0
ZShwb3J0LCBYSUxJTlhfUENJRV9ETUFfSURSTl9NQVNLLA0KPj4gKyAgICAgICAgICAgICAgICBY
SUxJTlhfUENJRV9ETUFfUkVHX0lEUk5fTUFTSyk7DQo+PiArDQo+PiAgICAgIHJldHVybiAwOw0K
Pj4gfQ0KPj4gDQo+PiAtLQ0KPj4gMi40Ny4zDQo+PiANCg0K

