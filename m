Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2265CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onDw0zBJvA2aM4dl11X2cmXP4ov854rmqxhd1ow39+0=; b=mNYuN9Eb9lyWiFt/7iuBxDkjrG
	FlBh8JdGWfihrUwev4CO3Yv8l/WKwoAm/gw9CPjj5YrbRCsn6jbiBkvAnVPi0hYKs8mXQoE4T1b2w
	e4ZHpVsCs4tIClpevSMyumuAEnzSTdCmC9tvnc1BjlBOiJ1AdMdWwW/AWP0yIW6glTJR4w1UzHsds
	Yzmvl/jvUr3dvpDYmuBoR0LHX4m0OOy1IZfIyZuCVW9s4mHYmMwtHnQH6LE5Gkq4MlD0JHeB5Wpwr
	JKKbpVLa3BqvotptTC5aQpMT1z8mZ7jbeTUMPLjYqfBOEWlxXpAMgzlTe0XSsHvYmjFIKFz1V47sU
	W2cWfL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9o5-00000007Bro-0SDE;
	Sat, 30 Aug 2025 00:51:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4F4-00000006i6C-3xr5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 18:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
	Subject:Sender:Reply-To:Content-Description;
	bh=onDw0zBJvA2aM4dl11X2cmXP4ov854rmqxhd1ow39+0=; b=imUoX+UPGtokvsnZcdLUMvJRGK
	jxHTJBsz1Juv01fXfAePMbn6fisHQsU2vU7CWd/hiX3x+cWvaslTAFvYhILJ6xwyfENJLBpspC0Kt
	Lon+TFLicOvvtczw/pK50NRBJm4CWrLEZhviu5tPjqJoJXqPU7JGcYh6ID0LGF7EdP7+gkYQj6UBN
	+8yybIA8UaY/Tno/kxcD9ReRGK4M18OlSMlcpu4czC/aPaKAupqI2+UfaZa1EHlqO2z2jkyXg7j4k
	bmjnvg3RM6cDMNhScDajb4qMVs1XMvbZ6t5UPaYKoGUH9Quk9Wqh/ljk8RGeNEpMXAHloAsxINlgq
	X1EQ8lCw==;
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ez-00000003GWm-2OD9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1756493665; x=1788029665;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=onDw0zBJvA2aM4dl11X2cmXP4ov854rmqxhd1ow39+0=;
  b=gE1+gUBfeCFBdKBEfpfYIR7pGrNFERF8CtKWe0UhpXq1WlBZVUZyb3kj
   B83xd1z9XClvZB1PX7yUHSnEYtRSCwi87PLwn7SwK3DDRtuRkQcvJf7so
   K5M1nHtT8vU1hPJb1rug4m/jJInl3lmz03NODOUY8v9Gf/5WII1wt34b9
   4/V9upm3F60iGzQ5Gk1j0ZYgsqv5TGWqhoV/T18T8BYPgiCRA7hqEofGd
   CQjUs8AmR4kjoCWBnKV9iAiJJLn+IUJKuSLXBe1m7fZuyfQ9qE0BTY6wx
   K8pfFg9UN2i9yA2J63WxvQEu88TlfuKuu45hh7lezUeWtp1oNdyz6a82i
   Q==;
X-CSE-ConnectionGUID: vUS98EYqRNm3RBnTuS4Z6g==
X-CSE-MsgGUID: 388zlf7oQNqGJeTjOXQpqQ==
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="1944126"
Subject: Re: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Thread-Topic: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 18:54:20 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:54966]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.144:2525] with esmtp (Farcaster)
 id d09b57f8-b9c6-4bca-870a-9e36f79c3866; Fri, 29 Aug 2025 18:54:20 +0000 (UTC)
X-Farcaster-Flow-ID: d09b57f8-b9c6-4bca-870a-9e36f79c3866
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Fri, 29 Aug 2025 18:54:20 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA003.ant.amazon.com (10.13.139.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Fri, 29 Aug 2025 18:54:20 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.017; Fri, 29 Aug 2025 18:54:20 +0000
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
Thread-Index: AQHcGLwkeAOmnfRWAUuaDQGZvBHLrrR5+yuA
Date: Fri, 29 Aug 2025 18:54:20 +0000
Message-ID: <2cecbf7fb23ee83a4ce027e1be3f46f97efd585c.camel@amazon.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
In-Reply-To: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.95.193.142]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B00C4BB2ABE1CC418E9442EB1C4C3F26@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_195426_149926_32324BF7 
X-CRM114-Status: GOOD (  22.04  )
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

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDAxOjA3IC0wNzAwLCBBbmt1ciBBcm9yYSB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gSGksDQo+IA0KPiBUaGlzIHNlcmllcyBhZGRzIHdhaXRlZCB2YXJpYW50cyBv
ZiB0aGUgc21wX2NvbmRfbG9hZCgpIHByaW1pdGl2ZXM6DQo+IHNtcF9jb25kX2xvYWRfcmVsYXhl
ZF90aW1ld2FpdCgpLCBhbmQgc21wX2NvbmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KCkuDQo+IA0K
PiBXaHk/OiBhcyB0aGUgbmFtZSBzdWdnZXN0cywgdGhlIG5ldyBpbnRlcmZhY2VzIGFyZSBtZWFu
dCBmb3IgY29udGV4dHMNCj4gd2hlcmUgeW91IHdhbnQgdG8gd2FpdCBvbiBhIGNvbmRpdGlvbiB2
YXJpYWJsZSBmb3IgYSBmaW5pdGUgZHVyYXRpb24uDQo+IFRoaXMgaXMgZWFzeSBlbm91Z2ggdG8g
ZG8gd2l0aCBhIGxvb3AgYXJvdW5kIGNwdV9yZWxheCgpLiBIb3dldmVyLA0KPiBzb21lIGFyY2hp
dGVjdHVyZXMgKGV4LiBhcm02NCkgYWxzbyBhbGxvdyB3YWl0aW5nIG9uIGEgY2FjaGVsaW5lLiBT
bywNCj4gdGhlc2UgaW50ZXJmYWNlcyBoYW5kbGUgYSBtaXh0dXJlIG9mIHNwaW4vd2FpdCB3aXRo
IGEgc21wX2NvbmRfbG9hZCgpDQo+IHRocm93biBpbi4NCj4gDQo+IFRoZXJlIGFyZSB0d28ga25v
d24gdXNlcnMgZm9yIHRoZXNlIGludGVyZmFjZXM6DQo+IA0KPiAgLSBwb2xsX2lkbGUoKSBbMV0N
Cj4gIC0gcmVzaWxpZW50IHF1ZXVlZCBzcGlubG9ja3MgWzJdDQo+IA0KPiBUaGUgaW50ZXJmYWNl
cyBhcmU6DQo+ICAgIHNtcF9jb25kX2xvYWRfcmVsYXhlZF90aW1ld2FpdChwdHIsIGNvbmRfZXhw
ciwgdGltZV9jaGVja19leHByKQ0KPiAgICBzbXBfY29uZF9sb2FkX2FjcXVpcmVfc3BpbndhaXQo
cHRyLCBjb25kX2V4cHIsIHRpbWVfY2hlY2tfZXhwcikNCj4gDQo+IFRoZSBhZGRlZCBwYXJhbWV0
ZXIsIHRpbWVfY2hlY2tfZXhwciwgZGV0ZXJtaW5lcyB0aGUgYmFpbCBvdXQgY29uZGl0aW9uLg0K
PiANCj4gQ2hhbmdlbG9nOg0KPiAgIHYzIFszXToNCj4gICAgIC0gZnVydGhlciBpbnRlcmZhY2Ug
c2ltcGxpZmljYXRpb25zIChzdWdnZXN0ZWQgYnkgQ2F0YWxpbiBNYXJpbmFzKQ0KPiANCj4gICB2
MiBbNF06DQo+ICAgICAtIHNpbXBsaWZpZWQgdGhlIGludGVyZmFjZSAoc3VnZ2VzdGVkIGJ5IENh
dGFsaW4gTWFyaW5hcykNCj4gICAgICAgIC0gZ2V0IHJpZCBvZiB3YWl0X3BvbGljeSwgYW5kIGEg
bXVsdGl0dWRlIG9mIGNvbnN0YW50cw0KPiAgICAgICAgLSBhZGRzIGEgc2xhY2sgcGFyYW1ldGVy
DQo+ICAgICAgIFRoaXMgaGVscGVkIHJlbW92ZSBhIGZhaXIgYW1vdW50IG9mIGR1cGxpY2F0ZWQg
Y29kZSBkdXBsaWNhdGlvbiBhbmQgaW4gaGluZHNpZ2h0DQo+ICAgICAgIHVubmVjZXNzYXJ5IGNv
bnN0YW50cy4NCj4gDQo+ICAgdjEgWzVdOg0KPiAgICAgIC0gYWRkIHdhaXRfcG9saWN5IChjb2Fy
c2UgYW5kIGZpbmUpDQo+ICAgICAgLSBkZXJpdmUgc3Bpbi1jb3VudCBldGMgYXQgcnVudGltZSBp
bnN0ZWFkIG9mIHVzaW5nIGFyYml0cmFyeQ0KPiAgICAgICAgY29uc3RhbnRzLg0KPiANCj4gSGFy
aXMgT2thbm92aWMgaGFkIHRlc3RlZCBhbiBlYXJsaWVyIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMg
d2l0aA0KPiBwb2xsX2lkbGUoKS9oYWx0cG9sbCBwYXRjaGVzLiBbNl0NCj4gDQo+IEFueSBjb21t
ZW50cyBhcHByZWNpYXRlZCENCj4gDQo+IFRoYW5rcyENCj4gQW5rdXINCj4gDQo+IFsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQxMTA3MTkwODE4LjUyMjYzOS0zLWFua3VyLmEu
YXJvcmFAb3JhY2xlLmNvbS8NCj4gWzJdIFVzZXMgdGhlIHNtcF9jb25kX2xvYWRfYWNxdWlyZV90
aW1ld2FpdCgpIGZyb20gdjENCj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vcnFzcGlubG9jay5oDQo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjUwNjI3MDQ0ODA1Ljk0NTQ5MS0xLWFua3VyLmEuYXJvcmFAb3JhY2xlLmNvbS8NCj4gWzRdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA1MDIwODUyMjMuMTMxNjkyNS0xLWFua3Vy
LmEuYXJvcmFAb3JhY2xlLmNvbS8NCj4gWzVdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyNTAyMDMyMTQ5MTEuODk4Mjc2LTEtYW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tLw0KPiBbNl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9mMmY1ZDA5ZTc5NTM5NzU0Y2VkMDg1ZWQ4OTg2
NTc4N2ZhNjY4Njk1LmNhbWVsQGFtYXpvbi5jb20NCj4gDQo+IENjOiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPg0KPiBDYzogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4NCj4gQ2M6
IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IENjOiBQZXRlciBa
aWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+DQo+IENjOiBLdW1hciBLYXJ0aWtleWEgRHdp
dmVkaSA8bWVteG9yQGdtYWlsLmNvbT4NCj4gQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtl
cm5lbC5vcmc+DQo+IENjOiBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZw0KPiANCj4gQW5rdXIg
QXJvcmEgKDUpOg0KPiAgIGFzbS1nZW5lcmljOiBiYXJyaWVyOiBBZGQgc21wX2NvbmRfbG9hZF9y
ZWxheGVkX3RpbWV3YWl0KCkNCj4gICBhcm02NDogYmFycmllcjogQWRkIHNtcF9jb25kX2xvYWRf
cmVsYXhlZF90aW1ld2FpdCgpDQo+ICAgYXJtNjQ6IHJxc3BpbmxvY2s6IFJlbW92ZSBwcml2YXRl
IGNvcHkgb2YNCj4gICAgIHNtcF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdA0KPiAgIGFzbS1n
ZW5lcmljOiBiYXJyaWVyOiBBZGQgc21wX2NvbmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KCkNCj4g
ICBycXNwaW5sb2NrOiB1c2Ugc21wX2NvbmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KCkNCj4gDQo+
ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICB8IDIyICsrKysrKysrDQo+ICBh
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3Jxc3BpbmxvY2suaCB8IDg0ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL2JhcnJpZXIuaCAgICAgICB8IDU3
ICsrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3Jxc3BpbmxvY2su
aCAgICB8ICA0ICsrDQo+ICBrZXJuZWwvYnBmL3Jxc3BpbmxvY2suYyAgICAgICAgICAgICB8IDI1
ICsrKystLS0tLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCA5OSBkZWxl
dGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuMzEuMQ0KPiANCg0KVGVzdGVkIG9uIEFXUyBHcmF2aXRv
biAyLCAzLCBhbmQgNCAoQVJNNjQgTmVvdmVyc2UgTjEsIFYxLCBhbmQgVjIpIHdpdGgNCnlvdXIg
VjEwIGhhbHRwb2xsIGNoYW5nZXMsIGF0b3AgNi4xNy4wLXJjMyAoY29tbWl0IDA3ZDlkZjgwMDgp
Lg0KU3RpbGwgc2VlaW5nIGJldHdlZW4gMS4zeCBhbmQgMi41eCBzcGVlZHVwcyBpbiBgcGVyZiBi
ZW5jaCBzY2hlZCBwaXBlYA0KYW5kIGBzZWNjb21wLW5vdGlmeWA7IG5vIGNoYW5nZSBpbiBgbWVz
c2FnaW5nYC4NCg0KUmV2aWV3ZWQtYnk6IEhhcmlzIE9rYW5vdmljIDxoYXJpc29rbkBhbWF6b24u
Y29tPg0KVGVzdGVkLWJ5OiBIYXJpcyBPa2Fub3ZpYyA8aGFyaXNva25AYW1hem9uLmNvbT4NCg0K
UmVnYXJkcywNCkhhcmlzIE9rYW5vdmljDQpBV1MgR3Jhdml0b24gU29mdHdhcmUNCg0K

