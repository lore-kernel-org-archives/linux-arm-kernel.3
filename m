Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94BFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68WD7LAngpU8BrmhTtDG4Cffchmjc7fJ7Z8I1OciBtw=; b=Cti2saqINoWsV+NMIGYzjDCYJN
	86hjodcllUCcumUffElDQXF/8NpclBqYn90Ji1WQTeQIctMf7O69HvqGSr7Awko+GoevaavcLSmri
	s/FFYwDHm4LFI3nriXt4OaUSnjmqCIfWTzpTFYTfDecy57B7pmEiDEDBjEstM+6pbeO+4sOCTmJqy
	89tTLnkvPHuVqCftzJR44Zf8ZKHbhnM8j46ZUyaCJ3gIaZ0IfMwKvkOz6QFiiSnCt9AtduCfojUK3
	U0x2PODtdVu/WdtEy1rYJoi2dJJkYEkkRvIks6/1G13rRU1BxdnLDDdzQNlCE6wHhr1bJ9pxbUsai
	m/ourlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWc0-0000000GAJZ-1m5I;
	Thu, 01 May 2025 16:18:12 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWa6-0000000GAAU-0gPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1746116174; x=1777652174;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=68WD7LAngpU8BrmhTtDG4Cffchmjc7fJ7Z8I1OciBtw=;
  b=dlTAV+/y4P+6aUYr0DSHaOsJRqdy8ZTikHdAvDRCo8xp4lDn+kzcIm4f
   pUiGWMh8LAVT5VaPtzmkDldkA25QAwPo+ICljWVI9ofCgXmdS78E2q4uc
   0JJ6kxo3JzQJV9m7r9QQwB8a4lfhwShAEapCS0hDM7sZWzhIZ81cZWXh+
   Q=;
X-IronPort-AV: E=Sophos;i="6.15,254,1739836800"; 
   d="scan'208";a="88886624"
Subject: Re: EEVDF regression still exists
Thread-Topic: EEVDF regression still exists
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:16:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:27702]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.121:2525] with esmtp (Farcaster)
 id 283e62a4-dd8d-48b5-a701-5daaa4902eb2; Thu, 1 May 2025 16:16:09 +0000 (UTC)
X-Farcaster-Flow-ID: 283e62a4-dd8d-48b5-a701-5daaa4902eb2
Received: from EX19D002UWA003.ant.amazon.com (10.13.138.235) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 1 May 2025 16:16:08 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D002UWA003.ant.amazon.com (10.13.138.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 1 May 2025 16:16:08 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Thu, 1 May 2025 16:16:08 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>, "Saidi, Ali"
	<alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Blake, Geoff" <blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>,
	"Doebel, Bjoern" <doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>, Joseph Salisbury
	<joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Thread-Index: AQHbuU8Zth8BPweWAUWz5H5EpP8DD7O7MGMA//+vIgCAAK8gAIACE5kA
Date: Thu, 1 May 2025 16:16:07 +0000
Message-ID: <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
 <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
 <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
In-Reply-To: <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.181]
Content-Type: text/plain; charset="utf-8"
Content-ID: <484B6C8D7F1B3F4A8E437F24A6B4BA6E@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_091614_349954_59B8E197 
X-CRM114-Status: GOOD (  14.18  )
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

SGkgUHJhdGVlaywNCg0K77u/T24gMjAyNS0wNC0yOSwgMjI6MzMsICJLIFByYXRlZWsgTmF5YWsi
IDxrcHJhdGVlay5uYXlha0BhbWQuY29tIDxtYWlsdG86a3ByYXRlZWsubmF5YWtAYW1kLmNvbT4+
IHdyb3RlOg0KDQo+Pj4+IEhlcmUgYXJlIHRoZSBsYXRlc3QgcmVzdWx0cyBmb3IgdGhlIEVFVkRG
IGltcGFjdCBvbiBkYXRhYmFzZSB3b3JrbG9hZHMuDQo+Pj4+IFRoZSByZWdyZXNzaW9uIGludHJv
ZHVjZWQgaW4ga2VybmVsIDYuNiBzdGlsbCBwZXJzaXN0cyBhbmQgZG9lc24ndCBsb29rDQo+Pj4+
IGxpa2UgaXQgaXMgaW1wcm92aW5nLg0KPj4+DQo+Pj4gV2VsbCwgSSB3YXMgdW5kZXIgdGhlIGlt
cHJlc3Npb24gaXQgaGFkIGFjdHVhbGx5IGJlZW4gc29sdmVkIDotKA0KPj4+DQo+Pj4gTXkgdW5k
ZXJzdGFuZGluZyBmcm9tIHRoZSBsYXN0IHJvdW5kIHdhcyB0aGF0IFByYXRlZWsgYW5kIGNvIGhh
ZCBpdA0KPj4+IHNvcnRlZCAtLSB3aXRoIHRoZSBjYXZlYXQgYmVpbmcgdGhhdCB5b3UgaGFkIHRv
IHN0aWNrIFNDSEVEX0JBVENIIGluIGF0DQo+Pj4gdGhlIHJpZ2h0IHBsYWNlIGluIE15U1FMIHN0
YXJ0IHNjcmlwdHMgb3Igc29tZXN1Y2guDQo+Pg0KPj4gVGhlIHN0YXRlbWVudCBpbiB0aGUgcHJl
dmlvdXMgdGhyZWFkIFsxXSB3YXMgdGhhdCB1c2luZyBTQ0hFRF9CQVRDSCBpbXByb3Zlcw0KPj4g
cGVyZm9ybWFuY2Ugb3ZlciBkZWZhdWx0LiBXaGlsZSB0aGF0IHN0aWxsIGhvbGRzIHRydWUsIGl0
IGlzIGFsc28gZXF1YWxseSB0cnVlDQo+PiBhYm91dCB1c2luZyBTQ0hFRF9CQVRDSCBvbiBrZXJu
ZWwgNi41Lg0KPj4NCj4+IFNvLCB3aGVuIHdlIGNvbXBhcmUgNi41IHdpdGggcmVjZW50IGtlcm5l
bHMsIGJvdGggdXNpbmcgU0NIRURfQkFUQ0gsIHRoZQ0KPj4gcmVncmVzc2lvbiBpcyBzdGlsbCB2
aXNpYmxlLiAoUHJldmlvdXNseSwgd2Ugb25seSBjb21wYXJlZCBTQ0hFRF9CQVRDSCB3aXRoDQo+
PiA2LjUgZGVmYXVsdCwgbGVhZGluZyB0byB0aGUgd3JvbmcgY29uY2x1c2lvbiB0aGF0IGl0J3Mg
YSBmaXgpLg0KPg0KPiBQLlMuIEFyZSB0aGUgbnVtYmVycyBmb3IgdjYuMTUtcmM0ICsgU0NIRURf
QkFUQ0ggY29tcGFyYWJsZSB0byB2Ni41DQo+IGRlZmF1bHQ/DQoNClNDSEVEX0JBVENIIGRvZXMg
aW1wcm92ZSB0aGUgcGVyZm9ybWFuY2UgYm90aCBvbiA2LjUgYW5kIG9uIDYuMTIrOyBpbiBteSAN
CnRlc3RpbmcsIDYuMTItU0NIRURfQkFUQ0ggZG9lcyBub3QgcXVpdGUgcmVhY2ggdGhlIDYuNS1k
ZWZhdWx0ICh3aXRob3V0DQpTQ0hFRF9CQVRDSCkgcGVyZm9ybWFuY2UuIEJlc3QgY2FzZSAoNi4x
NS1yYzMtU0NIRURfQkFUQ0gpIGlzIC0zLjYlLCBhbmQNCndvcnN0IGNhc2UgKDYuMTUtcmM0LVND
SEVEX0JBVENIKSBpcyAtNy4wJSB3aGVuIGNvbXBhcmVkIHRvIDYuNS4xMy1kZWZhdWx0Lg0KDQoo
UGxlYXNlIGtlZXAgaW4gbWluZCB0aGF0IHRoZSB0YXJnZXQgaXNuJ3QgdG8gZ2V0IFNDSEVEX0JB
VENIIHRvIHRoZSBzYW1lDQpsZXZlbCBhcyA2LjUtZGVmYXVsdDsgaXQncyB0byByZXNvbHZlIHRo
ZSByZWdyZXNzaW9uIGZyb20gNi41LWRlZmF1bHQgdG8NCjYuNisgZGVmYXVsdCwgYW5kIGZyb20g
Ni41LVNDSEVEX0JBVENIIHRvIDYuNisgU0NIRURfQkFUQ0gpLg0KDQo+IE9uZSBtb3JlIGN1cmlv
dXMgcXVlc3Rpb246IERvZXMgY2hhbmdpbmcgdGhlIGJhc2Ugc2xpY2UgdG8gYSBsYXJnZXINCj4g
dmFsdWUgKHNheSA2bXMpIGluIGNvbmp1bmN0aW9uIHdpdGggc2V0dGluZyBTQ0hFRF9CQVRDSCBv
biB2Ni4xNS1yYzQNCj4gYWZmZWN0IHRoZSBiZW5jaG1hcmsgcmVzdWx0IGluIGFueSB3YXk/DQoN
CkkgcmVyYW4gNi4xNS1yYzQsIHdpdGggYm90aCAzbXMgKGRlZmF1bHQpIGFuZCA2bXMuIFRoZSBs
YXJnZXIgYmFzZSBzbGljZQ0Kc2xpZ2h0bHkgaW1wcm92ZXMgcGVyZm9ybWFuY2UsIG1vcmUgZm9y
IFNDSEVEX0JBVENIIHRoYW4gZm9yIGRlZmF1bHQuDQoNCjZtcyBjb21wYXJlZCB0byAzbXMgc2Ft
ZSBrZXJuZWwgKG5vdCBjb21wYXJlZCB0byA2LjUpOg0KDQpLZXJuZWwgICAgICAgICAgICAgICB8
IFRocm91Z2hwdXQgfCBMYXRlbmN5DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLQ0KNi4xNS1yYzQgZGVmYXVsdCAgICAgfCAgKzEuMSUgICAgIHwgIC0xLjMlDQo2
LjE1LXJjNCBTQ0hFRF9CQVRDSCB8ICArMi45JSAgICAgfCAgLTIuNyUNCg0KRnVsbCBkZXRhaWxz
LCByZXBvcnRzIGFuZCBkYXRhOg0KaHR0cHM6Ly9naXRodWIuY29tL2F3cy9yZXByby1jb2xsZWN0
aW9uL2Jsb2IvbWFpbi9yZXByb3MvcmVwcm8tbXlzcWwtRUVWREYtcmVncmVzc2lvbi9yZXN1bHRz
LzIwMjUwNDMwL1JFQURNRS5tZA0KKFRoZXNlIHBlcmYgZmlsZXMgYWxsIGhhdmUgdGhlIHNhbWUg
c2NoZWRzdGF0IHZlcnNpb24sIGhvcGVmdWxseSAicGVyZg0Kc2NoZWQgc3RhdHMgZGlmZiIgd29y
a2VkIGJldHRlciB0aGlzIHRpbWUpLg0KDQotQ3Jpc3RpYW4NCg0K

