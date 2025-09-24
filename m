Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88571CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL5K5vqLXDjohbzGu1q9kXasuqJsPhJHn3iFihsVwYQ=; b=idgHU6PsUpmRtsE1kFGCHUytlP
	kxZwZ6jp3ZdCFUHsZrLcmQJY0l6K7NW8WgZdH4q5XKV3IrlQ8+hJ6N/ZBf+DpFYlTtNJFPJb28mND
	O7tAeH/gDddp/y+9i2VdcnC+Qe5tp2chHzqUyMkHMOnfT9pUhY3W8j3uTEgrSuklqPF5WSZc/0DT9
	29BiBGRNtDx0SgEv+XgWwMrRXZjaeaQRbfnSxom4RyGu/416KUg+OiHinyU6KZmMKeHMTyII1nWTi
	6Oxryocb5UIdvXeJ+Fk/MSi/i0PYErxAz6TiFqG0fUAPVVMGZ28UaAM06pf553D3AFCQzJOG/sv1R
	eW/JnDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1IlQ-0000000FdZi-0wrw;
	Wed, 24 Sep 2025 06:14:04 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1IlO-0000000FdZ9-10HF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 06:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758694442; x=1790230442;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oL5K5vqLXDjohbzGu1q9kXasuqJsPhJHn3iFihsVwYQ=;
  b=h0+UTrfOrNFuT3IynSBur2zjwRo/0hve48hVBMitEjcdP0QPgdrS5BAF
   HiTTv1WMQ/l4MmMvLkBztFGKbK1ENu6f1oGi3GNtjJf77ESrBjElgEtDv
   XXOnfeLBWhfkljzNJFxsWUAybNj4k6PzFJfNP+uaq2l5b6Gd8C/7XjS81
   K6/08EkyAfSYgyD7ZiADT7Tkms/fbjB1kRMzDdKNahznb0Div/khwKdda
   /TgUrBA7IWi9Z+IzNx2qjs1UDgahBLY0si/eda7PY3OsmP/eI9iR0lRpB
   xdw15JjJTUDIa8rka24IUNupkBTelu5BZ/r/yYhY4AlEOizEAhCm5vYvX
   Q==;
X-CSE-ConnectionGUID: zJCroIsQSdmcKOPQ2SVXNA==
X-CSE-MsgGUID: ER1XdZmMSJ+0IpSaHds0Rw==
X-IronPort-AV: E=Sophos;i="6.18,290,1751241600"; 
   d="scan'208";a="3645442"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 06:13:58 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:6491]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.168:2525] with esmtp (Farcaster)
 id 032be64e-1622-49e8-a2e4-203efa474f45; Wed, 24 Sep 2025 06:13:58 +0000 (UTC)
X-Farcaster-Flow-ID: 032be64e-1622-49e8-a2e4-203efa474f45
Received: from EX19D032UWA004.ant.amazon.com (10.13.139.56) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 24 Sep 2025 06:13:55 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA004.ant.amazon.com (10.13.139.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 24 Sep 2025 06:13:55 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.020; Wed, 24 Sep 2025 06:13:55 +0000
From: "Bandi, Ravi Kumar" <ravib@amazon.com>
To: "mani@kernel.org" <mani@kernel.org>, "thippeswamy.havalige@amd.com"
	<thippeswamy.havalige@amd.com>
CC: "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Thread-Topic: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Thread-Index: AQHcKoFWBnk90o/gZUOv7QYU+iHxwrSh38GA
Date: Wed, 24 Sep 2025 06:13:55 +0000
Message-ID: <AB21188C-0467-4378-AD3B-34093EC88AA9@amazon.com>
References: <C47CF283-C0C4-4ACF-BE07-3E87153D6EC6@amazon.com>
 <20250920225232.18757-1-ravib@amazon.com>
In-Reply-To: <20250920225232.18757-1-ravib@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.100.56]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F0679158EB19D4092812EA5536C56AD@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_231402_368358_EBD97D1B 
X-CRM114-Status: GOOD (  19.65  )
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

SGVsbG8gTWFuaSwgVGhpcHBlc3dhbXksDQoNCkEgZ2VudGxlIHJlbWluZGVyIHRvIHJldmlldyBw
YXRjaCB2Mi4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueSBhZGRpdGlvbmFsIGlu
Zm9ybWF0aW9uLiBUaGFua3MuDQoNClNpbmNlcmVseSwNClJhdmkNCg0KPiBPbiBTZXAgMjAsIDIw
MjUsIGF0IDM6NTLigK9QTSwgQmFuZGksIFJhdmkgS3VtYXIgPHJhdmliQGFtYXpvbi5jb20+IHdy
b3RlOg0KPiANCj4gVGhlIHBjaWUteGlsaW54LWRtYS1wbCBkcml2ZXIgZG9lcyBub3QgZW5hYmxl
IElOVHggaW50ZXJydXB0cw0KPiBhZnRlciBpbml0aWFsaXppbmcgdGhlIHBvcnQsIHByZXZlbnRp
bmcgSU5UeCBpbnRlcnJ1cHRzIGZyb20NCj4gUENJZSBlbmRwb2ludHMgZnJvbSBmbG93aW5nIHRo
cm91Z2ggdGhlIFhpbGlueCBYRE1BIHJvb3QgcG9ydA0KPiBicmlkZ2UuIFRoaXMgaXNzdWUgYWZm
ZWN0cyBrZXJuZWwgNi42LjAgYW5kIGxhdGVyIHZlcnNpb25zLg0KPiANCj4gVGhpcyBwYXRjaCBh
bGxvd3MgSU5UeCBpbnRlcnJ1cHRzIGdlbmVyYXRlZCBieSBQQ0llIGVuZHBvaW50cw0KPiB0byBm
bG93IHRocm91Z2ggdGhlIHJvb3QgcG9ydC4gVGVzdGVkIHRoZSBmaXggb24gYSBib2FyZCB3aXRo
DQo+IHR3byBlbmRwb2ludHMgZ2VuZXJhdGluZyBJTlR4IGludGVycnVwdHMuIEludGVycnVwdHMg
YXJlDQo+IHByb3Blcmx5IGRldGVjdGVkIGFuZCBzZXJ2aWNlZC4gVGhlIC9wcm9jL2ludGVycnVw
dHMgb3V0cHV0DQo+IHNob3dzOg0KPiANCj4gWy4uLl0NCj4gMzI6ICAgICAgICAzMjAgICAgICAg
ICAgMCAgcGxfZG1hOlJDLUV2ZW50ICAxNiBMZXZlbCAgICAgNDAwMDAwMDAwLmF4aS1wY2llLCBh
emRydg0KPiA1MjogICAgICAgIDQ3MCAgICAgICAgICAwICBwbF9kbWE6UkMtRXZlbnQgIDE2IExl
dmVsICAgICA1MDAwMDAwMDAuYXhpLXBjaWUsIGF6ZHJ2DQo+IFsuLi5dDQo+IA0KPiBDaGFuZ2Vz
IHNpbmNlIHYxOjoNCj4gLSBGaXhlZCBjb21taXQgbWVzc2FnZSBwZXIgcmV2aWV3ZXIncyBjb21t
ZW50cw0KPiANCj4gRml4ZXM6IDhkNzg2MTQ5ZDc4YyAoIlBDSTogeGlsaW54LXhkbWE6IEFkZCBY
aWxpbnggWERNQSBSb290IFBvcnQgZHJpdmVyIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gU2lnbmVkLW9mZi1ieTogUmF2aSBLdW1hciBCYW5kaSA8cmF2aWJAYW1hem9uLmNvbT4N
Cj4gLS0tDQo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngtZG1hLXBsLmMgfCA2
ICsrKysrKw0KPiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXhpbGlueC1kbWEtcGwuYyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngtZG1hLXBsLmMNCj4gaW5kZXggYjAzN2M4ZjMx
NWU0Li5jYzUzOTI5MmQxMGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS14aWxpbngtZG1hLXBsLmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LXhpbGlueC1kbWEtcGwuYw0KPiBAQCAtNjU5LDYgKzY1OSwxMiBAQCBzdGF0aWMgaW50IHhpbGlu
eF9wbF9kbWFfcGNpZV9zZXR1cF9pcnEoc3RydWN0IHBsX2RtYV9wY2llICpwb3J0KQ0KPiAJCXJl
dHVybiBlcnI7DQo+IAl9DQo+IA0KPiArCS8qIEVuYWJsZSBpbnRlcnJ1cHRzICovDQo+ICsJcGNp
ZV93cml0ZShwb3J0LCBYSUxJTlhfUENJRV9ETUFfSU1SX0FMTF9NQVNLLA0KPiArCQkgICBYSUxJ
TlhfUENJRV9ETUFfUkVHX0lNUik7DQo+ICsJcGNpZV93cml0ZShwb3J0LCBYSUxJTlhfUENJRV9E
TUFfSURSTl9NQVNLLA0KPiArCQkgICBYSUxJTlhfUENJRV9ETUFfUkVHX0lEUk5fTUFTSyk7DQo+
ICsNCj4gCXJldHVybiAwOw0KPiB9DQo+IA0KPiAtLSANCj4gMi40Ny4zDQo+IA0KDQo=

