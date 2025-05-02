Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD30AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26hkBOX6SosTAb5YFKXego/kgdS2SaV+sWyHWN5vTkY=; b=rm0uz0/HFRNg/ijf08HuoW6ekw
	Yfzf+HKCNnEX3Hhq+LURAHYfwv5nU5tvyNlwxGVCXIJjp3Aym0/yiM/jYWj/zoQD4yRDSDMSWoHxd
	cNb7zgn/PpyNXcvlZb/zNRiN2hv7xqUqAzagaz4nZj2T0veHotinO6k8a0GyRjbBKf2Vw7zBuJXYP
	utRPNfFG49qrOaJrM/4fuxncsoQxnfeLU1YYlE7LUGtpqCyPpdcpJsyyMKTM/UmBp4F6/sVVjzZ+K
	UjYVhqobtKt175Nt4zh7xYxGoRrcDV71a7vwNeELuDYCFQAATu3UmDk4UIxmGkUylgXkkBzNCDMuE
	GhqertHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6T-00000002e6f-0Tfo;
	Fri, 02 May 2025 17:23:13 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtcu-00000002Zya-36J7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1746204761; x=1777740761;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=26hkBOX6SosTAb5YFKXego/kgdS2SaV+sWyHWN5vTkY=;
  b=u5GuFUfpW9208nh4WyuXl3Qp6Q8hwwED5qnRTQ1P5qD/NLSnrwHd8AjJ
   OK/X5Dq/gsZ4JmGlkLK5f0Dsk7im/wppomX6WpbZd8BPtxu1uuQstS3UY
   W9Gn5ZbTrTf5a4LelnCxKK0rNrali7vNAxA05bt/BSbH3fncU1sbQyZs2
   o=;
X-IronPort-AV: E=Sophos;i="6.15,257,1739836800"; 
   d="scan'208";a="401365857"
Subject: Re: EEVDF regression still exists
Thread-Topic: EEVDF regression still exists
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 16:52:40 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:54137]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.224:2525] with esmtp (Farcaster)
 id 9bdfdfaf-bb97-4a6a-9618-f4a74663dc15; Fri, 2 May 2025 16:52:39 +0000 (UTC)
X-Farcaster-Flow-ID: 9bdfdfaf-bb97-4a6a-9618-f4a74663dc15
Received: from EX19D002UWA003.ant.amazon.com (10.13.138.235) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 16:52:39 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D002UWA003.ant.amazon.com (10.13.138.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 16:52:38 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Fri, 2 May 2025 16:52:38 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, "Mohamed Abuelfotoh, Hazem"
	<abuehaze@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, "Blake, Geoff"
	<blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>, "Doebel, Bjoern"
	<doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>, Swapnil Sapkal
	<swapnil.sapkal@amd.com>, Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Thread-Index: AQHbuU8Zth8BPweWAUWz5H5EpP8DD7O7MGMA//+vIgCAAK8gAIACE5kAgAFpKQCAADNhAA==
Date: Fri, 2 May 2025 16:52:38 +0000
Message-ID: <935376C2-71B9-4E41-9738-99A4BCC55B48@amazon.com>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
 <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
 <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
 <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
 <20250502084844.GT4198@noisy.programming.kicks-ass.net>
In-Reply-To: <20250502084844.GT4198@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.181]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D14B31FC3DA854E8AD8251CD7584CBE@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095240_863739_D795DFD3 
X-CRM114-Status: GOOD (  13.08  )
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

T24gMjAyNS0wNS0wMiwgMDM6NTAsICJQZXRlciBaaWpsc3RyYSIgPHBldGVyekBpbmZyYWRlYWQu
b3JnIDxtYWlsdG86cGV0ZXJ6QGluZnJhZGVhZC5vcmc+PiB3cm90ZToNCg0KPiBPbiBUaHUsIE1h
eSAwMSwgMjAyNSBhdCAwNDoxNjowN1BNICswMDAwLCBQcnVuZGVhbnUsIENyaXN0aWFuIHdyb3Rl
Og0KPiANCj4+IChQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQgdGhlIHRhcmdldCBpc24ndCB0byBn
ZXQgU0NIRURfQkFUQ0ggdG8gdGhlIHNhbWUNCj4+IGxldmVsIGFzIDYuNS1kZWZhdWx0OyBpdCdz
IHRvIHJlc29sdmUgdGhlIHJlZ3Jlc3Npb24gZnJvbSA2LjUtZGVmYXVsdCB0bw0KPj4gNi42KyBk
ZWZhdWx0LCBhbmQgZnJvbSA2LjUtU0NIRURfQkFUQ0ggdG8gNi42KyBTQ0hFRF9CQVRDSCkuDQo+
DQo+IE5vLCB0aGUgdGFyZ2V0IGRlZmluaXRlbHkgaXMgbm90IHRvIG1ha2UgNi42KyBkZWZhdWx0
IG1hdGNoIDYuNSBkZWZhdWx0Lg0KPg0KPiBUaGUgdGFyZ2V0IHZlcnkgbXVjaCBpcyBnZXR0aW5n
IHlvdSBwZXJmb3JtYW5jZSBzaW1pbGFyIHRvIHRoZSA2LjUNCj4gZGVmYXVsdCB0aGF0IHlvdSB3
ZXJlIGhhcHB5IHdpdGggd2l0aCBrbm9icyB3ZSBjYW4gbGl2ZSB3aXRoLg0KDQpJZiB3ZSdyZSB0
YWxraW5nIGFib3V0IG5ldyBrbm9icyBpbiA2LjYrLCBhYnNvbHV0ZWx5Lg0KDQpGb3IgdGhpcyBw
YXJ0aWN1bGFyIGNhc2UsIFNDSEVEX0JBVENIIGV4aXN0ZWQgYmVmb3JlIDYuNi4gVXNlcnMgd2hv
IGFscmVhZHkNCmVuYWJsZSBTQ0hFRF9CQVRDSCBub3cgaGF2ZSBubyByZWNvdXJzZS4gV2UgY2Fu
J3QsIHdpdGggYSBzdHJhaWdodCBmYWNlLA0KY2xhaW0gdGhhdCB0aGlzIGlzIGEgc3VmZmljaWVu
dCBmaXgsIG9yIHRoYXQgdGhlcmUgaXMgbm8gcmVncmVzc2lvbi4NCg0KSSBhbSwgb2YgY291cnNl
LCBpbnRlcmVzdGVkIHRvIGRpc2N1c3MgYW55IGtub2IgdHdlYWtzIGFzIGEgc3RvcC1nYXAgbWVh
c3VyZS4NCihUaGF0IGlzIGFsc28gd2h5IEkgcHJvcG9zZWQgbW92aW5nIE5PX1BMQUNFX0xBRyBh
bmQgTk9fUlVOX1RPX1BBUklUWSB0byBzeXNjdGwNCmEgZmV3IG1vbnRocyBiYWNrOiB0byBnaXZl
IHVzZXJzLCBpbmNsdWRpbmcgZGlzdHJvIG1haW50YWluZXJzLCBhIHJlYXNvbmFibGUNCndheSB0
byBwcmVjb25maWd1cmUgdGhlaXIgc3lzdGVtcyBpbiBhIHN0YW5kYXJkLCBwZXJzaXN0ZW50IHdh
eSwgd2hpbGUgdGhpcyBpcw0KYmVpbmcgd29ya2VkIG9uKS4NCk5vbmUgb2YgdGhpcyBzaG91bGQg
YmUgY29uc2lkZXJlZCBhIHBlcm1hbmVudCBzb2x1dGlvbiB0aG91Z2guIEl0J3Mgbm90IGEgZml4
LA0KYW5kIHdhcyBuZXZlciBtZWFudCB0byBiZSBhbnl0aGluZyBidXQgYSBzaG9ydC10ZXJtIHJl
bGllZiB3aGlsZSBkZWJ1Z2dpbmcgdGhlDQpyZWdyZXNzaW9uIGlzIG9uZ29pbmcuDQoNCg0K

