Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFED59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDVq4SIXpHraWDhKH4bxu549qXbWzgi7b5CVz7FPUHA=; b=qWUUpXki+3DXEoMAm8WKIiikjv
	Mct4nf1b6q3uD7EtIIs6I/tvWjBHxNH5D3jNjG3YdF9SneTNm9PxhrSupFL3VfwrwaGwu50dwMxNw
	8DHEaSNG0eTTWCo/rL5wb0OZ7CL7pIkeAbpZydNyv2qVZX0TwcssrTJXgXsA0bPMS+OXy05CSPlZK
	z8xKiXeqo6CBqH1yHGW33qCiI7hpUHXKhgcSu+pYEFifqrNO+Xl501I7jjVjl1O9nZEM9pmDmI1GO
	EWCOEyEwS+pUGO/UtMkZz5JUaCzj0s1/O3VvzZoT0aEB5mpNpQMgcJsDPyX0sb5DLKFPXIBK3PolA
	pekMuSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jzt-00000004Cyv-1UoU;
	Wed, 06 Nov 2024 17:39:13 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jy9-00000004CjF-0QWQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730914646; x=1762450646;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=BDVq4SIXpHraWDhKH4bxu549qXbWzgi7b5CVz7FPUHA=;
  b=EFBJRZF/oKFc5vimcKDnl9QGwoXp8gmreFTQXvuJj65sURH/tM8BOlWf
   wTNGRQAYMnRei+LZEq6Z0GkxcCuYC9PjHn+i5wYbC0j0cJD60rbL3IkfM
   8z/8ExeAgdCaWDvITDTYwutpeSbE6sBuUwPYkkDYHTnmXXjJh5U6EaLnR
   c=;
X-IronPort-AV: E=Sophos;i="6.11,263,1725321600"; 
   d="scan'208";a="437723837"
Subject: Re: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Thread-Topic: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:37:22 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:49883]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.224:2525] with esmtp (Farcaster)
 id a52bf82f-2626-447e-9f79-eceb100edbbd; Wed, 6 Nov 2024 17:37:21 +0000 (UTC)
X-Farcaster-Flow-ID: a52bf82f-2626-447e-9f79-eceb100edbbd
Received: from EX19D001UWA004.ant.amazon.com (10.13.138.251) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 17:37:17 +0000
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19D001UWA004.ant.amazon.com (10.13.138.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 6 Nov 2024 17:37:17 +0000
Received: from EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2]) by
 EX19D001UWA003.ant.amazon.com ([fe80::256a:26de:3ee6:48a2%7]) with mapi id
 15.02.1258.035; Wed, 6 Nov 2024 17:37:17 +0000
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
Thread-Index: AQHbL7D9P6U0yGi3sU+ODiwZGjE2xLKpFYeAgAFwIQA=
Date: Wed, 6 Nov 2024 17:37:17 +0000
Message-ID: <802d7b650b3932cf3818d39c7a935d3fc250286e.camel@amazon.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
	 <20241105183041.1531976-1-harisokn@amazon.com>
	 <20241105183041.1531976-3-harisokn@amazon.com>
	 <901a1fff-a747-fc44-31a2-95141c7eb7a6@gentwo.org>
In-Reply-To: <901a1fff-a747-fc44-31a2-95141c7eb7a6@gentwo.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.141.28]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AF01C18A6E89940B2177899E3C87207@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_093725_312575_1CB2816B 
X-CRM114-Status: GOOD (  11.21  )
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

T24gVHVlLCAyMDI0LTExLTA1IGF0IDExOjM5IC0wODAwLCBDaHJpc3RvcGggTGFtZXRlciAoQW1w
ZXJlKSB3cm90ZToNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lk
ZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gVHVlLCA1IE5vdiAyMDI0LCBIYXJpcyBPa2Fu
b3ZpYyB3cm90ZToNCj4gDQo+ID4gKyNkZWZpbmUgX19SRUFEX09OQ0VfRVgoeCkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gDQo+IFRoaXMgaXMgZGVyaXZl
ZCBmcm9tIFJFQURfT05DRSBhbmQgbmFtZWQgc2ltaWxhcmx5IHNvIG1heWJlIGl0IHdvdWxkDQo+
IGJldHRlciBiZSBwbGFjZWQgaW50byByd29uY2UuaD8NCj4gDQo+IA0KDQpJIHBsYW4gdG8gcmVt
b3ZlIHRoaXMgbWFjcm8gcGVyIG90aGVyIGZlZWRiYWNrIGluIHRoaXMgdGhyZWFkLg0KDQo=

