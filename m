Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C2CCCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4h8rQG1tya0UvXnBaG8RqdgzUhep7+CUEBbLd/O0bM=; b=nTUu+64UWptCD3A+8hYG3cItVv
	+pEOES9OlpfsoEia0S5EB7f9m7VM2CwGRFS0qUoaE4saoTQD4z+chvp68CHh6o/Bt8kcPUlsp3YBl
	MrR38Laf+2zXzDaQg2W1G6WFrd+b70upScTmjftpcNLvNidNx/pJDk+St+m/0qiOJhISEt9Nh+Xz1
	+hwOX+EtViH9Ylt4hGqwLOusGN/78dhvdQzvxbZBwqRIJwjOffd+Lhx1FXlelaAIwZdQOlhqssE/d
	CFTUW8WdcykeTGWvtnxbUtYr/DfhSM0uliN9ysTcuF5N4sWlUenPulenBgm8HLJcUo/1k7+P7lARX
	A6Xrp9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyrp-00000004WH4-0UbA;
	Sat, 17 Oct 2026 07:30:13 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyrl-00000004WGC-30Cu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/4h8rQG1tya0UvXnBaG8RqdgzUhep7+CUEBbLd/O0bM=; b=I
	+hWMyTzNzbXkGVNqCXJpeEddB3ni7/c7dlHMBiVY3viWTY5u7z+la0a2+m31i8yN
	REkEiVq0ad2eBdbPI4UNeeCLPV2rxfj0XyRYH5kB05FTo3JusIcjlqxIa1oithcu
	Tm0TX62BJ6FCql1AV13qBjFvBI8+x9OVQ1hjgLGwJo=
Date: Sat, 17 Oct 2026 15:29:57 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
	"Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 3/6] irqchip/gic-v3: validate MADT records before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-4-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-4-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUki4SKaYukdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHl8Hi+oaA7ckkAHM96GA9bg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5021b4c.183b.1a148c475f6.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgD3X4b1I9NqQvtaAA--.139W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRWVz2rTI-UKNwAA3Q
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_003006_156648_B844B030 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

QXQgMjAyNi0xMC0xNiAyMjoxMzo1NCwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgR0lDdjMgQUNQSSBwYXRocyBjYXN0IGdlbmVyaWMgTUFEVCBoZWFkZXJzIHRv
IGRpc3RyaWJ1dG9yLAo+cmVkaXN0cmlidXRvciwgYW5kIENQVSBpbnRlcmZhY2UgcmVjb3JkcyBi
ZWZvcmUgY29uZmlybWluZyB0aGF0IHRoZQo+Y29ycmVzcG9uZGluZyBmaXhlZC1zaXplIHN0cnVj
dHVyZXMgYXJlIHByZXNlbnQuIFRydW5jYXRlZCByZWNvcmRzIGNhbgo+dGhlcmVmb3JlIGNhdXNl
IG91dC1vZi1ib3VuZHMgZmllbGQgcmVhZHMgd2hpbGUgcHJvYmluZyBvciBzZXR0aW5nIHVwCj52
aXJ0dWFsaXphdGlvbiBkYXRhLgo+Cj5DaGVjayBlYWNoIHR5cGVkIE1BRFQgcmVjb3JkIGJlZm9y
ZSBpdHMgZmlyc3QgZmllbGQgYWNjZXNzLiBBbHNvIHJlamVjdAo+YSBzaG9ydCBkaXN0cmlidXRv
ciByZWNvcmQgaW4gdGhlIHZlcnNpb24gdmFsaWRhdG9yLCB3aGljaCBydW5zIGJlZm9yZQo+dGhl
IHByb2JlIGNhbGxiYWNrLgo+CkZpeGVzOiBmZmE3ZDYxNjZhOTYgKCJpcnFjaGlwL2dpYy12Mzog
QWRkIEFDUEkgc3VwcG9ydCBmb3IgR0lDdjMvNCBpbml0aWFsaXphdGlvbiIpCkZpeGVzOiBiNzBm
YjdhZjY3MTUgKCJpcnFjaGlwL2dpYy12MzogQUNQSTogQWRkIHJlZGlzdHJpYnV0b3Igc3VwcG9y
dCB2aWEgR0lDQyBzdHJ1Y3R1cmVzIikKRml4ZXM6IDE4MzllNTc2OTY4ZiAoImlycWNoaXAvZ2lj
LXYzOiBQYXJzZSBhbmQgZXhwb3J0IHZpcnR1YWwgR0lDIGluZm9ybWF0aW9uIikKCj5TaWduZWQt
b2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMvaXJx
Y2hpcC9pcnEtZ2ljLXYzLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1n
aWMtdjMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMKPmluZGV4IDZlMWZhNWIyNDdm
Yy4uMDU4OGQ2ZDgzYjMxIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMu
Ywo+KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYwo+QEAgLTIyOTksNiArMjI5OSw5
IEBAIGdpY19hY3BpX3BhcnNlX21hZHRfcmVkaXN0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVy
cyAqaGVhZGVyLAo+IAkJCShzdHJ1Y3QgYWNwaV9tYWR0X2dlbmVyaWNfcmVkaXN0cmlidXRvciAq
KWhlYWRlcjsKPiAJdm9pZCBfX2lvbWVtICpyZWRpc3RfYmFzZTsKPiAKPisJaWYgKEJBRF9NQURU
X0VOVFJZKHJlZGlzdCwgZW5kKSkKPisJCXJldHVybiAtRUlOVkFMOwo+Kwo+IAlyZWRpc3RfYmFz
ZSA9IGlvcmVtYXAocmVkaXN0LT5iYXNlX2FkZHJlc3MsIHJlZGlzdC0+bGVuZ3RoKTsKPiAJaWYg
KCFyZWRpc3RfYmFzZSkgewo+IAkJcHJfZXJyKCJDb3VsZG4ndCBtYXAgR0lDUiByZWdpb24gQCVs
bHhcbiIsIHJlZGlzdC0+YmFzZV9hZGRyZXNzKTsKPkBAIC0yMzI1LDYgKzIzMjgsOSBAQCBnaWNf
YWNwaV9wYXJzZV9tYWR0X2dpY2ModW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIs
Cj4gCXUzMiBzaXplID0gcmVnID09IEdJQ19QSURSMl9BUkNIX0dJQ3Y0ID8gU1pfNjRLICogNCA6
IFNaXzY0SyAqIDI7Cj4gCXZvaWQgX19pb21lbSAqcmVkaXN0X2Jhc2U7Cj4gCj4rCWlmIChCQURf
TUFEVF9FTlRSWShnaWNjLCBlbmQpKQo+KwkJcmV0dXJuIC1FSU5WQUw7Cj4rCj4gCS8qIE5laXRo
ZXIgZW5hYmxlZCBvciBvbmxpbmUgY2FwYWJsZSBtZWFucyBpdCBkb2Vzbid0IGV4aXN0LCBza2lw
IGl0ICovCj4gCWlmICghKGdpY2MtPmZsYWdzICYgKEFDUElfTUFEVF9FTkFCTEVEIHwgQUNQSV9N
QURUX0dJQ0NfT05MSU5FX0NBUEFCTEUpKSkKPiAJCXJldHVybiAwOwo+QEAgLTIzOTEsNiArMjM5
Nyw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGdpY19hY3BpX21hdGNoX2dpY2ModW5pb24gYWNwaV9z
dWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsCj4gCXN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19pbnRl
cnJ1cHQgKmdpY2MgPQo+IAkJCQkoc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2ludGVycnVwdCAq
KWhlYWRlcjsKPiAKPisJaWYgKEJBRF9NQURUX0VOVFJZKGdpY2MsIGVuZCkpCj4rCQlyZXR1cm4g
LUVJTlZBTDsKPisKPiAJLyoKPiAJICogSWYgR0lDQyBpcyBlbmFibGVkIGFuZCBoYXMgdmFsaWQg
Z2ljciBiYXNlIGFkZHJlc3MsIHRoZW4gaXQgbWVhbnMKPiAJICogR0lDUiBiYXNlIGlzIHByZXNl
bnRlZCB2aWEgR0lDQy4gVGhlIHJlZGlzdHJpYnV0b3IgaXMgb25seSBrbm93biB0bwo+QEAgLTI0
MzcsNiArMjQ0Niw5IEBAIHN0YXRpYyBib29sIF9faW5pdCBhY3BpX3ZhbGlkYXRlX2dpY190YWJs
ZShzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIgKmhlYWRlciwKPiAJaW50IGNvdW50Owo+IAo+
IAlkaXN0ID0gKHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19kaXN0cmlidXRvciAqKWhlYWRlcjsK
PisJaWYgKGhlYWRlci0+bGVuZ3RoIDwgc2l6ZW9mKCpkaXN0KSkKPisJCXJldHVybiBmYWxzZTsK
PisKPiAJaWYgKGRpc3QtPnZlcnNpb24gIT0gYXBlLT5kcml2ZXJfZGF0YSkKPiAJCXJldHVybiBm
YWxzZTsKPiAKPkBAIC0yNDU3LDYgKzI0NjksOSBAQCBzdGF0aWMgaW50IF9faW5pdCBnaWNfYWNw
aV9wYXJzZV92aXJ0X21hZHRfZ2ljYyh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhlYQo+
IAlpbnQgbWFpbnRfaXJxX21vZGU7Cj4gCXN0YXRpYyBpbnQgZmlyc3RfbWFkdCA9IHRydWU7Cj4g
Cj4rCWlmIChCQURfTUFEVF9FTlRSWShnaWNjLCBlbmQpKQo+KwkJcmV0dXJuIC1FSU5WQUw7Cj4r
Cj4gCWlmICghKGdpY2MtPmZsYWdzICYKPiAJICAgICAgKEFDUElfTUFEVF9FTkFCTEVEIHwgQUNQ
SV9NQURUX0dJQ0NfT05MSU5FX0NBUEFCTEUpKSkKPiAJCXJldHVybiAwOwo+QEAgLTI1NDcsNiAr
MjU2Miw5IEBAIGdpY19hY3BpX2luaXQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFk
ZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+IAo+IAkvKiBHZXQgZGlzdHJpYnV0b3IgYmFz
ZSBhZGRyZXNzICovCj4gCWRpc3QgPSAoc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2Rpc3RyaWJ1
dG9yICopaGVhZGVyOwo+KwlpZiAoQkFEX01BRFRfRU5UUlkoZGlzdCwgZW5kKSkKPisJCXJldHVy
biAtRUlOVkFMOwo+Kwo+IAlhY3BpX2RhdGEuZGlzdF9iYXNlID0gaW9yZW1hcChkaXN0LT5iYXNl
X2FkZHJlc3MsCj4gCQkJCSAgICAgIEFDUElfR0lDVjNfRElTVF9NRU1fU0laRSk7Cj4gCWlmICgh
YWNwaV9kYXRhLmRpc3RfYmFzZSkgewo+LS0gCj4yLjM0LjEK

