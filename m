Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A911AD59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS32UbC5YTGUMCM+H2KsQrM6zbTTFPULTJlP9ekHazQ=; b=LZ89uAUo3Ac8sL+6Jta09NAATu
	TNQRBa6+Pid0i+FXFRgULW7M7QyeGxeTg6vq2orfncDu4pD8GG0KA0wavR5YZJUNZqfE/yM4InE2G
	palK8Ibb4I+n/1bjMQh3rP1m9x+HeSUsQau+arBVF3Eshgci7wZbpHKMkYF1Z36DKPVzzpi+ApKHP
	bdmU5GaFq/yEVtzRikO4Z0JnB8OuGs3QL1EibIgbdOFoPlo1sTV2DJPj6uNlcWplzOaIeqV1f3h1m
	MlsFvLEGotz50BpYdtfZd0AWB7sBCQov+aQABuC8/BdF0FJpZ+iVECU0Z8VjT894YP+GrCkAEoYac
	9LIoGexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jhZ-00000004Ars-2Vxi;
	Wed, 06 Nov 2024 17:20:17 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jfq-00000004Abq-3Hfk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730913511; x=1762449511;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=RS32UbC5YTGUMCM+H2KsQrM6zbTTFPULTJlP9ekHazQ=;
  b=BX1Vk+yoIM1aqdwAVqtKGEY2GkA0SQloLyuW04y6thUARYdSv10qU1ZW
   dgUYwjtLCHzklhpTEA/xpgj6dTSF1uY/2VKxRsWgodYFQsPNFm5FCXZu9
   aBo/koNOfkzPggnD/B6tDtKJ3lihMiz2iD3kLUHqO86YWmw8rOzHbVEnN
   8=;
X-IronPort-AV: E=Sophos;i="6.11,263,1725321600"; 
   d="scan'208";a="437718798"
Subject: Re: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Thread-Topic: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:18:27 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:24002]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.195:2525] with esmtp (Farcaster)
 id 17d0382b-27f1-49a1-9c31-0687b6686f64; Wed, 6 Nov 2024 17:18:25 +0000 (UTC)
X-Farcaster-Flow-ID: 17d0382b-27f1-49a1-9c31-0687b6686f64
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 17:18:25 +0000
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 6 Nov 2024 17:18:25 +0000
Received: from EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2]) by
 EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2%7]) with mapi id
 15.02.1258.035; Wed, 6 Nov 2024 17:18:25 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "will@kernel.org" <will@kernel.org>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "wanpengli@tencent.com"
	<wanpengli@tencent.com>, "cl@gentwo.org" <cl@gentwo.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "misono.tomohiro@fujitsu.com"
	<misono.tomohiro@fujitsu.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"lenb@kernel.org" <lenb@kernel.org>, "mtosatti@redhat.com"
	<mtosatti@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Okanovic, Haris"
	<harisokn@amazon.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
Thread-Index: AQHbL7D0KO91MZWU0ESDfcp3e5ep6bKqIdAAgABekoA=
Date: Wed, 6 Nov 2024 17:18:25 +0000
Message-ID: <1d070075c2e2fdf014d0c0ecb8a48f88bc7d229d.camel@amazon.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
	 <20241105183041.1531976-1-harisokn@amazon.com>
	 <20241105183041.1531976-2-harisokn@amazon.com>
	 <20241106113953.GA13801@willie-the-truck>
In-Reply-To: <20241106113953.GA13801@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.141.28]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9617A0F4EB9ED64E80C1CE412977270C@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_091830_990328_D03F8C04 
X-CRM114-Status: GOOD (  26.94  )
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

T24gV2VkLCAyMDI0LTExLTA2IGF0IDExOjM5ICswMDAwLCBXaWxsIERlYWNvbiB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gT24gVHVlLCBOb3YgMDUsIDIwMjQgYXQgMTI6MzA6MzdQTSAtMDYwMCwgSGFy
aXMgT2thbm92aWMgd3JvdGU6DQo+ID4gUmVsYXhlZCBwb2xsIHVudGlsIGRlc2lyZWQgbWFzay92
YWx1ZSBpcyBvYnNlcnZlZCBhdCB0aGUgc3BlY2lmaWVkDQo+ID4gYWRkcmVzcyBvciB0aW1lb3V0
Lg0KPiA+IA0KPiA+IFRoaXMgbWFjcm8gaXMgYSBzcGVjaWFsaXphdGlvbiBvZiB0aGUgZ2VuZXJp
YyBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoKSwNCj4gPiB3aGljaCB0YWtlcyBhIHNpbXBsZSBtYXNr
L3ZhbHVlIGNvbmRpdGlvbiAodmNvbmQpIGluc3RlYWQgb2YgYW4NCj4gPiBhcmJpdHJhcnkgZXhw
cmVzc2lvbi4gSXQgYWxsb3dzIGFyY2hpdGVjdHVyZXMgdG8gYmV0dGVyIHNwZWNpYWxpemUgdGhl
DQo+ID4gaW1wbGVtZW50YXRpb24sIGUuZy4gdG8gZW5hYmxlIHdmZSgpIHBvbGxpbmcgb2YgdGhl
IGFkZHJlc3Mgb24gYXJtLg0KPiANCj4gVGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUuIFRo
ZSBleGlzdGluZyBzbXBfY29uZF9sb2FkKCkgZnVuY3Rpb25zDQo+IGFscmVhZHkgdXNlIHdmZSBv
biBhcm02NCBhbmQgSSBkb24ndCBzZWUgd2h5IHdlIG5lZWQgYSBzcGVjaWFsIGhlbHBlcg0KPiBq
dXN0IHRvIGRvIGEgbWFzay4NCg0KV2UgY2FuJ3QgdHVybiBhbiBhcmJpdHJhcnkgQyBleHByZXNz
aW9uIGludG8gYSB3ZmUoKS93ZmV0KCkgZXhpdA0KY29uZGl0aW9uLCB3aGljaCBpcyBvbmUgb2Yg
dGhlIGlucHV0cyB0byB0aGUgZXhpc3Rpbmcgc21wX2NvbmRfbG9hZCgpLg0KVGhpcyBBUEkgaXMg
dGhlcmVmb3JlIG1vcmUgYW1lbmFibGUgdG8gaGFyZHdhcmUgYWNjZWxlcmF0aW9uLg0KDQo+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEhhcmlzIE9rYW5vdmljIDxoYXJpc29rbkBhbWF6b24uY29tPg0K
PiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2FzbS1nZW5lcmljL2JhcnJpZXIuaCB8IDI1ICsrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9iYXJyaWVyLmggYi9p
bmNsdWRlL2FzbS1nZW5lcmljL2JhcnJpZXIuaA0KPiA+IGluZGV4IGQ0ZjU4MWMxZTIxZC4uMTEy
MDI3ZWFiYmZjIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvYmFycmllci5o
DQo+ID4gKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9iYXJyaWVyLmgNCj4gPiBAQCAtMjU2LDYg
KzI1NiwzMSBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICB9KQ0KPiA+ICAjZW5kaWYNCj4gPiAN
Cj4gPiArLyoqDQo+ID4gKyAqIHNtcF92Y29uZF9sb2FkX3JlbGF4ZWQoKSAtIChTcGluKSB3YWl0
IHVudGlsIGFuIGV4cGVjdGVkIHZhbHVlIGF0IGFkZHJlc3MNCj4gPiArICogd2l0aCBubyBvcmRl
cmluZyBndWFyYW50ZWVzLiBTcGlucyB1bnRpbCBgKCphZGRyICYgbWFzaykgPT0gdmFsYCBvcg0K
PiA+ICsgKiBgbnNlY3NgIGVsYXBzZSwgYW5kIHJldHVybnMgdGhlIGxhc3Qgb2JzZXJ2ZWQgYCph
ZGRyYCB2YWx1ZS4NCj4gPiArICoNCj4gPiArICogQG5zZWNzOiB0aW1lb3V0IGluIG5hbm9zZWNv
bmRzDQo+ID4gKyAqIEBhZGRyOiBwb2ludGVyIHRvIGFuIGludGVnZXINCj4gPiArICogQG1hc2s6
IGEgYml0IG1hc2sgYXBwbGllZCB0byByZWFkIHZhbHVlcw0KPiA+ICsgKiBAdmFsOiBFeHBlY3Rl
ZCB2YWx1ZSB3aXRoIG1hc2sNCj4gPiArICovDQo+ID4gKyNpZm5kZWYgc21wX3Zjb25kX2xvYWRf
cmVsYXhlZA0KPiANCj4gSSBrbm93IG5hbWluZyBpcyBoYXJkLCBidXQgInZjb25kIiBpcyBlc3Bl
Y2lhbGx5IHRlcnJpYmxlLg0KPiBQZXJoYXBzIHNtcF9jb25kX2xvYWRfdGltZW91dCgpPw0KDQpJ
IGFncmVlLCBuYW1pbmcgaXMgaGFyZCEgSSB3YXMgdHJ5aW5nIHRvIGRpZmZlcmVudGlhdGUgaXQg
ZnJvbQ0Kc21wX2NvbmRfbG9hZCgpIGluIHNvbWUgbWVhbmluZ2Z1bCB3YXkgLSB0aGF0IG9uZSBp
cyBhbiAiZXhwcmVzc2lvbiINCmNvbmRpdGlvbiB0aGlzIG9uZSBpcyBhICJ2YWx1ZSIgY29uZGl0
aW9uLg0KDQpJJ2xsIHRoaW5rIGl0IG92ZXIgYSBiaXQgbW9yZS4NCg0KPiANCj4gV2lsbA0KDQo=

