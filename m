Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A61C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dqr4+v5JkewaML+LxWNkl3XAl9W6+X9tfBXO3LYXGM=; b=PlNfP1abTfqmdG1OB6IHC7bvXe
	Y0WsqKrF7459lW9jUQoyQzsMRTHOUZQVJKKrz960/YiMnVyPKYyQQ0FyYToZjbeS/c+FnensIwIKu
	J+5fNSQBWAuMNMDAZzV+zgCV8TKMDe8yo3hQjGX0w4B6kNDy93Jb1JWNaLITrI1wOB4i5OpFVsAx5
	DX3KqBKQH+0EdmP+4d85VzlDj987kmhkUFZT5mmXU6Xt0hHLlFYNJAR/zyM81iWJ19NXvGDn2jAhJ
	QZ8jBs8Nb8oEX0p0r2h6mZz+Gc3Wmo4aYBvsfuGAiMA6ZV+0u1ZXu9UN5p6XBMr9Bn0MmszsAzFEE
	AkFKRXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4Pn-0000000GQM1-1Tia;
	Fri, 14 Feb 2025 22:44:07 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4OL-0000000GQ2t-3iey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739572958; x=1771108958;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=7dqr4+v5JkewaML+LxWNkl3XAl9W6+X9tfBXO3LYXGM=;
  b=opEv73F9/DX1urn/ntUlCzpJSRDkharyQxMhb4JetBVzL+pU3AjUpRi/
   R+AzUQcwrHbULSc1pckUruNfjx2g6V5XewXXWSLnZ6M96wEvvnVdj+Zle
   wekp20MLmEJAIxNOxEO3lyfhAk5p3/KR4mi8fJWKWU1DwlHwbhiUISerB
   4=;
X-IronPort-AV: E=Sophos;i="6.13,287,1732579200"; 
   d="scan'208";a="494063818"
Subject: Re: [PATCH 4/4] arm64: barrier: Add smp_cond_load_acquire_timewait()
Thread-Topic: [PATCH 4/4] arm64: barrier: Add smp_cond_load_acquire_timewait()
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 22:42:36 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:46647]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.150:2525] with esmtp (Farcaster)
 id 3dfd354f-13d0-43ce-9a83-fe979d8618ae; Fri, 14 Feb 2025 22:42:36 +0000 (UTC)
X-Farcaster-Flow-ID: 3dfd354f-13d0-43ce-9a83-fe979d8618ae
Received: from EX19D032UWA004.ant.amazon.com (10.13.139.56) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 14 Feb 2025 22:42:35 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA004.ant.amazon.com (10.13.139.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 14 Feb 2025 22:42:35 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.1544.014; Fri, 14 Feb 2025 22:42:35 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "ankur.a.arora@oracle.com"
	<ankur.a.arora@oracle.com>
CC: "Okanovic, Haris" <harisokn@amazon.com>, "cl@gentwo.org" <cl@gentwo.org>,
	"joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "memxor@gmail.com"
	<memxor@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "zhenglifeng1@huawei.com"
	<zhenglifeng1@huawei.com>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>
Thread-Index: AQHbdoWTLOnOGDZdP0ajcFsBERkpC7NHdhIA
Date: Fri, 14 Feb 2025 22:42:35 +0000
Message-ID: <3b0de6589cb4f1b8bdc87b53fc7ff61a35659941.camel@amazon.com>
References: <20250203214911.898276-1-ankur.a.arora@oracle.com>
	 <20250203214911.898276-5-ankur.a.arora@oracle.com>
In-Reply-To: <20250203214911.898276-5-ankur.a.arora@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.178.15]
Content-Type: text/plain; charset="utf-8"
Content-ID: <586C842FFADDDB488E24CA520892E0A2@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_144237_969709_8113FA19 
X-CRM114-Status: GOOD (  20.30  )
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

T24gTW9uLCAyMDI1LTAyLTAzIGF0IDEzOjQ5IC0wODAwLCBBbmt1ciBBcm9yYSB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gQWRkIHNtcF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdCgpLiBUaGlzIGlz
IHN1YnN0YW50aWFsbHkgc2ltaWxhcg0KPiB0byBzbXBfY29uZF9sb2FkX2FjcXVpcmUoKSB3aGVy
ZSB3ZSB1c2UgYSBsb2FkLWFjcXVpcmUgaW4gdGhlIGxvb3ANCj4gYW5kIGF2b2lkIGFuIHNtcF9y
bWIoKSBsYXRlci4NCj4gDQo+IFRvIGhhbmRsZSB0aGUgdW5saWtlbHkgY2FzZSBvZiB0aGUgZXZl
bnQtc3RyZWFtIGJlaW5nIHVuYXZhaWxhYmxlLA0KPiBrZWVwIHRoZSBpbXBsZW1lbnRhdGlvbiBz
aW1wbGUgYnkgZmFsbGluZyBiYWNrIHRvIHRoZSBnZW5lcmljDQo+IF9fc21wX2NvbmRfbG9hZF9y
ZWxheGVkX3NwaW53YWl0KCkgd2l0aCBhbiBzbXBfcm1iKCkgdG8gZm9sbG93DQo+ICh2aWEgc21w
X2FjcXVpcmVfX2FmdGVyX2N0cmxfZGVwKCkuKQ0KPiANCj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxs
QGtlcm5lbC5vcmc+DQo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0u
Y29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFNpZ25l
ZC1vZmYtYnk6IEFua3VyIEFyb3JhIDxhbmt1ci5hLmFyb3JhQG9yYWNsZS5jb20+DQo+IC0tLQ0K
PiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYXJyaWVyLmggfCAzNiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCBiL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYmFycmllci5oDQo+IGluZGV4IDI1NzIxMjc1YTVhMi4uMjJkOTI5
MWFlZThkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2JhcnJpZXIuaA0K
PiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2JhcnJpZXIuaA0KPiBAQCAtMjMyLDYgKzIz
MiwyMiBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgICAgKHR5cGVvZigqcHRyKSlWQUw7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gIH0pDQo+
IA0KPiArI2RlZmluZSBfX3NtcF9jb25kX2xvYWRfYWNxdWlyZV90aW1ld2FpdChwdHIsIGNvbmRf
ZXhwciwgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGltZV9leHByX25zLCB0aW1lX2xpbWl0X25zKSAgIFwNCj4gKyh7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXA0KPiArICAgICAgIHR5cGVvZihwdHIpIF9fUFRSID0gKHB0cik7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgX191bnF1YWxfc2NhbGFyX3R5cGVv
ZigqcHRyKSBWQUw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICBm
b3IgKDs7KSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPiArICAgICAgICAgICAgICAgVkFMID0gc21wX2xvYWRfYWNxdWlyZShfX1BUUik7
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICBpZiAoY29uZF9l
eHByKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiArICAgICAgICAgICAgICAgX19jbXB3YWl0X3JlbGF4ZWQoX19QVFIsIFZB
TCk7ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICBpZiAoKHRp
bWVfZXhwcl9ucykgPj0gKHRpbWVfbGltaXRfbnMpKSAgICAgICAgICAgICAgICAgIFwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiArICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgKHR5cGVvZigqcHRy
KSlWQUw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4g
K30pDQo+ICsNCj4gIC8qDQo+ICAgKiBGb3IgdGhlIHVubGlrZWx5IGNhc2UgdGhhdCB0aGUgZXZl
bnQtc3RyZWFtIGlzIHVuYXZhaWxhYmxlLA0KPiAgICogd2FyZCBvZmYgdGhlIHBvc3NpYmlsaXR5
IG9mIHdhaXRpbmcgZm9yZXZlciBieSBmYWxsaW5nIGJhY2sNCj4gQEAgLTI1NCw2ICsyNzAsMjYg
QEAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICh0eXBlb2YoKnB0cikpX3ZhbDsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICB9KQ0KPiANCj4g
KyNkZWZpbmUgc21wX2NvbmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KHB0ciwgY29uZF9leHByLCAg
ICAgICAgICAgICAgICAgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRpbWVfZXhwcl9ucywgdGltZV9saW1pdF9ucykgICAgICBcDQo+ICsoeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwN
Cj4gKyAgICAgICBfX3VucXVhbF9zY2FsYXJfdHlwZW9mKCpwdHIpIF92YWw7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgIGludCBfX3dmZSA9IGFyY2hfdGltZXJfZXZ0
c3RybV9hdmFpbGFibGUoKTsgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gKyAgICAgICBpZiAobGlrZWx5KF9fd2ZlKSkgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICAgICAgICAgX3ZhbCA9IF9fc21wX2Nv
bmRfbG9hZF9hY3F1aXJlX3RpbWV3YWl0KHB0ciwgY29uZF9leHByLCBcDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZV9leHByX25z
LCAgIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB0aW1lX2xpbWl0X25zKTsgXA0KPiArICAgICAgIH0gZWxzZSB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAg
ICAgICAgICBfdmFsID0gX19zbXBfY29uZF9sb2FkX3JlbGF4ZWRfc3BpbndhaXQocHRyLCBjb25k
X2V4cHIsIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0aW1lX2V4cHJfbnMsICAgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWVfbGltaXRfbnMpOyBcDQo+ICsgICAg
ICAgICAgICAgICBzbXBfYWNxdWlyZV9fYWZ0ZXJfY3RybF9kZXAoKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4gKyAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICh0eXBlb2YoKnB0cikp
X3ZhbDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICt9
KQ0KPiArDQo+ICsNCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9iYXJyaWVyLmg+DQo+IA0KPiAg
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0KPiAtLQ0KPiAyLjQzLjUNCg0KVGVzdGVkIGJvdGgg
cmVsYXhlZCBhbmQgYWNxdWlyZSB2YXJpYW50cyBvbiBBV1MgR3Jhdml0b24gKEFSTTY0DQpOZW92
ZXJzZSBWMSkgd2l0aCB5b3VyIFY5IGhhbHRwb2xsIGNoYW5nZXMsIGF0b3AgbWFzdGVyIDEyOGM4
Zjk2ZWIuDQoNClJldmlld2VkLWJ5OiBIYXJpcyBPa2Fub3ZpYyA8aGFyaXNva25AYW1hem9uLmNv
bT4NClRlc3RlZC1ieTogSGFyaXMgT2thbm92aWMgPGhhcmlzb2tuQGFtYXpvbi5jb20+DQoNCg==

