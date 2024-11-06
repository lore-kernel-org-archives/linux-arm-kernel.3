Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118E5D59F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kci1woKxcuU8zna+ejYhzw1IeAp8nkCktOAQyR/1z4=; b=MpL/7uFLQjJDckEyKgDxd4E/yK
	9HBTZ3Od6WGFsM7vWtr/rS/Jb++Mik4klQc0/F+DUg5FO4LFcngMOiDSGsYiBZUaU0DgHYZOq/UiJ
	LHDbrnSID9qPEBbaosx6J3/2S5FUiUjlWIgTFYaQOUGsp1Li30gpc+HYWRFGqokPs+99522dkdg+c
	Z1XKjCHiGFeSqvKJl3W74MGFe41SmjIyGjGP6/cEwDeSPTip4VdhtvW6sQad8lvvZtnwX+TgLmaml
	DYeJMXVx7qqi3eY9AQyQ8ZltSZH1EOQ1fepziJZDmkqnwGPjNZfnhmGVdi+8QeRmbMXxWkXYlJStL
	qBC6rs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8k1d-00000004DG4-1zh3;
	Wed, 06 Nov 2024 17:41:01 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jzr-00000004Cxo-2IDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730914752; x=1762450752;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=8kci1woKxcuU8zna+ejYhzw1IeAp8nkCktOAQyR/1z4=;
  b=hG+wiIBA1RBtqxaOYPDV1ecvdJ7SuRmxba9RC4JrrW0KUUj/m6ydHbwN
   +ulkRm/XX0dNeQQHZguwPa9n4noVn5bVnlEgdpGPbdYta8cYm8nJniod9
   HVavz6mWJdJsy84PWBBNP8ODuc00vM4yn/RyFTV6VJak8X7KsAVSCLv4M
   8=;
X-IronPort-AV: E=Sophos;i="6.11,263,1725321600"; 
   d="scan'208";a="382940829"
Subject: Re: [PATCH 3/5] arm64: refactor delay() to enable polling for value
Thread-Topic: [PATCH 3/5] arm64: refactor delay() to enable polling for value
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:39:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:14779]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.195:2525] with esmtp (Farcaster)
 id 0e147bef-d664-4db1-81e7-192215fe6e62; Wed, 6 Nov 2024 17:38:55 +0000 (UTC)
X-Farcaster-Flow-ID: 0e147bef-d664-4db1-81e7-192215fe6e62
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 17:38:55 +0000
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 6 Nov 2024 17:38:55 +0000
Received: from EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2]) by
 EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2%7]) with mapi id
 15.02.1258.035; Wed, 6 Nov 2024 17:38:55 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "wanpengli@tencent.com"
	<wanpengli@tencent.com>, "cl@gentwo.org" <cl@gentwo.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "misono.tomohiro@fujitsu.com"
	<misono.tomohiro@fujitsu.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"lenb@kernel.org" <lenb@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "Okanovic, Haris" <harisokn@amazon.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mtosatti@redhat.com"
	<mtosatti@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
Thread-Index: AQHbL7EHko86fTfE7kuIbrTyhHlrvrKp+i8AgACL7gA=
Date: Wed, 6 Nov 2024 17:38:55 +0000
Message-ID: <3156dcdbddc9b1f692bc45adba0893bcc9b58035.camel@amazon.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
	 <20241105183041.1531976-1-harisokn@amazon.com>
	 <20241105183041.1531976-4-harisokn@amazon.com> <Zys0TAHZzqbGst93@arm.com>
In-Reply-To: <Zys0TAHZzqbGst93@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.141.28]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA38280D1CE6BB43BA5C6CB9D142F899@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_093911_662958_70F576D0 
X-CRM114-Status: GOOD (  14.49  )
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

T24gV2VkLCAyMDI0LTExLTA2IGF0IDA5OjE4ICswMDAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+IA0KPiANCj4gDQo+IE9uIFR1ZSwgTm92IDA1LCAyMDI0IGF0IDEyOjMwOjM5UE0gLTA2MDAs
IEhhcmlzIE9rYW5vdmljIHdyb3RlOg0KPiA+ICsgICAgICAgICAgICAgZG8gew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBjdXIgPSBfX1JFQURfT05DRV9FWCgqYWRkcik7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlmICgoY3VyICYgbWFzaykgPT0gdmFsKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0N
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgd2ZldChlbmQpOw0KPiANCj4gQ29uc3RydWN0cyBs
aWtlIHRoaXMgbmVlZCB0byBiZSBlbnRpcmVseSBpbiBhc3NlbWJseS4gVGhlIGNvbXBpbGVyIG1h
eQ0KPiBzcGlsbCAnY3VyJyBvbnRvIHRoZSBzdGFjayBhbmQgdGhlIHdyaXRlIGNvdWxkIGNsZWFy
IHRoZSBleGNsdXNpdmUNCj4gbW9uaXRvciB3aGljaCBtYWtlcyB0aGUgd2ZldCByZXR1cm4gaW1t
ZWRpYXRlbHkuIFRoYXQncyBoaWdobHkgQ1BVDQo+IGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGJ1
dCBpdCdzIHRoZSByZWFzb24gd2UgaGF2ZSBmdW5jdGlvbnMgbGlrZQ0KPiBfX2NtcHdhaXQoKSBp
biBhc3NlbWJseSAob3Igd2hhdGV2ZXIgZWxzZSBkZWFscyB3aXRoIGV4Y2x1c2l2ZXMpLiBJT1cs
DQo+IHdlIGNhbid0IGhhdmUgb3RoZXIgbWVtb3J5IGFjY2Vzc2VzIGJldHdlZW4gdGhlIExEWFIg
YW5kIHdoYXRldmVyIGlzDQo+IGNvbnN1bWluZyB0aGUgZXhjbHVzaXZlIG1vbml0b3IgYXJtZWQg
c3RhdGUgKHR5cGljYWxseSBTVFhSIGJ1dCBXRkUvV0ZFVA0KPiBjYW4gYmUgYW5vdGhlcikuDQoN
CkFncmVlZCwgd2lsbCByZXdyaXRlIHBhcnRzIG9mIGRlbGF5KCkgaW4gYXNtLg0KDQo+IA0KPiAt
LQ0KPiBDYXRhbGluDQoNCg==

