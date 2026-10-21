Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04313606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWb6UBTF;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=in3fDV9u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiVykom2YjTuvPe8VeWLYn7RNEDdL2oqs8qk9+I+zJU=; b=sWb6UBTFkFL3qjfcqBtyJoiyZC
	qPeUdAkrE3x1t3jKzlW6T4U4blBFVrBL9Ux0K2kIPa3r0cIHU30Pu/cVZswtRUG9HsDOXp2YbSQN7
	fyvQUUobdGSTRRMWp7On3HaaJPwI0elojriO2zhHtO3WavTwK34Fn9JZCN6u2i7Clyt2ik0tr/5oL
	tMxdcGqWAMQgx3rJ7vxeT2gJkez5+4krnSYT67BfXSCQh/vOoVjdgbz7kH8E1BwGJT2pZs1cUePx5
	Yazx3G/Z+f3hVntXe6GZYbIPz3UsuiPToc3LuSb8xfgIbtB9i7lks2RR9UkC3sSnE+NI/4tm0H2CV
	vVviWhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXbo-0000000C8oE-1hyc;
	Wed, 21 Oct 2026 14:48:04 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXbl-0000000C8n8-3BHK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=xiVykom2YjTuvPe8VeWLYn7RNEDdL2oqs8qk9+I+zJU=; b=i
	n3fDV9uKcWEuedSShdIoSxS6BQifOHQgblxMT7y95XO050PPFbyDqcqcClEvHMSn
	enR99eXoJuwPMCvt3aj5pImNPGpoML/NUnOfMoRcfUupTEeo1jO4gpM7J+dwcBjj
	WUpDy5yERvoNdnJEAU9QY7YncH0KfDOx5hDAptkMHE=
Date: Wed, 21 Oct 2026 22:47:48 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 3/6] irqchip/gic-v3: validate MADT records before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <868q3x1zlp.wl-maz@kernel.org>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-4-yaojiale02@163.com>
 <868q3x1zlp.wl-maz@kernel.org>
X-NTES-SC: AL_Qu2SAPmSu0gt7iGaY+kcn08ShO49XMOyvfoi2YFTc+AEnyzt4CYNekNFJlbR4NixDT6PtCCIYido2OlHUoR6oAStpJgTyQt97YFeUPDbgw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <4134d280.9c43.1a15eeec2a6.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgD334eV0Nhq9YZdAA--.865W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhUqZGrY0JVd3gAA3h
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_074802_213883_00B134FA 
X-CRM114-Status: GOOD (  15.21  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyYywKCkF0IDIwMjYtMTAtMTYgMjI6MzY6NTAsICJNYXJjIFp5bmdpZXIiIDxtYXpAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj5PbiBGcmksIDE2IE9jdCAyMDI2IDE1OjEzOjU0ICswMTAwLAo+Smlh
bGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+IHdyb3RlOgo+PiAKPj4gVGhlIEdJQ3YzIEFDUEkg
cGF0aHMgY2FzdCBnZW5lcmljIE1BRFQgaGVhZGVycyB0byBkaXN0cmlidXRvciwKPj4gcmVkaXN0
cmlidXRvciwgYW5kIENQVSBpbnRlcmZhY2UgcmVjb3JkcyBiZWZvcmUgY29uZmlybWluZyB0aGF0
IHRoZQo+PiBjb3JyZXNwb25kaW5nIGZpeGVkLXNpemUgc3RydWN0dXJlcyBhcmUgcHJlc2VudC4g
VHJ1bmNhdGVkIHJlY29yZHMgY2FuCj4+IHRoZXJlZm9yZSBjYXVzZSBvdXQtb2YtYm91bmRzIGZp
ZWxkIHJlYWRzIHdoaWxlIHByb2Jpbmcgb3Igc2V0dGluZyB1cAo+PiB2aXJ0dWFsaXphdGlvbiBk
YXRhLgo+Pgo+PiBDaGVjayBlYWNoIHR5cGVkIE1BRFQgcmVjb3JkIGJlZm9yZSBpdHMgZmlyc3Qg
ZmllbGQgYWNjZXNzLiBBbHNvIHJlamVjdAo+PiBhIHNob3J0IGRpc3RyaWJ1dG9yIHJlY29yZCBp
biB0aGUgdmVyc2lvbiB2YWxpZGF0b3IsIHdoaWNoIHJ1bnMgYmVmb3JlCj4+IHRoZSBwcm9iZSBj
YWxsYmFjay4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMu
Y29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMgfCAxOCArKysrKysr
KysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4+IAo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtZ2ljLXYzLmMKPj4gaW5kZXggNmUxZmE1YjI0N2ZjLi4wNTg4ZDZkODNiMzEgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMKPj4gKysrIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1naWMtdjMuYwo+PiBAQCAtMjI5OSw2ICsyMjk5LDkgQEAgZ2ljX2FjcGlfcGFy
c2VfbWFkdF9yZWRpc3QodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsCj4+ICAJ
CQkoc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX3JlZGlzdHJpYnV0b3IgKiloZWFkZXI7Cj4+ICAJ
dm9pZCBfX2lvbWVtICpyZWRpc3RfYmFzZTsKPj4gIAo+PiArCWlmIChCQURfTUFEVF9FTlRSWShy
ZWRpc3QsIGVuZCkpCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICAJcmVkaXN0X2Jhc2Ug
PSBpb3JlbWFwKHJlZGlzdC0+YmFzZV9hZGRyZXNzLCByZWRpc3QtPmxlbmd0aCk7Cj4+ICAJaWYg
KCFyZWRpc3RfYmFzZSkgewo+PiAgCQlwcl9lcnIoIkNvdWxkbid0IG1hcCBHSUNSIHJlZ2lvbiBA
JWxseFxuIiwgcmVkaXN0LT5iYXNlX2FkZHJlc3MpOwo+PiBAQCAtMjMyNSw2ICsyMzI4LDkgQEAg
Z2ljX2FjcGlfcGFyc2VfbWFkdF9naWNjKHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVh
ZGVyLAo+PiAgCXUzMiBzaXplID0gcmVnID09IEdJQ19QSURSMl9BUkNIX0dJQ3Y0ID8gU1pfNjRL
ICogNCA6IFNaXzY0SyAqIDI7Cj4+ICAJdm9pZCBfX2lvbWVtICpyZWRpc3RfYmFzZTsKPj4gIAo+
PiArCWlmIChCQURfTUFEVF9FTlRSWShnaWNjLCBlbmQpKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsK
Pj4gKwo+PiAgCS8qIE5laXRoZXIgZW5hYmxlZCBvciBvbmxpbmUgY2FwYWJsZSBtZWFucyBpdCBk
b2Vzbid0IGV4aXN0LCBza2lwIGl0ICovCj4+ICAJaWYgKCEoZ2ljYy0+ZmxhZ3MgJiAoQUNQSV9N
QURUX0VOQUJMRUQgfCBBQ1BJX01BRFRfR0lDQ19PTkxJTkVfQ0FQQUJMRSkpKQo+PiAgCQlyZXR1
cm4gMDsKPj4gQEAgLTIzOTEsNiArMjM5Nyw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGdpY19hY3Bp
X21hdGNoX2dpY2ModW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsCj4+ICAJc3Ry
dWN0IGFjcGlfbWFkdF9nZW5lcmljX2ludGVycnVwdCAqZ2ljYyA9Cj4+ICAJCQkJKHN0cnVjdCBh
Y3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1cHQgKiloZWFkZXI7Cj4+ICAKPj4gKwlpZiAoQkFEX01B
RFRfRU5UUlkoZ2ljYywgZW5kKSkKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gIAkvKgo+
PiAgCSAqIElmIEdJQ0MgaXMgZW5hYmxlZCBhbmQgaGFzIHZhbGlkIGdpY3IgYmFzZSBhZGRyZXNz
LCB0aGVuIGl0IG1lYW5zCj4+ICAJICogR0lDUiBiYXNlIGlzIHByZXNlbnRlZCB2aWEgR0lDQy4g
VGhlIHJlZGlzdHJpYnV0b3IgaXMgb25seSBrbm93biB0bwo+PiBAQCAtMjQzNyw2ICsyNDQ2LDkg
QEAgc3RhdGljIGJvb2wgX19pbml0IGFjcGlfdmFsaWRhdGVfZ2ljX3RhYmxlKHN0cnVjdCBhY3Bp
X3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLAo+PiAgCWludCBjb3VudDsKPj4gIAo+PiAgCWRpc3Qg
PSAoc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2Rpc3RyaWJ1dG9yICopaGVhZGVyOwo+PiArCWlm
IChoZWFkZXItPmxlbmd0aCA8IHNpemVvZigqZGlzdCkpCj4+ICsJCXJldHVybiBmYWxzZTsKPj4g
Kwo+Cj5XaHkgaXMgdGhpcyBvcGVuLWNvZGVkIGluc3RlYWQgb2YgdXNpbmcgdGhlIGNoZWNraW5n
IG1hY3JvPwo+Cj4+ICAJaWYgKGRpc3QtPnZlcnNpb24gIT0gYXBlLT5kcml2ZXJfZGF0YSkKPj4g
IAkJcmV0dXJuIGZhbHNlOwo+PiAgCj4+IEBAIC0yNDU3LDYgKzI0NjksOSBAQCBzdGF0aWMgaW50
IF9faW5pdCBnaWNfYWNwaV9wYXJzZV92aXJ0X21hZHRfZ2ljYyh1bmlvbiBhY3BpX3N1YnRhYmxl
X2hlYWRlcnMgKmhlYQo+PiAgCWludCBtYWludF9pcnFfbW9kZTsKPj4gIAlzdGF0aWMgaW50IGZp
cnN0X21hZHQgPSB0cnVlOwo+PiAgCj4+ICsJaWYgKEJBRF9NQURUX0VOVFJZKGdpY2MsIGVuZCkp
Cj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4KPldoeSBpc24ndCB0aGlzIHVzaW5nIEJBRF9N
QURUX0dJQ0NfRU5UUlkoKT8KPgo+PiAgCWlmICghKGdpY2MtPmZsYWdzICYKPj4gIAkgICAgICAo
QUNQSV9NQURUX0VOQUJMRUQgfCBBQ1BJX01BRFRfR0lDQ19PTkxJTkVfQ0FQQUJMRSkpKQo+PiAg
CQlyZXR1cm4gMDsKPj4gQEAgLTI1NDcsNiArMjU2Miw5IEBAIGdpY19hY3BpX2luaXQodW5pb24g
YWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+
PiAgCj4+ICAJLyogR2V0IGRpc3RyaWJ1dG9yIGJhc2UgYWRkcmVzcyAqLwo+PiAgCWRpc3QgPSAo
c3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2Rpc3RyaWJ1dG9yICopaGVhZGVyOwo+PiArCWlmIChC
QURfTUFEVF9FTlRSWShkaXN0LCBlbmQpKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+Cj5X
aHkgZG9lcyB0aGlzIG5lZWQgdG8gYmUgcmUtY2hlY2tlZCBpZiB0aGUgdmFsaWRhdGlvbiBwaGFz
ZWQgaGFzIHN1Y2NlZWRlZD8KPgo+PiAgCWFjcGlfZGF0YS5kaXN0X2Jhc2UgPSBpb3JlbWFwKGRp
c3QtPmJhc2VfYWRkcmVzcywKPj4gIAkJCQkgICAgICBBQ1BJX0dJQ1YzX0RJU1RfTUVNX1NJWkUp
Owo+PiAgCWlmICghYWNwaV9kYXRhLmRpc3RfYmFzZSkgewo+Cj5UaGFua3MsCj4KPglNLgo+CgpJ
IGhhdmUgdXBkYXRlZCBpdCBpbiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjEx
NDQ1MjQuMzY0MTQzLTEteWFvamlhbGUwMkAxNjMuY29tLwoKPi0tIAo+V2l0aG91dCBkZXZpYXRp
b24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLgo=

