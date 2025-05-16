Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843DFC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVTFUL3/sdamu6Yw80e+M0lPL1Q8dZeoW9xf7flc+7g=; b=MZ1ueZ4JkoL9haQyYjbyyyXAh8
	OUASjFFAPMHhsFptuTHP+LylACmqjepduQy/8XLj5pd8LAEDu9ay9n+vADvyZl2hPK0IDW12M0NoX
	X5Q9R5t+uBMR9fKydZh2pebEBU6xNywodFOw7TLnfETSAVbiEE+/ShpyIhsW2VTefJz8/vvG7wrQh
	AR2DllE53FU+2xmfvqcLDmbzOPR5ZidEgOTgVjfEFKsSZEWz/wAeXAPFEIWJ79WkR5ZvUBbA53F0+
	Q40IIdbJ7/eXwb7T1dd+ZdnKeRKxWWpQ4Iy6V7tds/kW1RMG1Z0JhnOodaPR9vyP9yJaF5SoinJr4
	i4Hh19bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3wT-00000004n4v-3OWA;
	Fri, 16 May 2025 22:54:13 +0000
Received: from smtp-fw-80009.amazon.com ([99.78.197.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3tO-00000004mlb-0cqC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 22:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1747435862; x=1778971862;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=VVTFUL3/sdamu6Yw80e+M0lPL1Q8dZeoW9xf7flc+7g=;
  b=H08vCJlVLTPHvdn3J2m6EDNnBIPY+JKyBHT4P/obXLT7INXD5oenO6HR
   +D9jx2mhmCz8zB9X/gfLE9mZBcG5GNKIYHSiEyLYlK5oPHitsYzfLpZjQ
   T/v5m1CLTfTk/Sb9v0iTByV4Rb9jhnGSlriZfH6V8kiKv9ViDHcIYUzcC
   XSmUoQmYyEHacZN5531z1lQJQbIBdFU9F0q/t+DjT7xtoPVR0G5QBlRpI
   CUYfy2jTGaNMdaqbP1aeNne72n6nyvXQTfa6DGnFMYnBn1DSUCmWCKLWR
   /WIhJQsmFzKXIpph/Msc/3/bxg1+4Uqa0nyCiqIJJtCM9Dz3ujK647lRP
   A==;
X-IronPort-AV: E=Sophos;i="6.15,295,1739836800"; 
   d="scan'208";a="201519801"
Subject: Re: [PATCH v2 0/7] barrier: introduce smp_cond_load_*_timewait()
Thread-Topic: [PATCH v2 0/7] barrier: introduce smp_cond_load_*_timewait()
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 22:50:59 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:28410]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.48:2525] with esmtp (Farcaster)
 id 38d39ad3-95e3-45b6-9e35-61003d47fbe0; Fri, 16 May 2025 22:50:59 +0000 (UTC)
X-Farcaster-Flow-ID: 38d39ad3-95e3-45b6-9e35-61003d47fbe0
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 16 May 2025 22:50:59 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA003.ant.amazon.com (10.13.139.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 16 May 2025 22:50:58 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.1544.014; Fri, 16 May 2025 22:50:58 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "ankur.a.arora@oracle.com"
	<ankur.a.arora@oracle.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
CC: "Okanovic, Haris" <harisokn@amazon.com>, "cl@gentwo.org" <cl@gentwo.org>,
	"joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "memxor@gmail.com" <memxor@gmail.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "arnd@arndb.de"
	<arnd@arndb.de>, "will@kernel.org" <will@kernel.org>,
	"zhenglifeng1@huawei.com" <zhenglifeng1@huawei.com>, "ast@kernel.org"
	<ast@kernel.org>, "xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Thread-Index: AQHbuz+cxpKBz2anx0u9qNeR4bJQyLPV83oA
Date: Fri, 16 May 2025 22:50:58 +0000
Message-ID: <f2f5d09e79539754ced085ed89865787fa668695.camel@amazon.com>
References: <20250502085223.1316925-1-ankur.a.arora@oracle.com>
In-Reply-To: <20250502085223.1316925-1-ankur.a.arora@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.178.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC7C43713E6CDE4AAA2FDB9724878F44@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_155102_239415_2C0B36B6 
X-CRM114-Status: GOOD (  33.76  )
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

T24gRnJpLCAyMDI1LTA1LTAyIGF0IDAxOjUyIC0wNzAwLCBBbmt1ciBBcm9yYSB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gSGksDQo+IA0KPiBUaGlzIHNlcmllcyBhZGRzIHdhaXRlZCB2YXJpYW50cyBv
ZiB0aGUgc21wX2NvbmRfbG9hZCgpIHByaW1pdGl2ZXM6DQo+IHNtcF9jb25kX2xvYWRfcmVsYXhl
ZF90aW1ld2FpdCgpLCBhbmQgc21wX2NvbmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KCkuDQo+IA0K
PiBUaGVyZSBhcmUgdHdvIGtub3duIHVzZXJzIGZvciB0aGVzZSBpbnRlcmZhY2VzOg0KPiANCj4g
IC0gcG9sbF9pZGxlKCkgWzFdDQo+ICAtIHJlc2lsaWVudCBxdWV1ZWQgc3BpbmxvY2tzIFsyXQ0K
PiANCj4gRm9yIGJvdGggb2YgdGhlc2UgY2FzZXMgd2Ugd2FudCB0byB3YWl0IG9uIGEgY29uZGl0
aW9uIGJ1dCBhbHNvIHdhbnQNCj4gdG8gdGVybWluYXRlIHRoZSB3YWl0IGJhc2VkIG9uIGEgdGlt
ZW91dC4NCj4gDQo+IEJlZm9yZSBkZXNjcmliaW5nIGhvdyB2MiBpbXBsZW1lbnRzIHRoZXNlIGlu
dGVyZmFjZXMsIGxldCBtZSByZWNhcCB0aGUNCj4gcHJvYmxlbXMgaW4gdjEgKENhdGFsaW4gb3V0
bGluZWQgbW9zdCBvZiB0aGVzZSBpbiBbM10pOg0KPiANCj4gc21wX2NvbmRfbG9hZF9yZWxheGVk
X3NwaW53YWl0KHB0ciwgY29uZF9leHByLCB0aW1lX2V4cHJfbnMsIHRpbWVfbGltaXRfbnMpDQo+
IHRvb2sgZm91ciBhcmd1bWVudHMsIHdpdGggcHRyIGFuZCBjb25kX2V4cHIgZG9pbmcgdGhlIHVz
dWFsIHNtcF9jb25kX2xvYWQoKQ0KPiB0aGluZ3MgYW5kIHRpbWVfZXhwcl9ucyBhbmQgdGltZV9s
aW1pdF9ucyBiZWluZyB1c2VkIHRvIGRlY2lkZSB0aGUNCj4gdGVybWluYXRpbmcgY29uZGl0aW9u
Lg0KPiANCj4gVGhlcmUgd2VyZSBzb21lIHByb2JsZW1zIGluIHRoZSB0aW1la2VlcGluZzoNCj4g
DQo+IDEuIEhvdyBvZnRlbiBkbyB3ZSBkbyB0aGUgKHJlbGF0aXZlbHkgZXhwZW5zaXZlKSB0aW1l
LWNoZWNrPw0KPiANCj4gICAgVGhlIGNob2ljZSBtYWRlIHdhcyBvbmNlIHZlcnkgMjAwIHNwaW4t
d2FpdCBpdGVyYXRpb25zLCB3aXRoIGVhY2gNCj4gICAgaXRlcmF0aW9uIHRyeWluZyB0byBpZGxl
IHRoZSBwaXBlbGluZSBieSBleGVjdXRpbmcgY3B1X3JlbGF4KCkuDQo+IA0KPiAgICBUaGUgY2hv
aWNlIG9mIDIwMCB3YXMsIG9mIGNvdXJzZSwgYXJiaXRyYXJ5IGFuZCBzb21ld2hhdCBtZWFuaW5n
bGVzcw0KPiAgICBhY3Jvc3MgYXJjaGl0ZWN0dXJlcy4gT24gcmVjZW50IHg4NiwgY3B1X3JlbGF4
KCkvUEFVU0UgdGFrZXMgfjIwLTMwDQo+ICAgIGN5Y2xlcywgYnV0IG9uIChub24tU01UKSBhcm02
NCBjcHVfcmVsYXgoKS9ZSUVMRCBpcyBlZmZlY3RpdmVseQ0KPiAgICBqdXN0IGEgTk9QLg0KPiAN
Cj4gICAgRXZlbiBpZiBlYWNoIGFyY2hpdGVjdHVyZSBoYWQgaXRzIG93biBsaW1pdCwgdGhpcyB3
aWxsIGFsc28gdmFyeQ0KPiAgICBhY3Jvc3MgbWljcm9hcmNoaXRlY3R1cmVzLg0KPiANCj4gMi4g
T24gYXJtNjQsIHdoaWNoIGNhbiBkbyBiZXR0ZXIgdGhhbiBqdXN0IGNwdV9yZWxheCgpLCBmb3Ig
aW5zdGFuY2UsDQo+ICAgIGJ5IHdhaXRpbmcgZm9yIGEgc3RvcmUgb24gYW4gYWRkcmVzcyAoV0ZF
KSwgdGhlIGltcGxlbWVudGF0aW9uDQo+ICAgIGV4Y2x1c2l2ZWx5IHVzZWQgV0ZFLCB3aXRoIHRo
ZSBzcGluLXdhaXQgb25seSB1c2VkIGFzIGEgZmFsbGJhY2sNCj4gICAgZm9yIHdoZW4gdGhlIGV2
ZW50LXN0cmVhbSB3YXMgZGlzYWJsZWQuDQo+IA0KPiAgICBPbmUgcHJvYmxlbSB3aXRoIHRoaXMg
d2FzIHRoYXQgdGhlIHdvcnN0IGNhc2UgdGltZW91dCBvdmVyc2hvb3QNCj4gICAgd2l0aCBXRkUg
aXMgQVJDSF9USU1FUl9FVlRfU1RSRUFNX1BFUklPRF9VUyAoMTAwdXMpIGFuZCBzbyB0aGVyZSdz
DQo+ICAgIGEgdmFzdCBndWxmIGJldHdlZW4gdGhhdCBhbmQgYSBwb3RlbnRpYWxseSBtdWNoIHNt
YWxsZXIgZ3JhbnVsYXJpdHkNCj4gICAgd2l0aCB0aGUgc3Bpbi13YWl0IHZlcnNpb25zLiBJbiBh
ZGRpdGlvbiB0aGUgaW50ZXJmYWNlIHByb3ZpZGVkDQo+ICAgIG5vIHdheSBmb3IgdGhlIGNhbGxl
ciB0byBzcGVjaWZ5IG9yIGxpbWl0IHRoZSBvdmVzaG9vdC4NCj4gDQo+IE5vbi10aW1la2VlcGlu
ZyBpc3N1ZXM6DQo+IA0KPiAzLiBUaGUgaW50ZXJmYWNlIHdhcyB1c2VmdWwgZm9yIHBvbGxfaWRs
ZSgpIGxpa2UgdXNlcnMgYnV0IHdhcyBub3QNCj4gICAgdXNhYmxlIGlmIHRoZSBjYWxsZXIgbmVl
ZGVkIHRvIGRvIGFueSB3b3JrLiBGb3IgaW5zdGFuY2UsDQo+ICAgIHJxc3BpbmxvY2sgdXNlcyBp
dCB0aHVzOg0KPiANCj4gICAgICBzbXBfY29uZF9sb2FkX2FjcXVpcmVfdGltZXdhaXQodiwgYywg
MCwgMSkNCj4gDQo+ICAgIEhlcmUgdGhlIHRpbWUtY2hlY2sgYWx3YXlzIGV2YWx1YXRlcyB0byBm
YWxzZSBhbmQgYWxsIG9mIHRoZSBsb2dpYw0KPiAgICAoZXguIGRlYWRsb2NrIGNoZWNraW5nKSBp
cyBmb2xkZWQgaW50byB0aGUgY29uZGl0aW9uYWwuDQo+IA0KPiANCj4gV2l0aCB0aGF0IGZvdW5k
YXRpb24sIHRoZSBuZXcgaW50ZXJmYWNlIGlzOg0KPiANCj4gICAgc21wX2NvbmRfbG9hZF9yZWxh
eGVkX3RpbWV3YWl0KHB0ciwgY29uZF9leHByLCB3YWl0X3BvbGljeSwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lX2V4cHIsIHRpbWVfZW5kKQ0KPiANCj4g
VGhlIGFkZGVkIHBhcmFtZXRlciwgd2FpdF9wb2xpY3kgcHJvdmlkZXMgYSBtZWNoYW5pc20gZm9y
IHRoZSBjYWxsZXINCj4gdG8gYXBwb3J0aW9uIHRpbWUgc3BlbnQgc3Bpbm5pbmcgb3IsIHdoZXJl
IHN1cHBvcnRlZCwgaW4gYSB3YWl0Lg0KPiBUaGlzIGlzIHNvbWV3aGF0IGluc3BpcmVkIGZyb20g
dGhlIHF1ZXVlX3BvbGwoKSBtZWNoYW5pc20gdXNlZA0KPiB3aXRoIHNtcF9jb25kX2xvYWQoKSBp
biBhcm0tc21tdS12MyBbNF0uDQo+IA0KPiBJdCBhZGRyZXNzZXMgKDEpIGJ5IGRlY2lkaW5nIHRo
ZSB0aW1lLWNoZWNrIGdyYW51bGFyaXR5IGJhc2VkIG9uIGENCj4gdGltZSBpbnRlcnZhbCBpbnN0
ZWFkIG9mIHNwaW5uaW5nIGZvciBhIGZpeGVkIG51bWJlciBvZiBpdGVyYXRpb25zLg0KPiANCj4g
KDIpIGlzIGFkZHJlc3NlZCBieSB0aGUgd2FpdF9wb2xpY3kgYWxsb3dpbmcgZm9yIGRpZmZlcmVu
dCBzbGFjaw0KPiB2YWx1ZXMuIFRoZSBpbXBsZW1lbnRlZCB2ZXJzaW9ucyBvZiB3YWl0X3BvbGlj
eSBhbGxvdyBmb3IgYSBjb2Fyc2UNCj4gb3IgYSBmaW5lIGdyYWluZWQgc2xhY2suIEEgdXNlciBk
ZWZpbmVkIHdhaXRfcG9saWN5IGNvdWxkIGNob29zZQ0KPiBpdHMgb3duIHdhaXQgcGFyYW1ldGVy
LiBUaGlzIHdvdWxkIGFsc28gYWRkcmVzcyAoMykuDQo+IA0KPiANCj4gV2l0aCB0aGF0LCBwYXRj
aGVzIDEtNSwgYWRkIHRoZSBnZW5lcmljIGFuZCBhcm02NCBsb2dpYzoNCj4gDQo+ICAgImFzbS1n
ZW5lcmljOiBiYXJyaWVyOiBhZGQgc21wX2NvbmRfbG9hZF9yZWxheGVkX3RpbWV3YWl0KCkiLA0K
PiAgICJhc20tZ2VuZXJpYzogYmFycmllcjogYWRkIHdhaXRfcG9saWN5IGhhbmRsZXJzIg0KPiAN
Cj4gICAiYXJtNjQ6IGJhcnJpZXI6IGVuYWJsZSB3YWl0aW5nIGluIHNtcF9jb25kX2xvYWRfcmVs
YXhlZF90aW1ld2FpdCgpIg0KPiAgICJhcm02NDogYmFycmllcjogYWRkIGNvYXJzZSB3YWl0IGZv
ciBzbXBfY29uZF9sb2FkX3JlbGF4ZWRfdGltZXdhaXQoKSINCj4gICAiYXJtNjQ6IGJhcnJpZXI6
IGFkZCBmaW5lIHdhaXQgZm9yIHNtcF9jb25kX2xvYWRfcmVsYXhlZF90aW1ld2FpdCgpIi4NCj4g
DQo+IEFuZCwgcGF0Y2ggNiwgYWRkcyB0aGUgYWNxdWlyZSB2YXJpYW50Og0KPiANCj4gICAiYXNt
LWdlbmVyaWM6IGJhcnJpZXI6IGFkZCBzbXBfY29uZF9sb2FkX2FjcXVpcmVfdGltZXdhaXQoKSIN
Cj4gDQo+IEFuZCwgZmluYWxseSBwYXRjaCA3IGxheXMgb3V0IGhvdyB0aGlzIGNvdWxkIGJlIHVz
ZWQgZm9yIHJxc3BpbmxvY2s6DQo+IA0KPiAgICJicGY6IHJxc3BpbmxvY2s6IGFkZCBycXNwaW5s
b2NrIHBvbGljeSBoYW5kbGVyIGZvciBhcm02NCIuDQo+IA0KPiBBbnkgY29tbWVudHMgYXBwcmVj
aWF0ZWQhDQo+IA0KPiBBbmt1cg0KPiANCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjQxMTA3MTkwODE4LjUyMjYzOS0zLWFua3VyLmEuYXJvcmFAb3JhY2xlLmNvbS8N
Cj4gWzJdIFVzZXMgdGhlIHNtcF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdCgpIGZyb20gdjEN
Cj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcnFzcGlubG9jay5o
DQo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1o4ZFJhbGZ4WWNKSWNMR2pAYXJt
LmNvbS8NCj4gWzRdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYz
L2FybS1zbW11LXYzLmMjbjIyMw0KPiANCj4gDQo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPg0KPiBDYzogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4NCj4gQ2M6IENhdGFs
aW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IENjOiBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+DQo+IENjOiBLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSA8
bWVteG9yQGdtYWlsLmNvbT4NCj4gQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtlcm5lbC5v
cmc+DQo+IENjOiBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZw0KPiANCj4gDQo+IEFua3VyIEFy
b3JhICg3KToNCj4gICBhc20tZ2VuZXJpYzogYmFycmllcjogYWRkIHNtcF9jb25kX2xvYWRfcmVs
YXhlZF90aW1ld2FpdCgpDQo+ICAgYXNtLWdlbmVyaWM6IGJhcnJpZXI6IGFkZCB3YWl0X3BvbGlj
eSBoYW5kbGVycw0KPiAgIGFybTY0OiBiYXJyaWVyOiBlbmFibGUgd2FpdGluZyBpbiBzbXBfY29u
ZF9sb2FkX3JlbGF4ZWRfdGltZXdhaXQoKQ0KPiAgIGFybTY0OiBiYXJyaWVyOiBhZGQgY29hcnNl
IHdhaXQgZm9yIHNtcF9jb25kX2xvYWRfcmVsYXhlZF90aW1ld2FpdCgpDQo+ICAgYXJtNjQ6IGJh
cnJpZXI6IGFkZCBmaW5lIHdhaXQgZm9yIHNtcF9jb25kX2xvYWRfcmVsYXhlZF90aW1ld2FpdCgp
DQo+ICAgYXNtLWdlbmVyaWM6IGJhcnJpZXI6IGFkZCBzbXBfY29uZF9sb2FkX2FjcXVpcmVfdGlt
ZXdhaXQoKQ0KPiAgIGJwZjogcnFzcGlubG9jazogYWRkIHJxc3BpbmxvY2sgcG9saWN5IGhhbmRs
ZXIgZm9yIGFybTY0DQo+IA0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYXJyaWVyLmggICAg
fCAgODIgKysrKysrKysrKysrKysrDQo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Jxc3Bpbmxv
Y2suaCB8ICA5NiArKysrLS0tLS0tLS0tLS0tLS0NCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvYmFy
cmllci5oICAgICAgIHwgMTUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMjUxIGluc2VydGlvbnMoKyksIDc3IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0N
Cj4gMi40My41DQo+IA0KDQpUZXN0ZWQgb24gQVdTIEdyYXZpdG9uIChBUk02NCBOZW92ZXJzZSBW
MSkgd2l0aCB5b3VyIFYxMCBoYWx0cG9sbA0KY2hhbmdlcywgYXRvcCBtYXN0ZXIgODNhODk2NTQ5
Zi4NCg0KUmV2aWV3ZWQtYnk6IEhhcmlzIE9rYW5vdmljIDxoYXJpc29rbkBhbWF6b24uY29tPg0K
VGVzdGVkLWJ5OiBIYXJpcyBPa2Fub3ZpYyA8aGFyaXNva25AYW1hem9uLmNvbT4NCg0KUmVnYXJk
cywNCkhhcmlzIE9rYW5vdmljDQpBV1MgR3Jhdml0b24gU29mdHdhcmUNCg0K

