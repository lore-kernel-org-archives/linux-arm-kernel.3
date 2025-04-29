Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36FEC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qtA1j0MhbLF0zo1Nt4V6pirpw6boJzLVrd/FQprni8=; b=wKyiaK8PtuSMOeNstG5y68Xkz0
	/82QvDBtQAS9HSf0Raj1E+Cst6efevNs95Zy/T8E+4ZnWtWrSZS/1WDpr+8eOW9YlwugEOtMqMSVb
	UeImNllYS0FKXi+PcvuDteTic4hqB/1lPvMA2MmNQ5t4uxcGJsaZB35mPmE8O6V3kUWGPUZeJth8D
	cZ0aMTG7efzUNOy22gxEVFrx0FbTIKgp0Q9hOf2CnEzWarHXEv3StAd8tdp3iMVLaKwd3v+3cQeCj
	tPMi7NHxu3oUvmGCEa0nAyg0I5ZQHlLBRnXIvMuY7YpRw0LEg4LmoZ1Tg3jEQ2X1FWpr2FxJ6LTl0
	MlCmLhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9t9P-0000000Awkr-22F7;
	Tue, 29 Apr 2025 22:10:03 +0000
Received: from smtp-fw-80009.amazon.com ([99.78.197.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9t6C-0000000AwRe-1Y6T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 22:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1745964404; x=1777500404;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=1qtA1j0MhbLF0zo1Nt4V6pirpw6boJzLVrd/FQprni8=;
  b=d2jpslmkyWaEYu6zVf2BJgZNIq8149bb4kze6nZ89y+Gbx+6dlJlPofc
   0g+oUFzojiOSK7NfMQN3/Eqkumw6u4zgW9Hxbx/JI0b6lfH/EN6TRxvGX
   rRLzhB7bim5vX3Wg93vGrD9vMh3pXahp97oHw4msEPjRErKpGO7LrdZDR
   c=;
X-IronPort-AV: E=Sophos;i="6.15,250,1739836800"; 
   d="scan'208";a="195640350"
Subject: Re: EEVDF regression still exists
Thread-Topic: EEVDF regression still exists
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:06:41 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:17678]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.30.21:2525] with esmtp (Farcaster)
 id 6f501886-48f9-40e5-bb89-67048c5aa3e8; Tue, 29 Apr 2025 22:06:41 +0000 (UTC)
X-Farcaster-Flow-ID: 6f501886-48f9-40e5-bb89-67048c5aa3e8
Received: from EX19D002UWC001.ant.amazon.com (10.13.138.148) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 29 Apr 2025 22:06:40 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D002UWC001.ant.amazon.com (10.13.138.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 29 Apr 2025 22:06:40 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Tue, 29 Apr 2025 22:06:40 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, "Mohamed Abuelfotoh, Hazem"
	<abuehaze@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, "Blake, Geoff"
	<blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>, "Doebel, Bjoern"
	<doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>, Swapnil Sapkal
	<swapnil.sapkal@amd.com>, Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov
	<bp@alien8.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Thread-Index: AQHbuU8Zth8BPweWAUWz5H5EpP8DD7O7MGMA//+vIgA=
Date: Tue, 29 Apr 2025 22:06:40 +0000
Message-ID: <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
In-Reply-To: <20250429215604.GE4439@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.67]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA0471B48DE52F47B5D491744D0CD7D6@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_150644_445659_70AEB6D1 
X-CRM114-Status: GOOD (  12.39  )
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

T24gMjAyNS0wNC0yOSwgMTY6NTcsICJQZXRlciBaaWpsc3RyYSIgPHBldGVyekBpbmZyYWRlYWQu
b3JnIDxtYWlsdG86cGV0ZXJ6QGluZnJhZGVhZC5vcmc+PiB3cm90ZToNCg0KPj4gSGVyZSBhcmUg
dGhlIGxhdGVzdCByZXN1bHRzIGZvciB0aGUgRUVWREYgaW1wYWN0IG9uIGRhdGFiYXNlIHdvcmts
b2Fkcy4NCj4+IFRoZSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4ga2VybmVsIDYuNiBzdGlsbCBw
ZXJzaXN0cyBhbmQgZG9lc24ndCBsb29rDQo+PiBsaWtlIGl0IGlzIGltcHJvdmluZy4NCj4NCj4g
V2VsbCwgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gaXQgaGFkIGFjdHVhbGx5IGJlZW4gc29s
dmVkIDotKA0KPg0KPiBNeSB1bmRlcnN0YW5kaW5nIGZyb20gdGhlIGxhc3Qgcm91bmQgd2FzIHRo
YXQgUHJhdGVlayBhbmQgY28gaGFkIGl0DQo+IHNvcnRlZCAtLSB3aXRoIHRoZSBjYXZlYXQgYmVp
bmcgdGhhdCB5b3UgaGFkIHRvIHN0aWNrIFNDSEVEX0JBVENIIGluIGF0DQo+IHRoZSByaWdodCBw
bGFjZSBpbiBNeVNRTCBzdGFydCBzY3JpcHRzIG9yIHNvbWVzdWNoLg0KDQpUaGUgc3RhdGVtZW50
IGluIHRoZSBwcmV2aW91cyB0aHJlYWQgWzFdIHdhcyB0aGF0IHVzaW5nIFNDSEVEX0JBVENIIGlt
cHJvdmVzIA0KcGVyZm9ybWFuY2Ugb3ZlciBkZWZhdWx0LiBXaGlsZSB0aGF0IHN0aWxsIGhvbGRz
IHRydWUsIGl0IGlzIGFsc28gZXF1YWxseSB0cnVlDQphYm91dCB1c2luZyBTQ0hFRF9CQVRDSCBv
biBrZXJuZWwgNi41Lg0KDQpTbywgd2hlbiB3ZSBjb21wYXJlIDYuNSB3aXRoIHJlY2VudCBrZXJu
ZWxzLCBib3RoIHVzaW5nIFNDSEVEX0JBVENILCB0aGUNCnJlZ3Jlc3Npb24gaXMgc3RpbGwgdmlz
aWJsZS4gKFByZXZpb3VzbHksIHdlIG9ubHkgY29tcGFyZWQgU0NIRURfQkFUQ0ggd2l0aCANCjYu
NSBkZWZhdWx0LCBsZWFkaW5nIHRvIHRoZSB3cm9uZyBjb25jbHVzaW9uIHRoYXQgaXQncyBhIGZp
eCkuDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZmViMzFiNmUtNjQ1Ny00NTRj
LWE0ZjMtY2U4YWQ5NmJmOGRlQGFtZC5jb20vDQoNCg==

