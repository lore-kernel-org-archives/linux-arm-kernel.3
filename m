Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666FDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS7uCcAyO6TK8Lqrw3mZ6CwhfXeIUn693875cdI6HEA=; b=1h8KpqjZ9l7egLslgG3FMHlcRU
	PHux/DwqdCCShEFh/GcgrN5ZF9mJ16nDCF8zPTgv10fxOYcWwSlyIupXJEyATNjzKgwEmbnhL6jGr
	1AYNBZs/2wTm82CbI7cGYomFyqmkeTtaZv/quE8nAvKjLiezp+ObUrVljbMHDM34CXqm01FJELPx3
	Zhpo2Pcs8PftSAI9zESYTA5BTKOYd4SxYAWmWlFbUXDNJC797tXJDrJUsL6woH0+XI6b4ZkJR+H8g
	zwve4kwRYtqGFwB5S63BjUY/PD9Q5o1Qrduz9GO1wvtYmlgS3bPv4Zfmu6WCj92jLq7n9Jxq31r7l
	lTmQh7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyJf-00000000lFL-1RLs;
	Mon, 21 Jul 2025 21:44:59 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyHC-00000000l2g-2mr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 21:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1753134147; x=1784670147;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=VS7uCcAyO6TK8Lqrw3mZ6CwhfXeIUn693875cdI6HEA=;
  b=oP9GNBpSkWXc46k5R6tbeuHJ3ISWoZt7FxDJ3YxuHpS/Bhk7WPj5Fb+s
   /6AhOOPFmbVrn2z9gm2EPCBFc23/j+KefVMUqKUSHUgaqfzMQioj+Y+9k
   3zXZVO2WHHRjV9M3N5SViUelR9ReoBr2cU1B+DTMfUDqpg9Pn7W86KCEY
   Zz7+MpP23xCk7B/jTtOxYqdg7Bqz3W4dt9uOg25hyKFqblANP1h+3kSDV
   3fi2HJr6bzCAh+LPv9bgJd4kakbFNX07qnG5qfbHqQyHu0m9Fcvp0rJON
   B1JKbiyCj954dFYDFavsJ+hdkcaEjA/lAK2Fb8LYKo4//oI6yE6wwiA1k
   w==;
X-IronPort-AV: E=Sophos;i="6.16,330,1744070400"; 
   d="scan'208";a="539958808"
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
Thread-Topic: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 21:42:25 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:14197]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.31:2525] with esmtp (Farcaster)
 id 0a95af2c-2a6f-46fb-8625-c804f6688da7; Mon, 21 Jul 2025 21:42:24 +0000 (UTC)
X-Farcaster-Flow-ID: 0a95af2c-2a6f-46fb-8625-c804f6688da7
Received: from EX19D016UWA001.ant.amazon.com (10.13.139.69) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 21 Jul 2025 21:42:23 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D016UWA001.ant.amazon.com (10.13.139.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 21 Jul 2025 21:42:23 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Mon, 21 Jul 2025 21:42:23 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel
	<ardb@kernel.org>, Mark Brown <broonie@kernel.org>
Thread-Index: AQHb9/A+GXacjKcbMUOUF0yLLPaABbQ8zPsA
Date: Mon, 21 Jul 2025 21:42:23 +0000
Message-ID: <82AA504A-E3D8-479E-A625-306004E1850F@amazon.com>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
In-Reply-To: <20250718142814.133329-1-ada.coupriediaz@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Enabled=true;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_SetDate=2025-07-21T17:36:06Z;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_ContentBits=0;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Enabled=true;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Tag=50,
 3, 0,
 1;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Name=Confidential;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_ActionId=777b07be-8eac-4dbd-a924-ade48bfbfa02;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_SiteId=5280104a-472d-4538-9ccf-1e1d0efe8b1b;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Method=Standard;
x-originating-ip: [10.13.138.67]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5649A3661C2D4F4B89635D4C93C9AEE5@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_144226_748747_E19328E2 
X-CRM114-Status: GOOD (  11.20  )
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

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgMDM6Mjg6MTRQTSArMDEwMCwgQWRhIENvdXByaWUgRGlh
eiB3cm90ZToNCg0KPiBDb21wbGV0ZWx5IG1hc2sgREFJRiBpbiBgY3B1X3N3aXRjaF90bygpYCBh
bmQgcmVzdG9yZSBpdCB3aGVuIHJldHVybmluZy4NCj4gRG8gdGhlIHNhbWUgaW4gYGNhbGxfb25f
aXJxX3N0YWNrKClgLCBidXQgcmVzdG9yZSBhbmQgbWFzayBhcm91bmQNCj4gdGhlIGJyYW5jaC4N
Cj4gTWFzayBEQUlGIGV2ZW4gaWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNLIGlzIG5vdCBlbmFi
bGVkIGZvciBjb25zaXN0ZW5jeQ0KPiBvZiBiZWhhdmlvdXIgYmV0d2VlbiBhbGwgY29uZmlndXJh
dGlvbnMuDQo+DQo+IEludHJvZHVjZSBhbmQgdXNlIGFuIGFzc2VtYmx5IG1hY3JvIGZvciBzYXZp
bmcgYW5kIG1hc2tpbmcgREFJRiwNCj4gYXMgdGhlIGV4aXN0aW5nIG9uZSBzYXZlcyBidXQgb25s
eSBtYXNrcyBJRi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWRhIENvdXByaWUgRGlheiA8YWRhLmNv
dXByaWVkaWF6QGFybS5jb20+DQo+IFJlcG9ydGVkLWJ5OiBDcmlzdGlhbiBQcnVuZGVhbnUgPGNw
cnVAYW1hem9uLmNvbT4NCj4gRml4ZXM6IDU5YjM3ZmU1MmY0OTk1NTc5MWE0NjA3NTJjMzcxNDVm
MWFmZGNhZDEgKCJhcm02NDogU3Rhc2ggc2hhZG93IHN0YWNrIHBvaW50ZXIgaW4gdGhlIHRhc2sg
c3RydWN0IG9uIGludGVycnVwdCIpDQoNCkNvbmZpcm1pbmcgdGhpcyBmaXhlcyB0aGUgc3BvbnRh
bmVvdXMgcmVib290IHByZXZpb3VzbHkgb2JzZXJ2ZWQgd2hlbg0KZW5hYmxpbmcgYm90aCBwc2V1
ZG8tTk1JIChpcnFjaGlwLmdpY3YzX3BzZXVkb19ubWk9MSkgYW5kIHNoYWRvdyBjYWxsDQpzdGFj
ayAoQ09ORklHX1NIQURPV19DQUxMX1NUQUNLPXkpLiBUZXN0ZWQgYm90aCBvbiBrZXJuZWwgNi4x
Ni1yYzcgYW5kDQpsZWdhY3kga2VybmVsIDYuOCB3aGVyZSB0aGUgaXNzdWUgd2FzIGluaXRpYWxs
eSBvYnNlcnZlZC4NCg0KVGVzdGVkLWJ5OiBDcmlzdGlhbiBQcnVuZGVhbnUgPGNwcnVAYW1hem9u
LmNvbT4NCg0KLUNyaXN0aWFuDQoNCg==

