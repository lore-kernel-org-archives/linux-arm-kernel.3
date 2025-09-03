Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Shk7aP7NdVdTxePF1n5l+uKN9YxwBMJp3bE/HqRzo1U=; b=nMmBqwJOHBbvEgrZD1s6sfMQHX
	NkiwVGpZi/n1CFAXPLYDTUzD4W4onnWDcEknXBtFUVdJ4OmxBQB+9y8cxRQQO9W+eZw4mCOKSgB4G
	Paj8hSrghLisuwDiBQ6L/kt1QjD2oDFCbMpSIg65WIhi9ccS3h42t7fhEWYltFaNvq/OP/RgDWMbZ
	sEePxu/i1VAuvzO3vW2rE+bvRsPGlVhSAIkJMPGTZ73yLdGd7Y7RttdtDU7g3fOGj110x2UTsrN6f
	b0a7oZyEuHWTzAzhz9og2D4jrOHFqAC/FsZe4yqrvWc8zmdBikrSaufezJkpC3TMfUShopNe7AJZ6
	CWKvc5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttjw-00000007XBM-0buY;
	Wed, 03 Sep 2025 20:05:56 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpqn-00000006zI7-22Vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1756915005; x=1788451005;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=Shk7aP7NdVdTxePF1n5l+uKN9YxwBMJp3bE/HqRzo1U=;
  b=jYY0yHcWQGUX4ldNv9zGa2hwqixp+cYDcyuGaJdscOcRboRsHH9to3hV
   9F1c7NaWAYcLB0K73cEbtYLT13tWD+OLKH3qezvOIu42EV13W17587shO
   /QKXvrT9AWAtDIPt3XOrEt/zVvr8Pf8jJjWXDDQIaqX2H1Tc+uDJwX71W
   KiKEvoaMzEqOQLw+vKbKNBhCK2K0mTlGTYxXbzBQccJXmBdk7/NA+6vnz
   FIRwXMotSP7eS8stzk5meKq5mVSQiErbg4y+j+yR+aenmRt+EtTZHp9Fi
   zMXv2SbmgkfxOyEo+Uu6kgYa/zwIPdim7E70RsTWyNFQXuGzsJM5BFCaQ
   g==;
X-CSE-ConnectionGUID: QiOcNpiNSHuG08I7kgtVrw==
X-CSE-MsgGUID: efa5nN+GQgSifqLXSQNwvw==
X-IronPort-AV: E=Sophos;i="6.18,236,1751241600"; 
   d="scan'208";a="2318615"
Subject: Re: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Thread-Topic: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 15:56:39 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:35374]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.19:2525] with esmtp (Farcaster)
 id 3521494c-cd0c-4c7e-a87c-f69a666db393; Wed, 3 Sep 2025 15:56:39 +0000 (UTC)
X-Farcaster-Flow-ID: 3521494c-cd0c-4c7e-a87c-f69a666db393
Received: from EX19D032UWA004.ant.amazon.com (10.13.139.56) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 3 Sep 2025 15:56:39 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA004.ant.amazon.com (10.13.139.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 3 Sep 2025 15:56:38 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.020; Wed, 3 Sep 2025 15:56:38 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>
CC: "joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "memxor@gmail.com"
	<memxor@gmail.com>, "zhenglifeng1@huawei.com" <zhenglifeng1@huawei.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cl@gentwo.org"
	<cl@gentwo.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ast@kernel.org" <ast@kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Okanovic, Haris"
	<harisokn@amazon.com>
Thread-Index: AQHcGLwkeAOmnfRWAUuaDQGZvBHLrrR+O4GAgANprQA=
Date: Wed, 3 Sep 2025 15:56:38 +0000
Message-ID: <23aca480075a8efc307c9aa07ff62f0f39bbee4e.camel@amazon.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
	 <aLWITwwDg06F1eXu@arm.com>
In-Reply-To: <aLWITwwDg06F1eXu@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.178.32]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E18BDB4F8F2474DAC3E5EE6935FEE88@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_085645_563986_7B4CCD1F 
X-CRM114-Status: GOOD (  14.81  )
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

T24gTW9uLCAyMDI1LTA5LTAxIGF0IDEyOjQ5ICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+IA0KPiANCj4gDQo+IE9uIEZyaSwgQXVnIDI5LCAyMDI1IGF0IDAxOjA3OjMwQU0gLTA3MDAs
IEFua3VyIEFyb3JhIHdyb3RlOg0KPiA+IEFua3VyIEFyb3JhICg1KToNCj4gPiAgIGFzbS1nZW5l
cmljOiBiYXJyaWVyOiBBZGQgc21wX2NvbmRfbG9hZF9yZWxheGVkX3RpbWV3YWl0KCkNCj4gPiAg
IGFybTY0OiBiYXJyaWVyOiBBZGQgc21wX2NvbmRfbG9hZF9yZWxheGVkX3RpbWV3YWl0KCkNCj4g
PiAgIGFybTY0OiBycXNwaW5sb2NrOiBSZW1vdmUgcHJpdmF0ZSBjb3B5IG9mDQo+ID4gICAgIHNt
cF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdA0KPiA+ICAgYXNtLWdlbmVyaWM6IGJhcnJpZXI6
IEFkZCBzbXBfY29uZF9sb2FkX2FjcXVpcmVfdGltZXdhaXQoKQ0KPiA+ICAgcnFzcGlubG9jazog
dXNlIHNtcF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdCgpDQo+IA0KPiBDYW4geW91IGhhdmUg
YSBnbyBhdCBwb2xsX2lkbGUoKSB0byBzZWUgaG93IGl0IHdvdWxkIGxvb2sgbGlrZSB1c2luZw0K
PiB0aGlzIEFQST8gSXQgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIHdlIGhhdmUgdG8gbWVyZ2Ug
dGhlbSBhbGwgYXQgb25jZQ0KPiBidXQgaXQgZ2l2ZXMgdXMgYSBiZXR0ZXIgaWRlYSBvZiB0aGUg
c3VpdGFiaWxpdHkgb2YgdGhlIGludGVyZmFjZS4NCg0KVGhpcyBpcyB3aGF0IEkgdGVzdGVkIG9u
IEFSTSBvbiBGcmk6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9oYXJpc29rYW5vdmljL2xpbnV4L2Js
b2IvMzdlMDJiOTUwYzk5MzcwNDY2ZTczODVlNWU3NTRiYmQ2MjMyZWY5NS9kcml2ZXJzL2NwdWlk
bGUvcG9sbF9zdGF0ZS5jI0wyNA0KDQpSZWdhcmRzLA0KSGFyaXMgT2thbm92aWMNCkFXUyBHcmF2
aXRvbiBTb2Z0d2FyZQ0KDQo+IA0KPiAtLQ0KPiBDYXRhbGluDQoNCg==

