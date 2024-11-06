Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0BED59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pz81Pbck5wcyAI6JbvV2ZyEMZPVsLQdxsAgLdb8/Imw=; b=UNuvWQhnQedV2pYLPvHfgs6uYD
	34b92guDL89VrbC9dTEaKMmAh2MyOcw258BqMEPF1ZermubbOHNBUjpuD3g4PPpi6s6Y2RJa/YNTC
	qKev7uRz6KULSBP6TtmswQRSG9NTXpjvN/8Rf9jeesWOFVwxoShhR/jBOBAtltjrb1nDl3Vc1JKFn
	xBwuW4DjoaXa/HBSMgJQuDX1lFS9J2KM4PaZpEYrYa/ORGpfbLA9ztRXPupauX2HdLU3Wh1PDADI2
	g3KgCRY39PDk+LSrxyEiVCUY1UcbcqgkiZBt7XXlCJMwjU/RJUKua8vBDLioHiV0Uye7Jfc4p4ir+
	1kprU0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jZc-000000049bS-3AZN;
	Wed, 06 Nov 2024 17:12:04 +0000
Received: from smtp-fw-80009.amazon.com ([99.78.197.220])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jUf-000000048TY-3fOH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730912817; x=1762448817;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=Pz81Pbck5wcyAI6JbvV2ZyEMZPVsLQdxsAgLdb8/Imw=;
  b=fJT20p0iLEncS1e2Fx68pM7pfBgOmOlrqdvv27NcoKGlGVaawjMYHN+N
   WRjHD9ojKc9v+juD57Orb0aimAG4WONlpQaPT6TzClAlFw5W4yCEBl62B
   7JiJCqBtODR/qvab8h+tGPGnsZpjMIio16xZ08IwcaRqrZ08YXCre5ksv
   k=;
X-IronPort-AV: E=Sophos;i="6.11,263,1725321600"; 
   d="scan'208";a="144914035"
Subject: Re: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Thread-Topic: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:06:54 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:44945]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.195:2525] with esmtp (Farcaster)
 id 5bdf6e78-b305-43b2-b302-077e2957626d; Wed, 6 Nov 2024 17:06:54 +0000 (UTC)
X-Farcaster-Flow-ID: 5bdf6e78-b305-43b2-b302-077e2957626d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 17:06:54 +0000
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 6 Nov 2024 17:06:54 +0000
Received: from EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2]) by
 EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2%7]) with mapi id
 15.02.1258.035; Wed, 6 Nov 2024 17:06:54 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "cl@gentwo.org" <cl@gentwo.org>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "wanpengli@tencent.com"
	<wanpengli@tencent.com>, "joao.m.martins@oracle.com"
	<joao.m.martins@oracle.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "misono.tomohiro@fujitsu.com"
	<misono.tomohiro@fujitsu.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"lenb@kernel.org" <lenb@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Okanovic, Haris"
	<harisokn@amazon.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "mtosatti@redhat.com" <mtosatti@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>
Thread-Index: AQHbL7D0KO91MZWU0ESDfcp3e5ep6bKpFJ6AgAFojYA=
Date: Wed, 6 Nov 2024 17:06:53 +0000
Message-ID: <2306e1b324c135d7d2bf961202657031d02ad4b0.camel@amazon.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
	 <20241105183041.1531976-1-harisokn@amazon.com>
	 <20241105183041.1531976-2-harisokn@amazon.com>
	 <f46a71b5-8e0f-c2a9-b3f8-d499c10f227a@gentwo.org>
In-Reply-To: <f46a71b5-8e0f-c2a9-b3f8-d499c10f227a@gentwo.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.141.28]
Content-Type: text/plain; charset="utf-8"
Content-ID: <764253D7DEDA7049AEB8E76EECF8AB1B@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_090658_016977_5081ECA5 
X-CRM114-Status: GOOD (  15.66  )
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

T24gVHVlLCAyMDI0LTExLTA1IGF0IDExOjM2IC0wODAwLCBDaHJpc3RvcGggTGFtZXRlciAoQW1w
ZXJlKSB3cm90ZToNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lk
ZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gVHVlLCA1IE5vdiAyMDI0LCBIYXJpcyBPa2Fu
b3ZpYyB3cm90ZToNCj4gDQo+ID4gKy8qKg0KPiA+ICsgKiBzbXBfdmNvbmRfbG9hZF9yZWxheGVk
KCkgLSAoU3Bpbikgd2FpdCB1bnRpbCBhbiBleHBlY3RlZCB2YWx1ZSBhdCBhZGRyZXNzDQo+ID4g
KyAqIHdpdGggbm8gb3JkZXJpbmcgZ3VhcmFudGVlcy4gU3BpbnMgdW50aWwgYCgqYWRkciAmIG1h
c2spID09IHZhbGAgb3INCj4gPiArICogYG5zZWNzYCBlbGFwc2UsIGFuZCByZXR1cm5zIHRoZSBs
YXN0IG9ic2VydmVkIGAqYWRkcmAgdmFsdWUuDQo+ID4gKyAqDQo+ID4gKyAqIEBuc2VjczogdGlt
ZW91dCBpbiBuYW5vc2Vjb25kcw0KPiANCj4gUGxlYXNlIHVzZSBhbiBhYnNvbHV0ZSB0aW1lIGlu
IG5zZWNzIGluc3RlYWQgb2YgYSB0aW1lb3V0Lg0KDQpJIHdlbnQgd2l0aCByZWxhdGl2ZSB0aW1l
IGJlY2F1c2UgaXQgY2xvY2sgYWdub3N0aWMuIEkgYWdyZWUgZGVhZGxpbmUNCmlzIG5pY2VyIGJl
Y2F1c2UgaXQgY2FuIHByb3BhZ2F0ZSBkb3duIGxheWVycyBvZiBmdW5jdGlvbnMsIGJ1dCBpdCBw
aW5zDQp0aGUgY2FsbGVyIHRvIHNpbmdsZSB0aW1lIGJhc2UuDQoNCj4gWW91IGRvIG5vdCBrbm93
DQo+IHdoYXQgd2lsbCBoYXBwZW4gdG8geW91ciBleGVjdXRpb24gdGhyZWFkIHVudGlsIHRoZSBs
b2NhbF9jbG9ja19ub2luc3RyKCkNCj4gaXMgcnVuLg0KDQoNCk5vdCBzdXJlIHdoYXQgeW91IG1l
YW4uIENvdWxkIHlvdSBwZXJoYXBzIGdpdmUgYW4gZXhhbXBsZSB3aGVyZSBpdA0Kd291bGQgYnJl
YWs/DQoNCj4gDQo+IA0KDQpPbmUgYWx0ZXJuYXRpdmUgaXMgdG8gZG8gdGltZWtlZXBpbmcgd2l0
aCBkZWxheSgpIGluIGFsbCBjYXNlcywgdG8NCmRlY291cGxlIGZyb20gc2NoZWQvY2xvY2suDQoN
Cg==

