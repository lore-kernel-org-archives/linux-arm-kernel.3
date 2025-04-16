Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB74C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vfyrn4sci4VZ12tMwuzEKJhCvHNChdBJTlObtHxjXM4=; b=wtrLkJzOeshkvnlXdIR2FS3Lo2
	TOTLRIV9HxnK33zYYC+DSv6/r1wBwRyNF0xQmO7wl3WG2a0xt7pgk9ktmuKL25oqc9VxdJSKYCXrq
	3R34g9GjDfMwjpVlMV/IAGs3JDQZSm6U51UQ7XnpcVo/e2NbIMqgl9B0GNtCLh9PxEAIexUQ9Mf9r
	o9PzXGjO3W9FDPCilNJQ/UAL4D0T5V6IBu4+OqQKslHrN02sZSxYpTcKaFiiozBkLKWUTVlFXeKTV
	wqJ1ItErGz6pNR+Nlq/7dwMqnu2phR4HvZ17odQ4u1JrB3/wexXtbgFgPWphh4yloNIB/gTCXirkk
	WSVBIpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u564y-0000000ALA9-2qY3;
	Wed, 16 Apr 2025 16:57:40 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55L9-0000000ACBi-1ANZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=d6PzMlsChX8XLKLTAraoErRhLqsSXDpIfKoTtzsgAxo=; b=L
	BMazJEHSsbW9G6/DUvWedBCUo2CtaamOQrINRFU1n5FMddxiofiem3MjH7DN/PSI
	0K9LAsTQpSQlO8vjgqOyJQK09g9rlfjYKw7FmNoEIoI0tQjKuUfdbijnWt+m7fAo
	G+up6ijBmGHL5Fez+VKoLRrgpFVLIztiGnjCd8s8Es=
Received: from xavier_qy$163.com ( [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 17 Apr 2025 00:09:36 +0800
 (CST)
X-Originating-IP: [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
Date: Thu, 17 Apr 2025 00:09:36 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>
Cc: dev.jain@arm.com, ioworker0@gmail.com, 21cnbao@gmail.com,
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
	ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
 <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
X-NTES-SC: AL_Qu2fBvSatk8s4CWaZekfmk4QgeY+WMW1vP4m34NSN5FwjCzp0ysiZlJTIXjNyvCDLzqKkAiHVTRiy9ZZf7hifrko7HzbN781LCzEGZh9hD9SQg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <72ff1deb.b3a7.1963f5cec0c.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD339ZA1v9nYeSXAA--.45267W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhExEGf-pJJ9EwAMs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_091019_781099_7EE97AC3 
X-CRM114-Status: GOOD (  20.40  )
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

CgpBdCAyMDI1LTA0LTE2IDIwOjU0OjQ3LCAiUnlhbiBSb2JlcnRzIiA8cnlhbi5yb2JlcnRzQGFy
bS5jb20+IHdyb3RlOgo+T24gMTUvMDQvMjAyNSAwOToyMiwgWGF2aWVyIHdyb3RlOgo+PiBUaGlz
IGNvbW1pdCBvcHRpbWl6ZXMgdGhlIGNvbnRwdGVfcHRlcF9nZXQgZnVuY3Rpb24gYnkgYWRkaW5n
IGVhcmx5Cj4+ICB0ZXJtaW5hdGlvbiBsb2dpYy4gSXQgY2hlY2tzIGlmIHRoZSBkaXJ0eSBhbmQg
eW91bmcgYml0cyBvZiBvcmlnX3B0ZQo+PiAgYXJlIGFscmVhZHkgc2V0IGFuZCBza2lwcyByZWR1
bmRhbnQgYml0LXNldHRpbmcgb3BlcmF0aW9ucyBkdXJpbmcKPj4gIHRoZSBsb29wLiBUaGlzIHJl
ZHVjZXMgdW5uZWNlc3NhcnkgaXRlcmF0aW9ucyBhbmQgaW1wcm92ZXMgcGVyZm9ybWFuY2UuCj4+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBYYXZpZXIgPHhhdmllcl9xeUAxNjMuY29tPgo+PiAtLS0KPj4g
IGFyY2gvYXJtNjQvbW0vY29udHB0ZS5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jIGIvYXJjaC9hcm02NC9tbS9jb250cHRl
LmMKPj4gaW5kZXggYmNhYzRmNTVmOWMxLi4wYWNmZWU2MDQ5NDcgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+ICsrKyBiL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+
IEBAIC0xNTIsNiArMTUyLDE2IEBAIHZvaWQgX19jb250cHRlX3RyeV91bmZvbGQoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIH0KPj4gIEVYUE9SVF9TWU1CT0xf
R1BMKF9fY29udHB0ZV90cnlfdW5mb2xkKTsKPj4gIAo+PiArLyogTm90ZTogaW4gb3JkZXIgdG8g
aW1wcm92ZSBlZmZpY2llbmN5LCB1c2luZyB0aGlzIG1hY3JvIHdpbGwgbW9kaWZ5IHRoZQo+PiAr
ICogcGFzc2VkLWluIHBhcmFtZXRlcnMuKi8KPj4gKyNkZWZpbmUgQ0hFQ0tfQ09OVFBURV9GTEFH
KHN0YXJ0LCBwdGVwLCBvcmlnX3B0ZSwgZmxhZykgXAo+PiArICAgIGZvciAoOyAoc3RhcnQpIDwg
Q09OVF9QVEVTOyAoc3RhcnQpKyssIChwdGVwKSsrKSB7IFwKPj4gKwkJaWYgKHB0ZV8jI2ZsYWco
X19wdGVwX2dldChwdGVwKSkpIHsgXAo+PiArCQkJCW9yaWdfcHRlID0gcHRlX21rIyNmbGFnKG9y
aWdfcHRlKTsgXAo+PiArCQkJCWJyZWFrOyBcCj4+ICsJCX0gXAo+PiArICAgIH0KPgo+SSdtIHJl
YWxseSBub3QgYSBmYW4gb2YgdGhpcyBtYWNybywgaXQganVzdCBvYmZ1c2NhdGVzIHdoYXQgaXMg
Z29pbmcgb24uIEknZAo+cGVyc29uYWxseSBwcmVmZXIgdG8gc2VlIHRoZSAyIGV4dHJhIGxvb3Bz
IG9wZW4gY29kZWQgYmVsb3cuCj4KPk9yIGV2ZW4gYmV0dGVyLCBjb3VsZCB5b3UgcHJvdmlkZSBy
ZXN1bHRzIGNvbXBhcmluZyB0aGlzIDMgbG9vcCB2ZXJzaW9uIHRvIHRoZQo+c2ltcGxlciBhcHBy
b2FjaCBJIHN1Z2dlc3RlZCBwcmV2aW91c2x5PyBJZiB0aGUgcGVyZm9ybWFuY2UgaXMgc2ltaWxh
ciAod2hpY2ggSQo+ZXhwZWN0IGl0IHdpbGwgYmUsIGVzcGVjaWFsbHkgZ2l2ZW4gQmFycnkncyBw
b2ludCB0aGF0IHlvdXIgdGVzdCBhbHdheXMgZW5zdXJlcwo+dGhlIGZpcnN0IFBURSBpcyBib3Ro
IHlvdW5nIGFuZCBkaXJ0eSkgdGhlbiBJJ2QgcHJlZmVyIHRvIGdvIHdpdGggdGhlIHNpbXBsZXIg
Y29kZS4KCkkgd2lsbCB0ZXN0IHRoZSBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlcyBhbW9uZyB0aGVz
ZSBzZXZlcmFsIGltcGxlbWVudGF0aW9ucy4KSWYgdGhlIGRpZmZlcmVuY2VzIGFyZSBub3Qgc2ln
bmlmaWNhbnQsIEkgd2lsbCB0cnkgdG8gaW1wbGVtZW50IGl0IHdpdGggdGhlIHNpbXBsZXIgbWV0
aG9kLgoKQXQgdGhlIHNhbWUgdGltZSwgYWNjb3JkaW5nIHRvIEJhcnJ5J3Mgc3VnZ2VzdGlvbiwg
SSB3aWxsIGFkZCBzb21lIG1vcmUgZ2VuZXJhbAp0ZXN0IGNhc2VzIHRvIHZlcmlmeSB3aGV0aGVy
IHRoZSBvcHRpbWl6YXRpb24gaXMgZWZmZWN0aXZlLgoKU2luY2UgSSdtIGEgYml0IGJ1c3kgcmVj
ZW50bHksIGl0IG1heSB0YWtlIG1lIGEgZmV3IGRheXMgdG8gY29tcGxldGUgdGhpcyB0YXNrLgoK
Pj4gKwo+PiAgcHRlX3QgY29udHB0ZV9wdGVwX2dldChwdGVfdCAqcHRlcCwgcHRlX3Qgb3JpZ19w
dGUpCj4+ICB7Cj4+ICAJLyoKPj4gQEAgLTE2OSwxMSArMTc5LDE3IEBAIHB0ZV90IGNvbnRwdGVf
cHRlcF9nZXQocHRlX3QgKnB0ZXAsIHB0ZV90IG9yaWdfcHRlKQo+PiAgCWZvciAoaSA9IDA7IGkg
PCBDT05UX1BURVM7IGkrKywgcHRlcCsrKSB7Cj4+ICAJCXB0ZSA9IF9fcHRlcF9nZXQocHRlcCk7
Cj4+ICAKPj4gLQkJaWYgKHB0ZV9kaXJ0eShwdGUpKQo+PiArCQlpZiAocHRlX2RpcnR5KHB0ZSkp
IHsKPj4gIAkJCW9yaWdfcHRlID0gcHRlX21rZGlydHkob3JpZ19wdGUpOwo+PiArCQkJQ0hFQ0tf
Q09OVFBURV9GTEFHKGksIHB0ZXAsIG9yaWdfcHRlLCB5b3VuZyk7Cj4+ICsJCQlicmVhazsKPj4g
KwkJfQo+PiAgCj4+IC0JCWlmIChwdGVfeW91bmcocHRlKSkKPj4gKwkJaWYgKHB0ZV95b3VuZyhw
dGUpKSB7Cj4+ICAJCQlvcmlnX3B0ZSA9IHB0ZV9ta3lvdW5nKG9yaWdfcHRlKTsKPj4gKwkJCUNI
RUNLX0NPTlRQVEVfRkxBRyhpLCBwdGVwLCBvcmlnX3B0ZSwgZGlydHkpOwo+PiArCQkJYnJlYWs7
Cj4+ICsJCX0KPj4gIAl9Cj4+ICAKPj4gIAlyZXR1cm4gb3JpZ19wdGU7Cj4KPklmIHdlIGRlY2lk
ZSB0aGlzIGlzIGFsbCB3b3J0aCB0aGUgdHJvdWJsZSwgdGhlbiBJIHRoaW5rIHdlIGNhbiAoYW5k
ICpzaG91bGQqLAo+aW4gb3JkZXIgdG8gYmUgY29uc2lzdGVudCkgcHVsbCBhIHNpbWlsYXIgc3R1
bnQgaW4gY29udHB0ZV9wdGVwX2dldF9sb2NrbGVzcygpLgoKT0suIFRoaXMgZnVuY3Rpb24gc2Vl
bXMgdG8gYmUgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gSSdsbCBnaXZlIGl0IGEgdHJ5IHRvCmZp
Z3VyZSBvdXQgaG93IHRvIG9wdGltaXplIGl0LgoKLS0KVGhhbmtzLApYYXZpZXIKCg==

