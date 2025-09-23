Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E8CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KXYO8/Bm9DXMCe3t4S4ugeHDvQmxrq0oPCZUEzD2eI=; b=FwfHRbfhmtNp83kl9kQHsur8hb
	wTDP2t1bqhLieMHkg4TS6vUVxxYs/3boldOMpb7mWlbzyasneQx7C3O/eQG0OsP/yjU3qSkUN9+0V
	5XhQl/UI/69YaceEyPSnfwSK19vnMLTkAv/NFJ0PTKDTTLjfJ2QcVk2mbGxoV1jlFOHe+ljKtUnlb
	pxrBbuwO9BpAvZqvenPcbQJFu3/REtEInAYRfdjZdkNgDvRD/Mhxa4jRVP8ALBHRHZcgOLPCtRtDm
	C+s4ZRl473h7ScHd9vsIOkH294RxiE+7poaIcv92/oYZ4BifuPVbIEM42u0G/MF1y5T35qB5R08Dl
	AWqz9lEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yYT-0000000CppZ-1Dvi;
	Tue, 23 Sep 2025 08:39:21 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yYP-0000000Cpp7-30Oe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 08:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758616757; x=1790152757;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5KXYO8/Bm9DXMCe3t4S4ugeHDvQmxrq0oPCZUEzD2eI=;
  b=epX7LluQez+7aZkMxNe3bGzZaC/7+PX2hoCT4HMMEtrZgZtmsMTtbtHb
   sPLR5YbRfiUsngBhWmLvpjZ1FUCoXfAsxhMtsI2ovQrUQ+kXdc16Ly9Vt
   Z88J5qqr+c0jO+jUBhUxvB+kqwYTYzQLHwtE5Gy0+mM/fCx5VULrBftyP
   69O/S0VfVxpOWStAHWFoe5QohZrZJca0koY/i3OI+/L+kplPUx/JOECMl
   HG7sUagMPZ+jJMKUbNLsxj9ukrX0tqQDXVgFCoSTYNdTvKEKwttVB2a0O
   iGzvr0+I1AVHBeKl3PY6+gvjN5VeFFYMzcZ/mYD9j+IVfrDQrQU4Rfo1T
   A==;
X-CSE-ConnectionGUID: Tb/wMrrNQ5+sRYUoh6j56A==
X-CSE-MsgGUID: qx5d8uHqSAK98pM/Q/bnUA==
X-IronPort-AV: E=Sophos;i="6.18,281,1751241600"; 
   d="scan'208";a="3552561"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 08:39:13 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:3772]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.110:2525] with esmtp (Farcaster)
 id 4f49d128-0360-4923-9b19-64f0ae0d438e; Tue, 23 Sep 2025 08:39:13 +0000 (UTC)
X-Farcaster-Flow-ID: 4f49d128-0360-4923-9b19-64f0ae0d438e
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 23 Sep 2025 08:39:12 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 23 Sep 2025
 08:39:09 +0000
Message-ID: <97759f51-385b-4ce4-8766-d00ed5af580b@amazon.com>
Date: Tue, 23 Sep 2025 10:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Implement KVM_TRANSLATE ioctl for arm64
To: Priscilla Lam <prl@amazon.com>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <christoffer.dall@arm.com>, <dwmw@amazon.co.uk>, <gurugubs@amazon.com>,
	<jgrall@amazon.co.uk>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>
References: <86frcd1tp4.wl-maz@kernel.org>
 <20250923082955.66602-1-prl@amazon.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20250923082955.66602-1-prl@amazon.com>
X-Originating-IP: [172.19.99.218]
X-ClientProxiedBy: EX19D037UWB003.ant.amazon.com (10.13.138.115) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_013917_879605_B0E72C70 
X-CRM114-Status: GOOD (  12.17  )
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

SGkgUHJpc2NpbGxhLAoKT24gMjMuMDkuMjUgMTA6MjksIFByaXNjaWxsYSBMYW0gd3JvdGU6Cj4g
SGkgT2xpdmVyIGFuZCBNYXJjLAo+Cj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZmVlZGJhY2su
Cj4KPj4gQnV0IGF0IHRoZSBlbmQgb2YgdGhlIGRheSwgd2hhdCBkbyB5b3UgbmVlZCBLVk1fVFJB
TlNMQVRFIGZvcj8gVGhpcwo+PiBpbnRlcmZhY2UgaXMgYW4gYWJzb2x1dGUgdHVyZCB0aGF0IGlz
IHVuYWJsZSB0byByZXByZXNlbnQgdGhlIGJhcmUKPj4gbWluaW11bSBvZiB0aGUgYXJjaGl0ZWN0
dXJlICh3cml0YWJsZSBieSB3aG9tPyBwaHlzaWNhbCBhZGRyZXNzIGluCj4+IHdoaWNoIHRyYW5z
bGF0aW9uIHJlZ2ltZT8gd2hhdCBhYm91dCBTMiB0cmFuc2xhdGlvbnM/KSwgYW5kIGlzIGJldHRl
cgo+PiBsZWZ0IGluIHRoZSAidXR0ZXIgYnJhaW4gZmFydCIgY2F0ZWdvcnkuCj4gUmVnYXJkaW5n
IG1vdGl2YXRpb24sIHRoaXMgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gZ2l2ZSBhIHVzZXJzcGFjZSB2
bW0KPiB0aGUgYWJpbGl0eSB0byBoYW5kbGUgbm9uLUlTViBndWVzdCBmYXVsdHMuIFRoZSBBcm0g
QXJtIChEREkgMDQ4N0wuYiwKPiBzZWN0aW9uIEIzLjEzLjYpIG5vdGVzIHRoYXQgZm9yIGxvYWQv
c3RvcmUgcGFpciBmYXVsdHMsIHRoZSBzeW5kcm9tZQo+IG1heSBub3QgcHJvdmlkZSB0aGUgc3Bl
Y2lmaWNzIG9mIHRoZSBhY2Nlc3MgdGhhdCBmYXVsdGVkLiBJbiB0aG9zZQo+IGNhc2VzLCB0aGUg
dm1tIG11c3QgbWFudWFsbHkgZGVjb2RlIHRoZSBpbnN0cnVjdGlvbiB0byBlbXVsYXRlIGl0LiBU
aGUKPiBpbnRyb2R1Y3Rpb24gb2YgS1ZNX0NBUF9BUk1fTklTVl9UT19VU0VSCj4gKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2t2bS8yMDE5MTEyMDE2NDIzNi4yOTM1OS0yLW1hekBrZXJuZWwub3Jn
LykKPiBzZWVtcyB0byBoYXZlIGFudGljaXBhdGVkIHRoYXQgZmxvdyBieSBhbGxvd2luZyBleGl0
cyB0byB1c2Vyc3BhY2Ugb24KPiB0cmFwcGVkIE5JU1YgaW5zdHJ1Y3Rpb25zLiBXaGF0IGlzIHN0
aWxsIG1pc3NpbmcgaXMgYSByZWxpYWJsZSB3YXkgZm9yCj4gdXNlcnNwYWNlIHRvIHF1ZXJ5IFZB
LT5JUEEgdHJhbnNsYXRpb25zIGluIG9yZGVyIHRvIGNvbXBsZXRlIGVtdWxhdGlvbi4KCgpBbGwg
bW9kZXJuIE9TcyBjb25zdHJhaW4gdGhlbXNlbHZlcyB0byBvbmx5IElTViBlbmFibGVkIE1NSU8g
Cmluc3RydWN0aW9ucy4gTklTViBpcyByZWFsbHkgb25seSB1c2VmdWwgdG8gcnVuIG5vbiBoeXBl
cnZpc29yIAplbmxpZ2h0ZW5lZCBndWVzdHMuIERpZCB5b3UgZW5jb3VudGVyIGEgcmVhbCB3b3Js
ZCBPUyB0aGF0IHdhcyBjYXVzaW5nIApOSVNWIGZhdWx0cz8gQW5kIGlmIHNvLCB3aGF0IHdhcyBj
YXVzaW5nIHRoZXNlPyBJdCdzIG1vc3QgbGlrZWx5IGEgCmRyaXZlciBvciBPUyBidWcuCgpBbGV4
CgoKCgpBbWF6b24gV2ViIFNlcnZpY2VzIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgK
VGFtYXJhLURhbnotU3RyLiAxMwoxMDI0MyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJp
c3RpYW4gU2NobGFlZ2VyCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJn
IHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAzNjUgNTM4IDU5Nwo=


