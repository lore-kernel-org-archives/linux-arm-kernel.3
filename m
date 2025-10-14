Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023DFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DHLx6gsuw+MXIuw6hDpegzNkV1LsoIxv5qrvoARnmU=; b=unj3JmKL/S4Y6ooaNa/5ALI4Jm
	1cqHAbVVwkcyB72Uyaahxji1LkyA/NRFIEWinxgrJVzlbFIF11P9cVhXGdLfvwpUG7DRFQChH23oD
	scG22BJIuyk98wvZDmKFlp3DUbxnGzUABLcuk6kQ8znzM8UhuF9qgwEPQOwcix0xqOeIY14B7mA5g
	jgCo20fqJ6n41tKxTfsJFd0I46Pi1B2WLlgCIBANBZ2GR3GcTECxvH5MRbrJhMA6BRCFG5PJPllWC
	ln9TwL2oRR77b4p9H7VHvfD2o2eE9TWl5yFZ5qPV9iH/XekgU66Z7WuVTfCJSB1NvvzaBWqo7cuH4
	qvhA4qYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bgP-0000000FpOW-3932;
	Tue, 14 Oct 2025 09:51:05 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bgN-0000000FpMS-0RJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:51:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7DHLx6gsuw+MXIuw6hDpegzNkV1LsoIxv5qrvoARnmU=;
	b=MDf0Qu7UfP2f//YbJLYeLhU9sclJ2y8TGGm5NyR0RQUISYZkoFU57VPrFik1/pOP1UZZpKnQm
	k3TLHogJFyWf89ynVK2X2V6n7qaaJXrmbWzmp9ILZM+HLcET8tK76p4ZjPhrmYnLB/L2SiILXyd
	h5EntZF618TjDuBvpC51l8M=
Received: from frasgout.his.huawei.com (unknown [172.18.146.36])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cm8br13LQz1P6hy;
	Tue, 14 Oct 2025 17:50:47 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cm8Zm0sscz6K6mZ;
	Tue, 14 Oct 2025 17:49:52 +0800 (CST)
Received: from dubpeml100006.china.huawei.com (unknown [7.214.145.132])
	by mail.maildlp.com (Postfix) with ESMTPS id 31B7E1402E9;
	Tue, 14 Oct 2025 17:50:50 +0800 (CST)
Received: from dubpeml500004.china.huawei.com (7.214.147.1) by
 dubpeml100006.china.huawei.com (7.214.145.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Oct 2025 10:50:49 +0100
Received: from dubpeml500004.china.huawei.com ([7.214.147.1]) by
 dubpeml500004.china.huawei.com ([7.214.147.1]) with mapi id 15.02.1544.011;
 Tue, 14 Oct 2025 10:50:49 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Salil Mehta
	<salil.mehta@opnsrc.net>
CC: Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "will@kernel.org" <will@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "mst@redhat.com"
	<mst@redhat.com>, "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "gankulkarni@os.amperecomputing.com"
	<gankulkarni@os.amperecomputing.com>, "wangyanan (Y)"
	<wangyanan55@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
Thread-Topic: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
Thread-Index: AQHcOJEPLIyaftchIkq5VYDgYw17SLS5xPAAgAXz6gCAACTfAIAAYtoAgACrjQCAAGycAIAAEwzg
Date: Tue, 14 Oct 2025 09:50:49 +0000
Message-ID: <6ef5f8d7b52b4eee8dbf9186046e920c@huawei.com>
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
 <86v7koxk1z.wl-maz@kernel.org>
 <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
 <867bwzxe9r.wl-maz@kernel.org>
 <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
 <CAJ7pxebGOj5Z1iW6VPjzj73eY1hZFjS5uXMkee8XCm09DtFcKQ@mail.gmail.com>
 <CAFEAcA8VL4wE2w9PegPD_AVSKCZzzzx-jFru7dDOq4Tz5xs76A@mail.gmail.com>
In-Reply-To: <CAFEAcA8VL4wE2w9PegPD_AVSKCZzzzx-jFru7dDOq4Tz5xs76A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.67.200]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025103_969352_1C947314 
X-CRM114-Status: GOOD (  26.53  )
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

SGkgUGV0ZXIsDQoNCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE0LCAyMDI1IDEwOjMxIEFNDQo+IA0KPiBP
biBUdWUsIDE0IE9jdCAyMDI1IGF0IDA0OjAyLCBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAb3Bu
c3JjLm5ldD4gd3JvdGU6DQo+ID4gT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgNDo0OOKAr1BNIFBl
dGVyIE1heWRlbGwNCj4gPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gPiBU
aGF0IHNhaWQsIFFFTVUncyBjdXJyZW50IGNvZGUgZm9yIHRoaXMgY291bGQgYmUgcmVmYWN0b3Jl
ZCB0byBhdm9pZA0KPiA+ID4gdGhlIHJlc2V0LXRpbWUgcmVhZCBvZiBJQ0NfQ1RMUl9FTDEgZnJv
bSB0aGUga2VybmVsLg0KPiA+ID4gV2UgZG8gdGhpcyBzbyB3ZSBjYW4gc2V0IHRoZSB1c2Vyc3Bh
Y2Ugc3RydWN0IGZpZWxkIGZvciB0aGlzDQo+ID4gPiByZWdpc3RlciB0byB0aGUgcmlnaHQgdmFs
dWUuIEJ1dCB3ZSBjb3VsZCBhc2sgdGhlIGtlcm5lbCBmb3IgdGhhdA0KPiA+ID4gdmFsdWUgb25j
ZSBvbiBWTSBzdGFydHVwIHNpbmNlIGl0J3Mgbm90IGdvaW5nIHRvIGNoYW5nZSBtaWQtcnVuLg0K
PiA+ID4NCj4gPiA+IFRoYXQgd291bGQgYnJpbmcgSUNDX0NUTFJfRUwxIGludG8gbGluZSB3aXRo
IHRoZSBvdGhlciBjcHVpZg0KPiA+ID4gcmVnaXN0ZXJzLCB3aGVyZSBRRU1VIGFzc3VtZXMgaXQg
a25vd3Mgd2hhdCB0aGUga2VybmVsJ3MgcmVzZXQgdmFsdWUNCj4gPiA+IG9mIHRoZW0gaXMgKG1v
c3RseSAiMCIpIGFuZCBkb2Vzbid0IGJvdGhlciB0byBhc2suDQo+ID4gPiBUaGlzIGlzIGRpZmZl
cmVudCBmcm9tIGhvdyB3ZSBoYW5kbGUgT05FX1JFRyBzeXNyZWdzLCB3aGVyZSBJJ20NCj4gPiA+
IHByZXR0eSBzdXJlIHdlIGRvIGFzayB0aGUga2VybmVsIHRoZSB2YWx1ZSBvZiBhbGwgb2YgdGhl
bSBvbiBhIHZjcHUNCj4gPiA+IHJlc2V0LiAoQW5kIHRoZW4gd3JpdGUgdGhlIHZhbHVlcyBiYWNr
IGFnYWluLCB3aGljaCBpcyBhIGJpdCBzaWxseQ0KPiA+ID4gYnV0IG5vYm9keSdzIGV2ZXIgc2Fp
ZCBpdCB3YXMgYSBwZXJmb3JtYW5jZSBwcm9ibGVtIGZvciB0aGVtIDotKSkNCj4gPg0KPiA+DQo+
ID4gVGhpcyBpcyBlZmZlY3RpdmVseSB3aGF0IHRoZSBtZW50aW9uZWQgcGF0Y2ggaW4gdGhlIGNv
bW1pdC1sb2cgaXMgZG9pbmcuDQo+ID4gUGFzdGluZyBoZXJlIGFnYWluOg0KPiA+DQo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDI1MTAwMTAxMDEyNy4zMDkyNjMxLTIy
LXNhbGlsLm1laA0KPiA+IHRhQG9wbnNyYy5uZXQvDQo+IA0KPiBObywgdGhhdCBpcyBub3Qgd2hh
dCBJIGhhdmUgaW4gbWluZC4gV2hhdCBJIG1lYW4gaXMgdGhhdCB3ZSBjYW4ganVzdCByZWFkIHRo
ZQ0KPiBJQ0NfQ1RMUl9FTDEgdmFsdWUgb25jZSBvbiBzdGFydHVwIChpbiBvdXIgcmVhbGl6ZSBt
ZXRob2QsIEkgdGhpbmspIGFuZCB0aGVuDQo+IHVzZSB0aGF0IHZhbHVlIGluIHJlc2V0LiBUaGF0
IHNob3VsZCBub3QgcmVxdWlyZSBhbnkgb2YgdGhhdCBtYWNoaW5lcnkgdG8NCj4gcGF1c2UgdGhl
IFZNIGFuZCBrZWVwIHJldHJ5aW5nLg0KDQoNCkluZGVlZCBhbmQgdGhhdOKAmXMgd2hhdCBJIGRp
ZCBpbml0aWFsbHkgYW5kIGhhZCBmZXRjaGVkIHRoZSB2YWx1ZSBvbmNlIGluIEdJQ3YzDQpyZWFs
aXplIGJ1dCBpdCBodW5nIHRoZSBWTSBpbml0aWFsaXphdGlvbiBsZWcgZHVyaW5nIGFjY2Vzcy4N
Cg0KQlRXLCBjYW4gd2Ugc2FmZWx5IGFzc3VtZSB0aGF0IHZhbHVlIG9mIHRoaXMgcmVnaXN0ZXIg
d2lsbCBiZSBzYW1lIGFjcm9zcyBhbGwNCnZDUFVzIChpLmUuIGlzIGp1c3QgZm9yIFNNUCBjYXNl
IGFuZCBpZ25vcmUgaGV0ZXJvZ2Vub3VzKT8gDQoNCg0KQmVzdCByZWdhcmRzDQpTYWxpbA0KDQoN
Cj4gDQo+IC0tIFBNTQ0K

